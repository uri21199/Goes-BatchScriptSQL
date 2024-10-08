-----------------------B15-------------------------
DELETE FROM aparente_b15 WHERE date >= now() - interval '1 hour';
					 
DROP TABLE IF EXISTS stage_aparente_b15;
DROP TABLE IF EXISTS stage_aparente_b152;
CREATE TEMP TABLE stage_aparente_b15(x jsonb);
CREATE TEMP TABLE stage_aparente_b152(date timestamptz, val numeric);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '1 hour' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_aparente_b15 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/c98b6834-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_aparente_b152 select f.* from stage_aparente_b15, jsonb_populate_recordset(null::stage_aparente_b152, x) f;
UPDATE stage_aparente_b152 SET date = DATE_TRUNC('minute', date);
INSERT INTO aparente_b15 (date, p_b15) SELECT date, val as p_b15 from stage_aparente_b152 WHERE date >= (now()::timestamptz - interval '1 hour');
DROP TABLE IF EXISTS stage_aparente_b15;
DROP TABLE IF EXISTS stage_aparente_b152;

DROP TABLE IF EXISTS stage_aparente_b15;
DROP TABLE IF EXISTS stage_aparente_b152;
CREATE TEMP TABLE stage_aparente_b15(x jsonb);
CREATE TEMP TABLE stage_aparente_b152(date timestamptz, val numeric);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '1 hour' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_aparente_b15 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/c97cadf8-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_aparente_b152 select f.* from stage_aparente_b15, jsonb_populate_recordset(null::stage_aparente_b152, x) f;
UPDATE stage_aparente_b152 SET date = DATE_TRUNC('minute', date);
UPDATE aparente_b15 SET q_b15 = stage_aparente_b152.val FROM stage_aparente_b152 WHERE aparente_b15.date = stage_aparente_b152.date ;
DROP TABLE IF EXISTS stage_aparente_b15;
DROP TABLE IF EXISTS stage_aparente_b152;
