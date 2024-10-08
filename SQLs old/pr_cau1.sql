ALTER TABLE pr_cau1 ADD CONSTRAINT uc_pr_cau1 UNIQUE (date);

INSERT INTO pr_cau1 SELECT x::timestamptz
FROM   generate_series(DATE_TRUNC('minute', (now() - interval '450 days'))
                     , DATE_TRUNC('minute', now())
                     , interval  '1 min') t(x) ON CONFLICT ON CONSTRAINT uc_pr_cau1 DO NOTHING;

-------------------------------------WS-A07-------------------------------
DROP TABLE IF EXISTS pr_ii;
CREATE TEMP TABLE pr_ii(date timestamptz, val numeric);

DROP TABLE IF EXISTS stage_pr_cau1;
DROP TABLE IF EXISTS stage_pr_cau12;
CREATE TEMP TABLE stage_pr_cau1(x jsonb);
CREATE TEMP TABLE stage_pr_cau12(date timestamptz, val numeric);
COPY stage_pr_cau1 FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/59547e54-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=20221025T000000Z"';
INSERT INTO stage_pr_cau12 select f.* from stage_pr_cau1, jsonb_populate_recordset(null::stage_pr_cau12, x) f;
UPDATE stage_pr_cau12 SET date = DATE_TRUNC('minute', date);
INSERT INTO pr_ii SELECT * from stage_pr_cau12;

DROP TABLE IF EXISTS stage_pr_cau1;
DROP TABLE IF EXISTS stage_pr_cau12;
CREATE TEMP TABLE stage_pr_cau1(x jsonb);
CREATE TEMP TABLE stage_pr_cau12(date timestamptz, val numeric);
COPY stage_pr_cau1 FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/594fc486-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=20221025T000000Z"';
INSERT INTO stage_pr_cau12 select f.* from stage_pr_cau1, jsonb_populate_recordset(null::stage_pr_cau12, x) f;
UPDATE stage_pr_cau12 SET date = DATE_TRUNC('minute', date);
INSERT INTO pr_ii SELECT * from stage_pr_cau12;

UPDATE pr_cau1 SET WS_A07 = WS_A07.avg_val FROM (SELECT date, AVG(val) as avg_val FROM pr_ii GROUP BY date) AS WS_A07 WHERE pr_cau1.date=WS_A07.date;
-------------------------------------WS-A19-------------------------------
DROP TABLE IF EXISTS pr_ii;
CREATE TEMP TABLE pr_ii(date timestamptz, val numeric);

DROP TABLE IF EXISTS stage_pr_cau1;
DROP TABLE IF EXISTS stage_pr_cau12;
CREATE TEMP TABLE stage_pr_cau1(x jsonb);
CREATE TEMP TABLE stage_pr_cau12(date timestamptz, val numeric);
COPY stage_pr_cau1 FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/599868d0-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=20221025T000000Z"';
INSERT INTO stage_pr_cau12 select f.* from stage_pr_cau1, jsonb_populate_recordset(null::stage_pr_cau12, x) f;
UPDATE stage_pr_cau12 SET date = DATE_TRUNC('minute', date);
INSERT INTO pr_ii SELECT * from stage_pr_cau12;

DROP TABLE IF EXISTS stage_pr_cau1;
DROP TABLE IF EXISTS stage_pr_cau12;
CREATE TEMP TABLE stage_pr_cau1(x jsonb);
CREATE TEMP TABLE stage_pr_cau12(date timestamptz, val numeric);
COPY stage_pr_cau1 FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/59907dd2-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=20221025T000000Z"';
INSERT INTO stage_pr_cau12 select f.* from stage_pr_cau1, jsonb_populate_recordset(null::stage_pr_cau12, x) f;
UPDATE stage_pr_cau12 SET date = DATE_TRUNC('minute', date);
INSERT INTO pr_ii SELECT * from stage_pr_cau12;

