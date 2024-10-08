DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '1 days', 'YYYYMMDD');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Administrador\GoesGreen SRL\I4 - AUTOPRN\CAU1M71C_%s.csv''
DELIMITER '',''
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
DECLARE startdate text := to_char(current_date - interval '1 days', 'YYYYMMDD');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Administrador\GoesGreen SRL\I4 - AUTOPRN\CAU1M71P_%s.csv''
DELIMITER '',''
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
DECLARE startdate text := to_char(current_date - interval '1 days', 'YYYYMMDD');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Administrador\GoesGreen SRL\I4 - AUTOPRN\CAU1M72C_%s.csv''
DELIMITER '',''
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
DECLARE startdate text := to_char(current_date - interval '1 days', 'YYYYMMDD');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Administrador\GoesGreen SRL\I4 - AUTOPRN\CAU1M72P_%s.csv''
DELIMITER '',''
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
DECLARE startdate text := to_char(current_date - interval '1 days', 'YYYYMMDD');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Administrador\GoesGreen SRL\I4 - AUTOPRN\CAU1M73C_%s.csv''
DELIMITER '',''
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
DECLARE startdate text := to_char(current_date - interval '1 days', 'YYYYMMDD');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Administrador\GoesGreen SRL\I4 - AUTOPRN\CAU1M73P_%s.csv''
DELIMITER '',''
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
DECLARE startdate text := to_char(current_date - interval '1 days', 'YYYYMMDD');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Administrador\GoesGreen SRL\I4 - AUTOPRN\CAU2M74C_%s.csv''
DELIMITER '',''
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
DECLARE startdate text := to_char(current_date - interval '1 days', 'YYYYMMDD');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Administrador\GoesGreen SRL\I4 - AUTOPRN\CAU2M74P_%s.csv''
DELIMITER '',''
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
DECLARE startdate text := to_char(current_date - interval '1 days', 'YYYYMMDD');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Administrador\GoesGreen SRL\I4 - AUTOPRN\CAU3M75C_%s.csv''
DELIMITER '',''
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
DECLARE startdate text := to_char(current_date - interval '1 days', 'YYYYMMDD');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Administrador\GoesGreen SRL\I4 - AUTOPRN\CAU3M75P_%s.csv''
DELIMITER '',''
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
DECLARE startdate text := to_char(current_date - interval '2 days', 'YYYYMMDD');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Administrador\GoesGreen SRL\I4 - AUTOPRN\CAU1M71C_%s.csv''
DELIMITER '',''
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
DECLARE startdate text := to_char(current_date - interval '2 days', 'YYYYMMDD');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Administrador\GoesGreen SRL\I4 - AUTOPRN\CAU1M71P_%s.csv''
DELIMITER '',''
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
DECLARE startdate text := to_char(current_date - interval '2 days', 'YYYYMMDD');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Administrador\GoesGreen SRL\I4 - AUTOPRN\CAU1M72C_%s.csv''
DELIMITER '',''
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
DECLARE startdate text := to_char(current_date - interval '2 days', 'YYYYMMDD');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Administrador\GoesGreen SRL\I4 - AUTOPRN\CAU1M72P_%s.csv''
DELIMITER '',''
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
DECLARE startdate text := to_char(current_date - interval '2 days', 'YYYYMMDD');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Administrador\GoesGreen SRL\I4 - AUTOPRN\CAU1M73C_%s.csv''
DELIMITER '',''
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
DECLARE startdate text := to_char(current_date - interval '2 days', 'YYYYMMDD');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Administrador\GoesGreen SRL\I4 - AUTOPRN\CAU1M73P_%s.csv''
DELIMITER '',''
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
DECLARE startdate text := to_char(current_date - interval '2 days', 'YYYYMMDD');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Administrador\GoesGreen SRL\I4 - AUTOPRN\CAU2M74C_%s.csv''
DELIMITER '',''
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
DECLARE startdate text := to_char(current_date - interval '2 days', 'YYYYMMDD');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Administrador\GoesGreen SRL\I4 - AUTOPRN\CAU2M74P_%s.csv''
DELIMITER '',''
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
DECLARE startdate text := to_char(current_date - interval '2 days', 'YYYYMMDD');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Administrador\GoesGreen SRL\I4 - AUTOPRN\CAU3M75C_%s.csv''
DELIMITER '',''
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
DECLARE startdate text := to_char(current_date - interval '2 days', 'YYYYMMDD');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Administrador\GoesGreen SRL\I4 - AUTOPRN\CAU3M75P_%s.csv''
DELIMITER '',''
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
DECLARE startdate text := to_char(current_date - interval '3 days', 'YYYYMMDD');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Administrador\GoesGreen SRL\I4 - AUTOPRN\CAU1M71C_%s.csv''
DELIMITER '',''
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
DECLARE startdate text := to_char(current_date - interval '3 days', 'YYYYMMDD');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Administrador\GoesGreen SRL\I4 - AUTOPRN\CAU1M71P_%s.csv''
DELIMITER '',''
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
DECLARE startdate text := to_char(current_date - interval '3 days', 'YYYYMMDD');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Administrador\GoesGreen SRL\I4 - AUTOPRN\CAU1M72C_%s.csv''
DELIMITER '',''
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
DECLARE startdate text := to_char(current_date - interval '3 days', 'YYYYMMDD');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Administrador\GoesGreen SRL\I4 - AUTOPRN\CAU1M72P_%s.csv''
DELIMITER '',''
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
DECLARE startdate text := to_char(current_date - interval '3 days', 'YYYYMMDD');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Administrador\GoesGreen SRL\I4 - AUTOPRN\CAU1M73C_%s.csv''
DELIMITER '',''
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
DECLARE startdate text := to_char(current_date - interval '3 days', 'YYYYMMDD');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Administrador\GoesGreen SRL\I4 - AUTOPRN\CAU1M73P_%s.csv''
DELIMITER '',''
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
DECLARE startdate text := to_char(current_date - interval '3 days', 'YYYYMMDD');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Administrador\GoesGreen SRL\I4 - AUTOPRN\CAU2M74C_%s.csv''
DELIMITER '',''
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
DECLARE startdate text := to_char(current_date - interval '3 days', 'YYYYMMDD');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Administrador\GoesGreen SRL\I4 - AUTOPRN\CAU2M74P_%s.csv''
DELIMITER '',''
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
DECLARE startdate text := to_char(current_date - interval '3 days', 'YYYYMMDD');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Administrador\GoesGreen SRL\I4 - AUTOPRN\CAU3M75C_%s.csv''
DELIMITER '',''
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
DECLARE startdate text := to_char(current_date - interval '3 days', 'YYYYMMDD');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Administrador\GoesGreen SRL\I4 - AUTOPRN\CAU3M75P_%s.csv''
DELIMITER '',''
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
DECLARE startdate text := to_char(current_date - interval '4 days', 'YYYYMMDD');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Administrador\GoesGreen SRL\I4 - AUTOPRN\CAU1M71C_%s.csv''
DELIMITER '',''
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
DECLARE startdate text := to_char(current_date - interval '4 days', 'YYYYMMDD');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Administrador\GoesGreen SRL\I4 - AUTOPRN\CAU1M71P_%s.csv''
DELIMITER '',''
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
DECLARE startdate text := to_char(current_date - interval '4 days', 'YYYYMMDD');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Administrador\GoesGreen SRL\I4 - AUTOPRN\CAU1M72C_%s.csv''
DELIMITER '',''
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
DECLARE startdate text := to_char(current_date - interval '4 days', 'YYYYMMDD');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Administrador\GoesGreen SRL\I4 - AUTOPRN\CAU1M72P_%s.csv''
DELIMITER '',''
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
DECLARE startdate text := to_char(current_date - interval '4 days', 'YYYYMMDD');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Administrador\GoesGreen SRL\I4 - AUTOPRN\CAU1M73C_%s.csv''
DELIMITER '',''
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
DECLARE startdate text := to_char(current_date - interval '4 days', 'YYYYMMDD');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Administrador\GoesGreen SRL\I4 - AUTOPRN\CAU1M73P_%s.csv''
DELIMITER '',''
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
DECLARE startdate text := to_char(current_date - interval '4 days', 'YYYYMMDD');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Administrador\GoesGreen SRL\I4 - AUTOPRN\CAU2M74C_%s.csv''
DELIMITER '',''
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
DECLARE startdate text := to_char(current_date - interval '4 days', 'YYYYMMDD');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Administrador\GoesGreen SRL\I4 - AUTOPRN\CAU2M74P_%s.csv''
DELIMITER '',''
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
DECLARE startdate text := to_char(current_date - interval '4 days', 'YYYYMMDD');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Administrador\GoesGreen SRL\I4 - AUTOPRN\CAU3M75C_%s.csv''
DELIMITER '',''
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
DECLARE startdate text := to_char(current_date - interval '4 days', 'YYYYMMDD');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Administrador\GoesGreen SRL\I4 - AUTOPRN\CAU3M75P_%s.csv''
DELIMITER '',''
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
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '5 days', 'YYYYMMDD');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Administrador\GoesGreen SRL\I4 - AUTOPRN\CAU1M71C_%s.csv''
DELIMITER '',''
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
DECLARE startdate text := to_char(current_date - interval '5 days', 'YYYYMMDD');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Administrador\GoesGreen SRL\I4 - AUTOPRN\CAU1M71P_%s.csv''
DELIMITER '',''
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
DECLARE startdate text := to_char(current_date - interval '5 days', 'YYYYMMDD');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Administrador\GoesGreen SRL\I4 - AUTOPRN\CAU1M72C_%s.csv''
DELIMITER '',''
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
DECLARE startdate text := to_char(current_date - interval '5 days', 'YYYYMMDD');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Administrador\GoesGreen SRL\I4 - AUTOPRN\CAU1M72P_%s.csv''
DELIMITER '',''
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
DECLARE startdate text := to_char(current_date - interval '5 days', 'YYYYMMDD');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Administrador\GoesGreen SRL\I4 - AUTOPRN\CAU1M73C_%s.csv''
DELIMITER '',''
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
DECLARE startdate text := to_char(current_date - interval '5 days', 'YYYYMMDD');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Administrador\GoesGreen SRL\I4 - AUTOPRN\CAU1M73P_%s.csv''
DELIMITER '',''
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
DECLARE startdate text := to_char(current_date - interval '5 days', 'YYYYMMDD');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Administrador\GoesGreen SRL\I4 - AUTOPRN\CAU2M74C_%s.csv''
DELIMITER '',''
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
DECLARE startdate text := to_char(current_date - interval '5 days', 'YYYYMMDD');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Administrador\GoesGreen SRL\I4 - AUTOPRN\CAU2M74P_%s.csv''
DELIMITER '',''
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
DECLARE startdate text := to_char(current_date - interval '5 days', 'YYYYMMDD');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Administrador\GoesGreen SRL\I4 - AUTOPRN\CAU3M75C_%s.csv''
DELIMITER '',''
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
DECLARE startdate text := to_char(current_date - interval '5 days', 'YYYYMMDD');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Administrador\GoesGreen SRL\I4 - AUTOPRN\CAU3M75P_%s.csv''
DELIMITER '',''
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
-------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '6 days', 'YYYYMMDD');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Administrador\GoesGreen SRL\I4 - AUTOPRN\CAU1M71C_%s.csv''
DELIMITER '',''
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
DECLARE startdate text := to_char(current_date - interval '6 days', 'YYYYMMDD');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Administrador\GoesGreen SRL\I4 - AUTOPRN\CAU1M71P_%s.csv''
DELIMITER '',''
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
DECLARE startdate text := to_char(current_date - interval '6 days', 'YYYYMMDD');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Administrador\GoesGreen SRL\I4 - AUTOPRN\CAU1M72C_%s.csv''
DELIMITER '',''
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
DECLARE startdate text := to_char(current_date - interval '6 days', 'YYYYMMDD');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Administrador\GoesGreen SRL\I4 - AUTOPRN\CAU1M72P_%s.csv''
DELIMITER '',''
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
DECLARE startdate text := to_char(current_date - interval '6 days', 'YYYYMMDD');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Administrador\GoesGreen SRL\I4 - AUTOPRN\CAU1M73C_%s.csv''
DELIMITER '',''
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
DECLARE startdate text := to_char(current_date - interval '6 days', 'YYYYMMDD');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Administrador\GoesGreen SRL\I4 - AUTOPRN\CAU1M73P_%s.csv''
DELIMITER '',''
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
DECLARE startdate text := to_char(current_date - interval '6 days', 'YYYYMMDD');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Administrador\GoesGreen SRL\I4 - AUTOPRN\CAU2M74C_%s.csv''
DELIMITER '',''
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
DECLARE startdate text := to_char(current_date - interval '6 days', 'YYYYMMDD');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Administrador\GoesGreen SRL\I4 - AUTOPRN\CAU2M74P_%s.csv''
DELIMITER '',''
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
DECLARE startdate text := to_char(current_date - interval '6 days', 'YYYYMMDD');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Administrador\GoesGreen SRL\I4 - AUTOPRN\CAU3M75C_%s.csv''
DELIMITER '',''
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
DECLARE startdate text := to_char(current_date - interval '6 days', 'YYYYMMDD');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Administrador\GoesGreen SRL\I4 - AUTOPRN\CAU3M75P_%s.csv''
DELIMITER '',''
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
-------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO smec.cauchari_columnas (
	SELECT "Date Hour" FROM smec.cauchari WHERE ("Date Hour") NOT IN (
		SELECT "Date Hour"
		FROM smec.cauchari_columnas
		)
	) ON CONFLICT DO NOTHING;

