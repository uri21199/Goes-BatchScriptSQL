
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

INSERT INTO ghi_5min(id, date) SELECT * from poa_ids CROSS JOIN generate_series(date_trunc('hour', now() - interval '3 days'),date_trunc('hour', now()), interval '5 minutes') ON CONFLICT DO NOTHING;

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
------------------------------------------------------------------------------------

INSERT INTO poa_5min_columnas SELECT x::timestamptz
FROM   generate_series(DATE_TRUNC('minute', (current_date::timestamptz - interval '3 days'))
                     , DATE_TRUNC('minute', current_date::timestamptz)
                     , interval  '5 min') t(x) ON CONFLICT ON CONSTRAINT uc_poa_5min_columnas DO NOTHING;

------------------------------------------------------------------------------------
DROP TABLE IF EXISTS poa_ii;
CREATE TEMP TABLE poa_ii(date timestamptz, val numeric);

DROP TABLE IF EXISTS stage_poa_cau1;
DROP TABLE IF EXISTS stage_poa_cau12;
CREATE TEMP TABLE stage_poa_cau1(x jsonb);
CREATE TEMP TABLE stage_poa_cau12(date timestamptz, val numeric);
COPY stage_poa_cau1 FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/592be124-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=20230420T000000Z"';
INSERT INTO stage_poa_cau12 select f.* from stage_poa_cau1, jsonb_populate_recordset(null::stage_poa_cau12, x) f;
UPDATE stage_poa_cau12 SET date = DATE_TRUNC('minute', date);
INSERT INTO poa_ii SELECT * from stage_poa_cau12;

DROP TABLE IF EXISTS stage_poa_cau1;
DROP TABLE IF EXISTS stage_poa_cau12;
CREATE TEMP TABLE stage_poa_cau1(x jsonb);
CREATE TEMP TABLE stage_poa_cau12(date timestamptz, val numeric);
COPY stage_poa_cau1 FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/592c5686-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=20230420T000000Z"';
INSERT INTO stage_poa_cau12 select f.* from stage_poa_cau1, jsonb_populate_recordset(null::stage_poa_cau12, x) f;
UPDATE stage_poa_cau12 SET date = DATE_TRUNC('minute', date);
INSERT INTO poa_ii SELECT * from stage_poa_cau12;

UPDATE poa_5min_columnas SET "CAU1-WS-A07" = "CAU1-WS-A07".avg_val FROM (SELECT date, AVG(val) as avg_val FROM poa_ii GROUP BY date) AS "CAU1-WS-A07" WHERE poa_5min_columnas.date="CAU1-WS-A07".date;
-------------------------------------WS-A19-------------------------------
DROP TABLE IF EXISTS poa_ii;
CREATE TEMP TABLE poa_ii(date timestamptz, val numeric);

DROP TABLE IF EXISTS stage_poa_cau1;
DROP TABLE IF EXISTS stage_poa_cau12;
CREATE TEMP TABLE stage_poa_cau1(x jsonb);
CREATE TEMP TABLE stage_poa_cau12(date timestamptz, val numeric);
COPY stage_poa_cau1 FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/5968cbb6-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=20230420T000000Z"';
INSERT INTO stage_poa_cau12 select f.* from stage_poa_cau1, jsonb_populate_recordset(null::stage_poa_cau12, x) f;
UPDATE stage_poa_cau12 SET date = DATE_TRUNC('minute', date);
INSERT INTO poa_ii SELECT * from stage_poa_cau12;

DROP TABLE IF EXISTS stage_poa_cau1;
DROP TABLE IF EXISTS stage_poa_cau12;
CREATE TEMP TABLE stage_poa_cau1(x jsonb);
CREATE TEMP TABLE stage_poa_cau12(date timestamptz, val numeric);
COPY stage_poa_cau1 FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/596952b6-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=20230420T000000Z"';
INSERT INTO stage_poa_cau12 select f.* from stage_poa_cau1, jsonb_populate_recordset(null::stage_poa_cau12, x) f;
UPDATE stage_poa_cau12 SET date = DATE_TRUNC('minute', date);
INSERT INTO poa_ii SELECT * from stage_poa_cau12;

UPDATE poa_5min_columnas SET "CAU1-WS-A19" = "CAU1-WS-A19".avg_val FROM (SELECT date, AVG(val) as avg_val FROM poa_ii GROUP BY date) AS "CAU1-WS-A19" WHERE poa_5min_columnas.date="CAU1-WS-A19".date;
-------------------------------------WS-A29-------------------------------
DROP TABLE IF EXISTS poa_ii;
CREATE TEMP TABLE poa_ii(date timestamptz, val numeric);

