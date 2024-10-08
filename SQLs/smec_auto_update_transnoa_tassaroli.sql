
DROP TABLE IF EXISTS tmp_smec_tassaroli;
CREATE TEMP TABLE tmp_smec_tassaroli ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '1 days', 'YYYYMMDD');
Begin 
EXECUTE format(
			'COPY tmp_smec_tassaroli (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Administrador\GoesGreen SRL\I4 - AUTOPRN\tassaroli\HELIM71P_%s.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_tassaroli 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_tassaroli SET id = 'HESRFV';
UPDATE tmp_smec_tassaroli SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_tassaroli WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_tassaroli SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_tassaroli WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_tassaroli.hour = hour_part.hour;
UPDATE tmp_smec_tassaroli SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_tassaroli SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_tassaroli) AS date_hour WHERE tmp_smec_tassaroli.hour = date_hour.hour;
ALTER TABLE tmp_smec_tassaroli ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_tassaroli SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_tassaroli WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_tassaroli."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.tassaroli SELECT "Date Hour", "SMEC EXPORTADA", "SMEC IMPORTADA", "Tension Media III (V)", id FROM tmp_smec_tassaroli ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS tmp_smec_tassaroli;
CREATE TEMP TABLE tmp_smec_tassaroli ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '2 days', 'YYYYMMDD');
Begin 
EXECUTE format(
			'COPY tmp_smec_tassaroli (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Administrador\GoesGreen SRL\I4 - AUTOPRN\tassaroli\HELIM71P_%s.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_tassaroli 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_tassaroli SET id = 'HESRFV';
UPDATE tmp_smec_tassaroli SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_tassaroli WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_tassaroli SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_tassaroli WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_tassaroli.hour = hour_part.hour;
UPDATE tmp_smec_tassaroli SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_tassaroli SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_tassaroli) AS date_hour WHERE tmp_smec_tassaroli.hour = date_hour.hour;
ALTER TABLE tmp_smec_tassaroli ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_tassaroli SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_tassaroli WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_tassaroli."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.tassaroli SELECT "Date Hour", "SMEC EXPORTADA", "SMEC IMPORTADA", "Tension Media III (V)", id FROM tmp_smec_tassaroli ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS tmp_smec_tassaroli;
CREATE TEMP TABLE tmp_smec_tassaroli ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '3 days', 'YYYYMMDD');
Begin 
EXECUTE format(
			'COPY tmp_smec_tassaroli (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Administrador\GoesGreen SRL\I4 - AUTOPRN\tassaroli\HELIM71P_%s.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_tassaroli 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_tassaroli SET id = 'HESRFV';
UPDATE tmp_smec_tassaroli SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_tassaroli WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_tassaroli SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_tassaroli WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_tassaroli.hour = hour_part.hour;
UPDATE tmp_smec_tassaroli SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_tassaroli SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_tassaroli) AS date_hour WHERE tmp_smec_tassaroli.hour = date_hour.hour;
ALTER TABLE tmp_smec_tassaroli ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_tassaroli SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_tassaroli WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_tassaroli."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.tassaroli SELECT "Date Hour", "SMEC EXPORTADA", "SMEC IMPORTADA", "Tension Media III (V)", id FROM tmp_smec_tassaroli ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS tmp_smec_tassaroli;
CREATE TEMP TABLE tmp_smec_tassaroli ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '4 days', 'YYYYMMDD');
Begin 
EXECUTE format(
			'COPY tmp_smec_tassaroli (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Administrador\GoesGreen SRL\I4 - AUTOPRN\tassaroli\HELIM71P_%s.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_tassaroli 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_tassaroli SET id = 'HESRFV';
UPDATE tmp_smec_tassaroli SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_tassaroli WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_tassaroli SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_tassaroli WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_tassaroli.hour = hour_part.hour;
UPDATE tmp_smec_tassaroli SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_tassaroli SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_tassaroli) AS date_hour WHERE tmp_smec_tassaroli.hour = date_hour.hour;
ALTER TABLE tmp_smec_tassaroli ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_tassaroli SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_tassaroli WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_tassaroli."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.tassaroli SELECT "Date Hour", "SMEC EXPORTADA", "SMEC IMPORTADA", "Tension Media III (V)", id FROM tmp_smec_tassaroli ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS tmp_smec_tassaroli;
CREATE TEMP TABLE tmp_smec_tassaroli ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '5 days', 'YYYYMMDD');
Begin 
EXECUTE format(
			'COPY tmp_smec_tassaroli (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Administrador\GoesGreen SRL\I4 - AUTOPRN\tassaroli\HELIM71P_%s.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_tassaroli 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_tassaroli SET id = 'HESRFV';
UPDATE tmp_smec_tassaroli SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_tassaroli WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_tassaroli SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_tassaroli WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_tassaroli.hour = hour_part.hour;
UPDATE tmp_smec_tassaroli SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_tassaroli SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_tassaroli) AS date_hour WHERE tmp_smec_tassaroli.hour = date_hour.hour;
ALTER TABLE tmp_smec_tassaroli ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_tassaroli SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_tassaroli WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_tassaroli."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.tassaroli SELECT "Date Hour", "SMEC EXPORTADA", "SMEC IMPORTADA", "Tension Media III (V)", id FROM tmp_smec_tassaroli ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO smec.tassaroli_columnas (
	SELECT "Date Hour" FROM smec.tassaroli WHERE ("Date Hour") NOT IN (
		SELECT date
		FROM smec.tassaroli_columnas
		)
	) ON CONFLICT DO NOTHING;


