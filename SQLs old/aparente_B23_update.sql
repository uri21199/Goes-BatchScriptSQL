-----------------------B23-------------------------
DELETE FROM aparente_b23 WHERE date >= now() - interval '1 hour';

DROP TABLE IF EXISTS stage_aparente_b23;
DROP TABLE IF EXISTS stage_aparente_b232;
CREATE TEMP TABLE stage_aparente_b23(x jsonb);
CREATE TEMP TABLE stage_aparente_b232(date timestamptz, val numeric);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '1 hour' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_aparente_b23 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/ccbbda0c-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_aparente_b232 select f.* from stage_aparente_b23, jsonb_populate_recordset(null::stage_aparente_b232, x) f;
UPDATE stage_aparente_b232 SET date = DATE_TRUNC('minute', date);
INSERT INTO aparente_b23 (date, p_b23) SELECT date, val as p_b23 from stage_aparente_b232 WHERE date >= (now()::timestamptz - interval '1 hour');
DROP TABLE IF EXISTS stage_aparente_b23;
DROP TABLE IF EXISTS stage_aparente_b232;

DROP TABLE IF EXISTS stage_aparente_b23;
DROP TABLE IF EXISTS stage_aparente_b232;
CREATE TEMP TABLE stage_aparente_b23(x jsonb);
CREATE TEMP TABLE stage_aparente_b232(date timestamptz, val numeric);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '1 hour' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_aparente_b23 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/ccb0d580-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_aparente_b232 select f.* from stage_aparente_b23, jsonb_populate_recordset(null::stage_aparente_b232, x) f;
UPDATE stage_aparente_b232 SET date = DATE_TRUNC('minute', date);
UPDATE aparente_b23 SET q_b23 = stage_aparente_b232.val FROM stage_aparente_b232 WHERE aparente_b23.date = stage_aparente_b232.date ;
DROP TABLE IF EXISTS stage_aparente_b23;
DROP TABLE IF EXISTS stage_aparente_b232;
	