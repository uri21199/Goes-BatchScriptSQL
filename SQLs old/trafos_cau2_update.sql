DELETE FROM caupotenciatrafos_cau2fv WHERE date >= now() - interval '20 minutes';
DROP TABLE IF EXISTS stage_trafos_cau2;
DROP TABLE IF EXISTS stage_trafos_cau22;

CREATE TEMP TABLE stage_trafos_cau2(x jsonb);
CREATE TEMP TABLE stage_trafos_cau22(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau2 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/c4295d06-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau22 select f.* from stage_trafos_cau2, jsonb_populate_recordset(null::stage_trafos_cau22, x) f;
UPDATE stage_trafos_cau22 SET cau = 'cau2fv';
UPDATE stage_trafos_cau22 SET id = 'B01';
UPDATE stage_trafos_cau22 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau2fv SELECT * from stage_trafos_cau22 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau2;
DROP TABLE IF EXISTS stage_trafos_cau22;

CREATE TEMP TABLE stage_trafos_cau2(x jsonb);
CREATE TEMP TABLE stage_trafos_cau22(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau2 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/c4884bcc-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau22 select f.* from stage_trafos_cau2, jsonb_populate_recordset(null::stage_trafos_cau22, x) f;
UPDATE stage_trafos_cau22 SET cau = 'cau2fv';
UPDATE stage_trafos_cau22 SET id = 'B02';
UPDATE stage_trafos_cau22 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau2fv SELECT * from stage_trafos_cau22 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau2;
DROP TABLE IF EXISTS stage_trafos_cau22;

CREATE TEMP TABLE stage_trafos_cau2(x jsonb);
CREATE TEMP TABLE stage_trafos_cau22(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau2 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/c4fa5f82-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau22 select f.* from stage_trafos_cau2, jsonb_populate_recordset(null::stage_trafos_cau22, x) f;
UPDATE stage_trafos_cau22 SET cau = 'cau2fv';
UPDATE stage_trafos_cau22 SET id = 'B03';
UPDATE stage_trafos_cau22 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau2fv SELECT * from stage_trafos_cau22 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau2;
DROP TABLE IF EXISTS stage_trafos_cau22;

CREATE TEMP TABLE stage_trafos_cau2(x jsonb);
CREATE TEMP TABLE stage_trafos_cau22(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau2 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/c57308c4-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau22 select f.* from stage_trafos_cau2, jsonb_populate_recordset(null::stage_trafos_cau22, x) f;
UPDATE stage_trafos_cau22 SET cau = 'cau2fv';
UPDATE stage_trafos_cau22 SET id = 'B04';
UPDATE stage_trafos_cau22 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau2fv SELECT * from stage_trafos_cau22 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau2;
DROP TABLE IF EXISTS stage_trafos_cau22;

CREATE TEMP TABLE stage_trafos_cau2(x jsonb);
CREATE TEMP TABLE stage_trafos_cau22(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau2 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/c5d18660-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau22 select f.* from stage_trafos_cau2, jsonb_populate_recordset(null::stage_trafos_cau22, x) f;
UPDATE stage_trafos_cau22 SET cau = 'cau2fv';
UPDATE stage_trafos_cau22 SET id = 'B05';
UPDATE stage_trafos_cau22 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau2fv SELECT * from stage_trafos_cau22 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau2;
DROP TABLE IF EXISTS stage_trafos_cau22;

CREATE TEMP TABLE stage_trafos_cau2(x jsonb);
CREATE TEMP TABLE stage_trafos_cau22(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau2 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/c6303dc2-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau22 select f.* from stage_trafos_cau2, jsonb_populate_recordset(null::stage_trafos_cau22, x) f;
UPDATE stage_trafos_cau22 SET cau = 'cau2fv';
UPDATE stage_trafos_cau22 SET id = 'B06';
UPDATE stage_trafos_cau22 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau2fv SELECT * from stage_trafos_cau22 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau2;
DROP TABLE IF EXISTS stage_trafos_cau22;

CREATE TEMP TABLE stage_trafos_cau2(x jsonb);
CREATE TEMP TABLE stage_trafos_cau22(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau2 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/c6903ede-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau22 select f.* from stage_trafos_cau2, jsonb_populate_recordset(null::stage_trafos_cau22, x) f;
UPDATE stage_trafos_cau22 SET cau = 'cau2fv';
UPDATE stage_trafos_cau22 SET id = 'B07';
UPDATE stage_trafos_cau22 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau2fv SELECT * from stage_trafos_cau22 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau2;
DROP TABLE IF EXISTS stage_trafos_cau22;

CREATE TEMP TABLE stage_trafos_cau2(x jsonb);
CREATE TEMP TABLE stage_trafos_cau22(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau2 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/c6ed3972-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau22 select f.* from stage_trafos_cau2, jsonb_populate_recordset(null::stage_trafos_cau22, x) f;
UPDATE stage_trafos_cau22 SET cau = 'cau2fv';
UPDATE stage_trafos_cau22 SET id = 'B08';
UPDATE stage_trafos_cau22 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau2fv SELECT * from stage_trafos_cau22 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau2;
DROP TABLE IF EXISTS stage_trafos_cau22;

CREATE TEMP TABLE stage_trafos_cau2(x jsonb);
CREATE TEMP TABLE stage_trafos_cau22(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau2 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/c74dcec2-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau22 select f.* from stage_trafos_cau2, jsonb_populate_recordset(null::stage_trafos_cau22, x) f;
UPDATE stage_trafos_cau22 SET cau = 'cau2fv';
UPDATE stage_trafos_cau22 SET id = 'B09';
UPDATE stage_trafos_cau22 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau2fv SELECT * from stage_trafos_cau22 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau2;
DROP TABLE IF EXISTS stage_trafos_cau22;

CREATE TEMP TABLE stage_trafos_cau2(x jsonb);
CREATE TEMP TABLE stage_trafos_cau22(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau2 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/c7abad76-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau22 select f.* from stage_trafos_cau2, jsonb_populate_recordset(null::stage_trafos_cau22, x) f;
UPDATE stage_trafos_cau22 SET cau = 'cau2fv';
UPDATE stage_trafos_cau22 SET id = 'B10';
UPDATE stage_trafos_cau22 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau2fv SELECT * from stage_trafos_cau22 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau2;
DROP TABLE IF EXISTS stage_trafos_cau22;

CREATE TEMP TABLE stage_trafos_cau2(x jsonb);
CREATE TEMP TABLE stage_trafos_cau22(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau2 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/c809f250-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau22 select f.* from stage_trafos_cau2, jsonb_populate_recordset(null::stage_trafos_cau22, x) f;
UPDATE stage_trafos_cau22 SET cau = 'cau2fv';
UPDATE stage_trafos_cau22 SET id = 'B11';
UPDATE stage_trafos_cau22 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau2fv SELECT * from stage_trafos_cau22 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau2;
DROP TABLE IF EXISTS stage_trafos_cau22;

CREATE TEMP TABLE stage_trafos_cau2(x jsonb);
CREATE TEMP TABLE stage_trafos_cau22(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau2 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/c867cad8-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau22 select f.* from stage_trafos_cau2, jsonb_populate_recordset(null::stage_trafos_cau22, x) f;
UPDATE stage_trafos_cau22 SET cau = 'cau2fv';
UPDATE stage_trafos_cau22 SET id = 'B12';
UPDATE stage_trafos_cau22 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau2fv SELECT * from stage_trafos_cau22 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau2;
DROP TABLE IF EXISTS stage_trafos_cau22;

CREATE TEMP TABLE stage_trafos_cau2(x jsonb);
CREATE TEMP TABLE stage_trafos_cau22(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau2 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/c8ca6fb2-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau22 select f.* from stage_trafos_cau2, jsonb_populate_recordset(null::stage_trafos_cau22, x) f;
UPDATE stage_trafos_cau22 SET cau = 'cau2fv';
UPDATE stage_trafos_cau22 SET id = 'B13';
UPDATE stage_trafos_cau22 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau2fv SELECT * from stage_trafos_cau22 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau2;
DROP TABLE IF EXISTS stage_trafos_cau22;

CREATE TEMP TABLE stage_trafos_cau2(x jsonb);
CREATE TEMP TABLE stage_trafos_cau22(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau2 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/c9287882-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau22 select f.* from stage_trafos_cau2, jsonb_populate_recordset(null::stage_trafos_cau22, x) f;
UPDATE stage_trafos_cau22 SET cau = 'cau2fv';
UPDATE stage_trafos_cau22 SET id = 'B14';
UPDATE stage_trafos_cau22 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau2fv SELECT * from stage_trafos_cau22 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau2;
DROP TABLE IF EXISTS stage_trafos_cau22;

CREATE TEMP TABLE stage_trafos_cau2(x jsonb);
CREATE TEMP TABLE stage_trafos_cau22(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau2 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/c98b6834-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau22 select f.* from stage_trafos_cau2, jsonb_populate_recordset(null::stage_trafos_cau22, x) f;
UPDATE stage_trafos_cau22 SET cau = 'cau2fv';
UPDATE stage_trafos_cau22 SET id = 'B15';
UPDATE stage_trafos_cau22 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau2fv SELECT * from stage_trafos_cau22 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau2;
DROP TABLE IF EXISTS stage_trafos_cau22;

CREATE TEMP TABLE stage_trafos_cau2(x jsonb);
CREATE TEMP TABLE stage_trafos_cau22(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau2 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/c9ed3140-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau22 select f.* from stage_trafos_cau2, jsonb_populate_recordset(null::stage_trafos_cau22, x) f;
UPDATE stage_trafos_cau22 SET cau = 'cau2fv';
UPDATE stage_trafos_cau22 SET id = 'B16';
UPDATE stage_trafos_cau22 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau2fv SELECT * from stage_trafos_cau22 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau2;
DROP TABLE IF EXISTS stage_trafos_cau22;

CREATE TEMP TABLE stage_trafos_cau2(x jsonb);
CREATE TEMP TABLE stage_trafos_cau22(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau2 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/ca4f887c-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau22 select f.* from stage_trafos_cau2, jsonb_populate_recordset(null::stage_trafos_cau22, x) f;
UPDATE stage_trafos_cau22 SET cau = 'cau2fv';
UPDATE stage_trafos_cau22 SET id = 'B17';
UPDATE stage_trafos_cau22 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau2fv SELECT * from stage_trafos_cau22 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau2;
DROP TABLE IF EXISTS stage_trafos_cau22;

CREATE TEMP TABLE stage_trafos_cau2(x jsonb);
CREATE TEMP TABLE stage_trafos_cau22(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau2 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/cac17a4a-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau22 select f.* from stage_trafos_cau2, jsonb_populate_recordset(null::stage_trafos_cau22, x) f;
UPDATE stage_trafos_cau22 SET cau = 'cau2fv';
UPDATE stage_trafos_cau22 SET id = 'B18';
UPDATE stage_trafos_cau22 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau2fv SELECT * from stage_trafos_cau22 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau2;
DROP TABLE IF EXISTS stage_trafos_cau22;

CREATE TEMP TABLE stage_trafos_cau2(x jsonb);
CREATE TEMP TABLE stage_trafos_cau22(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau2 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/cb2791ae-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau22 select f.* from stage_trafos_cau2, jsonb_populate_recordset(null::stage_trafos_cau22, x) f;
UPDATE stage_trafos_cau22 SET cau = 'cau2fv';
UPDATE stage_trafos_cau22 SET id = 'B19';
UPDATE stage_trafos_cau22 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau2fv SELECT * from stage_trafos_cau22 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau2;
DROP TABLE IF EXISTS stage_trafos_cau22;

CREATE TEMP TABLE stage_trafos_cau2(x jsonb);
CREATE TEMP TABLE stage_trafos_cau22(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau2 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/cb888004-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau22 select f.* from stage_trafos_cau2, jsonb_populate_recordset(null::stage_trafos_cau22, x) f;
UPDATE stage_trafos_cau22 SET cau = 'cau2fv';
UPDATE stage_trafos_cau22 SET id = 'B20';
UPDATE stage_trafos_cau22 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau2fv SELECT * from stage_trafos_cau22 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau2;
DROP TABLE IF EXISTS stage_trafos_cau22;

CREATE TEMP TABLE stage_trafos_cau2(x jsonb);
CREATE TEMP TABLE stage_trafos_cau22(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau2 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/cbf4d970-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau22 select f.* from stage_trafos_cau2, jsonb_populate_recordset(null::stage_trafos_cau22, x) f;
UPDATE stage_trafos_cau22 SET cau = 'cau2fv';
UPDATE stage_trafos_cau22 SET id = 'B21';
UPDATE stage_trafos_cau22 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau2fv SELECT * from stage_trafos_cau22 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau2;
DROP TABLE IF EXISTS stage_trafos_cau22;

CREATE TEMP TABLE stage_trafos_cau2(x jsonb);
CREATE TEMP TABLE stage_trafos_cau22(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau2 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/cc5939c4-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau22 select f.* from stage_trafos_cau2, jsonb_populate_recordset(null::stage_trafos_cau22, x) f;
UPDATE stage_trafos_cau22 SET cau = 'cau2fv';
UPDATE stage_trafos_cau22 SET id = 'B22';
UPDATE stage_trafos_cau22 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau2fv SELECT * from stage_trafos_cau22 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau2;
DROP TABLE IF EXISTS stage_trafos_cau22;

CREATE TEMP TABLE stage_trafos_cau2(x jsonb);
CREATE TEMP TABLE stage_trafos_cau22(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau2 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/ccbbda0c-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau22 select f.* from stage_trafos_cau2, jsonb_populate_recordset(null::stage_trafos_cau22, x) f;
UPDATE stage_trafos_cau22 SET cau = 'cau2fv';
UPDATE stage_trafos_cau22 SET id = 'B23';
UPDATE stage_trafos_cau22 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau2fv SELECT * from stage_trafos_cau22 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau2;
DROP TABLE IF EXISTS stage_trafos_cau22;

CREATE TEMP TABLE stage_trafos_cau2(x jsonb);
CREATE TEMP TABLE stage_trafos_cau22(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau2 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/cd1fd232-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau22 select f.* from stage_trafos_cau2, jsonb_populate_recordset(null::stage_trafos_cau22, x) f;
UPDATE stage_trafos_cau22 SET cau = 'cau2fv';
UPDATE stage_trafos_cau22 SET id = 'B24';
UPDATE stage_trafos_cau22 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau2fv SELECT * from stage_trafos_cau22 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau2;
DROP TABLE IF EXISTS stage_trafos_cau22;

CREATE TEMP TABLE stage_trafos_cau2(x jsonb);
CREATE TEMP TABLE stage_trafos_cau22(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau2 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/cd82c9c8-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau22 select f.* from stage_trafos_cau2, jsonb_populate_recordset(null::stage_trafos_cau22, x) f;
UPDATE stage_trafos_cau22 SET cau = 'cau2fv';
UPDATE stage_trafos_cau22 SET id = 'B25';
UPDATE stage_trafos_cau22 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau2fv SELECT * from stage_trafos_cau22 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau2;
DROP TABLE IF EXISTS stage_trafos_cau22;

CREATE TEMP TABLE stage_trafos_cau2(x jsonb);
CREATE TEMP TABLE stage_trafos_cau22(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau2 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/cde9ec66-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau22 select f.* from stage_trafos_cau2, jsonb_populate_recordset(null::stage_trafos_cau22, x) f;
UPDATE stage_trafos_cau22 SET cau = 'cau2fv';
UPDATE stage_trafos_cau22 SET id = 'B26';
UPDATE stage_trafos_cau22 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau2fv SELECT * from stage_trafos_cau22 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau2;
DROP TABLE IF EXISTS stage_trafos_cau22;

CREATE TEMP TABLE stage_trafos_cau2(x jsonb);
CREATE TEMP TABLE stage_trafos_cau22(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau2 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/ce4e1876-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau22 select f.* from stage_trafos_cau2, jsonb_populate_recordset(null::stage_trafos_cau22, x) f;
UPDATE stage_trafos_cau22 SET cau = 'cau2fv';
UPDATE stage_trafos_cau22 SET id = 'B27';
UPDATE stage_trafos_cau22 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau2fv SELECT * from stage_trafos_cau22 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau2;
DROP TABLE IF EXISTS stage_trafos_cau22;

CREATE TEMP TABLE stage_trafos_cau2(x jsonb);
CREATE TEMP TABLE stage_trafos_cau22(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau2 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/ceb1801e-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau22 select f.* from stage_trafos_cau2, jsonb_populate_recordset(null::stage_trafos_cau22, x) f;
UPDATE stage_trafos_cau22 SET cau = 'cau2fv';
UPDATE stage_trafos_cau22 SET id = 'B28';
UPDATE stage_trafos_cau22 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau2fv SELECT * from stage_trafos_cau22 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau2;
DROP TABLE IF EXISTS stage_trafos_cau22;

CREATE TEMP TABLE stage_trafos_cau2(x jsonb);
CREATE TEMP TABLE stage_trafos_cau22(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau2 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/cf18ce18-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau22 select f.* from stage_trafos_cau2, jsonb_populate_recordset(null::stage_trafos_cau22, x) f;
UPDATE stage_trafos_cau22 SET cau = 'cau2fv';
UPDATE stage_trafos_cau22 SET id = 'B29';
UPDATE stage_trafos_cau22 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau2fv SELECT * from stage_trafos_cau22 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau2;
DROP TABLE IF EXISTS stage_trafos_cau22;

CREATE TEMP TABLE stage_trafos_cau2(x jsonb);
CREATE TEMP TABLE stage_trafos_cau22(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau2 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/cf786d14-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau22 select f.* from stage_trafos_cau2, jsonb_populate_recordset(null::stage_trafos_cau22, x) f;
UPDATE stage_trafos_cau22 SET cau = 'cau2fv';
UPDATE stage_trafos_cau22 SET id = 'B30';
UPDATE stage_trafos_cau22 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau2fv SELECT * from stage_trafos_cau22 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau2;
DROP TABLE IF EXISTS stage_trafos_cau22;

CREATE TEMP TABLE stage_trafos_cau2(x jsonb);
CREATE TEMP TABLE stage_trafos_cau22(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau2 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/cfdae2f0-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau22 select f.* from stage_trafos_cau2, jsonb_populate_recordset(null::stage_trafos_cau22, x) f;
UPDATE stage_trafos_cau22 SET cau = 'cau2fv';
UPDATE stage_trafos_cau22 SET id = 'B31';
UPDATE stage_trafos_cau22 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau2fv SELECT * from stage_trafos_cau22 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau2;
DROP TABLE IF EXISTS stage_trafos_cau22;

CREATE TEMP TABLE stage_trafos_cau2(x jsonb);
CREATE TEMP TABLE stage_trafos_cau22(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau2 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/d03e9886-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau22 select f.* from stage_trafos_cau2, jsonb_populate_recordset(null::stage_trafos_cau22, x) f;
UPDATE stage_trafos_cau22 SET cau = 'cau2fv';
UPDATE stage_trafos_cau22 SET id = 'B32';
UPDATE stage_trafos_cau22 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau2fv SELECT * from stage_trafos_cau22 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau2;
DROP TABLE IF EXISTS stage_trafos_cau22;

CREATE TEMP TABLE stage_trafos_cau2(x jsonb);
CREATE TEMP TABLE stage_trafos_cau22(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau2 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/d0a16ff6-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau22 select f.* from stage_trafos_cau2, jsonb_populate_recordset(null::stage_trafos_cau22, x) f;
UPDATE stage_trafos_cau22 SET cau = 'cau2fv';
UPDATE stage_trafos_cau22 SET id = 'B33';
UPDATE stage_trafos_cau22 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau2fv SELECT * from stage_trafos_cau22 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau2;
DROP TABLE IF EXISTS stage_trafos_cau22;

CREATE TEMP TABLE stage_trafos_cau2(x jsonb);
CREATE TEMP TABLE stage_trafos_cau22(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau2 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/d102e8f8-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau22 select f.* from stage_trafos_cau2, jsonb_populate_recordset(null::stage_trafos_cau22, x) f;
UPDATE stage_trafos_cau22 SET cau = 'cau2fv';
UPDATE stage_trafos_cau22 SET id = 'B34';
UPDATE stage_trafos_cau22 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau2fv SELECT * from stage_trafos_cau22 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau2;
DROP TABLE IF EXISTS stage_trafos_cau22;

CREATE TEMP TABLE stage_trafos_cau2(x jsonb);
CREATE TEMP TABLE stage_trafos_cau22(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '20 minutes' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau2 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/d1665f8c-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau22 select f.* from stage_trafos_cau2, jsonb_populate_recordset(null::stage_trafos_cau22, x) f;
UPDATE stage_trafos_cau22 SET cau = 'cau2fv';
UPDATE stage_trafos_cau22 SET id = 'B35';
UPDATE stage_trafos_cau22 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau2fv SELECT * from stage_trafos_cau22 WHERE date >= (now()::timestamptz - interval '20 minutes');
DROP TABLE IF EXISTS stage_trafos_cau2;
DROP TABLE IF EXISTS stage_trafos_cau22;