----------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS stage_scada_exportada;
DROP TABLE IF EXISTS stage_scada_exportada2;
CREATE TEMP TABLE stage_scada_exportada(x jsonb);
CREATE TEMP TABLE stage_scada_exportada2(date timestamptz, val numeric, id text);
DO $$
DECLARE startdate text := to_char(current_date - interval '3 days', 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_scada_exportada FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/66e4ebde-07be-11eb-8c92-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_scada_exportada2 select f.* from stage_scada_exportada, jsonb_populate_recordset(null::stage_scada_exportada2, x) f;
UPDATE stage_scada_exportada2 SET date = DATE_TRUNC('minute', date);
UPDATE stage_scada_exportada2 SET id = 'CAU345FV';
INSERT INTO smec.scada_exportada SELECT * from stage_scada_exportada2 ON CONFLICT DO NOTHING;
----------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS stage_scada_exportada;
DROP TABLE IF EXISTS stage_scada_exportada2;
CREATE TEMP TABLE stage_scada_exportada(x jsonb);
CREATE TEMP TABLE stage_scada_exportada2(date timestamptz, val numeric, id text);
DO $$
DECLARE startdate text := to_char(current_date - interval '3 days', 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_scada_exportada FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/c62ae0c8-0816-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_scada_exportada2 select f.* from stage_scada_exportada, jsonb_populate_recordset(null::stage_scada_exportada2, x) f;
UPDATE stage_scada_exportada2 SET date = DATE_TRUNC('minute', date);
UPDATE stage_scada_exportada2 SET id = 'CAU1FV';
INSERT INTO smec.scada_exportada SELECT * from stage_scada_exportada2 ON CONFLICT DO NOTHING;
----------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS stage_scada_exportada;
DROP TABLE IF EXISTS stage_scada_exportada2;
CREATE TEMP TABLE stage_scada_exportada(x jsonb);
CREATE TEMP TABLE stage_scada_exportada2(date timestamptz, val numeric, id text);
DO $$
DECLARE startdate text := to_char(current_date - interval '3 days', 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_scada_exportada FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/676a0fc6-0809-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_scada_exportada2 select f.* from stage_scada_exportada, jsonb_populate_recordset(null::stage_scada_exportada2, x) f;
UPDATE stage_scada_exportada2 SET date = DATE_TRUNC('minute', date);
UPDATE stage_scada_exportada2 SET id = 'CAU2FV';
INSERT INTO smec.scada_exportada SELECT * from stage_scada_exportada2 ON CONFLICT DO NOTHING;
----------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS stage_scada_exportada;
DROP TABLE IF EXISTS stage_scada_exportada2;
CREATE TEMP TABLE stage_scada_exportada(x jsonb);
CREATE TEMP TABLE stage_scada_exportada2(date timestamptz, val numeric, id text);
DO $$
DECLARE startdate text := to_char(current_date - interval '3 days', 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_scada_exportada FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/8acddc7c-0809-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_scada_exportada2 select f.* from stage_scada_exportada, jsonb_populate_recordset(null::stage_scada_exportada2, x) f;
UPDATE stage_scada_exportada2 SET date = DATE_TRUNC('minute', date);
UPDATE stage_scada_exportada2 SET id = 'CAU3FV';
INSERT INTO smec.scada_exportada SELECT * from stage_scada_exportada2 ON CONFLICT DO NOTHING;
----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS stage_scada_exportada_caf;
DROP TABLE IF EXISTS stage_scada_exportada_caf2;
CREATE TEMP TABLE stage_scada_exportada_caf(x jsonb);
CREATE TEMP TABLE stage_scada_exportada_caf2(date timestamptz, val numeric, id text);
DO $$
DECLARE startdate text := to_char(current_date - interval '3 days', 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_scada_exportada_caf FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/fb2dca56-f33f-11ea-83ff-42010afa015a/events?apiKey=e385a1a5-0441-4e06-be58-162731a7d4f9.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_scada_exportada_caf2 select f.* from stage_scada_exportada_caf, jsonb_populate_recordset(null::stage_scada_exportada_caf2, x) f;
UPDATE stage_scada_exportada_caf2 SET date = DATE_TRUNC('minute', date);
UPDATE stage_scada_exportada_caf2 SET id = 'CAFAFV';
INSERT INTO smec.scada_exportada_caf SELECT * from stage_scada_exportada_caf2 ON CONFLICT ON CONSTRAINT uc_cafayate_scada DO NOTHING;
----------------------------------------------------------------------------------------------------------------