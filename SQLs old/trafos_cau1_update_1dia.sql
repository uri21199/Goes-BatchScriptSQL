DELETE FROM alert_cau.caupotenciatrafos_cau1fv WHERE date >= now() - interval '20 minutes';
DROP TABLE IF EXISTS stage_trafos_cau_1;
DROP TABLE IF EXISTS stage_trafos_cau_12;


CREATE TEMP TABLE stage_trafos_cau_1(x jsonb);
CREATE TEMP TABLE stage_trafos_cau_12(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau_1 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/60e39524-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau_12 select f.* from stage_trafos_cau_1, jsonb_populate_recordset(null::stage_trafos_cau_12, x) f;
UPDATE stage_trafos_cau_12 SET cau = 'cau1fv';
UPDATE stage_trafos_cau_12 SET id = 'A01';
UPDATE stage_trafos_cau_12 SET date = DATE_TRUNC('minute', date);
INSERT INTO alert_cau.caupotenciatrafos_cau1fv SELECT * from stage_trafos_cau_12 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau_1;
DROP TABLE IF EXISTS stage_trafos_cau_12;

CREATE TEMP TABLE stage_trafos_cau_1(x jsonb);
CREATE TEMP TABLE stage_trafos_cau_12(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau_1 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/61444e0a-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau_12 select f.* from stage_trafos_cau_1, jsonb_populate_recordset(null::stage_trafos_cau_12, x) f;
UPDATE stage_trafos_cau_12 SET cau = 'cau1fv';
UPDATE stage_trafos_cau_12 SET id = 'A02';
UPDATE stage_trafos_cau_12 SET date = DATE_TRUNC('minute', date);
INSERT INTO alert_cau.caupotenciatrafos_cau1fv SELECT * from stage_trafos_cau_12 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau_1;
DROP TABLE IF EXISTS stage_trafos_cau_12;

CREATE TEMP TABLE stage_trafos_cau_1(x jsonb);
CREATE TEMP TABLE stage_trafos_cau_12(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau_1 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/61a645ec-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau_12 select f.* from stage_trafos_cau_1, jsonb_populate_recordset(null::stage_trafos_cau_12, x) f;
UPDATE stage_trafos_cau_12 SET cau = 'cau1fv';
UPDATE stage_trafos_cau_12 SET id = 'A03';
UPDATE stage_trafos_cau_12 SET date = DATE_TRUNC('minute', date);
INSERT INTO alert_cau.caupotenciatrafos_cau1fv SELECT * from stage_trafos_cau_12 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau_1;
DROP TABLE IF EXISTS stage_trafos_cau_12;

CREATE TEMP TABLE stage_trafos_cau_1(x jsonb);
CREATE TEMP TABLE stage_trafos_cau_12(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau_1 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/6205b05e-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau_12 select f.* from stage_trafos_cau_1, jsonb_populate_recordset(null::stage_trafos_cau_12, x) f;
UPDATE stage_trafos_cau_12 SET cau = 'cau1fv';
UPDATE stage_trafos_cau_12 SET id = 'A04';
UPDATE stage_trafos_cau_12 SET date = DATE_TRUNC('minute', date);
INSERT INTO alert_cau.caupotenciatrafos_cau1fv SELECT * from stage_trafos_cau_12 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau_1;
DROP TABLE IF EXISTS stage_trafos_cau_12;

CREATE TEMP TABLE stage_trafos_cau_1(x jsonb);
CREATE TEMP TABLE stage_trafos_cau_12(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau_1 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/6267127c-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau_12 select f.* from stage_trafos_cau_1, jsonb_populate_recordset(null::stage_trafos_cau_12, x) f;
UPDATE stage_trafos_cau_12 SET cau = 'cau1fv';
UPDATE stage_trafos_cau_12 SET id = 'A05';
UPDATE stage_trafos_cau_12 SET date = DATE_TRUNC('minute', date);
INSERT INTO alert_cau.caupotenciatrafos_cau1fv SELECT * from stage_trafos_cau_12 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau_1;
DROP TABLE IF EXISTS stage_trafos_cau_12;

CREATE TEMP TABLE stage_trafos_cau_1(x jsonb);
CREATE TEMP TABLE stage_trafos_cau_12(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau_1 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/62c73a9e-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau_12 select f.* from stage_trafos_cau_1, jsonb_populate_recordset(null::stage_trafos_cau_12, x) f;
UPDATE stage_trafos_cau_12 SET cau = 'cau1fv';
UPDATE stage_trafos_cau_12 SET id = 'A06';
UPDATE stage_trafos_cau_12 SET date = DATE_TRUNC('minute', date);
INSERT INTO alert_cau.caupotenciatrafos_cau1fv SELECT * from stage_trafos_cau_12 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau_1;
DROP TABLE IF EXISTS stage_trafos_cau_12;

CREATE TEMP TABLE stage_trafos_cau_1(x jsonb);
CREATE TEMP TABLE stage_trafos_cau_12(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau_1 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/63277526-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau_12 select f.* from stage_trafos_cau_1, jsonb_populate_recordset(null::stage_trafos_cau_12, x) f;
UPDATE stage_trafos_cau_12 SET cau = 'cau1fv';
UPDATE stage_trafos_cau_12 SET id = 'A07';
UPDATE stage_trafos_cau_12 SET date = DATE_TRUNC('minute', date);
INSERT INTO alert_cau.caupotenciatrafos_cau1fv SELECT * from stage_trafos_cau_12 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau_1;
DROP TABLE IF EXISTS stage_trafos_cau_12;

CREATE TEMP TABLE stage_trafos_cau_1(x jsonb);
CREATE TEMP TABLE stage_trafos_cau_12(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau_1 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/638796d6-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau_12 select f.* from stage_trafos_cau_1, jsonb_populate_recordset(null::stage_trafos_cau_12, x) f;
UPDATE stage_trafos_cau_12 SET cau = 'cau1fv';
UPDATE stage_trafos_cau_12 SET id = 'A08';
UPDATE stage_trafos_cau_12 SET date = DATE_TRUNC('minute', date);
INSERT INTO alert_cau.caupotenciatrafos_cau1fv SELECT * from stage_trafos_cau_12 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau_1;
DROP TABLE IF EXISTS stage_trafos_cau_12;

CREATE TEMP TABLE stage_trafos_cau_1(x jsonb);
CREATE TEMP TABLE stage_trafos_cau_12(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau_1 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/63e89864-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau_12 select f.* from stage_trafos_cau_1, jsonb_populate_recordset(null::stage_trafos_cau_12, x) f;
UPDATE stage_trafos_cau_12 SET cau = 'cau1fv';
UPDATE stage_trafos_cau_12 SET id = 'A09';
UPDATE stage_trafos_cau_12 SET date = DATE_TRUNC('minute', date);
INSERT INTO alert_cau.caupotenciatrafos_cau1fv SELECT * from stage_trafos_cau_12 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau_1;
DROP TABLE IF EXISTS stage_trafos_cau_12;

CREATE TEMP TABLE stage_trafos_cau_1(x jsonb);
CREATE TEMP TABLE stage_trafos_cau_12(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau_1 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/644994a2-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau_12 select f.* from stage_trafos_cau_1, jsonb_populate_recordset(null::stage_trafos_cau_12, x) f;
UPDATE stage_trafos_cau_12 SET cau = 'cau1fv';
UPDATE stage_trafos_cau_12 SET id = 'A10';
UPDATE stage_trafos_cau_12 SET date = DATE_TRUNC('minute', date);
INSERT INTO alert_cau.caupotenciatrafos_cau1fv SELECT * from stage_trafos_cau_12 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau_1;
DROP TABLE IF EXISTS stage_trafos_cau_12;

CREATE TEMP TABLE stage_trafos_cau_1(x jsonb);
CREATE TEMP TABLE stage_trafos_cau_12(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau_1 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/64ab8e46-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau_12 select f.* from stage_trafos_cau_1, jsonb_populate_recordset(null::stage_trafos_cau_12, x) f;
UPDATE stage_trafos_cau_12 SET cau = 'cau1fv';
UPDATE stage_trafos_cau_12 SET id = 'A11';
UPDATE stage_trafos_cau_12 SET date = DATE_TRUNC('minute', date);
INSERT INTO alert_cau.caupotenciatrafos_cau1fv SELECT * from stage_trafos_cau_12 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau_1;
DROP TABLE IF EXISTS stage_trafos_cau_12;

CREATE TEMP TABLE stage_trafos_cau_1(x jsonb);
CREATE TEMP TABLE stage_trafos_cau_12(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau_1 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/650c86ec-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau_12 select f.* from stage_trafos_cau_1, jsonb_populate_recordset(null::stage_trafos_cau_12, x) f;
UPDATE stage_trafos_cau_12 SET cau = 'cau1fv';
UPDATE stage_trafos_cau_12 SET id = 'A12';
UPDATE stage_trafos_cau_12 SET date = DATE_TRUNC('minute', date);
INSERT INTO alert_cau.caupotenciatrafos_cau1fv SELECT * from stage_trafos_cau_12 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau_1;
DROP TABLE IF EXISTS stage_trafos_cau_12;

CREATE TEMP TABLE stage_trafos_cau_1(x jsonb);
CREATE TEMP TABLE stage_trafos_cau_12(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau_1 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/65716846-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau_12 select f.* from stage_trafos_cau_1, jsonb_populate_recordset(null::stage_trafos_cau_12, x) f;
UPDATE stage_trafos_cau_12 SET cau = 'cau1fv';
UPDATE stage_trafos_cau_12 SET id = 'A13';
UPDATE stage_trafos_cau_12 SET date = DATE_TRUNC('minute', date);
INSERT INTO alert_cau.caupotenciatrafos_cau1fv SELECT * from stage_trafos_cau_12 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau_1;
DROP TABLE IF EXISTS stage_trafos_cau_12;

CREATE TEMP TABLE stage_trafos_cau_1(x jsonb);
CREATE TEMP TABLE stage_trafos_cau_12(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau_1 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/65d3c612-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau_12 select f.* from stage_trafos_cau_1, jsonb_populate_recordset(null::stage_trafos_cau_12, x) f;
UPDATE stage_trafos_cau_12 SET cau = 'cau1fv';
UPDATE stage_trafos_cau_12 SET id = 'A14';
UPDATE stage_trafos_cau_12 SET date = DATE_TRUNC('minute', date);
INSERT INTO alert_cau.caupotenciatrafos_cau1fv SELECT * from stage_trafos_cau_12 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau_1;
DROP TABLE IF EXISTS stage_trafos_cau_12;

CREATE TEMP TABLE stage_trafos_cau_1(x jsonb);
CREATE TEMP TABLE stage_trafos_cau_12(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau_1 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/66363d74-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau_12 select f.* from stage_trafos_cau_1, jsonb_populate_recordset(null::stage_trafos_cau_12, x) f;
UPDATE stage_trafos_cau_12 SET cau = 'cau1fv';
UPDATE stage_trafos_cau_12 SET id = 'A15';
UPDATE stage_trafos_cau_12 SET date = DATE_TRUNC('minute', date);
INSERT INTO alert_cau.caupotenciatrafos_cau1fv SELECT * from stage_trafos_cau_12 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau_1;
DROP TABLE IF EXISTS stage_trafos_cau_12;

CREATE TEMP TABLE stage_trafos_cau_1(x jsonb);
CREATE TEMP TABLE stage_trafos_cau_12(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau_1 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/6699229a-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau_12 select f.* from stage_trafos_cau_1, jsonb_populate_recordset(null::stage_trafos_cau_12, x) f;
UPDATE stage_trafos_cau_12 SET cau = 'cau1fv';
UPDATE stage_trafos_cau_12 SET id = 'A16';
UPDATE stage_trafos_cau_12 SET date = DATE_TRUNC('minute', date);
INSERT INTO alert_cau.caupotenciatrafos_cau1fv SELECT * from stage_trafos_cau_12 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau_1;
DROP TABLE IF EXISTS stage_trafos_cau_12;

CREATE TEMP TABLE stage_trafos_cau_1(x jsonb);
CREATE TEMP TABLE stage_trafos_cau_12(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau_1 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/66fcf90a-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau_12 select f.* from stage_trafos_cau_1, jsonb_populate_recordset(null::stage_trafos_cau_12, x) f;
UPDATE stage_trafos_cau_12 SET cau = 'cau1fv';
UPDATE stage_trafos_cau_12 SET id = 'A17';
UPDATE stage_trafos_cau_12 SET date = DATE_TRUNC('minute', date);
INSERT INTO alert_cau.caupotenciatrafos_cau1fv SELECT * from stage_trafos_cau_12 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau_1;
DROP TABLE IF EXISTS stage_trafos_cau_12;

CREATE TEMP TABLE stage_trafos_cau_1(x jsonb);
CREATE TEMP TABLE stage_trafos_cau_12(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau_1 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/675d9436-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau_12 select f.* from stage_trafos_cau_1, jsonb_populate_recordset(null::stage_trafos_cau_12, x) f;
UPDATE stage_trafos_cau_12 SET cau = 'cau1fv';
UPDATE stage_trafos_cau_12 SET id = 'A18';
UPDATE stage_trafos_cau_12 SET date = DATE_TRUNC('minute', date);
INSERT INTO alert_cau.caupotenciatrafos_cau1fv SELECT * from stage_trafos_cau_12 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau_1;
DROP TABLE IF EXISTS stage_trafos_cau_12;

CREATE TEMP TABLE stage_trafos_cau_1(x jsonb);
CREATE TEMP TABLE stage_trafos_cau_12(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau_1 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/67c1c096-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau_12 select f.* from stage_trafos_cau_1, jsonb_populate_recordset(null::stage_trafos_cau_12, x) f;
UPDATE stage_trafos_cau_12 SET cau = 'cau1fv';
UPDATE stage_trafos_cau_12 SET id = 'A19';
UPDATE stage_trafos_cau_12 SET date = DATE_TRUNC('minute', date);
INSERT INTO alert_cau.caupotenciatrafos_cau1fv SELECT * from stage_trafos_cau_12 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau_1;
DROP TABLE IF EXISTS stage_trafos_cau_12;

CREATE TEMP TABLE stage_trafos_cau_1(x jsonb);
CREATE TEMP TABLE stage_trafos_cau_12(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau_1 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/6827407e-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau_12 select f.* from stage_trafos_cau_1, jsonb_populate_recordset(null::stage_trafos_cau_12, x) f;
UPDATE stage_trafos_cau_12 SET cau = 'cau1fv';
UPDATE stage_trafos_cau_12 SET id = 'A20';
UPDATE stage_trafos_cau_12 SET date = DATE_TRUNC('minute', date);
INSERT INTO alert_cau.caupotenciatrafos_cau1fv SELECT * from stage_trafos_cau_12 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau_1;
DROP TABLE IF EXISTS stage_trafos_cau_12;

CREATE TEMP TABLE stage_trafos_cau_1(x jsonb);
CREATE TEMP TABLE stage_trafos_cau_12(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau_1 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/688b7c38-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau_12 select f.* from stage_trafos_cau_1, jsonb_populate_recordset(null::stage_trafos_cau_12, x) f;
UPDATE stage_trafos_cau_12 SET cau = 'cau1fv';
UPDATE stage_trafos_cau_12 SET id = 'A21';
UPDATE stage_trafos_cau_12 SET date = DATE_TRUNC('minute', date);
INSERT INTO alert_cau.caupotenciatrafos_cau1fv SELECT * from stage_trafos_cau_12 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau_1;
DROP TABLE IF EXISTS stage_trafos_cau_12;

CREATE TEMP TABLE stage_trafos_cau_1(x jsonb);
CREATE TEMP TABLE stage_trafos_cau_12(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau_1 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/68edc4ce-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau_12 select f.* from stage_trafos_cau_1, jsonb_populate_recordset(null::stage_trafos_cau_12, x) f;
UPDATE stage_trafos_cau_12 SET cau = 'cau1fv';
UPDATE stage_trafos_cau_12 SET id = 'A22';
UPDATE stage_trafos_cau_12 SET date = DATE_TRUNC('minute', date);
INSERT INTO alert_cau.caupotenciatrafos_cau1fv SELECT * from stage_trafos_cau_12 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau_1;
DROP TABLE IF EXISTS stage_trafos_cau_12;

CREATE TEMP TABLE stage_trafos_cau_1(x jsonb);
CREATE TEMP TABLE stage_trafos_cau_12(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau_1 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/694f19ea-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau_12 select f.* from stage_trafos_cau_1, jsonb_populate_recordset(null::stage_trafos_cau_12, x) f;
UPDATE stage_trafos_cau_12 SET cau = 'cau1fv';
UPDATE stage_trafos_cau_12 SET id = 'A23';
UPDATE stage_trafos_cau_12 SET date = DATE_TRUNC('minute', date);
INSERT INTO alert_cau.caupotenciatrafos_cau1fv SELECT * from stage_trafos_cau_12 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau_1;
DROP TABLE IF EXISTS stage_trafos_cau_12;

CREATE TEMP TABLE stage_trafos_cau_1(x jsonb);
CREATE TEMP TABLE stage_trafos_cau_12(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau_1 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/69b0a2a0-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau_12 select f.* from stage_trafos_cau_1, jsonb_populate_recordset(null::stage_trafos_cau_12, x) f;
UPDATE stage_trafos_cau_12 SET cau = 'cau1fv';
UPDATE stage_trafos_cau_12 SET id = 'A24';
UPDATE stage_trafos_cau_12 SET date = DATE_TRUNC('minute', date);
INSERT INTO alert_cau.caupotenciatrafos_cau1fv SELECT * from stage_trafos_cau_12 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau_1;
DROP TABLE IF EXISTS stage_trafos_cau_12;

CREATE TEMP TABLE stage_trafos_cau_1(x jsonb);
CREATE TEMP TABLE stage_trafos_cau_12(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau_1 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/6a144a94-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau_12 select f.* from stage_trafos_cau_1, jsonb_populate_recordset(null::stage_trafos_cau_12, x) f;
UPDATE stage_trafos_cau_12 SET cau = 'cau1fv';
UPDATE stage_trafos_cau_12 SET id = 'A25';
UPDATE stage_trafos_cau_12 SET date = DATE_TRUNC('minute', date);
INSERT INTO alert_cau.caupotenciatrafos_cau1fv SELECT * from stage_trafos_cau_12 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau_1;
DROP TABLE IF EXISTS stage_trafos_cau_12;

CREATE TEMP TABLE stage_trafos_cau_1(x jsonb);
CREATE TEMP TABLE stage_trafos_cau_12(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau_1 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/6a7748a6-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau_12 select f.* from stage_trafos_cau_1, jsonb_populate_recordset(null::stage_trafos_cau_12, x) f;
UPDATE stage_trafos_cau_12 SET cau = 'cau1fv';
UPDATE stage_trafos_cau_12 SET id = 'A26';
UPDATE stage_trafos_cau_12 SET date = DATE_TRUNC('minute', date);
INSERT INTO alert_cau.caupotenciatrafos_cau1fv SELECT * from stage_trafos_cau_12 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau_1;
DROP TABLE IF EXISTS stage_trafos_cau_12;

CREATE TEMP TABLE stage_trafos_cau_1(x jsonb);
CREATE TEMP TABLE stage_trafos_cau_12(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau_1 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/6ade1cf2-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau_12 select f.* from stage_trafos_cau_1, jsonb_populate_recordset(null::stage_trafos_cau_12, x) f;
UPDATE stage_trafos_cau_12 SET cau = 'cau1fv';
UPDATE stage_trafos_cau_12 SET id = 'A27';
UPDATE stage_trafos_cau_12 SET date = DATE_TRUNC('minute', date);
INSERT INTO alert_cau.caupotenciatrafos_cau1fv SELECT * from stage_trafos_cau_12 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau_1;
DROP TABLE IF EXISTS stage_trafos_cau_12;

CREATE TEMP TABLE stage_trafos_cau_1(x jsonb);
CREATE TEMP TABLE stage_trafos_cau_12(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau_1 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/6b4097b0-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau_12 select f.* from stage_trafos_cau_1, jsonb_populate_recordset(null::stage_trafos_cau_12, x) f;
UPDATE stage_trafos_cau_12 SET cau = 'cau1fv';
UPDATE stage_trafos_cau_12 SET id = 'A28';
UPDATE stage_trafos_cau_12 SET date = DATE_TRUNC('minute', date);
INSERT INTO alert_cau.caupotenciatrafos_cau1fv SELECT * from stage_trafos_cau_12 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau_1;
DROP TABLE IF EXISTS stage_trafos_cau_12;

CREATE TEMP TABLE stage_trafos_cau_1(x jsonb);
CREATE TEMP TABLE stage_trafos_cau_12(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau_1 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/6ba3bd40-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau_12 select f.* from stage_trafos_cau_1, jsonb_populate_recordset(null::stage_trafos_cau_12, x) f;
UPDATE stage_trafos_cau_12 SET cau = 'cau1fv';
UPDATE stage_trafos_cau_12 SET id = 'A29';
UPDATE stage_trafos_cau_12 SET date = DATE_TRUNC('minute', date);
INSERT INTO alert_cau.caupotenciatrafos_cau1fv SELECT * from stage_trafos_cau_12 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau_1;
DROP TABLE IF EXISTS stage_trafos_cau_12;

CREATE TEMP TABLE stage_trafos_cau_1(x jsonb);
CREATE TEMP TABLE stage_trafos_cau_12(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau_1 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/6c06caac-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau_12 select f.* from stage_trafos_cau_1, jsonb_populate_recordset(null::stage_trafos_cau_12, x) f;
UPDATE stage_trafos_cau_12 SET cau = 'cau1fv';
UPDATE stage_trafos_cau_12 SET id = 'A30';
UPDATE stage_trafos_cau_12 SET date = DATE_TRUNC('minute', date);
INSERT INTO alert_cau.caupotenciatrafos_cau1fv SELECT * from stage_trafos_cau_12 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau_1;
DROP TABLE IF EXISTS stage_trafos_cau_12;

CREATE TEMP TABLE stage_trafos_cau_1(x jsonb);
CREATE TEMP TABLE stage_trafos_cau_12(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau_1 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/6c66dc08-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau_12 select f.* from stage_trafos_cau_1, jsonb_populate_recordset(null::stage_trafos_cau_12, x) f;
UPDATE stage_trafos_cau_12 SET cau = 'cau1fv';
UPDATE stage_trafos_cau_12 SET id = 'A31';
UPDATE stage_trafos_cau_12 SET date = DATE_TRUNC('minute', date);
INSERT INTO alert_cau.caupotenciatrafos_cau1fv SELECT * from stage_trafos_cau_12 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau_1;
DROP TABLE IF EXISTS stage_trafos_cau_12;

CREATE TEMP TABLE stage_trafos_cau_1(x jsonb);
CREATE TEMP TABLE stage_trafos_cau_12(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau_1 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/6ccc015a-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau_12 select f.* from stage_trafos_cau_1, jsonb_populate_recordset(null::stage_trafos_cau_12, x) f;
UPDATE stage_trafos_cau_12 SET cau = 'cau1fv';
UPDATE stage_trafos_cau_12 SET id = 'A32';
UPDATE stage_trafos_cau_12 SET date = DATE_TRUNC('minute', date);
INSERT INTO alert_cau.caupotenciatrafos_cau1fv SELECT * from stage_trafos_cau_12 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau_1;
DROP TABLE IF EXISTS stage_trafos_cau_12;

CREATE TEMP TABLE stage_trafos_cau_1(x jsonb);
CREATE TEMP TABLE stage_trafos_cau_12(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau_1 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/6d317f3a-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau_12 select f.* from stage_trafos_cau_1, jsonb_populate_recordset(null::stage_trafos_cau_12, x) f;
UPDATE stage_trafos_cau_12 SET cau = 'cau1fv';
UPDATE stage_trafos_cau_12 SET id = 'A33';
UPDATE stage_trafos_cau_12 SET date = DATE_TRUNC('minute', date);
INSERT INTO alert_cau.caupotenciatrafos_cau1fv SELECT * from stage_trafos_cau_12 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau_1;
DROP TABLE IF EXISTS stage_trafos_cau_12;

CREATE TEMP TABLE stage_trafos_cau_1(x jsonb);
CREATE TEMP TABLE stage_trafos_cau_12(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau_1 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/6d94d90e-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau_12 select f.* from stage_trafos_cau_1, jsonb_populate_recordset(null::stage_trafos_cau_12, x) f;
UPDATE stage_trafos_cau_12 SET cau = 'cau1fv';
UPDATE stage_trafos_cau_12 SET id = 'A34';
UPDATE stage_trafos_cau_12 SET date = DATE_TRUNC('minute', date);
INSERT INTO alert_cau.caupotenciatrafos_cau1fv SELECT * from stage_trafos_cau_12 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau_1;
DROP TABLE IF EXISTS stage_trafos_cau_12;

CREATE TEMP TABLE stage_trafos_cau_1(x jsonb);
CREATE TEMP TABLE stage_trafos_cau_12(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau_1 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/6dfa0b12-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau_12 select f.* from stage_trafos_cau_1, jsonb_populate_recordset(null::stage_trafos_cau_12, x) f;
UPDATE stage_trafos_cau_12 SET cau = 'cau1fv';
UPDATE stage_trafos_cau_12 SET id = 'A35';
UPDATE stage_trafos_cau_12 SET date = DATE_TRUNC('minute', date);
INSERT INTO alert_cau.caupotenciatrafos_cau1fv SELECT * from stage_trafos_cau_12 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau_1;
DROP TABLE IF EXISTS stage_trafos_cau_12;

DELETE FROM alert_cau.caupotenciatrafos_cau1fv WHERE date < (now() - interval '1 day');