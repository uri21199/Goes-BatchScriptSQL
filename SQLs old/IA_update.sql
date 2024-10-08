INSERT INTO ia_cau2(date) SELECT x::timestamptz
FROM   generate_series(DATE_TRUNC('hour', now()) - (interval '1445 minutes')
                     , DATE_TRUNC('hour', now())
                     , interval  '5 min') t(x) ON CONFLICT ON CONSTRAINT uc_ia_cau2 DO NOTHING;
-------------------------------------------------------------------					 
DROP TABLE IF EXISTS stage_ghi_cau2_;
DROP TABLE IF EXISTS stage_ghi_cau2_2;
CREATE TEMP TABLE stage_ghi_cau2_(x jsonb);
CREATE TEMP TABLE stage_ghi_cau2_2(date timestamptz, val numeric);
DO $$
DECLARE startdate text := to_char(current_date - interval '2 days', 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_ghi_cau2_ FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/bc1ef47c-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_ghi_cau2_2 select f.* from stage_ghi_cau2_, jsonb_populate_recordset(null::stage_ghi_cau2_2, x) f;
UPDATE stage_ghi_cau2_2 SET date = DATE_TRUNC('minute', date);
UPDATE ia_cau2 SET ghi = ghi.val FROM (SELECT date, val FROM stage_ghi_cau2_2 WHERE date >= (now() - interval '1 days')) as ghi WHERE ghi.date = ia_cau2.date;
DROP TABLE IF EXISTS stage_ghi_cau2_;
DROP TABLE IF EXISTS stage_ghi_cau2_2;
-------------------------------------------------------------------------
DROP TABLE IF EXISTS stage_ia_power_cau2_;
DROP TABLE IF EXISTS stage_ia_power_cau2_2;
CREATE TEMP TABLE stage_ia_power_cau2_(x jsonb);
CREATE TEMP TABLE stage_ia_power_cau2_2(date timestamptz, val numeric);
DO $$
DECLARE startdate text := to_char(current_date - interval '2 days', 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_ia_power_cau2_ FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/6254118a-0809-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_ia_power_cau2_2 select f.* from stage_ia_power_cau2_, jsonb_populate_recordset(null::stage_ia_power_cau2_2, x) f;
UPDATE stage_ia_power_cau2_2 SET date = DATE_TRUNC('minute', date);
UPDATE ia_cau2 SET power = power.val FROM (SELECT date, val FROM stage_ia_power_cau2_2 WHERE date >= (now() - interval '1 days')) as power WHERE power.date = ia_cau2.date;
DROP TABLE IF EXISTS stage_ia_power_cau2_;
DROP TABLE IF EXISTS stage_ia_power_cau2_2;
-------------------------------------------------------------------------
UPDATE ia_cau2 SET tracker = tracker.val FROM (SELECT date, val FROM trackers_cau2fv WHERE id = 'calcPeriodCurrentrollTrackerCAU2-Motor-35-08-04' AND date >= (now() - interval '1 days')) as tracker where tracker.date = ia_cau2.date;
-------------------------------------------------------------------------
DROP TABLE IF EXISTS stage_ia_wind_cau2_;
DROP TABLE IF EXISTS stage_ia_wind_cau2_2;
CREATE TEMP TABLE stage_ia_wind_cau2_(x jsonb);
CREATE TEMP TABLE stage_ia_wind_cau2_2(date timestamptz, val numeric);
DO $$
DECLARE startdate text := to_char(current_date - interval '2 days', 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_ia_wind_cau2_ FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/be08d0aa-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_ia_wind_cau2_2 select f.* from stage_ia_wind_cau2_, jsonb_populate_recordset(null::stage_ia_wind_cau2_2, x) f;
UPDATE stage_ia_wind_cau2_2 SET date = DATE_TRUNC('minute', date);
UPDATE ia_cau2 SET wind = wind.val FROM (SELECT date, val FROM stage_ia_wind_cau2_2 WHERE date >= (now() - interval '1 days')) as wind WHERE wind.date = ia_cau2.date;
DROP TABLE IF EXISTS stage_ia_wind_cau2_;
DROP TABLE IF EXISTS stage_ia_wind_cau2_2;
-------------------------------------------------------------------------
DROP TABLE IF EXISTS stage_ia_modtemp_cau2_;
DROP TABLE IF EXISTS stage_ia_modtemp_cau2_2;
CREATE TEMP TABLE stage_ia_modtemp_cau2_(x jsonb);
CREATE TEMP TABLE stage_ia_modtemp_cau2_2(date timestamptz, val numeric);
DO $$
DECLARE startdate text := to_char(current_date - interval '2 days', 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_ia_modtemp_cau2_ FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/bccd2a2e-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_ia_modtemp_cau2_2 select f.* from stage_ia_modtemp_cau2_, jsonb_populate_recordset(null::stage_ia_modtemp_cau2_2, x) f;
UPDATE stage_ia_modtemp_cau2_2 SET date = DATE_TRUNC('minute', date);
UPDATE ia_cau2 SET modtemp = modtemp.val FROM (SELECT date, val FROM stage_ia_modtemp_cau2_2 WHERE date >= (now() - interval '1 days')) as modtemp WHERE modtemp.date = ia_cau2.date;
DROP TABLE IF EXISTS stage_ia_modtemp_cau2_;
DROP TABLE IF EXISTS stage_ia_modtemp_cau2_2;
-------------------------------------------------------------------------
UPDATE ia_cau2 SET zenith = 148.65623094716693;
