DELETE FROM current_b15_b23 WHERE date >= now() - interval '8 hours';
DROP TABLE IF EXISTS stage_current_b15_b23;
DROP TABLE IF EXISTS stage_current_b15_b232;

-----------------B15--------------------
CREATE TEMP TABLE stage_current_b15_b23(x jsonb);
CREATE TEMP TABLE stage_current_b15_b232(date timestamptz, val numeric, id text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '12 hours' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_current_b15_b23 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/e61f505a-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_current_b15_b232 select f.* from stage_current_b15_b23, jsonb_populate_recordset(null::stage_current_b15_b232, x) f;
UPDATE stage_current_b15_b232 SET id = 'L1 B15';
UPDATE stage_current_b15_b232 SET date = DATE_TRUNC('minute', date);
INSERT INTO current_b15_b23 SELECT * from stage_current_b15_b232 WHERE date >= (now()::timestamptz - interval '8 hours');
DROP TABLE IF EXISTS stage_current_b15_b23;
DROP TABLE IF EXISTS stage_current_b15_b232;

CREATE TEMP TABLE stage_current_b15_b23(x jsonb);
CREATE TEMP TABLE stage_current_b15_b232(date timestamptz, val numeric, id text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '12 hours' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_current_b15_b23 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/e61f67f2-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_current_b15_b232 select f.* from stage_current_b15_b23, jsonb_populate_recordset(null::stage_current_b15_b232, x) f;
UPDATE stage_current_b15_b232 SET id = 'L2 B15';
UPDATE stage_current_b15_b232 SET date = DATE_TRUNC('minute', date);
INSERT INTO current_b15_b23 SELECT * from stage_current_b15_b232 WHERE date >= (now()::timestamptz - interval '8 hours');
DROP TABLE IF EXISTS stage_current_b15_b23;
DROP TABLE IF EXISTS stage_current_b15_b232;

CREATE TEMP TABLE stage_current_b15_b23(x jsonb);
CREATE TEMP TABLE stage_current_b15_b232(date timestamptz, val numeric, id text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '12 hours' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_current_b15_b23 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/e61f7ddc-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_current_b15_b232 select f.* from stage_current_b15_b23, jsonb_populate_recordset(null::stage_current_b15_b232, x) f;
UPDATE stage_current_b15_b232 SET id = 'L3 B15';
UPDATE stage_current_b15_b232 SET date = DATE_TRUNC('minute', date);
INSERT INTO current_b15_b23 SELECT * from stage_current_b15_b232 WHERE date >= (now()::timestamptz - interval '8 hours');
DROP TABLE IF EXISTS stage_current_b15_b23;
DROP TABLE IF EXISTS stage_current_b15_b232;
-----------------------B23-----------------
CREATE TEMP TABLE stage_current_b15_b23(x jsonb);
CREATE TEMP TABLE stage_current_b15_b232(date timestamptz, val numeric, id text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '12 hours' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_current_b15_b23 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/f0957af0-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_current_b15_b232 select f.* from stage_current_b15_b23, jsonb_populate_recordset(null::stage_current_b15_b232, x) f;
UPDATE stage_current_b15_b232 SET id = 'L1 B23';
UPDATE stage_current_b15_b232 SET date = DATE_TRUNC('minute', date);
INSERT INTO current_b15_b23 SELECT * from stage_current_b15_b232 WHERE date >= (now()::timestamptz - interval '8 hours');
DROP TABLE IF EXISTS stage_current_b15_b23;
DROP TABLE IF EXISTS stage_current_b15_b232;

CREATE TEMP TABLE stage_current_b15_b23(x jsonb);
CREATE TEMP TABLE stage_current_b15_b232(date timestamptz, val numeric, id text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '12 hours' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_current_b15_b23 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/f09598aa-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_current_b15_b232 select f.* from stage_current_b15_b23, jsonb_populate_recordset(null::stage_current_b15_b232, x) f;
UPDATE stage_current_b15_b232 SET id = 'L2 B23';
UPDATE stage_current_b15_b232 SET date = DATE_TRUNC('minute', date);
INSERT INTO current_b15_b23 SELECT * from stage_current_b15_b232 WHERE date >= (now()::timestamptz - interval '8 hours');
DROP TABLE IF EXISTS stage_current_b15_b23;
DROP TABLE IF EXISTS stage_current_b15_b232;

CREATE TEMP TABLE stage_current_b15_b23(x jsonb);
CREATE TEMP TABLE stage_current_b15_b232(date timestamptz, val numeric, id text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '12 hours' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_current_b15_b23 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/f095b1e6-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_current_b15_b232 select f.* from stage_current_b15_b23, jsonb_populate_recordset(null::stage_current_b15_b232, x) f;
UPDATE stage_current_b15_b232 SET id = 'L3 B23';
UPDATE stage_current_b15_b232 SET date = DATE_TRUNC('minute', date);
INSERT INTO current_b15_b23 SELECT * from stage_current_b15_b232 WHERE date >= (now()::timestamptz - interval '8 hours');
DROP TABLE IF EXISTS stage_current_b15_b23;
DROP TABLE IF EXISTS stage_current_b15_b232;