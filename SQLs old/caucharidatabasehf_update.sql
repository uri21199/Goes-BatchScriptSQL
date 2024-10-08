------------------powercau3----------------------------
DROP TABLE IF EXISTS powercau3;
CREATE TABLE powercau3 (date timestamptz, val numeric);
create temp table stagey(x jsonb);
Do $$ declare startdate text := to_char(current_date - 1, 'YYYYMMDD'); Begin EXECUTE format('COPY stagey FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/1851c03a-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT into powercau3 select f.* from stagey, jsonb_populate_recordset(null::powercau3, x) f;
ALTER TABLE powercau3 RENAME COLUMN val TO powercau3 ;
UPDATE powercau3 SET date = DATE_TRUNC('minute', date);
UPDATE powercau3 SET powercau3 = powercau3 / 1000 WHERE date >= now() - interval '9 hours' AND date <= CURRENT_TIMESTAMP;
DROP TABLE IF EXISTS stagey;
------------------------------Energy exported CAU1------------------------------

DROP TABLE IF EXISTS eecau1;
CREATE TABLE eecau1 (date timestamptz, val numeric);
create temp table stagey(x jsonb);
Do $$ declare startdate text := to_char(current_date - 1, 'YYYYMMDD'); Begin EXECUTE format('COPY stagey FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/c62ae0c8-0816-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT into eecau1 select f.* from stagey, jsonb_populate_recordset(null::eecau1, x) f;
ALTER TABLE eecau1 RENAME COLUMN val TO eecau1val ;
UPDATE eecau1 SET date = DATE_TRUNC('minute', date);
UPDATE eecau1 SET eecau1val = eecau1val / 1000 WHERE date >= now() - interval '9 hours' AND date <= CURRENT_TIMESTAMP;
DROP TABLE IF EXISTS stagey;
------------------------------Energy exported CAU2------------------------------
DROP TABLE IF EXISTS eecau2;
CREATE TABLE eecau2 (date timestamptz, val numeric);
create temp table stagey(x jsonb);
Do $$ declare startdate text := to_char(current_date - 1, 'YYYYMMDD'); Begin EXECUTE format('COPY stagey FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/676a0fc6-0809-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT into eecau2 select f.* from stagey, jsonb_populate_recordset(null::eecau2, x) f;
ALTER TABLE eecau2 RENAME COLUMN val TO eecau2val ;
UPDATE eecau2 SET date = DATE_TRUNC('minute', date);
UPDATE eecau2 SET eecau2val = eecau2val / 1000 WHERE date >= now() - interval '9 hours' AND date <= CURRENT_TIMESTAMP;
DROP TABLE IF EXISTS stagey;
------------------------------Energy exported CAU3------------------------------
DROP TABLE IF EXISTS eecau3;
CREATE TABLE eecau3 (date timestamptz, val numeric);
create temp table stagey(x jsonb);
Do $$ declare startdate text := to_char(current_date - 1, 'YYYYMMDD'); Begin EXECUTE format('COPY stagey FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/8acddc7c-0809-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT into eecau3 select f.* from stagey, jsonb_populate_recordset(null::eecau3, x) f;
ALTER TABLE eecau3 RENAME COLUMN val TO eecau3val ;
UPDATE eecau3 SET date = DATE_TRUNC('minute', date);
UPDATE eecau3 SET eecau3val = eecau3val / 1000 WHERE date >= now() - interval '9 hours' AND date <= CURRENT_TIMESTAMP;
DROP TABLE IF EXISTS stagey;
--------------------availcau1-------------------------
DROP TABLE IF EXISTS availcau1;
CREATE TABLE availcau1 (date timestamptz, val numeric);
create temp table stagey(x jsonb);
Do $$ declare startdate text := to_char(current_date - 1, 'YYYYMMDD'); Begin EXECUTE format('COPY stagey FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/9dbe91f7-1dfe-4b1a-bc5e-c70fea655af4/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT into availcau1 select f.* from stagey, jsonb_populate_recordset(null::availcau1, x) f;
ALTER TABLE availcau1 RENAME COLUMN val TO availcau1 ;
UPDATE availcau1 SET date = DATE_TRUNC('minute', date);
DROP TABLE IF EXISTS stagey;
--------------------availcau2-------------------------
DROP TABLE IF EXISTS availcau2;
CREATE TABLE availcau2 (date timestamptz, val numeric);
create temp table stagey(x jsonb);
Do $$ declare startdate text := to_char(current_date - 1, 'YYYYMMDD'); Begin EXECUTE format('COPY stagey FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/691e6d91-3f18-490e-80fd-45680a5a61d4/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT into availcau2 select f.* from stagey, jsonb_populate_recordset(null::availcau2, x) f;
ALTER TABLE availcau2 RENAME COLUMN val TO availcau2 ;
UPDATE availcau2 SET date = DATE_TRUNC('minute', date);
DROP TABLE IF EXISTS stagey;
--------------------availcau3-------------------------
DROP TABLE IF EXISTS availcau3;
CREATE TABLE availcau3 (date timestamptz, val numeric);
create temp table stagey(x jsonb);
Do $$ declare startdate text := to_char(current_date - 1, 'YYYYMMDD'); Begin EXECUTE format('COPY stagey FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/b82ea7ce-7f07-476b-9153-b84c690f3fbf/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT into availcau3 select f.* from stagey, jsonb_populate_recordset(null::availcau3, x) f;
ALTER TABLE availcau3 RENAME COLUMN val TO availcau3 ;
UPDATE availcau3 SET date = DATE_TRUNC('minute', date);
DROP TABLE IF EXISTS stagey;
--------------------poicau1-------------------------
DROP TABLE IF EXISTS poicau1;
CREATE TABLE poicau1 (date timestamptz, val numeric);
create temp table stagey(x jsonb);
Do $$ declare startdate text := to_char(current_date - 1, 'YYYYMMDD'); Begin EXECUTE format('COPY stagey FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/c62977d8-0816-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT into poicau1 select f.* from stagey, jsonb_populate_recordset(null::poicau1, x) f;
ALTER TABLE poicau1 RENAME COLUMN val TO poicau1 ;
UPDATE poicau1 SET date = DATE_TRUNC('minute', date);
UPDATE poicau1 SET poicau1 = poicau1 / 1000 WHERE date >= now() - interval '9 hours' AND date <= CURRENT_TIMESTAMP;
DROP TABLE IF EXISTS stagey;
--------------------poicau2-------------------------
DROP TABLE IF EXISTS poicau2;
CREATE TABLE poicau2 (date timestamptz, val numeric);
create temp table stagey(x jsonb);
Do $$ declare startdate text := to_char(current_date - 1, 'YYYYMMDD'); Begin EXECUTE format('COPY stagey FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/67685e10-0809-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT into poicau2 select f.* from stagey, jsonb_populate_recordset(null::poicau2, x) f;
ALTER TABLE poicau2 RENAME COLUMN val TO poicau2 ;
UPDATE poicau2 SET date = DATE_TRUNC('minute', date);
UPDATE poicau2 SET poicau2 = poicau2 / 1000 WHERE date >= now() - interval '9 hours' AND date <= CURRENT_TIMESTAMP;
DROP TABLE IF EXISTS stagey;
--------------------poicau3-------------------------
DROP TABLE IF EXISTS poicau3;
CREATE TABLE poicau3 (date timestamptz, val numeric);
create temp table stagey(x jsonb);
Do $$ declare startdate text := to_char(current_date - 1, 'YYYYMMDD'); Begin EXECUTE format('COPY stagey FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/8acca398-0809-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT into poicau3 select f.* from stagey, jsonb_populate_recordset(null::poicau3, x) f;
ALTER TABLE poicau3 RENAME COLUMN val TO poicau3 ;
UPDATE poicau3 SET date = DATE_TRUNC('minute', date);
UPDATE poicau3 SET poicau3 = poicau3 / 1000 WHERE date >= now() - interval '9 hours' AND date <= CURRENT_TIMESTAMP;
DROP TABLE IF EXISTS stagey;
------------------powercau1----------------------------
DROP TABLE IF EXISTS powercau1;
CREATE TABLE powercau1 (date timestamptz, val numeric);
create temp table stagey(x jsonb);
Do $$ declare startdate text := to_char(current_date - 1, 'YYYYMMDD'); Begin EXECUTE format('COPY stagey FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/5fea3ca4-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT into powercau1 select f.* from stagey, jsonb_populate_recordset(null::powercau1, x) f;
ALTER TABLE powercau1 RENAME COLUMN val TO powercau1 ;
UPDATE powercau1 SET date = DATE_TRUNC('minute', date);
UPDATE powercau1 SET powercau1 = powercau1 / 1000 WHERE date >= now() - interval '9 hours' AND date <= CURRENT_TIMESTAMP;
DROP TABLE IF EXISTS stagey;
------------------powercau2----------------------------
DROP TABLE IF EXISTS powercau2;
CREATE TABLE powercau2 (date timestamptz, val numeric);
create temp table stagey(x jsonb);
Do $$ declare startdate text := to_char(current_date - 1, 'YYYYMMDD'); Begin EXECUTE format('COPY stagey FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/c320449c-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT into powercau2 select f.* from stagey, jsonb_populate_recordset(null::powercau2, x) f;
ALTER TABLE powercau2 RENAME COLUMN val TO powercau2 ;
UPDATE powercau2 SET date = DATE_TRUNC('minute', date);
UPDATE powercau2 SET powercau2 = powercau2 / 1000 WHERE date >= now() - interval '9 hours' AND date <= CURRENT_TIMESTAMP;
DROP TABLE IF EXISTS stagey;

------------------lvcau1----------------------------
DROP TABLE IF EXISTS stagex;
DROP TABLE IF EXISTS lvcau1 ;
CREATE TABLE lvcau1 (date timestamptz, val numeric);
CREATE TEMP TABLE stagex(x jsonb) ;
Do $$ declare startdate text := to_char(current_date - 1, 'YYYYMMDD'); Begin EXECUTE format('COPY stagex FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/607234a6-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT into lvcau1 select f.* from stagex, jsonb_populate_recordset(null::lvcau1, x) f;
ALTER TABLE lvcau1 RENAME COLUMN val TO lvcau1 ;
UPDATE lvcau1 SET date = DATE_TRUNC('minute', date);
DROP TABLE IF EXISTS stagex;

------------------lvcau2----------------------------

DROP TABLE IF EXISTS lvcau2 ;
CREATE TABLE lvcau2 (date timestamptz, val numeric);
CREATE TEMP TABLE stagex(x jsonb) ;
Do $$ declare startdate text := to_char(current_date - 1, 'YYYYMMDD'); Begin EXECUTE format('COPY stagex FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/c3bb19d6-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT into lvcau2 select f.* from stagex, jsonb_populate_recordset(null::lvcau2, x) f;
ALTER TABLE lvcau2 RENAME COLUMN val TO lvcau2 ;
UPDATE lvcau2 SET date = DATE_TRUNC('minute', date);
DROP TABLE IF EXISTS stagex;

------------------lvcau3----------------------------

DROP TABLE IF EXISTS lvcau3 ;
CREATE TABLE lvcau3 (date timestamptz, val numeric);
CREATE TEMP TABLE stagex(x jsonb) ;
Do $$ declare startdate text := to_char(current_date - 1, 'YYYYMMDD'); Begin EXECUTE format('COPY stagex FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/18e60db2-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT into lvcau3 select f.* from stagex, jsonb_populate_recordset(null::lvcau3, x) f;
ALTER TABLE lvcau3 RENAME COLUMN val TO lvcau3 ;
UPDATE lvcau3 SET date = DATE_TRUNC('minute', date);
DROP TABLE IF EXISTS stagex;

----------------freccau1---------------------------

DROP TABLE IF EXISTS freccau1 ;
CREATE TABLE freccau1 (date timestamptz, val numeric);
CREATE TEMP TABLE stagex(x jsonb) ;
Do $$ declare startdate text := to_char(current_date - 1, 'YYYYMMDD'); Begin EXECUTE format('COPY stagex FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/7fb8f65c-29bd-11eb-a0f9-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT into freccau1 select f.* from stagex, jsonb_populate_recordset(null::freccau1, x) f;
ALTER TABLE freccau1 RENAME COLUMN val TO freccau1 ;
UPDATE freccau1 SET date = DATE_TRUNC('minute', date);
DROP TABLE IF EXISTS stagex;

----------------freccau2---------------------------

DROP TABLE IF EXISTS freccau2 ;
CREATE TABLE freccau2 (date timestamptz, val numeric);
CREATE TEMP TABLE stagex(x jsonb) ;
Do $$ declare startdate text := to_char(current_date - 1, 'YYYYMMDD'); Begin EXECUTE format('COPY stagex FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/142c54ac-298f-11eb-9edf-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT into freccau2 select f.* from stagex, jsonb_populate_recordset(null::freccau2, x) f;
ALTER TABLE freccau2 RENAME COLUMN val TO freccau2 ;
UPDATE freccau2 SET date = DATE_TRUNC('minute', date);
DROP TABLE IF EXISTS stagex;

----------------freccau3---------------------------

DROP TABLE IF EXISTS freccau3 ;
CREATE TABLE freccau3 (date timestamptz, val numeric);
CREATE TEMP TABLE stagex(x jsonb) ;
Do $$ declare startdate text := to_char(current_date - 1, 'YYYYMMDD'); Begin EXECUTE format('COPY stagex FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/67593d54-28ed-11eb-b18a-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT into freccau3 select f.* from stagex, jsonb_populate_recordset(null::freccau3, x) f;
ALTER TABLE freccau3 RENAME COLUMN val TO freccau3 ;
UPDATE freccau3 SET date = DATE_TRUNC('minute', date);
DROP TABLE IF EXISTS stagex;

------------------rpcau1----------------------------

DROP TABLE IF EXISTS rpcau1 ;
CREATE TABLE rpcau1 (date timestamptz, val numeric);
CREATE TEMP TABLE stagex(x jsonb) ;
Do $$ declare startdate text := to_char(current_date - 1, 'YYYYMMDD'); Begin EXECUTE format('COPY stagex FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/608f4776-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT into rpcau1 select f.* from stagex, jsonb_populate_recordset(null::rpcau1, x) f;
ALTER TABLE rpcau1 RENAME COLUMN val TO rpcau1 ;
UPDATE rpcau1 SET date = DATE_TRUNC('minute', date);
UPDATE rpcau1 SET rpcau1 = rpcau1 / 1000 WHERE date >= now() - interval '9 hours' AND date <= CURRENT_TIMESTAMP;
DROP TABLE IF EXISTS stagex;

------------------rpcau2----------------------------

DROP TABLE IF EXISTS rpcau2 ;
CREATE TABLE rpcau2 (date timestamptz, val numeric);
CREATE TEMP TABLE stagex(x jsonb) ;
Do $$ declare startdate text := to_char(current_date - 1, 'YYYYMMDD'); Begin EXECUTE format('COPY stagex FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/c3d79778-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT into rpcau2 select f.* from stagex, jsonb_populate_recordset(null::rpcau2, x) f;
ALTER TABLE rpcau2 RENAME COLUMN val TO rpcau2 ;
UPDATE rpcau2 SET date = DATE_TRUNC('minute', date);
UPDATE rpcau2 SET rpcau2 = rpcau2 / 1000 WHERE date >= now() - interval '9 hours' AND date <= CURRENT_TIMESTAMP;
DROP TABLE IF EXISTS stagex;

------------------rpcau3----------------------------

DROP TABLE IF EXISTS rpcau3 ;
CREATE TABLE rpcau3 (date timestamptz, val numeric);
CREATE TEMP TABLE stagex(x jsonb) ;
Do $$ declare startdate text := to_char(current_date - 1, 'YYYYMMDD'); Begin EXECUTE format('COPY stagex FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/19024cac-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT into rpcau3 select f.* from stagex, jsonb_populate_recordset(null::rpcau3, x) f;
ALTER TABLE rpcau3 RENAME COLUMN val TO rpcau3 ;
UPDATE rpcau3 SET date = DATE_TRUNC('minute', date);
UPDATE rpcau3 SET rpcau3 = rpcau3 / 1000 WHERE date >= now() - interval '9 hours' AND date <= CURRENT_TIMESTAMP;
DROP TABLE IF EXISTS stagex;

-----------------------------------------------unir en 1 tabla y dividir por 1000 ------------------------------



UPDATE public.caucharidatabasehf SET eecau1val = eecau1.eecau1val FROM public.eecau1 WHERE public.eecau1.date = caucharidatabasehf.date AND caucharidatabasehf.date >= now() - interval '8 hours' AND caucharidatabasehf.date <= CURRENT_TIMESTAMP;
UPDATE public.caucharidatabasehf SET eecau2val = eecau2.eecau2val FROM public.eecau2 WHERE public.eecau2.date = caucharidatabasehf.date AND caucharidatabasehf.date >= now() - interval '8 hours' AND caucharidatabasehf.date <= CURRENT_TIMESTAMP;
UPDATE public.caucharidatabasehf SET eecau3val = eecau3.eecau3val FROM public.eecau3 WHERE public.eecau3.date = caucharidatabasehf.date AND caucharidatabasehf.date >= now() - interval '8 hours' AND caucharidatabasehf.date <= CURRENT_TIMESTAMP;
UPDATE public.caucharidatabasehf SET availcau1 = availcau1.availcau1 FROM public.availcau1 WHERE public.availcau1.date = caucharidatabasehf.date AND caucharidatabasehf.date >= now() - interval '8 hours' AND caucharidatabasehf.date <= CURRENT_TIMESTAMP;
UPDATE public.caucharidatabasehf SET availcau2 = availcau2.availcau2 FROM public.availcau2 WHERE public.availcau2.date = caucharidatabasehf.date AND caucharidatabasehf.date >= now() - interval '8 hours' AND caucharidatabasehf.date <= CURRENT_TIMESTAMP;
UPDATE public.caucharidatabasehf SET availcau3 = availcau3.availcau3 FROM public.availcau3 WHERE public.availcau3.date = caucharidatabasehf.date AND caucharidatabasehf.date >= now() - interval '8 hours' AND caucharidatabasehf.date <= CURRENT_TIMESTAMP;
UPDATE public.caucharidatabasehf SET poicau1 = poicau1.poicau1 FROM public.poicau1 WHERE public.poicau1.date = caucharidatabasehf.date AND caucharidatabasehf.date >= now() - interval '8 hours' AND caucharidatabasehf.date <= CURRENT_TIMESTAMP;
UPDATE public.caucharidatabasehf SET poicau2 = poicau2.poicau2 FROM public.poicau2 WHERE public.poicau2.date = caucharidatabasehf.date AND caucharidatabasehf.date >= now() - interval '8 hours' AND caucharidatabasehf.date <= CURRENT_TIMESTAMP;
UPDATE public.caucharidatabasehf SET poicau3 = poicau3.poicau3 FROM public.poicau3 WHERE public.poicau3.date = caucharidatabasehf.date AND caucharidatabasehf.date >= now() - interval '8 hours' AND caucharidatabasehf.date <= CURRENT_TIMESTAMP;
UPDATE public.caucharidatabasehf SET powercau1 = powercau1.powercau1 FROM public.powercau1 WHERE public.powercau1.date = caucharidatabasehf.date AND caucharidatabasehf.date >= now() - interval '8 hours' AND caucharidatabasehf.date <= CURRENT_TIMESTAMP;
UPDATE public.caucharidatabasehf SET powercau2 = powercau2.powercau2 FROM public.powercau2 WHERE public.powercau2.date = caucharidatabasehf.date AND caucharidatabasehf.date >= now() - interval '8 hours' AND caucharidatabasehf.date <= CURRENT_TIMESTAMP;
UPDATE public.caucharidatabasehf SET powercau3 = powercau3.powercau3 FROM public.powercau3 WHERE public.powercau3.date = caucharidatabasehf.date AND caucharidatabasehf.date >= now() - interval '8 hours' AND caucharidatabasehf.date <= CURRENT_TIMESTAMP;

UPDATE public.caucharidatabasehf SET lvcau1 = lvcau1.lvcau1 FROM public.lvcau1 WHERE public.lvcau1.date = caucharidatabasehf.date AND caucharidatabasehf.date >= now() - interval '8 hours' AND caucharidatabasehf.date <= CURRENT_TIMESTAMP;
UPDATE public.caucharidatabasehf SET lvcau2 = lvcau2.lvcau2 FROM public.lvcau2 WHERE public.lvcau2.date = caucharidatabasehf.date AND caucharidatabasehf.date >= now() - interval '8 hours' AND caucharidatabasehf.date <= CURRENT_TIMESTAMP;
UPDATE public.caucharidatabasehf SET lvcau3 = lvcau3.lvcau3 FROM public.lvcau3 WHERE public.lvcau3.date = caucharidatabasehf.date AND caucharidatabasehf.date >= now() - interval '8 hours' AND caucharidatabasehf.date <= CURRENT_TIMESTAMP;
UPDATE public.caucharidatabasehf SET freccau1 = freccau1.freccau1 FROM public.freccau1 WHERE public.freccau1.date = caucharidatabasehf.date AND caucharidatabasehf.date >= now() - interval '8 hours' AND caucharidatabasehf.date <= CURRENT_TIMESTAMP;
UPDATE public.caucharidatabasehf SET freccau2 = freccau2.freccau2 FROM public.freccau2 WHERE public.freccau2.date = caucharidatabasehf.date AND caucharidatabasehf.date >= now() - interval '8 hours' AND caucharidatabasehf.date <= CURRENT_TIMESTAMP;
UPDATE public.caucharidatabasehf SET freccau3 = freccau3.freccau3 FROM public.freccau3 WHERE public.freccau3.date = caucharidatabasehf.date AND caucharidatabasehf.date >= now() - interval '8 hours' AND caucharidatabasehf.date <= CURRENT_TIMESTAMP;
UPDATE public.caucharidatabasehf SET rpcau1 = rpcau1.rpcau1 FROM public.rpcau1 WHERE public.rpcau1.date = caucharidatabasehf.date AND caucharidatabasehf.date >= now() - interval '8 hours' AND caucharidatabasehf.date <= CURRENT_TIMESTAMP;
UPDATE public.caucharidatabasehf SET rpcau2 = rpcau2.rpcau2 FROM public.rpcau2 WHERE public.rpcau2.date = caucharidatabasehf.date AND caucharidatabasehf.date >= now() - interval '8 hours' AND caucharidatabasehf.date <= CURRENT_TIMESTAMP;
UPDATE public.caucharidatabasehf SET rpcau3 = rpcau3.rpcau3 FROM public.rpcau3 WHERE public.rpcau3.date = caucharidatabasehf.date AND caucharidatabasehf.date >= now() - interval '8 hours' AND caucharidatabasehf.date <= CURRENT_TIMESTAMP;

DELETE FROM caucharidatabasehf2;
INSERT INTO caucharidatabasehf2 SELECT * FROM caucharidatabasehf WHERE date >= now() - interval '1 day' AND DATE >= current_date AND date < now() ON CONFLICT ON CONSTRAINT uc_caucharidatabasehf2 DO NOTHING;