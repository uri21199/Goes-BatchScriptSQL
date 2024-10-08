----------------------------------------
------------------IRRAD-----------------
----------------------------------------
DROP TABLE IF EXISTS staget;
DROP TABLE IF EXISTS staget2;
DELETE FROM hiCAU1 WHERE date >= now() - interval '15 days';
DELETE FROM iiCAU1_ WHERE date >= now() - interval '15 days';

--------------------hiCAU1_WS_A07_------------------------
CREATE TEMP TABLE staget(x jsonb);
CREATE TEMP TABLE staget2(date timestamptz, val numeric, id text);
Do $$ declare startdate text := to_char(current_date - 15, 'YYYYMMDD'); Begin EXECUTE format('COPY staget FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/5a5d6d6a-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT INTO staget2 select f.* from staget, jsonb_populate_recordset(null::staget2, x) f;
UPDATE staget2 SET id = 'hiCAU1_WS_A07_';
UPDATE staget2 SET date = DATE_TRUNC('minute', date);
INSERT INTO hiCAU1 SELECT * from staget2 WHERE date >= now() - interval '15 days';
DROP TABLE IF EXISTS staget;
DROP TABLE IF EXISTS staget2;

------------------------hiCAU1_WS_A19--------------------
CREATE TEMP TABLE staget(x jsonb);
CREATE TEMP TABLE staget2(date timestamptz, val numeric, id text);
Do $$ declare startdate text := to_char(current_date - 15, 'YYYYMMDD'); Begin EXECUTE format('COPY staget FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/5a9dd60c-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT INTO staget2 select f.* from staget, jsonb_populate_recordset(null::staget2, x) f;
UPDATE staget2 SET id = 'hiCAU1_WS_A19';
UPDATE staget2 SET date = DATE_TRUNC('minute', date);
INSERT INTO hiCAU1 SELECT * from staget2 WHERE date >= now() - interval '15 days';
DROP TABLE IF EXISTS staget;
DROP TABLE IF EXISTS staget2;

-----------------------hiCAU1_WS_A29---------------------
CREATE TEMP TABLE staget(x jsonb);
CREATE TEMP TABLE staget2(date timestamptz, val numeric, id text);
Do $$ declare startdate text := to_char(current_date - 15, 'YYYYMMDD'); Begin EXECUTE format('COPY staget FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/5adea056-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT INTO staget2 select f.* from staget, jsonb_populate_recordset(null::staget2, x) f;
UPDATE staget2 SET id = 'hiCAU1_WS_A29';
UPDATE staget2 SET date = DATE_TRUNC('minute', date);
INSERT INTO hiCAU1 SELECT * from staget2 WHERE date >= now() - interval '15 days';
DROP TABLE IF EXISTS staget;
DROP TABLE IF EXISTS staget2;

------------------iiCAU1_WS_A07_1----------------------------
CREATE TEMP TABLE staget(x jsonb);
CREATE TEMP TABLE staget2(date timestamptz, val numeric, id text);
Do $$ declare startdate text := to_char(current_date - 15, 'YYYYMMDD'); Begin EXECUTE format('COPY staget FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/59547e54-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT INTO staget2 select f.* from staget, jsonb_populate_recordset(null::staget2, x) f;
UPDATE staget2 SET id = 'iiCAU1_WS_A07_1';
UPDATE staget2 SET date = DATE_TRUNC('minute', date);
INSERT INTO iiCAU1_ SELECT * from staget2 WHERE date >= now() - interval '15 days';
DROP TABLE IF EXISTS staget;
DROP TABLE IF EXISTS staget2;

------------------iiCAU1_WS_A07_2----------------------------
CREATE TEMP TABLE staget(x jsonb);
CREATE TEMP TABLE staget2(date timestamptz, val numeric, id text);
Do $$ declare startdate text := to_char(current_date - 15, 'YYYYMMDD'); Begin EXECUTE format('COPY staget FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/594fc486-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT INTO staget2 select f.* from staget, jsonb_populate_recordset(null::staget2, x) f;
UPDATE staget2 SET id = 'iiCAU1_WS_A07_2';
UPDATE staget2 SET date = DATE_TRUNC('minute', date);
INSERT INTO iiCAU1_ SELECT * from staget2 WHERE date >= now() - interval '15 days';
DROP TABLE IF EXISTS staget;
DROP TABLE IF EXISTS staget2;

------------------iiCAU1_WS_A19_1----------------------------
CREATE TEMP TABLE staget(x jsonb);
CREATE TEMP TABLE staget2(date timestamptz, val numeric, id text);
Do $$ declare startdate text := to_char(current_date - 15, 'YYYYMMDD'); Begin EXECUTE format('COPY staget FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/599868d0-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT INTO staget2 select f.* from staget, jsonb_populate_recordset(null::staget2, x) f;
UPDATE staget2 SET id = 'iiCAU1_WS_A19_1';
UPDATE staget2 SET date = DATE_TRUNC('minute', date);
INSERT INTO iiCAU1_ SELECT * from staget2 WHERE date >= now() - interval '15 days';
DROP TABLE IF EXISTS staget;
DROP TABLE IF EXISTS staget2;

------------------iiCAU1_WS_A19_2----------------------------
CREATE TEMP TABLE staget(x jsonb);
CREATE TEMP TABLE staget2(date timestamptz, val numeric, id text);
Do $$ declare startdate text := to_char(current_date - 15, 'YYYYMMDD'); Begin EXECUTE format('COPY staget FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/59907dd2-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT INTO staget2 select f.* from staget, jsonb_populate_recordset(null::staget2, x) f;
UPDATE staget2 SET id = 'iiCAU1_WS_A19_2';
UPDATE staget2 SET date = DATE_TRUNC('minute', date);
INSERT INTO iiCAU1_ SELECT * from staget2 WHERE date >= now() - interval '15 days';
DROP TABLE IF EXISTS staget;
DROP TABLE IF EXISTS staget2;

------------------iiCAU1_WS_A29_1----------------------------
CREATE TEMP TABLE staget(x jsonb);
CREATE TEMP TABLE staget2(date timestamptz, val numeric, id text);
Do $$ declare startdate text := to_char(current_date - 15, 'YYYYMMDD'); Begin EXECUTE format('COPY staget FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/59ded036-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT INTO staget2 select f.* from staget, jsonb_populate_recordset(null::staget2, x) f;
UPDATE staget2 SET id = 'iiCAU1_WS_A29_1';
UPDATE staget2 SET date = DATE_TRUNC('minute', date);
INSERT INTO iiCAU1_ SELECT * from staget2 WHERE date >= now() - interval '15 days';
DROP TABLE IF EXISTS staget;
DROP TABLE IF EXISTS staget2;

------------------iiCAU1_WS_A29_2----------------------------
CREATE TEMP TABLE staget(x jsonb);
CREATE TEMP TABLE staget2(date timestamptz, val numeric, id text);
Do $$ declare startdate text := to_char(current_date - 15, 'YYYYMMDD'); Begin EXECUTE format('COPY staget FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/59d990bc-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT INTO staget2 select f.* from staget, jsonb_populate_recordset(null::staget2, x) f;
UPDATE staget2 SET id = 'iiCAU1_WS_A29_2';
UPDATE staget2 SET date = DATE_TRUNC('minute', date);
INSERT INTO iiCAU1_ SELECT * from staget2 WHERE date >= now() - interval '15 days';
DROP TABLE IF EXISTS staget;
DROP TABLE IF EXISTS staget2;

DROP TABLE IF EXISTS stageb;
DROP TABLE IF EXISTS stageb2;
DELETE FROM hiCAU2 WHERE date >= now() - interval '15 days';
DELETE FROM iiCAU2_ WHERE date >= now() - interval '15 days';

--------------------hiCAU2_WS_B08------------------------
CREATE TEMP TABLE stageb(x jsonb);
CREATE TEMP TABLE stageb2(date timestamptz, val numeric, id text);
Do $$ declare startdate text := to_char(current_date - 15, 'YYYYMMDD'); Begin EXECUTE format('COPY stageb FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/bdab1500-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT INTO stageb2 select f.* from stageb, jsonb_populate_recordset(null::stageb2, x) f;
UPDATE stageb2 SET id = 'hiCAU2_WS_B08';
UPDATE stageb2 SET date = DATE_TRUNC('minute', date);
INSERT INTO hiCAU2 SELECT * from stageb2 WHERE date >= now() - interval '15 days';
DROP TABLE IF EXISTS stageb;
DROP TABLE IF EXISTS stageb2;

------------------------hiCAU2_WS_B30--------------------
CREATE TEMP TABLE stageb(x jsonb);
CREATE TEMP TABLE stageb2(date timestamptz, val numeric, id text);
Do $$ declare startdate text := to_char(current_date - 15, 'YYYYMMDD'); Begin EXECUTE format('COPY stageb FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/bdea50c6-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT INTO stageb2 select f.* from stageb, jsonb_populate_recordset(null::stageb2, x) f;
UPDATE stageb2 SET id = 'hiCAU2_WS_B30';
UPDATE stageb2 SET date = DATE_TRUNC('minute', date);
INSERT INTO hiCAU2 SELECT * from stageb2 WHERE date >= now() - interval '15 days';
DROP TABLE IF EXISTS stageb;
DROP TABLE IF EXISTS stageb2;

-----------------------hiCAU2_WS_B35---------------------
CREATE TEMP TABLE stageb(x jsonb);
CREATE TEMP TABLE stageb2(date timestamptz, val numeric, id text);
Do $$ declare startdate text := to_char(current_date - 15, 'YYYYMMDD'); Begin EXECUTE format('COPY stageb FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/be29dc0a-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT INTO stageb2 select f.* from stageb, jsonb_populate_recordset(null::stageb2, x) f;
UPDATE stageb2 SET id = 'hiCAU2_WS_B35';
UPDATE stageb2 SET date = DATE_TRUNC('minute', date);
INSERT INTO hiCAU2 SELECT * from stageb2 WHERE date >= now() - interval '15 days';
DROP TABLE IF EXISTS stageb;
DROP TABLE IF EXISTS stageb2;

------------------iiCAU2_WS_B08_1----------------------------
CREATE TEMP TABLE stageb(x jsonb);
CREATE TEMP TABLE stageb2(date timestamptz, val numeric, id text);
Do $$ declare startdate text := to_char(current_date - 15, 'YYYYMMDD'); Begin EXECUTE format('COPY stageb FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/bcbad996-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT INTO stageb2 select f.* from stageb, jsonb_populate_recordset(null::stageb2, x) f;
UPDATE stageb2 SET id = 'iiCAU2_WS_B08_1';
UPDATE stageb2 SET date = DATE_TRUNC('minute', date);
INSERT INTO iiCAU2_ SELECT * from stageb2 WHERE date >= now() - interval '15 days';
DROP TABLE IF EXISTS stageb;
DROP TABLE IF EXISTS stageb2;

------------------iiCAU2_WS_B08_2----------------------------
CREATE TEMP TABLE stageb(x jsonb);
CREATE TEMP TABLE stageb2(date timestamptz, val numeric, id text);
Do $$ declare startdate text := to_char(current_date - 15, 'YYYYMMDD'); Begin EXECUTE format('COPY stageb FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/bcb5f80e-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT INTO stageb2 select f.* from stageb, jsonb_populate_recordset(null::stageb2, x) f;
UPDATE stageb2 SET id = 'iiCAU2_WS_B08_2';
UPDATE stageb2 SET date = DATE_TRUNC('minute', date);
INSERT INTO iiCAU2_ SELECT * from stageb2 WHERE date >= now() - interval '15 days';
DROP TABLE IF EXISTS stageb;
DROP TABLE IF EXISTS stageb2;

------------------iiCAU2_WS_B30_1----------------------------
CREATE TEMP TABLE stageb(x jsonb);
CREATE TEMP TABLE stageb2(date timestamptz, val numeric, id text);
Do $$ declare startdate text := to_char(current_date - 15, 'YYYYMMDD'); Begin EXECUTE format('COPY stageb FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/bcf43eca-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT INTO stageb2 select f.* from stageb, jsonb_populate_recordset(null::stageb2, x) f;
UPDATE stageb2 SET id = 'iiCAU2_WS_B30_1';
UPDATE stageb2 SET date = DATE_TRUNC('minute', date);
INSERT INTO iiCAU2_ SELECT * from stageb2 WHERE date >= now() - interval '15 days';
DROP TABLE IF EXISTS stageb;
DROP TABLE IF EXISTS stageb2;

------------------iiCAU2_WS_B30_2----------------------------
CREATE TEMP TABLE stageb(x jsonb);
CREATE TEMP TABLE stageb2(date timestamptz, val numeric, id text);
Do $$ declare startdate text := to_char(current_date - 15, 'YYYYMMDD'); Begin EXECUTE format('COPY stageb FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/bcef9b2c-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT INTO stageb2 select f.* from stageb, jsonb_populate_recordset(null::stageb2, x) f;
UPDATE stageb2 SET id = 'iiCAU2_WS_B30_2';
UPDATE stageb2 SET date = DATE_TRUNC('minute', date);
INSERT INTO iiCAU2_ SELECT * from stageb2 WHERE date >= now() - interval '15 days';
DROP TABLE IF EXISTS stageb;
DROP TABLE IF EXISTS stageb2;

------------------iiCAU2_WS_B35_1----------------------------
CREATE TEMP TABLE stageb(x jsonb);
CREATE TEMP TABLE stageb2(date timestamptz, val numeric, id text);
Do $$ declare startdate text := to_char(current_date - 15, 'YYYYMMDD'); Begin EXECUTE format('COPY stageb FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/bd2e1ee2-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT INTO stageb2 select f.* from stageb, jsonb_populate_recordset(null::stageb2, x) f;
UPDATE stageb2 SET id = 'iiCAU2_WS_B35_1';
UPDATE stageb2 SET date = DATE_TRUNC('minute', date);
INSERT INTO iiCAU2_ SELECT * from stageb2 WHERE date >= now() - interval '15 days';
DROP TABLE IF EXISTS stageb;
DROP TABLE IF EXISTS stageb2;

------------------iiCAU2_WS_B35_2----------------------------
CREATE TEMP TABLE stageb(x jsonb);
CREATE TEMP TABLE stageb2(date timestamptz, val numeric, id text);
Do $$ declare startdate text := to_char(current_date - 15, 'YYYYMMDD'); Begin EXECUTE format('COPY stageb FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/bd2936ca-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT INTO stageb2 select f.* from stageb, jsonb_populate_recordset(null::stageb2, x) f;
UPDATE stageb2 SET id = 'iiCAU2_WS_B35_2';
UPDATE stageb2 SET date = DATE_TRUNC('minute', date);
INSERT INTO iiCAU2_ SELECT * from stageb2 WHERE date >= now() - interval '15 days';
DROP TABLE IF EXISTS stageb;
DROP TABLE IF EXISTS stageb2;

DROP TABLE IF EXISTS stagec;
DROP TABLE IF EXISTS stagec2;
DELETE FROM hiCAU3 WHERE date >= now() - interval '15 days';
DELETE FROM iiCAU3_ WHERE date >= now() - interval '15 days';

--------------------hiCAU3_WS_C08------------------------
CREATE TEMP TABLE stagec(x jsonb);
CREATE TEMP TABLE stagec2(date timestamptz, val numeric, id text);
Do $$ declare startdate text := to_char(current_date - 15, 'YYYYMMDD'); Begin EXECUTE format('COPY stagec FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/12e18dd8-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT INTO stagec2 select f.* from stagec, jsonb_populate_recordset(null::stagec2, x) f;
UPDATE stagec2 SET id = 'hiCAU3_WS_C08';
UPDATE stagec2 SET date = DATE_TRUNC('minute', date);
INSERT INTO hiCAU3 SELECT * from stagec2 WHERE date >= now() - interval '15 days';
DROP TABLE IF EXISTS stagec;
DROP TABLE IF EXISTS stagec2;

------------------------hiCAU3_WS_C11--------------------
CREATE TEMP TABLE stagec(x jsonb);
CREATE TEMP TABLE stagec2(date timestamptz, val numeric, id text);
Do $$ declare startdate text := to_char(current_date - 15, 'YYYYMMDD'); Begin EXECUTE format('COPY stagec FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/132016fc-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT INTO stagec2 select f.* from stagec, jsonb_populate_recordset(null::stagec2, x) f;
UPDATE stagec2 SET id = 'hiCAU3_WS_C11';
UPDATE stagec2 SET date = DATE_TRUNC('minute', date);
INSERT INTO hiCAU3 SELECT * from stagec2 WHERE date >= now() - interval '15 days';
DROP TABLE IF EXISTS stagec;
DROP TABLE IF EXISTS stagec2;

-----------------------hiCAU3_WS_C29---------------------
CREATE TEMP TABLE stagec(x jsonb);
CREATE TEMP TABLE stagec2(date timestamptz, val numeric, id text);
Do $$ declare startdate text := to_char(current_date - 15, 'YYYYMMDD'); Begin EXECUTE format('COPY stagec FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/135dca4c-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT INTO stagec2 select f.* from stagec, jsonb_populate_recordset(null::stagec2, x) f;
UPDATE stagec2 SET id = 'hiCAU3_WS_C29';
UPDATE stagec2 SET date = DATE_TRUNC('minute', date);
INSERT INTO hiCAU3 SELECT * from stagec2 WHERE date >= now() - interval '15 days';
DROP TABLE IF EXISTS stagec;
DROP TABLE IF EXISTS stagec2;

------------------iiCAU3_WS_C08_1----------------------------
CREATE TEMP TABLE stagec(x jsonb);
CREATE TEMP TABLE stagec2(date timestamptz, val numeric, id text);
Do $$ declare startdate text := to_char(current_date - 15, 'YYYYMMDD'); Begin EXECUTE format('COPY stagec FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/11ecfa70-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT INTO stagec2 select f.* from stagec, jsonb_populate_recordset(null::stagec2, x) f;
UPDATE stagec2 SET id = 'iiCAU3_WS_C08_1';
UPDATE stagec2 SET date = DATE_TRUNC('minute', date);
INSERT INTO iiCAU3_ SELECT * from stagec2 WHERE date >= now() - interval '15 days';
DROP TABLE IF EXISTS stagec;
DROP TABLE IF EXISTS stagec2;

------------------iiCAU3_WS_C08_2----------------------------
CREATE TEMP TABLE stagec(x jsonb);
CREATE TEMP TABLE stagec2(date timestamptz, val numeric, id text);
Do $$ declare startdate text := to_char(current_date - 15, 'YYYYMMDD'); Begin EXECUTE format('COPY stagec FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/11e80718-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT INTO stagec2 select f.* from stagec, jsonb_populate_recordset(null::stagec2, x) f;
UPDATE stagec2 SET id = 'iiCAU3_WS_C08_2';
UPDATE stagec2 SET date = DATE_TRUNC('minute', date);
INSERT INTO iiCAU3_ SELECT * from stagec2 WHERE date >= now() - interval '15 days';
DROP TABLE IF EXISTS stagec;
DROP TABLE IF EXISTS stagec2;

------------------iiCAU3_WS_C11_1----------------------------
CREATE TEMP TABLE stagec(x jsonb);
CREATE TEMP TABLE stagec2(date timestamptz, val numeric, id text);
Do $$ declare startdate text := to_char(current_date - 15, 'YYYYMMDD'); Begin EXECUTE format('COPY stagec FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/12261f8a-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT INTO stagec2 select f.* from stagec, jsonb_populate_recordset(null::stagec2, x) f;
UPDATE stagec2 SET id = 'iiCAU3_WS_C11_1';
UPDATE stagec2 SET date = DATE_TRUNC('minute', date);
INSERT INTO iiCAU3_ SELECT * from stagec2 WHERE date >= now() - interval '15 days';
DROP TABLE IF EXISTS stagec;
DROP TABLE IF EXISTS stagec2;

------------------iiCAU3_WS_C11_2----------------------------
CREATE TEMP TABLE stagec(x jsonb);
CREATE TEMP TABLE stagec2(date timestamptz, val numeric, id text);
Do $$ declare startdate text := to_char(current_date - 15, 'YYYYMMDD'); Begin EXECUTE format('COPY stagec FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/12217976-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT INTO stagec2 select f.* from stagec, jsonb_populate_recordset(null::stagec2, x) f;
UPDATE stagec2 SET id = 'iiCAU3_WS_C11_2';
UPDATE stagec2 SET date = DATE_TRUNC('minute', date);
INSERT INTO iiCAU3_ SELECT * from stagec2 WHERE date >= now() - interval '15 days';
DROP TABLE IF EXISTS stagec;
DROP TABLE IF EXISTS stagec2;

------------------iiCAU3_WS_C29_1----------------------------
CREATE TEMP TABLE stagec(x jsonb);
CREATE TEMP TABLE stagec2(date timestamptz, val numeric, id text);
Do $$ declare startdate text := to_char(current_date - 15, 'YYYYMMDD'); Begin EXECUTE format('COPY stagec FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/125ee3d8-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT INTO stagec2 select f.* from stagec, jsonb_populate_recordset(null::stagec2, x) f;
UPDATE stagec2 SET id = 'iiCAU3_WS_C29_1';
UPDATE stagec2 SET date = DATE_TRUNC('minute', date);
INSERT INTO iiCAU3_ SELECT * from stagec2 WHERE date >= now() - interval '15 days';
DROP TABLE IF EXISTS stagec;
DROP TABLE IF EXISTS stagec2;

------------------iiCAU3_WS_C29_2----------------------------
CREATE TEMP TABLE stagec(x jsonb);
CREATE TEMP TABLE stagec2(date timestamptz, val numeric, id text);
Do $$ declare startdate text := to_char(current_date - 15, 'YYYYMMDD'); Begin EXECUTE format('COPY stagec FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/125ad5ea-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT INTO stagec2 select f.* from stagec, jsonb_populate_recordset(null::stagec2, x) f;
UPDATE stagec2 SET id = 'iiCAU3_WS_C29_2';
UPDATE stagec2 SET date = DATE_TRUNC('minute', date);
INSERT INTO iiCAU3_ SELECT * from stagec2 WHERE date >= now() - interval '15 days';
DROP TABLE IF EXISTS stagec;
DROP TABLE IF EXISTS stagec2;

----------------------------------------
--------------CAUCHARIDATABASEHF--------
----------------------------------------

------------------powercau3----------------------------
DROP TABLE IF EXISTS powercau3;
CREATE TABLE powercau3 (date timestamptz, val numeric);
create temp table stagey(x jsonb);
Do $$ declare startdate text := to_char(current_date - 15, 'YYYYMMDD'); Begin EXECUTE format('COPY stagey FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/1851c03a-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT into powercau3 select f.* from stagey, jsonb_populate_recordset(null::powercau3, x) f;
ALTER TABLE powercau3 RENAME COLUMN val TO powercau3 ;
UPDATE powercau3 SET date = DATE_TRUNC('minute', date);
UPDATE powercau3 SET powercau3 = powercau3 / 1000 WHERE date >= now() - interval '15 days' AND date <= CURRENT_TIMESTAMP;
DROP TABLE IF EXISTS stagey;
------------------------------Energy exported CAU1------------------------------

DROP TABLE IF EXISTS eecau1;
CREATE TABLE eecau1 (date timestamptz, val numeric);
create temp table stagey(x jsonb);
Do $$ declare startdate text := to_char(current_date - 15, 'YYYYMMDD'); Begin EXECUTE format('COPY stagey FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/c62ae0c8-0816-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT into eecau1 select f.* from stagey, jsonb_populate_recordset(null::eecau1, x) f;
ALTER TABLE eecau1 RENAME COLUMN val TO eecau1val ;
UPDATE eecau1 SET date = DATE_TRUNC('minute', date);
UPDATE eecau1 SET eecau1val = eecau1val / 1000 WHERE date >= now() - interval '15 days' AND date <= CURRENT_TIMESTAMP;
DROP TABLE IF EXISTS stagey;
------------------------------Energy exported CAU2------------------------------
DROP TABLE IF EXISTS eecau2;
CREATE TABLE eecau2 (date timestamptz, val numeric);
create temp table stagey(x jsonb);
Do $$ declare startdate text := to_char(current_date - 15, 'YYYYMMDD'); Begin EXECUTE format('COPY stagey FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/676a0fc6-0809-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT into eecau2 select f.* from stagey, jsonb_populate_recordset(null::eecau2, x) f;
ALTER TABLE eecau2 RENAME COLUMN val TO eecau2val ;
UPDATE eecau2 SET date = DATE_TRUNC('minute', date);
UPDATE eecau2 SET eecau2val = eecau2val / 1000 WHERE date >= now() - interval '15 days' AND date <= CURRENT_TIMESTAMP;
DROP TABLE IF EXISTS stagey;
------------------------------Energy exported CAU3------------------------------
DROP TABLE IF EXISTS eecau3;
CREATE TABLE eecau3 (date timestamptz, val numeric);
create temp table stagey(x jsonb);
Do $$ declare startdate text := to_char(current_date - 15, 'YYYYMMDD'); Begin EXECUTE format('COPY stagey FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/8acddc7c-0809-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT into eecau3 select f.* from stagey, jsonb_populate_recordset(null::eecau3, x) f;
ALTER TABLE eecau3 RENAME COLUMN val TO eecau3val ;
UPDATE eecau3 SET date = DATE_TRUNC('minute', date);
UPDATE eecau3 SET eecau3val = eecau3val / 1000 WHERE date >= now() - interval '15 days' AND date <= CURRENT_TIMESTAMP;
DROP TABLE IF EXISTS stagey;
--------------------availcau1-------------------------
DROP TABLE IF EXISTS availcau1;
CREATE TABLE availcau1 (date timestamptz, val numeric);
create temp table stagey(x jsonb);
Do $$ declare startdate text := to_char(current_date - 15, 'YYYYMMDD'); Begin EXECUTE format('COPY stagey FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/9dbe91f7-1dfe-4b1a-bc5e-c70fea655af4/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT into availcau1 select f.* from stagey, jsonb_populate_recordset(null::availcau1, x) f;
ALTER TABLE availcau1 RENAME COLUMN val TO availcau1 ;
UPDATE availcau1 SET date = DATE_TRUNC('minute', date);
DROP TABLE IF EXISTS stagey;
--------------------availcau2-------------------------
DROP TABLE IF EXISTS availcau2;
CREATE TABLE availcau2 (date timestamptz, val numeric);
create temp table stagey(x jsonb);
Do $$ declare startdate text := to_char(current_date - 15, 'YYYYMMDD'); Begin EXECUTE format('COPY stagey FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/691e6d91-3f18-490e-80fd-45680a5a61d4/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT into availcau2 select f.* from stagey, jsonb_populate_recordset(null::availcau2, x) f;
ALTER TABLE availcau2 RENAME COLUMN val TO availcau2 ;
UPDATE availcau2 SET date = DATE_TRUNC('minute', date);
DROP TABLE IF EXISTS stagey;
--------------------availcau3-------------------------
DROP TABLE IF EXISTS availcau3;
CREATE TABLE availcau3 (date timestamptz, val numeric);
create temp table stagey(x jsonb);
Do $$ declare startdate text := to_char(current_date - 15, 'YYYYMMDD'); Begin EXECUTE format('COPY stagey FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/b82ea7ce-7f07-476b-9153-b84c690f3fbf/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT into availcau3 select f.* from stagey, jsonb_populate_recordset(null::availcau3, x) f;
ALTER TABLE availcau3 RENAME COLUMN val TO availcau3 ;
UPDATE availcau3 SET date = DATE_TRUNC('minute', date);
DROP TABLE IF EXISTS stagey;
--------------------poicau1-------------------------
DROP TABLE IF EXISTS poicau1;
CREATE TABLE poicau1 (date timestamptz, val numeric);
create temp table stagey(x jsonb);
Do $$ declare startdate text := to_char(current_date - 15, 'YYYYMMDD'); Begin EXECUTE format('COPY stagey FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/c62977d8-0816-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT into poicau1 select f.* from stagey, jsonb_populate_recordset(null::poicau1, x) f;
ALTER TABLE poicau1 RENAME COLUMN val TO poicau1 ;
UPDATE poicau1 SET date = DATE_TRUNC('minute', date);
UPDATE poicau1 SET poicau1 = poicau1 / 1000 WHERE date >= now() - interval '15 days' AND date <= CURRENT_TIMESTAMP;
DROP TABLE IF EXISTS stagey;
--------------------poicau2-------------------------
DROP TABLE IF EXISTS poicau2;
CREATE TABLE poicau2 (date timestamptz, val numeric);
create temp table stagey(x jsonb);
Do $$ declare startdate text := to_char(current_date - 15, 'YYYYMMDD'); Begin EXECUTE format('COPY stagey FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/67685e10-0809-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT into poicau2 select f.* from stagey, jsonb_populate_recordset(null::poicau2, x) f;
ALTER TABLE poicau2 RENAME COLUMN val TO poicau2 ;
UPDATE poicau2 SET date = DATE_TRUNC('minute', date);
UPDATE poicau2 SET poicau2 = poicau2 / 1000 WHERE date >= now() - interval '15 days' AND date <= CURRENT_TIMESTAMP;
DROP TABLE IF EXISTS stagey;
--------------------poicau3-------------------------
DROP TABLE IF EXISTS poicau3;
CREATE TABLE poicau3 (date timestamptz, val numeric);
create temp table stagey(x jsonb);
Do $$ declare startdate text := to_char(current_date - 15, 'YYYYMMDD'); Begin EXECUTE format('COPY stagey FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/8acca398-0809-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT into poicau3 select f.* from stagey, jsonb_populate_recordset(null::poicau3, x) f;
ALTER TABLE poicau3 RENAME COLUMN val TO poicau3 ;
UPDATE poicau3 SET date = DATE_TRUNC('minute', date);
UPDATE poicau3 SET poicau3 = poicau3 / 1000 WHERE date >= now() - interval '15 days' AND date <= CURRENT_TIMESTAMP;
DROP TABLE IF EXISTS stagey;
------------------powercau1----------------------------
DROP TABLE IF EXISTS powercau1;
CREATE TABLE powercau1 (date timestamptz, val numeric);
create temp table stagey(x jsonb);
Do $$ declare startdate text := to_char(current_date - 15, 'YYYYMMDD'); Begin EXECUTE format('COPY stagey FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/5fea3ca4-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT into powercau1 select f.* from stagey, jsonb_populate_recordset(null::powercau1, x) f;
ALTER TABLE powercau1 RENAME COLUMN val TO powercau1 ;
UPDATE powercau1 SET date = DATE_TRUNC('minute', date);
UPDATE powercau1 SET powercau1 = powercau1 / 1000 WHERE date >= now() - interval '15 days' AND date <= CURRENT_TIMESTAMP;
DROP TABLE IF EXISTS stagey;
------------------powercau2----------------------------
DROP TABLE IF EXISTS powercau2;
CREATE TABLE powercau2 (date timestamptz, val numeric);
create temp table stagey(x jsonb);
Do $$ declare startdate text := to_char(current_date - 15, 'YYYYMMDD'); Begin EXECUTE format('COPY stagey FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/c320449c-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT into powercau2 select f.* from stagey, jsonb_populate_recordset(null::powercau2, x) f;
ALTER TABLE powercau2 RENAME COLUMN val TO powercau2 ;
UPDATE powercau2 SET date = DATE_TRUNC('minute', date);
UPDATE powercau2 SET powercau2 = powercau2 / 1000 WHERE date >= now() - interval '15 days' AND date <= CURRENT_TIMESTAMP;
DROP TABLE IF EXISTS stagey;

------------------lvcau1----------------------------
DROP TABLE IF EXISTS stagex;
DROP TABLE IF EXISTS lvcau1 ;
CREATE TABLE lvcau1 (date timestamptz, val numeric);
CREATE TEMP TABLE stagex(x jsonb) ;
Do $$ declare startdate text := to_char(current_date - 15, 'YYYYMMDD'); Begin EXECUTE format('COPY stagex FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/607234a6-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT into lvcau1 select f.* from stagex, jsonb_populate_recordset(null::lvcau1, x) f;
ALTER TABLE lvcau1 RENAME COLUMN val TO lvcau1 ;
UPDATE lvcau1 SET date = DATE_TRUNC('minute', date);
DROP TABLE IF EXISTS stagex;

------------------lvcau2----------------------------

DROP TABLE IF EXISTS lvcau2 ;
CREATE TABLE lvcau2 (date timestamptz, val numeric);
CREATE TEMP TABLE stagex(x jsonb) ;
Do $$ declare startdate text := to_char(current_date - 15, 'YYYYMMDD'); Begin EXECUTE format('COPY stagex FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/c3bb19d6-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT into lvcau2 select f.* from stagex, jsonb_populate_recordset(null::lvcau2, x) f;
ALTER TABLE lvcau2 RENAME COLUMN val TO lvcau2 ;
UPDATE lvcau2 SET date = DATE_TRUNC('minute', date);
DROP TABLE IF EXISTS stagex;

------------------lvcau3----------------------------

DROP TABLE IF EXISTS lvcau3 ;
CREATE TABLE lvcau3 (date timestamptz, val numeric);
CREATE TEMP TABLE stagex(x jsonb) ;
Do $$ declare startdate text := to_char(current_date - 15, 'YYYYMMDD'); Begin EXECUTE format('COPY stagex FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/18e60db2-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT into lvcau3 select f.* from stagex, jsonb_populate_recordset(null::lvcau3, x) f;
ALTER TABLE lvcau3 RENAME COLUMN val TO lvcau3 ;
UPDATE lvcau3 SET date = DATE_TRUNC('minute', date);
DROP TABLE IF EXISTS stagex;

----------------freccau1---------------------------

DROP TABLE IF EXISTS freccau1 ;
CREATE TABLE freccau1 (date timestamptz, val numeric);
CREATE TEMP TABLE stagex(x jsonb) ;
Do $$ declare startdate text := to_char(current_date - 15, 'YYYYMMDD'); Begin EXECUTE format('COPY stagex FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/7fb8f65c-29bd-11eb-a0f9-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT into freccau1 select f.* from stagex, jsonb_populate_recordset(null::freccau1, x) f;
ALTER TABLE freccau1 RENAME COLUMN val TO freccau1 ;
UPDATE freccau1 SET date = DATE_TRUNC('minute', date);
DROP TABLE IF EXISTS stagex;

----------------freccau2---------------------------

DROP TABLE IF EXISTS freccau2 ;
CREATE TABLE freccau2 (date timestamptz, val numeric);
CREATE TEMP TABLE stagex(x jsonb) ;
Do $$ declare startdate text := to_char(current_date - 15, 'YYYYMMDD'); Begin EXECUTE format('COPY stagex FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/142c54ac-298f-11eb-9edf-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT into freccau2 select f.* from stagex, jsonb_populate_recordset(null::freccau2, x) f;
ALTER TABLE freccau2 RENAME COLUMN val TO freccau2 ;
UPDATE freccau2 SET date = DATE_TRUNC('minute', date);
DROP TABLE IF EXISTS stagex;

----------------freccau3---------------------------

DROP TABLE IF EXISTS freccau3 ;
CREATE TABLE freccau3 (date timestamptz, val numeric);
CREATE TEMP TABLE stagex(x jsonb) ;
Do $$ declare startdate text := to_char(current_date - 15, 'YYYYMMDD'); Begin EXECUTE format('COPY stagex FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/67593d54-28ed-11eb-b18a-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT into freccau3 select f.* from stagex, jsonb_populate_recordset(null::freccau3, x) f;
ALTER TABLE freccau3 RENAME COLUMN val TO freccau3 ;
UPDATE freccau3 SET date = DATE_TRUNC('minute', date);
DROP TABLE IF EXISTS stagex;

------------------rpcau1----------------------------

DROP TABLE IF EXISTS rpcau1 ;
CREATE TABLE rpcau1 (date timestamptz, val numeric);
CREATE TEMP TABLE stagex(x jsonb) ;
Do $$ declare startdate text := to_char(current_date - 15, 'YYYYMMDD'); Begin EXECUTE format('COPY stagex FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/608f4776-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT into rpcau1 select f.* from stagex, jsonb_populate_recordset(null::rpcau1, x) f;
ALTER TABLE rpcau1 RENAME COLUMN val TO rpcau1 ;
UPDATE rpcau1 SET date = DATE_TRUNC('minute', date);
UPDATE rpcau1 SET rpcau1 = rpcau1 / 1000 WHERE date >= now() - interval '15 days' AND date <= CURRENT_TIMESTAMP;
DROP TABLE IF EXISTS stagex;

------------------rpcau2----------------------------

DROP TABLE IF EXISTS rpcau2 ;
CREATE TABLE rpcau2 (date timestamptz, val numeric);
CREATE TEMP TABLE stagex(x jsonb) ;
Do $$ declare startdate text := to_char(current_date - 15, 'YYYYMMDD'); Begin EXECUTE format('COPY stagex FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/c3d79778-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT into rpcau2 select f.* from stagex, jsonb_populate_recordset(null::rpcau2, x) f;
ALTER TABLE rpcau2 RENAME COLUMN val TO rpcau2 ;
UPDATE rpcau2 SET date = DATE_TRUNC('minute', date);
UPDATE rpcau2 SET rpcau2 = rpcau2 / 1000 WHERE date >= now() - interval '15 days' AND date <= CURRENT_TIMESTAMP;
DROP TABLE IF EXISTS stagex;

------------------rpcau3----------------------------

DROP TABLE IF EXISTS rpcau3 ;
CREATE TABLE rpcau3 (date timestamptz, val numeric);
CREATE TEMP TABLE stagex(x jsonb) ;
Do $$ declare startdate text := to_char(current_date - 15, 'YYYYMMDD'); Begin EXECUTE format('COPY stagex FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/19024cac-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT into rpcau3 select f.* from stagex, jsonb_populate_recordset(null::rpcau3, x) f;
ALTER TABLE rpcau3 RENAME COLUMN val TO rpcau3 ;
UPDATE rpcau3 SET date = DATE_TRUNC('minute', date);
UPDATE rpcau3 SET rpcau3 = rpcau3 / 1000 WHERE date >= now() - interval '15 days' AND date <= CURRENT_TIMESTAMP;
DROP TABLE IF EXISTS stagex;

-----------------------------------------------unir en 1 tabla y dividir por 1000 ------------------------------



UPDATE public.caucharidatabasehf SET eecau1val = eecau1.eecau1val FROM public.eecau1 WHERE public.eecau1.date = caucharidatabasehf.date AND caucharidatabasehf.date >= now() - interval '15 days' AND caucharidatabasehf.date <= CURRENT_TIMESTAMP;
UPDATE public.caucharidatabasehf SET eecau2val = eecau2.eecau2val FROM public.eecau2 WHERE public.eecau2.date = caucharidatabasehf.date AND caucharidatabasehf.date >= now() - interval '15 days' AND caucharidatabasehf.date <= CURRENT_TIMESTAMP;
UPDATE public.caucharidatabasehf SET eecau3val = eecau3.eecau3val FROM public.eecau3 WHERE public.eecau3.date = caucharidatabasehf.date AND caucharidatabasehf.date >= now() - interval '15 days' AND caucharidatabasehf.date <= CURRENT_TIMESTAMP;
UPDATE public.caucharidatabasehf SET availcau1 = availcau1.availcau1 FROM public.availcau1 WHERE public.availcau1.date = caucharidatabasehf.date AND caucharidatabasehf.date >= now() - interval '15 days' AND caucharidatabasehf.date <= CURRENT_TIMESTAMP;
UPDATE public.caucharidatabasehf SET availcau2 = availcau2.availcau2 FROM public.availcau2 WHERE public.availcau2.date = caucharidatabasehf.date AND caucharidatabasehf.date >= now() - interval '15 days' AND caucharidatabasehf.date <= CURRENT_TIMESTAMP;
UPDATE public.caucharidatabasehf SET availcau3 = availcau3.availcau3 FROM public.availcau3 WHERE public.availcau3.date = caucharidatabasehf.date AND caucharidatabasehf.date >= now() - interval '15 days' AND caucharidatabasehf.date <= CURRENT_TIMESTAMP;
UPDATE public.caucharidatabasehf SET poicau1 = poicau1.poicau1 FROM public.poicau1 WHERE public.poicau1.date = caucharidatabasehf.date AND caucharidatabasehf.date >= now() - interval '15 days' AND caucharidatabasehf.date <= CURRENT_TIMESTAMP;
UPDATE public.caucharidatabasehf SET poicau2 = poicau2.poicau2 FROM public.poicau2 WHERE public.poicau2.date = caucharidatabasehf.date AND caucharidatabasehf.date >= now() - interval '15 days' AND caucharidatabasehf.date <= CURRENT_TIMESTAMP;
UPDATE public.caucharidatabasehf SET poicau3 = poicau3.poicau3 FROM public.poicau3 WHERE public.poicau3.date = caucharidatabasehf.date AND caucharidatabasehf.date >= now() - interval '15 days' AND caucharidatabasehf.date <= CURRENT_TIMESTAMP;
UPDATE public.caucharidatabasehf SET powercau1 = powercau1.powercau1 FROM public.powercau1 WHERE public.powercau1.date = caucharidatabasehf.date AND caucharidatabasehf.date >= now() - interval '15 days' AND caucharidatabasehf.date <= CURRENT_TIMESTAMP;
UPDATE public.caucharidatabasehf SET powercau2 = powercau2.powercau2 FROM public.powercau2 WHERE public.powercau2.date = caucharidatabasehf.date AND caucharidatabasehf.date >= now() - interval '15 days' AND caucharidatabasehf.date <= CURRENT_TIMESTAMP;
UPDATE public.caucharidatabasehf SET powercau3 = powercau3.powercau3 FROM public.powercau3 WHERE public.powercau3.date = caucharidatabasehf.date AND caucharidatabasehf.date >= now() - interval '15 days' AND caucharidatabasehf.date <= CURRENT_TIMESTAMP;

UPDATE public.caucharidatabasehf SET lvcau1 = lvcau1.lvcau1 FROM public.lvcau1 WHERE public.lvcau1.date = caucharidatabasehf.date AND caucharidatabasehf.date >= now() - interval '15 days' AND caucharidatabasehf.date <= CURRENT_TIMESTAMP;
UPDATE public.caucharidatabasehf SET lvcau2 = lvcau2.lvcau2 FROM public.lvcau2 WHERE public.lvcau2.date = caucharidatabasehf.date AND caucharidatabasehf.date >= now() - interval '15 days' AND caucharidatabasehf.date <= CURRENT_TIMESTAMP;
UPDATE public.caucharidatabasehf SET lvcau3 = lvcau3.lvcau3 FROM public.lvcau3 WHERE public.lvcau3.date = caucharidatabasehf.date AND caucharidatabasehf.date >= now() - interval '15 days' AND caucharidatabasehf.date <= CURRENT_TIMESTAMP;
UPDATE public.caucharidatabasehf SET freccau1 = freccau1.freccau1 FROM public.freccau1 WHERE public.freccau1.date = caucharidatabasehf.date AND caucharidatabasehf.date >= now() - interval '15 days' AND caucharidatabasehf.date <= CURRENT_TIMESTAMP;
UPDATE public.caucharidatabasehf SET freccau2 = freccau2.freccau2 FROM public.freccau2 WHERE public.freccau2.date = caucharidatabasehf.date AND caucharidatabasehf.date >= now() - interval '15 days' AND caucharidatabasehf.date <= CURRENT_TIMESTAMP;
UPDATE public.caucharidatabasehf SET freccau3 = freccau3.freccau3 FROM public.freccau3 WHERE public.freccau3.date = caucharidatabasehf.date AND caucharidatabasehf.date >= now() - interval '15 days' AND caucharidatabasehf.date <= CURRENT_TIMESTAMP;
UPDATE public.caucharidatabasehf SET rpcau1 = rpcau1.rpcau1 FROM public.rpcau1 WHERE public.rpcau1.date = caucharidatabasehf.date AND caucharidatabasehf.date >= now() - interval '15 days' AND caucharidatabasehf.date <= CURRENT_TIMESTAMP;
UPDATE public.caucharidatabasehf SET rpcau2 = rpcau2.rpcau2 FROM public.rpcau2 WHERE public.rpcau2.date = caucharidatabasehf.date AND caucharidatabasehf.date >= now() - interval '15 days' AND caucharidatabasehf.date <= CURRENT_TIMESTAMP;
UPDATE public.caucharidatabasehf SET rpcau3 = rpcau3.rpcau3 FROM public.rpcau3 WHERE public.rpcau3.date = caucharidatabasehf.date AND caucharidatabasehf.date >= now() - interval '15 days' AND caucharidatabasehf.date <= CURRENT_TIMESTAMP;


-------------------------------------------------------------
-----------------------TRAFOS--------------------------------
-------------------------------------------------------------

DELETE FROM caupotenciatrafos_cau1fv WHERE date >= now() - interval '15 days';
DROP TABLE IF EXISTS stage_trafos_cau1;
DROP TABLE IF EXISTS stage_trafos_cau12;


CREATE TEMP TABLE stage_trafos_cau1(x jsonb);
CREATE TEMP TABLE stage_trafos_cau12(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau1 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/60e39524-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau12 select f.* from stage_trafos_cau1, jsonb_populate_recordset(null::stage_trafos_cau12, x) f;
UPDATE stage_trafos_cau12 SET cau = 'cau1fv';
UPDATE stage_trafos_cau12 SET id = 'A01';
UPDATE stage_trafos_cau12 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau1fv SELECT * from stage_trafos_cau12 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau1;
DROP TABLE IF EXISTS stage_trafos_cau12;

CREATE TEMP TABLE stage_trafos_cau1(x jsonb);
CREATE TEMP TABLE stage_trafos_cau12(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau1 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/61444e0a-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau12 select f.* from stage_trafos_cau1, jsonb_populate_recordset(null::stage_trafos_cau12, x) f;
UPDATE stage_trafos_cau12 SET cau = 'cau1fv';
UPDATE stage_trafos_cau12 SET id = 'A02';
UPDATE stage_trafos_cau12 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau1fv SELECT * from stage_trafos_cau12 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau1;
DROP TABLE IF EXISTS stage_trafos_cau12;

CREATE TEMP TABLE stage_trafos_cau1(x jsonb);
CREATE TEMP TABLE stage_trafos_cau12(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau1 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/61a645ec-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau12 select f.* from stage_trafos_cau1, jsonb_populate_recordset(null::stage_trafos_cau12, x) f;
UPDATE stage_trafos_cau12 SET cau = 'cau1fv';
UPDATE stage_trafos_cau12 SET id = 'A03';
UPDATE stage_trafos_cau12 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau1fv SELECT * from stage_trafos_cau12 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau1;
DROP TABLE IF EXISTS stage_trafos_cau12;

CREATE TEMP TABLE stage_trafos_cau1(x jsonb);
CREATE TEMP TABLE stage_trafos_cau12(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau1 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/6205b05e-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau12 select f.* from stage_trafos_cau1, jsonb_populate_recordset(null::stage_trafos_cau12, x) f;
UPDATE stage_trafos_cau12 SET cau = 'cau1fv';
UPDATE stage_trafos_cau12 SET id = 'A04';
UPDATE stage_trafos_cau12 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau1fv SELECT * from stage_trafos_cau12 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau1;
DROP TABLE IF EXISTS stage_trafos_cau12;

CREATE TEMP TABLE stage_trafos_cau1(x jsonb);
CREATE TEMP TABLE stage_trafos_cau12(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau1 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/6267127c-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau12 select f.* from stage_trafos_cau1, jsonb_populate_recordset(null::stage_trafos_cau12, x) f;
UPDATE stage_trafos_cau12 SET cau = 'cau1fv';
UPDATE stage_trafos_cau12 SET id = 'A05';
UPDATE stage_trafos_cau12 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau1fv SELECT * from stage_trafos_cau12 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau1;
DROP TABLE IF EXISTS stage_trafos_cau12;

CREATE TEMP TABLE stage_trafos_cau1(x jsonb);
CREATE TEMP TABLE stage_trafos_cau12(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau1 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/62c73a9e-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau12 select f.* from stage_trafos_cau1, jsonb_populate_recordset(null::stage_trafos_cau12, x) f;
UPDATE stage_trafos_cau12 SET cau = 'cau1fv';
UPDATE stage_trafos_cau12 SET id = 'A06';
UPDATE stage_trafos_cau12 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau1fv SELECT * from stage_trafos_cau12 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau1;
DROP TABLE IF EXISTS stage_trafos_cau12;

CREATE TEMP TABLE stage_trafos_cau1(x jsonb);
CREATE TEMP TABLE stage_trafos_cau12(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau1 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/63277526-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau12 select f.* from stage_trafos_cau1, jsonb_populate_recordset(null::stage_trafos_cau12, x) f;
UPDATE stage_trafos_cau12 SET cau = 'cau1fv';
UPDATE stage_trafos_cau12 SET id = 'A07';
UPDATE stage_trafos_cau12 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau1fv SELECT * from stage_trafos_cau12 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau1;
DROP TABLE IF EXISTS stage_trafos_cau12;

CREATE TEMP TABLE stage_trafos_cau1(x jsonb);
CREATE TEMP TABLE stage_trafos_cau12(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau1 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/638796d6-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau12 select f.* from stage_trafos_cau1, jsonb_populate_recordset(null::stage_trafos_cau12, x) f;
UPDATE stage_trafos_cau12 SET cau = 'cau1fv';
UPDATE stage_trafos_cau12 SET id = 'A08';
UPDATE stage_trafos_cau12 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau1fv SELECT * from stage_trafos_cau12 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau1;
DROP TABLE IF EXISTS stage_trafos_cau12;

CREATE TEMP TABLE stage_trafos_cau1(x jsonb);
CREATE TEMP TABLE stage_trafos_cau12(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau1 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/63e89864-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau12 select f.* from stage_trafos_cau1, jsonb_populate_recordset(null::stage_trafos_cau12, x) f;
UPDATE stage_trafos_cau12 SET cau = 'cau1fv';
UPDATE stage_trafos_cau12 SET id = 'A09';
UPDATE stage_trafos_cau12 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau1fv SELECT * from stage_trafos_cau12 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau1;
DROP TABLE IF EXISTS stage_trafos_cau12;

CREATE TEMP TABLE stage_trafos_cau1(x jsonb);
CREATE TEMP TABLE stage_trafos_cau12(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau1 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/644994a2-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau12 select f.* from stage_trafos_cau1, jsonb_populate_recordset(null::stage_trafos_cau12, x) f;
UPDATE stage_trafos_cau12 SET cau = 'cau1fv';
UPDATE stage_trafos_cau12 SET id = 'A10';
UPDATE stage_trafos_cau12 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau1fv SELECT * from stage_trafos_cau12 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau1;
DROP TABLE IF EXISTS stage_trafos_cau12;

CREATE TEMP TABLE stage_trafos_cau1(x jsonb);
CREATE TEMP TABLE stage_trafos_cau12(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau1 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/64ab8e46-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau12 select f.* from stage_trafos_cau1, jsonb_populate_recordset(null::stage_trafos_cau12, x) f;
UPDATE stage_trafos_cau12 SET cau = 'cau1fv';
UPDATE stage_trafos_cau12 SET id = 'A11';
UPDATE stage_trafos_cau12 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau1fv SELECT * from stage_trafos_cau12 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau1;
DROP TABLE IF EXISTS stage_trafos_cau12;

CREATE TEMP TABLE stage_trafos_cau1(x jsonb);
CREATE TEMP TABLE stage_trafos_cau12(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau1 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/650c86ec-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau12 select f.* from stage_trafos_cau1, jsonb_populate_recordset(null::stage_trafos_cau12, x) f;
UPDATE stage_trafos_cau12 SET cau = 'cau1fv';
UPDATE stage_trafos_cau12 SET id = 'A12';
UPDATE stage_trafos_cau12 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau1fv SELECT * from stage_trafos_cau12 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau1;
DROP TABLE IF EXISTS stage_trafos_cau12;

CREATE TEMP TABLE stage_trafos_cau1(x jsonb);
CREATE TEMP TABLE stage_trafos_cau12(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau1 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/65716846-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau12 select f.* from stage_trafos_cau1, jsonb_populate_recordset(null::stage_trafos_cau12, x) f;
UPDATE stage_trafos_cau12 SET cau = 'cau1fv';
UPDATE stage_trafos_cau12 SET id = 'A13';
UPDATE stage_trafos_cau12 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau1fv SELECT * from stage_trafos_cau12 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau1;
DROP TABLE IF EXISTS stage_trafos_cau12;

CREATE TEMP TABLE stage_trafos_cau1(x jsonb);
CREATE TEMP TABLE stage_trafos_cau12(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau1 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/65d3c612-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau12 select f.* from stage_trafos_cau1, jsonb_populate_recordset(null::stage_trafos_cau12, x) f;
UPDATE stage_trafos_cau12 SET cau = 'cau1fv';
UPDATE stage_trafos_cau12 SET id = 'A14';
UPDATE stage_trafos_cau12 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau1fv SELECT * from stage_trafos_cau12 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau1;
DROP TABLE IF EXISTS stage_trafos_cau12;

CREATE TEMP TABLE stage_trafos_cau1(x jsonb);
CREATE TEMP TABLE stage_trafos_cau12(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau1 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/66363d74-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau12 select f.* from stage_trafos_cau1, jsonb_populate_recordset(null::stage_trafos_cau12, x) f;
UPDATE stage_trafos_cau12 SET cau = 'cau1fv';
UPDATE stage_trafos_cau12 SET id = 'A15';
UPDATE stage_trafos_cau12 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau1fv SELECT * from stage_trafos_cau12 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau1;
DROP TABLE IF EXISTS stage_trafos_cau12;

CREATE TEMP TABLE stage_trafos_cau1(x jsonb);
CREATE TEMP TABLE stage_trafos_cau12(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau1 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/6699229a-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau12 select f.* from stage_trafos_cau1, jsonb_populate_recordset(null::stage_trafos_cau12, x) f;
UPDATE stage_trafos_cau12 SET cau = 'cau1fv';
UPDATE stage_trafos_cau12 SET id = 'A16';
UPDATE stage_trafos_cau12 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau1fv SELECT * from stage_trafos_cau12 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau1;
DROP TABLE IF EXISTS stage_trafos_cau12;

CREATE TEMP TABLE stage_trafos_cau1(x jsonb);
CREATE TEMP TABLE stage_trafos_cau12(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau1 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/66fcf90a-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau12 select f.* from stage_trafos_cau1, jsonb_populate_recordset(null::stage_trafos_cau12, x) f;
UPDATE stage_trafos_cau12 SET cau = 'cau1fv';
UPDATE stage_trafos_cau12 SET id = 'A17';
UPDATE stage_trafos_cau12 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau1fv SELECT * from stage_trafos_cau12 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau1;
DROP TABLE IF EXISTS stage_trafos_cau12;

CREATE TEMP TABLE stage_trafos_cau1(x jsonb);
CREATE TEMP TABLE stage_trafos_cau12(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau1 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/675d9436-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau12 select f.* from stage_trafos_cau1, jsonb_populate_recordset(null::stage_trafos_cau12, x) f;
UPDATE stage_trafos_cau12 SET cau = 'cau1fv';
UPDATE stage_trafos_cau12 SET id = 'A18';
UPDATE stage_trafos_cau12 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau1fv SELECT * from stage_trafos_cau12 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau1;
DROP TABLE IF EXISTS stage_trafos_cau12;

CREATE TEMP TABLE stage_trafos_cau1(x jsonb);
CREATE TEMP TABLE stage_trafos_cau12(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau1 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/67c1c096-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau12 select f.* from stage_trafos_cau1, jsonb_populate_recordset(null::stage_trafos_cau12, x) f;
UPDATE stage_trafos_cau12 SET cau = 'cau1fv';
UPDATE stage_trafos_cau12 SET id = 'A19';
UPDATE stage_trafos_cau12 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau1fv SELECT * from stage_trafos_cau12 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau1;
DROP TABLE IF EXISTS stage_trafos_cau12;

CREATE TEMP TABLE stage_trafos_cau1(x jsonb);
CREATE TEMP TABLE stage_trafos_cau12(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau1 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/6827407e-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau12 select f.* from stage_trafos_cau1, jsonb_populate_recordset(null::stage_trafos_cau12, x) f;
UPDATE stage_trafos_cau12 SET cau = 'cau1fv';
UPDATE stage_trafos_cau12 SET id = 'A20';
UPDATE stage_trafos_cau12 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau1fv SELECT * from stage_trafos_cau12 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau1;
DROP TABLE IF EXISTS stage_trafos_cau12;

CREATE TEMP TABLE stage_trafos_cau1(x jsonb);
CREATE TEMP TABLE stage_trafos_cau12(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau1 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/688b7c38-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau12 select f.* from stage_trafos_cau1, jsonb_populate_recordset(null::stage_trafos_cau12, x) f;
UPDATE stage_trafos_cau12 SET cau = 'cau1fv';
UPDATE stage_trafos_cau12 SET id = 'A21';
UPDATE stage_trafos_cau12 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau1fv SELECT * from stage_trafos_cau12 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau1;
DROP TABLE IF EXISTS stage_trafos_cau12;

CREATE TEMP TABLE stage_trafos_cau1(x jsonb);
CREATE TEMP TABLE stage_trafos_cau12(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau1 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/68edc4ce-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau12 select f.* from stage_trafos_cau1, jsonb_populate_recordset(null::stage_trafos_cau12, x) f;
UPDATE stage_trafos_cau12 SET cau = 'cau1fv';
UPDATE stage_trafos_cau12 SET id = 'A22';
UPDATE stage_trafos_cau12 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau1fv SELECT * from stage_trafos_cau12 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau1;
DROP TABLE IF EXISTS stage_trafos_cau12;

CREATE TEMP TABLE stage_trafos_cau1(x jsonb);
CREATE TEMP TABLE stage_trafos_cau12(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau1 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/694f19ea-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau12 select f.* from stage_trafos_cau1, jsonb_populate_recordset(null::stage_trafos_cau12, x) f;
UPDATE stage_trafos_cau12 SET cau = 'cau1fv';
UPDATE stage_trafos_cau12 SET id = 'A23';
UPDATE stage_trafos_cau12 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau1fv SELECT * from stage_trafos_cau12 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau1;
DROP TABLE IF EXISTS stage_trafos_cau12;

CREATE TEMP TABLE stage_trafos_cau1(x jsonb);
CREATE TEMP TABLE stage_trafos_cau12(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau1 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/69b0a2a0-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau12 select f.* from stage_trafos_cau1, jsonb_populate_recordset(null::stage_trafos_cau12, x) f;
UPDATE stage_trafos_cau12 SET cau = 'cau1fv';
UPDATE stage_trafos_cau12 SET id = 'A24';
UPDATE stage_trafos_cau12 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau1fv SELECT * from stage_trafos_cau12 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau1;
DROP TABLE IF EXISTS stage_trafos_cau12;

CREATE TEMP TABLE stage_trafos_cau1(x jsonb);
CREATE TEMP TABLE stage_trafos_cau12(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau1 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/6a144a94-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau12 select f.* from stage_trafos_cau1, jsonb_populate_recordset(null::stage_trafos_cau12, x) f;
UPDATE stage_trafos_cau12 SET cau = 'cau1fv';
UPDATE stage_trafos_cau12 SET id = 'A25';
UPDATE stage_trafos_cau12 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau1fv SELECT * from stage_trafos_cau12 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau1;
DROP TABLE IF EXISTS stage_trafos_cau12;

CREATE TEMP TABLE stage_trafos_cau1(x jsonb);
CREATE TEMP TABLE stage_trafos_cau12(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau1 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/6a7748a6-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau12 select f.* from stage_trafos_cau1, jsonb_populate_recordset(null::stage_trafos_cau12, x) f;
UPDATE stage_trafos_cau12 SET cau = 'cau1fv';
UPDATE stage_trafos_cau12 SET id = 'A26';
UPDATE stage_trafos_cau12 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau1fv SELECT * from stage_trafos_cau12 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau1;
DROP TABLE IF EXISTS stage_trafos_cau12;

CREATE TEMP TABLE stage_trafos_cau1(x jsonb);
CREATE TEMP TABLE stage_trafos_cau12(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau1 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/6ade1cf2-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau12 select f.* from stage_trafos_cau1, jsonb_populate_recordset(null::stage_trafos_cau12, x) f;
UPDATE stage_trafos_cau12 SET cau = 'cau1fv';
UPDATE stage_trafos_cau12 SET id = 'A27';
UPDATE stage_trafos_cau12 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau1fv SELECT * from stage_trafos_cau12 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau1;
DROP TABLE IF EXISTS stage_trafos_cau12;

CREATE TEMP TABLE stage_trafos_cau1(x jsonb);
CREATE TEMP TABLE stage_trafos_cau12(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau1 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/6b4097b0-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau12 select f.* from stage_trafos_cau1, jsonb_populate_recordset(null::stage_trafos_cau12, x) f;
UPDATE stage_trafos_cau12 SET cau = 'cau1fv';
UPDATE stage_trafos_cau12 SET id = 'A28';
UPDATE stage_trafos_cau12 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau1fv SELECT * from stage_trafos_cau12 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau1;
DROP TABLE IF EXISTS stage_trafos_cau12;

CREATE TEMP TABLE stage_trafos_cau1(x jsonb);
CREATE TEMP TABLE stage_trafos_cau12(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau1 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/6ba3bd40-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau12 select f.* from stage_trafos_cau1, jsonb_populate_recordset(null::stage_trafos_cau12, x) f;
UPDATE stage_trafos_cau12 SET cau = 'cau1fv';
UPDATE stage_trafos_cau12 SET id = 'A29';
UPDATE stage_trafos_cau12 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau1fv SELECT * from stage_trafos_cau12 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau1;
DROP TABLE IF EXISTS stage_trafos_cau12;

CREATE TEMP TABLE stage_trafos_cau1(x jsonb);
CREATE TEMP TABLE stage_trafos_cau12(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau1 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/6c06caac-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau12 select f.* from stage_trafos_cau1, jsonb_populate_recordset(null::stage_trafos_cau12, x) f;
UPDATE stage_trafos_cau12 SET cau = 'cau1fv';
UPDATE stage_trafos_cau12 SET id = 'A30';
UPDATE stage_trafos_cau12 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau1fv SELECT * from stage_trafos_cau12 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau1;
DROP TABLE IF EXISTS stage_trafos_cau12;

CREATE TEMP TABLE stage_trafos_cau1(x jsonb);
CREATE TEMP TABLE stage_trafos_cau12(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau1 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/6c66dc08-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau12 select f.* from stage_trafos_cau1, jsonb_populate_recordset(null::stage_trafos_cau12, x) f;
UPDATE stage_trafos_cau12 SET cau = 'cau1fv';
UPDATE stage_trafos_cau12 SET id = 'A31';
UPDATE stage_trafos_cau12 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau1fv SELECT * from stage_trafos_cau12 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau1;
DROP TABLE IF EXISTS stage_trafos_cau12;

CREATE TEMP TABLE stage_trafos_cau1(x jsonb);
CREATE TEMP TABLE stage_trafos_cau12(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau1 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/6ccc015a-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau12 select f.* from stage_trafos_cau1, jsonb_populate_recordset(null::stage_trafos_cau12, x) f;
UPDATE stage_trafos_cau12 SET cau = 'cau1fv';
UPDATE stage_trafos_cau12 SET id = 'A32';
UPDATE stage_trafos_cau12 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau1fv SELECT * from stage_trafos_cau12 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau1;
DROP TABLE IF EXISTS stage_trafos_cau12;

CREATE TEMP TABLE stage_trafos_cau1(x jsonb);
CREATE TEMP TABLE stage_trafos_cau12(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau1 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/6d317f3a-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau12 select f.* from stage_trafos_cau1, jsonb_populate_recordset(null::stage_trafos_cau12, x) f;
UPDATE stage_trafos_cau12 SET cau = 'cau1fv';
UPDATE stage_trafos_cau12 SET id = 'A33';
UPDATE stage_trafos_cau12 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau1fv SELECT * from stage_trafos_cau12 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau1;
DROP TABLE IF EXISTS stage_trafos_cau12;

CREATE TEMP TABLE stage_trafos_cau1(x jsonb);
CREATE TEMP TABLE stage_trafos_cau12(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau1 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/6d94d90e-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau12 select f.* from stage_trafos_cau1, jsonb_populate_recordset(null::stage_trafos_cau12, x) f;
UPDATE stage_trafos_cau12 SET cau = 'cau1fv';
UPDATE stage_trafos_cau12 SET id = 'A34';
UPDATE stage_trafos_cau12 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau1fv SELECT * from stage_trafos_cau12 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau1;
DROP TABLE IF EXISTS stage_trafos_cau12;

CREATE TEMP TABLE stage_trafos_cau1(x jsonb);
CREATE TEMP TABLE stage_trafos_cau12(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau1 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/6dfa0b12-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau12 select f.* from stage_trafos_cau1, jsonb_populate_recordset(null::stage_trafos_cau12, x) f;
UPDATE stage_trafos_cau12 SET cau = 'cau1fv';
UPDATE stage_trafos_cau12 SET id = 'A35';
UPDATE stage_trafos_cau12 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau1fv SELECT * from stage_trafos_cau12 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau1;
DROP TABLE IF EXISTS stage_trafos_cau12;

---------------------------------------------------------------------------------

DELETE FROM caupotenciatrafos_cau2fv WHERE date >= now() - interval '15 days';
DROP TABLE IF EXISTS stage_trafos_cau2;
DROP TABLE IF EXISTS stage_trafos_cau22;

CREATE TEMP TABLE stage_trafos_cau2(x jsonb);
CREATE TEMP TABLE stage_trafos_cau22(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau2 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/c4295d06-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau22 select f.* from stage_trafos_cau2, jsonb_populate_recordset(null::stage_trafos_cau22, x) f;
UPDATE stage_trafos_cau22 SET cau = 'cau2fv';
UPDATE stage_trafos_cau22 SET id = 'B01';
UPDATE stage_trafos_cau22 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau2fv SELECT * from stage_trafos_cau22 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau2;
DROP TABLE IF EXISTS stage_trafos_cau22;

CREATE TEMP TABLE stage_trafos_cau2(x jsonb);
CREATE TEMP TABLE stage_trafos_cau22(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau2 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/c4884bcc-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau22 select f.* from stage_trafos_cau2, jsonb_populate_recordset(null::stage_trafos_cau22, x) f;
UPDATE stage_trafos_cau22 SET cau = 'cau2fv';
UPDATE stage_trafos_cau22 SET id = 'B02';
UPDATE stage_trafos_cau22 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau2fv SELECT * from stage_trafos_cau22 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau2;
DROP TABLE IF EXISTS stage_trafos_cau22;

CREATE TEMP TABLE stage_trafos_cau2(x jsonb);
CREATE TEMP TABLE stage_trafos_cau22(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau2 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/c4fa5f82-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau22 select f.* from stage_trafos_cau2, jsonb_populate_recordset(null::stage_trafos_cau22, x) f;
UPDATE stage_trafos_cau22 SET cau = 'cau2fv';
UPDATE stage_trafos_cau22 SET id = 'B03';
UPDATE stage_trafos_cau22 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau2fv SELECT * from stage_trafos_cau22 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau2;
DROP TABLE IF EXISTS stage_trafos_cau22;

CREATE TEMP TABLE stage_trafos_cau2(x jsonb);
CREATE TEMP TABLE stage_trafos_cau22(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau2 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/c57308c4-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau22 select f.* from stage_trafos_cau2, jsonb_populate_recordset(null::stage_trafos_cau22, x) f;
UPDATE stage_trafos_cau22 SET cau = 'cau2fv';
UPDATE stage_trafos_cau22 SET id = 'B04';
UPDATE stage_trafos_cau22 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau2fv SELECT * from stage_trafos_cau22 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau2;
DROP TABLE IF EXISTS stage_trafos_cau22;

CREATE TEMP TABLE stage_trafos_cau2(x jsonb);
CREATE TEMP TABLE stage_trafos_cau22(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau2 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/c5d18660-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau22 select f.* from stage_trafos_cau2, jsonb_populate_recordset(null::stage_trafos_cau22, x) f;
UPDATE stage_trafos_cau22 SET cau = 'cau2fv';
UPDATE stage_trafos_cau22 SET id = 'B05';
UPDATE stage_trafos_cau22 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau2fv SELECT * from stage_trafos_cau22 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau2;
DROP TABLE IF EXISTS stage_trafos_cau22;

CREATE TEMP TABLE stage_trafos_cau2(x jsonb);
CREATE TEMP TABLE stage_trafos_cau22(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau2 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/c6303dc2-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau22 select f.* from stage_trafos_cau2, jsonb_populate_recordset(null::stage_trafos_cau22, x) f;
UPDATE stage_trafos_cau22 SET cau = 'cau2fv';
UPDATE stage_trafos_cau22 SET id = 'B06';
UPDATE stage_trafos_cau22 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau2fv SELECT * from stage_trafos_cau22 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau2;
DROP TABLE IF EXISTS stage_trafos_cau22;

CREATE TEMP TABLE stage_trafos_cau2(x jsonb);
CREATE TEMP TABLE stage_trafos_cau22(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau2 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/c6903ede-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau22 select f.* from stage_trafos_cau2, jsonb_populate_recordset(null::stage_trafos_cau22, x) f;
UPDATE stage_trafos_cau22 SET cau = 'cau2fv';
UPDATE stage_trafos_cau22 SET id = 'B07';
UPDATE stage_trafos_cau22 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau2fv SELECT * from stage_trafos_cau22 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau2;
DROP TABLE IF EXISTS stage_trafos_cau22;

CREATE TEMP TABLE stage_trafos_cau2(x jsonb);
CREATE TEMP TABLE stage_trafos_cau22(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau2 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/c6ed3972-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau22 select f.* from stage_trafos_cau2, jsonb_populate_recordset(null::stage_trafos_cau22, x) f;
UPDATE stage_trafos_cau22 SET cau = 'cau2fv';
UPDATE stage_trafos_cau22 SET id = 'B08';
UPDATE stage_trafos_cau22 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau2fv SELECT * from stage_trafos_cau22 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau2;
DROP TABLE IF EXISTS stage_trafos_cau22;

CREATE TEMP TABLE stage_trafos_cau2(x jsonb);
CREATE TEMP TABLE stage_trafos_cau22(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau2 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/c74dcec2-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau22 select f.* from stage_trafos_cau2, jsonb_populate_recordset(null::stage_trafos_cau22, x) f;
UPDATE stage_trafos_cau22 SET cau = 'cau2fv';
UPDATE stage_trafos_cau22 SET id = 'B09';
UPDATE stage_trafos_cau22 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau2fv SELECT * from stage_trafos_cau22 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau2;
DROP TABLE IF EXISTS stage_trafos_cau22;

CREATE TEMP TABLE stage_trafos_cau2(x jsonb);
CREATE TEMP TABLE stage_trafos_cau22(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau2 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/c7abad76-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau22 select f.* from stage_trafos_cau2, jsonb_populate_recordset(null::stage_trafos_cau22, x) f;
UPDATE stage_trafos_cau22 SET cau = 'cau2fv';
UPDATE stage_trafos_cau22 SET id = 'B10';
UPDATE stage_trafos_cau22 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau2fv SELECT * from stage_trafos_cau22 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau2;
DROP TABLE IF EXISTS stage_trafos_cau22;

CREATE TEMP TABLE stage_trafos_cau2(x jsonb);
CREATE TEMP TABLE stage_trafos_cau22(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau2 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/c809f250-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau22 select f.* from stage_trafos_cau2, jsonb_populate_recordset(null::stage_trafos_cau22, x) f;
UPDATE stage_trafos_cau22 SET cau = 'cau2fv';
UPDATE stage_trafos_cau22 SET id = 'B11';
UPDATE stage_trafos_cau22 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau2fv SELECT * from stage_trafos_cau22 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau2;
DROP TABLE IF EXISTS stage_trafos_cau22;

CREATE TEMP TABLE stage_trafos_cau2(x jsonb);
CREATE TEMP TABLE stage_trafos_cau22(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau2 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/c867cad8-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau22 select f.* from stage_trafos_cau2, jsonb_populate_recordset(null::stage_trafos_cau22, x) f;
UPDATE stage_trafos_cau22 SET cau = 'cau2fv';
UPDATE stage_trafos_cau22 SET id = 'B12';
UPDATE stage_trafos_cau22 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau2fv SELECT * from stage_trafos_cau22 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau2;
DROP TABLE IF EXISTS stage_trafos_cau22;

CREATE TEMP TABLE stage_trafos_cau2(x jsonb);
CREATE TEMP TABLE stage_trafos_cau22(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau2 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/c8ca6fb2-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau22 select f.* from stage_trafos_cau2, jsonb_populate_recordset(null::stage_trafos_cau22, x) f;
UPDATE stage_trafos_cau22 SET cau = 'cau2fv';
UPDATE stage_trafos_cau22 SET id = 'B13';
UPDATE stage_trafos_cau22 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau2fv SELECT * from stage_trafos_cau22 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau2;
DROP TABLE IF EXISTS stage_trafos_cau22;

CREATE TEMP TABLE stage_trafos_cau2(x jsonb);
CREATE TEMP TABLE stage_trafos_cau22(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau2 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/c9287882-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau22 select f.* from stage_trafos_cau2, jsonb_populate_recordset(null::stage_trafos_cau22, x) f;
UPDATE stage_trafos_cau22 SET cau = 'cau2fv';
UPDATE stage_trafos_cau22 SET id = 'B14';
UPDATE stage_trafos_cau22 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau2fv SELECT * from stage_trafos_cau22 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau2;
DROP TABLE IF EXISTS stage_trafos_cau22;

CREATE TEMP TABLE stage_trafos_cau2(x jsonb);
CREATE TEMP TABLE stage_trafos_cau22(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau2 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/c98b6834-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau22 select f.* from stage_trafos_cau2, jsonb_populate_recordset(null::stage_trafos_cau22, x) f;
UPDATE stage_trafos_cau22 SET cau = 'cau2fv';
UPDATE stage_trafos_cau22 SET id = 'B15';
UPDATE stage_trafos_cau22 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau2fv SELECT * from stage_trafos_cau22 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau2;
DROP TABLE IF EXISTS stage_trafos_cau22;

CREATE TEMP TABLE stage_trafos_cau2(x jsonb);
CREATE TEMP TABLE stage_trafos_cau22(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau2 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/c9ed3140-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau22 select f.* from stage_trafos_cau2, jsonb_populate_recordset(null::stage_trafos_cau22, x) f;
UPDATE stage_trafos_cau22 SET cau = 'cau2fv';
UPDATE stage_trafos_cau22 SET id = 'B16';
UPDATE stage_trafos_cau22 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau2fv SELECT * from stage_trafos_cau22 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau2;
DROP TABLE IF EXISTS stage_trafos_cau22;

CREATE TEMP TABLE stage_trafos_cau2(x jsonb);
CREATE TEMP TABLE stage_trafos_cau22(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau2 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/ca4f887c-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau22 select f.* from stage_trafos_cau2, jsonb_populate_recordset(null::stage_trafos_cau22, x) f;
UPDATE stage_trafos_cau22 SET cau = 'cau2fv';
UPDATE stage_trafos_cau22 SET id = 'B17';
UPDATE stage_trafos_cau22 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau2fv SELECT * from stage_trafos_cau22 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau2;
DROP TABLE IF EXISTS stage_trafos_cau22;

CREATE TEMP TABLE stage_trafos_cau2(x jsonb);
CREATE TEMP TABLE stage_trafos_cau22(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau2 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/cac17a4a-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau22 select f.* from stage_trafos_cau2, jsonb_populate_recordset(null::stage_trafos_cau22, x) f;
UPDATE stage_trafos_cau22 SET cau = 'cau2fv';
UPDATE stage_trafos_cau22 SET id = 'B18';
UPDATE stage_trafos_cau22 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau2fv SELECT * from stage_trafos_cau22 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau2;
DROP TABLE IF EXISTS stage_trafos_cau22;

CREATE TEMP TABLE stage_trafos_cau2(x jsonb);
CREATE TEMP TABLE stage_trafos_cau22(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau2 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/cb2791ae-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau22 select f.* from stage_trafos_cau2, jsonb_populate_recordset(null::stage_trafos_cau22, x) f;
UPDATE stage_trafos_cau22 SET cau = 'cau2fv';
UPDATE stage_trafos_cau22 SET id = 'B19';
UPDATE stage_trafos_cau22 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau2fv SELECT * from stage_trafos_cau22 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau2;
DROP TABLE IF EXISTS stage_trafos_cau22;

CREATE TEMP TABLE stage_trafos_cau2(x jsonb);
CREATE TEMP TABLE stage_trafos_cau22(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau2 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/cb888004-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau22 select f.* from stage_trafos_cau2, jsonb_populate_recordset(null::stage_trafos_cau22, x) f;
UPDATE stage_trafos_cau22 SET cau = 'cau2fv';
UPDATE stage_trafos_cau22 SET id = 'B20';
UPDATE stage_trafos_cau22 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau2fv SELECT * from stage_trafos_cau22 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau2;
DROP TABLE IF EXISTS stage_trafos_cau22;

CREATE TEMP TABLE stage_trafos_cau2(x jsonb);
CREATE TEMP TABLE stage_trafos_cau22(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau2 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/cbf4d970-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau22 select f.* from stage_trafos_cau2, jsonb_populate_recordset(null::stage_trafos_cau22, x) f;
UPDATE stage_trafos_cau22 SET cau = 'cau2fv';
UPDATE stage_trafos_cau22 SET id = 'B21';
UPDATE stage_trafos_cau22 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau2fv SELECT * from stage_trafos_cau22 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau2;
DROP TABLE IF EXISTS stage_trafos_cau22;

CREATE TEMP TABLE stage_trafos_cau2(x jsonb);
CREATE TEMP TABLE stage_trafos_cau22(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau2 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/cc5939c4-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau22 select f.* from stage_trafos_cau2, jsonb_populate_recordset(null::stage_trafos_cau22, x) f;
UPDATE stage_trafos_cau22 SET cau = 'cau2fv';
UPDATE stage_trafos_cau22 SET id = 'B22';
UPDATE stage_trafos_cau22 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau2fv SELECT * from stage_trafos_cau22 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau2;
DROP TABLE IF EXISTS stage_trafos_cau22;

CREATE TEMP TABLE stage_trafos_cau2(x jsonb);
CREATE TEMP TABLE stage_trafos_cau22(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau2 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/ccbbda0c-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau22 select f.* from stage_trafos_cau2, jsonb_populate_recordset(null::stage_trafos_cau22, x) f;
UPDATE stage_trafos_cau22 SET cau = 'cau2fv';
UPDATE stage_trafos_cau22 SET id = 'B23';
UPDATE stage_trafos_cau22 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau2fv SELECT * from stage_trafos_cau22 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau2;
DROP TABLE IF EXISTS stage_trafos_cau22;

CREATE TEMP TABLE stage_trafos_cau2(x jsonb);
CREATE TEMP TABLE stage_trafos_cau22(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau2 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/cd1fd232-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau22 select f.* from stage_trafos_cau2, jsonb_populate_recordset(null::stage_trafos_cau22, x) f;
UPDATE stage_trafos_cau22 SET cau = 'cau2fv';
UPDATE stage_trafos_cau22 SET id = 'B24';
UPDATE stage_trafos_cau22 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau2fv SELECT * from stage_trafos_cau22 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau2;
DROP TABLE IF EXISTS stage_trafos_cau22;

CREATE TEMP TABLE stage_trafos_cau2(x jsonb);
CREATE TEMP TABLE stage_trafos_cau22(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau2 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/cd82c9c8-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau22 select f.* from stage_trafos_cau2, jsonb_populate_recordset(null::stage_trafos_cau22, x) f;
UPDATE stage_trafos_cau22 SET cau = 'cau2fv';
UPDATE stage_trafos_cau22 SET id = 'B25';
UPDATE stage_trafos_cau22 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau2fv SELECT * from stage_trafos_cau22 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau2;
DROP TABLE IF EXISTS stage_trafos_cau22;

CREATE TEMP TABLE stage_trafos_cau2(x jsonb);
CREATE TEMP TABLE stage_trafos_cau22(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau2 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/cde9ec66-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau22 select f.* from stage_trafos_cau2, jsonb_populate_recordset(null::stage_trafos_cau22, x) f;
UPDATE stage_trafos_cau22 SET cau = 'cau2fv';
UPDATE stage_trafos_cau22 SET id = 'B26';
UPDATE stage_trafos_cau22 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau2fv SELECT * from stage_trafos_cau22 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau2;
DROP TABLE IF EXISTS stage_trafos_cau22;

CREATE TEMP TABLE stage_trafos_cau2(x jsonb);
CREATE TEMP TABLE stage_trafos_cau22(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau2 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/ce4e1876-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau22 select f.* from stage_trafos_cau2, jsonb_populate_recordset(null::stage_trafos_cau22, x) f;
UPDATE stage_trafos_cau22 SET cau = 'cau2fv';
UPDATE stage_trafos_cau22 SET id = 'B27';
UPDATE stage_trafos_cau22 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau2fv SELECT * from stage_trafos_cau22 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau2;
DROP TABLE IF EXISTS stage_trafos_cau22;

CREATE TEMP TABLE stage_trafos_cau2(x jsonb);
CREATE TEMP TABLE stage_trafos_cau22(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau2 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/ceb1801e-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau22 select f.* from stage_trafos_cau2, jsonb_populate_recordset(null::stage_trafos_cau22, x) f;
UPDATE stage_trafos_cau22 SET cau = 'cau2fv';
UPDATE stage_trafos_cau22 SET id = 'B28';
UPDATE stage_trafos_cau22 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau2fv SELECT * from stage_trafos_cau22 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau2;
DROP TABLE IF EXISTS stage_trafos_cau22;

CREATE TEMP TABLE stage_trafos_cau2(x jsonb);
CREATE TEMP TABLE stage_trafos_cau22(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau2 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/cf18ce18-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau22 select f.* from stage_trafos_cau2, jsonb_populate_recordset(null::stage_trafos_cau22, x) f;
UPDATE stage_trafos_cau22 SET cau = 'cau2fv';
UPDATE stage_trafos_cau22 SET id = 'B29';
UPDATE stage_trafos_cau22 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau2fv SELECT * from stage_trafos_cau22 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau2;
DROP TABLE IF EXISTS stage_trafos_cau22;

CREATE TEMP TABLE stage_trafos_cau2(x jsonb);
CREATE TEMP TABLE stage_trafos_cau22(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau2 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/cf786d14-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau22 select f.* from stage_trafos_cau2, jsonb_populate_recordset(null::stage_trafos_cau22, x) f;
UPDATE stage_trafos_cau22 SET cau = 'cau2fv';
UPDATE stage_trafos_cau22 SET id = 'B30';
UPDATE stage_trafos_cau22 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau2fv SELECT * from stage_trafos_cau22 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau2;
DROP TABLE IF EXISTS stage_trafos_cau22;

CREATE TEMP TABLE stage_trafos_cau2(x jsonb);
CREATE TEMP TABLE stage_trafos_cau22(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau2 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/cfdae2f0-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau22 select f.* from stage_trafos_cau2, jsonb_populate_recordset(null::stage_trafos_cau22, x) f;
UPDATE stage_trafos_cau22 SET cau = 'cau2fv';
UPDATE stage_trafos_cau22 SET id = 'B31';
UPDATE stage_trafos_cau22 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau2fv SELECT * from stage_trafos_cau22 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau2;
DROP TABLE IF EXISTS stage_trafos_cau22;

CREATE TEMP TABLE stage_trafos_cau2(x jsonb);
CREATE TEMP TABLE stage_trafos_cau22(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau2 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/d03e9886-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau22 select f.* from stage_trafos_cau2, jsonb_populate_recordset(null::stage_trafos_cau22, x) f;
UPDATE stage_trafos_cau22 SET cau = 'cau2fv';
UPDATE stage_trafos_cau22 SET id = 'B32';
UPDATE stage_trafos_cau22 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau2fv SELECT * from stage_trafos_cau22 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau2;
DROP TABLE IF EXISTS stage_trafos_cau22;

CREATE TEMP TABLE stage_trafos_cau2(x jsonb);
CREATE TEMP TABLE stage_trafos_cau22(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau2 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/d0a16ff6-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau22 select f.* from stage_trafos_cau2, jsonb_populate_recordset(null::stage_trafos_cau22, x) f;
UPDATE stage_trafos_cau22 SET cau = 'cau2fv';
UPDATE stage_trafos_cau22 SET id = 'B33';
UPDATE stage_trafos_cau22 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau2fv SELECT * from stage_trafos_cau22 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau2;
DROP TABLE IF EXISTS stage_trafos_cau22;

CREATE TEMP TABLE stage_trafos_cau2(x jsonb);
CREATE TEMP TABLE stage_trafos_cau22(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau2 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/d102e8f8-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau22 select f.* from stage_trafos_cau2, jsonb_populate_recordset(null::stage_trafos_cau22, x) f;
UPDATE stage_trafos_cau22 SET cau = 'cau2fv';
UPDATE stage_trafos_cau22 SET id = 'B34';
UPDATE stage_trafos_cau22 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau2fv SELECT * from stage_trafos_cau22 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau2;
DROP TABLE IF EXISTS stage_trafos_cau22;

CREATE TEMP TABLE stage_trafos_cau2(x jsonb);
CREATE TEMP TABLE stage_trafos_cau22(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau2 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/d1665f8c-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau22 select f.* from stage_trafos_cau2, jsonb_populate_recordset(null::stage_trafos_cau22, x) f;
UPDATE stage_trafos_cau22 SET cau = 'cau2fv';
UPDATE stage_trafos_cau22 SET id = 'B35';
UPDATE stage_trafos_cau22 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau2fv SELECT * from stage_trafos_cau22 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau2;
DROP TABLE IF EXISTS stage_trafos_cau22;

---------------------------------------------------------------------------------

DELETE FROM caupotenciatrafos_cau3fv WHERE date >= now() - interval '15 days';
DROP TABLE IF EXISTS stage_trafos_cau3;
DROP TABLE IF EXISTS stage_trafos_cau32;

CREATE TEMP TABLE stage_trafos_cau3(x jsonb);
CREATE TEMP TABLE stage_trafos_cau32(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau3 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/1952bcd2-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau32 select f.* from stage_trafos_cau3, jsonb_populate_recordset(null::stage_trafos_cau32, x) f;
UPDATE stage_trafos_cau32 SET cau = 'cau3fv';
UPDATE stage_trafos_cau32 SET id = 'C01';
UPDATE stage_trafos_cau32 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau3fv SELECT * from stage_trafos_cau32 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau3;
DROP TABLE IF EXISTS stage_trafos_cau32;

CREATE TEMP TABLE stage_trafos_cau3(x jsonb);
CREATE TEMP TABLE stage_trafos_cau32(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau3 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/19b0bbac-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau32 select f.* from stage_trafos_cau3, jsonb_populate_recordset(null::stage_trafos_cau32, x) f;
UPDATE stage_trafos_cau32 SET cau = 'cau3fv';
UPDATE stage_trafos_cau32 SET id = 'C02';
UPDATE stage_trafos_cau32 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau3fv SELECT * from stage_trafos_cau32 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau3;
DROP TABLE IF EXISTS stage_trafos_cau32;

CREATE TEMP TABLE stage_trafos_cau3(x jsonb);
CREATE TEMP TABLE stage_trafos_cau32(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau3 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/1a0ffa2c-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau32 select f.* from stage_trafos_cau3, jsonb_populate_recordset(null::stage_trafos_cau32, x) f;
UPDATE stage_trafos_cau32 SET cau = 'cau3fv';
UPDATE stage_trafos_cau32 SET id = 'C03';
UPDATE stage_trafos_cau32 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau3fv SELECT * from stage_trafos_cau32 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau3;
DROP TABLE IF EXISTS stage_trafos_cau32;

CREATE TEMP TABLE stage_trafos_cau3(x jsonb);
CREATE TEMP TABLE stage_trafos_cau32(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau3 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/1a6ce9bc-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau32 select f.* from stage_trafos_cau3, jsonb_populate_recordset(null::stage_trafos_cau32, x) f;
UPDATE stage_trafos_cau32 SET cau = 'cau3fv';
UPDATE stage_trafos_cau32 SET id = 'C04';
UPDATE stage_trafos_cau32 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau3fv SELECT * from stage_trafos_cau32 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau3;
DROP TABLE IF EXISTS stage_trafos_cau32;

CREATE TEMP TABLE stage_trafos_cau3(x jsonb);
CREATE TEMP TABLE stage_trafos_cau32(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau3 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/1aca84b4-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau32 select f.* from stage_trafos_cau3, jsonb_populate_recordset(null::stage_trafos_cau32, x) f;
UPDATE stage_trafos_cau32 SET cau = 'cau3fv';
UPDATE stage_trafos_cau32 SET id = 'C05';
UPDATE stage_trafos_cau32 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau3fv SELECT * from stage_trafos_cau32 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau3;
DROP TABLE IF EXISTS stage_trafos_cau32;

CREATE TEMP TABLE stage_trafos_cau3(x jsonb);
CREATE TEMP TABLE stage_trafos_cau32(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau3 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/1b28e3b0-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau32 select f.* from stage_trafos_cau3, jsonb_populate_recordset(null::stage_trafos_cau32, x) f;
UPDATE stage_trafos_cau32 SET cau = 'cau3fv';
UPDATE stage_trafos_cau32 SET id = 'C06';
UPDATE stage_trafos_cau32 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau3fv SELECT * from stage_trafos_cau32 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau3;
DROP TABLE IF EXISTS stage_trafos_cau32;

CREATE TEMP TABLE stage_trafos_cau3(x jsonb);
CREATE TEMP TABLE stage_trafos_cau32(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau3 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/1b884fee-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau32 select f.* from stage_trafos_cau3, jsonb_populate_recordset(null::stage_trafos_cau32, x) f;
UPDATE stage_trafos_cau32 SET cau = 'cau3fv';
UPDATE stage_trafos_cau32 SET id = 'C07';
UPDATE stage_trafos_cau32 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau3fv SELECT * from stage_trafos_cau32 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau3;
DROP TABLE IF EXISTS stage_trafos_cau32;

CREATE TEMP TABLE stage_trafos_cau3(x jsonb);
CREATE TEMP TABLE stage_trafos_cau32(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau3 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/1be654e0-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau32 select f.* from stage_trafos_cau3, jsonb_populate_recordset(null::stage_trafos_cau32, x) f;
UPDATE stage_trafos_cau32 SET cau = 'cau3fv';
UPDATE stage_trafos_cau32 SET id = 'C08';
UPDATE stage_trafos_cau32 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau3fv SELECT * from stage_trafos_cau32 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau3;
DROP TABLE IF EXISTS stage_trafos_cau32;

CREATE TEMP TABLE stage_trafos_cau3(x jsonb);
CREATE TEMP TABLE stage_trafos_cau32(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau3 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/1c450f12-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau32 select f.* from stage_trafos_cau3, jsonb_populate_recordset(null::stage_trafos_cau32, x) f;
UPDATE stage_trafos_cau32 SET cau = 'cau3fv';
UPDATE stage_trafos_cau32 SET id = 'C09';
UPDATE stage_trafos_cau32 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau3fv SELECT * from stage_trafos_cau32 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau3;
DROP TABLE IF EXISTS stage_trafos_cau32;

CREATE TEMP TABLE stage_trafos_cau3(x jsonb);
CREATE TEMP TABLE stage_trafos_cau32(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau3 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/1ca1c2d4-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau32 select f.* from stage_trafos_cau3, jsonb_populate_recordset(null::stage_trafos_cau32, x) f;
UPDATE stage_trafos_cau32 SET cau = 'cau3fv';
UPDATE stage_trafos_cau32 SET id = 'C10';
UPDATE stage_trafos_cau32 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau3fv SELECT * from stage_trafos_cau32 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau3;
DROP TABLE IF EXISTS stage_trafos_cau32;

CREATE TEMP TABLE stage_trafos_cau3(x jsonb);
CREATE TEMP TABLE stage_trafos_cau32(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau3 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/1d00cd06-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau32 select f.* from stage_trafos_cau3, jsonb_populate_recordset(null::stage_trafos_cau32, x) f;
UPDATE stage_trafos_cau32 SET cau = 'cau3fv';
UPDATE stage_trafos_cau32 SET id = 'C11';
UPDATE stage_trafos_cau32 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau3fv SELECT * from stage_trafos_cau32 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau3;
DROP TABLE IF EXISTS stage_trafos_cau32;

CREATE TEMP TABLE stage_trafos_cau3(x jsonb);
CREATE TEMP TABLE stage_trafos_cau32(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau3 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/1d5fb078-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau32 select f.* from stage_trafos_cau3, jsonb_populate_recordset(null::stage_trafos_cau32, x) f;
UPDATE stage_trafos_cau32 SET cau = 'cau3fv';
UPDATE stage_trafos_cau32 SET id = 'C12';
UPDATE stage_trafos_cau32 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau3fv SELECT * from stage_trafos_cau32 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau3;
DROP TABLE IF EXISTS stage_trafos_cau32;

CREATE TEMP TABLE stage_trafos_cau3(x jsonb);
CREATE TEMP TABLE stage_trafos_cau32(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau3 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/1dc04e56-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau32 select f.* from stage_trafos_cau3, jsonb_populate_recordset(null::stage_trafos_cau32, x) f;
UPDATE stage_trafos_cau32 SET cau = 'cau3fv';
UPDATE stage_trafos_cau32 SET id = 'C13';
UPDATE stage_trafos_cau32 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau3fv SELECT * from stage_trafos_cau32 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau3;
DROP TABLE IF EXISTS stage_trafos_cau32;

CREATE TEMP TABLE stage_trafos_cau3(x jsonb);
CREATE TEMP TABLE stage_trafos_cau32(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau3 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/1e1e08b6-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau32 select f.* from stage_trafos_cau3, jsonb_populate_recordset(null::stage_trafos_cau32, x) f;
UPDATE stage_trafos_cau32 SET cau = 'cau3fv';
UPDATE stage_trafos_cau32 SET id = 'C14';
UPDATE stage_trafos_cau32 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau3fv SELECT * from stage_trafos_cau32 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau3;
DROP TABLE IF EXISTS stage_trafos_cau32;

CREATE TEMP TABLE stage_trafos_cau3(x jsonb);
CREATE TEMP TABLE stage_trafos_cau32(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau3 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/1e7b4936-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau32 select f.* from stage_trafos_cau3, jsonb_populate_recordset(null::stage_trafos_cau32, x) f;
UPDATE stage_trafos_cau32 SET cau = 'cau3fv';
UPDATE stage_trafos_cau32 SET id = 'C15';
UPDATE stage_trafos_cau32 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau3fv SELECT * from stage_trafos_cau32 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau3;
DROP TABLE IF EXISTS stage_trafos_cau32;

CREATE TEMP TABLE stage_trafos_cau3(x jsonb);
CREATE TEMP TABLE stage_trafos_cau32(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau3 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/1eda7d20-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau32 select f.* from stage_trafos_cau3, jsonb_populate_recordset(null::stage_trafos_cau32, x) f;
UPDATE stage_trafos_cau32 SET cau = 'cau3fv';
UPDATE stage_trafos_cau32 SET id = 'C16';
UPDATE stage_trafos_cau32 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau3fv SELECT * from stage_trafos_cau32 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau3;
DROP TABLE IF EXISTS stage_trafos_cau32;

CREATE TEMP TABLE stage_trafos_cau3(x jsonb);
CREATE TEMP TABLE stage_trafos_cau32(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau3 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/1f39537c-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau32 select f.* from stage_trafos_cau3, jsonb_populate_recordset(null::stage_trafos_cau32, x) f;
UPDATE stage_trafos_cau32 SET cau = 'cau3fv';
UPDATE stage_trafos_cau32 SET id = 'C17';
UPDATE stage_trafos_cau32 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau3fv SELECT * from stage_trafos_cau32 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau3;
DROP TABLE IF EXISTS stage_trafos_cau32;

CREATE TEMP TABLE stage_trafos_cau3(x jsonb);
CREATE TEMP TABLE stage_trafos_cau32(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau3 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/1f97a4e0-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau32 select f.* from stage_trafos_cau3, jsonb_populate_recordset(null::stage_trafos_cau32, x) f;
UPDATE stage_trafos_cau32 SET cau = 'cau3fv';
UPDATE stage_trafos_cau32 SET id = 'C18';
UPDATE stage_trafos_cau32 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau3fv SELECT * from stage_trafos_cau32 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau3;
DROP TABLE IF EXISTS stage_trafos_cau32;

CREATE TEMP TABLE stage_trafos_cau3(x jsonb);
CREATE TEMP TABLE stage_trafos_cau32(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau3 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/1ff75372-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau32 select f.* from stage_trafos_cau3, jsonb_populate_recordset(null::stage_trafos_cau32, x) f;
UPDATE stage_trafos_cau32 SET cau = 'cau3fv';
UPDATE stage_trafos_cau32 SET id = 'C19';
UPDATE stage_trafos_cau32 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau3fv SELECT * from stage_trafos_cau32 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau3;
DROP TABLE IF EXISTS stage_trafos_cau32;

CREATE TEMP TABLE stage_trafos_cau3(x jsonb);
CREATE TEMP TABLE stage_trafos_cau32(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau3 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/2054ce9e-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau32 select f.* from stage_trafos_cau3, jsonb_populate_recordset(null::stage_trafos_cau32, x) f;
UPDATE stage_trafos_cau32 SET cau = 'cau3fv';
UPDATE stage_trafos_cau32 SET id = 'C20';
UPDATE stage_trafos_cau32 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau3fv SELECT * from stage_trafos_cau32 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau3;
DROP TABLE IF EXISTS stage_trafos_cau32;

CREATE TEMP TABLE stage_trafos_cau3(x jsonb);
CREATE TEMP TABLE stage_trafos_cau32(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau3 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/20b33f9c-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau32 select f.* from stage_trafos_cau3, jsonb_populate_recordset(null::stage_trafos_cau32, x) f;
UPDATE stage_trafos_cau32 SET cau = 'cau3fv';
UPDATE stage_trafos_cau32 SET id = 'C21';
UPDATE stage_trafos_cau32 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau3fv SELECT * from stage_trafos_cau32 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau3;
DROP TABLE IF EXISTS stage_trafos_cau32;

CREATE TEMP TABLE stage_trafos_cau3(x jsonb);
CREATE TEMP TABLE stage_trafos_cau32(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau3 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/211066ea-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau32 select f.* from stage_trafos_cau3, jsonb_populate_recordset(null::stage_trafos_cau32, x) f;
UPDATE stage_trafos_cau32 SET cau = 'cau3fv';
UPDATE stage_trafos_cau32 SET id = 'C22';
UPDATE stage_trafos_cau32 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau3fv SELECT * from stage_trafos_cau32 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau3;
DROP TABLE IF EXISTS stage_trafos_cau32;

CREATE TEMP TABLE stage_trafos_cau3(x jsonb);
CREATE TEMP TABLE stage_trafos_cau32(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau3 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/217002ee-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau32 select f.* from stage_trafos_cau3, jsonb_populate_recordset(null::stage_trafos_cau32, x) f;
UPDATE stage_trafos_cau32 SET cau = 'cau3fv';
UPDATE stage_trafos_cau32 SET id = 'C23';
UPDATE stage_trafos_cau32 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau3fv SELECT * from stage_trafos_cau32 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau3;
DROP TABLE IF EXISTS stage_trafos_cau32;

CREATE TEMP TABLE stage_trafos_cau3(x jsonb);
CREATE TEMP TABLE stage_trafos_cau32(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau3 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/21ce8c42-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau32 select f.* from stage_trafos_cau3, jsonb_populate_recordset(null::stage_trafos_cau32, x) f;
UPDATE stage_trafos_cau32 SET cau = 'cau3fv';
UPDATE stage_trafos_cau32 SET id = 'C24';
UPDATE stage_trafos_cau32 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau3fv SELECT * from stage_trafos_cau32 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau3;
DROP TABLE IF EXISTS stage_trafos_cau32;

CREATE TEMP TABLE stage_trafos_cau3(x jsonb);
CREATE TEMP TABLE stage_trafos_cau32(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau3 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/222e954c-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau32 select f.* from stage_trafos_cau3, jsonb_populate_recordset(null::stage_trafos_cau32, x) f;
UPDATE stage_trafos_cau32 SET cau = 'cau3fv';
UPDATE stage_trafos_cau32 SET id = 'C25';
UPDATE stage_trafos_cau32 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau3fv SELECT * from stage_trafos_cau32 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau3;
DROP TABLE IF EXISTS stage_trafos_cau32;

CREATE TEMP TABLE stage_trafos_cau3(x jsonb);
CREATE TEMP TABLE stage_trafos_cau32(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau3 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/228ce61a-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau32 select f.* from stage_trafos_cau3, jsonb_populate_recordset(null::stage_trafos_cau32, x) f;
UPDATE stage_trafos_cau32 SET cau = 'cau3fv';
UPDATE stage_trafos_cau32 SET id = 'C26';
UPDATE stage_trafos_cau32 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau3fv SELECT * from stage_trafos_cau32 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau3;
DROP TABLE IF EXISTS stage_trafos_cau32;

CREATE TEMP TABLE stage_trafos_cau3(x jsonb);
CREATE TEMP TABLE stage_trafos_cau32(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau3 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/22ec5e56-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau32 select f.* from stage_trafos_cau3, jsonb_populate_recordset(null::stage_trafos_cau32, x) f;
UPDATE stage_trafos_cau32 SET cau = 'cau3fv';
UPDATE stage_trafos_cau32 SET id = 'C27';
UPDATE stage_trafos_cau32 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau3fv SELECT * from stage_trafos_cau32 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau3;
DROP TABLE IF EXISTS stage_trafos_cau32;

CREATE TEMP TABLE stage_trafos_cau3(x jsonb);
CREATE TEMP TABLE stage_trafos_cau32(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau3 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/234b6fe0-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau32 select f.* from stage_trafos_cau3, jsonb_populate_recordset(null::stage_trafos_cau32, x) f;
UPDATE stage_trafos_cau32 SET cau = 'cau3fv';
UPDATE stage_trafos_cau32 SET id = 'C28';
UPDATE stage_trafos_cau32 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau3fv SELECT * from stage_trafos_cau32 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau3;
DROP TABLE IF EXISTS stage_trafos_cau32;

CREATE TEMP TABLE stage_trafos_cau3(x jsonb);
CREATE TEMP TABLE stage_trafos_cau32(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau3 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/23a95b0a-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau32 select f.* from stage_trafos_cau3, jsonb_populate_recordset(null::stage_trafos_cau32, x) f;
UPDATE stage_trafos_cau32 SET cau = 'cau3fv';
UPDATE stage_trafos_cau32 SET id = 'C29';
UPDATE stage_trafos_cau32 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau3fv SELECT * from stage_trafos_cau32 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau3;
DROP TABLE IF EXISTS stage_trafos_cau32;

CREATE TEMP TABLE stage_trafos_cau3(x jsonb);
CREATE TEMP TABLE stage_trafos_cau32(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau3 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/25348f94-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau32 select f.* from stage_trafos_cau3, jsonb_populate_recordset(null::stage_trafos_cau32, x) f;
UPDATE stage_trafos_cau32 SET cau = 'cau3fv';
UPDATE stage_trafos_cau32 SET id = 'C30';
UPDATE stage_trafos_cau32 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau3fv SELECT * from stage_trafos_cau32 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau3;
DROP TABLE IF EXISTS stage_trafos_cau32;

CREATE TEMP TABLE stage_trafos_cau3(x jsonb);
CREATE TEMP TABLE stage_trafos_cau32(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau3 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/25955130-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau32 select f.* from stage_trafos_cau3, jsonb_populate_recordset(null::stage_trafos_cau32, x) f;
UPDATE stage_trafos_cau32 SET cau = 'cau3fv';
UPDATE stage_trafos_cau32 SET id = 'C31';
UPDATE stage_trafos_cau32 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau3fv SELECT * from stage_trafos_cau32 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau3;
DROP TABLE IF EXISTS stage_trafos_cau32;

CREATE TEMP TABLE stage_trafos_cau3(x jsonb);
CREATE TEMP TABLE stage_trafos_cau32(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau3 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/25f4a996-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau32 select f.* from stage_trafos_cau3, jsonb_populate_recordset(null::stage_trafos_cau32, x) f;
UPDATE stage_trafos_cau32 SET cau = 'cau3fv';
UPDATE stage_trafos_cau32 SET id = 'C32';
UPDATE stage_trafos_cau32 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau3fv SELECT * from stage_trafos_cau32 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau3;
DROP TABLE IF EXISTS stage_trafos_cau32;

CREATE TEMP TABLE stage_trafos_cau3(x jsonb);
CREATE TEMP TABLE stage_trafos_cau32(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau3 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/265581ee-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau32 select f.* from stage_trafos_cau3, jsonb_populate_recordset(null::stage_trafos_cau32, x) f;
UPDATE stage_trafos_cau32 SET cau = 'cau3fv';
UPDATE stage_trafos_cau32 SET id = 'C33';
UPDATE stage_trafos_cau32 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau3fv SELECT * from stage_trafos_cau32 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau3;
DROP TABLE IF EXISTS stage_trafos_cau32;

CREATE TEMP TABLE stage_trafos_cau3(x jsonb);
CREATE TEMP TABLE stage_trafos_cau32(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau3 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/26b2afd6-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau32 select f.* from stage_trafos_cau3, jsonb_populate_recordset(null::stage_trafos_cau32, x) f;
UPDATE stage_trafos_cau32 SET cau = 'cau3fv';
UPDATE stage_trafos_cau32 SET id = 'C34';
UPDATE stage_trafos_cau32 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau3fv SELECT * from stage_trafos_cau32 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau3;
DROP TABLE IF EXISTS stage_trafos_cau32;

CREATE TEMP TABLE stage_trafos_cau3(x jsonb);
CREATE TEMP TABLE stage_trafos_cau32(date timestamptz, val numeric, id text, cau text);
DO $$
DECLARE startdate text := to_char(current_date - 15, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
Begin 
EXECUTE format(
           'COPY stage_trafos_cau3 FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/2712e374-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
INSERT INTO stage_trafos_cau32 select f.* from stage_trafos_cau3, jsonb_populate_recordset(null::stage_trafos_cau32, x) f;
UPDATE stage_trafos_cau32 SET cau = 'cau3fv';
UPDATE stage_trafos_cau32 SET id = 'C35';
UPDATE stage_trafos_cau32 SET date = DATE_TRUNC('minute', date);
INSERT INTO caupotenciatrafos_cau3fv SELECT * from stage_trafos_cau32 WHERE date >= (now()::timestamptz - interval '15 days');
DROP TABLE IF EXISTS stage_trafos_cau3;
DROP TABLE IF EXISTS stage_trafos_cau32;