---------------------------------------------------------------------
UPDATE smec.cauchari_columnas
SET "ENTRANTE_CAU1M71P" = cauchari1."SMEC IMPORTADA"
FROM (
	SELECT "Date Hour" AS date2
		,"SMEC IMPORTADA"
	FROM smec.cauchari
	WHERE id = 'CAU1M71P'
	) AS cauchari1
WHERE cauchari1.date2 = smec.cauchari_columnas."Date Hour"
	AND smec.cauchari_columnas."ENTRANTE_CAU1M71P" IS NULL;

UPDATE smec.cauchari_columnas
SET "SALIDA_CAU1M71P" = cauchari1."SMEC EXPORTADA"
FROM (
	SELECT "Date Hour" AS date2
		,"SMEC EXPORTADA"
	FROM smec.cauchari
	WHERE id = 'CAU1M71P'
	) AS cauchari1
WHERE cauchari1.date2 = smec.cauchari_columnas."Date Hour"
	AND smec.cauchari_columnas."SALIDA_CAU1M71P" IS NULL;

-----------------------------------------------------------------------
---------------------------------------------------------------------
UPDATE smec.cauchari_columnas
SET "ENTRANTE_CAU1M72P" = cauchari1."SMEC IMPORTADA"
FROM (
	SELECT "Date Hour" AS date2
		,"SMEC IMPORTADA"
	FROM smec.cauchari
	WHERE id = 'CAU1M72P'
	) AS cauchari1
WHERE cauchari1.date2 = smec.cauchari_columnas."Date Hour"
	AND smec.cauchari_columnas."ENTRANTE_CAU1M72P" IS NULL;

UPDATE smec.cauchari_columnas
SET "SALIDA_CAU1M72P" = cauchari1."SMEC EXPORTADA"
FROM (
	SELECT "Date Hour" AS date2
		,"SMEC EXPORTADA"
	FROM smec.cauchari
	WHERE id = 'CAU1M72P'
	) AS cauchari1
WHERE cauchari1.date2 = smec.cauchari_columnas."Date Hour"
	AND smec.cauchari_columnas."SALIDA_CAU1M72P" IS NULL;

-----------------------------------------------------------------------
---------------------------------------------------------------------
UPDATE smec.cauchari_columnas
SET "ENTRANTE_CAU1M73P" = cauchari1."SMEC IMPORTADA"
FROM (
	SELECT "Date Hour" AS date2
		,"SMEC IMPORTADA"
	FROM smec.cauchari
	WHERE id = 'CAU1M73P'
	) AS cauchari1
WHERE cauchari1.date2 = smec.cauchari_columnas."Date Hour"
	AND smec.cauchari_columnas."ENTRANTE_CAU1M73P" IS NULL;