UPDATE pr_cau1 SET WS_A19 = WS_A19.avg_val FROM (SELECT date, AVG(val) as avg_val FROM pr_ii GROUP BY date) AS WS_A19 WHERE pr_cau1.date=WS_A19.date;
-------------------------------------WS-A29-------------------------------
DROP TABLE IF EXISTS pr_ii;
CREATE TEMP TABLE pr_ii(date timestamptz, val numeric);

DROP TABLE IF EXISTS stage_pr_cau1;
DROP TABLE IF EXISTS stage_pr_cau12;
CREATE TEMP TABLE stage_pr_cau1(x jsonb);
CREATE TEMP TABLE stage_pr_cau12(date timestamptz, val numeric);
COPY stage_pr_cau1 FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/59ded036-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=20221025T000000Z"';
INSERT INTO stage_pr_cau12 select f.* from stage_pr_cau1, jsonb_populate_recordset(null::stage_pr_cau12, x) f;
UPDATE stage_pr_cau12 SET date = DATE_TRUNC('minute', date);
INSERT INTO pr_ii SELECT * from stage_pr_cau12;

DROP TABLE IF EXISTS stage_pr_cau1;
DROP TABLE IF EXISTS stage_pr_cau12;
CREATE TEMP TABLE stage_pr_cau1(x jsonb);
CREATE TEMP TABLE stage_pr_cau12(date timestamptz, val numeric);
COPY stage_pr_cau1 FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/59d990bc-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=20221025T000000Z"';
INSERT INTO stage_pr_cau12 select f.* from stage_pr_cau1, jsonb_populate_recordset(null::stage_pr_cau12, x) f;
UPDATE stage_pr_cau12 SET date = DATE_TRUNC('minute', date);
INSERT INTO pr_ii SELECT * from stage_pr_cau12;

UPDATE pr_cau1 SET WS_A29 = WS_A29.avg_val FROM (SELECT date, AVG(val) as avg_val FROM pr_ii GROUP BY date) AS WS_A29 WHERE pr_cau1.date=WS_A29.date;

------------------------COLUMNAS CALCULADAS----------------------------------

UPDATE pr_cau1 
	SET g_average = g_average_calc.g_average
	FROM (SELECT date,
       (SELECT AVG(a)::numeric (10, 4)
        FROM   (VALUES(ws_a07),
                      (ws_a19),
                      (ws_a29)) T (a)) AS g_average
FROM   pr_cau1 WHERE date >= (now() - interval '450 days')) AS g_average_calc WHERE g_average_calc.date=pr_cau1.date;

UPDATE pr_cau1 
	SET g_max = g_max_calc.g_max 
	FROM (SELECT date,
       (SELECT MAX(b)::numeric (10, 4)
        FROM   (VALUES(ws_a07),
                      (ws_a19),
                      (ws_a29)) T (b)) AS g_max
FROM   pr_cau1 WHERE date >= (now() - interval '450 days')) AS g_max_calc WHERE g_max_calc.date=pr_cau1.date;

UPDATE pr_cau1 
	SET g_min = g_min_calc.g_min 
	FROM (SELECT date,
       (SELECT Min(c)::numeric (10, 4)
        FROM   (VALUES(ws_a07),
                      (ws_a19),
                      (ws_a29)) T (c)) AS g_min
FROM   pr_cau1 WHERE date >= (now() - interval '450 days')) AS g_min_calc WHERE g_min_calc.date=pr_cau1.date;


UPDATE pr_cau1 SET max_diff = max_diff_calc.max_diff FROM (SELECT date, ABS((g_max / COALESCE(NULLIF(g_min,0), 1))-1) AS max_diff FROM pr_cau1 WHERE date >= (now() - interval '450 days')) AS max_diff_calc WHERE max_diff_calc.date=pr_cau1.date;

UPDATE pr_cau1 SET g_seleccionado = g_average WHERE date >= (now() - interval '450 days') AND max_diff <= 0.02;
UPDATE pr_cau1 SET g_seleccionado = g_max WHERE date >= (now() - interval '450 days') AND max_diff > 0.02;

UPDATE pr_cau1 SET g_average_m2 = g_average/60 WHERE date >= (now() - interval '450 days'); 