---------------------------------------------------------------------
UPDATE smec.tassaroli_columnas
SET importada = arb1."SMEC IMPORTADA"
FROM (
	SELECT "Date Hour" AS date2
		,"SMEC IMPORTADA"
	FROM smec.tassaroli
	) AS arb1
WHERE arb1.date2 = smec.tassaroli_columnas.date
	AND smec.tassaroli_columnas.importada IS NULL;

UPDATE smec.tassaroli_columnas
SET exportada = arb1."SMEC EXPORTADA"
FROM (
	SELECT "Date Hour" AS date2
		,"SMEC EXPORTADA"
	FROM smec.tassaroli
	) AS arb1
WHERE arb1.date2 = smec.tassaroli_columnas.date
	AND smec.tassaroli_columnas.exportada IS NULL;

-------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------
DELETE FROM smec.tassaroli_comparacion_smec_po;

INSERT INTO smec.tassaroli_comparacion_smec_po(grupo, date, po_exportada, smec_exportada, diferencia) SELECT smec.po_general_renovables.grupo
	,smec.po_general_renovables.date_hour - interval '1 hour' as date
	,egenerada as po_exportada
	,exportada::numeric(10, 3) as smec_exportada
	,(((abs((egenerada) - (a.exportada::numeric(10,3))) / (COALESCE(NULLIF(((egenerada) + (a.exportada::numeric(10,3))) / 2, 0), 1))) * 100)::NUMERIC(10, 3)) AS diferencia
FROM smec.po_general_renovables
LEFT JOIN (
	SELECT DATE_TRUNC('hour', date - interval '15 minutes') AS date1
		,(sum(exportada)/1000)::numeric(10,3) AS exportada
	FROM smec.tassaroli_columnas
	WHERE date >= DATE_TRUNC('day', now()) - interval '4 years'
		AND date <= DATE_TRUNC('day', now())+ interval '23 hours' - interval '1 days'
	GROUP BY date1
	) AS a ON smec.po_general_renovables.date_hour - interval '1 hour' = a.date1
WHERE date_hour >= DATE_TRUNC('day', now()) - interval '4 years'
	AND date_hour <= DATE_TRUNC('day', now())+ interval '23 hours' - interval '1 days'
	AND grupo = 'HESRFV'
ORDER BY grupo
	,date_hour ON CONFLICT DO NOTHING;
	
-------------------------------------------------------------------------------------------------------------------------------------
DELETE FROM smec.tassaroli_comparacion_smec_po_importada;

INSERT INTO smec.tassaroli_comparacion_smec_po_importada(grupo, date, po_importada, smec_importada, diferencia) SELECT smec.po_general_renovables.grupo
	,smec.po_general_renovables.date_hour - interval '1 hour' as date
	,compra_spot as po_importada
	,importada::numeric(10, 3) as smec_importada
	,(((abs((compra_spot) - (a.importada::numeric(10,3))) / (COALESCE(NULLIF(((compra_spot) + (a.importada::numeric(10,3))) / 2, 0), 1))) * 100)::NUMERIC(10, 3)) AS diferencia
