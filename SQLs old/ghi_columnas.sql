
DROP TABLE IF EXISTS ghi_5min_temp;
DROP TABLE IF EXISTS ghi_5min_temp2;
CREATE TEMP TABLE ghi_5min_temp(x jsonb);
CREATE TEMP TABLE ghi_5min_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY ghi_5min_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/5a3e2216-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=20221225T000000Z"';
INSERT INTO ghi_5min_temp2 select f.* from ghi_5min_temp, jsonb_populate_recordset(null::ghi_5min_temp2, x) f;
UPDATE ghi_5min_temp2 SET id = 'CAU1-WS-A07';
UPDATE ghi_5min_temp2 SET cau = 'CAU1FV';
UPDATE ghi_5min_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO ghi_5min SELECT * from ghi_5min_temp2 ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS ghi_5min_temp;
DROP TABLE IF EXISTS ghi_5min_temp2;
CREATE TEMP TABLE ghi_5min_temp(x jsonb);
CREATE TEMP TABLE ghi_5min_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY ghi_5min_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/5abd0540-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=20221225T000000Z"';
INSERT INTO ghi_5min_temp2 select f.* from ghi_5min_temp, jsonb_populate_recordset(null::ghi_5min_temp2, x) f;
UPDATE ghi_5min_temp2 SET id = 'CAU1-WS-A29';
UPDATE ghi_5min_temp2 SET cau = 'CAU1FV';
UPDATE ghi_5min_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO ghi_5min SELECT * from ghi_5min_temp2 ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS ghi_5min_temp;
DROP TABLE IF EXISTS ghi_5min_temp2;
CREATE TEMP TABLE ghi_5min_temp(x jsonb);
CREATE TEMP TABLE ghi_5min_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY ghi_5min_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/5a7d7d76-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=20221225T000000Z"';
INSERT INTO ghi_5min_temp2 select f.* from ghi_5min_temp, jsonb_populate_recordset(null::ghi_5min_temp2, x) f;
UPDATE ghi_5min_temp2 SET id = 'CAU1-WS-A19';
UPDATE ghi_5min_temp2 SET cau = 'CAU1FV';
UPDATE ghi_5min_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO ghi_5min SELECT * from ghi_5min_temp2 ON CONFLICT DO NOTHING;

