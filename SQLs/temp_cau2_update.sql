-- Elimina los registros de la tabla temp_cau2
DELETE FROM temp_cau2 WHERE date >= now() - interval '1 hour';
-- Elimina las tablas temporales si ya existen
DROP TABLE IF EXISTS stage_temp_cau2_;
DROP TABLE IF EXISTS stage_temp_cau2_2;
-- Crea tabla temporal
CREATE TEMP TABLE stage_temp_cau2_(x jsonb);
-- Crea tabla temporal
CREATE TEMP TABLE stage_temp_cau2_2(date timestamptz, val numeric, id text);
-- Bloque de codigo para cargar datos
DO $$
DECLARE
    startdate text := to_char(current_date, 'YYYYMMDD');
    starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '1 hour' + interval '3 hours'))), 'HH24MISS');
BEGIN 
    EXECUTE format(
        'COPY stage_temp_cau2_ FROM PROGRAM ''curl -H "Api-Key:38deaa51-8716-4cc9-aa42-ab14fb72a752.01" "https://portal.unity.inaccess.com/ifms/sources/bdb00fc4-07ec-11eb-8a43-42010afa015a/events?&start_date=%sT%sZ"''',
        startdate, starttime
    );
END $$;
-- Insertar los datos de la tabla temporal
INSERT INTO stage_temp_cau2_2 
SELECT f.* 
FROM stage_temp_cau2_, jsonb_populate_recordset(null::stage_temp_cau2_2, x) f;
-- Actualiza la columna id
UPDATE stage_temp_cau2_2 SET id = 'Temperatura Ambiente';
-- Actualiza la columna date a minutos
UPDATE stage_temp_cau2_2 SET date = DATE_TRUNC('minute', date);
-- Insertar los datos desde la tabla temporal stage_temp_cau2_2 en la tabla final temp_cau2
INSERT INTO temp_cau2 
SELECT * 
FROM stage_temp_cau2_2 
WHERE date >= (now()::timestamptz - interval '1 hour');
-- Elimina las tablas temporales
DROP TABLE IF EXISTS stage_temp_cau2_;
DROP TABLE IF EXISTS stage_temp_cau2_2;