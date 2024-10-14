-- Crear una tabla temporal para almacenar los valores variables (cantidad de días y parte de la URL)
CREATE TEMP TABLE temp_smec_sources (
    days_interval text,
    url_part text,
    id_value text
);

-- Insertar los valores correspondientes a la cantidad de días y parte de la URL
INSERT INTO temp_smec_sources (days_interval, url_part, id_value)
VALUES
('1 days', 'ARBEM21P', 'ARBEM21P'),
('2 days', 'ARBEM21P', 'ARBEM21P'),
('3 days', 'ARBEM21P', 'ARBEM21P'),
('4 days', 'ARBEM21P', 'ARBEM21P'),
('5 days', 'ARBEM21P', 'ARBEM21P'),
('6 days', 'ARBEM21P', 'ARBEM21P'),
('7 days', 'ARBEM21P', 'ARBEM21P');
DO $$
DECLARE
    rec RECORD;
    startdate text;
BEGIN
    -- Iterar sobre cada registro de la tabla temporal
    FOR rec IN SELECT * FROM temp_smec_sources LOOP
        -- Calcular la fecha startdate en función de los días del intervalo
        startdate := to_char(current_date - rec.days_interval::interval, 'YYYYMMDD');

        -- Eliminar la tabla temporal si existe
        DROP TABLE IF EXISTS tmp_smec_arb;

        -- Crear la tabla temporal tmp_smec_arb
        CREATE TEMP TABLE tmp_smec_arb ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text);

        -- Descargar y copiar los datos desde el archivo CSVEXECUTE format(
		EXECUTE format(
			'COPY tmp_smec_arb (hour, "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", a, b, c, d) 
			FROM %L DELIMITER '','' CSV HEADER',
			'C:/Users/Administrador/GoesGreen SRL/I4 - AUTOPRN/Arrebeef/' || rec.url_part || '_' || startdate || '.csv'
		);

        -- Eliminar las columnas innecesarias
        ALTER TABLE tmp_smec_arb DROP COLUMN a,DROP COLUMN b,DROP COLUMN c, DROP COLUMN d;

        -- Actualizar la columna id con el valor correspondiente
        EXECUTE format('UPDATE tmp_smec_arb SET id = %L', rec.id_value);

        -- Actualizar la columna date y hour
        UPDATE tmp_smec_arb 
        SET date = date_part.date2 
        FROM (SELECT split_part(hour, ' ', 2) AS date2 FROM tmp_smec_arb WHERE hour LIKE '%/%' LIMIT 1) AS date_part;

        UPDATE tmp_smec_arb 
        SET hour = hour_part.hour2 
        FROM (SELECT split_part(hour, ' ', 3) AS hour2, hour FROM tmp_smec_arb WHERE hour LIKE '%/%') AS hour_part 
        WHERE tmp_smec_arb.hour = hour_part.hour;

        -- Ajustar la hora para el valor '24:00'
        UPDATE tmp_smec_arb SET hour = '00:00' WHERE hour LIKE '24%';

        -- Concatenar la fecha y la hora en la columna "Date Hour"
        UPDATE tmp_smec_arb 
        SET "Date Hour" = date_hour.concat 
        FROM (SELECT CONCAT(date, ' ', hour) AS concat, hour FROM tmp_smec_arb) AS date_hour 
        WHERE tmp_smec_arb.hour = date_hour.hour;

        -- Cambiar el tipo de la columna "Date Hour" a timestamptz
        ALTER TABLE tmp_smec_arb 
        ALTER COLUMN "Date Hour" TYPE timestamptz 
        USING to_timestamp("Date Hour", 'MM/DD/YY HH24:MI');

        -- Ajustar las filas con la hora "00:00:00"
        UPDATE tmp_smec_arb 
        SET "Date Hour" = date_hour."Date Hour2" 
        FROM (SELECT ("Date Hour" + interval '1 day') AS "Date Hour2" FROM tmp_smec_arb WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour 
        WHERE tmp_smec_arb."Date Hour"::text LIKE '% 00:00:00%';

        -- Insertar los datos en la tabla final
        INSERT INTO smec.arb 
        SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id 
        FROM tmp_smec_arb 
        ON CONFLICT DO NOTHING;
    END LOOP;
END $$;

-- Eliminar la tabla temporal después de su uso
DROP TABLE IF EXISTS temp_smec_sources;
INSERT INTO smec.arb_columnas (
	SELECT "Date Hour" FROM smec.arb WHERE ("Date Hour") NOT IN (
		SELECT date
		FROM smec.arb_columnas
		)
	) ON CONFLICT DO NOTHING;

---------------------------------------------------------------------
-- Actualiza la columna importada_ARBEM21P con los valores de "SMEC IMPORTADA" desde smec.arb
UPDATE smec.arb_columnas
SET importada_ARBEM21P = arb1."SMEC IMPORTADA"
FROM (
    SELECT "Date Hour" AS date2, "SMEC IMPORTADA"
    FROM smec.arb
    WHERE id = 'ARBEM21P'
) AS arb1
WHERE arb1.date2 = smec.arb_columnas.date
AND smec.arb_columnas.importada_ARBEM21P IS NULL;

-- Actualiza la columna exportada_ARBEM21P con los valores de "SMEC EXPORTADA"
UPDATE smec.arb_columnas
SET exportada_ARBEM21P = arb1."SMEC EXPORTADA"
FROM (
    SELECT "Date Hour" AS date2, "SMEC EXPORTADA"
    FROM smec.arb
    WHERE id = 'ARBEM21P'
) AS arb1
WHERE arb1.date2 = smec.arb_columnas.date  
AND smec.arb_columnas.exportada_ARBEM21P IS NULL;

---------------------------------------------------------------------------------------
-- Elimina todos los registros de la tabla smec.arb_comparacion_smec_po
DELETE FROM smec.arb_comparacion_smec_po;

-- Inserta datos en smec.arb_comparacion_smec_po comparando smec.po_general_renovables y smec.arb_columnas
INSERT INTO smec.arb_comparacion_smec_po(grupo, date, po_exportada, smec_exportada, diferencia)
SELECT 
    smec.po_general_renovables.grupo,
    smec.po_general_renovables.date_hour - interval '1 hour' AS date,
    egenerada AS po_exportada,                                       
	exportada::numeric(10, 3) AS smec_exportada,                     
    (
        (abs((egenerada) - (a.exportada::numeric(10, 3))) /          
        (COALESCE(NULLIF(((egenerada) + (a.exportada::numeric(10, 3))) / 2, 0), 1))) * 100
    )::NUMERIC(10, 3) AS diferencia                                  
FROM smec.po_general_renovables
LEFT JOIN (
    -- Agrupa los datos de smec.arb_columnas por hora truncada, sumando los valores exportados
    SELECT 
        DATE_TRUNC('hour', date - interval '15 minutes') AS date1,    
        (sum(exportada_ARBEM21P)/1000)::numeric(10,3) AS exportada   
    FROM smec.arb_columnas
    WHERE date >= DATE_TRUNC('day', now()) - interval '4 years'       
    AND date <= DATE_TRUNC('day', now()) + interval '23 hours' - interval '1 days'  
    GROUP BY date1                                                   
) AS a 
ON smec.po_general_renovables.date_hour - interval '1 hour' = a.date1 
WHERE date_hour >= DATE_TRUNC('day', now()) - interval '4 years'      
AND date_hour <= DATE_TRUNC('day', now()) + interval '23 hours' - interval '1 days' 
AND grupo = 'ABEFDI01'                                                
ORDER BY grupo, date_hour                                             
ON CONFLICT DO NOTHING;                                               
--------------------------------------------------------------------------------------------------------
-- Elimina todos los registros de la tabla smec.arb_comparacion_smec_po_importada
DELETE FROM smec.arb_comparacion_smec_po_importada;

-- Inserta nuevos datos de importación entre po_general_renovables y arb_columnas
INSERT INTO smec.arb_comparacion_smec_po_importada(grupo, date, po_importada, smec_importada, diferencia)
SELECT 
    smec.po_general_renovables.grupo,                               
    smec.po_general_renovables.date_hour - interval '1 hour' AS date,
    compra_spot AS po_importada,                                     
    importada::numeric(10, 3) AS smec_importada,                     
    (
        (abs((compra_spot) - (a.importada::numeric(10,3))) /         
        (COALESCE(NULLIF(((compra_spot) + (a.importada::numeric(10,3))) / 2, 0), 1))) * 100
    )::NUMERIC(10, 3) AS diferencia                                  
FROM smec.po_general_renovables
LEFT JOIN (
    -- Agrupa los datos de importación desde 'smec.arb_columnas' sumando por hora truncada
    SELECT 
        DATE_TRUNC('hour', date - interval '15 minutes') AS date1,   
        (sum(importada_ARBEM21P)/1000)::numeric(10,3) AS importada   
    FROM smec.arb_columnas
    WHERE date >= DATE_TRUNC('day', now()) - interval '4 years'       
    AND date <= DATE_TRUNC('day', now()) + interval '23 hours' - interval '1 days' 
    GROUP BY date1                                                    
) AS a 
ON smec.po_general_renovables.date_hour - interval '1 hour' = a.date1 
WHERE date_hour >= DATE_TRUNC('day', now()) - interval '4 years'      
AND date_hour <= DATE_TRUNC('day', now()) + interval '23 hours' - interval '1 days' 
AND grupo = 'ABEFDI01'                                                
ORDER BY grupo, date_hour                                              
ON CONFLICT DO NOTHING;                                                

----------------------------------------------CONSOLIDADOR----------------------------------------------

-- Elimina registros de la tabla smec.consolidador_arb con fecha dentro de los últimos 20 días
DELETE FROM smec.consolidador_arb WHERE date >= (now() - interval '20 days');

-- Crea una tabla temporal 'consolidador_arb_temp' para consolidar los datos de exportación
DROP TABLE IF EXISTS consolidador_arb_temp;
CREATE TEMP TABLE consolidador_arb_temp (
    date timestamptz, 
    arb text, 
    exportada_cammesa numeric
);

-- Inserta datos en la tabla temporal consolidador_arb_temp con la exportación de arb_columnas de los últimos 20 días
INSERT INTO consolidador_arb_temp(date, exportada_cammesa)
SELECT 
    DATE_TRUNC('hour', date - interval '15 minutes') AS date2,        
    SUM(exportada_ARBEM21P)                                           
FROM smec.arb_columnas
WHERE date >= (now() - interval '20 days')                            
GROUP BY date2                                                        
ORDER BY date2;

-- Actualiza la columna arb en la tabla temporal
UPDATE consolidador_arb_temp SET arb = 'ABEFDI01';

-- Inserta los datos desde la tabla temporal a smec.consolidador_arb, evitando duplicados
INSERT INTO smec.consolidador_arb 
SELECT * FROM consolidador_arb_temp 
ON CONFLICT DO NOTHING;

-- Inserta horas faltantes en smec.consolidador_arb desde una serie generada de horas
INSERT INTO smec.consolidador_arb (arb, date)
SELECT * 
FROM smec.arb_ids 
CROSS JOIN generate_series(DATE_TRUNC('hour', now() - interval '21 day'), DATE_TRUNC('hour', now()), '1 hour')
ON CONFLICT DO NOTHING;

-------------------------------------------------------------------------------------------------------------

-- Actualiza los valores de exportada_cammesa dividiendo entre 1000 para los últimos 20 días
UPDATE smec.consolidador_arb 
SET exportada_cammesa = exportada_cammesa/1000 
WHERE date >= (now() - interval '20 days');

-- Actualiza po_exportada en consolidador_arb con datos de po_general_renovables de los últimos 20 días
UPDATE smec.consolidador_arb 
SET po_exportada = s.a
FROM (
    SELECT date_hour - interval '1 hour' AS date, grupo AS id, egenerada AS a
    FROM smec.po_general_renovables
    WHERE grupo LIKE 'ABEFDI01'
) AS s
WHERE consolidador_arb.date = s.date
AND consolidador_arb.arb = s.id
AND consolidador_arb.date >= (now() - interval '20 days');

-------------------------------------------------------------------------------------------------------------

-- Actualiza los valores de cammesa_ppa en consolidador_arb donde exportada_cammesa
UPDATE smec.consolidador_arb 
SET cammesa_ppa = s.a
FROM (
    SELECT exportada_cammesa AS a, date, arb
    FROM smec.consolidador_arb
    WHERE exportada_cammesa <= 1.5
) AS s
WHERE s.date = consolidador_arb.date
AND s.arb = consolidador_arb.arb
AND consolidador_arb.date >= (now() - interval '20 days');

-- Ajusta los valores de cammesa_spot para los últimos 20 días
UPDATE smec.consolidador_arb 
SET cammesa_spot = exportada_cammesa - 1.5 
WHERE date >= (now() - interval '20 days');

-- Establece cammesa_spot a 0 si es <= 0 para los últimos 20 días
UPDATE smec.consolidador_arb 
SET cammesa_spot = 0 
WHERE cammesa_spot <= 0 
AND date >= (now() - interval '20 days');

-- Actualiza cammesa_ppa a 1.5 cuando exportada_cammesa es >= 1.5 para los últimos 20 días
UPDATE smec.consolidador_arb 
SET cammesa_ppa = 1.5 
WHERE exportada_cammesa >= 1.5 
AND date >= (now() - interval '20 days');

-- Actualiza los valores de po_ppa en consolidador_arb donde po_exportada es <= 1.5
UPDATE smec.consolidador_arb 
SET po_ppa = s.a
FROM (
    SELECT po_exportada AS a, date, arb
    FROM smec.consolidador_arb
    WHERE po_exportada <= 1.5
) AS s
WHERE s.date = consolidador_arb.date
AND s.arb = consolidador_arb.arb
AND consolidador_arb.date >= (now() - interval '20 days');

-- Ajusta los valores de po_spot para los últimos 20 días
UPDATE smec.consolidador_arb 
SET po_spot = po_exportada - 1.5 
WHERE date >= (now() - interval '20 days');

-- Establece po_spot a 0 si es <= 0 para los últimos 20 días
UPDATE smec.consolidador_arb 
SET po_spot = 0 
WHERE po_spot <= 0 
AND date >= (now() - interval '20 days');

-- Actualiza po_ppa a 1.5 cuando po_exportada es >= 1.5 para los últimos 20 días
UPDATE smec.consolidador_arb 
SET po_ppa = 1.5 
WHERE po_exportada >= 1.5 
AND date >= (now() - interval '20 days');

----------- PRN FALTANTE FIX --------

-- Establece exportada_cammesa igual a po_exportada para una fecha puntual cuando exportada_cammesa es NULL
UPDATE smec.consolidador_arb 
SET exportada_cammesa = po_exportada 
WHERE date >= '2024-05-09 00:00:00-03' 
AND date <= '2024-05-09 23:00:00-03' 
AND exportada_cammesa IS NULL;

------------------------------------

-- Añade nuevas columnas dolar_habil y ahorrado_dolar en la tabla arrebeef.decomiso
ALTER TABLE arrebeef.decomiso 
ADD COLUMN dolar_habil numeric, 
ADD COLUMN ahorrado_dolar numeric;

-- Actualiza dolar_habil en arrebeef.decomiso con los valores de venta desde smec.dolar_habil
UPDATE arrebeef.decomiso 
SET dolar_habil = venta 
FROM smec.dolar_habil 
WHERE dolar_habil.periodo = decomiso."Fecha";

-- Si 'dolar_habil' es NULL, se actualiza con el valor más reciente de 'venta'
UPDATE arrebeef.decomiso 
SET dolar_habil = s.a 
FROM (
    SELECT venta AS a, periodo 
    FROM smec.dolar_habil 
    ORDER BY periodo DESC 
    LIMIT 1
) AS s 
WHERE dolar_habil IS NULL;

-- Calcula el valor de 'ahorrado_dolar' dividiendo la columna "$ ahorrada" entre 'dolar_habil'
UPDATE arrebeef.decomiso 
SET ahorrado_dolar = "$ ahorrada" / dolar_habil;

-- Actualiza la columna 'dolar_habil' en 'smec.consolidador_arb' con los valores de 'venta' desde 'smec.dolar_habil'
UPDATE smec.consolidador_arb 
SET dolar_habil = dolar_habil.venta 
FROM smec.dolar_habil 
WHERE date_trunc('month', consolidador_arb.date::date) = dolar_habil.periodo;

-- Si 'dolar_habil' es NULL, se actualiza con el valor más reciente de 'venta'
UPDATE smec.consolidador_arb 
SET dolar_habil = s.a 
FROM (
    SELECT venta AS a, periodo 
    FROM smec.dolar_habil 
    ORDER BY periodo DESC 
    LIMIT 1
) AS s 
WHERE dolar_habil IS NULL;

-- Establece 'exportada_cammesa_dolar' a 0
UPDATE smec.consolidador_arb 
SET exportada_cammesa_dolar = 0;

-- Calcula el valor de 'exportada_cammesa_dolar' dividiendo 'exportada_cammesa' entre 'dolar_habil'
UPDATE smec.consolidador_arb 
SET exportada_cammesa_dolar = exportada_cammesa / dolar_habil;