DROP TABLE IF EXISTS stage_poa_cau1;
DROP TABLE IF EXISTS stage_poa_cau12;
CREATE TEMP TABLE stage_poa_cau1(x jsonb);
CREATE TEMP TABLE stage_poa_cau12(date timestamptz, val numeric);
COPY stage_poa_cau1 FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/59b02ccc-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=20230420T000000Z"';
INSERT INTO stage_poa_cau12 select f.* from stage_poa_cau1, jsonb_populate_recordset(null::stage_poa_cau12, x) f;
UPDATE stage_poa_cau12 SET date = DATE_TRUNC('minute', date);
INSERT INTO poa_ii SELECT * from stage_poa_cau12;

DROP TABLE IF EXISTS stage_poa_cau1;
DROP TABLE IF EXISTS stage_poa_cau12;
CREATE TEMP TABLE stage_poa_cau1(x jsonb);
CREATE TEMP TABLE stage_poa_cau12(date timestamptz, val numeric);
COPY stage_poa_cau1 FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/59b0a170-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=20230420T000000Z"';
INSERT INTO stage_poa_cau12 select f.* from stage_poa_cau1, jsonb_populate_recordset(null::stage_poa_cau12, x) f;
UPDATE stage_poa_cau12 SET date = DATE_TRUNC('minute', date);
INSERT INTO poa_ii SELECT * from stage_poa_cau12;

UPDATE poa_5min_columnas SET "CAU1-WS-A29" = "CAU1-WS-A29".avg_val FROM (SELECT date, AVG(val) as avg_val FROM poa_ii GROUP BY date) AS "CAU1-WS-A29" WHERE poa_5min_columnas.date="CAU1-WS-A29".date;



-------------------------------------"CAU2-WS-B08"-------------------------------
DROP TABLE IF EXISTS poa_ii2;
CREATE TEMP TABLE poa_ii2(date timestamptz, val numeric);

DROP TABLE IF EXISTS stage_poa_cau2;
DROP TABLE IF EXISTS stage_poa_cau22;
CREATE TEMP TABLE stage_poa_cau2(x jsonb);
CREATE TEMP TABLE stage_poa_cau22(date timestamptz, val numeric);
COPY stage_poa_cau2 FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/bc954d7a-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=20230420T000000Z"';
INSERT INTO stage_poa_cau22 select f.* from stage_poa_cau2, jsonb_populate_recordset(null::stage_poa_cau22, x) f;
UPDATE stage_poa_cau22 SET date = DATE_TRUNC('minute', date);
INSERT INTO poa_ii2 SELECT * from stage_poa_cau22;

DROP TABLE IF EXISTS stage_poa_cau2;
DROP TABLE IF EXISTS stage_poa_cau22;
CREATE TEMP TABLE stage_poa_cau2(x jsonb);
CREATE TEMP TABLE stage_poa_cau22(date timestamptz, val numeric);
COPY stage_poa_cau2 FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/bc95b9f4-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=20230420T000000Z"';
INSERT INTO stage_poa_cau22 select f.* from stage_poa_cau2, jsonb_populate_recordset(null::stage_poa_cau22, x) f;
UPDATE stage_poa_cau22 SET date = DATE_TRUNC('minute', date);
INSERT INTO poa_ii2 SELECT * from stage_poa_cau22;

UPDATE poa_5min_columnas SET "CAU2-WS-B08" = "CAU2-WS-B08".avg_val FROM (SELECT date, AVG(val) as avg_val FROM poa_ii2 GROUP BY date) AS "CAU2-WS-B08" WHERE poa_5min_columnas.date="CAU2-WS-B08".date;
-------------------------------------"CAU2-WS-B30"-------------------------------
DROP TABLE IF EXISTS poa_ii2;
CREATE TEMP TABLE poa_ii2(date timestamptz, val numeric);

DROP TABLE IF EXISTS stage_poa_cau2;
DROP TABLE IF EXISTS stage_poa_cau22;
CREATE TEMP TABLE stage_poa_cau2(x jsonb);
CREATE TEMP TABLE stage_poa_cau22(date timestamptz, val numeric);
COPY stage_poa_cau2 FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/bccd55d0-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=20230420T000000Z"';
INSERT INTO stage_poa_cau22 select f.* from stage_poa_cau2, jsonb_populate_recordset(null::stage_poa_cau22, x) f;
UPDATE stage_poa_cau22 SET date = DATE_TRUNC('minute', date);
INSERT INTO poa_ii2 SELECT * from stage_poa_cau22;

