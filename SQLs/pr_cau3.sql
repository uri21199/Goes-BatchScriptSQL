
INSERT INTO pr_cau3 SELECT x::timestamptz
FROM   generate_series(DATE_TRUNC('minute', (now() - interval '60 days'))
                     , DATE_TRUNC('minute', now())
                     , interval  '1 min') t(x) ON CONFLICT ON CONSTRAINT uc_pr_cau3 DO NOTHING;

-------------------------------------WS_C29-------------------------------
DROP TABLE IF EXISTS pr_ii3;
CREATE TEMP TABLE pr_ii3(date timestamptz, val numeric);

DROP TABLE IF EXISTS stage_pr_cau3;
DROP TABLE IF EXISTS stage_pr_cau32;
CREATE TEMP TABLE stage_pr_cau3(x jsonb);
CREATE TEMP TABLE stage_pr_cau32(date timestamptz, val numeric);
COPY stage_pr_cau3 FROM PROGRAM 'curl -H "Api-Key:38deaa51-8716-4cc9-aa42-ab14fb72a752.01" "https://portal.unity.inaccess.com/ifms/sources/125ee3d8-07ed-11eb-8564-42010afa015a/events?&start_date=20240301T000000Z"';
INSERT INTO stage_pr_cau32 select f.* from stage_pr_cau3, jsonb_populate_recordset(null::stage_pr_cau32, x) f;
UPDATE stage_pr_cau32 SET date = DATE_TRUNC('minute', date);
INSERT INTO pr_ii3 SELECT * from stage_pr_cau32;

DROP TABLE IF EXISTS stage_pr_cau3;
DROP TABLE IF EXISTS stage_pr_cau32;
CREATE TEMP TABLE stage_pr_cau3(x jsonb);
CREATE TEMP TABLE stage_pr_cau32(date timestamptz, val numeric);
COPY stage_pr_cau3 FROM PROGRAM 'curl -H "Api-Key:38deaa51-8716-4cc9-aa42-ab14fb72a752.01" "https://portal.unity.inaccess.com/ifms/sources/125ad5ea-07ed-11eb-8564-42010afa015a/events?&start_date=20240301T000000Z"';
INSERT INTO stage_pr_cau32 select f.* from stage_pr_cau3, jsonb_populate_recordset(null::stage_pr_cau32, x) f;
UPDATE stage_pr_cau32 SET date = DATE_TRUNC('minute', date);
INSERT INTO pr_ii3 SELECT * from stage_pr_cau32;

UPDATE pr_cau3 SET WS_C29 = WS_C29.avg_val FROM (SELECT date, AVG(val) as avg_val FROM pr_ii3 GROUP BY date) AS WS_C29 WHERE pr_cau3.date=WS_C29.date;
-------------------------------------WS_C11-------------------------------
DROP TABLE IF EXISTS pr_ii3;
CREATE TEMP TABLE pr_ii3(date timestamptz, val numeric);

DROP TABLE IF EXISTS stage_pr_cau3;
DROP TABLE IF EXISTS stage_pr_cau32;
CREATE TEMP TABLE stage_pr_cau3(x jsonb);
CREATE TEMP TABLE stage_pr_cau32(date timestamptz, val numeric);
COPY stage_pr_cau3 FROM PROGRAM 'curl -H "Api-Key:38deaa51-8716-4cc9-aa42-ab14fb72a752.01" "https://portal.unity.inaccess.com/ifms/sources/12261f8a-07ed-11eb-8564-42010afa015a/events?&start_date=20240301T000000Z"';
INSERT INTO stage_pr_cau32 select f.* from stage_pr_cau3, jsonb_populate_recordset(null::stage_pr_cau32, x) f;
UPDATE stage_pr_cau32 SET date = DATE_TRUNC('minute', date);
INSERT INTO pr_ii3 SELECT * from stage_pr_cau32;

DROP TABLE IF EXISTS stage_pr_cau3;
DROP TABLE IF EXISTS stage_pr_cau32;
CREATE TEMP TABLE stage_pr_cau3(x jsonb);
CREATE TEMP TABLE stage_pr_cau32(date timestamptz, val numeric);
COPY stage_pr_cau3 FROM PROGRAM 'curl -H "Api-Key:38deaa51-8716-4cc9-aa42-ab14fb72a752.01" "https://portal.unity.inaccess.com/ifms/sources/12217976-07ed-11eb-8564-42010afa015a/events?&start_date=20240301T000000Z"';
INSERT INTO stage_pr_cau32 select f.* from stage_pr_cau3, jsonb_populate_recordset(null::stage_pr_cau32, x) f;
UPDATE stage_pr_cau32 SET date = DATE_TRUNC('minute', date);
INSERT INTO pr_ii3 SELECT * from stage_pr_cau32;

