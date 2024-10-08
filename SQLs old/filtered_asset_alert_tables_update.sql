------------------alert_cau.powercau3----------------------------
DROP TABLE IF EXISTS alert_cau.powercau3;
CREATE TABLE alert_cau.powercau3 (date timestamptz, val numeric);
create temp table stageyyy(x jsonb);
Do $$ declare startdate text := to_char(current_date - 1, 'YYYYMMDD'); Begin EXECUTE format('COPY stageyyy FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/1851c03a-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT into alert_cau.powercau3 select f.* from stageyyy, jsonb_populate_recordset(null::alert_cau.powercau3, x) f;
ALTER TABLE alert_cau.powercau3 RENAME COLUMN val TO powercau3 ;
UPDATE alert_cau.powercau3 SET date = DATE_TRUNC('minute', date);
UPDATE alert_cau.powercau3 SET powercau3 = powercau3 / 1000 WHERE date >= now() - interval '9 hours' AND date <= CURRENT_TIMESTAMP;
DROP TABLE IF EXISTS stageyyy;
------------------------------Energy exported CAU1------------------------------

DROP TABLE IF EXISTS alert_cau.eecau1;
CREATE TABLE alert_cau.eecau1 (date timestamptz, val numeric);
create temp table stageyyy(x jsonb);
Do $$ declare startdate text := to_char(current_date - 1, 'YYYYMMDD'); Begin EXECUTE format('COPY stageyyy FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/c62ae0c8-0816-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT into alert_cau.eecau1 select f.* from stageyyy, jsonb_populate_recordset(null::alert_cau.eecau1, x) f;
ALTER TABLE alert_cau.eecau1 RENAME COLUMN val TO eecau1val ;
UPDATE alert_cau.eecau1 SET date = DATE_TRUNC('minute', date);
UPDATE alert_cau.eecau1 SET eecau1val = eecau1val / 1000 WHERE date >= now() - interval '9 hours' AND date <= CURRENT_TIMESTAMP;
DROP TABLE IF EXISTS stageyyy;
------------------------------Energy exported CAU2------------------------------
DROP TABLE IF EXISTS alert_cau.eecau2;
CREATE TABLE alert_cau.eecau2 (date timestamptz, val numeric);
create temp table stageyyy(x jsonb);
Do $$ declare startdate text := to_char(current_date - 1, 'YYYYMMDD'); Begin EXECUTE format('COPY stageyyy FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/676a0fc6-0809-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT into alert_cau.eecau2 select f.* from stageyyy, jsonb_populate_recordset(null::alert_cau.eecau2, x) f;
ALTER TABLE alert_cau.eecau2 RENAME COLUMN val TO eecau2val ;
UPDATE alert_cau.eecau2 SET date = DATE_TRUNC('minute', date);
UPDATE alert_cau.eecau2 SET eecau2val = eecau2val / 1000 WHERE date >= now() - interval '9 hours' AND date <= CURRENT_TIMESTAMP;
DROP TABLE IF EXISTS stageyyy;
------------------------------Energy exported CAU3------------------------------
DROP TABLE IF EXISTS alert_cau.eecau3;
CREATE TABLE alert_cau.eecau3 (date timestamptz, val numeric);
create temp table stageyyy(x jsonb);
Do $$ declare startdate text := to_char(current_date - 1, 'YYYYMMDD'); Begin EXECUTE format('COPY stageyyy FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/8acddc7c-0809-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT into alert_cau.eecau3 select f.* from stageyyy, jsonb_populate_recordset(null::alert_cau.eecau3, x) f;
ALTER TABLE alert_cau.eecau3 RENAME COLUMN val TO eecau3val ;
UPDATE alert_cau.eecau3 SET date = DATE_TRUNC('minute', date);
UPDATE alert_cau.eecau3 SET eecau3val = eecau3val / 1000 WHERE date >= now() - interval '9 hours' AND date <= CURRENT_TIMESTAMP;
DROP TABLE IF EXISTS stageyyy;
--------------------alert_cau.availcau1-------------------------
DROP TABLE IF EXISTS alert_cau.availcau1;
CREATE TABLE alert_cau.availcau1 (date timestamptz, val numeric);
create temp table stageyyy(x jsonb);
Do $$ declare startdate text := to_char(current_date - 1, 'YYYYMMDD'); Begin EXECUTE format('COPY stageyyy FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/9dbe91f7-1dfe-4b1a-bc5e-c70fea655af4/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT into alert_cau.availcau1 select f.* from stageyyy, jsonb_populate_recordset(null::alert_cau.availcau1, x) f;
ALTER TABLE alert_cau.availcau1 RENAME COLUMN val TO availcau1 ;
UPDATE alert_cau.availcau1 SET date = DATE_TRUNC('minute', date);
DROP TABLE IF EXISTS stageyyy;
--------------------alert_cau.availcau2-------------------------
DROP TABLE IF EXISTS alert_cau.availcau2;
CREATE TABLE alert_cau.availcau2 (date timestamptz, val numeric);
create temp table stageyyy(x jsonb);
Do $$ declare startdate text := to_char(current_date - 1, 'YYYYMMDD'); Begin EXECUTE format('COPY stageyyy FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/691e6d91-3f18-490e-80fd-45680a5a61d4/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT into alert_cau.availcau2 select f.* from stageyyy, jsonb_populate_recordset(null::alert_cau.availcau2, x) f;
ALTER TABLE alert_cau.availcau2 RENAME COLUMN val TO availcau2 ;
UPDATE alert_cau.availcau2 SET date = DATE_TRUNC('minute', date);
DROP TABLE IF EXISTS stageyyy;
--------------------alert_cau.availcau3-------------------------
DROP TABLE IF EXISTS alert_cau.availcau3;
CREATE TABLE alert_cau.availcau3 (date timestamptz, val numeric);
create temp table stageyyy(x jsonb);
Do $$ declare startdate text := to_char(current_date - 1, 'YYYYMMDD'); Begin EXECUTE format('COPY stageyyy FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/b82ea7ce-7f07-476b-9153-b84c690f3fbf/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT into alert_cau.availcau3 select f.* from stageyyy, jsonb_populate_recordset(null::alert_cau.availcau3, x) f;
ALTER TABLE alert_cau.availcau3 RENAME COLUMN val TO availcau3 ;
UPDATE alert_cau.availcau3 SET date = DATE_TRUNC('minute', date);
DROP TABLE IF EXISTS stageyyy;
--------------------alert_cau.poicau1-------------------------
DROP TABLE IF EXISTS alert_cau.poicau1;
CREATE TABLE alert_cau.poicau1 (date timestamptz, val numeric);
create temp table stageyyy(x jsonb);
Do $$ declare startdate text := to_char(current_date - 1, 'YYYYMMDD'); Begin EXECUTE format('COPY stageyyy FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/c62977d8-0816-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT into alert_cau.poicau1 select f.* from stageyyy, jsonb_populate_recordset(null::alert_cau.poicau1, x) f;
ALTER TABLE alert_cau.poicau1 RENAME COLUMN val TO poicau1 ;
UPDATE alert_cau.poicau1 SET date = DATE_TRUNC('minute', date);
UPDATE alert_cau.poicau1 SET poicau1 = poicau1 / 1000 WHERE date >= now() - interval '9 hours' AND date <= CURRENT_TIMESTAMP;
DROP TABLE IF EXISTS stageyyy;
--------------------alert_cau.poicau2-------------------------
DROP TABLE IF EXISTS alert_cau.poicau2;
CREATE TABLE alert_cau.poicau2 (date timestamptz, val numeric);
create temp table stageyyy(x jsonb);
Do $$ declare startdate text := to_char(current_date - 1, 'YYYYMMDD'); Begin EXECUTE format('COPY stageyyy FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/67685e10-0809-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT into alert_cau.poicau2 select f.* from stageyyy, jsonb_populate_recordset(null::alert_cau.poicau2, x) f;
ALTER TABLE alert_cau.poicau2 RENAME COLUMN val TO poicau2 ;
UPDATE alert_cau.poicau2 SET date = DATE_TRUNC('minute', date);
UPDATE alert_cau.poicau2 SET poicau2 = poicau2 / 1000 WHERE date >= now() - interval '9 hours' AND date <= CURRENT_TIMESTAMP;
DROP TABLE IF EXISTS stageyyy;
--------------------alert_cau.poicau3-------------------------
DROP TABLE IF EXISTS alert_cau.poicau3;
CREATE TABLE alert_cau.poicau3 (date timestamptz, val numeric);
create temp table stageyyy(x jsonb);
Do $$ declare startdate text := to_char(current_date - 1, 'YYYYMMDD'); Begin EXECUTE format('COPY stageyyy FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/8acca398-0809-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT into alert_cau.poicau3 select f.* from stageyyy, jsonb_populate_recordset(null::alert_cau.poicau3, x) f;
ALTER TABLE alert_cau.poicau3 RENAME COLUMN val TO poicau3 ;
UPDATE alert_cau.poicau3 SET date = DATE_TRUNC('minute', date);
UPDATE alert_cau.poicau3 SET poicau3 = poicau3 / 1000 WHERE date >= now() - interval '9 hours' AND date <= CURRENT_TIMESTAMP;
DROP TABLE IF EXISTS stageyyy;
------------------alert_cau.powercau1----------------------------
DROP TABLE IF EXISTS alert_cau.powercau1;
CREATE TABLE alert_cau.powercau1 (date timestamptz, val numeric);
create temp table stageyyy(x jsonb);
Do $$ declare startdate text := to_char(current_date - 1, 'YYYYMMDD'); Begin EXECUTE format('COPY stageyyy FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/5fea3ca4-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT into alert_cau.powercau1 select f.* from stageyyy, jsonb_populate_recordset(null::alert_cau.powercau1, x) f;
ALTER TABLE alert_cau.powercau1 RENAME COLUMN val TO powercau1 ;
UPDATE alert_cau.powercau1 SET date = DATE_TRUNC('minute', date);
UPDATE alert_cau.powercau1 SET powercau1 = powercau1 / 1000 WHERE date >= now() - interval '9 hours' AND date <= CURRENT_TIMESTAMP;
DROP TABLE IF EXISTS stageyyy;
------------------alert_cau.powercau2----------------------------
DROP TABLE IF EXISTS alert_cau.powercau2;
CREATE TABLE alert_cau.powercau2 (date timestamptz, val numeric);
create temp table stageyyy(x jsonb);
Do $$ declare startdate text := to_char(current_date - 1, 'YYYYMMDD'); Begin EXECUTE format('COPY stageyyy FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/c320449c-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT into alert_cau.powercau2 select f.* from stageyyy, jsonb_populate_recordset(null::alert_cau.powercau2, x) f;
ALTER TABLE alert_cau.powercau2 RENAME COLUMN val TO powercau2 ;
UPDATE alert_cau.powercau2 SET date = DATE_TRUNC('minute', date);
UPDATE alert_cau.powercau2 SET powercau2 = powercau2 / 1000 WHERE date >= now() - interval '9 hours' AND date <= CURRENT_TIMESTAMP;
DROP TABLE IF EXISTS stageyyy;

------------------alert_cau.lvcau1----------------------------
DROP TABLE IF EXISTS stage_x;
DROP TABLE IF EXISTS alert_cau.lvcau1 ;
CREATE TABLE alert_cau.lvcau1 (date timestamptz, val numeric);
CREATE TEMP TABLE stage_x(x jsonb) ;
Do $$ declare startdate text := to_char(current_date - 1, 'YYYYMMDD'); Begin EXECUTE format('COPY stage_x FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/607234a6-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT into alert_cau.lvcau1 select f.* from stage_x, jsonb_populate_recordset(null::alert_cau.lvcau1, x) f;
ALTER TABLE alert_cau.lvcau1 RENAME COLUMN val TO lvcau1 ;
UPDATE alert_cau.lvcau1 SET date = DATE_TRUNC('minute', date);
DROP TABLE IF EXISTS stage_x;

------------------alert_cau.lvcau2----------------------------

DROP TABLE IF EXISTS alert_cau.lvcau2 ;
CREATE TABLE alert_cau.lvcau2 (date timestamptz, val numeric);
CREATE TEMP TABLE stage_x(x jsonb) ;
Do $$ declare startdate text := to_char(current_date - 1, 'YYYYMMDD'); Begin EXECUTE format('COPY stage_x FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/c3bb19d6-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT into alert_cau.lvcau2 select f.* from stage_x, jsonb_populate_recordset(null::alert_cau.lvcau2, x) f;
ALTER TABLE alert_cau.lvcau2 RENAME COLUMN val TO lvcau2 ;
UPDATE alert_cau.lvcau2 SET date = DATE_TRUNC('minute', date);
DROP TABLE IF EXISTS stage_x;

------------------alert_cau.lvcau3----------------------------

DROP TABLE IF EXISTS alert_cau.lvcau3 ;
CREATE TABLE alert_cau.lvcau3 (date timestamptz, val numeric);
CREATE TEMP TABLE stage_x(x jsonb) ;
Do $$ declare startdate text := to_char(current_date - 1, 'YYYYMMDD'); Begin EXECUTE format('COPY stage_x FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/18e60db2-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT into alert_cau.lvcau3 select f.* from stage_x, jsonb_populate_recordset(null::alert_cau.lvcau3, x) f;
ALTER TABLE alert_cau.lvcau3 RENAME COLUMN val TO lvcau3 ;
UPDATE alert_cau.lvcau3 SET date = DATE_TRUNC('minute', date);
DROP TABLE IF EXISTS stage_x;

----------------alert_cau.freccau1---------------------------

DROP TABLE IF EXISTS alert_cau.freccau1 ;
CREATE TABLE alert_cau.freccau1 (date timestamptz, val numeric);
CREATE TEMP TABLE stage_x(x jsonb) ;
Do $$ declare startdate text := to_char(current_date - 1, 'YYYYMMDD'); Begin EXECUTE format('COPY stage_x FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/7fb8f65c-29bd-11eb-a0f9-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT into alert_cau.freccau1 select f.* from stage_x, jsonb_populate_recordset(null::alert_cau.freccau1, x) f;
ALTER TABLE alert_cau.freccau1 RENAME COLUMN val TO freccau1 ;
UPDATE alert_cau.freccau1 SET date = DATE_TRUNC('minute', date);
DROP TABLE IF EXISTS stage_x;

----------------alert_cau.freccau2---------------------------

DROP TABLE IF EXISTS alert_cau.freccau2 ;
CREATE TABLE alert_cau.freccau2 (date timestamptz, val numeric);
CREATE TEMP TABLE stage_x(x jsonb) ;
Do $$ declare startdate text := to_char(current_date - 1, 'YYYYMMDD'); Begin EXECUTE format('COPY stage_x FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/142c54ac-298f-11eb-9edf-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT into alert_cau.freccau2 select f.* from stage_x, jsonb_populate_recordset(null::alert_cau.freccau2, x) f;
ALTER TABLE alert_cau.freccau2 RENAME COLUMN val TO freccau2 ;
UPDATE alert_cau.freccau2 SET date = DATE_TRUNC('minute', date);
DROP TABLE IF EXISTS stage_x;

----------------alert_cau.freccau3---------------------------

DROP TABLE IF EXISTS alert_cau.freccau3 ;
CREATE TABLE alert_cau.freccau3 (date timestamptz, val numeric);
CREATE TEMP TABLE stage_x(x jsonb) ;
Do $$ declare startdate text := to_char(current_date - 1, 'YYYYMMDD'); Begin EXECUTE format('COPY stage_x FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/67593d54-28ed-11eb-b18a-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT into alert_cau.freccau3 select f.* from stage_x, jsonb_populate_recordset(null::alert_cau.freccau3, x) f;
ALTER TABLE alert_cau.freccau3 RENAME COLUMN val TO freccau3 ;
UPDATE alert_cau.freccau3 SET date = DATE_TRUNC('minute', date);
DROP TABLE IF EXISTS stage_x;

------------------alert_cau.rpcau1----------------------------

DROP TABLE IF EXISTS alert_cau.rpcau1 ;
CREATE TABLE alert_cau.rpcau1 (date timestamptz, val numeric);
CREATE TEMP TABLE stage_x(x jsonb) ;
Do $$ declare startdate text := to_char(current_date - 1, 'YYYYMMDD'); Begin EXECUTE format('COPY stage_x FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/608f4776-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT into alert_cau.rpcau1 select f.* from stage_x, jsonb_populate_recordset(null::alert_cau.rpcau1, x) f;
ALTER TABLE alert_cau.rpcau1 RENAME COLUMN val TO rpcau1 ;
UPDATE alert_cau.rpcau1 SET date = DATE_TRUNC('minute', date);
UPDATE alert_cau.rpcau1 SET rpcau1 = rpcau1 / 1000 WHERE date >= now() - interval '9 hours' AND date <= CURRENT_TIMESTAMP;
DROP TABLE IF EXISTS stage_x;

------------------alert_cau.rpcau2----------------------------

DROP TABLE IF EXISTS alert_cau.rpcau2 ;
CREATE TABLE alert_cau.rpcau2 (date timestamptz, val numeric);
CREATE TEMP TABLE stage_x(x jsonb) ;
Do $$ declare startdate text := to_char(current_date - 1, 'YYYYMMDD'); Begin EXECUTE format('COPY stage_x FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/c3d79778-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT into alert_cau.rpcau2 select f.* from stage_x, jsonb_populate_recordset(null::alert_cau.rpcau2, x) f;
ALTER TABLE alert_cau.rpcau2 RENAME COLUMN val TO rpcau2 ;
UPDATE alert_cau.rpcau2 SET date = DATE_TRUNC('minute', date);
UPDATE alert_cau.rpcau2 SET rpcau2 = rpcau2 / 1000 WHERE date >= now() - interval '9 hours' AND date <= CURRENT_TIMESTAMP;
DROP TABLE IF EXISTS stage_x;

------------------alert_cau.rpcau3----------------------------

DROP TABLE IF EXISTS alert_cau.rpcau3 ;
CREATE TABLE alert_cau.rpcau3 (date timestamptz, val numeric);
CREATE TEMP TABLE stage_x(x jsonb) ;
Do $$ declare startdate text := to_char(current_date - 1, 'YYYYMMDD'); Begin EXECUTE format('COPY stage_x FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/19024cac-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT into alert_cau.rpcau3 select f.* from stage_x, jsonb_populate_recordset(null::alert_cau.rpcau3, x) f;
ALTER TABLE alert_cau.rpcau3 RENAME COLUMN val TO rpcau3 ;
UPDATE alert_cau.rpcau3 SET date = DATE_TRUNC('minute', date);
UPDATE alert_cau.rpcau3 SET rpcau3 = rpcau3 / 1000 WHERE date >= now() - interval '9 hours' AND date <= CURRENT_TIMESTAMP;
DROP TABLE IF EXISTS stage_x;

-----------------------------------------------unir en 1 tabla y dividir por 1000 ------------------------------

UPDATE alert_cau.caucharidatabasehf SET eecau1val = eecau1.eecau1val FROM alert_cau.eecau1 WHERE alert_cau.eecau1.date = alert_cau.caucharidatabasehf.date AND alert_cau.caucharidatabasehf.date >= now() - interval '8 hours' AND alert_cau.caucharidatabasehf.date <= CURRENT_TIMESTAMP;
UPDATE alert_cau.caucharidatabasehf SET eecau2val = eecau2.eecau2val FROM alert_cau.eecau2 WHERE alert_cau.eecau2.date = alert_cau.caucharidatabasehf.date AND alert_cau.caucharidatabasehf.date >= now() - interval '8 hours' AND alert_cau.caucharidatabasehf.date <= CURRENT_TIMESTAMP;
UPDATE alert_cau.caucharidatabasehf SET eecau3val = eecau3.eecau3val FROM alert_cau.eecau3 WHERE alert_cau.eecau3.date = alert_cau.caucharidatabasehf.date AND alert_cau.caucharidatabasehf.date >= now() - interval '8 hours' AND alert_cau.caucharidatabasehf.date <= CURRENT_TIMESTAMP;
UPDATE alert_cau.caucharidatabasehf SET availcau1 = availcau1.availcau1 FROM alert_cau.availcau1 WHERE alert_cau.availcau1.date = alert_cau.caucharidatabasehf.date AND alert_cau.caucharidatabasehf.date >= now() - interval '8 hours' AND alert_cau.caucharidatabasehf.date <= CURRENT_TIMESTAMP;
UPDATE alert_cau.caucharidatabasehf SET availcau2 = availcau2.availcau2 FROM alert_cau.availcau2 WHERE alert_cau.availcau2.date = alert_cau.caucharidatabasehf.date AND alert_cau.caucharidatabasehf.date >= now() - interval '8 hours' AND alert_cau.caucharidatabasehf.date <= CURRENT_TIMESTAMP;
UPDATE alert_cau.caucharidatabasehf SET availcau3 = availcau3.availcau3 FROM alert_cau.availcau3 WHERE alert_cau.availcau3.date = alert_cau.caucharidatabasehf.date AND alert_cau.caucharidatabasehf.date >= now() - interval '8 hours' AND alert_cau.caucharidatabasehf.date <= CURRENT_TIMESTAMP;
UPDATE alert_cau.caucharidatabasehf SET poicau1 = poicau1.poicau1 FROM alert_cau.poicau1 WHERE alert_cau.poicau1.date = alert_cau.caucharidatabasehf.date AND alert_cau.caucharidatabasehf.date >= now() - interval '8 hours' AND alert_cau.caucharidatabasehf.date <= CURRENT_TIMESTAMP;
UPDATE alert_cau.caucharidatabasehf SET poicau2 = poicau2.poicau2 FROM alert_cau.poicau2 WHERE alert_cau.poicau2.date = alert_cau.caucharidatabasehf.date AND alert_cau.caucharidatabasehf.date >= now() - interval '8 hours' AND alert_cau.caucharidatabasehf.date <= CURRENT_TIMESTAMP;
UPDATE alert_cau.caucharidatabasehf SET poicau3 = poicau3.poicau3 FROM alert_cau.poicau3 WHERE alert_cau.poicau3.date = alert_cau.caucharidatabasehf.date AND alert_cau.caucharidatabasehf.date >= now() - interval '8 hours' AND alert_cau.caucharidatabasehf.date <= CURRENT_TIMESTAMP;
UPDATE alert_cau.caucharidatabasehf SET powercau1 = powercau1.powercau1 FROM alert_cau.powercau1 WHERE alert_cau.powercau1.date = alert_cau.caucharidatabasehf.date AND alert_cau.caucharidatabasehf.date >= now() - interval '8 hours' AND alert_cau.caucharidatabasehf.date <= CURRENT_TIMESTAMP;
UPDATE alert_cau.caucharidatabasehf SET powercau2 = powercau2.powercau2 FROM alert_cau.powercau2 WHERE alert_cau.powercau2.date = alert_cau.caucharidatabasehf.date AND alert_cau.caucharidatabasehf.date >= now() - interval '8 hours' AND alert_cau.caucharidatabasehf.date <= CURRENT_TIMESTAMP;
UPDATE alert_cau.caucharidatabasehf SET powercau3 = powercau3.powercau3 FROM alert_cau.powercau3 WHERE alert_cau.powercau3.date = alert_cau.caucharidatabasehf.date AND alert_cau.caucharidatabasehf.date >= now() - interval '8 hours' AND alert_cau.caucharidatabasehf.date <= CURRENT_TIMESTAMP;

UPDATE alert_cau.caucharidatabasehf SET lvcau1 = lvcau1.lvcau1 FROM alert_cau.lvcau1 WHERE alert_cau.lvcau1.date = alert_cau.caucharidatabasehf.date AND alert_cau.caucharidatabasehf.date >= now() - interval '8 hours' AND alert_cau.caucharidatabasehf.date <= CURRENT_TIMESTAMP;
UPDATE alert_cau.caucharidatabasehf SET lvcau2 = lvcau2.lvcau2 FROM alert_cau.lvcau2 WHERE alert_cau.lvcau2.date = alert_cau.caucharidatabasehf.date AND alert_cau.caucharidatabasehf.date >= now() - interval '8 hours' AND alert_cau.caucharidatabasehf.date <= CURRENT_TIMESTAMP;
UPDATE alert_cau.caucharidatabasehf SET lvcau3 = lvcau3.lvcau3 FROM alert_cau.lvcau3 WHERE alert_cau.lvcau3.date = alert_cau.caucharidatabasehf.date AND alert_cau.caucharidatabasehf.date >= now() - interval '8 hours' AND alert_cau.caucharidatabasehf.date <= CURRENT_TIMESTAMP;
UPDATE alert_cau.caucharidatabasehf SET freccau1 = freccau1.freccau1 FROM alert_cau.freccau1 WHERE alert_cau.freccau1.date = alert_cau.caucharidatabasehf.date AND alert_cau.caucharidatabasehf.date >= now() - interval '8 hours' AND alert_cau.caucharidatabasehf.date <= CURRENT_TIMESTAMP;
UPDATE alert_cau.caucharidatabasehf SET freccau2 = freccau2.freccau2 FROM alert_cau.freccau2 WHERE alert_cau.freccau2.date = alert_cau.caucharidatabasehf.date AND alert_cau.caucharidatabasehf.date >= now() - interval '8 hours' AND alert_cau.caucharidatabasehf.date <= CURRENT_TIMESTAMP;
UPDATE alert_cau.caucharidatabasehf SET freccau3 = freccau3.freccau3 FROM alert_cau.freccau3 WHERE alert_cau.freccau3.date = alert_cau.caucharidatabasehf.date AND alert_cau.caucharidatabasehf.date >= now() - interval '8 hours' AND alert_cau.caucharidatabasehf.date <= CURRENT_TIMESTAMP;
UPDATE alert_cau.caucharidatabasehf SET rpcau1 = rpcau1.rpcau1 FROM alert_cau.rpcau1 WHERE alert_cau.rpcau1.date = alert_cau.caucharidatabasehf.date AND alert_cau.caucharidatabasehf.date >= now() - interval '8 hours' AND alert_cau.caucharidatabasehf.date <= CURRENT_TIMESTAMP;
UPDATE alert_cau.caucharidatabasehf SET rpcau2 = rpcau2.rpcau2 FROM alert_cau.rpcau2 WHERE alert_cau.rpcau2.date = alert_cau.caucharidatabasehf.date AND alert_cau.caucharidatabasehf.date >= now() - interval '8 hours' AND alert_cau.caucharidatabasehf.date <= CURRENT_TIMESTAMP;
UPDATE alert_cau.caucharidatabasehf SET rpcau3 = rpcau3.rpcau3 FROM alert_cau.rpcau3 WHERE alert_cau.rpcau3.date = alert_cau.caucharidatabasehf.date AND alert_cau.caucharidatabasehf.date >= now() - interval '8 hours' AND alert_cau.caucharidatabasehf.date <= CURRENT_TIMESTAMP;

---------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS stage_t;
DROP TABLE IF EXISTS stage_t2;
DELETE FROM alert_cau.hiCAU1 WHERE date >= now() - interval '12 hours';
DELETE FROM alert_cau.iiCAU1_ WHERE date >= now() - interval '12 hours';

--------------------alert_cau.hiCAU1_WS_A07_------------------------
CREATE TEMP TABLE stage_t(x jsonb);
CREATE TEMP TABLE stage_t2(date timestamptz, val numeric, id text);
Do $$ declare startdate text := to_char(current_date - 1, 'YYYYMMDD'); Begin EXECUTE format('COPY stage_t FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/5a5d6d6a-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT INTO stage_t2 select f.* from stage_t, jsonb_populate_recordset(null::stage_t2, x) f;
UPDATE stage_t2 SET id = 'hiCAU1_WS_A07_';
UPDATE stage_t2 SET date = DATE_TRUNC('minute', date);
INSERT INTO alert_cau.hiCAU1 SELECT * from stage_t2 WHERE date >= now() - interval '12 hours';
DROP TABLE IF EXISTS stage_t;
DROP TABLE IF EXISTS stage_t2;

------------------------alert_cau.hiCAU1_WS_A19--------------------
CREATE TEMP TABLE stage_t(x jsonb);
CREATE TEMP TABLE stage_t2(date timestamptz, val numeric, id text);
Do $$ declare startdate text := to_char(current_date - 1, 'YYYYMMDD'); Begin EXECUTE format('COPY stage_t FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/5a9dd60c-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT INTO stage_t2 select f.* from stage_t, jsonb_populate_recordset(null::stage_t2, x) f;
UPDATE stage_t2 SET id = 'hiCAU1_WS_A19';
UPDATE stage_t2 SET date = DATE_TRUNC('minute', date);
INSERT INTO alert_cau.hiCAU1 SELECT * from stage_t2 WHERE date >= now() - interval '12 hours';
DROP TABLE IF EXISTS stage_t;
DROP TABLE IF EXISTS stage_t2;

-----------------------alert_cau.hiCAU1_WS_A29---------------------
CREATE TEMP TABLE stage_t(x jsonb);
CREATE TEMP TABLE stage_t2(date timestamptz, val numeric, id text);
Do $$ declare startdate text := to_char(current_date - 1, 'YYYYMMDD'); Begin EXECUTE format('COPY stage_t FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/5adea056-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT INTO stage_t2 select f.* from stage_t, jsonb_populate_recordset(null::stage_t2, x) f;
UPDATE stage_t2 SET id = 'hiCAU1_WS_A29';
UPDATE stage_t2 SET date = DATE_TRUNC('minute', date);
INSERT INTO alert_cau.hiCAU1 SELECT * from stage_t2 WHERE date >= now() - interval '12 hours';
DROP TABLE IF EXISTS stage_t;
DROP TABLE IF EXISTS stage_t2;

------------------alert_cau.iiCAU1_WS_A07_1----------------------------
CREATE TEMP TABLE stage_t(x jsonb);
CREATE TEMP TABLE stage_t2(date timestamptz, val numeric, id text);
Do $$ declare startdate text := to_char(current_date - 1, 'YYYYMMDD'); Begin EXECUTE format('COPY stage_t FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/59547e54-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT INTO stage_t2 select f.* from stage_t, jsonb_populate_recordset(null::stage_t2, x) f;
UPDATE stage_t2 SET id = 'iiCAU1_WS_A07_1';
UPDATE stage_t2 SET date = DATE_TRUNC('minute', date);
INSERT INTO alert_cau.iiCAU1_ SELECT * from stage_t2 WHERE date >= now() - interval '12 hours';
DROP TABLE IF EXISTS stage_t;
DROP TABLE IF EXISTS stage_t2;

------------------alert_cau.iiCAU1_WS_A07_2----------------------------
CREATE TEMP TABLE stage_t(x jsonb);
CREATE TEMP TABLE stage_t2(date timestamptz, val numeric, id text);
Do $$ declare startdate text := to_char(current_date - 1, 'YYYYMMDD'); Begin EXECUTE format('COPY stage_t FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/594fc486-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT INTO stage_t2 select f.* from stage_t, jsonb_populate_recordset(null::stage_t2, x) f;
UPDATE stage_t2 SET id = 'iiCAU1_WS_A07_2';
UPDATE stage_t2 SET date = DATE_TRUNC('minute', date);
INSERT INTO alert_cau.iiCAU1_ SELECT * from stage_t2 WHERE date >= now() - interval '12 hours';
DROP TABLE IF EXISTS stage_t;
DROP TABLE IF EXISTS stage_t2;

------------------alert_cau.iiCAU1_WS_A19_1----------------------------
CREATE TEMP TABLE stage_t(x jsonb);
CREATE TEMP TABLE stage_t2(date timestamptz, val numeric, id text);
Do $$ declare startdate text := to_char(current_date - 1, 'YYYYMMDD'); Begin EXECUTE format('COPY stage_t FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/599868d0-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT INTO stage_t2 select f.* from stage_t, jsonb_populate_recordset(null::stage_t2, x) f;
UPDATE stage_t2 SET id = 'iiCAU1_WS_A19_1';
UPDATE stage_t2 SET date = DATE_TRUNC('minute', date);
INSERT INTO alert_cau.iiCAU1_ SELECT * from stage_t2 WHERE date >= now() - interval '12 hours';
DROP TABLE IF EXISTS stage_t;
DROP TABLE IF EXISTS stage_t2;

------------------alert_cau.iiCAU1_WS_A19_2----------------------------
CREATE TEMP TABLE stage_t(x jsonb);
CREATE TEMP TABLE stage_t2(date timestamptz, val numeric, id text);
Do $$ declare startdate text := to_char(current_date - 1, 'YYYYMMDD'); Begin EXECUTE format('COPY stage_t FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/59907dd2-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT INTO stage_t2 select f.* from stage_t, jsonb_populate_recordset(null::stage_t2, x) f;
UPDATE stage_t2 SET id = 'iiCAU1_WS_A19_2';
UPDATE stage_t2 SET date = DATE_TRUNC('minute', date);
INSERT INTO alert_cau.iiCAU1_ SELECT * from stage_t2 WHERE date >= now() - interval '12 hours';
DROP TABLE IF EXISTS stage_t;
DROP TABLE IF EXISTS stage_t2;

------------------alert_cau.iiCAU1_WS_A29_1----------------------------
CREATE TEMP TABLE stage_t(x jsonb);
CREATE TEMP TABLE stage_t2(date timestamptz, val numeric, id text);
Do $$ declare startdate text := to_char(current_date - 1, 'YYYYMMDD'); Begin EXECUTE format('COPY stage_t FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/59ded036-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT INTO stage_t2 select f.* from stage_t, jsonb_populate_recordset(null::stage_t2, x) f;
UPDATE stage_t2 SET id = 'iiCAU1_WS_A29_1';
UPDATE stage_t2 SET date = DATE_TRUNC('minute', date);
INSERT INTO alert_cau.iiCAU1_ SELECT * from stage_t2 WHERE date >= now() - interval '12 hours';
DROP TABLE IF EXISTS stage_t;
DROP TABLE IF EXISTS stage_t2;

------------------alert_cau.iiCAU1_WS_A29_2----------------------------
CREATE TEMP TABLE stage_t(x jsonb);
CREATE TEMP TABLE stage_t2(date timestamptz, val numeric, id text);
Do $$ declare startdate text := to_char(current_date - 1, 'YYYYMMDD'); Begin EXECUTE format('COPY stage_t FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/59d990bc-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT INTO stage_t2 select f.* from stage_t, jsonb_populate_recordset(null::stage_t2, x) f;
UPDATE stage_t2 SET id = 'iiCAU1_WS_A29_2';
UPDATE stage_t2 SET date = DATE_TRUNC('minute', date);
INSERT INTO alert_cau.iiCAU1_ SELECT * from stage_t2 WHERE date >= now() - interval '12 hours';
DROP TABLE IF EXISTS stage_t;
DROP TABLE IF EXISTS stage_t2;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS stage_b;
DROP TABLE IF EXISTS stage_b2;
DELETE FROM alert_cau.hiCAU2 WHERE date >= now() - interval '12 hours';
DELETE FROM alert_cau.iiCAU2_ WHERE date >= now() - interval '12 hours';

--------------------hiCAU2_WS_B08------------------------
CREATE TEMP TABLE stage_b(x jsonb);
CREATE TEMP TABLE stage_b2(date timestamptz, val numeric, id text);
Do $$ declare startdate text := to_char(current_date - 1, 'YYYYMMDD'); Begin EXECUTE format('COPY stage_b FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/bdab1500-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT INTO stage_b2 select f.* from stage_b, jsonb_populate_recordset(null::stage_b2, x) f;
UPDATE stage_b2 SET id = 'hiCAU2_WS_B08';
UPDATE stage_b2 SET date = DATE_TRUNC('minute', date);
INSERT INTO alert_cau.hiCAU2 SELECT * from stage_b2 WHERE date >= now() - interval '12 hours';
DROP TABLE IF EXISTS stage_b;
DROP TABLE IF EXISTS stage_b2;

------------------------hiCAU2_WS_B30--------------------
CREATE TEMP TABLE stage_b(x jsonb);
CREATE TEMP TABLE stage_b2(date timestamptz, val numeric, id text);
Do $$ declare startdate text := to_char(current_date - 1, 'YYYYMMDD'); Begin EXECUTE format('COPY stage_b FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/bdea50c6-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT INTO stage_b2 select f.* from stage_b, jsonb_populate_recordset(null::stage_b2, x) f;
UPDATE stage_b2 SET id = 'hiCAU2_WS_B30';
UPDATE stage_b2 SET date = DATE_TRUNC('minute', date);
INSERT INTO alert_cau.hiCAU2 SELECT * from stage_b2 WHERE date >= now() - interval '12 hours';
DROP TABLE IF EXISTS stage_b;
DROP TABLE IF EXISTS stage_b2;

-----------------------hiCAU2_WS_B35---------------------
CREATE TEMP TABLE stage_b(x jsonb);
CREATE TEMP TABLE stage_b2(date timestamptz, val numeric, id text);
Do $$ declare startdate text := to_char(current_date - 1, 'YYYYMMDD'); Begin EXECUTE format('COPY stage_b FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/be29dc0a-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT INTO stage_b2 select f.* from stage_b, jsonb_populate_recordset(null::stage_b2, x) f;
UPDATE stage_b2 SET id = 'hiCAU2_WS_B35';
UPDATE stage_b2 SET date = DATE_TRUNC('minute', date);
INSERT INTO alert_cau.hiCAU2 SELECT * from stage_b2 WHERE date >= now() - interval '12 hours';
DROP TABLE IF EXISTS stage_b;
DROP TABLE IF EXISTS stage_b2;

------------------iiCAU2_WS_B08_1----------------------------
CREATE TEMP TABLE stage_b(x jsonb);
CREATE TEMP TABLE stage_b2(date timestamptz, val numeric, id text);
Do $$ declare startdate text := to_char(current_date - 1, 'YYYYMMDD'); Begin EXECUTE format('COPY stage_b FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/bcbad996-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT INTO stage_b2 select f.* from stage_b, jsonb_populate_recordset(null::stage_b2, x) f;
UPDATE stage_b2 SET id = 'iiCAU2_WS_B08_1';
UPDATE stage_b2 SET date = DATE_TRUNC('minute', date);
INSERT INTO alert_cau.iiCAU2_ SELECT * from stage_b2 WHERE date >= now() - interval '12 hours';
DROP TABLE IF EXISTS stage_b;
DROP TABLE IF EXISTS stage_b2;

------------------iiCAU2_WS_B08_2----------------------------
CREATE TEMP TABLE stage_b(x jsonb);
CREATE TEMP TABLE stage_b2(date timestamptz, val numeric, id text);
Do $$ declare startdate text := to_char(current_date - 1, 'YYYYMMDD'); Begin EXECUTE format('COPY stage_b FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/bcb5f80e-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT INTO stage_b2 select f.* from stage_b, jsonb_populate_recordset(null::stage_b2, x) f;
UPDATE stage_b2 SET id = 'iiCAU2_WS_B08_2';
UPDATE stage_b2 SET date = DATE_TRUNC('minute', date);
INSERT INTO alert_cau.iiCAU2_ SELECT * from stage_b2 WHERE date >= now() - interval '12 hours';
DROP TABLE IF EXISTS stage_b;
DROP TABLE IF EXISTS stage_b2;

------------------iiCAU2_WS_B30_1----------------------------
CREATE TEMP TABLE stage_b(x jsonb);
CREATE TEMP TABLE stage_b2(date timestamptz, val numeric, id text);
Do $$ declare startdate text := to_char(current_date - 1, 'YYYYMMDD'); Begin EXECUTE format('COPY stage_b FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/bcf43eca-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT INTO stage_b2 select f.* from stage_b, jsonb_populate_recordset(null::stage_b2, x) f;
UPDATE stage_b2 SET id = 'iiCAU2_WS_B30_1';
UPDATE stage_b2 SET date = DATE_TRUNC('minute', date);
INSERT INTO alert_cau.iiCAU2_ SELECT * from stage_b2 WHERE date >= now() - interval '12 hours';
DROP TABLE IF EXISTS stage_b;
DROP TABLE IF EXISTS stage_b2;

------------------iiCAU2_WS_B30_2----------------------------
CREATE TEMP TABLE stage_b(x jsonb);
CREATE TEMP TABLE stage_b2(date timestamptz, val numeric, id text);
Do $$ declare startdate text := to_char(current_date - 1, 'YYYYMMDD'); Begin EXECUTE format('COPY stage_b FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/bcef9b2c-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT INTO stage_b2 select f.* from stage_b, jsonb_populate_recordset(null::stage_b2, x) f;
UPDATE stage_b2 SET id = 'iiCAU2_WS_B30_2';
UPDATE stage_b2 SET date = DATE_TRUNC('minute', date);
INSERT INTO alert_cau.iiCAU2_ SELECT * from stage_b2 WHERE date >= now() - interval '12 hours';
DROP TABLE IF EXISTS stage_b;
DROP TABLE IF EXISTS stage_b2;

------------------iiCAU2_WS_B35_1----------------------------
CREATE TEMP TABLE stage_b(x jsonb);
CREATE TEMP TABLE stage_b2(date timestamptz, val numeric, id text);
Do $$ declare startdate text := to_char(current_date - 1, 'YYYYMMDD'); Begin EXECUTE format('COPY stage_b FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/bd2e1ee2-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT INTO stage_b2 select f.* from stage_b, jsonb_populate_recordset(null::stage_b2, x) f;
UPDATE stage_b2 SET id = 'iiCAU2_WS_B35_1';
UPDATE stage_b2 SET date = DATE_TRUNC('minute', date);
INSERT INTO alert_cau.iiCAU2_ SELECT * from stage_b2 WHERE date >= now() - interval '12 hours';
DROP TABLE IF EXISTS stage_b;
DROP TABLE IF EXISTS stage_b2;

------------------iiCAU2_WS_B35_2----------------------------
CREATE TEMP TABLE stage_b(x jsonb);
CREATE TEMP TABLE stage_b2(date timestamptz, val numeric, id text);
Do $$ declare startdate text := to_char(current_date - 1, 'YYYYMMDD'); Begin EXECUTE format('COPY stage_b FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/bd2936ca-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT INTO stage_b2 select f.* from stage_b, jsonb_populate_recordset(null::stage_b2, x) f;
UPDATE stage_b2 SET id = 'iiCAU2_WS_B35_2';
UPDATE stage_b2 SET date = DATE_TRUNC('minute', date);
INSERT INTO alert_cau.iiCAU2_ SELECT * from stage_b2 WHERE date >= now() - interval '12 hours';
DROP TABLE IF EXISTS stage_b;
DROP TABLE IF EXISTS stage_b2;

---------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS stage_c;
DROP TABLE IF EXISTS stage_c2;
DELETE FROM alert_cau.hiCAU3 WHERE date >= now() - interval '12 hours';
DELETE FROM alert_cau.iiCAU3_ WHERE date >= now() - interval '12 hours';

--------------------hiCAU3_WS_C08------------------------
CREATE TEMP TABLE stage_c(x jsonb);
CREATE TEMP TABLE stage_c2(date timestamptz, val numeric, id text);
Do $$ declare startdate text := to_char(current_date - 1, 'YYYYMMDD'); Begin EXECUTE format('COPY stage_c FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/12e18dd8-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT INTO stage_c2 select f.* from stage_c, jsonb_populate_recordset(null::stage_c2, x) f;
UPDATE stage_c2 SET id = 'hiCAU3_WS_C08';
UPDATE stage_c2 SET date = DATE_TRUNC('minute', date);
INSERT INTO alert_cau.hiCAU3 SELECT * from stage_c2 WHERE date >= now() - interval '12 hours';
DROP TABLE IF EXISTS stage_c;
DROP TABLE IF EXISTS stage_c2;

------------------------hiCAU3_WS_C11--------------------
CREATE TEMP TABLE stage_c(x jsonb);
CREATE TEMP TABLE stage_c2(date timestamptz, val numeric, id text);
Do $$ declare startdate text := to_char(current_date - 1, 'YYYYMMDD'); Begin EXECUTE format('COPY stage_c FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/132016fc-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT INTO stage_c2 select f.* from stage_c, jsonb_populate_recordset(null::stage_c2, x) f;
UPDATE stage_c2 SET id = 'hiCAU3_WS_C11';
UPDATE stage_c2 SET date = DATE_TRUNC('minute', date);
INSERT INTO alert_cau.hiCAU3 SELECT * from stage_c2 WHERE date >= now() - interval '12 hours';
DROP TABLE IF EXISTS stage_c;
DROP TABLE IF EXISTS stage_c2;

-----------------------hiCAU3_WS_C29---------------------
CREATE TEMP TABLE stage_c(x jsonb);
CREATE TEMP TABLE stage_c2(date timestamptz, val numeric, id text);
Do $$ declare startdate text := to_char(current_date - 1, 'YYYYMMDD'); Begin EXECUTE format('COPY stage_c FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/135dca4c-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT INTO stage_c2 select f.* from stage_c, jsonb_populate_recordset(null::stage_c2, x) f;
UPDATE stage_c2 SET id = 'hiCAU3_WS_C29';
UPDATE stage_c2 SET date = DATE_TRUNC('minute', date);
INSERT INTO alert_cau.hiCAU3 SELECT * from stage_c2 WHERE date >= now() - interval '12 hours';
DROP TABLE IF EXISTS stage_c;
DROP TABLE IF EXISTS stage_c2;

------------------iiCAU3_WS_C08_1----------------------------
CREATE TEMP TABLE stage_c(x jsonb);
CREATE TEMP TABLE stage_c2(date timestamptz, val numeric, id text);
Do $$ declare startdate text := to_char(current_date - 1, 'YYYYMMDD'); Begin EXECUTE format('COPY stage_c FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/11ecfa70-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT INTO stage_c2 select f.* from stage_c, jsonb_populate_recordset(null::stage_c2, x) f;
UPDATE stage_c2 SET id = 'iiCAU3_WS_C08_1';
UPDATE stage_c2 SET date = DATE_TRUNC('minute', date);
INSERT INTO alert_cau.iiCAU3_ SELECT * from stage_c2 WHERE date >= now() - interval '12 hours';
DROP TABLE IF EXISTS stage_c;
DROP TABLE IF EXISTS stage_c2;

------------------iiCAU3_WS_C08_2----------------------------
CREATE TEMP TABLE stage_c(x jsonb);
CREATE TEMP TABLE stage_c2(date timestamptz, val numeric, id text);
Do $$ declare startdate text := to_char(current_date - 1, 'YYYYMMDD'); Begin EXECUTE format('COPY stage_c FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/11e80718-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT INTO stage_c2 select f.* from stage_c, jsonb_populate_recordset(null::stage_c2, x) f;
UPDATE stage_c2 SET id = 'iiCAU3_WS_C08_2';
UPDATE stage_c2 SET date = DATE_TRUNC('minute', date);
INSERT INTO alert_cau.iiCAU3_ SELECT * from stage_c2 WHERE date >= now() - interval '12 hours';
DROP TABLE IF EXISTS stage_c;
DROP TABLE IF EXISTS stage_c2;

------------------iiCAU3_WS_C11_1----------------------------
CREATE TEMP TABLE stage_c(x jsonb);
CREATE TEMP TABLE stage_c2(date timestamptz, val numeric, id text);
Do $$ declare startdate text := to_char(current_date - 1, 'YYYYMMDD'); Begin EXECUTE format('COPY stage_c FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/12261f8a-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT INTO stage_c2 select f.* from stage_c, jsonb_populate_recordset(null::stage_c2, x) f;
UPDATE stage_c2 SET id = 'iiCAU3_WS_C11_1';
UPDATE stage_c2 SET date = DATE_TRUNC('minute', date);
INSERT INTO alert_cau.iiCAU3_ SELECT * from stage_c2 WHERE date >= now() - interval '12 hours';
DROP TABLE IF EXISTS stage_c;
DROP TABLE IF EXISTS stage_c2;

------------------iiCAU3_WS_C11_2----------------------------
CREATE TEMP TABLE stage_c(x jsonb);
CREATE TEMP TABLE stage_c2(date timestamptz, val numeric, id text);
Do $$ declare startdate text := to_char(current_date - 1, 'YYYYMMDD'); Begin EXECUTE format('COPY stage_c FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/12217976-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT INTO stage_c2 select f.* from stage_c, jsonb_populate_recordset(null::stage_c2, x) f;
UPDATE stage_c2 SET id = 'iiCAU3_WS_C11_2';
UPDATE stage_c2 SET date = DATE_TRUNC('minute', date);
INSERT INTO alert_cau.iiCAU3_ SELECT * from stage_c2 WHERE date >= now() - interval '12 hours';
DROP TABLE IF EXISTS stage_c;
DROP TABLE IF EXISTS stage_c2;

------------------iiCAU3_WS_C29_1----------------------------
CREATE TEMP TABLE stage_c(x jsonb);
CREATE TEMP TABLE stage_c2(date timestamptz, val numeric, id text);
Do $$ declare startdate text := to_char(current_date - 1, 'YYYYMMDD'); Begin EXECUTE format('COPY stage_c FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/125ee3d8-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT INTO stage_c2 select f.* from stage_c, jsonb_populate_recordset(null::stage_c2, x) f;
UPDATE stage_c2 SET id = 'iiCAU3_WS_C29_1';
UPDATE stage_c2 SET date = DATE_TRUNC('minute', date);
INSERT INTO alert_cau.iiCAU3_ SELECT * from stage_c2 WHERE date >= now() - interval '12 hours';
DROP TABLE IF EXISTS stage_c;
DROP TABLE IF EXISTS stage_c2;

------------------iiCAU3_WS_C29_2----------------------------
CREATE TEMP TABLE stage_c(x jsonb);
CREATE TEMP TABLE stage_c2(date timestamptz, val numeric, id text);
Do $$ declare startdate text := to_char(current_date - 1, 'YYYYMMDD'); Begin EXECUTE format('COPY stage_c FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/125ad5ea-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT INTO stage_c2 select f.* from stage_c, jsonb_populate_recordset(null::stage_c2, x) f;
UPDATE stage_c2 SET id = 'iiCAU3_WS_C29_2';
UPDATE stage_c2 SET date = DATE_TRUNC('minute', date);
INSERT INTO alert_cau.iiCAU3_ SELECT * from stage_c2 WHERE date >= now() - interval '12 hours';
DROP TABLE IF EXISTS stage_c;
DROP TABLE IF EXISTS stage_c2;


-------------------------------------------------------------------------------------------------------------------------------------


DELETE FROM alert_cau.caucharidatabasehf WHERE date < (now() - interval ' 1 day');
DELETE FROM alert_cau.iiCAU1_ WHERE date < (now() - interval ' 1 day');
DELETE FROM alert_cau.iiCAU2_ WHERE date < (now() - interval ' 1 day');
DELETE FROM alert_cau.iiCAU3_ WHERE date < (now() - interval ' 1 day');
DELETE FROM alert_cau.hiCAU1 WHERE date < (now() - interval ' 1 day');
DELETE FROM alert_cau.hiCAU2 WHERE date < (now() - interval ' 1 day');
DELETE FROM alert_cau.hiCAU3 WHERE date < (now() - interval ' 1 day');