UPDATE smec.cauchari_columnas
SET "SALIDA_CAU1M73P" = cauchari1."SMEC EXPORTADA"
FROM (
	SELECT "Date Hour" AS date2
		,"SMEC EXPORTADA"
	FROM smec.cauchari
	WHERE id = 'CAU1M73P'
	) AS cauchari1
WHERE cauchari1.date2 = smec.cauchari_columnas."Date Hour"
	AND smec.cauchari_columnas."SALIDA_CAU1M73P" IS NULL;

-----------------------------------------------------------------------
---------------------------------------------------------------------
UPDATE smec.cauchari_columnas
SET "ENTRANTE_CAU2M74P" = cauchari1."SMEC IMPORTADA"
FROM (
	SELECT "Date Hour" AS date2
		,"SMEC IMPORTADA"
	FROM smec.cauchari
	WHERE id = 'CAU2M74P'
	) AS cauchari1
WHERE cauchari1.date2 = smec.cauchari_columnas."Date Hour"
	AND smec.cauchari_columnas."ENTRANTE_CAU2M74P" IS NULL;

UPDATE smec.cauchari_columnas
SET "SALIDA_CAU2M74P" = cauchari1."SMEC EXPORTADA"
FROM (
	SELECT "Date Hour" AS date2
		,"SMEC EXPORTADA"
	FROM smec.cauchari
	WHERE id = 'CAU2M74P'
	) AS cauchari1
WHERE cauchari1.date2 = smec.cauchari_columnas."Date Hour"
	AND smec.cauchari_columnas."SALIDA_CAU2M74P" IS NULL;

-----------------------------------------------------------------------
---------------------------------------------------------------------
UPDATE smec.cauchari_columnas
SET "ENTRANTE_CAU3M75P" = cauchari1."SMEC IMPORTADA"
FROM (
	SELECT "Date Hour" AS date2
		,"SMEC IMPORTADA"
	FROM smec.cauchari
	WHERE id = 'CAU3M75P'
	) AS cauchari1
WHERE cauchari1.date2 = smec.cauchari_columnas."Date Hour"
	AND smec.cauchari_columnas."ENTRANTE_CAU3M75P" IS NULL;

UPDATE smec.cauchari_columnas
SET "SALIDA_CAU3M75P" = cauchari1."SMEC EXPORTADA"
FROM (
	SELECT "Date Hour" AS date2
		,"SMEC EXPORTADA"
	FROM smec.cauchari
	WHERE id = 'CAU3M75P'
	) AS cauchari1
WHERE cauchari1.date2 = smec.cauchari_columnas."Date Hour"
	AND smec.cauchari_columnas."SALIDA_CAU3M75P" IS NULL;

-----------------------------------------------------------------------

---------------------------------------------------------------------
UPDATE smec.cauchari_columnas
SET "ENTRANTE_CAU1M71C" = cauchari1."SMEC IMPORTADA"
FROM (
	SELECT "Date Hour" AS date2
		,"SMEC IMPORTADA"
	FROM smec.cauchari
	WHERE id = 'CAU1M71C'
	) AS cauchari1
WHERE cauchari1.date2 = smec.cauchari_columnas."Date Hour"
	AND smec.cauchari_columnas."ENTRANTE_CAU1M71C" IS NULL;

UPDATE smec.cauchari_columnas
SET "SALIDA_CAU1M71C" = cauchari1."SMEC EXPORTADA"
FROM (
	SELECT "Date Hour" AS date2
		,"SMEC EXPORTADA"
	FROM smec.cauchari
	WHERE id = 'CAU1M71C'
	) AS cauchari1
WHERE cauchari1.date2 = smec.cauchari_columnas."Date Hour"
	AND smec.cauchari_columnas."SALIDA_CAU1M71C" IS NULL;

-----------------------------------------------------------------------
---------------------------------------------------------------------
UPDATE smec.cauchari_columnas
SET "ENTRANTE_CAU1M72C" = cauchari1."SMEC IMPORTADA"
FROM (
	SELECT "Date Hour" AS date2
		,"SMEC IMPORTADA"
	FROM smec.cauchari
	WHERE id = 'CAU1M72C'
	) AS cauchari1
WHERE cauchari1.date2 = smec.cauchari_columnas."Date Hour"
	AND smec.cauchari_columnas."ENTRANTE_CAU1M72C" IS NULL;

UPDATE smec.cauchari_columnas
SET "SALIDA_CAU1M72C" = cauchari1."SMEC EXPORTADA"
FROM (
	SELECT "Date Hour" AS date2
		,"SMEC EXPORTADA"
	FROM smec.cauchari
	WHERE id = 'CAU1M72C'
	) AS cauchari1
WHERE cauchari1.date2 = smec.cauchari_columnas."Date Hour"
	AND smec.cauchari_columnas."SALIDA_CAU1M72C" IS NULL;

-----------------------------------------------------------------------
---------------------------------------------------------------------
UPDATE smec.cauchari_columnas
SET "ENTRANTE_CAU1M73C" = cauchari1."SMEC IMPORTADA"
FROM (
	SELECT "Date Hour" AS date2
		,"SMEC IMPORTADA"
	FROM smec.cauchari
	WHERE id = 'CAU1M73C'
	) AS cauchari1
WHERE cauchari1.date2 = smec.cauchari_columnas."Date Hour"
	AND smec.cauchari_columnas."ENTRANTE_CAU1M73C" IS NULL;

UPDATE smec.cauchari_columnas
SET "SALIDA_CAU1M73C" = cauchari1."SMEC EXPORTADA"
FROM (
	SELECT "Date Hour" AS date2
		,"SMEC EXPORTADA"
	FROM smec.cauchari
	WHERE id = 'CAU1M73C'
	) AS cauchari1
WHERE cauchari1.date2 = smec.cauchari_columnas."Date Hour"
	AND smec.cauchari_columnas."SALIDA_CAU1M73C" IS NULL;

-----------------------------------------------------------------------
---------------------------------------------------------------------
UPDATE smec.cauchari_columnas
SET "ENTRANTE_CAU2M74C" = cauchari1."SMEC IMPORTADA"
FROM (
	SELECT "Date Hour" AS date2
		,"SMEC IMPORTADA"
	FROM smec.cauchari
	WHERE id = 'CAU2M74C'
	) AS cauchari1
WHERE cauchari1.date2 = smec.cauchari_columnas."Date Hour"
	AND smec.cauchari_columnas."ENTRANTE_CAU2M74C" IS NULL;

UPDATE smec.cauchari_columnas
SET "SALIDA_CAU2M74C" = cauchari1."SMEC EXPORTADA"
FROM (
	SELECT "Date Hour" AS date2
		,"SMEC EXPORTADA"
	FROM smec.cauchari
	WHERE id = 'CAU2M74C'
	) AS cauchari1
WHERE cauchari1.date2 = smec.cauchari_columnas."Date Hour"
	AND smec.cauchari_columnas."SALIDA_CAU2M74C" IS NULL;

-----------------------------------------------------------------------
---------------------------------------------------------------------
UPDATE smec.cauchari_columnas
SET "ENTRANTE_CAU3M75C" = cauchari1."SMEC IMPORTADA"
FROM (
	SELECT "Date Hour" AS date2
		,"SMEC IMPORTADA"
	FROM smec.cauchari
	WHERE id = 'CAU3M75C'
	) AS cauchari1
WHERE cauchari1.date2 = smec.cauchari_columnas."Date Hour"
	AND smec.cauchari_columnas."ENTRANTE_CAU3M75C" IS NULL;

UPDATE smec.cauchari_columnas
SET "SALIDA_CAU3M75C" = cauchari1."SMEC EXPORTADA"
FROM (
	SELECT "Date Hour" AS date2
		,"SMEC EXPORTADA"
	FROM smec.cauchari
	WHERE id = 'CAU3M75C'
	) AS cauchari1
WHERE cauchari1.date2 = smec.cauchari_columnas."Date Hour"
	AND smec.cauchari_columnas."SALIDA_CAU3M75C" IS NULL;

-----------------------------------------------------------------------


DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '1 days', 'YYYYMMDD');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Administrador\GoesGreen SRL\I4 - AUTOPRN\YEXCA01P_%s.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'YEXCA01P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '2 days', 'YYYYMMDD');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Administrador\GoesGreen SRL\I4 - AUTOPRN\YEXCA01P_%s.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'YEXCA01P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '3 days', 'YYYYMMDD');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Administrador\GoesGreen SRL\I4 - AUTOPRN\YEXCA01P_%s.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'YEXCA01P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '4 days', 'YYYYMMDD');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Administrador\GoesGreen SRL\I4 - AUTOPRN\YEXCA01P_%s.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'YEXCA01P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '5 days', 'YYYYMMDD');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Administrador\GoesGreen SRL\I4 - AUTOPRN\YEXCA01P_%s.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'YEXCA01P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_smec_cau;
CREATE TEMP TABLE tmp_smec_cau ("Date Hour" text, "SMEC IMPORTADA" numeric, "SMEC EXPORTADA" numeric, "Tension Media III (V)" numeric, id text, a text, b text, c text, d text, date text, hour text); 

DO $$
DECLARE startdate text := to_char(current_date - interval '6 days', 'YYYYMMDD');
Begin 
EXECUTE format(
			'COPY tmp_smec_cau (hour,
"SMEC IMPORTADA" ,
"SMEC EXPORTADA",
"Tension Media III (V)",
a,
b,
c,
d)
FROM ''C:\Users\Administrador\GoesGreen SRL\I4 - AUTOPRN\YEXCA01P_%s.csv''
DELIMITER '',''
CSV HEADER',
           startdate
        );
END $$ ;

ALTER TABLE tmp_smec_cau 
DROP COLUMN a,
DROP COLUMN b,
DROP COLUMN c,
DROP COLUMN d;

UPDATE tmp_smec_cau SET id = 'YEXCA01P';
UPDATE tmp_smec_cau SET date = date_part.date2 FROM (SELECT split_part(hour,' ',2) as date2 FROM tmp_smec_cau WHERE hour LIKE '%/%' LIMIT 1) as date_part;
UPDATE tmp_smec_cau SET hour = hour_part.hour2 FROM (SELECT split_part(hour,' ',3) as hour2, hour FROM tmp_smec_cau WHERE hour LIKE '%/%') as hour_part WHERE tmp_smec_cau.hour = hour_part.hour;
UPDATE tmp_smec_cau SET hour = '00:00' WHERE hour LIKE '24%';
UPDATE tmp_smec_cau SET "Date Hour" = date_hour.concat FROM (SELECT CONCAT(date,' ', hour), hour FROM tmp_smec_cau) AS date_hour WHERE tmp_smec_cau.hour = date_hour.hour;
ALTER TABLE tmp_smec_cau ALTER COLUMN "Date Hour" TYPE timestamptz USING to_timestamp("Date Hour", 'MM/DD/YY hh24:mi:');

UPDATE tmp_smec_cau SET "Date Hour" = date_hour."Date Hour2" FROM (SELECT ("Date Hour" + interval '1 day') as "Date Hour2" FROM tmp_smec_cau WHERE "Date Hour"::text LIKE '% 00:00:00%') AS date_hour WHERE tmp_smec_cau."Date Hour"::text LIKE '% 00:00:00%';

INSERT INTO smec.cauchari SELECT "Date Hour", "SMEC IMPORTADA", "SMEC EXPORTADA", "Tension Media III (V)", id FROM tmp_smec_cau ON CONFLICT DO NOTHING;
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
UPDATE smec.cauchari_columnas
SET entrante_yex = cauchari1."SMEC IMPORTADA"
FROM (
	SELECT "Date Hour" AS date2
		,"SMEC IMPORTADA"
	FROM smec.cauchari
	WHERE id = 'YEXCA01P'
	) AS cauchari1
WHERE cauchari1.date2 = smec.cauchari_columnas."Date Hour"
	AND smec.cauchari_columnas.entrante_yex IS NULL;

UPDATE smec.cauchari_columnas
SET salida_yex = cauchari1."SMEC EXPORTADA"
FROM (
	SELECT "Date Hour" AS date2
		,"SMEC EXPORTADA"
	FROM smec.cauchari
	WHERE id = 'YEXCA01P'
	) AS cauchari1
WHERE cauchari1.date2 = smec.cauchari_columnas."Date Hour"
	AND smec.cauchari_columnas.salida_yex IS NULL;
	
----------------------------------------------------------------------------------------
UPDATE smec.cauchari_columnas SET "SALIDA_CAU1M72P" = s.a FROM (SELECT "Date Hour", "SALIDA_CAU1M72C" as a FROM smec.cauchari_columnas WHERE "Date Hour" > now() - interval '3 days') as s WHERE "SALIDA_CAU1M72P" IS NULL AND s."Date Hour" = cauchari_columnas."Date Hour";
UPDATE smec.cauchari_columnas SET "SALIDA_CAU1M73P" = s.a FROM (SELECT "Date Hour", "SALIDA_CAU1M73C" as a FROM smec.cauchari_columnas WHERE "Date Hour" > now() - interval '3 days') as s WHERE "SALIDA_CAU1M73P" IS NULL AND s."Date Hour" = cauchari_columnas."Date Hour";
UPDATE smec.cauchari_columnas SET "SALIDA_CAU2M74P" = s.a FROM (SELECT "Date Hour", "SALIDA_CAU2M74C" as a FROM smec.cauchari_columnas WHERE "Date Hour" > now() - interval '3 days') as s WHERE "SALIDA_CAU2M74P" IS NULL AND s."Date Hour" = cauchari_columnas."Date Hour";
UPDATE smec.cauchari_columnas SET "SALIDA_CAU3M75P" = s.a FROM (SELECT "Date Hour", "SALIDA_CAU3M75C" as a FROM smec.cauchari_columnas WHERE "Date Hour" > now() - interval '3 days') as s WHERE "SALIDA_CAU3M75P" IS NULL AND s."Date Hour" = cauchari_columnas."Date Hour";
UPDATE smec.cauchari_columnas SET "SALIDA_CAU1M71P" = s.a FROM (SELECT "Date Hour", "SALIDA_CAU1M71C" as a FROM smec.cauchari_columnas WHERE "Date Hour" > now() - interval '3 days') as s WHERE "SALIDA_CAU1M71P" IS NULL AND s."Date Hour" = cauchari_columnas."Date Hour";

UPDATE smec.cauchari_columnas SET "ENTRANTE_CAU1M72P" = s.a FROM (SELECT "Date Hour", "ENTRANTE_CAU1M72C" as a FROM smec.cauchari_columnas WHERE "Date Hour" > now() - interval '3 days') as s WHERE "ENTRANTE_CAU1M72P" IS NULL AND s."Date Hour" = cauchari_columnas."Date Hour";
UPDATE smec.cauchari_columnas SET "ENTRANTE_CAU1M73P" = s.a FROM (SELECT "Date Hour", "ENTRANTE_CAU1M73C" as a FROM smec.cauchari_columnas WHERE "Date Hour" > now() - interval '3 days') as s WHERE "ENTRANTE_CAU1M73P" IS NULL AND s."Date Hour" = cauchari_columnas."Date Hour";
UPDATE smec.cauchari_columnas SET "ENTRANTE_CAU2M74P" = s.a FROM (SELECT "Date Hour", "ENTRANTE_CAU2M74C" as a FROM smec.cauchari_columnas WHERE "Date Hour" > now() - interval '3 days') as s WHERE "ENTRANTE_CAU2M74P" IS NULL AND s."Date Hour" = cauchari_columnas."Date Hour";
UPDATE smec.cauchari_columnas SET "ENTRANTE_CAU3M75P" = s.a FROM (SELECT "Date Hour", "ENTRANTE_CAU3M75C" as a FROM smec.cauchari_columnas WHERE "Date Hour" > now() - interval '3 days') as s WHERE "ENTRANTE_CAU3M75P" IS NULL AND s."Date Hour" = cauchari_columnas."Date Hour";
UPDATE smec.cauchari_columnas SET "ENTRANTE_CAU1M71P" = s.a FROM (SELECT "Date Hour", "ENTRANTE_CAU1M71C" as a FROM smec.cauchari_columnas WHERE "Date Hour" > now() - interval '3 days') as s WHERE "ENTRANTE_CAU1M71P" IS NULL AND s."Date Hour" = cauchari_columnas."Date Hour";

UPDATE smec.cauchari_columnas SET gen_iny = CASE WHEN (cau1m71P_neto + salida_yex) > 0 THEN (cau1m71P_neto + salida_yex) else 0 END WHERE "Date Hour" > now() - interval '3 days';