UPDATE pr_cau3 SET WS_C11 = WS_C11.avg_val FROM (SELECT date, AVG(val) as avg_val FROM pr_ii3 GROUP BY date) AS WS_C11 WHERE pr_cau3.date=WS_C11.date;
-------------------------------------WS_C08-------------------------------
DROP TABLE IF EXISTS pr_ii3;
CREATE TEMP TABLE pr_ii3(date timestamptz, val numeric);

DROP TABLE IF EXISTS stage_pr_cau3;
DROP TABLE IF EXISTS stage_pr_cau32;
CREATE TEMP TABLE stage_pr_cau3(x jsonb);
CREATE TEMP TABLE stage_pr_cau32(date timestamptz, val numeric);
COPY stage_pr_cau3 FROM PROGRAM 'curl -H "Api-Key:38deaa51-8716-4cc9-aa42-ab14fb72a752.01" "https://portal.unity.inaccess.com/ifms/sources/11ecfa70-07ed-11eb-8564-42010afa015a/events?&start_date=20240301T000000Z"';
INSERT INTO stage_pr_cau32 select f.* from stage_pr_cau3, jsonb_populate_recordset(null::stage_pr_cau32, x) f;
UPDATE stage_pr_cau32 SET date = DATE_TRUNC('minute', date);
INSERT INTO pr_ii3 SELECT * from stage_pr_cau32;

DROP TABLE IF EXISTS stage_pr_cau3;
DROP TABLE IF EXISTS stage_pr_cau32;
CREATE TEMP TABLE stage_pr_cau3(x jsonb);
CREATE TEMP TABLE stage_pr_cau32(date timestamptz, val numeric);
COPY stage_pr_cau3 FROM PROGRAM 'curl -H "Api-Key:38deaa51-8716-4cc9-aa42-ab14fb72a752.01" "https://portal.unity.inaccess.com/ifms/sources/11e80718-07ed-11eb-8564-42010afa015a/events?&start_date=20240301T000000Z"';
INSERT INTO stage_pr_cau32 select f.* from stage_pr_cau3, jsonb_populate_recordset(null::stage_pr_cau32, x) f;
UPDATE stage_pr_cau32 SET date = DATE_TRUNC('minute', date);
INSERT INTO pr_ii3 SELECT * from stage_pr_cau32;

UPDATE pr_cau3 SET WS_C08 = WS_C08.avg_val FROM (SELECT date, AVG(val) as avg_val FROM pr_ii3 GROUP BY date) AS WS_C08 WHERE pr_cau3.date=WS_C08.date;

------------------------COLUMNAS CALCULADAS----------------------------------

UPDATE pr_cau3 
	SET g_average = g_average_calc.g_average
	FROM (SELECT date,
       (SELECT AVG(a)::numeric (10, 4)
        FROM   (VALUES(WS_C29),
                      (WS_C11),
                      (WS_C08)) T (a)) AS g_average
FROM   pr_cau3 WHERE date >= (now() - interval '60 days')) AS g_average_calc WHERE g_average_calc.date=pr_cau3.date;

UPDATE pr_cau3 
	SET g_max = g_max_calc.g_max 
	FROM (SELECT date,
       (SELECT MAX(b)::numeric (10, 4)
        FROM   (VALUES(WS_C29),
                      (WS_C11),
                      (WS_C08)) T (b)) AS g_max
FROM   pr_cau3 WHERE date >= (now() - interval '60 days')) AS g_max_calc WHERE g_max_calc.date=pr_cau3.date;

UPDATE pr_cau3 
	SET g_min = g_min_calc.g_min 
	FROM (SELECT date,
       (SELECT Min(c)::numeric (10, 4)
        FROM   (VALUES(WS_C29),
                      (WS_C11),
                      (WS_C08)) T (c)) AS g_min
FROM   pr_cau3 WHERE date >= (now() - interval '60 days')) AS g_min_calc WHERE g_min_calc.date=pr_cau3.date;