FROM smec.po_general_renovables
LEFT JOIN (
	SELECT DATE_TRUNC('hour', date - interval '15 minutes') AS date1
		,(sum(importada)/1000)::numeric(10,3) AS importada
	FROM smec.tassaroli_columnas
	WHERE date >= DATE_TRUNC('day', now()) - interval '4 years'
		AND date <= DATE_TRUNC('day', now())+ interval '23 hours' - interval '1 days'
	GROUP BY date1
	) AS a ON smec.po_general_renovables.date_hour - interval '1 hour' = a.date1
WHERE date_hour >= DATE_TRUNC('day', now()) - interval '4 years'
	AND date_hour <= DATE_TRUNC('day', now())+ interval '23 hours' - interval '1 days'
	AND grupo = 'HESRFV'
ORDER BY grupo
	,date_hour ON CONFLICT DO NOTHING;
----------------------------------------------------CONSOLIDADOR---------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------
DELETE FROM smec.consolidador_tassaroli ;
DROP TABLE IF EXISTS consolidador_tassaroli_temp;
CREATE TEMP TABLE consolidador_tassaroli_temp (date timestamptz, id text, exportada_cammesa numeric);
INSERT INTO consolidador_tassaroli_temp(date, exportada_cammesa) SELECT DATE_TRUNC('hour',date - interval '15 minutes') as date2, SUM(exportada) FROM smec.tassaroli_columnas GROUP BY date2 order by date2;
UPDATE consolidador_tassaroli_temp SET id = 'HESRFV';
INSERT INTO smec.consolidador_tassaroli SELECT * FROM consolidador_tassaroli_temp ON CONFLICT DO NOTHING;


insert into smec.consolidador_tassaroli (id, date) 
SELECT * FROM smec.tassaroli_ids CROSS JOIN generate_series(DATE_TRUNC('hour', timestamp '2022-03-01 00:00:00'), DATE_TRUNC('hour', now()), '1 hour')  ON CONFLICT DO NOTHING;
----------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------------------------------------
UPDATE smec.consolidador_tassaroli SET exportada_cammesa = exportada_cammesa/1000 ;
UPDATE smec.consolidador_tassaroli SET po_exportada = s.a FROM (SELECT date_hour - interval '1 hour' as date, grupo as id, egenerada as a FROM smec.po_general_renovables WHERE grupo LIKE 'HESRFV') as s WHERE consolidador_tassaroli.date = s.date AND consolidador_tassaroli.id = s.id ;
UPDATE smec.consolidador_tassaroli SET eposible = s.a FROM (SELECT date_hour - interval '1 hour' as date, grupo as id, eposible as a FROM smec.po_general_renovables WHERE grupo LIKE 'HESRFV') as s WHERE consolidador_tassaroli.date = s.date AND consolidador_tassaroli.id = s.id ;


UPDATE smec.consolidador_tassaroli set exportada_cammesa = po_exportada where po_exportada is not null;
--------------------------------------------------------------------------------------------------------------------------------------------

UPDATE smec.consolidador_tassaroli SET cammesa_ppa = s.a FROM (SELECT exportada_cammesa as a, date, id FROM smec.consolidador_tassaroli WHERE exportada_cammesa <= 5 ) as s WHERE s.date = consolidador_tassaroli.date AND s.id = consolidador_tassaroli.id ;
UPDATE smec.consolidador_tassaroli SET cammesa_spot = exportada_cammesa - 5 ;
UPDATE smec.consolidador_tassaroli SET cammesa_spot = 0 WHERE cammesa_spot <= 0 ;
UPDATE smec.consolidador_tassaroli SET cammesa_ppa = 5 WHERE exportada_cammesa >= 5 ;

UPDATE smec.consolidador_tassaroli SET po_ppa = s.a FROM (SELECT po_exportada as a, date, id FROM smec.consolidador_tassaroli WHERE po_exportada <= 5 ) as s WHERE s.date = consolidador_tassaroli.date AND s.id = consolidador_tassaroli.id ;
UPDATE smec.consolidador_tassaroli SET po_spot = po_exportada - 5 ;
UPDATE smec.consolidador_tassaroli SET po_spot = 0 WHERE po_spot <= 0 ;
UPDATE smec.consolidador_tassaroli SET po_ppa = 5 WHERE po_exportada >= 5 ;