DROP TABLE IF EXISTS stage_poa_cau2;
DROP TABLE IF EXISTS stage_poa_cau22;
CREATE TEMP TABLE stage_poa_cau2(x jsonb);
CREATE TEMP TABLE stage_poa_cau22(date timestamptz, val numeric);
COPY stage_poa_cau2 FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/bccdbe30-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=20230420T000000Z"';
INSERT INTO stage_poa_cau22 select f.* from stage_poa_cau2, jsonb_populate_recordset(null::stage_poa_cau22, x) f;
UPDATE stage_poa_cau22 SET date = DATE_TRUNC('minute', date);
INSERT INTO poa_ii2 SELECT * from stage_poa_cau22;

UPDATE poa_5min_columnas SET "CAU2-WS-B30" = "CAU2-WS-B30".avg_val FROM (SELECT date, AVG(val) as avg_val FROM poa_ii2 GROUP BY date) AS "CAU2-WS-B30" WHERE poa_5min_columnas.date="CAU2-WS-B30".date;
-------------------------------------"CAU2-WS-B35"-------------------------------
DROP TABLE IF EXISTS poa_ii2;
CREATE TEMP TABLE poa_ii2(date timestamptz, val numeric);

DROP TABLE IF EXISTS stage_poa_cau2;
DROP TABLE IF EXISTS stage_poa_cau22;
CREATE TEMP TABLE stage_poa_cau2(x jsonb);
CREATE TEMP TABLE stage_poa_cau22(date timestamptz, val numeric);
COPY stage_poa_cau2 FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/bd070910-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=20230420T000000Z"';
INSERT INTO stage_poa_cau22 select f.* from stage_poa_cau2, jsonb_populate_recordset(null::stage_poa_cau22, x) f;
UPDATE stage_poa_cau22 SET date = DATE_TRUNC('minute', date);
INSERT INTO poa_ii2 SELECT * from stage_poa_cau22;

DROP TABLE IF EXISTS stage_poa_cau2;
DROP TABLE IF EXISTS stage_poa_cau22;
CREATE TEMP TABLE stage_poa_cau2(x jsonb);
CREATE TEMP TABLE stage_poa_cau22(date timestamptz, val numeric);
COPY stage_poa_cau2 FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/bd078c82-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=20230420T000000Z"';
INSERT INTO stage_poa_cau22 select f.* from stage_poa_cau2, jsonb_populate_recordset(null::stage_poa_cau22, x) f;
UPDATE stage_poa_cau22 SET date = DATE_TRUNC('minute', date);
INSERT INTO poa_ii2 SELECT * from stage_poa_cau22;

UPDATE poa_5min_columnas SET "CAU2-WS-B35" = "CAU2-WS-B35".avg_val FROM (SELECT date, AVG(val) as avg_val FROM poa_ii2 GROUP BY date) AS "CAU2-WS-B35" WHERE poa_5min_columnas.date="CAU2-WS-B35".date;

-------------------------------------"CAU3-WS-C29"-------------------------------
DROP TABLE IF EXISTS poa_ii3;
CREATE TEMP TABLE poa_ii3(date timestamptz, val numeric);

DROP TABLE IF EXISTS stage_poa_cau3;
DROP TABLE IF EXISTS stage_poa_cau32;
CREATE TEMP TABLE stage_poa_cau3(x jsonb);
CREATE TEMP TABLE stage_poa_cau32(date timestamptz, val numeric);
COPY stage_poa_cau3 FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/1238808a-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=20230420T000000Z"';
INSERT INTO stage_poa_cau32 select f.* from stage_poa_cau3, jsonb_populate_recordset(null::stage_poa_cau32, x) f;
UPDATE stage_poa_cau32 SET date = DATE_TRUNC('minute', date);
INSERT INTO poa_ii3 SELECT * from stage_poa_cau32;

DROP TABLE IF EXISTS stage_poa_cau3;
DROP TABLE IF EXISTS stage_poa_cau32;
CREATE TEMP TABLE stage_poa_cau3(x jsonb);
CREATE TEMP TABLE stage_poa_cau32(date timestamptz, val numeric);
COPY stage_poa_cau3 FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/1238eb06-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=20230420T000000Z"';
INSERT INTO stage_poa_cau32 select f.* from stage_poa_cau3, jsonb_populate_recordset(null::stage_poa_cau32, x) f;
UPDATE stage_poa_cau32 SET date = DATE_TRUNC('minute', date);
INSERT INTO poa_ii3 SELECT * from stage_poa_cau32;