UPDATE smec.cauchari_columnas SET cspot_iny = (CASE WHEN (cau1m71P_neto + salida_yex) < 0 THEN (cau1m71P_neto + salida_yex) else 0 END)* -1 WHERE "Date Hour" > now() - interval '3 days';

UPDATE smec.cauchari_columnas SET gen_grupos = CASE WHEN (GREATEST( cau1m72P_neto + cau1m73P_neto, 0 ) + GREATEST( cau2m74P_neto, 0 ) + GREATEST( cau3m75P_neto + salida_yex, 0 ) ) = 0 THEN 1 ELSE (GREATEST( cau1m72P_neto + cau1m73P_neto, 0 ) + GREATEST( cau2m74P_neto, 0 ) + GREATEST( cau3m75P_neto + salida_yex, 0 ) ) END WHERE "Date Hour" > now() - interval '3 days';

UPDATE smec.cauchari_columnas SET cspot_grupos = CASE WHEN (LEAST( cau1m72P_neto + cau1m73P_neto, 0 )* -1 - LEAST( cau2m74P_neto, 0 ) - LEAST( cau3m75P_neto + salida_yex, 0 ) ) = 0 THEN 1 ELSE (LEAST( cau1m72P_neto + cau1m73P_neto, 0 )* -1 - LEAST( cau2m74P_neto, 0 ) - LEAST( cau3m75P_neto + salida_yex, 0 ) ) END WHERE "Date Hour" > now() - interval '3 days';

UPDATE smec.cauchari_columnas SET cau1_exportada = GREATEST( cau1m72P_neto + cau1m73P_neto, 0)/(gen_grupos)*gen_iny WHERE "Date Hour" > now() - interval '3 days';
UPDATE smec.cauchari_columnas SET cau2_exportada = GREATEST( cau2m74P_neto, 0)/(gen_grupos)*gen_iny WHERE "Date Hour" > now() - interval '3 days';
UPDATE smec.cauchari_columnas SET cau3_exportada = GREATEST( cau3m75P_neto + salida_yex, 0)/(gen_grupos)*gen_iny WHERE "Date Hour" > now() - interval '3 days';

UPDATE smec.cauchari_columnas SET cau1_importada_ = -1 * LEAST( cau1m72P_neto + cau1m73P_neto, 0)/(cspot_grupos)*cspot_iny WHERE "Date Hour" > now() - interval '3 days';
UPDATE smec.cauchari_columnas SET cau2_importada = -1 * LEAST( cau2m74P_neto, 0)/(cspot_grupos)*cspot_iny WHERE "Date Hour" > now() - interval '3 days';
UPDATE smec.cauchari_columnas SET cau3_importada = -1 * LEAST( cau3m75P_neto + salida_yex, 0)/(cspot_grupos)*cspot_iny WHERE "Date Hour" > now() - interval '3 days';

INSERT INTO smec.cauchari_columnas_diario (SELECT DATE_TRUNC('day', "Date Hour") AS DATE FROM smec.cauchari_columnas GROUP BY DATE) ON CONFLICT ON CONSTRAINT uc_cauchari_columnas_diario DO NOTHING;

UPDATE smec.cauchari_columnas_diario
SET "SALIDA_CAU1M71P" = s.a
	,"SALIDA_CAU1M71C" = s.b
	,"SALIDA_CAU1M72C" = s.c
	,"SALIDA_CAU1M72P" = s.d
	,"SALIDA_CAU1M73C" = s.e
	,"SALIDA_CAU1M73P" = s.f
	,"SALIDA_CAU2M74C" = s.g
	,"SALIDA_CAU2M74P" = s.h
	,"SALIDA_CAU3M75C" = s.i
	,"SALIDA_CAU3M75P" = s.j
	,dif_salida_CAU1M71 = s.d1
	,dif_salida_CAU1M72 = s.d2
	,dif_salida_CAU1M73 = s.d3
	,dif_salida_CAU2M74 = s.d4
	,dif_salida_CAU3M75 = s.d5
FROM (
	SELECT DATE_TRUNC('day', "Date Hour" - interval '15 minutes') AS DATE
		,SUM("SALIDA_CAU1M71P") AS a
		,SUM("SALIDA_CAU1M71C") AS b
		,SUM("SALIDA_CAU1M72C") AS c
		,SUM("SALIDA_CAU1M72P") AS d
		,SUM("SALIDA_CAU1M73C") AS e
		,SUM("SALIDA_CAU1M73P") AS f
		,SUM("SALIDA_CAU2M74C") AS g
		,SUM("SALIDA_CAU2M74P") AS h
		,SUM("SALIDA_CAU3M75C") AS i
		,SUM("SALIDA_CAU3M75P") AS j
		,((abs((SUM("SALIDA_CAU1M71P") - SUM("SALIDA_CAU1M71C"))) / (COALESCE(NULLIF((SUM("SALIDA_CAU1M71P") + SUM("SALIDA_CAU1M71C")) / 2, 0), 1))) * 100)::NUMERIC(10, 3) AS d1
		,((abs((SUM("SALIDA_CAU1M72P") - SUM("SALIDA_CAU1M72C"))) / (COALESCE(NULLIF((SUM("SALIDA_CAU1M72P") + SUM("SALIDA_CAU1M72C")) / 2, 0), 1))) * 100)::NUMERIC(10, 3) AS d2
		,((abs((SUM("SALIDA_CAU1M73P") - SUM("SALIDA_CAU1M73C"))) / (COALESCE(NULLIF((SUM("SALIDA_CAU1M73P") + SUM("SALIDA_CAU1M73C")) / 2, 0), 1))) * 100)::NUMERIC(10, 3) AS d3
		,((abs((SUM("SALIDA_CAU2M74P") - SUM("SALIDA_CAU2M74C"))) / (COALESCE(NULLIF((SUM("SALIDA_CAU2M74P") + SUM("SALIDA_CAU2M74C")) / 2, 0), 1))) * 100)::NUMERIC(10, 3) AS d4
		,((abs((SUM("SALIDA_CAU3M75P") - SUM("SALIDA_CAU3M75C"))) / (COALESCE(NULLIF((SUM("SALIDA_CAU3M75P") + SUM("SALIDA_CAU3M75C")) / 2, 0), 1))) * 100)::NUMERIC(10, 3) AS d5
	FROM smec.cauchari_columnas
	GROUP BY DATE
	) AS s
WHERE s.DATE = cauchari_columnas_diario."Date Hour";

UPDATE smec.cauchari_columnas_diario
SET dif_salida_CAU1M71 = 200.000
WHERE (
		"SALIDA_CAU1M71P" IS NULL
		AND "Date Hour" < CURRENT_DATE
		)
	OR (
		"SALIDA_CAU1M71C" IS NULL
		AND "Date Hour" < CURRENT_DATE
		);

UPDATE smec.cauchari_columnas_diario
SET dif_salida_CAU1M72 = 200.000
WHERE (
		"SALIDA_CAU1M72P" IS NULL
		AND "Date Hour" < CURRENT_DATE
		)
	OR (
		"SALIDA_CAU1M72C" IS NULL
		AND "Date Hour" < CURRENT_DATE
		);

UPDATE smec.cauchari_columnas_diario
SET dif_salida_CAU1M73 = 200.000
WHERE (
		"SALIDA_CAU1M73P" IS NULL
		AND "Date Hour" < CURRENT_DATE
		)
	OR (
		"SALIDA_CAU1M73C" IS NULL
		AND "Date Hour" < CURRENT_DATE
		);

UPDATE smec.cauchari_columnas_diario
SET dif_salida_CAU2M74 = 200.000
WHERE (
		"SALIDA_CAU2M74P" IS NULL
		AND "Date Hour" < CURRENT_DATE
		)
	OR (
		"SALIDA_CAU2M74C" IS NULL
		AND "Date Hour" < CURRENT_DATE
		);
UPDATE smec.cauchari_columnas_diario
SET dif_salida_CAU3M75 = 200.000
WHERE (
		"SALIDA_CAU3M75P" IS NULL
		AND "Date Hour" < CURRENT_DATE
		)
	OR (
		"SALIDA_CAU3M75C" IS NULL
		AND "Date Hour" < CURRENT_DATE
		);
		
