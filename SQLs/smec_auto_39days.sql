DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '7 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M71C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M71C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '7 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M71P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M71P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '7 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M72C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M72C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '7 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M72P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M72P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '7 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M73C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M73C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '7 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M73P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M73P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '7 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU2M74C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU2M74C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '7 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU2M74P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU2M74P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '7 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU3M75C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU3M75C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '7 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU3M75P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU3M75P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------


DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '8 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M71C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M71C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '8 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M71P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M71P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '8 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M72C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M72C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '8 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M72P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M72P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '8 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M73C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M73C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '8 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M73P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M73P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '8 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU2M74C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU2M74C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '8 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU2M74P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU2M74P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '8 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU3M75C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU3M75C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '8 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU3M75P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU3M75P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '9 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M71C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M71C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '9 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M71P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M71P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '9 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M72C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M72C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '9 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M72P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M72P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '9 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M73C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M73C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '9 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M73P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M73P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '9 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU2M74C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU2M74C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '9 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU2M74P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU2M74P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '9 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU3M75C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU3M75C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '9 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU3M75P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU3M75P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '10 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M71C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M71C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '10 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M71P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M71P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '10 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M72C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M72C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '10 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M72P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M72P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '10 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M73C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M73C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '10 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M73P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M73P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '10 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU2M74C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU2M74C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '10 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU2M74P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU2M74P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '10 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU3M75C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU3M75C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '10 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU3M75P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU3M75P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------


DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '11 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M71C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M71C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '11 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M71P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M71P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '11 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M72C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M72C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '11 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M72P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M72P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '11 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M73C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M73C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '11 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M73P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M73P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '11 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU2M74C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU2M74C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '11 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU2M74P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU2M74P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '11 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU3M75C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU3M75C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '11 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU3M75P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU3M75P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '12 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M71C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M71C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '12 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M71P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M71P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '12 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M72C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M72C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '12 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M72P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M72P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '12 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M73C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M73C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '12 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M73P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M73P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '12 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU2M74C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU2M74C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '12 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU2M74P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU2M74P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '12 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU3M75C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU3M75C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '12 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU3M75P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU3M75P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '13 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M71C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M71C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '13 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M71P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M71P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '13 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M72C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M72C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '13 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M72P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M72P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '13 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M73C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M73C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '13 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M73P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M73P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '13 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU2M74C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU2M74C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '13 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU2M74P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU2M74P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '13 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU3M75C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU3M75C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '13 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU3M75P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU3M75P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------


DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '14 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M71C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M71C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '14 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M71P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M71P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '14 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M72C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M72C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '14 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M72P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M72P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '14 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M73C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M73C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '14 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M73P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M73P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '14 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU2M74C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU2M74C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '14 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU2M74P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU2M74P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '14 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU3M75C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU3M75C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '14 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU3M75P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU3M75P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '15 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M71C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M71C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '15 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M71P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M71P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '15 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M72C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M72C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '15 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M72P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M72P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '15 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M73C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M73C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '15 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M73P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M73P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '15 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU2M74C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU2M74C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '15 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU2M74P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU2M74P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '15 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU3M75C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU3M75C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '15 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU3M75P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU3M75P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '16 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M71C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M71C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '16 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M71P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M71P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '16 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M72C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M72C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '16 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M72P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M72P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '16 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M73C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M73C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '16 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M73P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M73P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '16 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU2M74C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU2M74C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '16 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU2M74P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU2M74P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '16 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU3M75C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU3M75C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '16 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU3M75P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU3M75P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------


DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '17 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M71C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M71C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '17 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M71P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M71P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '17 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M72C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M72C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '17 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M72P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M72P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '17 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M73C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M73C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '17 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M73P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M73P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '17 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU2M74C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU2M74C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '17 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU2M74P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU2M74P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '17 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU3M75C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU3M75C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '17 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU3M75P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU3M75P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '18 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M71C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M71C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '18 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M71P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M71P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '18 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M72C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M72C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '18 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M72P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M72P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '18 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M73C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M73C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '18 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M73P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M73P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '18 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU2M74C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU2M74C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '18 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU2M74P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU2M74P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '18 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU3M75C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU3M75C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '18 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU3M75P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU3M75P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '19 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M71C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M71C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '19 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M71P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M71P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '19 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M72C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M72C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '19 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M72P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M72P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '19 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M73C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M73C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '19 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M73P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M73P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '19 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU2M74C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU2M74C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '19 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU2M74P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU2M74P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '19 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU3M75C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU3M75C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '19 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU3M75P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU3M75P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------


DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '20 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M71C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M71C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '20 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M71P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M71P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '20 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M72C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M72C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '20 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M72P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M72P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '20 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M73C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M73C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '20 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M73P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M73P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '20 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU2M74C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU2M74C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '20 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU2M74P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU2M74P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '20 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU3M75C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU3M75C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '20 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU3M75P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU3M75P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '21 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M71C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M71C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '21 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M71P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M71P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '21 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M72C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M72C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '21 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M72P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M72P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '21 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M73C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M73C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '21 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M73P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M73P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '21 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU2M74C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU2M74C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '21 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU2M74P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU2M74P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '21 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU3M75C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU3M75C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '21 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU3M75P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU3M75P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '22 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M71C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M71C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '22 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M71P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M71P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '22 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M72C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M72C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '22 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M72P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M72P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '22 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M73C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M73C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '22 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M73P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M73P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '22 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU2M74C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU2M74C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '22 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU2M74P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU2M74P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '22 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU3M75C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU3M75C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '22 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU3M75P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU3M75P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------


DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '23 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M71C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M71C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '23 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M71P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M71P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '23 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M72C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M72C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '23 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M72P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M72P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '23 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M73C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M73C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '23 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M73P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M73P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '23 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU2M74C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU2M74C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '23 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU2M74P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU2M74P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '23 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU3M75C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU3M75C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '23 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU3M75P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU3M75P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '24 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M71C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M71C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '24 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M71P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M71P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '24 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M72C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M72C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '24 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M72P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M72P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '24 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M73C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M73C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '24 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M73P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M73P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '24 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU2M74C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU2M74C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '24 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU2M74P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU2M74P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '24 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU3M75C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU3M75C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '24 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU3M75P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU3M75P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '25 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M71C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M71C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '25 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M71P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M71P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '25 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M72C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M72C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '25 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M72P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M72P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '25 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M73C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M73C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '25 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M73P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M73P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '25 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU2M74C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU2M74C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '25 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU2M74P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU2M74P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '25 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU3M75C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU3M75C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '25 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU3M75P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU3M75P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------


DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '26 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M71C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M71C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '26 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M71P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M71P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '26 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M72C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M72C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '26 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M72P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M72P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '26 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M73C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M73C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '26 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M73P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M73P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '26 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU2M74C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU2M74C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '26 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU2M74P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU2M74P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '26 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU3M75C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU3M75C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '26 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU3M75P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU3M75P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '27 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M71C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M71C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '27 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M71P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M71P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '27 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M72C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M72C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '27 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M72P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M72P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '27 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M73C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M73C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '27 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M73P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M73P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '27 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU2M74C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU2M74C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '27 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU2M74P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU2M74P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '27 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU3M75C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU3M75C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '27 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU3M75P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU3M75P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '28 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M71C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M71C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '28 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M71P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M71P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '28 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M72C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M72C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '28 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M72P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M72P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '28 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M73C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M73C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '28 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M73P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M73P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '28 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU2M74C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU2M74C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '28 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU2M74P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU2M74P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '28 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU3M75C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU3M75C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '28 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU3M75P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU3M75P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------


DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '29 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M71C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M71C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '29 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M71P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M71P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '29 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M72C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M72C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '29 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M72P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M72P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '29 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M73C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M73C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '29 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M73P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M73P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '29 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU2M74C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU2M74C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '29 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU2M74P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU2M74P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '29 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU3M75C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU3M75C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '29 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU3M75P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU3M75P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '30 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M71C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M71C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '30 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M71P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M71P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '30 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M72C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M72C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '30 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M72P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M72P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '30 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M73C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M73C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '30 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M73P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M73P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '30 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU2M74C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU2M74C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '30 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU2M74P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU2M74P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '30 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU3M75C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU3M75C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '30 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU3M75P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU3M75P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '31 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M71C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M71C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '31 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M71P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M71P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '31 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M72C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M72C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '31 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M72P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M72P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '31 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M73C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M73C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '31 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M73P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M73P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '31 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU2M74C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU2M74C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '31 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU2M74P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU2M74P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '31 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU3M75C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU3M75C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '31 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU3M75P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU3M75P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------


DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '32 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M71C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M71C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '32 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M71P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M71P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '32 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M72C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M72C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '32 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M72P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M72P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '32 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M73C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M73C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '32 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M73P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M73P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '32 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU2M74C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU2M74C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '32 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU2M74P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU2M74P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '32 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU3M75C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU3M75C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '32 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU3M75P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU3M75P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '33 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M71C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M71C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '33 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M71P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M71P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '33 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M72C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M72C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '33 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M72P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M72P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '33 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M73C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M73C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '33 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M73P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M73P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '33 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU2M74C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU2M74C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '33 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU2M74P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU2M74P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '33 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU3M75C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU3M75C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '33 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU3M75P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU3M75P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '34 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M71C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M71C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '34 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M71P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M71P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '34 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M72C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M72C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '34 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M72P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M72P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '34 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M73C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M73C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '34 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M73P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M73P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '34 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU2M74C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU2M74C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '34 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU2M74P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU2M74P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '34 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU3M75C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU3M75C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '34 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU3M75P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU3M75P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------


DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '35 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M71C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M71C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '35 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M71P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M71P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '35 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M72C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M72C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '35 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M72P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M72P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '35 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M73C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M73C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '35 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M73P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M73P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '35 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU2M74C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU2M74C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '35 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU2M74P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU2M74P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '35 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU3M75C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU3M75C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '35 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU3M75P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU3M75P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '36 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M71C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M71C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '36 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M71P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M71P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '36 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M72C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M72C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '36 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M72P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M72P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '36 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M73C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M73C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '36 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M73P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M73P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '36 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU2M74C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU2M74C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '36 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU2M74P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU2M74P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '36 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU3M75C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU3M75C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '36 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU3M75P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU3M75P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '37 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M71C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M71C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '37 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M71P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M71P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '37 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M72C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M72C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '37 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M72P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M72P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '37 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M73C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M73C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '37 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M73P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M73P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '37 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU2M74C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU2M74C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '37 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU2M74P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU2M74P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '37 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU3M75C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU3M75C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '37 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU3M75P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU3M75P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------


DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '38 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M71C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M71C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '38 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M71P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M71P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '38 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M72C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M72C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '38 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M72P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M72P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '38 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M73C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M73C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '38 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M73P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M73P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '38 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU2M74C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU2M74C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '38 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU2M74P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU2M74P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '38 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU3M75C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU3M75C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '38 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU3M75P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU3M75P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '39 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M71C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M71C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '39 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M71P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M71P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '39 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M72C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M72C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '39 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M72P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M72P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '39 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M73C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M73C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '39 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M73P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M73P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '39 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU2M74C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU2M74C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '39 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU2M74P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU2M74P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '39 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU3M75C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU3M75C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '39 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU3M75P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU3M75P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '40 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M71C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M71C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '40 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M71P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M71P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '40 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M72C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M72C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '40 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M72P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M72P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '40 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M73C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M73C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '40 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M73P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M73P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '40 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU2M74C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU2M74C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '40 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU2M74P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU2M74P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '40 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU3M75C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU3M75C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '40 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU3M75P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU3M75P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------


DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '41 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M71C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M71C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '41 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M71P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M71P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '41 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M72C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M72C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '41 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M72P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M72P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '41 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M73C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M73C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '41 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M73P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M73P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '41 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU2M74C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU2M74C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '41 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU2M74P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU2M74P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '41 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU3M75C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU3M75C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '41 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU3M75P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU3M75P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '42 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M71C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M71C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '42 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M71P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M71P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '42 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M72C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M72C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '42 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M72P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M72P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '42 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M73C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M73C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '42 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M73P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M73P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '42 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU2M74C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU2M74C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '42 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU2M74P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU2M74P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '42 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU3M75C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU3M75C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '42 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU3M75P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU3M75P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '43 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M71C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M71C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '43 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M71P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M71P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '43 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M72C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M72C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '43 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M72P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M72P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '43 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M73C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M73C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '43 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M73P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M73P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '43 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU2M74C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU2M74C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '43 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU2M74P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU2M74P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '43 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU3M75C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU3M75C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '43 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU3M75P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU3M75P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------


DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '44 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M71C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M71C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '44 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M71P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M71P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '44 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M72C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M72C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '44 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M72P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M72P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '44 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M73C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M73C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '44 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M73P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M73P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '44 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU2M74C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU2M74C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '44 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU2M74P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU2M74P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '44 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU3M75C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU3M75C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '44 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU3M75P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU3M75P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '45 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M71C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M71C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '45 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M71P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M71P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '45 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M72C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M72C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '45 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M72P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M72P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '45 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M73C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M73C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '45 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M73P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M73P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '45 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU2M74C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU2M74C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '45 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU2M74P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU2M74P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '45 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU3M75C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU3M75C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '45 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU3M75P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU3M75P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '46 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M71C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M71C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '46 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M71P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M71P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '46 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M72C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M72C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '46 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M72P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M72P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '46 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M73C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M73C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '46 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M73P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M73P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '46 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU2M74C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU2M74C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '46 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU2M74P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU2M74P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '46 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU3M75C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU3M75C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '46 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU3M75P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU3M75P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------


DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '47 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M71C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M71C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '47 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M71P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M71P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '47 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M72C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M72C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '47 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M72P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M72P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '47 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M73C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M73C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '47 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M73P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M73P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '47 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU2M74C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU2M74C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '47 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU2M74P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU2M74P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '47 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU3M75C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU3M75C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '47 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU3M75P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU3M75P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '48 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M71C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M71C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '48 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M71P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M71P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '48 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M72C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M72C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '48 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M72P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M72P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '48 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M73C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M73C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '48 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M73P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M73P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '48 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU2M74C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU2M74C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '48 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU2M74P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU2M74P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '48 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU3M75C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU3M75C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '48 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU3M75P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU3M75P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '49 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M71C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M71C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '49 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M71P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M71P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '49 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M72C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M72C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '49 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M72P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M72P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '49 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M73C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M73C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '49 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M73P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M73P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '49 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU2M74C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU2M74C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '49 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU2M74P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU2M74P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '49 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU3M75C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU3M75C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '49 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU3M75P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU3M75P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------


DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '50 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M71C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M71C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '50 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M71P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M71P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '50 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M72C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M72C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '50 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M72P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M72P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '50 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M73C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M73C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '50 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M73P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M73P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '50 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU2M74C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU2M74C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '50 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU2M74P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU2M74P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '50 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU3M75C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU3M75C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '50 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU3M75P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU3M75P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '51 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M71C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M71C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '51 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M71P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M71P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '51 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M72C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M72C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '51 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M72P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M72P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '51 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M73C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M73C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '51 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU1M73P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU1M73P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '51 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU2M74C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU2M74C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '51 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU2M74P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU2M74P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '51 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU3M75C.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU3M75C';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '51 days', 'DD_MM_YY');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Server01\GoesGreen SRL\Cauchari AM - AUTOPRN\RV_ PRN SMEC %s CAU3M75P.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'CAU3M75P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------------------
