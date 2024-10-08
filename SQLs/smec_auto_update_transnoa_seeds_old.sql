DROP TABLE IF EXISTS tmp_smec_seeds;
CREATE TEMP TABLE tmp_smec_seeds ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '1 days', 'YYYYMMDD');
Begin 
EXECUTE format(
			'COPY tmp_smec_seeds (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Administrador\GoesGreen SRL\I4 - AUTOPRN\seeds\PERGM21P_%s.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_seeds 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_seeds SET id = 'PERGM21P';
UPDATE tmp_smec_seeds SET date = date_part.date2 FROM (SELECT split_part(hour,' ',1) as date2 FROM tmp_smec_seeds WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_seeds SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',2) as hour2, hour FROM tmp_smec_seeds WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_seeds.hour = hour_part.hour;
UPDATE tmp_smec_seeds SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_seeds SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_seeds) AS date_hour WHERE tmp_smec_seeds.hour = date_hour.hour;
ALTER TABLE tmp_smec_seeds ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_seeds SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_seeds WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_seeds."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.seeds SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_seeds ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS tmp_smec_seeds;
CREATE TEMP TABLE tmp_smec_seeds ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '1 days', 'YYYYMMDD');
Begin 
EXECUTE format(
			'COPY tmp_smec_seeds (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Administrador\GoesGreen SRL\I4 - AUTOPRN\seeds\VENTM21P_%s.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_seeds 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_seeds SET id = 'VENTM21P';
UPDATE tmp_smec_seeds SET date = date_part.date2 FROM (SELECT split_part(hour,' ',1) as date2 FROM tmp_smec_seeds WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_seeds SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',2) as hour2, hour FROM tmp_smec_seeds WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_seeds.hour = hour_part.hour;
UPDATE tmp_smec_seeds SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_seeds SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_seeds) AS date_hour WHERE tmp_smec_seeds.hour = date_hour.hour;
ALTER TABLE tmp_smec_seeds ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_seeds SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_seeds WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_seeds."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.seeds SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_seeds ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_seeds;
CREATE TEMP TABLE tmp_smec_seeds ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '2 days', 'YYYYMMDD');
Begin 
EXECUTE format(
			'COPY tmp_smec_seeds (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Administrador\GoesGreen SRL\I4 - AUTOPRN\seeds\PERGM21P_%s.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_seeds 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_seeds SET id = 'PERGM21P';
UPDATE tmp_smec_seeds SET date = date_part.date2 FROM (SELECT split_part(hour,' ',1) as date2 FROM tmp_smec_seeds WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_seeds SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',2) as hour2, hour FROM tmp_smec_seeds WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_seeds.hour = hour_part.hour;
UPDATE tmp_smec_seeds SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_seeds SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_seeds) AS date_hour WHERE tmp_smec_seeds.hour = date_hour.hour;
ALTER TABLE tmp_smec_seeds ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_seeds SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_seeds WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_seeds."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.seeds SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_seeds ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS tmp_smec_seeds;
CREATE TEMP TABLE tmp_smec_seeds ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '2 days', 'YYYYMMDD');
Begin 
EXECUTE format(
			'COPY tmp_smec_seeds (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Administrador\GoesGreen SRL\I4 - AUTOPRN\seeds\VENTM21P_%s.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_seeds 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_seeds SET id = 'VENTM21P';
UPDATE tmp_smec_seeds SET date = date_part.date2 FROM (SELECT split_part(hour,' ',1) as date2 FROM tmp_smec_seeds WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_seeds SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',2) as hour2, hour FROM tmp_smec_seeds WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_seeds.hour = hour_part.hour;
UPDATE tmp_smec_seeds SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_seeds SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_seeds) AS date_hour WHERE tmp_smec_seeds.hour = date_hour.hour;
ALTER TABLE tmp_smec_seeds ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_seeds SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_seeds WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_seeds."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.seeds SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_seeds ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_seeds;
CREATE TEMP TABLE tmp_smec_seeds ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '3 days', 'YYYYMMDD');
Begin 
EXECUTE format(
			'COPY tmp_smec_seeds (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Administrador\GoesGreen SRL\I4 - AUTOPRN\seeds\PERGM21P_%s.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_seeds 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_seeds SET id = 'PERGM21P';
UPDATE tmp_smec_seeds SET date = date_part.date2 FROM (SELECT split_part(hour,' ',1) as date2 FROM tmp_smec_seeds WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_seeds SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',2) as hour2, hour FROM tmp_smec_seeds WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_seeds.hour = hour_part.hour;
UPDATE tmp_smec_seeds SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_seeds SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_seeds) AS date_hour WHERE tmp_smec_seeds.hour = date_hour.hour;
ALTER TABLE tmp_smec_seeds ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_seeds SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_seeds WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_seeds."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.seeds SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_seeds ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS tmp_smec_seeds;
CREATE TEMP TABLE tmp_smec_seeds ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '3 days', 'YYYYMMDD');
Begin 
EXECUTE format(
			'COPY tmp_smec_seeds (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Administrador\GoesGreen SRL\I4 - AUTOPRN\seeds\VENTM21P_%s.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_seeds 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_seeds SET id = 'VENTM21P';
UPDATE tmp_smec_seeds SET date = date_part.date2 FROM (SELECT split_part(hour,' ',1) as date2 FROM tmp_smec_seeds WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_seeds SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',2) as hour2, hour FROM tmp_smec_seeds WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_seeds.hour = hour_part.hour;
UPDATE tmp_smec_seeds SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_seeds SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_seeds) AS date_hour WHERE tmp_smec_seeds.hour = date_hour.hour;
ALTER TABLE tmp_smec_seeds ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_seeds SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_seeds WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_seeds."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.seeds SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_seeds ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_seeds;
CREATE TEMP TABLE tmp_smec_seeds ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '4 days', 'YYYYMMDD');
Begin 
EXECUTE format(
			'COPY tmp_smec_seeds (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Administrador\GoesGreen SRL\I4 - AUTOPRN\seeds\PERGM21P_%s.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_seeds 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_seeds SET id = 'PERGM21P';
UPDATE tmp_smec_seeds SET date = date_part.date2 FROM (SELECT split_part(hour,' ',1) as date2 FROM tmp_smec_seeds WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_seeds SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',2) as hour2, hour FROM tmp_smec_seeds WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_seeds.hour = hour_part.hour;
UPDATE tmp_smec_seeds SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_seeds SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_seeds) AS date_hour WHERE tmp_smec_seeds.hour = date_hour.hour;
ALTER TABLE tmp_smec_seeds ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_seeds SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_seeds WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_seeds."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.seeds SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_seeds ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS tmp_smec_seeds;
CREATE TEMP TABLE tmp_smec_seeds ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '4 days', 'YYYYMMDD');
Begin 
EXECUTE format(
			'COPY tmp_smec_seeds (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Administrador\GoesGreen SRL\I4 - AUTOPRN\seeds\VENTM21P_%s.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_seeds 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_seeds SET id = 'VENTM21P';
UPDATE tmp_smec_seeds SET date = date_part.date2 FROM (SELECT split_part(hour,' ',1) as date2 FROM tmp_smec_seeds WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_seeds SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',2) as hour2, hour FROM tmp_smec_seeds WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_seeds.hour = hour_part.hour;
UPDATE tmp_smec_seeds SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_seeds SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_seeds) AS date_hour WHERE tmp_smec_seeds.hour = date_hour.hour;
ALTER TABLE tmp_smec_seeds ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_seeds SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_seeds WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_seeds."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.seeds SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_seeds ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO smec.seeds_columnas (
	SELECT "Date Hour" FROM smec.seeds WHERE ("Date Hour") NOT IN (
		SELECT date
		FROM smec.seeds_columnas
		)
	) ON CONFLICT DO NOTHING;


