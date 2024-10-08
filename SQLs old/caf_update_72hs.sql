DELETE FROM Cafayate.caf_potencia_72hs WHERE date < now() - interval '3 days';

DROP TABLE IF EXISTS stage_caf_potencia_72hs;
DROP TABLE IF EXISTS stage_caf_potencia_72hs2;
CREATE TEMP TABLE stage_caf_potencia_72hs(x jsonb);
CREATE TEMP TABLE stage_caf_potencia_72hs2(date timestamptz, val numeric, id text, caf text);
DO $$
DECLARE startdate text := to_char(current_date - interval '3 days', 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_caf_potencia_72hs FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/d3698b2a-8934-11e9-8620-42010afa015a/events?apiKey=e385a1a5-0441-4e06-be58-162731a7d4f9.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_caf_potencia_72hs2 select f.* from stage_caf_potencia_72hs, jsonb_populate_recordset(null::stage_caf_potencia_72hs2, x) f;
UPDATE stage_caf_potencia_72hs2 SET caf = 'caf1fv';
UPDATE stage_caf_potencia_72hs2 SET id = '01.01';
UPDATE stage_caf_potencia_72hs2 SET date = DATE_TRUNC('minute', date);
INSERT INTO Cafayate.caf_potencia_72hs SELECT * from stage_caf_potencia_72hs2 ON CONFLICT DO NOTHING;
INSERT INTO Cafayate.caf_potencia SELECT * from stage_caf_potencia_72hs2 ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS stage_caf_potencia_72hs;
DROP TABLE IF EXISTS stage_caf_potencia_72hs2;
CREATE TEMP TABLE stage_caf_potencia_72hs(x jsonb);
CREATE TEMP TABLE stage_caf_potencia_72hs2(date timestamptz, val numeric, id text, caf text);
DO $$
DECLARE startdate text := to_char(current_date - interval '3 days', 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_caf_potencia_72hs FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/d4b4f96a-8934-11e9-8620-42010afa015a/events?apiKey=e385a1a5-0441-4e06-be58-162731a7d4f9.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_caf_potencia_72hs2 select f.* from stage_caf_potencia_72hs, jsonb_populate_recordset(null::stage_caf_potencia_72hs2, x) f;
UPDATE stage_caf_potencia_72hs2 SET caf = 'caf2fv';
UPDATE stage_caf_potencia_72hs2 SET id = '01.02';
UPDATE stage_caf_potencia_72hs2 SET date = DATE_TRUNC('minute', date);
INSERT INTO Cafayate.caf_potencia_72hs SELECT * from stage_caf_potencia_72hs2 ON CONFLICT DO NOTHING;
INSERT INTO Cafayate.caf_potencia SELECT * from stage_caf_potencia_72hs2 ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS stage_caf_potencia_72hs;
DROP TABLE IF EXISTS stage_caf_potencia_72hs2;
CREATE TEMP TABLE stage_caf_potencia_72hs(x jsonb);
CREATE TEMP TABLE stage_caf_potencia_72hs2(date timestamptz, val numeric, id text, caf text);
DO $$
DECLARE startdate text := to_char(current_date - interval '3 days', 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_caf_potencia_72hs FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/e11e094e-8934-11e9-8620-42010afa015a/events?apiKey=e385a1a5-0441-4e06-be58-162731a7d4f9.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_caf_potencia_72hs2 select f.* from stage_caf_potencia_72hs, jsonb_populate_recordset(null::stage_caf_potencia_72hs2, x) f;
UPDATE stage_caf_potencia_72hs2 SET caf = 'caf1fv';
UPDATE stage_caf_potencia_72hs2 SET id = '02.01';
UPDATE stage_caf_potencia_72hs2 SET date = DATE_TRUNC('minute', date);
INSERT INTO Cafayate.caf_potencia_72hs SELECT * from stage_caf_potencia_72hs2 ON CONFLICT DO NOTHING;
INSERT INTO Cafayate.caf_potencia SELECT * from stage_caf_potencia_72hs2 ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS stage_caf_potencia_72hs;
DROP TABLE IF EXISTS stage_caf_potencia_72hs2;
CREATE TEMP TABLE stage_caf_potencia_72hs(x jsonb);
CREATE TEMP TABLE stage_caf_potencia_72hs2(date timestamptz, val numeric, id text, caf text);
DO $$
DECLARE startdate text := to_char(current_date - interval '3 days', 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_caf_potencia_72hs FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/e26bb0b2-8934-11e9-8620-42010afa015a/events?apiKey=e385a1a5-0441-4e06-be58-162731a7d4f9.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_caf_potencia_72hs2 select f.* from stage_caf_potencia_72hs, jsonb_populate_recordset(null::stage_caf_potencia_72hs2, x) f;
UPDATE stage_caf_potencia_72hs2 SET caf = 'caf2fv';
UPDATE stage_caf_potencia_72hs2 SET id = '02.02';
UPDATE stage_caf_potencia_72hs2 SET date = DATE_TRUNC('minute', date);
INSERT INTO Cafayate.caf_potencia_72hs SELECT * from stage_caf_potencia_72hs2 ON CONFLICT DO NOTHING;
INSERT INTO Cafayate.caf_potencia SELECT * from stage_caf_potencia_72hs2 ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS stage_caf_potencia_72hs;
DROP TABLE IF EXISTS stage_caf_potencia_72hs2;
CREATE TEMP TABLE stage_caf_potencia_72hs(x jsonb);
CREATE TEMP TABLE stage_caf_potencia_72hs2(date timestamptz, val numeric, id text, caf text);
DO $$
DECLARE startdate text := to_char(current_date - interval '3 days', 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_caf_potencia_72hs FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/ef0865ea-8934-11e9-8620-42010afa015a/events?apiKey=e385a1a5-0441-4e06-be58-162731a7d4f9.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_caf_potencia_72hs2 select f.* from stage_caf_potencia_72hs, jsonb_populate_recordset(null::stage_caf_potencia_72hs2, x) f;
UPDATE stage_caf_potencia_72hs2 SET caf = 'caf1fv';
UPDATE stage_caf_potencia_72hs2 SET id = '03.01';
UPDATE stage_caf_potencia_72hs2 SET date = DATE_TRUNC('minute', date);
INSERT INTO Cafayate.caf_potencia_72hs SELECT * from stage_caf_potencia_72hs2 ON CONFLICT DO NOTHING;
INSERT INTO Cafayate.caf_potencia SELECT * from stage_caf_potencia_72hs2 ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS stage_caf_potencia_72hs;
DROP TABLE IF EXISTS stage_caf_potencia_72hs2;
CREATE TEMP TABLE stage_caf_potencia_72hs(x jsonb);
CREATE TEMP TABLE stage_caf_potencia_72hs2(date timestamptz, val numeric, id text, caf text);
DO $$
DECLARE startdate text := to_char(current_date - interval '3 days', 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_caf_potencia_72hs FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/f12df358-8934-11e9-8620-42010afa015a/events?apiKey=e385a1a5-0441-4e06-be58-162731a7d4f9.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_caf_potencia_72hs2 select f.* from stage_caf_potencia_72hs, jsonb_populate_recordset(null::stage_caf_potencia_72hs2, x) f;
UPDATE stage_caf_potencia_72hs2 SET caf = 'caf2fv';
UPDATE stage_caf_potencia_72hs2 SET id = '03.02';
UPDATE stage_caf_potencia_72hs2 SET date = DATE_TRUNC('minute', date);
INSERT INTO Cafayate.caf_potencia_72hs SELECT * from stage_caf_potencia_72hs2 ON CONFLICT DO NOTHING;
INSERT INTO Cafayate.caf_potencia SELECT * from stage_caf_potencia_72hs2 ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS stage_caf_potencia_72hs;
DROP TABLE IF EXISTS stage_caf_potencia_72hs2;
CREATE TEMP TABLE stage_caf_potencia_72hs(x jsonb);
CREATE TEMP TABLE stage_caf_potencia_72hs2(date timestamptz, val numeric, id text, caf text);
DO $$
DECLARE startdate text := to_char(current_date - interval '3 days', 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_caf_potencia_72hs FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/fc9614c8-8934-11e9-8620-42010afa015a/events?apiKey=e385a1a5-0441-4e06-be58-162731a7d4f9.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_caf_potencia_72hs2 select f.* from stage_caf_potencia_72hs, jsonb_populate_recordset(null::stage_caf_potencia_72hs2, x) f;
UPDATE stage_caf_potencia_72hs2 SET caf = 'caf1fv';
UPDATE stage_caf_potencia_72hs2 SET id = '04.01';
UPDATE stage_caf_potencia_72hs2 SET date = DATE_TRUNC('minute', date);
INSERT INTO Cafayate.caf_potencia_72hs SELECT * from stage_caf_potencia_72hs2 ON CONFLICT DO NOTHING;
INSERT INTO Cafayate.caf_potencia SELECT * from stage_caf_potencia_72hs2 ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS stage_caf_potencia_72hs;
DROP TABLE IF EXISTS stage_caf_potencia_72hs2;
CREATE TEMP TABLE stage_caf_potencia_72hs(x jsonb);
CREATE TEMP TABLE stage_caf_potencia_72hs2(date timestamptz, val numeric, id text, caf text);
DO $$
DECLARE startdate text := to_char(current_date - interval '3 days', 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_caf_potencia_72hs FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/ff0c519a-8934-11e9-8620-42010afa015a/events?apiKey=e385a1a5-0441-4e06-be58-162731a7d4f9.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_caf_potencia_72hs2 select f.* from stage_caf_potencia_72hs, jsonb_populate_recordset(null::stage_caf_potencia_72hs2, x) f;
UPDATE stage_caf_potencia_72hs2 SET caf = 'caf2fv';
UPDATE stage_caf_potencia_72hs2 SET id = '04.02';
UPDATE stage_caf_potencia_72hs2 SET date = DATE_TRUNC('minute', date);
INSERT INTO Cafayate.caf_potencia_72hs SELECT * from stage_caf_potencia_72hs2 ON CONFLICT DO NOTHING;
INSERT INTO Cafayate.caf_potencia SELECT * from stage_caf_potencia_72hs2 ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS stage_caf_potencia_72hs;
DROP TABLE IF EXISTS stage_caf_potencia_72hs2;
CREATE TEMP TABLE stage_caf_potencia_72hs(x jsonb);
CREATE TEMP TABLE stage_caf_potencia_72hs2(date timestamptz, val numeric, id text, caf text);
DO $$
DECLARE startdate text := to_char(current_date - interval '3 days', 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_caf_potencia_72hs FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/0aeb534e-8935-11e9-8620-42010afa015a/events?apiKey=e385a1a5-0441-4e06-be58-162731a7d4f9.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_caf_potencia_72hs2 select f.* from stage_caf_potencia_72hs, jsonb_populate_recordset(null::stage_caf_potencia_72hs2, x) f;
UPDATE stage_caf_potencia_72hs2 SET caf = 'caf1fv';
UPDATE stage_caf_potencia_72hs2 SET id = '05.01';
UPDATE stage_caf_potencia_72hs2 SET date = DATE_TRUNC('minute', date);
INSERT INTO Cafayate.caf_potencia_72hs SELECT * from stage_caf_potencia_72hs2 ON CONFLICT DO NOTHING;
INSERT INTO Cafayate.caf_potencia SELECT * from stage_caf_potencia_72hs2 ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS stage_caf_potencia_72hs;
DROP TABLE IF EXISTS stage_caf_potencia_72hs2;
CREATE TEMP TABLE stage_caf_potencia_72hs(x jsonb);
CREATE TEMP TABLE stage_caf_potencia_72hs2(date timestamptz, val numeric, id text, caf text);
DO $$
DECLARE startdate text := to_char(current_date - interval '3 days', 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_caf_potencia_72hs FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/0c1bf6ce-8935-11e9-8620-42010afa015a/events?apiKey=e385a1a5-0441-4e06-be58-162731a7d4f9.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_caf_potencia_72hs2 select f.* from stage_caf_potencia_72hs, jsonb_populate_recordset(null::stage_caf_potencia_72hs2, x) f;
UPDATE stage_caf_potencia_72hs2 SET caf = 'caf2fv';
UPDATE stage_caf_potencia_72hs2 SET id = '05.02';
UPDATE stage_caf_potencia_72hs2 SET date = DATE_TRUNC('minute', date);
INSERT INTO Cafayate.caf_potencia_72hs SELECT * from stage_caf_potencia_72hs2 ON CONFLICT DO NOTHING;
INSERT INTO Cafayate.caf_potencia SELECT * from stage_caf_potencia_72hs2 ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS stage_caf_potencia_72hs;
DROP TABLE IF EXISTS stage_caf_potencia_72hs2;
CREATE TEMP TABLE stage_caf_potencia_72hs(x jsonb);
CREATE TEMP TABLE stage_caf_potencia_72hs2(date timestamptz, val numeric, id text, caf text);
DO $$
DECLARE startdate text := to_char(current_date - interval '3 days', 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_caf_potencia_72hs FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/1912d38e-8935-11e9-8620-42010afa015a/events?apiKey=e385a1a5-0441-4e06-be58-162731a7d4f9.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_caf_potencia_72hs2 select f.* from stage_caf_potencia_72hs, jsonb_populate_recordset(null::stage_caf_potencia_72hs2, x) f;
UPDATE stage_caf_potencia_72hs2 SET caf = 'caf1fv';
UPDATE stage_caf_potencia_72hs2 SET id = '06.01';
UPDATE stage_caf_potencia_72hs2 SET date = DATE_TRUNC('minute', date);
INSERT INTO Cafayate.caf_potencia_72hs SELECT * from stage_caf_potencia_72hs2 ON CONFLICT DO NOTHING;
INSERT INTO Cafayate.caf_potencia SELECT * from stage_caf_potencia_72hs2 ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS stage_caf_potencia_72hs;
DROP TABLE IF EXISTS stage_caf_potencia_72hs2;
CREATE TEMP TABLE stage_caf_potencia_72hs(x jsonb);
CREATE TEMP TABLE stage_caf_potencia_72hs2(date timestamptz, val numeric, id text, caf text);
DO $$
DECLARE startdate text := to_char(current_date - interval '3 days', 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_caf_potencia_72hs FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/1a5b1e4a-8935-11e9-8620-42010afa015a/events?apiKey=e385a1a5-0441-4e06-be58-162731a7d4f9.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_caf_potencia_72hs2 select f.* from stage_caf_potencia_72hs, jsonb_populate_recordset(null::stage_caf_potencia_72hs2, x) f;
UPDATE stage_caf_potencia_72hs2 SET caf = 'caf2fv';
UPDATE stage_caf_potencia_72hs2 SET id = '06.02';
UPDATE stage_caf_potencia_72hs2 SET date = DATE_TRUNC('minute', date);
INSERT INTO Cafayate.caf_potencia_72hs SELECT * from stage_caf_potencia_72hs2 ON CONFLICT DO NOTHING;
INSERT INTO Cafayate.caf_potencia SELECT * from stage_caf_potencia_72hs2 ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS stage_caf_potencia_72hs;
DROP TABLE IF EXISTS stage_caf_potencia_72hs2;
CREATE TEMP TABLE stage_caf_potencia_72hs(x jsonb);
CREATE TEMP TABLE stage_caf_potencia_72hs2(date timestamptz, val numeric, id text, caf text);
DO $$
DECLARE startdate text := to_char(current_date - interval '3 days', 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_caf_potencia_72hs FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/28091ee8-8935-11e9-8620-42010afa015a/events?apiKey=e385a1a5-0441-4e06-be58-162731a7d4f9.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_caf_potencia_72hs2 select f.* from stage_caf_potencia_72hs, jsonb_populate_recordset(null::stage_caf_potencia_72hs2, x) f;
UPDATE stage_caf_potencia_72hs2 SET caf = 'caf1fv';
UPDATE stage_caf_potencia_72hs2 SET id = '07.01';
UPDATE stage_caf_potencia_72hs2 SET date = DATE_TRUNC('minute', date);
INSERT INTO Cafayate.caf_potencia_72hs SELECT * from stage_caf_potencia_72hs2 ON CONFLICT DO NOTHING;
INSERT INTO Cafayate.caf_potencia SELECT * from stage_caf_potencia_72hs2 ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS stage_caf_potencia_72hs;
DROP TABLE IF EXISTS stage_caf_potencia_72hs2;
CREATE TEMP TABLE stage_caf_potencia_72hs(x jsonb);
CREATE TEMP TABLE stage_caf_potencia_72hs2(date timestamptz, val numeric, id text, caf text);
DO $$
DECLARE startdate text := to_char(current_date - interval '3 days', 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_caf_potencia_72hs FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/2968598e-8935-11e9-8620-42010afa015a/events?apiKey=e385a1a5-0441-4e06-be58-162731a7d4f9.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_caf_potencia_72hs2 select f.* from stage_caf_potencia_72hs, jsonb_populate_recordset(null::stage_caf_potencia_72hs2, x) f;
UPDATE stage_caf_potencia_72hs2 SET caf = 'caf2fv';
UPDATE stage_caf_potencia_72hs2 SET id = '07.02';
UPDATE stage_caf_potencia_72hs2 SET date = DATE_TRUNC('minute', date);
INSERT INTO Cafayate.caf_potencia_72hs SELECT * from stage_caf_potencia_72hs2 ON CONFLICT DO NOTHING;
INSERT INTO Cafayate.caf_potencia SELECT * from stage_caf_potencia_72hs2 ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS stage_caf_potencia_72hs;
DROP TABLE IF EXISTS stage_caf_potencia_72hs2;
CREATE TEMP TABLE stage_caf_potencia_72hs(x jsonb);
CREATE TEMP TABLE stage_caf_potencia_72hs2(date timestamptz, val numeric, id text, caf text);
DO $$
DECLARE startdate text := to_char(current_date - interval '3 days', 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_caf_potencia_72hs FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/354f77e6-8935-11e9-8620-42010afa015a/events?apiKey=e385a1a5-0441-4e06-be58-162731a7d4f9.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_caf_potencia_72hs2 select f.* from stage_caf_potencia_72hs, jsonb_populate_recordset(null::stage_caf_potencia_72hs2, x) f;
UPDATE stage_caf_potencia_72hs2 SET caf = 'caf1fv';
UPDATE stage_caf_potencia_72hs2 SET id = '08.01';
UPDATE stage_caf_potencia_72hs2 SET date = DATE_TRUNC('minute', date);
INSERT INTO Cafayate.caf_potencia_72hs SELECT * from stage_caf_potencia_72hs2 ON CONFLICT DO NOTHING;
INSERT INTO Cafayate.caf_potencia SELECT * from stage_caf_potencia_72hs2 ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS stage_caf_potencia_72hs;
DROP TABLE IF EXISTS stage_caf_potencia_72hs2;
CREATE TEMP TABLE stage_caf_potencia_72hs(x jsonb);
CREATE TEMP TABLE stage_caf_potencia_72hs2(date timestamptz, val numeric, id text, caf text);
DO $$
DECLARE startdate text := to_char(current_date - interval '3 days', 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_caf_potencia_72hs FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/36a9f77e-8935-11e9-8620-42010afa015a/events?apiKey=e385a1a5-0441-4e06-be58-162731a7d4f9.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_caf_potencia_72hs2 select f.* from stage_caf_potencia_72hs, jsonb_populate_recordset(null::stage_caf_potencia_72hs2, x) f;
UPDATE stage_caf_potencia_72hs2 SET caf = 'caf2fv';
UPDATE stage_caf_potencia_72hs2 SET id = '08.02';
UPDATE stage_caf_potencia_72hs2 SET date = DATE_TRUNC('minute', date);
INSERT INTO Cafayate.caf_potencia_72hs SELECT * from stage_caf_potencia_72hs2 ON CONFLICT DO NOTHING;
INSERT INTO Cafayate.caf_potencia SELECT * from stage_caf_potencia_72hs2 ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS stage_caf_potencia_72hs;
DROP TABLE IF EXISTS stage_caf_potencia_72hs2;
CREATE TEMP TABLE stage_caf_potencia_72hs(x jsonb);
CREATE TEMP TABLE stage_caf_potencia_72hs2(date timestamptz, val numeric, id text, caf text);
DO $$
DECLARE startdate text := to_char(current_date - interval '3 days', 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_caf_potencia_72hs FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/454c3260-8935-11e9-8620-42010afa015a/events?apiKey=e385a1a5-0441-4e06-be58-162731a7d4f9.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_caf_potencia_72hs2 select f.* from stage_caf_potencia_72hs, jsonb_populate_recordset(null::stage_caf_potencia_72hs2, x) f;
UPDATE stage_caf_potencia_72hs2 SET caf = 'caf1fv';
UPDATE stage_caf_potencia_72hs2 SET id = '09.01';
UPDATE stage_caf_potencia_72hs2 SET date = DATE_TRUNC('minute', date);
INSERT INTO Cafayate.caf_potencia_72hs SELECT * from stage_caf_potencia_72hs2 ON CONFLICT DO NOTHING;
INSERT INTO Cafayate.caf_potencia SELECT * from stage_caf_potencia_72hs2 ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS stage_caf_potencia_72hs;
DROP TABLE IF EXISTS stage_caf_potencia_72hs2;
CREATE TEMP TABLE stage_caf_potencia_72hs(x jsonb);
CREATE TEMP TABLE stage_caf_potencia_72hs2(date timestamptz, val numeric, id text, caf text);
DO $$
DECLARE startdate text := to_char(current_date - interval '3 days', 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_caf_potencia_72hs FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/46a5d346-8935-11e9-8620-42010afa015a/events?apiKey=e385a1a5-0441-4e06-be58-162731a7d4f9.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_caf_potencia_72hs2 select f.* from stage_caf_potencia_72hs, jsonb_populate_recordset(null::stage_caf_potencia_72hs2, x) f;
UPDATE stage_caf_potencia_72hs2 SET caf = 'caf2fv';
UPDATE stage_caf_potencia_72hs2 SET id = '09.02';
UPDATE stage_caf_potencia_72hs2 SET date = DATE_TRUNC('minute', date);
INSERT INTO Cafayate.caf_potencia_72hs SELECT * from stage_caf_potencia_72hs2 ON CONFLICT DO NOTHING;
INSERT INTO Cafayate.caf_potencia SELECT * from stage_caf_potencia_72hs2 ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS stage_caf_potencia_72hs;
DROP TABLE IF EXISTS stage_caf_potencia_72hs2;
CREATE TEMP TABLE stage_caf_potencia_72hs(x jsonb);
CREATE TEMP TABLE stage_caf_potencia_72hs2(date timestamptz, val numeric, id text, caf text);
DO $$
DECLARE startdate text := to_char(current_date - interval '3 days', 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_caf_potencia_72hs FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/536166d6-8935-11e9-8620-42010afa015a/events?apiKey=e385a1a5-0441-4e06-be58-162731a7d4f9.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_caf_potencia_72hs2 select f.* from stage_caf_potencia_72hs, jsonb_populate_recordset(null::stage_caf_potencia_72hs2, x) f;
UPDATE stage_caf_potencia_72hs2 SET caf = 'caf1fv';
UPDATE stage_caf_potencia_72hs2 SET id = '10.01';
UPDATE stage_caf_potencia_72hs2 SET date = DATE_TRUNC('minute', date);
INSERT INTO Cafayate.caf_potencia_72hs SELECT * from stage_caf_potencia_72hs2 ON CONFLICT DO NOTHING;
INSERT INTO Cafayate.caf_potencia SELECT * from stage_caf_potencia_72hs2 ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS stage_caf_potencia_72hs;
DROP TABLE IF EXISTS stage_caf_potencia_72hs2;
CREATE TEMP TABLE stage_caf_potencia_72hs(x jsonb);
CREATE TEMP TABLE stage_caf_potencia_72hs2(date timestamptz, val numeric, id text, caf text);
DO $$
DECLARE startdate text := to_char(current_date - interval '3 days', 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_caf_potencia_72hs FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/54c084d0-8935-11e9-8620-42010afa015a/events?apiKey=e385a1a5-0441-4e06-be58-162731a7d4f9.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_caf_potencia_72hs2 select f.* from stage_caf_potencia_72hs, jsonb_populate_recordset(null::stage_caf_potencia_72hs2, x) f;
UPDATE stage_caf_potencia_72hs2 SET caf = 'caf2fv';
UPDATE stage_caf_potencia_72hs2 SET id = '10.02';
UPDATE stage_caf_potencia_72hs2 SET date = DATE_TRUNC('minute', date);
INSERT INTO Cafayate.caf_potencia_72hs SELECT * from stage_caf_potencia_72hs2 ON CONFLICT DO NOTHING;
INSERT INTO Cafayate.caf_potencia SELECT * from stage_caf_potencia_72hs2 ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS stage_caf_potencia_72hs;
DROP TABLE IF EXISTS stage_caf_potencia_72hs2;
CREATE TEMP TABLE stage_caf_potencia_72hs(x jsonb);
CREATE TEMP TABLE stage_caf_potencia_72hs2(date timestamptz, val numeric, id text, caf text);
DO $$
DECLARE startdate text := to_char(current_date - interval '3 days', 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_caf_potencia_72hs FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/82f32b46-8935-11e9-8620-42010afa015a/events?apiKey=e385a1a5-0441-4e06-be58-162731a7d4f9.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_caf_potencia_72hs2 select f.* from stage_caf_potencia_72hs, jsonb_populate_recordset(null::stage_caf_potencia_72hs2, x) f;
UPDATE stage_caf_potencia_72hs2 SET caf = 'caf1fv';
UPDATE stage_caf_potencia_72hs2 SET id = '11.01';
UPDATE stage_caf_potencia_72hs2 SET date = DATE_TRUNC('minute', date);
INSERT INTO Cafayate.caf_potencia_72hs SELECT * from stage_caf_potencia_72hs2 ON CONFLICT DO NOTHING;
INSERT INTO Cafayate.caf_potencia SELECT * from stage_caf_potencia_72hs2 ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS stage_caf_potencia_72hs;
DROP TABLE IF EXISTS stage_caf_potencia_72hs2;
CREATE TEMP TABLE stage_caf_potencia_72hs(x jsonb);
CREATE TEMP TABLE stage_caf_potencia_72hs2(date timestamptz, val numeric, id text, caf text);
DO $$
DECLARE startdate text := to_char(current_date - interval '3 days', 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_caf_potencia_72hs FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/6462bb4c-8935-11e9-8620-42010afa015a/events?apiKey=e385a1a5-0441-4e06-be58-162731a7d4f9.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_caf_potencia_72hs2 select f.* from stage_caf_potencia_72hs, jsonb_populate_recordset(null::stage_caf_potencia_72hs2, x) f;
UPDATE stage_caf_potencia_72hs2 SET caf = 'caf2fv';
UPDATE stage_caf_potencia_72hs2 SET id = '11.02';
UPDATE stage_caf_potencia_72hs2 SET date = DATE_TRUNC('minute', date);
INSERT INTO Cafayate.caf_potencia_72hs SELECT * from stage_caf_potencia_72hs2 ON CONFLICT DO NOTHING;
INSERT INTO Cafayate.caf_potencia SELECT * from stage_caf_potencia_72hs2 ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS stage_caf_potencia_72hs;
DROP TABLE IF EXISTS stage_caf_potencia_72hs2;
CREATE TEMP TABLE stage_caf_potencia_72hs(x jsonb);
CREATE TEMP TABLE stage_caf_potencia_72hs2(date timestamptz, val numeric, id text, caf text);
DO $$
DECLARE startdate text := to_char(current_date - interval '3 days', 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_caf_potencia_72hs FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/65a8c78a-8935-11e9-8620-42010afa015a/events?apiKey=e385a1a5-0441-4e06-be58-162731a7d4f9.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_caf_potencia_72hs2 select f.* from stage_caf_potencia_72hs, jsonb_populate_recordset(null::stage_caf_potencia_72hs2, x) f;
UPDATE stage_caf_potencia_72hs2 SET caf = 'caf1fv';
UPDATE stage_caf_potencia_72hs2 SET id = '12.01';
UPDATE stage_caf_potencia_72hs2 SET date = DATE_TRUNC('minute', date);
INSERT INTO Cafayate.caf_potencia_72hs SELECT * from stage_caf_potencia_72hs2 ON CONFLICT DO NOTHING;
INSERT INTO Cafayate.caf_potencia SELECT * from stage_caf_potencia_72hs2 ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS stage_caf_potencia_72hs;
DROP TABLE IF EXISTS stage_caf_potencia_72hs2;
CREATE TEMP TABLE stage_caf_potencia_72hs(x jsonb);
CREATE TEMP TABLE stage_caf_potencia_72hs2(date timestamptz, val numeric, id text, caf text);
DO $$
DECLARE startdate text := to_char(current_date - interval '3 days', 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_caf_potencia_72hs FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/7305441c-8935-11e9-8620-42010afa015a/events?apiKey=e385a1a5-0441-4e06-be58-162731a7d4f9.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_caf_potencia_72hs2 select f.* from stage_caf_potencia_72hs, jsonb_populate_recordset(null::stage_caf_potencia_72hs2, x) f;
UPDATE stage_caf_potencia_72hs2 SET caf = 'caf2fv';
UPDATE stage_caf_potencia_72hs2 SET id = '12.02';
UPDATE stage_caf_potencia_72hs2 SET date = DATE_TRUNC('minute', date);
INSERT INTO Cafayate.caf_potencia_72hs SELECT * from stage_caf_potencia_72hs2 ON CONFLICT DO NOTHING;
INSERT INTO Cafayate.caf_potencia SELECT * from stage_caf_potencia_72hs2 ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS stage_caf_potencia_72hs;
DROP TABLE IF EXISTS stage_caf_potencia_72hs2;
CREATE TEMP TABLE stage_caf_potencia_72hs(x jsonb);
CREATE TEMP TABLE stage_caf_potencia_72hs2(date timestamptz, val numeric, id text, caf text);
DO $$
DECLARE startdate text := to_char(current_date - interval '3 days', 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_caf_potencia_72hs FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/7468c05e-8935-11e9-8620-42010afa015a/events?apiKey=e385a1a5-0441-4e06-be58-162731a7d4f9.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_caf_potencia_72hs2 select f.* from stage_caf_potencia_72hs, jsonb_populate_recordset(null::stage_caf_potencia_72hs2, x) f;
UPDATE stage_caf_potencia_72hs2 SET caf = 'caf1fv';
UPDATE stage_caf_potencia_72hs2 SET id = '13.01';
UPDATE stage_caf_potencia_72hs2 SET date = DATE_TRUNC('minute', date);
INSERT INTO Cafayate.caf_potencia_72hs SELECT * from stage_caf_potencia_72hs2 ON CONFLICT DO NOTHING;
INSERT INTO Cafayate.caf_potencia SELECT * from stage_caf_potencia_72hs2 ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS stage_caf_potencia_72hs;
DROP TABLE IF EXISTS stage_caf_potencia_72hs2;
CREATE TEMP TABLE stage_caf_potencia_72hs(x jsonb);
CREATE TEMP TABLE stage_caf_potencia_72hs2(date timestamptz, val numeric, id text, caf text);
DO $$
DECLARE startdate text := to_char(current_date - interval '3 days', 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_caf_potencia_72hs FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/81a5fbd8-8935-11e9-8620-42010afa015a/events?apiKey=e385a1a5-0441-4e06-be58-162731a7d4f9.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_caf_potencia_72hs2 select f.* from stage_caf_potencia_72hs, jsonb_populate_recordset(null::stage_caf_potencia_72hs2, x) f;
UPDATE stage_caf_potencia_72hs2 SET caf = 'caf2fv';
UPDATE stage_caf_potencia_72hs2 SET id = '13.02';
UPDATE stage_caf_potencia_72hs2 SET date = DATE_TRUNC('minute', date);
INSERT INTO Cafayate.caf_potencia_72hs SELECT * from stage_caf_potencia_72hs2 ON CONFLICT DO NOTHING;
INSERT INTO Cafayate.caf_potencia SELECT * from stage_caf_potencia_72hs2 ON CONFLICT DO NOTHING;


-----------------------------------------------------------------------------------------------------------


--UPDATE cafayate.caf_potencia SET val = null WHERE id like '06%' AND date >= '2022-11-22 00:00:00-03';
DELETE FROM cafayate.caf_potencia WHERE id like '06%' AND date >= '2022-11-22 00:00:00-03';
-------------------------------------------------------------------------------------------------------
DELETE FROM Cafayate.caf_availability_72hs WHERE date < now() - interval '3 days';
	
DROP TABLE IF EXISTS stage_caf_availability_72hs;
DROP TABLE IF EXISTS stage_caf_availability_72hs2;
CREATE TEMP TABLE stage_caf_availability_72hs(x jsonb);
CREATE TEMP TABLE stage_caf_availability_72hs2(date timestamptz, val numeric, id text, caf text);
DO $$
DECLARE startdate text := to_char(current_date - interval '3 days', 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_caf_availability_72hs FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/6a24d42c-99a5-11e9-b890-525400b2701a/events?apiKey=e385a1a5-0441-4e06-be58-162731a7d4f9.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_caf_availability_72hs2 select f.* from stage_caf_availability_72hs, jsonb_populate_recordset(null::stage_caf_availability_72hs2, x) f;
UPDATE stage_caf_availability_72hs2 SET caf = 'caf1fv';
UPDATE stage_caf_availability_72hs2 SET id = '01.01';
UPDATE stage_caf_availability_72hs2 SET date = DATE_TRUNC('minute', date);
INSERT INTO Cafayate.caf_availability_72hs SELECT * from stage_caf_availability_72hs2 ON CONFLICT DO NOTHING;
INSERT INTO Cafayate.caf_availability SELECT * from stage_caf_availability_72hs2 ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS stage_caf_availability_72hs;
DROP TABLE IF EXISTS stage_caf_availability_72hs2;
CREATE TEMP TABLE stage_caf_availability_72hs(x jsonb);
CREATE TEMP TABLE stage_caf_availability_72hs2(date timestamptz, val numeric, id text, caf text);
DO $$
DECLARE startdate text := to_char(current_date - interval '3 days', 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_caf_availability_72hs FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/6c9659ce-99a5-11e9-b890-525400b2701a/events?apiKey=e385a1a5-0441-4e06-be58-162731a7d4f9.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_caf_availability_72hs2 select f.* from stage_caf_availability_72hs, jsonb_populate_recordset(null::stage_caf_availability_72hs2, x) f;
UPDATE stage_caf_availability_72hs2 SET caf = 'caf2fv';
UPDATE stage_caf_availability_72hs2 SET id = '01.02';
UPDATE stage_caf_availability_72hs2 SET date = DATE_TRUNC('minute', date);
INSERT INTO Cafayate.caf_availability_72hs SELECT * from stage_caf_availability_72hs2 ON CONFLICT DO NOTHING;
INSERT INTO Cafayate.caf_availability SELECT * from stage_caf_availability_72hs2 ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS stage_caf_availability_72hs;
DROP TABLE IF EXISTS stage_caf_availability_72hs2;
CREATE TEMP TABLE stage_caf_availability_72hs(x jsonb);
CREATE TEMP TABLE stage_caf_availability_72hs2(date timestamptz, val numeric, id text, caf text);
DO $$
DECLARE startdate text := to_char(current_date - interval '3 days', 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_caf_availability_72hs FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/80165a26-99a5-11e9-b890-525400b2701a/events?apiKey=e385a1a5-0441-4e06-be58-162731a7d4f9.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_caf_availability_72hs2 select f.* from stage_caf_availability_72hs, jsonb_populate_recordset(null::stage_caf_availability_72hs2, x) f;
UPDATE stage_caf_availability_72hs2 SET caf = 'caf1fv';
UPDATE stage_caf_availability_72hs2 SET id = '02.01';
UPDATE stage_caf_availability_72hs2 SET date = DATE_TRUNC('minute', date);
INSERT INTO Cafayate.caf_availability_72hs SELECT * from stage_caf_availability_72hs2 ON CONFLICT DO NOTHING;
INSERT INTO Cafayate.caf_availability SELECT * from stage_caf_availability_72hs2 ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS stage_caf_availability_72hs;
DROP TABLE IF EXISTS stage_caf_availability_72hs2;
CREATE TEMP TABLE stage_caf_availability_72hs(x jsonb);
CREATE TEMP TABLE stage_caf_availability_72hs2(date timestamptz, val numeric, id text, caf text);
DO $$
DECLARE startdate text := to_char(current_date - interval '3 days', 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_caf_availability_72hs FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/82782e70-99a5-11e9-b890-525400b2701a/events?apiKey=e385a1a5-0441-4e06-be58-162731a7d4f9.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_caf_availability_72hs2 select f.* from stage_caf_availability_72hs, jsonb_populate_recordset(null::stage_caf_availability_72hs2, x) f;
UPDATE stage_caf_availability_72hs2 SET caf = 'caf2fv';
UPDATE stage_caf_availability_72hs2 SET id = '02.02';
UPDATE stage_caf_availability_72hs2 SET date = DATE_TRUNC('minute', date);
INSERT INTO Cafayate.caf_availability_72hs SELECT * from stage_caf_availability_72hs2 ON CONFLICT DO NOTHING;
INSERT INTO Cafayate.caf_availability SELECT * from stage_caf_availability_72hs2 ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS stage_caf_availability_72hs;
DROP TABLE IF EXISTS stage_caf_availability_72hs2;
CREATE TEMP TABLE stage_caf_availability_72hs(x jsonb);
CREATE TEMP TABLE stage_caf_availability_72hs2(date timestamptz, val numeric, id text, caf text);
DO $$
DECLARE startdate text := to_char(current_date - interval '3 days', 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_caf_availability_72hs FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/95b368ba-99a5-11e9-b890-525400b2701a/events?apiKey=e385a1a5-0441-4e06-be58-162731a7d4f9.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_caf_availability_72hs2 select f.* from stage_caf_availability_72hs, jsonb_populate_recordset(null::stage_caf_availability_72hs2, x) f;
UPDATE stage_caf_availability_72hs2 SET caf = 'caf1fv';
UPDATE stage_caf_availability_72hs2 SET id = '03.01';
UPDATE stage_caf_availability_72hs2 SET date = DATE_TRUNC('minute', date);
INSERT INTO Cafayate.caf_availability_72hs SELECT * from stage_caf_availability_72hs2 ON CONFLICT DO NOTHING;
INSERT INTO Cafayate.caf_availability SELECT * from stage_caf_availability_72hs2 ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS stage_caf_availability_72hs;
DROP TABLE IF EXISTS stage_caf_availability_72hs2;
CREATE TEMP TABLE stage_caf_availability_72hs(x jsonb);
CREATE TEMP TABLE stage_caf_availability_72hs2(date timestamptz, val numeric, id text, caf text);
DO $$
DECLARE startdate text := to_char(current_date - interval '3 days', 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_caf_availability_72hs FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/98c1f6ac-99a5-11e9-b890-525400b2701a/events?apiKey=e385a1a5-0441-4e06-be58-162731a7d4f9.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_caf_availability_72hs2 select f.* from stage_caf_availability_72hs, jsonb_populate_recordset(null::stage_caf_availability_72hs2, x) f;
UPDATE stage_caf_availability_72hs2 SET caf = 'caf2fv';
UPDATE stage_caf_availability_72hs2 SET id = '03.02';
UPDATE stage_caf_availability_72hs2 SET date = DATE_TRUNC('minute', date);
INSERT INTO Cafayate.caf_availability_72hs SELECT * from stage_caf_availability_72hs2 ON CONFLICT DO NOTHING;
INSERT INTO Cafayate.caf_availability SELECT * from stage_caf_availability_72hs2 ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS stage_caf_availability_72hs;
DROP TABLE IF EXISTS stage_caf_availability_72hs2;
CREATE TEMP TABLE stage_caf_availability_72hs(x jsonb);
CREATE TEMP TABLE stage_caf_availability_72hs2(date timestamptz, val numeric, id text, caf text);
DO $$
DECLARE startdate text := to_char(current_date - interval '3 days', 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_caf_availability_72hs FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/ab7c7628-99a5-11e9-b890-525400b2701a/events?apiKey=e385a1a5-0441-4e06-be58-162731a7d4f9.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_caf_availability_72hs2 select f.* from stage_caf_availability_72hs, jsonb_populate_recordset(null::stage_caf_availability_72hs2, x) f;
UPDATE stage_caf_availability_72hs2 SET caf = 'caf1fv';
UPDATE stage_caf_availability_72hs2 SET id = '04.01';
UPDATE stage_caf_availability_72hs2 SET date = DATE_TRUNC('minute', date);
INSERT INTO Cafayate.caf_availability_72hs SELECT * from stage_caf_availability_72hs2 ON CONFLICT DO NOTHING;
INSERT INTO Cafayate.caf_availability SELECT * from stage_caf_availability_72hs2 ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS stage_caf_availability_72hs;
DROP TABLE IF EXISTS stage_caf_availability_72hs2;
CREATE TEMP TABLE stage_caf_availability_72hs(x jsonb);
CREATE TEMP TABLE stage_caf_availability_72hs2(date timestamptz, val numeric, id text, caf text);
DO $$
DECLARE startdate text := to_char(current_date - interval '3 days', 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_caf_availability_72hs FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/aec86e9a-99a5-11e9-b890-525400b2701a/events?apiKey=e385a1a5-0441-4e06-be58-162731a7d4f9.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_caf_availability_72hs2 select f.* from stage_caf_availability_72hs, jsonb_populate_recordset(null::stage_caf_availability_72hs2, x) f;
UPDATE stage_caf_availability_72hs2 SET caf = 'caf2fv';
UPDATE stage_caf_availability_72hs2 SET id = '04.02';
UPDATE stage_caf_availability_72hs2 SET date = DATE_TRUNC('minute', date);
INSERT INTO Cafayate.caf_availability_72hs SELECT * from stage_caf_availability_72hs2 ON CONFLICT DO NOTHING;
INSERT INTO Cafayate.caf_availability SELECT * from stage_caf_availability_72hs2 ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS stage_caf_availability_72hs;
DROP TABLE IF EXISTS stage_caf_availability_72hs2;
CREATE TEMP TABLE stage_caf_availability_72hs(x jsonb);
CREATE TEMP TABLE stage_caf_availability_72hs2(date timestamptz, val numeric, id text, caf text);
DO $$
DECLARE startdate text := to_char(current_date - interval '3 days', 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_caf_availability_72hs FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/c1d50264-99a5-11e9-b890-525400b2701a/events?apiKey=e385a1a5-0441-4e06-be58-162731a7d4f9.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_caf_availability_72hs2 select f.* from stage_caf_availability_72hs, jsonb_populate_recordset(null::stage_caf_availability_72hs2, x) f;
UPDATE stage_caf_availability_72hs2 SET caf = 'caf1fv';
UPDATE stage_caf_availability_72hs2 SET id = '05.01';
UPDATE stage_caf_availability_72hs2 SET date = DATE_TRUNC('minute', date);
INSERT INTO Cafayate.caf_availability_72hs SELECT * from stage_caf_availability_72hs2 ON CONFLICT DO NOTHING;
INSERT INTO Cafayate.caf_availability SELECT * from stage_caf_availability_72hs2 ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS stage_caf_availability_72hs;
DROP TABLE IF EXISTS stage_caf_availability_72hs2;
CREATE TEMP TABLE stage_caf_availability_72hs(x jsonb);
CREATE TEMP TABLE stage_caf_availability_72hs2(date timestamptz, val numeric, id text, caf text);
DO $$
DECLARE startdate text := to_char(current_date - interval '3 days', 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_caf_availability_72hs FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/c424a600-99a5-11e9-b890-525400b2701a/events?apiKey=e385a1a5-0441-4e06-be58-162731a7d4f9.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_caf_availability_72hs2 select f.* from stage_caf_availability_72hs, jsonb_populate_recordset(null::stage_caf_availability_72hs2, x) f;
UPDATE stage_caf_availability_72hs2 SET caf = 'caf2fv';
UPDATE stage_caf_availability_72hs2 SET id = '05.02';
UPDATE stage_caf_availability_72hs2 SET date = DATE_TRUNC('minute', date);
INSERT INTO Cafayate.caf_availability_72hs SELECT * from stage_caf_availability_72hs2 ON CONFLICT DO NOTHING;
INSERT INTO Cafayate.caf_availability SELECT * from stage_caf_availability_72hs2 ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS stage_caf_availability_72hs;
DROP TABLE IF EXISTS stage_caf_availability_72hs2;
CREATE TEMP TABLE stage_caf_availability_72hs(x jsonb);
CREATE TEMP TABLE stage_caf_availability_72hs2(date timestamptz, val numeric, id text, caf text);
DO $$
DECLARE startdate text := to_char(current_date - interval '3 days', 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_caf_availability_72hs FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/d85ad608-99a5-11e9-b890-525400b2701a/events?apiKey=e385a1a5-0441-4e06-be58-162731a7d4f9.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_caf_availability_72hs2 select f.* from stage_caf_availability_72hs, jsonb_populate_recordset(null::stage_caf_availability_72hs2, x) f;
UPDATE stage_caf_availability_72hs2 SET caf = 'caf1fv';
UPDATE stage_caf_availability_72hs2 SET id = '06.01';
UPDATE stage_caf_availability_72hs2 SET date = DATE_TRUNC('minute', date);
INSERT INTO Cafayate.caf_availability_72hs SELECT * from stage_caf_availability_72hs2 ON CONFLICT DO NOTHING;
INSERT INTO Cafayate.caf_availability SELECT * from stage_caf_availability_72hs2 ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS stage_caf_availability_72hs;
DROP TABLE IF EXISTS stage_caf_availability_72hs2;
CREATE TEMP TABLE stage_caf_availability_72hs(x jsonb);
CREATE TEMP TABLE stage_caf_availability_72hs2(date timestamptz, val numeric, id text, caf text);
DO $$
DECLARE startdate text := to_char(current_date - interval '3 days', 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_caf_availability_72hs FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/dab63802-99a5-11e9-b890-525400b2701a/events?apiKey=e385a1a5-0441-4e06-be58-162731a7d4f9.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_caf_availability_72hs2 select f.* from stage_caf_availability_72hs, jsonb_populate_recordset(null::stage_caf_availability_72hs2, x) f;
UPDATE stage_caf_availability_72hs2 SET caf = 'caf2fv';
UPDATE stage_caf_availability_72hs2 SET id = '06.02';
UPDATE stage_caf_availability_72hs2 SET date = DATE_TRUNC('minute', date);
INSERT INTO Cafayate.caf_availability_72hs SELECT * from stage_caf_availability_72hs2 ON CONFLICT DO NOTHING;
INSERT INTO Cafayate.caf_availability SELECT * from stage_caf_availability_72hs2 ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS stage_caf_availability_72hs;
DROP TABLE IF EXISTS stage_caf_availability_72hs2;
CREATE TEMP TABLE stage_caf_availability_72hs(x jsonb);
CREATE TEMP TABLE stage_caf_availability_72hs2(date timestamptz, val numeric, id text, caf text);
DO $$
DECLARE startdate text := to_char(current_date - interval '3 days', 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_caf_availability_72hs FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/ef0ba6f2-99a5-11e9-b890-525400b2701a/events?apiKey=e385a1a5-0441-4e06-be58-162731a7d4f9.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_caf_availability_72hs2 select f.* from stage_caf_availability_72hs, jsonb_populate_recordset(null::stage_caf_availability_72hs2, x) f;
UPDATE stage_caf_availability_72hs2 SET caf = 'caf1fv';
UPDATE stage_caf_availability_72hs2 SET id = '07.01';
UPDATE stage_caf_availability_72hs2 SET date = DATE_TRUNC('minute', date);
INSERT INTO Cafayate.caf_availability_72hs SELECT * from stage_caf_availability_72hs2 ON CONFLICT DO NOTHING;
INSERT INTO Cafayate.caf_availability SELECT * from stage_caf_availability_72hs2 ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS stage_caf_availability_72hs;
DROP TABLE IF EXISTS stage_caf_availability_72hs2;
CREATE TEMP TABLE stage_caf_availability_72hs(x jsonb);
CREATE TEMP TABLE stage_caf_availability_72hs2(date timestamptz, val numeric, id text, caf text);
DO $$
DECLARE startdate text := to_char(current_date - interval '3 days', 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_caf_availability_72hs FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/f16ff9c0-99a5-11e9-b890-525400b2701a/events?apiKey=e385a1a5-0441-4e06-be58-162731a7d4f9.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_caf_availability_72hs2 select f.* from stage_caf_availability_72hs, jsonb_populate_recordset(null::stage_caf_availability_72hs2, x) f;
UPDATE stage_caf_availability_72hs2 SET caf = 'caf2fv';
UPDATE stage_caf_availability_72hs2 SET id = '07.02';
UPDATE stage_caf_availability_72hs2 SET date = DATE_TRUNC('minute', date);
INSERT INTO Cafayate.caf_availability_72hs SELECT * from stage_caf_availability_72hs2 ON CONFLICT DO NOTHING;
INSERT INTO Cafayate.caf_availability SELECT * from stage_caf_availability_72hs2 ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS stage_caf_availability_72hs;
DROP TABLE IF EXISTS stage_caf_availability_72hs2;
CREATE TEMP TABLE stage_caf_availability_72hs(x jsonb);
CREATE TEMP TABLE stage_caf_availability_72hs2(date timestamptz, val numeric, id text, caf text);
DO $$
DECLARE startdate text := to_char(current_date - interval '3 days', 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_caf_availability_72hs FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/0423a602-99a6-11e9-b890-525400b2701a/events?apiKey=e385a1a5-0441-4e06-be58-162731a7d4f9.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_caf_availability_72hs2 select f.* from stage_caf_availability_72hs, jsonb_populate_recordset(null::stage_caf_availability_72hs2, x) f;
UPDATE stage_caf_availability_72hs2 SET caf = 'caf1fv';
UPDATE stage_caf_availability_72hs2 SET id = '08.01';
UPDATE stage_caf_availability_72hs2 SET date = DATE_TRUNC('minute', date);
INSERT INTO Cafayate.caf_availability_72hs SELECT * from stage_caf_availability_72hs2 ON CONFLICT DO NOTHING;
INSERT INTO Cafayate.caf_availability SELECT * from stage_caf_availability_72hs2 ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS stage_caf_availability_72hs;
DROP TABLE IF EXISTS stage_caf_availability_72hs2;
CREATE TEMP TABLE stage_caf_availability_72hs(x jsonb);
CREATE TEMP TABLE stage_caf_availability_72hs2(date timestamptz, val numeric, id text, caf text);
DO $$
DECLARE startdate text := to_char(current_date - interval '3 days', 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_caf_availability_72hs FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/06914c64-99a6-11e9-b890-525400b2701a/events?apiKey=e385a1a5-0441-4e06-be58-162731a7d4f9.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_caf_availability_72hs2 select f.* from stage_caf_availability_72hs, jsonb_populate_recordset(null::stage_caf_availability_72hs2, x) f;
UPDATE stage_caf_availability_72hs2 SET caf = 'caf2fv';
UPDATE stage_caf_availability_72hs2 SET id = '08.02';
UPDATE stage_caf_availability_72hs2 SET date = DATE_TRUNC('minute', date);
INSERT INTO Cafayate.caf_availability_72hs SELECT * from stage_caf_availability_72hs2 ON CONFLICT DO NOTHING;
INSERT INTO Cafayate.caf_availability SELECT * from stage_caf_availability_72hs2 ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS stage_caf_availability_72hs;
DROP TABLE IF EXISTS stage_caf_availability_72hs2;
CREATE TEMP TABLE stage_caf_availability_72hs(x jsonb);
CREATE TEMP TABLE stage_caf_availability_72hs2(date timestamptz, val numeric, id text, caf text);
DO $$
DECLARE startdate text := to_char(current_date - interval '3 days', 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_caf_availability_72hs FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/1bb7c06e-99a6-11e9-b890-525400b2701a/events?apiKey=e385a1a5-0441-4e06-be58-162731a7d4f9.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_caf_availability_72hs2 select f.* from stage_caf_availability_72hs, jsonb_populate_recordset(null::stage_caf_availability_72hs2, x) f;
UPDATE stage_caf_availability_72hs2 SET caf = 'caf1fv';
UPDATE stage_caf_availability_72hs2 SET id = '09.01';
UPDATE stage_caf_availability_72hs2 SET date = DATE_TRUNC('minute', date);
INSERT INTO Cafayate.caf_availability_72hs SELECT * from stage_caf_availability_72hs2 ON CONFLICT DO NOTHING;
INSERT INTO Cafayate.caf_availability SELECT * from stage_caf_availability_72hs2 ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS stage_caf_availability_72hs;
DROP TABLE IF EXISTS stage_caf_availability_72hs2;
CREATE TEMP TABLE stage_caf_availability_72hs(x jsonb);
CREATE TEMP TABLE stage_caf_availability_72hs2(date timestamptz, val numeric, id text, caf text);
DO $$
DECLARE startdate text := to_char(current_date - interval '3 days', 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_caf_availability_72hs FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/1e26ed84-99a6-11e9-b890-525400b2701a/events?apiKey=e385a1a5-0441-4e06-be58-162731a7d4f9.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_caf_availability_72hs2 select f.* from stage_caf_availability_72hs, jsonb_populate_recordset(null::stage_caf_availability_72hs2, x) f;
UPDATE stage_caf_availability_72hs2 SET caf = 'caf2fv';
UPDATE stage_caf_availability_72hs2 SET id = '09.02';
UPDATE stage_caf_availability_72hs2 SET date = DATE_TRUNC('minute', date);
INSERT INTO Cafayate.caf_availability_72hs SELECT * from stage_caf_availability_72hs2 ON CONFLICT DO NOTHING;
INSERT INTO Cafayate.caf_availability SELECT * from stage_caf_availability_72hs2 ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS stage_caf_availability_72hs;
DROP TABLE IF EXISTS stage_caf_availability_72hs2;
CREATE TEMP TABLE stage_caf_availability_72hs(x jsonb);
CREATE TEMP TABLE stage_caf_availability_72hs2(date timestamptz, val numeric, id text, caf text);
DO $$
DECLARE startdate text := to_char(current_date - interval '3 days', 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_caf_availability_72hs FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/326e59d0-99a6-11e9-b890-525400b2701a/events?apiKey=e385a1a5-0441-4e06-be58-162731a7d4f9.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_caf_availability_72hs2 select f.* from stage_caf_availability_72hs, jsonb_populate_recordset(null::stage_caf_availability_72hs2, x) f;
UPDATE stage_caf_availability_72hs2 SET caf = 'caf1fv';
UPDATE stage_caf_availability_72hs2 SET id = '10.01';
UPDATE stage_caf_availability_72hs2 SET date = DATE_TRUNC('minute', date);
INSERT INTO Cafayate.caf_availability_72hs SELECT * from stage_caf_availability_72hs2 ON CONFLICT DO NOTHING;
INSERT INTO Cafayate.caf_availability SELECT * from stage_caf_availability_72hs2 ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS stage_caf_availability_72hs;
DROP TABLE IF EXISTS stage_caf_availability_72hs2;
CREATE TEMP TABLE stage_caf_availability_72hs(x jsonb);
CREATE TEMP TABLE stage_caf_availability_72hs2(date timestamptz, val numeric, id text, caf text);
DO $$
DECLARE startdate text := to_char(current_date - interval '3 days', 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_caf_availability_72hs FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/34f5555a-99a6-11e9-b890-525400b2701a/events?apiKey=e385a1a5-0441-4e06-be58-162731a7d4f9.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_caf_availability_72hs2 select f.* from stage_caf_availability_72hs, jsonb_populate_recordset(null::stage_caf_availability_72hs2, x) f;
UPDATE stage_caf_availability_72hs2 SET caf = 'caf2fv';
UPDATE stage_caf_availability_72hs2 SET id = '10.02';
UPDATE stage_caf_availability_72hs2 SET date = DATE_TRUNC('minute', date);
INSERT INTO Cafayate.caf_availability_72hs SELECT * from stage_caf_availability_72hs2 ON CONFLICT DO NOTHING;
INSERT INTO Cafayate.caf_availability SELECT * from stage_caf_availability_72hs2 ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS stage_caf_availability_72hs;
DROP TABLE IF EXISTS stage_caf_availability_72hs2;
CREATE TEMP TABLE stage_caf_availability_72hs(x jsonb);
CREATE TEMP TABLE stage_caf_availability_72hs2(date timestamptz, val numeric, id text, caf text);
DO $$
DECLARE startdate text := to_char(current_date - interval '3 days', 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_caf_availability_72hs FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/4c67cb82-99a6-11e9-b890-525400b2701a/events?apiKey=e385a1a5-0441-4e06-be58-162731a7d4f9.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_caf_availability_72hs2 select f.* from stage_caf_availability_72hs, jsonb_populate_recordset(null::stage_caf_availability_72hs2, x) f;
UPDATE stage_caf_availability_72hs2 SET caf = 'caf1fv';
UPDATE stage_caf_availability_72hs2 SET id = '11.01';
UPDATE stage_caf_availability_72hs2 SET date = DATE_TRUNC('minute', date);
INSERT INTO Cafayate.caf_availability_72hs SELECT * from stage_caf_availability_72hs2 ON CONFLICT DO NOTHING;
INSERT INTO Cafayate.caf_availability SELECT * from stage_caf_availability_72hs2 ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS stage_caf_availability_72hs;
DROP TABLE IF EXISTS stage_caf_availability_72hs2;
CREATE TEMP TABLE stage_caf_availability_72hs(x jsonb);
CREATE TEMP TABLE stage_caf_availability_72hs2(date timestamptz, val numeric, id text, caf text);
DO $$
DECLARE startdate text := to_char(current_date - interval '3 days', 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_caf_availability_72hs FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/4ecbcb62-99a6-11e9-b890-525400b2701a/events?apiKey=e385a1a5-0441-4e06-be58-162731a7d4f9.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_caf_availability_72hs2 select f.* from stage_caf_availability_72hs, jsonb_populate_recordset(null::stage_caf_availability_72hs2, x) f;
UPDATE stage_caf_availability_72hs2 SET caf = 'caf2fv';
UPDATE stage_caf_availability_72hs2 SET id = '11.02';
UPDATE stage_caf_availability_72hs2 SET date = DATE_TRUNC('minute', date);
INSERT INTO Cafayate.caf_availability_72hs SELECT * from stage_caf_availability_72hs2 ON CONFLICT DO NOTHING;
INSERT INTO Cafayate.caf_availability SELECT * from stage_caf_availability_72hs2 ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS stage_caf_availability_72hs;
DROP TABLE IF EXISTS stage_caf_availability_72hs2;
CREATE TEMP TABLE stage_caf_availability_72hs(x jsonb);
CREATE TEMP TABLE stage_caf_availability_72hs2(date timestamptz, val numeric, id text, caf text);
DO $$
DECLARE startdate text := to_char(current_date - interval '3 days', 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_caf_availability_72hs FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/62f05bee-99a6-11e9-b890-525400b2701a/events?apiKey=e385a1a5-0441-4e06-be58-162731a7d4f9.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_caf_availability_72hs2 select f.* from stage_caf_availability_72hs, jsonb_populate_recordset(null::stage_caf_availability_72hs2, x) f;
UPDATE stage_caf_availability_72hs2 SET caf = 'caf1fv';
UPDATE stage_caf_availability_72hs2 SET id = '12.01';
UPDATE stage_caf_availability_72hs2 SET date = DATE_TRUNC('minute', date);
INSERT INTO Cafayate.caf_availability_72hs SELECT * from stage_caf_availability_72hs2 ON CONFLICT DO NOTHING;
INSERT INTO Cafayate.caf_availability SELECT * from stage_caf_availability_72hs2 ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS stage_caf_availability_72hs;
DROP TABLE IF EXISTS stage_caf_availability_72hs2;
CREATE TEMP TABLE stage_caf_availability_72hs(x jsonb);
CREATE TEMP TABLE stage_caf_availability_72hs2(date timestamptz, val numeric, id text, caf text);
DO $$
DECLARE startdate text := to_char(current_date - interval '3 days', 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_caf_availability_72hs FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/655b79ea-99a6-11e9-b890-525400b2701a/events?apiKey=e385a1a5-0441-4e06-be58-162731a7d4f9.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_caf_availability_72hs2 select f.* from stage_caf_availability_72hs, jsonb_populate_recordset(null::stage_caf_availability_72hs2, x) f;
UPDATE stage_caf_availability_72hs2 SET caf = 'caf2fv';
UPDATE stage_caf_availability_72hs2 SET id = '12.02';
UPDATE stage_caf_availability_72hs2 SET date = DATE_TRUNC('minute', date);
INSERT INTO Cafayate.caf_availability_72hs SELECT * from stage_caf_availability_72hs2 ON CONFLICT DO NOTHING;
INSERT INTO Cafayate.caf_availability SELECT * from stage_caf_availability_72hs2 ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS stage_caf_availability_72hs;
DROP TABLE IF EXISTS stage_caf_availability_72hs2;
CREATE TEMP TABLE stage_caf_availability_72hs(x jsonb);
CREATE TEMP TABLE stage_caf_availability_72hs2(date timestamptz, val numeric, id text, caf text);
DO $$
DECLARE startdate text := to_char(current_date - interval '3 days', 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_caf_availability_72hs FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/79f240be-99a6-11e9-b890-525400b2701a/events?apiKey=e385a1a5-0441-4e06-be58-162731a7d4f9.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_caf_availability_72hs2 select f.* from stage_caf_availability_72hs, jsonb_populate_recordset(null::stage_caf_availability_72hs2, x) f;
UPDATE stage_caf_availability_72hs2 SET caf = 'caf1fv';
UPDATE stage_caf_availability_72hs2 SET id = '13.01';
UPDATE stage_caf_availability_72hs2 SET date = DATE_TRUNC('minute', date);
INSERT INTO Cafayate.caf_availability_72hs SELECT * from stage_caf_availability_72hs2 ON CONFLICT DO NOTHING;
INSERT INTO Cafayate.caf_availability SELECT * from stage_caf_availability_72hs2 ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS stage_caf_availability_72hs;
DROP TABLE IF EXISTS stage_caf_availability_72hs2;
CREATE TEMP TABLE stage_caf_availability_72hs(x jsonb);
CREATE TEMP TABLE stage_caf_availability_72hs2(date timestamptz, val numeric, id text, caf text);
DO $$
DECLARE startdate text := to_char(current_date - interval '3 days', 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_caf_availability_72hs FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/7c528fe4-99a6-11e9-b890-525400b2701a/events?apiKey=e385a1a5-0441-4e06-be58-162731a7d4f9.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_caf_availability_72hs2 select f.* from stage_caf_availability_72hs, jsonb_populate_recordset(null::stage_caf_availability_72hs2, x) f;
UPDATE stage_caf_availability_72hs2 SET caf = 'caf2fv';
UPDATE stage_caf_availability_72hs2 SET id = '13.02';
UPDATE stage_caf_availability_72hs2 SET date = DATE_TRUNC('minute', date);
INSERT INTO Cafayate.caf_availability_72hs SELECT * from stage_caf_availability_72hs2 ON CONFLICT DO NOTHING;
INSERT INTO Cafayate.caf_availability SELECT * from stage_caf_availability_72hs2 ON CONFLICT DO NOTHING;




DROP TABLE IF EXISTS Cafayate.caf_hia_72hs ;
DROP TABLE IF EXISTS Cafayate.caf_iia_72hs ;
DROP TABLE IF EXISTS Cafayate.caf_amb_temp_72hs ;
DROP TABLE IF EXISTS Cafayate.caf_wind_speed_72hs ;
DROP TABLE IF EXISTS Cafayate.caf_string_avail_72hs ;

CREATE TABLE Cafayate.caf_hia_72hs(date timestamptz, val numeric, id text);
CREATE TABLE Cafayate.caf_iia_72hs(date timestamptz, val numeric, id text);
CREATE TABLE Cafayate.caf_amb_temp_72hs(date timestamptz, val numeric, id text);
CREATE TABLE Cafayate.caf_wind_speed_72hs(date timestamptz, val numeric, id text);
CREATE TABLE Cafayate.caf_string_avail_72hs(date timestamptz, val numeric, id text);

---------------------------HIA---------------------------------

DROP TABLE IF EXISTS stage_caf_72hs_hia;
DROP TABLE IF EXISTS stage_caf_72hs_hia2;
CREATE TEMP TABLE stage_caf_72hs_hia(x jsonb);
CREATE TEMP TABLE stage_caf_72hs_hia2(date timestamptz, val numeric, id text);
DO $$
DECLARE startdate text := to_char(current_date - interval '3 days', 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_caf_72hs_hia FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/c5c4838a-8934-11e9-8620-42010afa015a/events?apiKey=e385a1a5-0441-4e06-be58-162731a7d4f9.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_caf_72hs_hia2 select f.* from stage_caf_72hs_hia, jsonb_populate_recordset(null::stage_caf_72hs_hia2, x) f;
UPDATE stage_caf_72hs_hia2 SET id = 'Horiz Irrad 7';
UPDATE stage_caf_72hs_hia2 SET date = DATE_TRUNC('minute', date);
INSERT INTO Cafayate.caf_hia_72hs SELECT * from stage_caf_72hs_hia2;

DROP TABLE IF EXISTS stage_caf_72hs_hia;
DROP TABLE IF EXISTS stage_caf_72hs_hia2;
CREATE TEMP TABLE stage_caf_72hs_hia(x jsonb);
CREATE TEMP TABLE stage_caf_72hs_hia2(date timestamptz, val numeric, id text);
DO $$
DECLARE startdate text := to_char(current_date - interval '3 days', 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_caf_72hs_hia FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/c5cf74b6-8934-11e9-8620-42010afa015a/events?apiKey=e385a1a5-0441-4e06-be58-162731a7d4f9.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_caf_72hs_hia2 select f.* from stage_caf_72hs_hia, jsonb_populate_recordset(null::stage_caf_72hs_hia2, x) f;
UPDATE stage_caf_72hs_hia2 SET id = 'Horiz Irrad 9';
UPDATE stage_caf_72hs_hia2 SET date = DATE_TRUNC('minute', date);
INSERT INTO Cafayate.caf_hia_72hs SELECT * from stage_caf_72hs_hia2;

---------------------------IIA-----------------------------

DROP TABLE IF EXISTS stage_caf_72hs_iia;
DROP TABLE IF EXISTS stage_caf_72hs_iia2;
CREATE TEMP TABLE stage_caf_72hs_iia(x jsonb);
CREATE TEMP TABLE stage_caf_72hs_iia2(date timestamptz, val numeric, id text);
DO $$
DECLARE startdate text := to_char(current_date - interval '3 days', 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_caf_72hs_iia FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/c5a1d92a-8934-11e9-8620-42010afa015a/events?apiKey=e385a1a5-0441-4e06-be58-162731a7d4f9.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_caf_72hs_iia2 select f.* from stage_caf_72hs_iia, jsonb_populate_recordset(null::stage_caf_72hs_iia2, x) f;
UPDATE stage_caf_72hs_iia2 SET id = 'Inclined Irrad 7';
UPDATE stage_caf_72hs_iia2 SET date = DATE_TRUNC('minute', date);
INSERT INTO Cafayate.caf_iia_72hs SELECT * from stage_caf_72hs_iia2;

DROP TABLE IF EXISTS stage_caf_72hs_iia;
DROP TABLE IF EXISTS stage_caf_72hs_iia2;
CREATE TEMP TABLE stage_caf_72hs_iia(x jsonb);
CREATE TEMP TABLE stage_caf_72hs_iia2(date timestamptz, val numeric, id text);
DO $$
DECLARE startdate text := to_char(current_date - interval '3 days', 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_caf_72hs_iia FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/c5a4231a-8934-11e9-8620-42010afa015a/events?apiKey=e385a1a5-0441-4e06-be58-162731a7d4f9.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_caf_72hs_iia2 select f.* from stage_caf_72hs_iia, jsonb_populate_recordset(null::stage_caf_72hs_iia2, x) f;
UPDATE stage_caf_72hs_iia2 SET id = 'Inclined Irrad 9';
UPDATE stage_caf_72hs_iia2 SET date = DATE_TRUNC('minute', date);
INSERT INTO Cafayate.caf_iia_72hs SELECT * from stage_caf_72hs_iia2;

----------------------------AMB TEMP---------------------------------

DROP TABLE IF EXISTS stage_caf_72hs_amb_temp;
DROP TABLE IF EXISTS stage_caf_72hs_amb_temp2;
CREATE TEMP TABLE stage_caf_72hs_amb_temp(x jsonb);
CREATE TEMP TABLE stage_caf_72hs_amb_temp2(date timestamptz, val numeric, id text);
DO $$
DECLARE startdate text := to_char(current_date - interval '3 days', 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_caf_72hs_amb_temp FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/c5c4057c-8934-11e9-8620-42010afa015a/events?apiKey=e385a1a5-0441-4e06-be58-162731a7d4f9.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_caf_72hs_amb_temp2 select f.* from stage_caf_72hs_amb_temp, jsonb_populate_recordset(null::stage_caf_72hs_amb_temp2, x) f;
UPDATE stage_caf_72hs_amb_temp2 SET id = 'Amb Temp 7';
UPDATE stage_caf_72hs_amb_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO Cafayate.caf_amb_temp_72hs SELECT * from stage_caf_72hs_amb_temp2;

----------------------------WIND SPEED-------------------------------

DROP TABLE IF EXISTS stage_caf_72hs_wind_speed;
DROP TABLE IF EXISTS stage_caf_72hs_wind_speed2;
CREATE TEMP TABLE stage_caf_72hs_wind_speed(x jsonb);
CREATE TEMP TABLE stage_caf_72hs_wind_speed2(date timestamptz, val numeric, id text);
DO $$
DECLARE startdate text := to_char(current_date - interval '3 days', 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_caf_72hs_wind_speed FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/c5c4496a-8934-11e9-8620-42010afa015a/events?apiKey=e385a1a5-0441-4e06-be58-162731a7d4f9.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_caf_72hs_wind_speed2 select f.* from stage_caf_72hs_wind_speed, jsonb_populate_recordset(null::stage_caf_72hs_wind_speed2, x) f;
UPDATE stage_caf_72hs_wind_speed2 SET id = 'Wind Speed 7';
UPDATE stage_caf_72hs_wind_speed2 SET date = DATE_TRUNC('minute', date);
INSERT INTO Cafayate.caf_wind_speed_72hs SELECT * from stage_caf_72hs_wind_speed2;

----------------------------String avail-------------------------------

DROP TABLE IF EXISTS stage_caf_72hs_string_avail;
DROP TABLE IF EXISTS stage_caf_72hs_string_avail2;
CREATE TEMP TABLE stage_caf_72hs_string_avail(x jsonb);
CREATE TEMP TABLE stage_caf_72hs_string_avail2(date timestamptz, val numeric, id text);
DO $$
DECLARE startdate text := to_char(current_date - interval '3 days', 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_caf_72hs_string_avail FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/8473d95c-8935-11e9-8620-42010afa015a/events?apiKey=e385a1a5-0441-4e06-be58-162731a7d4f9.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_caf_72hs_string_avail2 select f.* from stage_caf_72hs_string_avail, jsonb_populate_recordset(null::stage_caf_72hs_string_avail2, x) f;
UPDATE stage_caf_72hs_string_avail2 SET id = 'String lvl Availability';
UPDATE stage_caf_72hs_string_avail2 SET date = DATE_TRUNC('minute', date);
INSERT INTO Cafayate.caf_string_avail_72hs SELECT * from stage_caf_72hs_string_avail2;