UPDATE poa_5min_columnas SET "CAU3-WS-C29" = "CAU3-WS-C29".avg_val FROM (SELECT date, AVG(val) as avg_val FROM poa_ii3 GROUP BY date) AS "CAU3-WS-C29" WHERE poa_5min_columnas.date="CAU3-WS-C29".date;
-------------------------------------"CAU3-WS-C11"-------------------------------
DROP TABLE IF EXISTS poa_ii3;
CREATE TEMP TABLE poa_ii3(date timestamptz, val numeric);

DROP TABLE IF EXISTS stage_poa_cau3;
DROP TABLE IF EXISTS stage_poa_cau32;
CREATE TEMP TABLE stage_poa_cau3(x jsonb);
CREATE TEMP TABLE stage_poa_cau32(date timestamptz, val numeric);
COPY stage_poa_cau3 FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/11ff716e-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=20230420T000000Z"';
INSERT INTO stage_poa_cau32 select f.* from stage_poa_cau3, jsonb_populate_recordset(null::stage_poa_cau32, x) f;
UPDATE stage_poa_cau32 SET date = DATE_TRUNC('minute', date);
INSERT INTO poa_ii3 SELECT * from stage_poa_cau32;

DROP TABLE IF EXISTS stage_poa_cau3;
DROP TABLE IF EXISTS stage_poa_cau32;
CREATE TEMP TABLE stage_poa_cau3(x jsonb);
CREATE TEMP TABLE stage_poa_cau32(date timestamptz, val numeric);
COPY stage_poa_cau3 FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/11ffe5f4-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=20230420T000000Z"';
INSERT INTO stage_poa_cau32 select f.* from stage_poa_cau3, jsonb_populate_recordset(null::stage_poa_cau32, x) f;
UPDATE stage_poa_cau32 SET date = DATE_TRUNC('minute', date);
INSERT INTO poa_ii3 SELECT * from stage_poa_cau32;

UPDATE poa_5min_columnas SET "CAU3-WS-C11" = "CAU3-WS-C11".avg_val FROM (SELECT date, AVG(val) as avg_val FROM poa_ii3 GROUP BY date) AS "CAU3-WS-C11" WHERE poa_5min_columnas.date="CAU3-WS-C11".date;
-------------------------------------"CAU3-WS-C08"-------------------------------
DROP TABLE IF EXISTS poa_ii3;
CREATE TEMP TABLE poa_ii3(date timestamptz, val numeric);

DROP TABLE IF EXISTS stage_poa_cau3;
DROP TABLE IF EXISTS stage_poa_cau32;
CREATE TEMP TABLE stage_poa_cau3(x jsonb);
CREATE TEMP TABLE stage_poa_cau32(date timestamptz, val numeric);
COPY stage_poa_cau3 FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/11c6f5fa-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=20230420T000000Z"';
INSERT INTO stage_poa_cau32 select f.* from stage_poa_cau3, jsonb_populate_recordset(null::stage_poa_cau32, x) f;
UPDATE stage_poa_cau32 SET date = DATE_TRUNC('minute', date);
INSERT INTO poa_ii3 SELECT * from stage_poa_cau32;

DROP TABLE IF EXISTS stage_poa_cau3;
DROP TABLE IF EXISTS stage_poa_cau32;
CREATE TEMP TABLE stage_poa_cau3(x jsonb);
CREATE TEMP TABLE stage_poa_cau32(date timestamptz, val numeric);
COPY stage_poa_cau3 FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/11c76c2e-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=20230420T000000Z"';
INSERT INTO stage_poa_cau32 select f.* from stage_poa_cau3, jsonb_populate_recordset(null::stage_poa_cau32, x) f;
UPDATE stage_poa_cau32 SET date = DATE_TRUNC('minute', date);
INSERT INTO poa_ii3 SELECT * from stage_poa_cau32;

UPDATE poa_5min_columnas SET "CAU3-WS-C08" = "CAU3-WS-C08".avg_val FROM (SELECT date, AVG(val) as avg_val FROM poa_ii3 GROUP BY date) AS "CAU3-WS-C08" WHERE poa_5min_columnas.date="CAU3-WS-C08".date;


UPDATE poa_5min_columnas SET avg_poa = s.b FROM (SELECT date,
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
FROM   poa_5min_columnas ) AS s WHERE s.date = poa_5min_columnas.date;