---------------------------------------------------------------------
UPDATE smec.seeds_columnas
SET importada_vt = seeds1."SMEC IMPORTADA"
FROM (
	SELECT "Date Hour" AS date2
		,"SMEC IMPORTADA"
	FROM smec.seeds
	WHERE id = 'VENTM21P'
	) AS seeds1
WHERE seeds1.date2 = smec.seeds_columnas.date
	AND smec.seeds_columnas.importada_vt IS NULL;

UPDATE smec.seeds_columnas
SET exportada_vt = seeds1."SMEC EXPORTADA"
FROM (
	SELECT "Date Hour" AS date2
		,"SMEC EXPORTADA"
	FROM smec.seeds
	WHERE id = 'VENTM21P'
	) AS seeds1
WHERE seeds1.date2 = smec.seeds_columnas.date
	AND smec.seeds_columnas.exportada_vt IS NULL;

UPDATE smec.seeds_columnas
SET importada_perg = seeds1."SMEC IMPORTADA"
FROM (
	SELECT "Date Hour" AS date2
		,"SMEC IMPORTADA"
	FROM smec.seeds
	WHERE id = 'PERGM21P'
	) AS seeds1
WHERE seeds1.date2 = smec.seeds_columnas.date
	AND smec.seeds_columnas.importada_perg IS NULL;

UPDATE smec.seeds_columnas
SET exportada_perg = seeds1."SMEC EXPORTADA"
FROM (
	SELECT "Date Hour" AS date2
		,"SMEC EXPORTADA"
	FROM smec.seeds
	WHERE id = 'PERGM21P'
	) AS seeds1
WHERE seeds1.date2 = smec.seeds_columnas.date
	AND smec.seeds_columnas.exportada_perg IS NULL;
	
