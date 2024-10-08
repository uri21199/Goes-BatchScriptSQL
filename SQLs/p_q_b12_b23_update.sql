DELETE FROM P_Q_B15_B23 WHERE date >= now() - interval '8 hours';
DROP TABLE IF EXISTS stage_p_q;
DROP TABLE IF EXISTS stage_p_q2;

---------------B15-------------------
CREATE TEMP TABLE stage_p_q(x jsonb);
CREATE TEMP TABLE stage_p_q2(date timestamptz, val numeric, id text);
DO $$
DECLARE startdate text := to_char(current_date - interval '1 day', 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_p_q FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/c98b6834-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_p_q2 select f.* from stage_p_q, jsonb_populate_recordset(null::stage_p_q2, x) f;
UPDATE stage_p_q2 SET id = 'P B15';
UPDATE stage_p_q2 SET date = DATE_TRUNC('minute', date);
INSERT INTO P_Q_B15_B23 SELECT * from stage_p_q2 WHERE date >= (now()::timestamptz - interval '8 hours');
DROP TABLE IF EXISTS stage_p_q;
DROP TABLE IF EXISTS stage_p_q2;

CREATE TEMP TABLE stage_p_q(x jsonb);
CREATE TEMP TABLE stage_p_q2(date timestamptz, val numeric, id text);
DO $$
DECLARE startdate text := to_char(current_date - interval '1 day', 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_p_q FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/c97cadf8-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_p_q2 select f.* from stage_p_q, jsonb_populate_recordset(null::stage_p_q2, x) f;
UPDATE stage_p_q2 SET id = 'Q B15';
UPDATE stage_p_q2 SET date = DATE_TRUNC('minute', date);
INSERT INTO P_Q_B15_B23 SELECT * from stage_p_q2 WHERE date >= (now()::timestamptz - interval '8 hours');
DROP TABLE IF EXISTS stage_p_q;
DROP TABLE IF EXISTS stage_p_q2;

---------------------B23---------------------

CREATE TEMP TABLE stage_p_q(x jsonb);
CREATE TEMP TABLE stage_p_q2(date timestamptz, val numeric, id text);
DO $$
DECLARE startdate text := to_char(current_date - interval '1 day', 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_p_q FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/ccbbda0c-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_p_q2 select f.* from stage_p_q, jsonb_populate_recordset(null::stage_p_q2, x) f;
UPDATE stage_p_q2 SET id = 'P B23';
UPDATE stage_p_q2 SET date = DATE_TRUNC('minute', date);
INSERT INTO P_Q_B15_B23 SELECT * from stage_p_q2 WHERE date >= (now()::timestamptz - interval '8 hours');
DROP TABLE IF EXISTS stage_p_q;
DROP TABLE IF EXISTS stage_p_q2;

CREATE TEMP TABLE stage_p_q(x jsonb);
CREATE TEMP TABLE stage_p_q2(date timestamptz, val numeric, id text);
DO $$
DECLARE startdate text := to_char(current_date - interval '1 day', 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_p_q FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/ccb0d580-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_p_q2 select f.* from stage_p_q, jsonb_populate_recordset(null::stage_p_q2, x) f;
UPDATE stage_p_q2 SET id = 'Q B23';
UPDATE stage_p_q2 SET date = DATE_TRUNC('minute', date);
INSERT INTO P_Q_B15_B23 SELECT * from stage_p_q2 WHERE date >= (now()::timestamptz - interval '8 hours');
DROP TABLE IF EXISTS stage_p_q;
DROP TABLE IF EXISTS stage_p_q2;