UPDATE poa_5min_columnas SET avg_poa_cau1 = s.b FROM (SELECT date,
       (SELECT AVG(a)::numeric (10, 4)
        FROM   (VALUES("CAU1-WS-A07"),
                      ("CAU1-WS-A29"),
                      ("CAU1-WS-A19")) T (a)) AS b
FROM   poa_5min_columnas ) AS s WHERE s.date = poa_5min_columnas.date;


UPDATE poa_5min_columnas SET avg_poa_cau2 = s.b FROM (SELECT date,
       (SELECT AVG(a)::numeric (10, 4)
        FROM   (VALUES("CAU2-WS-B08"),
                      ("CAU2-WS-B30"),
					  ("CAU2-WS-B35")) T (a)) AS b
FROM   poa_5min_columnas ) AS s WHERE s.date = poa_5min_columnas.date;


UPDATE poa_5min_columnas SET avg_poa_cau3 = s.b FROM (SELECT date,
       (SELECT AVG(a)::numeric (10, 4)
        FROM   (VALUES("CAU3-WS-C29"),
					  ("CAU3-WS-C11"),
                      ("CAU3-WS-C08")) T (a)) AS b
FROM   poa_5min_columnas ) AS s WHERE s.date = poa_5min_columnas.date;


UPDATE poa_5min_columnas SET poa_check = 1 where avg_poa >= 50;
UPDATE poa_5min_columnas SET poa_check = 0 where avg_poa < 50;
-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS wind_5min_temp;
DROP TABLE IF EXISTS wind_5min_temp2;
CREATE TEMP TABLE wind_5min_temp(x jsonb);
CREATE TEMP TABLE wind_5min_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY wind_5min_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/5a5bf804-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=20221225T000000Z"';
INSERT INTO wind_5min_temp2 select f.* from wind_5min_temp, jsonb_populate_recordset(null::wind_5min_temp2, x) f;
UPDATE wind_5min_temp2 SET id = 'CAU1-WS-A07';
UPDATE wind_5min_temp2 SET cau = 'CAU1FV';
UPDATE wind_5min_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO wind_5min SELECT * from wind_5min_temp2 ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS wind_5min_temp;
DROP TABLE IF EXISTS wind_5min_temp2;
CREATE TEMP TABLE wind_5min_temp(x jsonb);
CREATE TEMP TABLE wind_5min_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY wind_5min_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/5adc0e9a-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=20221225T000000Z"';
INSERT INTO wind_5min_temp2 select f.* from wind_5min_temp, jsonb_populate_recordset(null::wind_5min_temp2, x) f;
UPDATE wind_5min_temp2 SET id = 'CAU1-WS-A29';
UPDATE wind_5min_temp2 SET cau = 'CAU1FV';
UPDATE wind_5min_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO wind_5min SELECT * from wind_5min_temp2 ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS wind_5min_temp;
DROP TABLE IF EXISTS wind_5min_temp2;
CREATE TEMP TABLE wind_5min_temp(x jsonb);
CREATE TEMP TABLE wind_5min_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY wind_5min_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/5a9b752e-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=20221225T000000Z"';
INSERT INTO wind_5min_temp2 select f.* from wind_5min_temp, jsonb_populate_recordset(null::wind_5min_temp2, x) f;
UPDATE wind_5min_temp2 SET id = 'CAU1-WS-A19';
UPDATE wind_5min_temp2 SET cau = 'CAU1FV';
UPDATE wind_5min_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO wind_5min SELECT * from wind_5min_temp2 ON CONFLICT DO NOTHING;