-------------------15min---------------------
DROP TABLE IF EXISTS pr_15min_cau1; 
CREATE TABLE pr_15min_cau1 (date_15min timestamptz, g_15min_average numeric (10, 4));

INSERT INTO pr_15min_cau1(date_15min) SELECT (to_timestamp(ceiling(( extract ('epoch' from (date)) ) / (60*15) ) * (60*15))) AS date_15min from pr_cau1 WHERE date >= (now() - interval '450 days') GROUP BY date_15min;

UPDATE pr_15min_cau1 SET g_15min_average = average_15min_calc.average_15min 
	FROM (SELECT 
		(AVG(g_seleccionado)::numeric (10,4)) AS average_15min, 
		(to_timestamp(ceiling(( extract ('epoch' from (date)) ) / (60*15) ) * (60*15))) AS date_15min
			from pr_cau1 WHERE date >= (now() - interval '450 days') GROUP BY date_15min) AS average_15min_calc WHERE average_15min_calc.date_15min = pr_15min_cau1.date_15min;
			
ALTER TABLE pr_15min_cau1 ADD COLUMN g_15min_average_600 numeric;

UPDATE pr_15min_cau1 SET g_15min_average_600 = '1' WHERE g_15min_average >= 600 ;
UPDATE pr_15min_cau1 SET g_15min_average_600 = '0' WHERE g_15min_average < 600 ;

-------------------60min---------------------
DROP TABLE IF EXISTS pr_60min_cau1; 
CREATE TABLE pr_60min_cau1 (date_60min timestamptz, g_60min_average numeric (10, 4));

INSERT INTO pr_60min_cau1(date_60min) SELECT (to_timestamp(ceiling(( extract ('epoch' from (date)) ) / (60*60) ) * (60*60))) AS date_60min from pr_cau1 WHERE date >= (now() - interval '450 days') GROUP BY date_60min;

UPDATE pr_60min_cau1 SET g_60min_average = average_60min_calc.average_60min 
	FROM (SELECT 
		(AVG(g_seleccionado)::numeric (10,4)) AS average_60min, 
		(to_timestamp(ceiling(( extract ('epoch' from (date)) ) / (60*60) ) * (60*60))) AS date_60min
			from pr_cau1 WHERE date >= (now() - interval '450 days') GROUP BY date_60min) AS average_60min_calc WHERE average_60min_calc.date_60min = pr_60min_cau1.date_60min;

ALTER TABLE pr_60min_cau1 ADD COLUMN g_60min_average_600 numeric;

UPDATE pr_60min_cau1 SET g_60min_average_600 = '1' WHERE g_60min_average >= 600 ;
UPDATE pr_60min_cau1 SET g_60min_average_600 = '0' WHERE g_60min_average < 600 ;
--------------------24hs-----------------------

DROP TABLE IF EXISTS pr_24hs_cau1; 
CREATE TABLE pr_24hs_cau1 (date_24hs timestamptz, g_24hs_sum numeric (10, 4), g_24hs_3000_check numeric);

INSERT INTO pr_24hs_cau1 SELECT date_trunc('day', date) FROM pr_cau1 WHERE date >= (now() - interval '450 days') GROUP BY date_trunc('day', date);

UPDATE pr_24hs_cau1 SET g_24hs_sum = g_24hs_sum_calc.sum FROM (SELECT date_trunc('day', date), SUM(g_average_m2) FROM pr_cau1 WHERE date >= (now() - interval '450 days') GROUP BY date_trunc('day', date)) AS g_24hs_sum_calc WHERE g_24hs_sum_calc.date_trunc = pr_24hs_cau1.date_24hs ;

UPDATE pr_24hs_cau1 SET g_24hs_3000_check = '1' WHERE g_24hs_sum >= 3000;
UPDATE pr_24hs_cau1 SET g_24hs_3000_check = '0' WHERE g_24hs_sum < 3000;

------------------MERGE-----------------------
UPDATE pr_cau1 SET dia = date::date WHERE date >= (now() - interval '450 days');

