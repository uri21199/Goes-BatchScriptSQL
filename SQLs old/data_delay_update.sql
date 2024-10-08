DELETE FROM data_delay WHERE date >= now() - interval '12 hours';

DROP TABLE IF EXISTS stage_data_delay;
DROP TABLE IF EXISTS stage_data_delay2;
CREATE TEMP TABLE stage_data_delay(x jsonb);
CREATE TEMP TABLE stage_data_delay2(date timestamptz, val numeric, id text);
Do $$ declare startdate text := to_char(current_date - 1, 'YYYYMMDD'); Begin EXECUTE format('COPY stage_data_delay FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/c61e9322-0816-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT INTO stage_data_delay2 select f.* from stage_data_delay, jsonb_populate_recordset(null::stage_data_delay2, x) f;
UPDATE stage_data_delay2 SET id = 'data_delay_cau1';
UPDATE stage_data_delay2 SET date = DATE_TRUNC('minute', date);
INSERT INTO data_delay SELECT * from stage_data_delay2 WHERE date >= now() - interval '12 hours';
DROP TABLE IF EXISTS stage_data_delay;
DROP TABLE IF EXISTS stage_data_delay2;

DROP TABLE IF EXISTS stage_data_delay;
DROP TABLE IF EXISTS stage_data_delay2;
CREATE TEMP TABLE stage_data_delay(x jsonb);
CREATE TEMP TABLE stage_data_delay2(date timestamptz, val numeric, id text);
Do $$ declare startdate text := to_char(current_date - 1, 'YYYYMMDD'); Begin EXECUTE format('COPY stage_data_delay FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/6754e114-0809-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT INTO stage_data_delay2 select f.* from stage_data_delay, jsonb_populate_recordset(null::stage_data_delay2, x) f;
UPDATE stage_data_delay2 SET id = 'data_delay_cau2';
UPDATE stage_data_delay2 SET date = DATE_TRUNC('minute', date);
INSERT INTO data_delay SELECT * from stage_data_delay2 WHERE date >= now() - interval '12 hours';
DROP TABLE IF EXISTS stage_data_delay
;
DROP TABLE IF EXISTS stage_data_delay2;

DROP TABLE IF EXISTS stage_data_delay;
DROP TABLE IF EXISTS stage_data_delay2;
CREATE TEMP TABLE stage_data_delay(x jsonb);
CREATE TEMP TABLE stage_data_delay2(date timestamptz, val numeric, id text);
Do $$ declare startdate text := to_char(current_date - 1, 'YYYYMMDD'); Begin EXECUTE format('COPY stage_data_delay FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/8ac24baa-0809-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT INTO stage_data_delay2 select f.* from stage_data_delay, jsonb_populate_recordset(null::stage_data_delay2, x) f;
UPDATE stage_data_delay2 SET id = 'data_delay_cau3';
UPDATE stage_data_delay2 SET date = DATE_TRUNC('minute', date);
INSERT INTO data_delay SELECT * from stage_data_delay2 WHERE date >= now() - interval '12 hours';
DROP TABLE IF EXISTS stage_data_delay;
DROP TABLE IF EXISTS stage_data_delay2;