UPDATE smec.cauchari_columnas SET cau3_33kv_calc_salida = s.a FROM (SELECT ("SALIDA_CAU3M75P" + salida_yex - "ENTRANTE_CAU3M75P") as a , "Date Hour" FROM smec.cauchari_columnas) AS s WHERE s."Date Hour" = cauchari_columnas."Date Hour" AND cauchari_columnas."Date Hour" >= '2022-07-09 00:00:00-03';
UPDATE smec.cauchari_columnas SET cau3_33kv_calc_entrada = s.a FROM (SELECT ("ENTRANTE_CAU3M75P" - salida_yex - "SALIDA_CAU3M75P") as a , "Date Hour" FROM smec.cauchari_columnas) AS s WHERE s."Date Hour" = cauchari_columnas."Date Hour" AND cauchari_columnas."Date Hour" >= '2022-07-09 00:00:00-03';

UPDATE smec.cauchari_columnas
SET cau3_33kv_calc_salida = 0 WHERE cauchari_columnas.cau3_33kv_calc_salida < 0 AND cauchari_columnas."Date Hour" >= '2022-07-09 00:00:00-03';

UPDATE smec.cauchari_columnas
SET cau3_33kv_calc_entrada = 0 WHERE cauchari_columnas.cau3_33kv_calc_entrada < 0 AND cauchari_columnas."Date Hour" >= '2022-07-09 00:00:00-03';
------------------------------------------------------------------------------------------
DELETE FROM smec.cauchari_comparacion_smec_po ;

INSERT INTO smec.cauchari_comparacion_smec_po("GRUPO", date, po_exportada, smec_exportada, diferencia) SELECT "GRUPO"
	,smec.po."Date Hour" - interval '1 hour' as date
	,"EGENERADA" as po_exportada
	,exportada::numeric(10, 3) as smec_exportada
	,(((abs(("EGENERADA") - (a.exportada::numeric(10,3))) / (COALESCE(NULLIF((("EGENERADA") + (a.exportada::numeric(10,3))) / 2, 0), 1))) * 100)::NUMERIC(10, 3)) AS diferencia
FROM smec.po
LEFT JOIN (
	SELECT DATE_TRUNC('hour', "Date Hour" - interval '15 minutes') AS date1
		,(sum(cau3_exportada)/1000)::numeric(10,3) AS exportada
	FROM smec.cauchari_columnas
	WHERE "Date Hour" >= DATE_TRUNC('day', now()) - interval '4 years'
		AND "Date Hour" <= DATE_TRUNC('day', now())+ interval '23 hours' - interval '1 days'
	GROUP BY date1
	) AS a ON smec.po."Date Hour" - interval '1 hour' = a.date1
WHERE "Date Hour" >= DATE_TRUNC('day', now()) - interval '4 years'
	AND "Date Hour" <= DATE_TRUNC('day', now())+ interval '23 hours' - interval '1 days'
	AND "GRUPO" = 'CAU3FV'
ORDER BY "GRUPO"
	,"Date Hour" ON CONFLICT DO NOTHING;
	
INSERT INTO smec.cauchari_comparacion_smec_po("GRUPO", date, po_exportada, smec_exportada, diferencia) SELECT "GRUPO"
	,smec.po."Date Hour" - interval '1 hour' as date
	,"EGENERADA" as po_exportada
	,exportada::numeric(10, 3) as smec_exportada
	,(((abs(("EGENERADA") - (a.exportada::numeric(10,3))) / (COALESCE(NULLIF((("EGENERADA") + (a.exportada::numeric(10,3))) / 2, 0), 1))) * 100)::NUMERIC(10, 3)) AS diferencia
FROM smec.po
LEFT JOIN (
	SELECT DATE_TRUNC('hour', "Date Hour" - interval '15 minutes') AS date1
		,(sum(cau1_exportada)/1000)::numeric(10,3) AS exportada
	FROM smec.cauchari_columnas
	WHERE "Date Hour" >= DATE_TRUNC('day', now()) - interval '4 years'
		AND "Date Hour" <= DATE_TRUNC('day', now())+ interval '23 hours' - interval '1 days'
	GROUP BY date1
	) AS a ON smec.po."Date Hour" - interval '1 hour' = a.date1
WHERE "Date Hour" >= DATE_TRUNC('day', now()) - interval '4 years'
	AND "Date Hour" <= DATE_TRUNC('day', now())+ interval '23 hours' - interval '1 days'
	AND "GRUPO" = 'CAU1FV'
ORDER BY "GRUPO"
	,"Date Hour" ON CONFLICT DO NOTHING;

INSERT INTO smec.cauchari_comparacion_smec_po("GRUPO", date, po_exportada, smec_exportada, diferencia) SELECT "GRUPO"
	,smec.po."Date Hour" - interval '1 hour' as date
	,"EGENERADA" as po_exportada
	,exportada::numeric(10, 3) as smec_exportada
	,(((abs(("EGENERADA") - (a.exportada::numeric(10,3))) / (COALESCE(NULLIF((("EGENERADA") + (a.exportada::numeric(10,3))) / 2, 0), 1))) * 100)::NUMERIC(10, 3)) AS diferencia
FROM smec.po
LEFT JOIN (
	SELECT DATE_TRUNC('hour', "Date Hour" - interval '15 minutes') AS date1
		,(sum(cau2_exportada)/1000)::numeric(10,3) AS exportada
	FROM smec.cauchari_columnas
	WHERE "Date Hour" >= DATE_TRUNC('day', now()) - interval '4 years'
		AND "Date Hour" <= DATE_TRUNC('day', now())+ interval '23 hours' - interval '1 days'
	GROUP BY date1
	) AS a ON smec.po."Date Hour" - interval '1 hour' = a.date1
WHERE "Date Hour" >= DATE_TRUNC('day', now()) - interval '4 years'
	AND "Date Hour" <= DATE_TRUNC('day', now())+ interval '23 hours' - interval '1 days'
	AND "GRUPO" = 'CAU2FV'
ORDER BY "GRUPO"
	,"Date Hour" ON CONFLICT DO NOTHING;
	
------------------------------------------------------------------------------------------
DELETE FROM smec.cauchari_comparacion_smec_po_importada;

INSERT INTO smec.cauchari_comparacion_smec_po_importada("GRUPO", date, po_importada, smec_importada, diferencia) SELECT "GRUPO"
	,smec.po."Date Hour" - interval '1 hour' as date
	,"EIMPORTADA" as po_importada
	,importada as smec_importada
	,(((abs(("EIMPORTADA") - (a.importada)) / (COALESCE(NULLIF((("EIMPORTADA") + (a.importada::numeric)) / 2, 0), 1))) * 100)::NUMERIC(10, 3)) AS diferencia
FROM smec.po
LEFT JOIN (
	SELECT DATE_TRUNC('hour', "Date Hour") AS date1
		,(sum(cau1_importada_)/1000) AS importada
	FROM smec.cauchari_columnas
	WHERE "Date Hour" >= DATE_TRUNC('day', now()) - interval '4 years'
		AND "Date Hour" <= DATE_TRUNC('day', now())+ interval '23 hours' - interval '1 days'
	GROUP BY date1
	) AS a ON smec.po."Date Hour" - interval '1 hour' = a.date1
WHERE "Date Hour" >= DATE_TRUNC('day', now()) - interval '4 years'
	AND "Date Hour" <= DATE_TRUNC('day', now())+ interval '23 hours' - interval '1 days'
	AND "GRUPO" = 'CAU1FV'
ORDER BY "GRUPO"
	,"Date Hour" ON CONFLICT DO NOTHING;
------------------------------------------------------------------------------------------------------------------------------
INSERT INTO smec.cauchari_comparacion_smec_po_importada("GRUPO", date, po_importada, smec_importada, diferencia) SELECT "GRUPO"
	,smec.po."Date Hour" - interval '1 hour' as date
	,"EIMPORTADA" as po_importada
	,importada as smec_importada
	,(((abs(("EIMPORTADA") - (a.importada)) / (COALESCE(NULLIF((("EIMPORTADA") + (a.importada::numeric)) / 2, 0), 1))) * 100)::NUMERIC(10, 3)) AS diferencia