-------------------------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS wind_5min_temp;
DROP TABLE IF EXISTS wind_5min_temp2;
CREATE TEMP TABLE wind_5min_temp(x jsonb);
CREATE TEMP TABLE wind_5min_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY wind_5min_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/bda99a86-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=20221225T000000Z"';
INSERT INTO wind_5min_temp2 select f.* from wind_5min_temp, jsonb_populate_recordset(null::wind_5min_temp2, x) f;
UPDATE wind_5min_temp2 SET id = 'CAU2-WS-B08';
UPDATE wind_5min_temp2 SET cau = 'CAU2FV';
UPDATE wind_5min_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO wind_5min SELECT * from wind_5min_temp2 ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS wind_5min_temp;
DROP TABLE IF EXISTS wind_5min_temp2;
CREATE TEMP TABLE wind_5min_temp(x jsonb);
CREATE TEMP TABLE wind_5min_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY wind_5min_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/bde7f4b6-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=20221225T000000Z"';
INSERT INTO wind_5min_temp2 select f.* from wind_5min_temp, jsonb_populate_recordset(null::wind_5min_temp2, x) f;
UPDATE wind_5min_temp2 SET id = 'CAU2-WS-B30';
UPDATE wind_5min_temp2 SET cau = 'CAU2FV';
UPDATE wind_5min_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO wind_5min SELECT * from wind_5min_temp2 ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS wind_5min_temp;
DROP TABLE IF EXISTS wind_5min_temp2;
CREATE TEMP TABLE wind_5min_temp(x jsonb);
CREATE TEMP TABLE wind_5min_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY wind_5min_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/be27a480-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=20221225T000000Z"';
INSERT INTO wind_5min_temp2 select f.* from wind_5min_temp, jsonb_populate_recordset(null::wind_5min_temp2, x) f;
UPDATE wind_5min_temp2 SET id = 'CAU2-WS-B35';
UPDATE wind_5min_temp2 SET cau = 'CAU2FV';
UPDATE wind_5min_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO wind_5min SELECT * from wind_5min_temp2 ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS wind_5min_temp;
DROP TABLE IF EXISTS wind_5min_temp2;
CREATE TEMP TABLE wind_5min_temp(x jsonb);
CREATE TEMP TABLE wind_5min_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY wind_5min_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/135b3638-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=20221225T000000Z"';
INSERT INTO wind_5min_temp2 select f.* from wind_5min_temp, jsonb_populate_recordset(null::wind_5min_temp2, x) f;
UPDATE wind_5min_temp2 SET id = 'CAU3-WS-C29';
UPDATE wind_5min_temp2 SET cau = 'CAU3FV';
UPDATE wind_5min_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO wind_5min SELECT * from wind_5min_temp2 ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS wind_5min_temp;
DROP TABLE IF EXISTS wind_5min_temp2;
CREATE TEMP TABLE wind_5min_temp(x jsonb);
CREATE TEMP TABLE wind_5min_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY wind_5min_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/131db8a8-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=20221225T000000Z"';
INSERT INTO wind_5min_temp2 select f.* from wind_5min_temp, jsonb_populate_recordset(null::wind_5min_temp2, x) f;
UPDATE wind_5min_temp2 SET id = 'CAU3-WS-C11';
UPDATE wind_5min_temp2 SET cau = 'CAU3FV';
UPDATE wind_5min_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO wind_5min SELECT * from wind_5min_temp2 ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS wind_5min_temp;
DROP TABLE IF EXISTS wind_5min_temp2;
CREATE TEMP TABLE wind_5min_temp(x jsonb);
CREATE TEMP TABLE wind_5min_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY wind_5min_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/12e01f70-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=20221225T000000Z"';
INSERT INTO wind_5min_temp2 select f.* from wind_5min_temp, jsonb_populate_recordset(null::wind_5min_temp2, x) f;
UPDATE wind_5min_temp2 SET id = 'CAU3-WS-C08';
UPDATE wind_5min_temp2 SET cau = 'CAU3FV';
UPDATE wind_5min_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO wind_5min SELECT * from wind_5min_temp2 ON CONFLICT DO NOTHING;