UPDATE pr_cau1 SET g_15min_average = pr_15min_cau1.g_15min_average FROM pr_15min_cau1 WHERE pr_15min_cau1.date_15min = pr_cau1.date;
UPDATE pr_cau1 SET g_60min_average = pr_60min_cau1.g_60min_average FROM pr_60min_cau1 WHERE pr_60min_cau1.date_60min = pr_cau1.date;
UPDATE pr_cau1 SET g_15min_average_600 = pr_15min_cau1.g_15min_average_600 FROM pr_15min_cau1 WHERE pr_15min_cau1.date_15min = pr_cau1.date;
UPDATE pr_cau1 SET g_60min_average_600 = pr_60min_cau1.g_60min_average_600 FROM pr_60min_cau1 WHERE pr_60min_cau1.date_60min = pr_cau1.date;
UPDATE pr_cau1 SET g_24hs_3000_check = pr_24hs_cau1.g_24hs_3000_check FROM pr_24hs_cau1 WHERE pr_24hs_cau1.date_24hs = pr_cau1.date;

UPDATE pr_cau1 SET g_3h_average_consecutivas = g_3h_average_consecutivas_calc.g_3h_average_consecutivas FROM (SELECT date_60min, g_60min_average
      , (avg(g_60min_average) OVER (ORDER BY date_60min ROWS BETWEEN 2 PRECEDING AND CURRENT ROW)::numeric (10, 4)) AS g_3h_average_consecutivas
FROM pr_60min_cau1) AS g_3h_average_consecutivas_calc WHERE g_3h_average_consecutivas_calc.date_60min = pr_cau1.date;

UPDATE pr_cau1 SET g_count_average_600 = g_count_average_600_calc.g_count_average_600 FROM (SELECT DATE_TRUNC('day', date_60min) AS date, (count(*) FILTER (WHERE g_60min_average > 600)::numeric (2,0)) AS g_count_average_600 FROM pr_60min_cau1 GROUP BY date) AS g_count_average_600_calc WHERE g_count_average_600_calc.date = pr_cau1.date;

UPDATE pr_cau1 SET "g_3h_average_600_consecutivas " = '0' WHERE date >= (now() - interval '450 days') AND g_3h_average_consecutivas < 600;
UPDATE pr_cau1 SET "g_3h_average_600_consecutivas " = '1' WHERE date >= (now() - interval '450 days') AND g_3h_average_consecutivas >= 600;

DROP TABLE IF EXISTS pr_check_600_3h_consecutivas;
CREATE TABLE pr_check_600_3h_consecutivas (dia date, "g_3h_average_600_consecutivas " numeric, check_average numeric);

INSERT INTO pr_check_600_3h_consecutivas(dia) SELECT DISTINCT date::date FROM pr_cau1 WHERE date >= (now() - interval '450 days');

UPDATE pr_check_600_3h_consecutivas SET check_average = check_average_calc.check_average 
	FROM (SELECT (AVG("g_3h_average_600_consecutivas ")) AS check_average, (date_trunc('day', date))::date AS date_1dia FROM pr_cau1 WHERE date >= (now() - interval '450 days') GROUP BY date_trunc('day', date)) AS check_average_calc WHERE check_average_calc.date_1dia = pr_check_600_3h_consecutivas.dia ;
			
UPDATE pr_check_600_3h_consecutivas SET "g_3h_average_600_consecutivas " = '0' WHERE check_average = 0;
UPDATE pr_check_600_3h_consecutivas SET "g_3h_average_600_consecutivas " = '1' WHERE check_average > 0;

UPDATE pr_cau1 SET "g_3h_average_600_consecutivas " = pr_check_600_3h_consecutivas."g_3h_average_600_consecutivas " FROM pr_check_600_3h_consecutivas WHERE pr_check_600_3h_consecutivas.dia = pr_cau1.dia;

DELETE FROM pr_cau1 WHERE date > (now() -  interval '2 minutes');

DROP TABLE IF EXISTS pr_15min_cau1; 
DROP TABLE IF EXISTS pr_60min_cau1;
DROP TABLE IF EXISTS pr_24hs_cau1;