-------------------------------------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------------------------------------------
DELETE FROM smec.seeds_comparacion_smec_po;

INSERT INTO smec.seeds_comparacion_smec_po(grupo, date, po_exportada, smec_exportada, diferencia) SELECT smec.po_general_renovables.grupo
	,smec.po_general_renovables.date_hour - interval '1 hour' as date
	,egenerada as po_exportada
	,exportada::numeric(10, 3) as smec_exportada
	,(((abs((egenerada) - (a.exportada::numeric(10,3))) / (COALESCE(NULLIF(((egenerada) + (a.exportada::numeric(10,3))) / 2, 0), 1))) * 100)::NUMERIC(10, 3)) AS diferencia
FROM smec.po_general_renovables
LEFT JOIN (
	SELECT DATE_TRUNC('hour', date - interval '15 minutes') AS date1
		,(sum(exportada_vt)/1000)::numeric(10,3) AS exportada
	FROM smec.seeds_columnas
	WHERE date >= DATE_TRUNC('day', now()) - interval '4 years'
		AND date <= DATE_TRUNC('day', now())+ interval '23 hours' - interval '1 days'
	GROUP BY date1
	) AS a ON smec.po_general_renovables.date_hour - interval '1 hour' = a.date1
WHERE date_hour >= DATE_TRUNC('day', now()) - interval '4 years'
	AND date_hour <= DATE_TRUNC('day', now())+ interval '23 hours' - interval '1 days'
	AND grupo = 'PERGDI01'
ORDER BY grupo
	,date_hour ON CONFLICT DO NOTHING;
	
-------------------------------------------------------------------------------------------------------------------------------------
DELETE FROM smec.seeds_comparacion_smec_po_importada;

INSERT INTO smec.seeds_comparacion_smec_po_importada(grupo, date, po_importada, smec_importada, diferencia) SELECT smec.po_general_renovables.grupo
	,smec.po_general_renovables.date_hour - interval '1 hour' as date
	,compra_spot as po_importada
	,importada::numeric(10, 3) as smec_importada
	,(((abs((compra_spot) - (a.importada::numeric(10,3))) / (COALESCE(NULLIF(((compra_spot) + (a.importada::numeric(10,3))) / 2, 0), 1))) * 100)::NUMERIC(10, 3)) AS diferencia
FROM smec.po_general_renovables
LEFT JOIN (
	SELECT DATE_TRUNC('hour', date - interval '15 minutes') AS date1
		,(sum(importada_vt)/1000)::numeric(10,3) AS importada
	FROM smec.seeds_columnas
	WHERE date >= DATE_TRUNC('day', now()) - interval '4 years'
		AND date <= DATE_TRUNC('day', now())+ interval '23 hours' - interval '1 days'
	GROUP BY date1
	) AS a ON smec.po_general_renovables.date_hour - interval '1 hour' = a.date1
WHERE date_hour >= DATE_TRUNC('day', now()) - interval '4 years'
	AND date_hour <= DATE_TRUNC('day', now())+ interval '23 hours' - interval '1 days'
	AND grupo = 'VTBGDI01'
ORDER BY grupo
	,date_hour ON CONFLICT DO NOTHING;

-------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------CONSOLIDADOR-------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------

DELETE FROM smec.consolidador_seeds WHERE date >= (now() - interval '7 days');

DROP TABLE IF EXISTS consolidador_seeds_temp;
CREATE TEMP TABLE consolidador_seeds_temp (date timestamptz, id text, exportada_cammesa numeric);
INSERT INTO consolidador_seeds_temp(date, exportada_cammesa) SELECT DATE_TRUNC('hour',date - interval '15 minutes') as date2, SUM(exportada_vt) FROM smec.seeds_columnas WHERE date >= (now() - interval '7 days') GROUP BY date2 order by date2;
UPDATE consolidador_seeds_temp SET id = 'VTBGDI01';
INSERT INTO smec.consolidador_seeds SELECT * FROM consolidador_seeds_temp ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS consolidador_seeds_temp;
CREATE TEMP TABLE consolidador_seeds_temp (date timestamptz, id text, exportada_cammesa numeric);
INSERT INTO consolidador_seeds_temp(date, exportada_cammesa) SELECT DATE_TRUNC('hour',date - interval '15 minutes') as date2, SUM(exportada_perg) FROM smec.seeds_columnas WHERE date >= (now() - interval '7 days') GROUP BY date2 order by date2;
UPDATE consolidador_seeds_temp SET id = 'PERGDI01';
INSERT INTO smec.consolidador_seeds SELECT * FROM consolidador_seeds_temp ON CONFLICT DO NOTHING;


insert into smec.consolidador_seeds (id, date) 
SELECT * from smec.seeds_ids CROSS JOIN generate_series(DATE_TRUNC('hour', now() - interval '1 day') ,DATE_TRUNC('hour', now()), '1 hour')  ON CONFLICT DO NOTHING;
--------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------------------------------------

