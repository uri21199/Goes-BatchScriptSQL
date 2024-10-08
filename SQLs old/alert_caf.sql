DROP TABLE IF EXISTS stage_caf_alert;
DROP TABLE IF EXISTS stage_caf_alert2;
CREATE TEMP TABLE stage_caf_alert(x jsonb);
CREATE TEMP TABLE stage_caf_alert2(date timestamptz, val numeric);
DO $$
DECLARE startdate text := to_char(current_date -7, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '3 hours' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_caf_alert FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/c6585600-8934-11e9-8620-42010afa015a/events?apiKey=e385a1a5-0441-4e06-be58-162731a7d4f9.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_caf_alert2 select f.* from stage_caf_alert, jsonb_populate_recordset(null::stage_caf_alert2, x) f;
UPDATE stage_caf_alert2 SET date = DATE_TRUNC('minute', date);

INSERT INTO cafayate.alert_caf(date) SELECT date from stage_caf_alert2 ON CONFLICT ON CONSTRAINT uc_alert_caf do nothing;

UPDATE Cafayate.alert_caf SET frecuencia = s.a FROM (SELECT date, val as a FROM stage_caf_alert2) as s WHERE s.date = alert_caf.date ;

DROP TABLE IF EXISTS stage_caf_alert;
DROP TABLE IF EXISTS stage_caf_alert2;
CREATE TEMP TABLE stage_caf_alert(x jsonb);
CREATE TEMP TABLE stage_caf_alert2(date timestamptz, val numeric);
DO $$
DECLARE startdate text := to_char(current_date -7, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '3 hours' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_caf_alert FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/c651c074-8934-11e9-8620-42010afa015a/events?apiKey=e385a1a5-0441-4e06-be58-162731a7d4f9.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_caf_alert2 select f.* from stage_caf_alert, jsonb_populate_recordset(null::stage_caf_alert2, x) f;
UPDATE stage_caf_alert2 SET date = DATE_TRUNC('minute', date);

UPDATE Cafayate.alert_caf SET p_activa = s.a FROM (SELECT date, val as a FROM stage_caf_alert2) as s WHERE s.date = alert_caf.date ;

DROP TABLE IF EXISTS stage_caf_alert;
DROP TABLE IF EXISTS stage_caf_alert2;
CREATE TEMP TABLE stage_caf_alert(x jsonb);
CREATE TEMP TABLE stage_caf_alert2(date timestamptz, val numeric);
DO $$
DECLARE startdate text := to_char(current_date -7, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '3 hours' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_caf_alert FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/c651b674-8934-11e9-8620-42010afa015a/events?apiKey=e385a1a5-0441-4e06-be58-162731a7d4f9.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_caf_alert2 select f.* from stage_caf_alert, jsonb_populate_recordset(null::stage_caf_alert2, x) f;
UPDATE stage_caf_alert2 SET date = DATE_TRUNC('minute', date);

UPDATE Cafayate.alert_caf SET q_reactiva = s.a FROM (SELECT date, val as a FROM stage_caf_alert2) as s WHERE s.date = alert_caf.date ;

DROP TABLE IF EXISTS stage_caf_alert;
DROP TABLE IF EXISTS stage_caf_alert2;
CREATE TEMP TABLE stage_caf_alert(x jsonb);
CREATE TEMP TABLE stage_caf_alert2(date timestamptz, val numeric);
DO $$
DECLARE startdate text := to_char(current_date -7, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '3 hours' + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_caf_alert FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/c656ab66-8934-11e9-8620-42010afa015a/events?apiKey=e385a1a5-0441-4e06-be58-162731a7d4f9.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_caf_alert2 select f.* from stage_caf_alert, jsonb_populate_recordset(null::stage_caf_alert2, x) f;
UPDATE stage_caf_alert2 SET date = DATE_TRUNC('minute', date);

UPDATE Cafayate.alert_caf SET tension = s.a FROM (SELECT date, val as a FROM stage_caf_alert2) as s WHERE s.date = alert_caf.date ;

