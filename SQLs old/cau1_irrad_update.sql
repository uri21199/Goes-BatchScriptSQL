DROP TABLE IF EXISTS staget;
DROP TABLE IF EXISTS staget2;
DELETE FROM hiCAU1 WHERE date >= now() - interval '3 days';
DELETE FROM iiCAU1_ WHERE date >= now() - interval '3 days';

--------------------hiCAU1_WS_A07_------------------------
CREATE TEMP TABLE staget(x jsonb);
CREATE TEMP TABLE staget2(date timestamptz, val numeric, id text);
Do $$ declare startdate text := to_char(current_date - 3, 'YYYYMMDD'); Begin EXECUTE format('COPY staget FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/5a5d6d6a-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT INTO staget2 select f.* from staget, jsonb_populate_recordset(null::staget2, x) f;
UPDATE staget2 SET id = 'hiCAU1_WS_A07_';
UPDATE staget2 SET date = DATE_TRUNC('minute', date);
INSERT INTO hiCAU1 SELECT * from staget2 WHERE date >= now() - interval '3 days';
DROP TABLE IF EXISTS staget;
DROP TABLE IF EXISTS staget2;

------------------------hiCAU1_WS_A19--------------------
CREATE TEMP TABLE staget(x jsonb);
CREATE TEMP TABLE staget2(date timestamptz, val numeric, id text);
Do $$ declare startdate text := to_char(current_date - 3, 'YYYYMMDD'); Begin EXECUTE format('COPY staget FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/5a9dd60c-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT INTO staget2 select f.* from staget, jsonb_populate_recordset(null::staget2, x) f;
UPDATE staget2 SET id = 'hiCAU1_WS_A19';
UPDATE staget2 SET date = DATE_TRUNC('minute', date);
INSERT INTO hiCAU1 SELECT * from staget2 WHERE date >= now() - interval '3 days';
DROP TABLE IF EXISTS staget;
DROP TABLE IF EXISTS staget2;

-----------------------hiCAU1_WS_A29---------------------
CREATE TEMP TABLE staget(x jsonb);
CREATE TEMP TABLE staget2(date timestamptz, val numeric, id text);
Do $$ declare startdate text := to_char(current_date - 3, 'YYYYMMDD'); Begin EXECUTE format('COPY staget FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/5adea056-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT INTO staget2 select f.* from staget, jsonb_populate_recordset(null::staget2, x) f;
UPDATE staget2 SET id = 'hiCAU1_WS_A29';
UPDATE staget2 SET date = DATE_TRUNC('minute', date);
INSERT INTO hiCAU1 SELECT * from staget2 WHERE date >= now() - interval '3 days';
DROP TABLE IF EXISTS staget;
DROP TABLE IF EXISTS staget2;

------------------iiCAU1_WS_A07_1----------------------------
CREATE TEMP TABLE staget(x jsonb);
CREATE TEMP TABLE staget2(date timestamptz, val numeric, id text);
Do $$ declare startdate text := to_char(current_date - 3, 'YYYYMMDD'); Begin EXECUTE format('COPY staget FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/59547e54-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT INTO staget2 select f.* from staget, jsonb_populate_recordset(null::staget2, x) f;
UPDATE staget2 SET id = 'iiCAU1_WS_A07_1';
UPDATE staget2 SET date = DATE_TRUNC('minute', date);
INSERT INTO iiCAU1_ SELECT * from staget2 WHERE date >= now() - interval '3 days';
DROP TABLE IF EXISTS staget;
DROP TABLE IF EXISTS staget2;

------------------iiCAU1_WS_A07_2----------------------------
CREATE TEMP TABLE staget(x jsonb);
CREATE TEMP TABLE staget2(date timestamptz, val numeric, id text);
Do $$ declare startdate text := to_char(current_date - 3, 'YYYYMMDD'); Begin EXECUTE format('COPY staget FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/594fc486-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT INTO staget2 select f.* from staget, jsonb_populate_recordset(null::staget2, x) f;
UPDATE staget2 SET id = 'iiCAU1_WS_A07_2';
UPDATE staget2 SET date = DATE_TRUNC('minute', date);
INSERT INTO iiCAU1_ SELECT * from staget2 WHERE date >= now() - interval '3 days';
DROP TABLE IF EXISTS staget;
DROP TABLE IF EXISTS staget2;

------------------iiCAU1_WS_A19_1----------------------------
CREATE TEMP TABLE staget(x jsonb);
CREATE TEMP TABLE staget2(date timestamptz, val numeric, id text);
Do $$ declare startdate text := to_char(current_date - 3, 'YYYYMMDD'); Begin EXECUTE format('COPY staget FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/599868d0-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT INTO staget2 select f.* from staget, jsonb_populate_recordset(null::staget2, x) f;
UPDATE staget2 SET id = 'iiCAU1_WS_A19_1';
UPDATE staget2 SET date = DATE_TRUNC('minute', date);
INSERT INTO iiCAU1_ SELECT * from staget2 WHERE date >= now() - interval '3 days';
DROP TABLE IF EXISTS staget;
DROP TABLE IF EXISTS staget2;

------------------iiCAU1_WS_A19_2----------------------------
CREATE TEMP TABLE staget(x jsonb);
CREATE TEMP TABLE staget2(date timestamptz, val numeric, id text);
Do $$ declare startdate text := to_char(current_date - 3, 'YYYYMMDD'); Begin EXECUTE format('COPY staget FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/59907dd2-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT INTO staget2 select f.* from staget, jsonb_populate_recordset(null::staget2, x) f;
UPDATE staget2 SET id = 'iiCAU1_WS_A19_2';
UPDATE staget2 SET date = DATE_TRUNC('minute', date);
INSERT INTO iiCAU1_ SELECT * from staget2 WHERE date >= now() - interval '3 days';
DROP TABLE IF EXISTS staget;
DROP TABLE IF EXISTS staget2;

------------------iiCAU1_WS_A29_1----------------------------
CREATE TEMP TABLE staget(x jsonb);
CREATE TEMP TABLE staget2(date timestamptz, val numeric, id text);
Do $$ declare startdate text := to_char(current_date - 3, 'YYYYMMDD'); Begin EXECUTE format('COPY staget FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/59ded036-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT INTO staget2 select f.* from staget, jsonb_populate_recordset(null::staget2, x) f;
UPDATE staget2 SET id = 'iiCAU1_WS_A29_1';
UPDATE staget2 SET date = DATE_TRUNC('minute', date);
INSERT INTO iiCAU1_ SELECT * from staget2 WHERE date >= now() - interval '3 days';
DROP TABLE IF EXISTS staget;
DROP TABLE IF EXISTS staget2;

------------------iiCAU1_WS_A29_2----------------------------
CREATE TEMP TABLE staget(x jsonb);
CREATE TEMP TABLE staget2(date timestamptz, val numeric, id text);
Do $$ declare startdate text := to_char(current_date - 3, 'YYYYMMDD'); Begin EXECUTE format('COPY staget FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/59d990bc-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT INTO staget2 select f.* from staget, jsonb_populate_recordset(null::staget2, x) f;
UPDATE staget2 SET id = 'iiCAU1_WS_A29_2';
UPDATE staget2 SET date = DATE_TRUNC('minute', date);
INSERT INTO iiCAU1_ SELECT * from staget2 WHERE date >= now() - interval '3 days';
DROP TABLE IF EXISTS staget;
DROP TABLE IF EXISTS staget2;