FROM smec.po
LEFT JOIN (
	SELECT DATE_TRUNC('hour', "Date Hour") AS date1
		,(sum(cau2_importada)/1000) AS importada
	FROM smec.cauchari_columnas
	WHERE "Date Hour" >= DATE_TRUNC('day', now()) - interval '4 years'
		AND "Date Hour" <= DATE_TRUNC('day', now())+ interval '23 hours' - interval '1 days'
	GROUP BY date1
	) AS a ON smec.po."Date Hour" - interval '1 hour' = a.date1
WHERE "Date Hour" >= DATE_TRUNC('day', now()) - interval '4 years'
	AND "Date Hour" <= DATE_TRUNC('day', now())+ interval '23 hours' - interval '1 days'
	AND "GRUPO" = 'CAU2FV'
ORDER BY "GRUPO"
	,"Date Hour" ON CONFLICT DO NOTHING;
------------------------------------------------------------------------------------------------------------------------------
INSERT INTO smec.cauchari_comparacion_smec_po_importada("GRUPO", date, po_importada, smec_importada, diferencia) SELECT "GRUPO"
	,smec.po."Date Hour" - interval '1 hour' as date
	,"EIMPORTADA" as po_importada
	,importada as smec_importada
	,(((abs(("EIMPORTADA") - (a.importada)) / (COALESCE(NULLIF((("EIMPORTADA") + (a.importada::numeric)) / 2, 0), 1))) * 100)::NUMERIC(10, 3)) AS diferencia
FROM smec.po
LEFT JOIN (
	SELECT DATE_TRUNC('hour', "Date Hour") AS date1
		,(sum(cau3_importada)/1000) AS importada
	FROM smec.cauchari_columnas
	WHERE "Date Hour" >= DATE_TRUNC('day', now()) - interval '4 years'
		AND "Date Hour" <= DATE_TRUNC('day', now())+ interval '23 hours' - interval '1 days'
	GROUP BY date1
	) AS a ON smec.po."Date Hour" - interval '1 hour' = a.date1
WHERE "Date Hour" >= DATE_TRUNC('day', now()) - interval '4 years'
	AND "Date Hour" <= DATE_TRUNC('day', now())+ interval '23 hours' - interval '1 days'
	AND "GRUPO" = 'CAU3FV'
ORDER BY "GRUPO"
	,"Date Hour" ON CONFLICT DO NOTHING;
------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS smec.consolidador_cauchari;
CREATE TABLE smec.consolidador_cauchari (date timestamptz, cau text, exportada_cammesa numeric(10, 3), exportada_scada numeric(10, 3), po_exportada numeric(10, 3));

CREATE UNIQUE INDEX unique_cau1fv_consolidador_cauchari ON smec.consolidador_cauchari (date) WHERE ("cau" = 'CAU1FV');
CREATE UNIQUE INDEX unique_cau2fv_consolidador_cauchari ON smec.consolidador_cauchari (date) WHERE ("cau" = 'CAU2FV');
CREATE UNIQUE INDEX unique_cau3fv_consolidador_cauchari ON smec.consolidador_cauchari (date) WHERE ("cau" = 'CAU3FV');
CREATE UNIQUE INDEX unique_cau345fv_consolidador_cauchari ON smec.consolidador_cauchari (date) WHERE ("cau" = 'CAU345FV');

DROP TABLE IF EXISTS consolidador_cauchari_temp;
CREATE TEMP TABLE consolidador_cauchari_temp (date timestamptz, cau text, exportada_cammesa numeric);
INSERT INTO consolidador_cauchari_temp(date, exportada_cammesa) SELECT DATE_TRUNC('hour',"Date Hour" - interval '15 minutes') as date, SUM(cau1_exportada) FROM smec.cauchari_columnas GROUP BY date order by date;
UPDATE consolidador_cauchari_temp SET cau = 'CAU1FV';
INSERT INTO smec.consolidador_cauchari SELECT * FROM consolidador_cauchari_temp ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS consolidador_cauchari_temp;
CREATE TEMP TABLE consolidador_cauchari_temp (date timestamptz, cau text, exportada_cammesa numeric);
INSERT INTO consolidador_cauchari_temp(date, exportada_cammesa) SELECT DATE_TRUNC('hour',"Date Hour" - interval '15 minutes') as date, SUM(cau2_exportada) FROM smec.cauchari_columnas GROUP BY date order by date;
UPDATE consolidador_cauchari_temp SET cau = 'CAU2FV';
INSERT INTO smec.consolidador_cauchari SELECT * FROM consolidador_cauchari_temp ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS consolidador_cauchari_temp;
CREATE TEMP TABLE consolidador_cauchari_temp (date timestamptz, cau text, exportada_cammesa numeric);
INSERT INTO consolidador_cauchari_temp(date, exportada_cammesa) SELECT DATE_TRUNC('hour',"Date Hour" - interval '15 minutes') as date, SUM(cau3_exportada) FROM smec.cauchari_columnas GROUP BY date order by date;
UPDATE consolidador_cauchari_temp SET cau = 'CAU3FV';
INSERT INTO smec.consolidador_cauchari SELECT * FROM consolidador_cauchari_temp ON CONFLICT DO NOTHING;

insert into smec.consolidador_cauchari (cau, date) 
SELECT * from smec.cau_ids CROSS JOIN generate_series(DATE_TRUNC('hour', now() - interval '1 day') ,DATE_TRUNC('hour', now()), '1 hour')  ON CONFLICT DO NOTHING;
--------------------------------------------------------------------
DROP TABLE IF EXISTS smec.scada_exportada_columnas;
CREATE TABLE smec.scada_exportada_columnas(date timestamptz, cau345fv numeric, cau1fv numeric, cau2fv numeric, cau3fv numeric);

ALTER TABLE smec.scada_exportada_columnas ADD CONSTRAINT uc_scada_exportada_columnas UNIQUE (date);

INSERT INTO smec.scada_exportada_columnas (
	SELECT date FROM smec.scada_exportada WHERE (date) NOT IN (
		SELECT date
		FROM smec.scada_exportada_columnas
		)
	) ON CONFLICT DO NOTHING;

---------------------------------------------------------------------
UPDATE smec.scada_exportada_columnas
SET "cau345fv" = cauchari1.val
FROM (
	SELECT date AS date2
		,val
	FROM smec.scada_exportada
	WHERE id = 'CAU345FV'
	) AS cauchari1
WHERE cauchari1.date2 = smec.scada_exportada_columnas.date
	AND smec.scada_exportada_columnas."cau345fv" IS NULL;


-----------------------------------------------------------------------
UPDATE smec.scada_exportada_columnas
SET "cau1fv" = cauchari1.val
FROM (
	SELECT date AS date2
		,val
	FROM smec.scada_exportada
	WHERE id = 'CAU1FV'
	) AS cauchari1
WHERE cauchari1.date2 = smec.scada_exportada_columnas.date
	AND smec.scada_exportada_columnas."cau1fv" IS NULL;


-----------------------------------------------------------------------
UPDATE smec.scada_exportada_columnas
SET "cau2fv" = cauchari1.val
FROM (
	SELECT date AS date2
		,val
	FROM smec.scada_exportada
	WHERE id = 'CAU2FV'
	) AS cauchari1
WHERE cauchari1.date2 = smec.scada_exportada_columnas.date
	AND smec.scada_exportada_columnas."cau2fv" IS NULL;


-----------------------------------------------------------------------
UPDATE smec.scada_exportada_columnas
SET "cau3fv" = cauchari1.val
FROM (
	SELECT date AS date2
		,val
	FROM smec.scada_exportada
	WHERE id = 'CAU3FV'
	) AS cauchari1
WHERE cauchari1.date2 = smec.scada_exportada_columnas.date
	AND smec.scada_exportada_columnas."cau3fv" IS NULL;


-----------------------------------------------------------------------

ALTER TABLE smec.scada_exportada_columnas ADD COLUMN scada_cau123_total NUMERIC GENERATED ALWAYS AS (cau1fv + cau2fv + cau3fv) STORED;

ALTER TABLE smec.scada_exportada_columnas ADD COLUMN factorc1 NUMERIC;

ALTER TABLE smec.scada_exportada_columnas ADD COLUMN factorc2 NUMERIC;

ALTER TABLE smec.scada_exportada_columnas ADD COLUMN factorc3 NUMERIC;