UPDATE pr_cau3 SET max_diff = max_diff_calc.max_diff FROM (SELECT date, ABS((g_max / COALESCE(NULLIF(g_min,0), 1))-1) AS max_diff FROM pr_cau3 WHERE date >= (now() - interval '60 days')) AS max_diff_calc WHERE max_diff_calc.date=pr_cau3.date;

UPDATE pr_cau3 SET g_seleccionado = g_average WHERE date >= (now() - interval '60 days') AND max_diff <= 0.02;
UPDATE pr_cau3 SET g_seleccionado = g_max WHERE date >= (now() - interval '60 days') AND max_diff > 0.02;

UPDATE pr_cau3 SET g_average_m2 = g_average/60 WHERE date >= (now() - interval '60 days'); 

-------------------15min---------------------
DROP TABLE IF EXISTS pr_15min_cau3; 
CREATE TABLE pr_15min_cau3 (date_15min timestamptz, g_15min_average numeric (10, 4));

INSERT INTO pr_15min_cau3(date_15min) SELECT (to_timestamp(ceiling(( extract ('epoch' from (date)) ) / (60*15) ) * (60*15))) AS date_15min from pr_cau3 WHERE date >= (now() - interval '60 days') GROUP BY date_15min;

UPDATE pr_15min_cau3 SET g_15min_average = average_15min_calc.average_15min 
	FROM (SELECT 
		(AVG(g_seleccionado)::numeric (10,4)) AS average_15min, 
		(to_timestamp(ceiling(( extract ('epoch' from (date)) ) / (60*15) ) * (60*15))) AS date_15min
			from pr_cau3 WHERE date >= (now() - interval '60 days') GROUP BY date_15min) AS average_15min_calc WHERE average_15min_calc.date_15min = pr_15min_cau3.date_15min;
			
ALTER TABLE pr_15min_cau3 ADD COLUMN g_15min_average_600 numeric;

UPDATE pr_15min_cau3 SET g_15min_average_600 = '1' WHERE g_15min_average >= 600 ;
UPDATE pr_15min_cau3 SET g_15min_average_600 = '0' WHERE g_15min_average < 600 ;

-------------------60min---------------------
DROP TABLE IF EXISTS pr_60min_cau3; 
CREATE TABLE pr_60min_cau3 (date_60min timestamptz, g_60min_average numeric (10, 4));

INSERT INTO pr_60min_cau3(date_60min) SELECT (to_timestamp(ceiling(( extract ('epoch' from (date)) ) / (60*60) ) * (60*60))) AS date_60min from pr_cau3 WHERE date >= (now() - interval '60 days') GROUP BY date_60min;

UPDATE pr_60min_cau3 SET g_60min_average = average_60min_calc.average_60min 
	FROM (SELECT 
		(AVG(g_seleccionado)::numeric (10,4)) AS average_60min, 
		(to_timestamp(ceiling(( extract ('epoch' from (date)) ) / (60*60) ) * (60*60))) AS date_60min
			from pr_cau3 WHERE date >= (now() - interval '60 days') GROUP BY date_60min) AS average_60min_calc WHERE average_60min_calc.date_60min = pr_60min_cau3.date_60min;

ALTER TABLE pr_60min_cau3 ADD COLUMN g_60min_average_600 numeric;

UPDATE pr_60min_cau3 SET g_60min_average_600 = '1' WHERE g_60min_average >= 600 ;
UPDATE pr_60min_cau3 SET g_60min_average_600 = '0' WHERE g_60min_average < 600 ;
--------------------24hs-----------------------

DROP TABLE IF EXISTS pr_24hs_cau3; 
CREATE TABLE pr_24hs_cau3 (date_24hs timestamptz, g_24hs_sum numeric (10, 4), g_24hs_3000_check numeric);

INSERT INTO pr_24hs_cau3 SELECT date_trunc('day', date) FROM pr_cau3 WHERE date >= (now() - interval '60 days') GROUP BY date_trunc('day', date);

UPDATE pr_24hs_cau3 SET g_24hs_sum = g_24hs_sum_calc.sum FROM (SELECT date_trunc('day', date), SUM(g_average_m2) FROM pr_cau3 WHERE date >= (now() - interval '60 days') GROUP BY date_trunc('day', date)) AS g_24hs_sum_calc WHERE g_24hs_sum_calc.date_trunc = pr_24hs_cau3.date_24hs ;

UPDATE pr_24hs_cau3 SET g_24hs_3000_check = '1' WHERE g_24hs_sum >= 3000;
UPDATE pr_24hs_cau3 SET g_24hs_3000_check = '0' WHERE g_24hs_sum < 3000;