UPDATE smec.consolidador_seeds SET po_exportada = s.a FROM (SELECT date_hour - interval '1 hour' as date, grupo as id, egenerada as a FROM smec.po_general_renovables WHERE grupo = 'PERGDI01') as s WHERE consolidador_seeds.date = s.date AND consolidador_seeds.id = s.id AND consolidador_seeds.date >= (now() - interval '7 days');
UPDATE smec.consolidador_seeds SET po_exportada = s.a FROM (SELECT date_hour - interval '1 hour' as date, grupo as id, egenerada as a FROM smec.po_general_renovables WHERE grupo = 'VTBGDI01') as s WHERE consolidador_seeds.date = s.date AND consolidador_seeds.id = s.id AND consolidador_seeds.date >= (now() - interval '7 days');

--------------------------------------------------------------------------------------------------------------------------------------------
UPDATE smec.consolidador_seeds SET exportada_cammesa = exportada_cammesa/1000 WHERE date >= (now() - interval '7 days');

UPDATE smec.consolidador_seeds SET cammesa_ppa = s.a FROM (SELECT exportada_cammesa as a, date, id FROM smec.consolidador_seeds WHERE exportada_cammesa <= 2.4 ) as s WHERE consolidador_seeds.id = 'PERGDI01' AND s.date = consolidador_seeds.date AND s.id = consolidador_seeds.id AND consolidador_seeds.date >= (now() - interval '7 days');
UPDATE smec.consolidador_seeds SET cammesa_spot = exportada_cammesa - 2.4 WHERE id = 'PERGDI01' AND date >= (now() - interval '7 days');
UPDATE smec.consolidador_seeds SET cammesa_spot = 0 WHERE cammesa_spot <= 0 AND id = 'PERGDI01' AND date >= (now() - interval '7 days');
UPDATE smec.consolidador_seeds SET cammesa_ppa = 2.4 WHERE exportada_cammesa >= 2.4 AND id = 'PERGDI01' AND date >= (now() - interval '7 days');


UPDATE smec.consolidador_seeds SET po_ppa = s.a FROM (SELECT po_exportada as a, date, id FROM smec.consolidador_seeds WHERE po_exportada <= 2.4 ) as s WHERE s.date = consolidador_seeds.date AND s.id = consolidador_seeds.id AND consolidador_seeds.date >= (now() - interval '7 days');
UPDATE smec.consolidador_seeds SET po_spot = po_exportada - 2.4 WHERE id = 'PERGDI01' AND date >= (now() - interval '7 days');
UPDATE smec.consolidador_seeds SET po_spot = 0 WHERE po_spot <= 0 AND id = 'PERGDI01' AND date >= (now() - interval '7 days');
UPDATE smec.consolidador_seeds SET po_ppa = 2.4 WHERE po_exportada >= 2.4 AND id = 'PERGDI01' AND date >= (now() - interval '7 days');

------------------

UPDATE smec.consolidador_seeds SET cammesa_ppa = s.a FROM (SELECT exportada_cammesa as a, date, id FROM smec.consolidador_seeds WHERE exportada_cammesa <= 2 ) as s WHERE consolidador_seeds.id = 'VTBGDI01' AND s.date = consolidador_seeds.date AND s.id = consolidador_seeds.id AND consolidador_seeds.date >= (now() - interval '7 days');
UPDATE smec.consolidador_seeds SET cammesa_spot = exportada_cammesa - 2 WHERE id = 'VTBGDI01' AND date >= (now() - interval '7 days');
UPDATE smec.consolidador_seeds SET cammesa_spot = 0 WHERE cammesa_spot <= 0 AND id = 'VTBGDI01' AND date >= (now() - interval '7 days');
UPDATE smec.consolidador_seeds SET cammesa_ppa = 2 WHERE exportada_cammesa >= 2 AND id = 'VTBGDI01' AND date >= (now() - interval '7 days');

UPDATE smec.consolidador_seeds SET po_ppa = s.a FROM (SELECT po_exportada as a, date, id FROM smec.consolidador_seeds WHERE po_exportada <= 2 ) as s WHERE s.date = consolidador_seeds.date AND s.id = consolidador_seeds.id AND consolidador_seeds.date >= (now() - interval '7 days');
UPDATE smec.consolidador_seeds SET po_spot = po_exportada - 2 WHERE id = 'VTBGDI01' AND date >= (now() - interval '7 days');
UPDATE smec.consolidador_seeds SET po_spot = 0 WHERE po_spot <= 0 AND id = 'VTBGDI01' AND date >= (now() - interval '7 days');
UPDATE smec.consolidador_seeds SET po_ppa = 2 WHERE po_exportada >= 2 AND id = 'VTBGDI01' AND date >= (now() - interval '7 days');

