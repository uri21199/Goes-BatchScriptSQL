DELETE FROM caupotenciatrafos_cau3fv WHERE date >= now() - interval '20 minutes';
DROP TABLE IF EXISTS stage_trafos_cau3;
DROP TABLE IF EXISTS stage_trafos_cau32;

CREATE TEMP TABLE stage_trafos_cau3(x jsonb);
CREATE TEMP TABLE stage_trafos_cau32(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau3 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/1952bcd2-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau32 select f.* from stage_trafos_cau3, jsonb_populate_recordset(null::stage_trafos_cau32, x) f;
UPDATE stage_trafos_cau32 SET cau = 'cau3fv';
UPDATE stage_trafos_cau32 SET id = 'C01';
UPDATE stage_trafos_cau32 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau3fv SELECT * from stage_trafos_cau32 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau3;
DROP TABLE IF EXISTS stage_trafos_cau32;

CREATE TEMP TABLE stage_trafos_cau3(x jsonb);
CREATE TEMP TABLE stage_trafos_cau32(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau3 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/19b0bbac-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau32 select f.* from stage_trafos_cau3, jsonb_populate_recordset(null::stage_trafos_cau32, x) f;
UPDATE stage_trafos_cau32 SET cau = 'cau3fv';
UPDATE stage_trafos_cau32 SET id = 'C02';
UPDATE stage_trafos_cau32 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau3fv SELECT * from stage_trafos_cau32 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau3;
DROP TABLE IF EXISTS stage_trafos_cau32;

CREATE TEMP TABLE stage_trafos_cau3(x jsonb);
CREATE TEMP TABLE stage_trafos_cau32(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau3 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/1a0ffa2c-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau32 select f.* from stage_trafos_cau3, jsonb_populate_recordset(null::stage_trafos_cau32, x) f;
UPDATE stage_trafos_cau32 SET cau = 'cau3fv';
UPDATE stage_trafos_cau32 SET id = 'C03';
UPDATE stage_trafos_cau32 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau3fv SELECT * from stage_trafos_cau32 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau3;
DROP TABLE IF EXISTS stage_trafos_cau32;

CREATE TEMP TABLE stage_trafos_cau3(x jsonb);
CREATE TEMP TABLE stage_trafos_cau32(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau3 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/1a6ce9bc-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau32 select f.* from stage_trafos_cau3, jsonb_populate_recordset(null::stage_trafos_cau32, x) f;
UPDATE stage_trafos_cau32 SET cau = 'cau3fv';
UPDATE stage_trafos_cau32 SET id = 'C04';
UPDATE stage_trafos_cau32 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau3fv SELECT * from stage_trafos_cau32 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau3;
DROP TABLE IF EXISTS stage_trafos_cau32;

CREATE TEMP TABLE stage_trafos_cau3(x jsonb);
CREATE TEMP TABLE stage_trafos_cau32(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau3 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/1aca84b4-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau32 select f.* from stage_trafos_cau3, jsonb_populate_recordset(null::stage_trafos_cau32, x) f;
UPDATE stage_trafos_cau32 SET cau = 'cau3fv';
UPDATE stage_trafos_cau32 SET id = 'C05';
UPDATE stage_trafos_cau32 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau3fv SELECT * from stage_trafos_cau32 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau3;
DROP TABLE IF EXISTS stage_trafos_cau32;

CREATE TEMP TABLE stage_trafos_cau3(x jsonb);
CREATE TEMP TABLE stage_trafos_cau32(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau3 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/1b28e3b0-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau32 select f.* from stage_trafos_cau3, jsonb_populate_recordset(null::stage_trafos_cau32, x) f;
UPDATE stage_trafos_cau32 SET cau = 'cau3fv';
UPDATE stage_trafos_cau32 SET id = 'C06';
UPDATE stage_trafos_cau32 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau3fv SELECT * from stage_trafos_cau32 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau3;
DROP TABLE IF EXISTS stage_trafos_cau32;

CREATE TEMP TABLE stage_trafos_cau3(x jsonb);
CREATE TEMP TABLE stage_trafos_cau32(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau3 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/1b884fee-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau32 select f.* from stage_trafos_cau3, jsonb_populate_recordset(null::stage_trafos_cau32, x) f;
UPDATE stage_trafos_cau32 SET cau = 'cau3fv';
UPDATE stage_trafos_cau32 SET id = 'C07';
UPDATE stage_trafos_cau32 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau3fv SELECT * from stage_trafos_cau32 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau3;
DROP TABLE IF EXISTS stage_trafos_cau32;

CREATE TEMP TABLE stage_trafos_cau3(x jsonb);
CREATE TEMP TABLE stage_trafos_cau32(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau3 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/1be654e0-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau32 select f.* from stage_trafos_cau3, jsonb_populate_recordset(null::stage_trafos_cau32, x) f;
UPDATE stage_trafos_cau32 SET cau = 'cau3fv';
UPDATE stage_trafos_cau32 SET id = 'C08';
UPDATE stage_trafos_cau32 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau3fv SELECT * from stage_trafos_cau32 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau3;
DROP TABLE IF EXISTS stage_trafos_cau32;

CREATE TEMP TABLE stage_trafos_cau3(x jsonb);
CREATE TEMP TABLE stage_trafos_cau32(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau3 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/1c450f12-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau32 select f.* from stage_trafos_cau3, jsonb_populate_recordset(null::stage_trafos_cau32, x) f;
UPDATE stage_trafos_cau32 SET cau = 'cau3fv';
UPDATE stage_trafos_cau32 SET id = 'C09';
UPDATE stage_trafos_cau32 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau3fv SELECT * from stage_trafos_cau32 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau3;
DROP TABLE IF EXISTS stage_trafos_cau32;

CREATE TEMP TABLE stage_trafos_cau3(x jsonb);
CREATE TEMP TABLE stage_trafos_cau32(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau3 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/1ca1c2d4-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau32 select f.* from stage_trafos_cau3, jsonb_populate_recordset(null::stage_trafos_cau32, x) f;
UPDATE stage_trafos_cau32 SET cau = 'cau3fv';
UPDATE stage_trafos_cau32 SET id = 'C10';
UPDATE stage_trafos_cau32 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau3fv SELECT * from stage_trafos_cau32 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau3;
DROP TABLE IF EXISTS stage_trafos_cau32;

CREATE TEMP TABLE stage_trafos_cau3(x jsonb);
CREATE TEMP TABLE stage_trafos_cau32(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau3 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/1d00cd06-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau32 select f.* from stage_trafos_cau3, jsonb_populate_recordset(null::stage_trafos_cau32, x) f;
UPDATE stage_trafos_cau32 SET cau = 'cau3fv';
UPDATE stage_trafos_cau32 SET id = 'C11';
UPDATE stage_trafos_cau32 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau3fv SELECT * from stage_trafos_cau32 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau3;
DROP TABLE IF EXISTS stage_trafos_cau32;

CREATE TEMP TABLE stage_trafos_cau3(x jsonb);
CREATE TEMP TABLE stage_trafos_cau32(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau3 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/1d5fb078-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau32 select f.* from stage_trafos_cau3, jsonb_populate_recordset(null::stage_trafos_cau32, x) f;
UPDATE stage_trafos_cau32 SET cau = 'cau3fv';
UPDATE stage_trafos_cau32 SET id = 'C12';
UPDATE stage_trafos_cau32 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau3fv SELECT * from stage_trafos_cau32 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau3;
DROP TABLE IF EXISTS stage_trafos_cau32;

CREATE TEMP TABLE stage_trafos_cau3(x jsonb);
CREATE TEMP TABLE stage_trafos_cau32(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau3 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/1dc04e56-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau32 select f.* from stage_trafos_cau3, jsonb_populate_recordset(null::stage_trafos_cau32, x) f;
UPDATE stage_trafos_cau32 SET cau = 'cau3fv';
UPDATE stage_trafos_cau32 SET id = 'C13';
UPDATE stage_trafos_cau32 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau3fv SELECT * from stage_trafos_cau32 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau3;
DROP TABLE IF EXISTS stage_trafos_cau32;

CREATE TEMP TABLE stage_trafos_cau3(x jsonb);
CREATE TEMP TABLE stage_trafos_cau32(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau3 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/1e1e08b6-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau32 select f.* from stage_trafos_cau3, jsonb_populate_recordset(null::stage_trafos_cau32, x) f;
UPDATE stage_trafos_cau32 SET cau = 'cau3fv';
UPDATE stage_trafos_cau32 SET id = 'C14';
UPDATE stage_trafos_cau32 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau3fv SELECT * from stage_trafos_cau32 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau3;
DROP TABLE IF EXISTS stage_trafos_cau32;

CREATE TEMP TABLE stage_trafos_cau3(x jsonb);
CREATE TEMP TABLE stage_trafos_cau32(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau3 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/1e7b4936-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau32 select f.* from stage_trafos_cau3, jsonb_populate_recordset(null::stage_trafos_cau32, x) f;
UPDATE stage_trafos_cau32 SET cau = 'cau3fv';
UPDATE stage_trafos_cau32 SET id = 'C15';
UPDATE stage_trafos_cau32 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau3fv SELECT * from stage_trafos_cau32 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau3;
DROP TABLE IF EXISTS stage_trafos_cau32;

CREATE TEMP TABLE stage_trafos_cau3(x jsonb);
CREATE TEMP TABLE stage_trafos_cau32(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau3 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/1eda7d20-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau32 select f.* from stage_trafos_cau3, jsonb_populate_recordset(null::stage_trafos_cau32, x) f;
UPDATE stage_trafos_cau32 SET cau = 'cau3fv';
UPDATE stage_trafos_cau32 SET id = 'C16';
UPDATE stage_trafos_cau32 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau3fv SELECT * from stage_trafos_cau32 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau3;
DROP TABLE IF EXISTS stage_trafos_cau32;

CREATE TEMP TABLE stage_trafos_cau3(x jsonb);
CREATE TEMP TABLE stage_trafos_cau32(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau3 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/1f39537c-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau32 select f.* from stage_trafos_cau3, jsonb_populate_recordset(null::stage_trafos_cau32, x) f;
UPDATE stage_trafos_cau32 SET cau = 'cau3fv';
UPDATE stage_trafos_cau32 SET id = 'C17';
UPDATE stage_trafos_cau32 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau3fv SELECT * from stage_trafos_cau32 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau3;
DROP TABLE IF EXISTS stage_trafos_cau32;

CREATE TEMP TABLE stage_trafos_cau3(x jsonb);
CREATE TEMP TABLE stage_trafos_cau32(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau3 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/1f97a4e0-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau32 select f.* from stage_trafos_cau3, jsonb_populate_recordset(null::stage_trafos_cau32, x) f;
UPDATE stage_trafos_cau32 SET cau = 'cau3fv';
UPDATE stage_trafos_cau32 SET id = 'C18';
UPDATE stage_trafos_cau32 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau3fv SELECT * from stage_trafos_cau32 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau3;
DROP TABLE IF EXISTS stage_trafos_cau32;

CREATE TEMP TABLE stage_trafos_cau3(x jsonb);
CREATE TEMP TABLE stage_trafos_cau32(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau3 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/1ff75372-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau32 select f.* from stage_trafos_cau3, jsonb_populate_recordset(null::stage_trafos_cau32, x) f;
UPDATE stage_trafos_cau32 SET cau = 'cau3fv';
UPDATE stage_trafos_cau32 SET id = 'C19';
UPDATE stage_trafos_cau32 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau3fv SELECT * from stage_trafos_cau32 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau3;
DROP TABLE IF EXISTS stage_trafos_cau32;

CREATE TEMP TABLE stage_trafos_cau3(x jsonb);
CREATE TEMP TABLE stage_trafos_cau32(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau3 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/2054ce9e-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau32 select f.* from stage_trafos_cau3, jsonb_populate_recordset(null::stage_trafos_cau32, x) f;
UPDATE stage_trafos_cau32 SET cau = 'cau3fv';
UPDATE stage_trafos_cau32 SET id = 'C20';
UPDATE stage_trafos_cau32 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau3fv SELECT * from stage_trafos_cau32 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau3;
DROP TABLE IF EXISTS stage_trafos_cau32;

CREATE TEMP TABLE stage_trafos_cau3(x jsonb);
CREATE TEMP TABLE stage_trafos_cau32(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau3 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/20b33f9c-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau32 select f.* from stage_trafos_cau3, jsonb_populate_recordset(null::stage_trafos_cau32, x) f;
UPDATE stage_trafos_cau32 SET cau = 'cau3fv';
UPDATE stage_trafos_cau32 SET id = 'C21';
UPDATE stage_trafos_cau32 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau3fv SELECT * from stage_trafos_cau32 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau3;
DROP TABLE IF EXISTS stage_trafos_cau32;

CREATE TEMP TABLE stage_trafos_cau3(x jsonb);
CREATE TEMP TABLE stage_trafos_cau32(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau3 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/211066ea-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau32 select f.* from stage_trafos_cau3, jsonb_populate_recordset(null::stage_trafos_cau32, x) f;
UPDATE stage_trafos_cau32 SET cau = 'cau3fv';
UPDATE stage_trafos_cau32 SET id = 'C22';
UPDATE stage_trafos_cau32 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau3fv SELECT * from stage_trafos_cau32 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau3;
DROP TABLE IF EXISTS stage_trafos_cau32;

CREATE TEMP TABLE stage_trafos_cau3(x jsonb);
CREATE TEMP TABLE stage_trafos_cau32(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau3 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/217002ee-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau32 select f.* from stage_trafos_cau3, jsonb_populate_recordset(null::stage_trafos_cau32, x) f;
UPDATE stage_trafos_cau32 SET cau = 'cau3fv';
UPDATE stage_trafos_cau32 SET id = 'C23';
UPDATE stage_trafos_cau32 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau3fv SELECT * from stage_trafos_cau32 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau3;
DROP TABLE IF EXISTS stage_trafos_cau32;

CREATE TEMP TABLE stage_trafos_cau3(x jsonb);
CREATE TEMP TABLE stage_trafos_cau32(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau3 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/21ce8c42-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau32 select f.* from stage_trafos_cau3, jsonb_populate_recordset(null::stage_trafos_cau32, x) f;
UPDATE stage_trafos_cau32 SET cau = 'cau3fv';
UPDATE stage_trafos_cau32 SET id = 'C24';
UPDATE stage_trafos_cau32 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau3fv SELECT * from stage_trafos_cau32 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau3;
DROP TABLE IF EXISTS stage_trafos_cau32;

CREATE TEMP TABLE stage_trafos_cau3(x jsonb);
CREATE TEMP TABLE stage_trafos_cau32(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau3 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/222e954c-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau32 select f.* from stage_trafos_cau3, jsonb_populate_recordset(null::stage_trafos_cau32, x) f;
UPDATE stage_trafos_cau32 SET cau = 'cau3fv';
UPDATE stage_trafos_cau32 SET id = 'C25';
UPDATE stage_trafos_cau32 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau3fv SELECT * from stage_trafos_cau32 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau3;
DROP TABLE IF EXISTS stage_trafos_cau32;

CREATE TEMP TABLE stage_trafos_cau3(x jsonb);
CREATE TEMP TABLE stage_trafos_cau32(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau3 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/228ce61a-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau32 select f.* from stage_trafos_cau3, jsonb_populate_recordset(null::stage_trafos_cau32, x) f;
UPDATE stage_trafos_cau32 SET cau = 'cau3fv';
UPDATE stage_trafos_cau32 SET id = 'C26';
UPDATE stage_trafos_cau32 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau3fv SELECT * from stage_trafos_cau32 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau3;
DROP TABLE IF EXISTS stage_trafos_cau32;

CREATE TEMP TABLE stage_trafos_cau3(x jsonb);
CREATE TEMP TABLE stage_trafos_cau32(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau3 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/22ec5e56-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau32 select f.* from stage_trafos_cau3, jsonb_populate_recordset(null::stage_trafos_cau32, x) f;
UPDATE stage_trafos_cau32 SET cau = 'cau3fv';
UPDATE stage_trafos_cau32 SET id = 'C27';
UPDATE stage_trafos_cau32 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau3fv SELECT * from stage_trafos_cau32 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau3;
DROP TABLE IF EXISTS stage_trafos_cau32;

CREATE TEMP TABLE stage_trafos_cau3(x jsonb);
CREATE TEMP TABLE stage_trafos_cau32(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau3 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/234b6fe0-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau32 select f.* from stage_trafos_cau3, jsonb_populate_recordset(null::stage_trafos_cau32, x) f;
UPDATE stage_trafos_cau32 SET cau = 'cau3fv';
UPDATE stage_trafos_cau32 SET id = 'C28';
UPDATE stage_trafos_cau32 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau3fv SELECT * from stage_trafos_cau32 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau3;
DROP TABLE IF EXISTS stage_trafos_cau32;

CREATE TEMP TABLE stage_trafos_cau3(x jsonb);
CREATE TEMP TABLE stage_trafos_cau32(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau3 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/23a95b0a-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau32 select f.* from stage_trafos_cau3, jsonb_populate_recordset(null::stage_trafos_cau32, x) f;
UPDATE stage_trafos_cau32 SET cau = 'cau3fv';
UPDATE stage_trafos_cau32 SET id = 'C29';
UPDATE stage_trafos_cau32 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau3fv SELECT * from stage_trafos_cau32 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau3;
DROP TABLE IF EXISTS stage_trafos_cau32;

CREATE TEMP TABLE stage_trafos_cau3(x jsonb);
CREATE TEMP TABLE stage_trafos_cau32(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau3 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/25348f94-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau32 select f.* from stage_trafos_cau3, jsonb_populate_recordset(null::stage_trafos_cau32, x) f;
UPDATE stage_trafos_cau32 SET cau = 'cau3fv';
UPDATE stage_trafos_cau32 SET id = 'C30';
UPDATE stage_trafos_cau32 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau3fv SELECT * from stage_trafos_cau32 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau3;
DROP TABLE IF EXISTS stage_trafos_cau32;

CREATE TEMP TABLE stage_trafos_cau3(x jsonb);
CREATE TEMP TABLE stage_trafos_cau32(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau3 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/25955130-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau32 select f.* from stage_trafos_cau3, jsonb_populate_recordset(null::stage_trafos_cau32, x) f;
UPDATE stage_trafos_cau32 SET cau = 'cau3fv';
UPDATE stage_trafos_cau32 SET id = 'C31';
UPDATE stage_trafos_cau32 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau3fv SELECT * from stage_trafos_cau32 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau3;
DROP TABLE IF EXISTS stage_trafos_cau32;

CREATE TEMP TABLE stage_trafos_cau3(x jsonb);
CREATE TEMP TABLE stage_trafos_cau32(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau3 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/25f4a996-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau32 select f.* from stage_trafos_cau3, jsonb_populate_recordset(null::stage_trafos_cau32, x) f;
UPDATE stage_trafos_cau32 SET cau = 'cau3fv';
UPDATE stage_trafos_cau32 SET id = 'C32';
UPDATE stage_trafos_cau32 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau3fv SELECT * from stage_trafos_cau32 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau3;
DROP TABLE IF EXISTS stage_trafos_cau32;

CREATE TEMP TABLE stage_trafos_cau3(x jsonb);
CREATE TEMP TABLE stage_trafos_cau32(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau3 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/265581ee-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau32 select f.* from stage_trafos_cau3, jsonb_populate_recordset(null::stage_trafos_cau32, x) f;
UPDATE stage_trafos_cau32 SET cau = 'cau3fv';
UPDATE stage_trafos_cau32 SET id = 'C33';
UPDATE stage_trafos_cau32 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau3fv SELECT * from stage_trafos_cau32 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau3;
DROP TABLE IF EXISTS stage_trafos_cau32;

CREATE TEMP TABLE stage_trafos_cau3(x jsonb);
CREATE TEMP TABLE stage_trafos_cau32(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau3 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/26b2afd6-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau32 select f.* from stage_trafos_cau3, jsonb_populate_recordset(null::stage_trafos_cau32, x) f;
UPDATE stage_trafos_cau32 SET cau = 'cau3fv';
UPDATE stage_trafos_cau32 SET id = 'C34';
UPDATE stage_trafos_cau32 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau3fv SELECT * from stage_trafos_cau32 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau3;
DROP TABLE IF EXISTS stage_trafos_cau32;

CREATE TEMP TABLE stage_trafos_cau3(x jsonb);
CREATE TEMP TABLE stage_trafos_cau32(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau3 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/2712e374-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau32 select f.* from stage_trafos_cau3, jsonb_populate_recordset(null::stage_trafos_cau32, x) f;
UPDATE stage_trafos_cau32 SET cau = 'cau3fv';
UPDATE stage_trafos_cau32 SET id = 'C35';
UPDATE stage_trafos_cau32 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau3fv SELECT * from stage_trafos_cau32 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau3;
DROP TABLE IF EXISTS stage_trafos_cau32;

