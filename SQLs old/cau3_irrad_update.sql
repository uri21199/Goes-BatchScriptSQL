DROP TABLE IF EXISTS stagec;
DROP TABLE IF EXISTS stagec2;
DELETE FROM hiCAU3 WHERE date >= now() - interval '3 days';
DELETE FROM iiCAU3_ WHERE date >= now() - interval '3 days';

--------------------hiCAU3_WS_C08------------------------
CREATE TEMP TABLE stagec(x jsonb);
CREATE TEMP TABLE stagec2(date timestamptz, val numeric, id text);
Do $$ declare startdate text := to_char(current_date - 3, 'YYYYMMDD'); Begin EXECUTE format('COPY stagec FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/12e18dd8-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT INTO stagec2 select f.* from stagec, jsonb_populate_recordset(null::stagec2, x) f;
UPDATE stagec2 SET id = 'hiCAU3_WS_C08';
UPDATE stagec2 SET date = DATE_TRUNC('minute', date);
INSERT INTO hiCAU3 SELECT * from stagec2 WHERE date >= now() - interval '3 days';
DROP TABLE IF EXISTS stagec;
DROP TABLE IF EXISTS stagec2;

------------------------hiCAU3_WS_C11--------------------
CREATE TEMP TABLE stagec(x jsonb);
CREATE TEMP TABLE stagec2(date timestamptz, val numeric, id text);
Do $$ declare startdate text := to_char(current_date - 3, 'YYYYMMDD'); Begin EXECUTE format('COPY stagec FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/132016fc-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT INTO stagec2 select f.* from stagec, jsonb_populate_recordset(null::stagec2, x) f;
UPDATE stagec2 SET id = 'hiCAU3_WS_C11';
UPDATE stagec2 SET date = DATE_TRUNC('minute', date);
INSERT INTO hiCAU3 SELECT * from stagec2 WHERE date >= now() - interval '3 days';
DROP TABLE IF EXISTS stagec;
DROP TABLE IF EXISTS stagec2;

-----------------------hiCAU3_WS_C29---------------------
CREATE TEMP TABLE stagec(x jsonb);
CREATE TEMP TABLE stagec2(date timestamptz, val numeric, id text);
Do $$ declare startdate text := to_char(current_date - 3, 'YYYYMMDD'); Begin EXECUTE format('COPY stagec FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/135dca4c-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT INTO stagec2 select f.* from stagec, jsonb_populate_recordset(null::stagec2, x) f;
UPDATE stagec2 SET id = 'hiCAU3_WS_C29';
UPDATE stagec2 SET date = DATE_TRUNC('minute', date);
INSERT INTO hiCAU3 SELECT * from stagec2 WHERE date >= now() - interval '3 days';
DROP TABLE IF EXISTS stagec;
DROP TABLE IF EXISTS stagec2;

------------------iiCAU3_WS_C08_1----------------------------
CREATE TEMP TABLE stagec(x jsonb);
CREATE TEMP TABLE stagec2(date timestamptz, val numeric, id text);
Do $$ declare startdate text := to_char(current_date - 3, 'YYYYMMDD'); Begin EXECUTE format('COPY stagec FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/11ecfa70-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT INTO stagec2 select f.* from stagec, jsonb_populate_recordset(null::stagec2, x) f;
UPDATE stagec2 SET id = 'iiCAU3_WS_C08_1';
UPDATE stagec2 SET date = DATE_TRUNC('minute', date);
INSERT INTO iiCAU3_ SELECT * from stagec2 WHERE date >= now() - interval '3 days';
DROP TABLE IF EXISTS stagec;
DROP TABLE IF EXISTS stagec2;

------------------iiCAU3_WS_C08_2----------------------------
CREATE TEMP TABLE stagec(x jsonb);
CREATE TEMP TABLE stagec2(date timestamptz, val numeric, id text);
Do $$ declare startdate text := to_char(current_date - 3, 'YYYYMMDD'); Begin EXECUTE format('COPY stagec FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/11e80718-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT INTO stagec2 select f.* from stagec, jsonb_populate_recordset(null::stagec2, x) f;
UPDATE stagec2 SET id = 'iiCAU3_WS_C08_2';
UPDATE stagec2 SET date = DATE_TRUNC('minute', date);
INSERT INTO iiCAU3_ SELECT * from stagec2 WHERE date >= now() - interval '3 days';
DROP TABLE IF EXISTS stagec;
DROP TABLE IF EXISTS stagec2;

------------------iiCAU3_WS_C11_1----------------------------
CREATE TEMP TABLE stagec(x jsonb);
CREATE TEMP TABLE stagec2(date timestamptz, val numeric, id text);
Do $$ declare startdate text := to_char(current_date - 3, 'YYYYMMDD'); Begin EXECUTE format('COPY stagec FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/12261f8a-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT INTO stagec2 select f.* from stagec, jsonb_populate_recordset(null::stagec2, x) f;
UPDATE stagec2 SET id = 'iiCAU3_WS_C11_1';
UPDATE stagec2 SET date = DATE_TRUNC('minute', date);
INSERT INTO iiCAU3_ SELECT * from stagec2 WHERE date >= now() - interval '3 days';
DROP TABLE IF EXISTS stagec;
DROP TABLE IF EXISTS stagec2;

------------------iiCAU3_WS_C11_2----------------------------
CREATE TEMP TABLE stagec(x jsonb);
CREATE TEMP TABLE stagec2(date timestamptz, val numeric, id text);
Do $$ declare startdate text := to_char(current_date - 3, 'YYYYMMDD'); Begin EXECUTE format('COPY stagec FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/12217976-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT INTO stagec2 select f.* from stagec, jsonb_populate_recordset(null::stagec2, x) f;
UPDATE stagec2 SET id = 'iiCAU3_WS_C11_2';
UPDATE stagec2 SET date = DATE_TRUNC('minute', date);
INSERT INTO iiCAU3_ SELECT * from stagec2 WHERE date >= now() - interval '3 days';
DROP TABLE IF EXISTS stagec;
DROP TABLE IF EXISTS stagec2;

------------------iiCAU3_WS_C29_1----------------------------
CREATE TEMP TABLE stagec(x jsonb);
CREATE TEMP TABLE stagec2(date timestamptz, val numeric, id text);
Do $$ declare startdate text := to_char(current_date - 3, 'YYYYMMDD'); Begin EXECUTE format('COPY stagec FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/125ee3d8-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT INTO stagec2 select f.* from stagec, jsonb_populate_recordset(null::stagec2, x) f;
UPDATE stagec2 SET id = 'iiCAU3_WS_C29_1';
UPDATE stagec2 SET date = DATE_TRUNC('minute', date);
INSERT INTO iiCAU3_ SELECT * from stagec2 WHERE date >= now() - interval '3 days';
DROP TABLE IF EXISTS stagec;
DROP TABLE IF EXISTS stagec2;

------------------iiCAU3_WS_C29_2----------------------------
CREATE TEMP TABLE stagec(x jsonb);
CREATE TEMP TABLE stagec2(date timestamptz, val numeric, id text);
Do $$ declare startdate text := to_char(current_date - 3, 'YYYYMMDD'); Begin EXECUTE format('COPY stagec FROM PROGRAM ''curl "https://portal.unity.inaccess.com/ifms/sources/125ad5ea-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT000000Z"''',startdate);End$$ ;
INSERT INTO stagec2 select f.* from stagec, jsonb_populate_recordset(null::stagec2, x) f;
UPDATE stagec2 SET id = 'iiCAU3_WS_C29_2';
UPDATE stagec2 SET date = DATE_TRUNC('minute', date);
INSERT INTO iiCAU3_ SELECT * from stagec2 WHERE date >= now() - interval '3 days';
DROP TABLE IF EXISTS stagec;
DROP TABLE IF EXISTS stagec2;