------------------MERGE-----------------------
UPDATE pr_cau3 SET dia = date::date WHERE date >= (now() - interval '60 days');

UPDATE pr_cau3 SET g_15min_average = pr_15min_cau3.g_15min_average FROM pr_15min_cau3 WHERE pr_15min_cau3.date_15min = pr_cau3.date;
UPDATE pr_cau3 SET g_60min_average = pr_60min_cau3.g_60min_average FROM pr_60min_cau3 WHERE pr_60min_cau3.date_60min = pr_cau3.date;
UPDATE pr_cau3 SET g_15min_average_600 = pr_15min_cau3.g_15min_average_600 FROM pr_15min_cau3 WHERE pr_15min_cau3.date_15min = pr_cau3.date;
UPDATE pr_cau3 SET g_60min_average_600 = pr_60min_cau3.g_60min_average_600 FROM pr_60min_cau3 WHERE pr_60min_cau3.date_60min = pr_cau3.date;
UPDATE pr_cau3 SET g_24hs_3000_check = pr_24hs_cau3.g_24hs_3000_check FROM pr_24hs_cau3 WHERE pr_24hs_cau3.date_24hs = pr_cau3.date;

UPDATE pr_cau3 SET g_3h_average_consecutivas = g_3h_average_consecutivas_calc.g_3h_average_consecutivas FROM (SELECT date_60min, g_60min_average
      , (avg(g_60min_average) OVER (ORDER BY date_60min ROWS BETWEEN 2 PRECEDING AND CURRENT ROW)::numeric (10, 4)) AS g_3h_average_consecutivas
FROM pr_60min_cau3) AS g_3h_average_consecutivas_calc WHERE g_3h_average_consecutivas_calc.date_60min = pr_cau3.date;

UPDATE pr_cau3 SET g_count_average_600 = g_count_average_600_calc.g_count_average_600 FROM (SELECT DATE_TRUNC('day', date_60min) AS date, (count(*) FILTER (WHERE g_60min_average > 600)::numeric (2,0)) AS g_count_average_600 FROM pr_60min_cau3 GROUP BY date) AS g_count_average_600_calc WHERE g_count_average_600_calc.date = pr_cau3.date;

UPDATE pr_cau3 SET "g_3h_average_600_consecutivas " = '0' WHERE date >= (now() - interval '60 days') AND g_3h_average_consecutivas < 600;
UPDATE pr_cau3 SET "g_3h_average_600_consecutivas " = '1' WHERE date >= (now() - interval '60 days') AND g_3h_average_consecutivas >= 600;

DROP TABLE IF EXISTS pr_check_600_3h_consecutivas_cau3;
CREATE TABLE pr_check_600_3h_consecutivas_cau3 (dia date, "g_3h_average_600_consecutivas " numeric, check_average numeric);

INSERT INTO pr_check_600_3h_consecutivas_cau3(dia) SELECT DISTINCT date::date FROM pr_cau3 WHERE date >= (now() - interval '60 days');

UPDATE pr_check_600_3h_consecutivas_cau3 SET check_average = check_average_calc.check_average 
	FROM (SELECT (AVG("g_3h_average_600_consecutivas ")) AS check_average, (date_trunc('day', date))::date AS date_1dia FROM pr_cau3 WHERE date >= (now() - interval '60 days') GROUP BY date_trunc('day', date)) AS check_average_calc WHERE check_average_calc.date_1dia = pr_check_600_3h_consecutivas_cau3.dia ;
			
UPDATE pr_check_600_3h_consecutivas_cau3 SET "g_3h_average_600_consecutivas " = '0' WHERE check_average = 0;
UPDATE pr_check_600_3h_consecutivas_cau3 SET "g_3h_average_600_consecutivas " = '1' WHERE check_average > 0;

UPDATE pr_cau3 SET "g_3h_average_600_consecutivas " = pr_check_600_3h_consecutivas_cau3."g_3h_average_600_consecutivas " FROM pr_check_600_3h_consecutivas_cau3 WHERE pr_check_600_3h_consecutivas_cau3.dia = pr_cau3.dia;

DELETE FROM pr_cau3 WHERE date > (now() -  interval '2 minutes');

DROP TABLE IF EXISTS pr_15min_cau3; 
DROP TABLE IF EXISTS pr_60min_cau3;
DROP TABLE IF EXISTS pr_24hs_cau3;  
