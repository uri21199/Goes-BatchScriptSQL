-- Crear una tabla temporal para almacenar los detalles de las URLs e IDs
CREATE TEMP TABLE smec_auto_update_sources (day text, url text, id text);

-- Insertar los detalles de las solicitudes en la tabla
INSERT INTO smec_auto_update_sources (day, url, id)
VALUES
    ('1 days','CAU1M71C.csv', 'CAU1M71C'),
('1 days','CAU1M71P.csv', 'CAU1M71P'),
('1 days','CAU1M72C.csv', 'CAU1M72C'),
('1 days','CAU1M72P.csv', 'CAU1M72P'),
('1 days','CAU1M73C.csv', 'CAU1M73C'),
('1 days','CAU1M73P.csv', 'CAU1M73P'),
('1 days','CAU2M74C.csv', 'CAU2M74C'),
('1 days','CAU2M74P.csv', 'CAU2M74P'),
('1 days','CAU3M75C.csv', 'CAU3M75C'),
('1 days','CAU3M75P.csv', 'CAU3M75P'),
('2 days','CAU1M71C.csv', 'CAU1M71C'),
('2 days','CAU1M71P.csv', 'CAU1M71P'),
('2 days','CAU1M72C.csv', 'CAU1M72C'),
('2 days','CAU1M72P.csv', 'CAU1M72P'),
('2 days','CAU1M73C.csv', 'CAU1M73C'),
('2 days','CAU1M73P.csv', 'CAU1M73P'),
('2 days','CAU2M74C.csv', 'CAU2M74C'),
('2 days','CAU2M74P.csv', 'CAU2M74P'),
('2 days','CAU3M75C.csv', 'CAU3M75C'),
('2 days','CAU3M75P.csv', 'CAU3M75P'),
('3 days','CAU1M71C.csv', 'CAU1M71C'),
('3 days','CAU1M71P.csv', 'CAU1M71P'),
('3 days','CAU1M72C.csv', 'CAU1M72C'),
('3 days','CAU1M72P.csv', 'CAU1M72P'),
('3 days','CAU1M73C.csv', 'CAU1M73C'),
('3 days','CAU1M73P.csv', 'CAU1M73P'),
('3 days','CAU2M74C.csv', 'CAU2M74C'),
('3 days','CAU2M74P.csv', 'CAU2M74P'),
('3 days','CAU3M75C.csv', 'CAU3M75C'),
('3 days','CAU3M75P.csv', 'CAU3M75P');

DO $$
DECLARE
    startdate text;

BEGIN
    FOR rec IN SELECT * FROM smec_auto_update_sources LOOP
    startdate := to_char(current_date - rec.day::interval, 'DD_MM_YY');
    -- Crear tablas temporales
    DROP TABLE IF EXISTS tmp_smec_cau;
    CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

    -- Descargar y copiar los datos usando curl
    EXECUTE format('COPY tmp_smec_cau (hour, "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", a, b, c, d) FROM %L DELIMITER '','' CSV HEADER',
    format('C:\\Users\\Server01\\GoesGreen SRL\\Cauchari AM - AUTOPRN\\PRN SMEC %s %s', startdate, rec.url));

    ALTER TABLE tmp_smec_cau DROP COLUMN a, DROP COLUMN b, DROP COLUMN c, DROP COLUMN d;
    UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
    EXECUTE format ('UPDATE tmp_smec_cau SET id = %s', rec.id)
    UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
    UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
    UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
    ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

    UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

    INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
    END LOOP;
END $$;

-- Limpiar la tabla temporal de fuentes
DROP TABLE smec_auto_update_sources;