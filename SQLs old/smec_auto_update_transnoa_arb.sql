
DROP TABLE IF EXISTS tmp_smec_arb;
CREATE TEMP TABLE tmp_smec_arb ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '1 days', 'YYYYMMDD');
Begin 
EXECUTE format(
			'COPY tmp_smec_arb (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Administrador\GoesGreen SRL\I4 - AUTOPRN\arrebeef\ARBEM21P_%s.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_arb 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_arb SET id = 'ARBEM21P';
UPDATE tmp_smec_arb SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_arb WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_arb SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_arb WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_arb.hour = hour_part.hour;
UPDATE tmp_smec_arb SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_arb SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_arb) AS date_hour WHERE tmp_smec_arb.hour = date_hour.hour;
ALTER TABLE tmp_smec_arb ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_arb SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_arb WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_arb."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.arb SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_arb ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS tmp_smec_arb;
CREATE TEMP TABLE tmp_smec_arb ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '2 days', 'YYYYMMDD');
Begin 
EXECUTE format(
			'COPY tmp_smec_arb (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Administrador\GoesGreen SRL\I4 - AUTOPRN\arrebeef\ARBEM21P_%s.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_arb 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_arb SET id = 'ARBEM21P';
UPDATE tmp_smec_arb SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_arb WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_arb SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_arb WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_arb.hour = hour_part.hour;
UPDATE tmp_smec_arb SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_arb SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_arb) AS date_hour WHERE tmp_smec_arb.hour = date_hour.hour;
ALTER TABLE tmp_smec_arb ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_arb SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_arb WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_arb."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.arb SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_arb ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS tmp_smec_arb;
CREATE TEMP TABLE tmp_smec_arb ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '3 days', 'YYYYMMDD');
Begin 
EXECUTE format(
			'COPY tmp_smec_arb (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Administrador\GoesGreen SRL\I4 - AUTOPRN\arrebeef\ARBEM21P_%s.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_arb 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_arb SET id = 'ARBEM21P';
UPDATE tmp_smec_arb SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_arb WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_arb SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_arb WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_arb.hour = hour_part.hour;
UPDATE tmp_smec_arb SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_arb SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_arb) AS date_hour WHERE tmp_smec_arb.hour = date_hour.hour;
ALTER TABLE tmp_smec_arb ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_arb SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_arb WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_arb."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.arb SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_arb ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO smec.arb_columnas (
	SELECT "Date Hour" FROM smec.arb WHERE ("Date Hour") NOT IN (
		SELECT date
		FROM smec.arb_columnas
		)
	) ON CONFLICT DO NOTHING;


---------------------------------------------------------------------
UPDATE smec.arb_columnas
SET importada_ARBEM21P = arb1."SMEC IMPORTADA"
FROM (
	SELECT "Date Hour" AS date2
		,"SMEC IMPORTADA"
	FROM smec.arb
	WHERE id = 'ARBEM21P'
	) AS arb1
WHERE arb1.date2 = smec.arb_columnas.date
	AND smec.arb_columnas.importada_ARBEM21P IS NULL;

UPDATE smec.arb_columnas
SET exportada_ARBEM21P = arb1."SMEC EXPORTADA"
FROM (
	SELECT "Date Hour" AS date2
		,"SMEC EXPORTADA"
	FROM smec.arb
	WHERE id = 'ARBEM21P'
	) AS arb1
WHERE arb1.date2 = smec.arb_columnas.date
	AND smec.arb_columnas.exportada_ARBEM21P IS NULL;

-------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------
DELETE FROM smec.arb_comparacion_smec_po;

INSERT INTO smec.arb_comparacion_smec_po(grupo, date, po_exportada, smec_exportada, diferencia) SELECT smec.po_general_renovables.grupo
	,smec.po_general_renovables.date_hour - interval '1 hour' as date
	,egenerada as po_exportada
	,exportada::numeric(10, 3) as smec_exportada
	,(((abs((egenerada) - (a.exportada::numeric(10,3))) / (COALESCE(NULLIF(((egenerada) + (a.exportada::numeric(10,3))) / 2, 0), 1))) * 100)::NUMERIC(10, 3)) AS diferencia
FROM smec.po_general_renovables
LEFT JOIN (
	SELECT DATE_TRUNC('hour', date - interval '15 minutes') AS date1
		,(sum(exportada_ARBEM21P)/1000)::numeric(10,3) AS exportada
	FROM smec.arb_columnas
	WHERE date >= DATE_TRUNC('day', now()) - interval '4 years'
		AND date <= DATE_TRUNC('day', now())+ interval '23 hours' - interval '1 days'
	GROUP BY date1
	) AS a ON smec.po_general_renovables.date_hour - interval '1 hour' = a.date1
WHERE date_hour >= DATE_TRUNC('day', now()) - interval '4 years'
	AND date_hour <= DATE_TRUNC('day', now())+ interval '23 hours' - interval '1 days'
	AND grupo = 'ABEFDI01'
