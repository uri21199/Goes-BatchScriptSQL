-- Crear una tabla temporal para almacenar los valores variables (cantidad de días y parte de la URL)
CREATE TEMP TABLE temp_smec_sources (
    days_interval text,
    url_part text,
    id_value text
);

-- Insertar los valores correspondientes a la cantidad de días y parte de la URL
INSERT INTO temp_smec_sources (days_interval, url_part, id_value)
VALUES
('1 days', 'CAF1M71C', 'CAF1M71C'),
('1 days', 'CAF1M71P', 'CAF1M71P'),
('2 days', 'CAF1M71C', 'CAF1M71C'),
('2 days', 'CAF1M71P', 'CAF1M71P'),
('3 days', 'CAF1M71C', 'CAF1M71C'),
('3 days', 'CAF1M71P', 'CAF1M71P'),
('4 days', 'CAF1M71C', 'CAF1M71C'),
('4 days', 'CAF1M71P', 'CAF1M71P'),
('5 days', 'CAF1M71P', 'CAF1M71P'),
('6 days', 'CAF1M71P', 'CAF1M71P'),
('7 days', 'CAF1M71P', 'CAF1M71P');
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
        DROP TABLE IF EXISTS tmp_smec_caf;

        -- Crear la tabla temporal tmp_smec_caf
        CREATE TEMP TABLE tmp_smec_caf ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text);

        -- Descargar y copiar los datos desde el archivo CSVEXECUTE format(
		EXECUTE format(
			'COPY tmp_smec_caf (hour, "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", a, b, c, d) 
			FROM %L DELIMITER '','' CSV HEADER',
			'C:/Users/Administrador/GoesGreen SRL/I4 - AUTOPRN/cafayate/' || rec.url_part || '_' || startdate || '.csv'
		);

        -- Eliminar las columnas innecesarias
        ALTER TABLE tmp_smec_caf DROP COLUMN a,DROP COLUMN b,DROP COLUMN c, DROP COLUMN d;

        -- Actualizar la columna id con el valor correspondiente
        EXECUTE format('UPDATE tmp_smec_caf SET id = %L', rec.id_value);

        -- Actualizar la columna date y hour
        UPDATE tmp_smec_caf 
        SET date = date_part.date2 
        FROM (SELECT split_part(hour, ' ', 2) AS date2 FROM tmp_smec_caf WHERE hour LIKE '%/%' LIMIT 1) AS date_part;

        UPDATE tmp_smec_caf 
        SET hour = hour_part.hour2 
        FROM (SELECT split_part(hour, ' ', 3) AS hour2, hour FROM tmp_smec_caf WHERE hour LIKE '%/%') AS hour_part 
        WHERE tmp_smec_caf.hour = hour_part.hour;

        -- Ajustar la hora para el valor '24:00'
        UPDATE tmp_smec_caf SET hour = '00:00' WHERE hour LIKE '24%';

        -- Concatenar la fecha y la hora en la columna "Date Hour"
        UPDATE tmp_smec_caf 
        SET "Date Hour" = date_hour.concat 
        FROM (SELECT CONCAT(date, ' ', hour) AS concat, hour FROM tmp_smec_caf) AS date_hour 
        WHERE tmp_smec_caf.hour = date_hour.hour;

        -- Cambiar el tipo de la columna "Date Hour" a timestamptz
        ALTER TABLE tmp_smec_caf 
        ALTER COLUMN "Date Hour" TYPE timestamptz 
        USING to_timestamp("Date Hour", 'MM/DD/YY HH24:MI');

        -- Ajustar las filas con la hora "00:00:00"
        UPDATE tmp_smec_caf 
        SET "Date Hour" = date_hour."Date Hour2" 
        FROM (SELECT ("Date Hour" + interval '1 day') AS "Date Hour2" FROM tmp_smec_caf WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour 
        WHERE tmp_smec_caf."Date Hour"::text LIKE '% 00:00:00%';

        -- Insertar los datos en la tabla final
        INSERT INTO smec.caf 
        SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id 
        FROM tmp_smec_caf 
        ON CONFLICT DO NOTHING;
    END LOOP;
END $$;

-- Eliminar la tabla temporal después de su uso
DROP TABLE IF EXISTS temp_smec_sources;
INSERT INTO smec.cafayate_columnas (
	SELECT "Date Hour" FROM smec.caf WHERE ("Date Hour") NOT IN (
		SELECT date
		FROM smec.cafayate_columnas
		)
	) ON CONFLICT DO NOTHING;


---------------------------------------------------------------------
-- Actualiza importada_caf1m71p en smec.cafayate_columnas con los valores de "SMEC IMPORTADA"
UPDATE smec.cafayate_columnas
SET importada_caf1m71p = cafayate1."SMEC IMPORTADA"
FROM (
    SELECT "Date Hour" AS date2, "SMEC IMPORTADA"
    FROM smec.caf
    WHERE id = 'CAF1M71P'
) AS cafayate1
WHERE cafayate1.date2 = smec.cafayate_columnas.date  
AND smec.cafayate_columnas.importada_caf1m71p IS NULL; 

-- Actualiza exportada_caf1m71p en smec.cafayate_columnas con los valores de "SMEC EXPORTADA"
UPDATE smec.cafayate_columnas
SET exportada_caf1m71p = cafayate1."SMEC EXPORTADA"
FROM (
    SELECT "Date Hour" AS date2, "SMEC EXPORTADA"
    FROM smec.caf
    WHERE id = 'CAF1M71P'
) AS cafayate1
WHERE cafayate1.date2 = smec.cafayate_columnas.date  
AND smec.cafayate_columnas.exportada_caf1m71p IS NULL; 

-- Actualiza importada_caf1m71c en smec.cafayate_columnas con los valores de "SMEC IMPORTADA" 
UPDATE smec.cafayate_columnas
SET importada_caf1m71c = cafayate1."SMEC IMPORTADA"
FROM (
    SELECT "Date Hour" AS date2, "SMEC IMPORTADA"
    FROM smec.caf
    WHERE id = 'CAF1M71C'
) AS cafayate1
WHERE cafayate1.date2 = smec.cafayate_columnas.date  
AND smec.cafayate_columnas.importada_caf1m71c IS NULL;

-- Actualiza exportada_caf1m71c en la tabla smec.cafayate_columnas con los valores de "SMEC EXPORTADA"
UPDATE smec.cafayate_columnas
SET exportada_caf1m71c = cafayate1."SMEC EXPORTADA"
FROM (
    SELECT "Date Hour" AS date2, "SMEC EXPORTADA"
    FROM smec.caf
    WHERE id = 'CAF1M71C'
) AS cafayate1
WHERE cafayate1.date2 = smec.cafayate_columnas.date  
AND smec.cafayate_columnas.exportada_caf1m71c IS NULL;

-------------------------------------------------------------------------------------------------------------

-- Inserta fechas unicas en smec.cafayate_columnas_diario desde smec.cafayate_columnas
INSERT INTO smec.cafayate_columnas_diario (
    SELECT DATE_TRUNC('day', date) AS DATE  
    FROM smec.cafayate_columnas
    GROUP BY DATE  
) ON CONFLICT ON CONSTRAINT uc_cafayate_columnas_diario DO NOTHING; 
-- Actualiza exportada_caf1m71p, exportada_caf1m71c, y dif_caf1m71 en la tabla smec.cafayate_columnas_diario
UPDATE smec.cafayate_columnas_diario
SET 
    exportada_caf1m71p = s.a,     
    exportada_caf1m71c = s.b,     
    dif_caf1m71 = s.d1
FROM (
    SELECT 
        DATE_TRUNC('day', date - interval '15 minutes') AS DATE1,
        SUM(exportada_caf1m71p) AS a,                             
        SUM(exportada_caf1m71c) AS b,                             
        (
            (abs(SUM(exportada_caf1m71p) - SUM(exportada_caf1m71c)) /   
            COALESCE(NULLIF((SUM(exportada_caf1m71p) + SUM(exportada_caf1m71c)) / 2, 0), 1)) * 100
        )::NUMERIC(10, 3) AS d1
    FROM smec.cafayate_columnas
    GROUP BY DATE1 
) AS s
WHERE s.DATE1 = cafayate_columnas_diario.date; 
-- Actualiza la columna dif_caf1m71 en la tabla smec.cafayate_columnas_diario
UPDATE smec.cafayate_columnas_diario
SET dif_caf1m71 = 200.000 
WHERE (
        exportada_caf1m71p IS NULL  
        AND date < CURRENT_DATE     
    )
    OR (
        exportada_caf1m71c IS NULL  
        AND date < CURRENT_DATE     
    );

-------------------------------------------------------------------------------------------------------------------------------------

-- Elimina todos los registros de la tabla smec.cafayate_comparacion_smec_po
DELETE FROM smec.cafayate_comparacion_smec_po;

-- Inserta nuevos registros comparando las exportaciones entre po_general_renovables y cafayate_columnas
INSERT INTO smec.cafayate_comparacion_smec_po(grupo, date, po_exportada, smec_exportada, diferencia)
SELECT 
    smec.po_general_renovables.grupo,                               
    smec.po_general_renovables.date_hour - interval '1 hour' AS date,
    egenerada AS po_exportada,                                       
    exportada::numeric(10, 3) AS smec_exportada,                     
    (
        (abs((egenerada) - (a.exportada::numeric(10,3))) /           
        COALESCE(NULLIF(((egenerada) + (a.exportada::numeric(10,3))) / 2, 0), 1)) * 100
    )::NUMERIC(10, 3) AS diferencia                                  
FROM smec.po_general_renovables
LEFT JOIN (
    SELECT 
        DATE_TRUNC('hour', date - interval '15 minutes') AS date1,   
        (sum(exportada_caf1m71p)/1000)::numeric(10,3) AS exportada   
    FROM smec.cafayate_columnas
    WHERE date >= DATE_TRUNC('day', now()) - interval '4 years'      
    AND date <= DATE_TRUNC('day', now()) + interval '23 hours' - interval '1 days' 
    GROUP BY date1                                                   
) AS a ON smec.po_general_renovables.date_hour - interval '1 hour' = a.date1 
WHERE date_hour >= DATE_TRUNC('day', now()) - interval '4 years'     
AND date_hour <= DATE_TRUNC('day', now()) + interval '23 hours' - interval '1 days' 
AND grupo = 'CAFAFV'                                                 
ORDER BY grupo, date_hour                                            
ON CONFLICT DO NOTHING;                                              

----------------------------------------------------------------

-- Elimina todos los registros de la tabla smec.cafayate_comparacion_smec_po_importada
DELETE FROM smec.cafayate_comparacion_smec_po_importada;

-- Inserta nuevos registros comparando las importaciones entre po_general_renovables y cafayate_columnas
INSERT INTO smec.cafayate_comparacion_smec_po_importada(grupo, date, po_importada, smec_importada, diferencia)
SELECT 
    smec.po_general_renovables.grupo,                                
    smec.po_general_renovables.date_hour - interval '1 hour' AS date, 
    compra_spot AS po_importada,                                      
    importada::numeric(10, 3) AS smec_importada,                      
    (
        (abs((compra_spot) - (a.importada::numeric(10,3))) /          
        COALESCE(NULLIF(((compra_spot) + (a.importada::numeric(10,3))) / 2, 0), 1)) * 100
    )::NUMERIC(10, 3) AS diferencia                                   
FROM smec.po_general_renovables
LEFT JOIN (
    
    SELECT 
        DATE_TRUNC('hour', date - interval '15 minutes') AS date1,    
        (sum(importada_caf1m71p)/1000)::numeric(10,3) AS importada    
    FROM smec.cafayate_columnas
    WHERE date >= DATE_TRUNC('day', now()) - interval '4 years'       
    AND date <= DATE_TRUNC('day', now()) + interval '23 hours' - interval '1 days' 
    GROUP BY date1                                                    
) AS a ON smec.po_general_renovables.date_hour - interval '1 hour' = a.date1 -
WHERE date_hour >= DATE_TRUNC('day', now()) - interval '4 years'      
AND date_hour <= DATE_TRUNC('day', now()) + interval '23 hours' - interval '1 days' 
AND grupo = 'CAFAFV'                                                  
ORDER BY grupo, date_hour                                             
ON CONFLICT DO NOTHING;                                               

--------------------------------CONSOLIDADOR------------------------------------------------
DROP TABLE IF EXISTS smec.consolidador_caf;
CREATE TABLE smec.consolidador_caf (date timestamptz, caf text, exportada_cammesa numerc(10, 3), exportada_scada numeric(10, 3), p_exportada numeric(10, 3));

CREATE UNIQUE INDEX unique_caf_consolidador ON smec.consolidador_caf (date) WHERE ("caf" = 'CAFAFV');
DRP TABLE IF EXISTSconsolidador_caf_temp;
CREATE TEMP TABLE consolidador_caf_temp (date timestamptz, caf text, exportada_cammesa numeric);
INSERT INTO consolidador_caf_temp(date, exportada_cammesa) SELECT DATE_TRUNC('hour',date) as date2, SUM(exportada_caf1m71p) FROM smec.cafayate_columnas WHERE date < '2022-02-26 00:00:00-03' GROUP BY date2 order by date2;
INSERT INTO consolidador_caf_temp(date, exportada_cammesa) SELECT DATE_TRUNC('hour',date - interval '15 minutes') as date2, SUM(exportada_caf1m71p) FROM smec.cafayate_columnas WHERE date >= '2022-02-26 00:00:00-03' GROUP BY date2 order by date2;
UPDATE consolidador_caf_temp SET caf = 'CAFAFV';
INSERT INTO smec.consolidador_caf SELECT * FROM consolidador_caf_temp ON CONFLICT DO NOTHING;


insert into smec.consolidador_caf (caf, date) 
SELECT * from smec.caf_ids CROSS JOIN generate_series(DATE_TRUNC('hour', now() - interval '7 day') ,DATE_TRUNC('hour', now()), '1 hour')  ON CONFLICT DO NOTHING;

insert into smec.consolidador_caf (caf, date) 
SELECT * from smec.caf_ids CROSS JOIN generate_series(DATE_TRUNC('hour', '2024-05-09 00:00:00-03'::timestamptz) ,DATE_TRUNC('hour', '2024-05-09 23:00:00-03'::timestamptz), '1 hour')  ON CONFLICT DO NOTHING;
--------------------------------------------------------------------
DROP TABLE IF EXISTS smec.scada_exportada_columnas_caf;
CREATE TABLE smec.scada_exportada_columnas_caf(date timestamptz, caf1m71p numeric, id text);

ALTER TABLE smec.scada_exportada_columnas_caf ADD CONSTRAINT uc_scada_exportada_caf_columnas UNIQUE (date);

INSERT INTO smec.scada_exportada_columnas_caf (
	SELECT date FROM smec.scada_exportada WHERE (date) NOT IN (
		SELECT date
		FROM smec.scada_exportada_columnas_caf
		)
	) ON CONFLICT DO NOTHING;

---------------------------------------------------------------------
UPDATE smec.scada_exportada_columnas_caf
SET caf1m71p = caf1.val
FROM (
	SELECT date AS date2
		,val
	FROM smec.scada_exportada_caf
	WHERE id = 'CAFAFV'
	) AS caf1
WHERE caf1.date2 = smec.scada_exportada_columnas_caf.date
	AND smec.scada_exportada_columnas_caf.caf1m71p IS NULL;

----------------------------------------------------------------------------
UPDATE smec.scada_exportada_columnas_caf SET id = 'CAFAFV';

------------------------------------------------------------------------------------------------------------------------------------------

UPDATE smec.consolidador_caf SET exportada_scada = s.a FROM (SELECT DATE_TRUNC('hour', date) as date2, id, SUM(caf1m71p) as a FROM smec.scada_exportada_columnas_caf GROUP BY date2, id) as s WHERE consolidador_caf.date = s.date2 AND consolidador_caf.caf = s.id;

UPDATE smec.consolidador_caf SET po_exportada = s.a FROM (SELECT date_hour - interval '1 hour' as date, grupo as id, egenerada as a FROM smec.po_general_renovables WHERE grupo LIKE 'CAF%') as s WHERE consolidador_caf.date = s.date AND consolidador_caf.caf = s.id;
UPDATE smec.consolidador_caf SET po_exportada = s.a FROM (SELECT DATE_TRUNC('day',(date_hour - interval '1 hour')) as date, grupo as id, SUM(energia) as a  FROM smec.valores_generadores WHERE grupo LIKE 'CAF%' AND date_hour < '2020-09-01 00:00:00-03' GROUP BY date, grupo) as s WHERE consolidador_caf.date = s.date AND consolidador_caf.caf = s.id;
UPDATE smec.consolidador_caf SET po_exportada = 164.411 WHERE date = '2019-06-26 00:00:00-03';
UPDATE smec.consolidador_caf SET po_exportada = 464 WHERE date = '2019-08-12 00:00:00-03';

ALTER TABLE smec.consolidador_caf ADD COLUMN unidad_check integer;
ALTER TABLE smec.consolidador_caf ADD COLUMN dia timestamptz;

UPDATE smec.consolidador_caf SET dia = DATE_TRUNC('day', date);
UPDATE smec.consolidador_caf SET unidad_check = s.a FROM (SELECT DATE_TRUNC('day', date2) as dia, count(date2) a  from (SELECT DATE_TRUNC('hour',date) as date2, SUM(exportada_caf1m71p)/1000 as x FROM smec.cafayate_columnas GROUP BY date2) as c WHERE x > 0 AND x < 1 AND date2 > '2022-02-25 23:00:00-03' GROUP BY dia) as s WHERE s.dia = consolidador_caf.dia;
UPDATE smec.consolidador_caf SET unidad_check = 1 WHERE unidad_check IS NULL;
UPDATE smec.consolidador_caf SET unidad_check = 1 WHERE date >= '2024-03-01 23:00:00-03';
UPDATE smec.consolidador_caf SET exportada_cammesa = exportada_cammesa/1000 WHERE date > '2022-02-25 23:00:00-03' AND unidad_check < 4;
UPDATE smec.consolidador_caf SET exportada_scada = exportada_scada/1000;
UPDATE smec.consolidador_caf set exportada_cammesa = s.a FROM (SELECT date + interval '1 hour' as date2, exportada_cammesa as a from smec.consolidador_caf WHERE unidad_check > 4) as s WHERE s.date2 = consolidador_caf.date;
update smec.consolidador_caf set exportada_cammesa = po_exportada where date >= '2024-05-09 00:00:00-03' and date <= '2024-05-09 23:00:00-03' and exportada_cammesa is null;

--------------------------------------------------------------------------------------------------------------------------------------------
ALTER TABLE smec.consolidador_caf ADD COLUMN cammesa_ppa NUMERIC;
ALTER TABLE smec.consolidador_caf ADD COLUMN cammesa_spot NUMERIC;

UPDATE smec.consolidador_caf SET cammesa_ppa = s.a FROM (SELECT exportada_cammesa as a, date, caf FROM smec.consolidador_caf WHERE exportada_cammesa <= 80 ) as s WHERE s.date = consolidador_caf.date AND s.caf = consolidador_caf.caf;
UPDATE smec.consolidador_caf SET cammesa_spot = exportada_cammesa - 80;
UPDATE smec.consolidador_caf SET cammesa_spot = 0 WHERE cammesa_spot <= 0;
UPDATE smec.consolidador_caf SET cammesa_ppa = 80 WHERE exportada_cammesa >= 80;

ALTER TABLE smec.consolidador_caf ADD COLUMN scada_ppa NUMERIC;
ALTER TABLE smec.consolidador_caf ADD COLUMN scada_spot NUMERIC;

UPDATE smec.consolidador_caf SET scada_ppa = s.a FROM (SELECT exportada_scada as a, date, caf FROM smec.consolidador_caf WHERE exportada_scada <= 80 ) as s WHERE s.date = consolidador_caf.date AND s.caf = consolidador_caf.caf;
UPDATE smec.consolidador_caf SET scada_spot = exportada_scada - 80;
UPDATE smec.consolidador_caf SET scada_spot = 0 WHERE scada_spot <= 0;
UPDATE smec.consolidador_caf SET scada_ppa = 80 WHERE exportada_scada >= 80;

ALTER TABLE smec.consolidador_caf ADD COLUMN po_ppa NUMERIC;
ALTER TABLE smec.consolidador_caf ADD COLUMN po_spot NUMERIC;

UPDATE smec.consolidador_caf SET po_ppa = s.a FROM (SELECT po_exportada as a, date, caf FROM smec.consolidador_caf WHERE po_exportada <= 80 ) as s WHERE s.date = consolidador_caf.date AND s.caf = consolidador_caf.caf;
UPDATE smec.consolidador_caf SET po_spot = po_exportada - 80;
UPDATE smec.consolidador_caf SET po_spot = 0 WHERE po_spot <= 0;
UPDATE smec.consolidador_caf SET po_ppa = 80 WHERE po_exportada >= 80;
UPDATE smec.consolidador_caf SET po_ppa = po_exportada WHERE date <= '2020-08-31 00:00:00-03';
UPDATE smec.consolidador_caf SET po_ppa = 488.61 WHERE date = '2019-09-18 00:00:00-03';
UPDATE smec.consolidador_caf SET po_ppa = 464 WHERE date = '2019-08-12 00:00:00-03';


UPDATE smec.consolidador_caf SET cammesa_spot = exportada_cammesa WHERE date < '2019-07-19 00:00:00-03';
UPDATE smec.consolidador_caf SET scada_spot = exportada_scada WHERE date < '2019-07-19 00:00:00-03';
UPDATE smec.consolidador_caf SET po_spot = po_exportada WHERE date < '2019-07-19 00:00:00-03';
UPDATE smec.consolidador_caf SET po_spot = 0 WHERE date <= '2020-08-31 00:00:00-03' AND date >= '2019-07-19 00:00:00-03';

UPDATE smec.consolidador_caf SET cammesa_ppa = exportada_cammesa WHERE date < '2020-09-01 00:00:00-03';
UPDATE smec.consolidador_caf SET cammesa_ppa = 0 WHERE date < '2019-07-19 00:00:00-03';
UPDATE smec.consolidador_caf SET scada_ppa = 0 WHERE date < '2019-07-19 00:00:00-03';
UPDATE smec.consolidador_caf SET po_ppa = 0 WHERE date < '2019-07-19 00:00:00-03'; 
UPDATE smec.consolidador_caf SET cammesa_spot = 0 WHERE date <= '2019-08-12 00:00:00-03' AND date >= '2019-07-19 00:00:00-03';
UPDATE smec.consolidador_caf SET cammesa_spot = 0 WHERE date >= '2019-09-07 00:00:00-03' AND date <= '2020-08-31 00:00:00-03';

ALTER TABLE smec.consolidador_caf ADD COLUMN cammesa_importada NUMERIC;
ALTER TABLE smec.consolidador_caf ADD COLUMN po_importada NUMERIC;

DROP TABLE IF EXISTS consolidador_caf_temp;
CREATE TEMP TABLE consolidador_caf_temp (date timestamptz, cammesa_importada numeric);
INSERT INTO consolidador_caf_temp(date, cammesa_importada) SELECT DATE_TRUNC('hour',date) as date2, SUM(importada_caf1m71p) FROM smec.cafayate_columnas WHERE date < '2022-02-26 00:00:00-03' GROUP BY date2 order by date2;
INSERT INTO consolidador_caf_temp(date, cammesa_importada) SELECT DATE_TRUNC('hour',date - interval '15 minutes') as date2, SUM(importada_caf1m71p) FROM smec.cafayate_columnas WHERE date >= '2022-02-26 00:00:00-03' GROUP BY date2 order by date2;
UPDATE smec.consolidador_caf SET cammesa_importada = consolidador_caf_temp.cammesa_importada FROM consolidador_caf_temp WHERE consolidador_caf_temp.date = consolidador_caf.date;

UPDATE smec.consolidador_caf SET cammesa_importada = cammesa_importada/1000 WHERE date > '2022-02-25 23:00:00-03' AND unidad_check < 4;
UPDATE smec.consolidador_caf set cammesa_importada = s.a FROM (SELECT date + interval '1 hour' as date2, cammesa_importada as a from smec.consolidador_caf WHERE unidad_check > 4) as s WHERE s.date2 = consolidador_caf.date;

UPDATE smec.consolidador_caf SET po_importada = s.a FROM (SELECT date_hour - interval '1 hour' as date, grupo as id, compra_spot as a FROM smec.po_general_renovables WHERE grupo LIKE 'CAF%') as s WHERE consolidador_caf.date = s.date AND consolidador_caf.caf = s.id;
UPDATE smec.consolidador_caf SET po_importada = s.a FROM (SELECT DATE_TRUNC('day',(date_hour - interval '1 hour')) as date, grupo as id, SUM(compra_spot) as a  FROM smec.valores_generadores WHERE grupo LIKE 'CAF%' AND date_hour < '2020-09-01 00:00:00-03' GROUP BY date, grupo) as s WHERE consolidador_caf.date = s.date AND consolidador_caf.caf = s.id;