-------------------------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS ghi_5min_temp;
DROP TABLE IF EXISTS ghi_5min_temp2;
CREATE TEMP TABLE ghi_5min_temp(x jsonb);
CREATE TEMP TABLE ghi_5min_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY ghi_5min_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/bd8b6e9e-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=20221225T000000Z"';
INSERT INTO ghi_5min_temp2 select f.* from ghi_5min_temp, jsonb_populate_recordset(null::ghi_5min_temp2, x) f;
UPDATE ghi_5min_temp2 SET id = 'CAU2-WS-B08';
UPDATE ghi_5min_temp2 SET cau = 'CAU2FV';
UPDATE ghi_5min_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO ghi_5min SELECT * from ghi_5min_temp2 ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS ghi_5min_temp;
DROP TABLE IF EXISTS ghi_5min_temp2;
CREATE TEMP TABLE ghi_5min_temp(x jsonb);
CREATE TEMP TABLE ghi_5min_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY ghi_5min_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/bdca7102-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=20221225T000000Z"';
INSERT INTO ghi_5min_temp2 select f.* from ghi_5min_temp, jsonb_populate_recordset(null::ghi_5min_temp2, x) f;
UPDATE ghi_5min_temp2 SET id = 'CAU2-WS-B30';
UPDATE ghi_5min_temp2 SET cau = 'CAU2FV';
UPDATE ghi_5min_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO ghi_5min SELECT * from ghi_5min_temp2 ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS ghi_5min_temp;
DROP TABLE IF EXISTS ghi_5min_temp2;
CREATE TEMP TABLE ghi_5min_temp(x jsonb);
CREATE TEMP TABLE ghi_5min_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY ghi_5min_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/be093dc4-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=20221225T000000Z"';
INSERT INTO ghi_5min_temp2 select f.* from ghi_5min_temp, jsonb_populate_recordset(null::ghi_5min_temp2, x) f;
UPDATE ghi_5min_temp2 SET id = 'CAU2-WS-B35';
UPDATE ghi_5min_temp2 SET cau = 'CAU2FV';
UPDATE ghi_5min_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO ghi_5min SELECT * from ghi_5min_temp2 ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS ghi_5min_temp;
DROP TABLE IF EXISTS ghi_5min_temp2;
CREATE TEMP TABLE ghi_5min_temp(x jsonb);
CREATE TEMP TABLE ghi_5min_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY ghi_5min_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/133e7336-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=20221225T000000Z"';
INSERT INTO ghi_5min_temp2 select f.* from ghi_5min_temp, jsonb_populate_recordset(null::ghi_5min_temp2, x) f;
UPDATE ghi_5min_temp2 SET id = 'CAU3-WS-C29';
UPDATE ghi_5min_temp2 SET cau = 'CAU3FV';
UPDATE ghi_5min_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO ghi_5min SELECT * from ghi_5min_temp2 ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS ghi_5min_temp;
DROP TABLE IF EXISTS ghi_5min_temp2;
CREATE TEMP TABLE ghi_5min_temp(x jsonb);
CREATE TEMP TABLE ghi_5min_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY ghi_5min_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/13009fb6-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=20221225T000000Z"';
INSERT INTO ghi_5min_temp2 select f.* from ghi_5min_temp, jsonb_populate_recordset(null::ghi_5min_temp2, x) f;
UPDATE ghi_5min_temp2 SET id = 'CAU3-WS-C11';
UPDATE ghi_5min_temp2 SET cau = 'CAU3FV';
UPDATE ghi_5min_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO ghi_5min SELECT * from ghi_5min_temp2 ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS ghi_5min_temp;
DROP TABLE IF EXISTS ghi_5min_temp2;
CREATE TEMP TABLE ghi_5min_temp(x jsonb);
CREATE TEMP TABLE ghi_5min_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY ghi_5min_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/12c218fe-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=20221225T000000Z"';
INSERT INTO ghi_5min_temp2 select f.* from ghi_5min_temp, jsonb_populate_recordset(null::ghi_5min_temp2, x) f;
UPDATE ghi_5min_temp2 SET id = 'CAU3-WS-C08';
UPDATE ghi_5min_temp2 SET cau = 'CAU3FV';
UPDATE ghi_5min_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO ghi_5min SELECT * from ghi_5min_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS ghi_5min_columnas;
CREATE TABLE ghi_5min_columnas AS (select *
    from crosstab (
        'select date, id, val
        from ghi_5min
        order by 1, 2')
    AS ct(date timestamptz, 
	"CAU1-WS-A07" numeric(10,4), 
	"CAU1-WS-A19" numeric(10,4), 
	"CAU1-WS-A29" numeric(10,4),
	"CAU2-WS-B08" numeric(10,4),
	"CAU2-WS-B30" numeric(10,4),
	"CAU2-WS-B35" numeric(10,4),
	"CAU3-WS-C08" numeric(10,4),
	"CAU3-WS-C11" numeric(10,4),
	"CAU3-WS-C29" numeric(10,4)
	) ORDER BY date);


ALTER TABLE ghi_5min_columnas ADD COLUMN avg_ghi numeric;
UPDATE ghi_5min_columnas SET avg_ghi = s.b FROM (SELECT date,
       (SELECT AVG(a)::numeric (10, 4)
        FROM   (VALUES("CAU1-WS-A07"),
                      ("CAU1-WS-A29"),
                      ("CAU1-WS-A19"),
					  ("CAU2-WS-B08"),
                      ("CAU2-WS-B30"),
					  ("CAU2-WS-B35"),
					  ("CAU3-WS-C29"),
					  ("CAU3-WS-C11"),
                      ("CAU3-WS-C08")) T (a)) AS b
FROM   ghi_5min_columnas ) AS s WHERE s.date = ghi_5min_columnas.date;

ALTER TABLE ghi_5min_columnas ADD COLUMN avg_ghi_cau1 numeric;
UPDATE ghi_5min_columnas SET avg_ghi_cau1 = s.b FROM (SELECT date,
       (SELECT AVG(a)::numeric (10, 4)
        FROM   (VALUES("CAU1-WS-A07"),
                      ("CAU1-WS-A29"),
                      ("CAU1-WS-A19")) T (a)) AS b
FROM   ghi_5min_columnas ) AS s WHERE s.date = ghi_5min_columnas.date;

ALTER TABLE ghi_5min_columnas ADD COLUMN avg_ghi_cau2 numeric;
UPDATE ghi_5min_columnas SET avg_ghi_cau2 = s.b FROM (SELECT date,
       (SELECT AVG(a)::numeric (10, 4)
        FROM   (VALUES("CAU2-WS-B08"),
                      ("CAU2-WS-B30"),
					  ("CAU2-WS-B35")) T (a)) AS b
FROM   ghi_5min_columnas ) AS s WHERE s.date = ghi_5min_columnas.date;

ALTER TABLE ghi_5min_columnas ADD COLUMN avg_ghi_cau3 numeric;
UPDATE ghi_5min_columnas SET avg_ghi_cau3 = s.b FROM (SELECT date,
       (SELECT AVG(a)::numeric (10, 4)
        FROM   (VALUES("CAU3-WS-C29"),
					  ("CAU3-WS-C11"),
                      ("CAU3-WS-C08")) T (a)) AS b
FROM   ghi_5min_columnas ) AS s WHERE s.date = ghi_5min_columnas.date;


alter table ghi_5min_columnas add column ghi_check integer;
UPDATE ghi_5min_columnas SET ghi_check = 1 where avg_ghi >= 50;
UPDATE ghi_5min_columnas SET ghi_check = 0 where avg_ghi < 50;