ORDER BY grupo
	,date_hour ON CONFLICT DO NOTHING;
	
-------------------------------------------------------------------------------------------------------------------------------------
DELETE FROM smec.arb_comparacion_smec_po_importada;

INSERT INTO smec.arb_comparacion_smec_po_importada(grupo, date, po_importada, smec_importada, diferencia) SELECT smec.po_general_renovables.grupo
	,smec.po_general_renovables.date_hour - interval '1 hour' as date
	,compra_spot as po_importada
	,importada::numeric(10, 3) as smec_importada
	,(((abs((compra_spot) - (a.importada::numeric(10,3))) / (COALESCE(NULLIF(((compra_spot) + (a.importada::numeric(10,3))) / 2, 0), 1))) * 100)::NUMERIC(10, 3)) AS diferencia
FROM smec.po_general_renovables
LEFT JOIN (
	SELECT DATE_TRUNC('hour', date - interval '15 minutes') AS date1
		,(sum(importada_ARBEM21P)/1000)::numeric(10,3) AS importada
	FROM smec.arb_columnas
	WHERE date >= DATE_TRUNC('day', now()) - interval '4 years'
		AND date <= DATE_TRUNC('day', now())+ interval '23 hours' - interval '1 days'
	GROUP BY date1
	) AS a ON smec.po_general_renovables.date_hour - interval '1 hour' = a.date1
WHERE date_hour >= DATE_TRUNC('day', now()) - interval '4 years'
	AND date_hour <= DATE_TRUNC('day', now())+ interval '23 hours' - interval '1 days'
	AND grupo = 'ABEFDI01'
ORDER BY grupo
	,date_hour ON CONFLICT DO NOTHING;
----------------------------------------------------CONSOLIDADOR---------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------

DELETE FROM smec.consolidador_arb WHERE date >= (now() - interval '7 days');

DROP TABLE IF EXISTS consolidador_arb_temp;
CREATE TEMP TABLE consolidador_arb_temp (date timestamptz, arb text, exportada_cammesa numeric);
INSERT INTO consolidador_arb_temp(date, exportada_cammesa) SELECT DATE_TRUNC('hour',date - interval '15 minutes') as date2, SUM(exportada_ARBEM21P) FROM smec.arb_columnas WHERE date >= (now() - interval '7 days') GROUP BY date2 order by date2;
UPDATE consolidador_arb_temp SET arb = 'ABEFDI01';
INSERT INTO smec.consolidador_arb SELECT * FROM consolidador_arb_temp ON CONFLICT DO NOTHING;


insert into smec.consolidador_arb (arb, date) 
SELECT * from smec.arb_ids CROSS JOIN generate_series(DATE_TRUNC('hour', now() - interval '1 day') ,DATE_TRUNC('hour', now()), '1 hour')  ON CONFLICT DO NOTHING;
----------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------------------------------------
UPDATE smec.consolidador_arb SET exportada_cammesa = exportada_cammesa/1000 WHERE date >= (now() - interval '7 days');
UPDATE smec.consolidador_arb SET po_exportada = s.a FROM (SELECT date_hour - interval '1 hour' as date, grupo as id, egenerada as a FROM smec.po_general_renovables WHERE grupo LIKE 'ABEFDI01') as s WHERE consolidador_arb.date = s.date AND consolidador_arb.arb = s.id AND consolidador_arb.date >= (now() - interval '7 days');


--------------------------------------------------------------------------------------------------------------------------------------------

UPDATE smec.consolidador_arb SET cammesa_ppa = s.a FROM (SELECT exportada_cammesa as a, date, arb FROM smec.consolidador_arb WHERE exportada_cammesa <= 1.5 ) as s WHERE s.date = consolidador_arb.date AND s.arb = consolidador_arb.arb AND consolidador_arb.date >= (now() - interval '7 days');
UPDATE smec.consolidador_arb SET cammesa_spot = exportada_cammesa - 1.5 WHERE date >= (now() - interval '7 days');
UPDATE smec.consolidador_arb SET cammesa_spot = 0 WHERE cammesa_spot <= 0 AND date >= (now() - interval '7 days');
UPDATE smec.consolidador_arb SET cammesa_ppa = 1.5 WHERE exportada_cammesa >= 1.5 AND date >= (now() - interval '7 days');

UPDATE smec.consolidador_arb SET po_ppa = s.a FROM (SELECT po_exportada as a, date, arb FROM smec.consolidador_arb WHERE po_exportada <= 1.5 ) as s WHERE s.date = consolidador_arb.date AND s.arb = consolidador_arb.arb AND consolidador_arb.date >= (now() - interval '7 days');
UPDATE smec.consolidador_arb SET po_spot = po_exportada - 1.5 WHERE date >= (now() - interval '7 days');
UPDATE smec.consolidador_arb SET po_spot = 0 WHERE po_spot <= 0 AND date >= (now() - interval '7 days');
UPDATE smec.consolidador_arb SET po_ppa = 1.5 WHERE po_exportada >= 1.5 AND date >= (now() - interval '7 days');