ALTER TABLE smec.scada_exportada_columnas ADD COLUMN id1 TEXT;

ALTER TABLE smec.scada_exportada_columnas ADD COLUMN id2 TEXT;

ALTER TABLE smec.scada_exportada_columnas ADD COLUMN id3 TEXT;

UPDATE smec.scada_exportada_columnas
SET factorc1 = s.a
	,factorc2 = s.b
	,factorc3 = s.c
FROM (
	SELECT date, (cau1fv / (NULLIF(scada_cau123_total, 0))) AS a
	, (cau2fv / (NULLIF(scada_cau123_total, 0))) AS b
	, (cau3fv / (NULLIF(scada_cau123_total, 0))) AS c
	FROM smec.scada_exportada_columnas) as s WHERE s.date = scada_exportada_columnas.date;

UPDATE smec.scada_exportada_columnas
SET factorc1 = 0 WHERE scada_exportada_columnas.factorc1 IS NULL;

UPDATE smec.scada_exportada_columnas
SET factorc2 = 0 WHERE scada_exportada_columnas.factorc2 IS NULL;

UPDATE smec.scada_exportada_columnas
SET factorc3 = 0 WHERE scada_exportada_columnas.factorc3 IS NULL;

ALTER TABLE smec.scada_exportada_columnas ADD COLUMN cau1_exportada NUMERIC GENERATED ALWAYS AS (factorc1 * cau345fv) STORED;
ALTER TABLE smec.scada_exportada_columnas ADD COLUMN cau2_exportada NUMERIC GENERATED ALWAYS AS (factorc2 * cau345fv) STORED;
ALTER TABLE smec.scada_exportada_columnas ADD COLUMN cau3_exportada NUMERIC GENERATED ALWAYS AS (factorc3 * cau345fv) STORED;
UPDATE smec.scada_exportada_columnas SET id1 = 'CAU1FV';
UPDATE smec.scada_exportada_columnas SET id2 = 'CAU2FV';
UPDATE smec.scada_exportada_columnas SET id3 = 'CAU3FV';

------------------------------------------------------------------------------------------------------------------------------------------
UPDATE smec.consolidador_cauchari SET exportada_scada = s.a FROM (SELECT DATE_TRUNC('hour', date) as date2, id1 as id, SUM(cau1_exportada) as a FROM smec.scada_exportada_columnas GROUP BY date2, id) as s WHERE consolidador_cauchari.date = s.date2 AND consolidador_cauchari.cau = s.id;
UPDATE smec.consolidador_cauchari SET exportada_scada = s.a FROM (SELECT DATE_TRUNC('hour', date) as date2, id2 as id, SUM(cau2_exportada) as a FROM smec.scada_exportada_columnas GROUP BY date2, id) as s WHERE consolidador_cauchari.date = s.date2 AND consolidador_cauchari.cau = s.id;
UPDATE smec.consolidador_cauchari SET exportada_scada = s.a FROM (SELECT DATE_TRUNC('hour', date) as date2, id3 as id, SUM(cau3_exportada) as a FROM smec.scada_exportada_columnas GROUP BY date2, id) as s WHERE consolidador_cauchari.date = s.date2 AND consolidador_cauchari.cau = s.id;

UPDATE smec.consolidador_cauchari SET po_exportada = s.a FROM (SELECT "Date Hour" - interval '1 hour' as date, "GRUPO" as id, "EGENERADA" as a FROM smec.po WHERE "GRUPO" LIKE 'CAU%') as s WHERE consolidador_cauchari.date = s.date AND consolidador_cauchari.cau = s.id;

UPDATE smec.consolidador_cauchari SET exportada_cammesa = exportada_cammesa/1000 ;
UPDATE smec.consolidador_cauchari SET exportada_scada = exportada_scada/1000 ;

--------------------------------------------------------------------------------------------------------------------------------------------
ALTER TABLE smec.consolidador_cauchari ADD COLUMN cammesa_ppa NUMERIC;
ALTER TABLE smec.consolidador_cauchari ADD COLUMN cammesa_spot NUMERIC;

UPDATE smec.consolidador_cauchari SET cammesa_ppa = s.a FROM (SELECT exportada_cammesa as a, date, cau FROM smec.consolidador_cauchari WHERE exportada_cammesa <= 100 ) as s WHERE s.date = consolidador_cauchari.date AND s.cau = consolidador_cauchari.cau;
UPDATE smec.consolidador_cauchari SET cammesa_spot = exportada_cammesa - 100;
UPDATE smec.consolidador_cauchari SET cammesa_spot = 0 WHERE cammesa_spot <= 0;
UPDATE smec.consolidador_cauchari SET cammesa_ppa = 100 WHERE exportada_cammesa >= 100;

ALTER TABLE smec.consolidador_cauchari ADD COLUMN scada_ppa NUMERIC;
ALTER TABLE smec.consolidador_cauchari ADD COLUMN scada_spot NUMERIC;

UPDATE smec.consolidador_cauchari SET scada_ppa = s.a FROM (SELECT exportada_scada as a, date, cau FROM smec.consolidador_cauchari WHERE exportada_scada <= 100 ) as s WHERE s.date = consolidador_cauchari.date AND s.cau = consolidador_cauchari.cau;
UPDATE smec.consolidador_cauchari SET scada_spot = exportada_scada - 100;
UPDATE smec.consolidador_cauchari SET scada_spot = 0 WHERE scada_spot <= 0;
UPDATE smec.consolidador_cauchari SET scada_ppa = 100 WHERE exportada_scada >= 100;

ALTER TABLE smec.consolidador_cauchari ADD COLUMN po_ppa NUMERIC;
ALTER TABLE smec.consolidador_cauchari ADD COLUMN po_spot NUMERIC;

UPDATE smec.consolidador_cauchari SET po_ppa = s.a FROM (SELECT po_exportada as a, date, cau FROM smec.consolidador_cauchari WHERE po_exportada <= 100 ) as s WHERE s.date = consolidador_cauchari.date AND s.cau = consolidador_cauchari.cau;
UPDATE smec.consolidador_cauchari SET po_spot = po_exportada - 100;
UPDATE smec.consolidador_cauchari SET po_spot = 0 WHERE po_spot <= 0;
UPDATE smec.consolidador_cauchari SET po_ppa = 100 WHERE po_exportada >= 100;

UPDATE smec.consolidador_cauchari SET cammesa_spot = exportada_cammesa WHERE date < '2020-09-26 00:00:00-03';
UPDATE smec.consolidador_cauchari SET scada_spot = exportada_scada WHERE date < '2020-09-26 00:00:00-03';
UPDATE smec.consolidador_cauchari SET po_spot = po_exportada WHERE date < '2020-09-26 00:00:00-03';

UPDATE smec.consolidador_cauchari SET cammesa_ppa = 0 WHERE date < '2020-09-26 00:00:00-03';
UPDATE smec.consolidador_cauchari SET scada_ppa = 0 WHERE date < '2020-09-26 00:00:00-03';
UPDATE smec.consolidador_cauchari SET po_ppa = 0 WHERE date < '2020-09-26 00:00:00-03'; 

ALTER TABLE smec.consolidador_cauchari ADD COLUMN consumo_cammesa numeric;
UPDATE smec.consolidador_cauchari SET consumo_cammesa = s.a FROM (SELECT DATE_TRUNC('hour', "Date Hour") as date2, SUM(cau1_importada_)/1000 as a FROM smec.cauchari_columnas GROUP BY date2) as s WHERE consolidador_cauchari.date = s.date2 AND consolidador_cauchari.cau = 'CAU1FV';
UPDATE smec.consolidador_cauchari SET consumo_cammesa = s.a FROM (SELECT DATE_TRUNC('hour', "Date Hour") as date2, SUM(cau2_importada)/1000 as a FROM smec.cauchari_columnas GROUP BY date2) as s WHERE consolidador_cauchari.date = s.date2 AND consolidador_cauchari.cau = 'CAU2FV';
UPDATE smec.consolidador_cauchari SET consumo_cammesa = s.a FROM (SELECT DATE_TRUNC('hour', "Date Hour") as date2, SUM(cau3_importada)/1000 as a FROM smec.cauchari_columnas GROUP BY date2) as s WHERE consolidador_cauchari.date = s.date2 AND consolidador_cauchari.cau = 'CAU3FV';