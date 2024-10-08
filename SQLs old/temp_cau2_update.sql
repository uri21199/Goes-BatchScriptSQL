DELETE FROM temp_cau2 WHERE date >= now() - interval '1 hour';
DROP TABLE IF EXISTS stage_temp_cau2_;
DROP TABLE IF EXISTS stage_temp_cau2_2;


CREATE TEMP TABLE stage_temp_cau2_(x jsonb);
CREATE TEMP TABLE stage_temp_cau2_2(date timestamptz, val numeric, id text);
DO $$
DECLARE startdate text := to_char(current_date, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '1 hour' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_temp_cau2_ FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/bdb00fc4-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_temp_cau2_2 select f.* from stage_temp_cau2_, jsonb_populate_recordset(null::stage_temp_cau2_2, x) f;
UPDATE stage_temp_cau2_2 SET id = 'Temperatura Ambiente';
UPDATE stage_temp_cau2_2 SET date = DATE_TRUNC('minute', date);
INSERT INTO temp_cau2 SELECT * from stage_temp_cau2_2 WHERE date >= (now()::timestamptz - interval '1 hour');
DROP TABLE IF EXISTS stage_temp_cau2_;
DROP TABLE IF EXISTS stage_temp_cau2_2;