INSERT INTO wind_5min(id, date) SELECT * from poa_ids CROSS JOIN generate_series(date_trunc('hour', now() - interval '3 days'), date_trunc('minute', now()), interval '1 minutes') ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS wind_5min_columnas;
CREATE TABLE wind_5min_columnas AS (select *
    from crosstab (
        'select date, id, val
        from wind_5min
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


ALTER TABLE wind_5min_columnas ADD COLUMN avg_wind numeric;
UPDATE wind_5min_columnas SET avg_wind = s.b FROM (SELECT date,
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
FROM   wind_5min_columnas ) AS s WHERE s.date = wind_5min_columnas.date;

ALTER TABLE wind_5min_columnas ADD COLUMN avg_wind_cau1 numeric;
UPDATE wind_5min_columnas SET avg_wind_cau1 = s.b FROM (SELECT date,
       (SELECT AVG(a)::numeric (10, 4)
        FROM   (VALUES("CAU1-WS-A07"),
                      ("CAU1-WS-A29"),
                      ("CAU1-WS-A19")) T (a)) AS b
FROM   wind_5min_columnas ) AS s WHERE s.date = wind_5min_columnas.date;

ALTER TABLE wind_5min_columnas ADD COLUMN avg_wind_cau2 numeric;
UPDATE wind_5min_columnas SET avg_wind_cau2 = s.b FROM (SELECT date,
       (SELECT AVG(a)::numeric (10, 4)
        FROM   (VALUES("CAU2-WS-B08"),
                      ("CAU2-WS-B30"),
					  ("CAU2-WS-B35")) T (a)) AS b
FROM   wind_5min_columnas ) AS s WHERE s.date = wind_5min_columnas.date;

ALTER TABLE wind_5min_columnas ADD COLUMN avg_wind_cau3 numeric;
UPDATE wind_5min_columnas SET avg_wind_cau3 = s.b FROM (SELECT date,
       (SELECT AVG(a)::numeric (10, 4)
        FROM   (VALUES("CAU3-WS-C29"),
					  ("CAU3-WS-C11"),
                      ("CAU3-WS-C08")) T (a)) AS b
FROM   wind_5min_columnas ) AS s WHERE s.date = wind_5min_columnas.date;


-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS temp_5min_temp;
DROP TABLE IF EXISTS temp_5min_temp2;
CREATE TEMP TABLE temp_5min_temp(x jsonb);
CREATE TEMP TABLE temp_5min_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY temp_5min_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/5a626b44-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=20221225T000000Z"';
INSERT INTO temp_5min_temp2 select f.* from temp_5min_temp, jsonb_populate_recordset(null::temp_5min_temp2, x) f;
UPDATE temp_5min_temp2 SET id = 'CAU1-WS-A07';
UPDATE temp_5min_temp2 SET cau = 'CAU1FV';
UPDATE temp_5min_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO temp_5min SELECT * from temp_5min_temp2 ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS temp_5min_temp;
DROP TABLE IF EXISTS temp_5min_temp2;
CREATE TEMP TABLE temp_5min_temp(x jsonb);
CREATE TEMP TABLE temp_5min_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY temp_5min_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/5ae2ea1c-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=20221225T000000Z"';
INSERT INTO temp_5min_temp2 select f.* from temp_5min_temp, jsonb_populate_recordset(null::temp_5min_temp2, x) f;
UPDATE temp_5min_temp2 SET id = 'CAU1-WS-A29';
UPDATE temp_5min_temp2 SET cau = 'CAU1FV';
UPDATE temp_5min_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO temp_5min SELECT * from temp_5min_temp2 ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS temp_5min_temp;
DROP TABLE IF EXISTS temp_5min_temp2;
CREATE TEMP TABLE temp_5min_temp(x jsonb);
CREATE TEMP TABLE temp_5min_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY temp_5min_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/5aa263e8-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=20221225T000000Z"';
INSERT INTO temp_5min_temp2 select f.* from temp_5min_temp, jsonb_populate_recordset(null::temp_5min_temp2, x) f;
UPDATE temp_5min_temp2 SET id = 'CAU1-WS-A19';
UPDATE temp_5min_temp2 SET cau = 'CAU1FV';
UPDATE temp_5min_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO temp_5min SELECT * from temp_5min_temp2 ON CONFLICT DO NOTHING;

-------------------------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS temp_5min_temp;
DROP TABLE IF EXISTS temp_5min_temp2;
CREATE TEMP TABLE temp_5min_temp(x jsonb);
CREATE TEMP TABLE temp_5min_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY temp_5min_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/bdb00fc4-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=20221225T000000Z"';
INSERT INTO temp_5min_temp2 select f.* from temp_5min_temp, jsonb_populate_recordset(null::temp_5min_temp2, x) f;
UPDATE temp_5min_temp2 SET id = 'CAU2-WS-B08';
UPDATE temp_5min_temp2 SET cau = 'CAU2FV';
UPDATE temp_5min_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO temp_5min SELECT * from temp_5min_temp2 ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS temp_5min_temp;
DROP TABLE IF EXISTS temp_5min_temp2;
CREATE TEMP TABLE temp_5min_temp(x jsonb);
CREATE TEMP TABLE temp_5min_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY temp_5min_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/bdef07b0-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=20221225T000000Z"';
INSERT INTO temp_5min_temp2 select f.* from temp_5min_temp, jsonb_populate_recordset(null::temp_5min_temp2, x) f;
UPDATE temp_5min_temp2 SET id = 'CAU2-WS-B30';
UPDATE temp_5min_temp2 SET cau = 'CAU2FV';
UPDATE temp_5min_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO temp_5min SELECT * from temp_5min_temp2 ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS temp_5min_temp;
DROP TABLE IF EXISTS temp_5min_temp2;
CREATE TEMP TABLE temp_5min_temp(x jsonb);
CREATE TEMP TABLE temp_5min_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY temp_5min_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/be2e1cde-07ec-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=20221225T000000Z"';
INSERT INTO temp_5min_temp2 select f.* from temp_5min_temp, jsonb_populate_recordset(null::temp_5min_temp2, x) f;
UPDATE temp_5min_temp2 SET id = 'CAU2-WS-B35';
UPDATE temp_5min_temp2 SET cau = 'CAU2FV';
UPDATE temp_5min_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO temp_5min SELECT * from temp_5min_temp2 ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS temp_5min_temp;
DROP TABLE IF EXISTS temp_5min_temp2;
CREATE TEMP TABLE temp_5min_temp(x jsonb);
CREATE TEMP TABLE temp_5min_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY temp_5min_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/13620e72-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=20221225T000000Z"';
INSERT INTO temp_5min_temp2 select f.* from temp_5min_temp, jsonb_populate_recordset(null::temp_5min_temp2, x) f;
UPDATE temp_5min_temp2 SET id = 'CAU3-WS-C29';
UPDATE temp_5min_temp2 SET cau = 'CAU3FV';
UPDATE temp_5min_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO temp_5min SELECT * from temp_5min_temp2 ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS temp_5min_temp;
DROP TABLE IF EXISTS temp_5min_temp2;
CREATE TEMP TABLE temp_5min_temp(x jsonb);
CREATE TEMP TABLE temp_5min_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY temp_5min_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/1324b234-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=20221225T000000Z"';
INSERT INTO temp_5min_temp2 select f.* from temp_5min_temp, jsonb_populate_recordset(null::temp_5min_temp2, x) f;
UPDATE temp_5min_temp2 SET id = 'CAU3-WS-C11';
UPDATE temp_5min_temp2 SET cau = 'CAU3FV';
UPDATE temp_5min_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO temp_5min SELECT * from temp_5min_temp2 ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS temp_5min_temp;
DROP TABLE IF EXISTS temp_5min_temp2;
CREATE TEMP TABLE temp_5min_temp(x jsonb);
CREATE TEMP TABLE temp_5min_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY temp_5min_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/12e69378-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=20221225T000000Z"';
INSERT INTO temp_5min_temp2 select f.* from temp_5min_temp, jsonb_populate_recordset(null::temp_5min_temp2, x) f;
UPDATE temp_5min_temp2 SET id = 'CAU3-WS-C08';
UPDATE temp_5min_temp2 SET cau = 'CAU3FV';
UPDATE temp_5min_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO temp_5min SELECT * from temp_5min_temp2 ON CONFLICT DO NOTHING;

INSERT INTO temp_5min(id, date) SELECT * from poa_ids CROSS JOIN generate_series(date_trunc('hour', now() - interval '3 days'), date_trunc('hours', now()), interval '1 minutes') ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS temp_5min_columnas;
CREATE TABLE temp_5min_columnas AS (select *
    from crosstab (
        'select date, id, val
        from temp_5min
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


ALTER TABLE temp_5min_columnas ADD COLUMN avg_temp numeric;
UPDATE temp_5min_columnas SET avg_temp = s.b FROM (SELECT date,
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
FROM   temp_5min_columnas ) AS s WHERE s.date = temp_5min_columnas.date;

ALTER TABLE temp_5min_columnas ADD COLUMN avg_temp_cau1 numeric;
UPDATE temp_5min_columnas SET avg_temp_cau1 = s.b FROM (SELECT date,
       (SELECT AVG(a)::numeric (10, 4)
        FROM   (VALUES("CAU1-WS-A07"),
                      ("CAU1-WS-A29"),
                      ("CAU1-WS-A19")) T (a)) AS b
FROM   temp_5min_columnas ) AS s WHERE s.date = temp_5min_columnas.date;

ALTER TABLE temp_5min_columnas ADD COLUMN avg_temp_cau2 numeric;
UPDATE temp_5min_columnas SET avg_temp_cau2 = s.b FROM (SELECT date,
       (SELECT AVG(a)::numeric (10, 4)
        FROM   (VALUES("CAU2-WS-B08"),
                      ("CAU2-WS-B30"),
					  ("CAU2-WS-B35")) T (a)) AS b
FROM   temp_5min_columnas ) AS s WHERE s.date = temp_5min_columnas.date;

ALTER TABLE temp_5min_columnas ADD COLUMN avg_temp_cau3 numeric;
UPDATE temp_5min_columnas SET avg_temp_cau3 = s.b FROM (SELECT date,
       (SELECT AVG(a)::numeric (10, 4)
        FROM   (VALUES("CAU3-WS-C29"),
					  ("CAU3-WS-C11"),
                      ("CAU3-WS-C08")) T (a)) AS b
FROM   temp_5min_columnas ) AS s WHERE s.date = temp_5min_columnas.date;





