DROP TABLE IF EXISTS cafayate.availability_calc;
DROP TABLE IF EXISTS availability_calc_ii;
CREATE TABLE cafayate.availability_calc(date timestamptz, irrad4 numeric (10, 4), irrad7 numeric (10, 4), irrad9 numeric (10, 4));

INSERT INTO cafayate.availability_calc SELECT x::timestamptz
FROM   generate_series(timestamp '2019-06-15 00:00'
                     , DATE_TRUNC('minute', now())
                     , interval  '1 min') t(x);


-------------------------------------4-------------------------------
DROP TABLE IF EXISTS availability_calc_ii;
CREATE TEMP TABLE availability_calc_ii(date timestamptz, val numeric);

DROP TABLE IF EXISTS stage_caf_availability_calc;
DROP TABLE IF EXISTS stage_caf_availability_calc2;
CREATE TEMP TABLE stage_caf_availability_calc(x jsonb);
CREATE TEMP TABLE stage_caf_availability_calc2(date timestamptz, val numeric);
COPY stage_caf_availability_calc FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/c59f858a-8934-11e9-8620-42010afa015a/events?apiKey=e385a1a5-0441-4e06-be58-162731a7d4f9.01"';
INSERT INTO stage_caf_availability_calc2 select f.* from stage_caf_availability_calc, jsonb_populate_recordset(null::stage_caf_availability_calc2, x) f;
UPDATE stage_caf_availability_calc2 SET date = DATE_TRUNC('minute', date);
INSERT INTO availability_calc_ii SELECT * from stage_caf_availability_calc2;

DROP TABLE IF EXISTS stage_caf_availability_calc;
DROP TABLE IF EXISTS stage_caf_availability_calc2;
CREATE TEMP TABLE stage_caf_availability_calc(x jsonb);
CREATE TEMP TABLE stage_caf_availability_calc2(date timestamptz, val numeric);
COPY stage_caf_availability_calc FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/c59f858a-8934-11e9-8620-42010afa015a/events?apiKey=e385a1a5-0441-4e06-be58-162731a7d4f9.01"';
INSERT INTO stage_caf_availability_calc2 select f.* from stage_caf_availability_calc, jsonb_populate_recordset(null::stage_caf_availability_calc2, x) f;
UPDATE stage_caf_availability_calc2 SET date = DATE_TRUNC('minute', date);
INSERT INTO availability_calc_ii SELECT * from stage_caf_availability_calc2;

UPDATE cafayate.availability_calc SET irrad4 = irrad4.avg_val FROM (SELECT date, AVG(val) as avg_val FROM availability_calc_ii GROUP BY date) AS irrad4 WHERE cafayate.availability_calc.date=irrad4.date;
-------------------------------------7-------------------------------
DROP TABLE IF EXISTS availability_calc_ii;
CREATE TEMP TABLE availability_calc_ii(date timestamptz, val numeric);

DROP TABLE IF EXISTS stage_caf_availability_calc;
DROP TABLE IF EXISTS stage_caf_availability_calc2;
CREATE TEMP TABLE stage_caf_availability_calc(x jsonb);
CREATE TEMP TABLE stage_caf_availability_calc2(date timestamptz, val numeric);
COPY stage_caf_availability_calc FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/c5a1d92a-8934-11e9-8620-42010afa015a/events?apiKey=e385a1a5-0441-4e06-be58-162731a7d4f9.01"';
INSERT INTO stage_caf_availability_calc2 select f.* from stage_caf_availability_calc, jsonb_populate_recordset(null::stage_caf_availability_calc2, x) f;
UPDATE stage_caf_availability_calc2 SET date = DATE_TRUNC('minute', date);
INSERT INTO availability_calc_ii SELECT * from stage_caf_availability_calc2;

DROP TABLE IF EXISTS stage_caf_availability_calc;
DROP TABLE IF EXISTS stage_caf_availability_calc2;
CREATE TEMP TABLE stage_caf_availability_calc(x jsonb);
CREATE TEMP TABLE stage_caf_availability_calc2(date timestamptz, val numeric);
COPY stage_caf_availability_calc FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/c5a1d92a-8934-11e9-8620-42010afa015a/events?apiKey=e385a1a5-0441-4e06-be58-162731a7d4f9.01"';
INSERT INTO stage_caf_availability_calc2 select f.* from stage_caf_availability_calc, jsonb_populate_recordset(null::stage_caf_availability_calc2, x) f;
UPDATE stage_caf_availability_calc2 SET date = DATE_TRUNC('minute', date);
INSERT INTO availability_calc_ii SELECT * from stage_caf_availability_calc2;

UPDATE cafayate.availability_calc SET irrad7 = irrad7.avg_val FROM (SELECT date, AVG(val) as avg_val FROM availability_calc_ii GROUP BY date) AS irrad7 WHERE cafayate.availability_calc.date=irrad7.date;
-------------------------------------9-------------------------------
DROP TABLE IF EXISTS availability_calc_ii;
CREATE TEMP TABLE availability_calc_ii(date timestamptz, val numeric);

DROP TABLE IF EXISTS stage_caf_availability_calc;
DROP TABLE IF EXISTS stage_caf_availability_calc2;
CREATE TEMP TABLE stage_caf_availability_calc(x jsonb);
CREATE TEMP TABLE stage_caf_availability_calc2(date timestamptz, val numeric);
COPY stage_caf_availability_calc FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/c5a4231a-8934-11e9-8620-42010afa015a/events?apiKey=e385a1a5-0441-4e06-be58-162731a7d4f9.01"';
INSERT INTO stage_caf_availability_calc2 select f.* from stage_caf_availability_calc, jsonb_populate_recordset(null::stage_caf_availability_calc2, x) f;
UPDATE stage_caf_availability_calc2 SET date = DATE_TRUNC('minute', date);
INSERT INTO availability_calc_ii SELECT * from stage_caf_availability_calc2;

DROP TABLE IF EXISTS stage_caf_availability_calc;
DROP TABLE IF EXISTS stage_caf_availability_calc2;
CREATE TEMP TABLE stage_caf_availability_calc(x jsonb);
CREATE TEMP TABLE stage_caf_availability_calc2(date timestamptz, val numeric);
COPY stage_caf_availability_calc FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/c5a4231a-8934-11e9-8620-42010afa015a/events?apiKey=e385a1a5-0441-4e06-be58-162731a7d4f9.01"';
INSERT INTO stage_caf_availability_calc2 select f.* from stage_caf_availability_calc, jsonb_populate_recordset(null::stage_caf_availability_calc2, x) f;
UPDATE stage_caf_availability_calc2 SET date = DATE_TRUNC('minute', date);
INSERT INTO availability_calc_ii SELECT * from stage_caf_availability_calc2;

UPDATE cafayate.availability_calc SET irrad9 = irrad9.avg_val FROM (SELECT date, AVG(val) as avg_val FROM availability_calc_ii GROUP BY date) AS irrad9 WHERE cafayate.availability_calc.date=irrad9.date;

------------------------COLUMNAS CALCULADAS----------------------------------

ALTER TABLE cafayate.availability_calc ADD COLUMN g_average numeric(10, 4);
ALTER TABLE cafayate.availability_calc ADD COLUMN g_max numeric(10, 4);
ALTER TABLE cafayate.availability_calc ADD COLUMN g_min numeric(10, 4);
ALTER TABLE cafayate.availability_calc ADD COLUMN max_diff decimal(5, 2);

UPDATE cafayate.availability_calc 
	SET g_average = g_average_calc.g_average
	FROM (SELECT date,
       (SELECT AVG(a)::numeric (10, 4)
        FROM   (VALUES(irrad4),
                      (irrad7),
                      (irrad9)) T (a)) AS g_average
FROM   cafayate.availability_calc ) AS g_average_calc WHERE g_average_calc.date=cafayate.availability_calc.date;

UPDATE cafayate.availability_calc 
	SET g_max = g_max_calc.g_max 
	FROM (SELECT date,
       (SELECT MAX(b)::numeric (10, 4)
        FROM   (VALUES(irrad4),
                      (irrad7),
                      (irrad9)) T (b)) AS g_max
FROM   cafayate.availability_calc ) AS g_max_calc WHERE g_max_calc.date=cafayate.availability_calc.date;

UPDATE cafayate.availability_calc 
	SET g_min = g_min_calc.g_min 
	FROM (SELECT date,
       (SELECT Min(c)::numeric (10, 4)
        FROM   (VALUES(irrad4),
                      (irrad7),
                      (irrad9)) T (c)) AS g_min
FROM   cafayate.availability_calc ) AS g_min_calc WHERE g_min_calc.date=cafayate.availability_calc.date;


UPDATE cafayate.availability_calc SET max_diff = max_diff_calc.max_diff FROM (SELECT date, ABS((g_max / COALESCE(NULLIF(g_min,0), 1))-1) AS max_diff FROM cafayate.availability_calc) AS max_diff_calc WHERE max_diff_calc.date=cafayate.availability_calc.date;

ALTER TABLE cafayate.availability_calc ADD COLUMN g_seleccionado numeric(10, 4);

UPDATE cafayate.availability_calc SET g_seleccionado = g_average WHERE max_diff <= 0.05;
UPDATE cafayate.availability_calc SET g_seleccionado = g_max WHERE max_diff > 0.05;

ALTER TABLE cafayate.availability_calc ADD COLUMN g_50_check integer;

UPDATE cafayate.availability_calc SET g_50_check = 1 WHERE g_seleccionado >= 50;
UPDATE cafayate.availability_calc SET g_50_check = 0 WHERE g_seleccionado < 50;

DROP TABLE IF EXISTS cafayate.availability_calc2;
CREATE TABLE cafayate.availability_calc2 AS SELECT * from cafayate.caf_potencia;

ALTER TABLE cafayate.availability_calc2 ADD COLUMN potencia_check integer; 

UPDATE cafayate.availability_calc2 SET potencia_check = 1 WHERE val > 0;
UPDATE cafayate.availability_calc2 SET potencia_check = 0 WHERE val <= 0;

ALTER TABLE cafayate.availability_calc2 ADD COLUMN irradiancia numeric; 
ALTER TABLE cafayate.availability_calc2 ADD COLUMN irradiancia_check numeric; 

UPDATE cafayate.availability_calc2 SET irradiancia = s.a FROM (SELECT date, g_seleccionado as a FROM cafayate.availability_calc) AS s WHERE availability_calc2.date = s.date;
UPDATE cafayate.availability_calc2 SET irradiancia_check = s.a FROM (SELECT date, g_50_check as a FROM cafayate.availability_calc) AS s WHERE availability_calc2.date = s.date;

ALTER TABLE cafayate.availability_calc2 ADD COLUMN producto_checks integer; 
UPDATE cafayate.availability_calc2 SET producto_checks = irradiancia_check * potencia_check;
------------------------------------
DELETE FROM cafayate.availability_calc2 WHERE date >= '2020-01-20 00:00:00-03' AND date < '2020-03-01 00:00:00-03';
INSERT INTO cafayate.availability_calc2 SELECT (date + interval '1 day') as date2, val, id, caf, potencia_check, irradiancia, irradiancia_check, producto_checks from cafayate.availability_calc2 WHERE date >= '2020-01-19 00:00:00-03' AND date < '2020-01-20 00:00:00-03' ;
INSERT INTO cafayate.availability_calc2 SELECT (date + interval '2 day') as date2, val, id, caf, potencia_check, irradiancia, irradiancia_check, producto_checks from cafayate.availability_calc2 WHERE date >= '2020-01-19 00:00:00-03' AND date < '2020-01-20 00:00:00-03' ;
INSERT INTO cafayate.availability_calc2 SELECT (date + interval '3 day') as date2, val, id, caf, potencia_check, irradiancia, irradiancia_check, producto_checks from cafayate.availability_calc2 WHERE date >= '2020-01-19 00:00:00-03' AND date < '2020-01-20 00:00:00-03' ;
INSERT INTO cafayate.availability_calc2 SELECT (date + interval '4 day') as date2, val, id, caf, potencia_check, irradiancia, irradiancia_check, producto_checks from cafayate.availability_calc2 WHERE date >= '2020-01-19 00:00:00-03' AND date < '2020-01-20 00:00:00-03' ;
INSERT INTO cafayate.availability_calc2 SELECT (date + interval '5 day') as date2, val, id, caf, potencia_check, irradiancia, irradiancia_check, producto_checks from cafayate.availability_calc2 WHERE date >= '2020-01-19 00:00:00-03' AND date < '2020-01-20 00:00:00-03' ;
INSERT INTO cafayate.availability_calc2 SELECT (date + interval '6 day') as date2, val, id, caf, potencia_check, irradiancia, irradiancia_check, producto_checks from cafayate.availability_calc2 WHERE date >= '2020-01-19 00:00:00-03' AND date < '2020-01-20 00:00:00-03' ;
INSERT INTO cafayate.availability_calc2 SELECT (date + interval '7 day') as date2, val, id, caf, potencia_check, irradiancia, irradiancia_check, producto_checks from cafayate.availability_calc2 WHERE date >= '2020-01-19 00:00:00-03' AND date < '2020-01-20 00:00:00-03' ;
INSERT INTO cafayate.availability_calc2 SELECT (date + interval '8 day') as date2, val, id, caf, potencia_check, irradiancia, irradiancia_check, producto_checks from cafayate.availability_calc2 WHERE date >= '2020-01-19 00:00:00-03' AND date < '2020-01-20 00:00:00-03' ;
INSERT INTO cafayate.availability_calc2 SELECT (date + interval '9 day') as date2, val, id, caf, potencia_check, irradiancia, irradiancia_check, producto_checks from cafayate.availability_calc2 WHERE date >= '2020-01-19 00:00:00-03' AND date < '2020-01-20 00:00:00-03' ;
INSERT INTO cafayate.availability_calc2 SELECT (date + interval '10 day') as date2, val, id, caf, potencia_check, irradiancia, irradiancia_check, producto_checks from cafayate.availability_calc2 WHERE date >= '2020-01-19 00:00:00-03' AND date < '2020-01-20 00:00:00-03' ;
INSERT INTO cafayate.availability_calc2 SELECT (date + interval '11 day') as date2, val, id, caf, potencia_check, irradiancia, irradiancia_check, producto_checks from cafayate.availability_calc2 WHERE date >= '2020-01-19 00:00:00-03' AND date < '2020-01-20 00:00:00-03' ;
INSERT INTO cafayate.availability_calc2 SELECT (date + interval '12 day') as date2, val, id, caf, potencia_check, irradiancia, irradiancia_check, producto_checks from cafayate.availability_calc2 WHERE date >= '2020-01-19 00:00:00-03' AND date < '2020-01-20 00:00:00-03' ;
INSERT INTO cafayate.availability_calc2 SELECT (date + interval '13 day') as date2, val, id, caf, potencia_check, irradiancia, irradiancia_check, producto_checks from cafayate.availability_calc2 WHERE date >= '2020-01-19 00:00:00-03' AND date < '2020-01-20 00:00:00-03' ;
INSERT INTO cafayate.availability_calc2 SELECT (date + interval '14 day') as date2, val, id, caf, potencia_check, irradiancia, irradiancia_check, producto_checks from cafayate.availability_calc2 WHERE date >= '2020-01-19 00:00:00-03' AND date < '2020-01-20 00:00:00-03' ;
INSERT INTO cafayate.availability_calc2 SELECT (date + interval '15 day') as date2, val, id, caf, potencia_check, irradiancia, irradiancia_check, producto_checks from cafayate.availability_calc2 WHERE date >= '2020-01-19 00:00:00-03' AND date < '2020-01-20 00:00:00-03' ;
INSERT INTO cafayate.availability_calc2 SELECT (date + interval '16 day') as date2, val, id, caf, potencia_check, irradiancia, irradiancia_check, producto_checks from cafayate.availability_calc2 WHERE date >= '2020-01-19 00:00:00-03' AND date < '2020-01-20 00:00:00-03' ;
INSERT INTO cafayate.availability_calc2 SELECT (date + interval '17 day') as date2, val, id, caf, potencia_check, irradiancia, irradiancia_check, producto_checks from cafayate.availability_calc2 WHERE date >= '2020-01-19 00:00:00-03' AND date < '2020-01-20 00:00:00-03' ;
INSERT INTO cafayate.availability_calc2 SELECT (date + interval '18 day') as date2, val, id, caf, potencia_check, irradiancia, irradiancia_check, producto_checks from cafayate.availability_calc2 WHERE date >= '2020-01-19 00:00:00-03' AND date < '2020-01-20 00:00:00-03' ;
INSERT INTO cafayate.availability_calc2 SELECT (date + interval '19 day') as date2, val, id, caf, potencia_check, irradiancia, irradiancia_check, producto_checks from cafayate.availability_calc2 WHERE date >= '2020-01-19 00:00:00-03' AND date < '2020-01-20 00:00:00-03' ;
INSERT INTO cafayate.availability_calc2 SELECT (date + interval '20 day') as date2, val, id, caf, potencia_check, irradiancia, irradiancia_check, producto_checks from cafayate.availability_calc2 WHERE date >= '2020-01-19 00:00:00-03' AND date < '2020-01-20 00:00:00-03' ;
INSERT INTO cafayate.availability_calc2 SELECT (date + interval '21 day') as date2, val, id, caf, potencia_check, irradiancia, irradiancia_check, producto_checks from cafayate.availability_calc2 WHERE date >= '2020-01-19 00:00:00-03' AND date < '2020-01-20 00:00:00-03' ;
INSERT INTO cafayate.availability_calc2 SELECT (date + interval '22 day') as date2, val, id, caf, potencia_check, irradiancia, irradiancia_check, producto_checks from cafayate.availability_calc2 WHERE date >= '2020-01-19 00:00:00-03' AND date < '2020-01-20 00:00:00-03' ;
INSERT INTO cafayate.availability_calc2 SELECT (date + interval '23 day') as date2, val, id, caf, potencia_check, irradiancia, irradiancia_check, producto_checks from cafayate.availability_calc2 WHERE date >= '2020-01-19 00:00:00-03' AND date < '2020-01-20 00:00:00-03' ;
INSERT INTO cafayate.availability_calc2 SELECT (date + interval '24 day') as date2, val, id, caf, potencia_check, irradiancia, irradiancia_check, producto_checks from cafayate.availability_calc2 WHERE date >= '2020-01-19 00:00:00-03' AND date < '2020-01-20 00:00:00-03' ;
INSERT INTO cafayate.availability_calc2 SELECT (date + interval '25 day') as date2, val, id, caf, potencia_check, irradiancia, irradiancia_check, producto_checks from cafayate.availability_calc2 WHERE date >= '2020-01-19 00:00:00-03' AND date < '2020-01-20 00:00:00-03' ;
INSERT INTO cafayate.availability_calc2 SELECT (date + interval '26 day') as date2, val, id, caf, potencia_check, irradiancia, irradiancia_check, producto_checks from cafayate.availability_calc2 WHERE date >= '2020-01-19 00:00:00-03' AND date < '2020-01-20 00:00:00-03' ;
INSERT INTO cafayate.availability_calc2 SELECT (date + interval '27 day') as date2, val, id, caf, potencia_check, irradiancia, irradiancia_check, producto_checks from cafayate.availability_calc2 WHERE date >= '2020-01-19 00:00:00-03' AND date < '2020-01-20 00:00:00-03' ;
INSERT INTO cafayate.availability_calc2 SELECT (date + interval '28 day') as date2, val, id, caf, potencia_check, irradiancia, irradiancia_check, producto_checks from cafayate.availability_calc2 WHERE date >= '2020-01-19 00:00:00-03' AND date < '2020-01-20 00:00:00-03' ;
INSERT INTO cafayate.availability_calc2 SELECT (date + interval '29 day') as date2, val, id, caf, potencia_check, irradiancia, irradiancia_check, producto_checks from cafayate.availability_calc2 WHERE date >= '2020-01-19 00:00:00-03' AND date < '2020-01-20 00:00:00-03' ;
INSERT INTO cafayate.availability_calc2 SELECT (date + interval '30 day') as date2, val, id, caf, potencia_check, irradiancia, irradiancia_check, producto_checks from cafayate.availability_calc2 WHERE date >= '2020-01-19 00:00:00-03' AND date < '2020-01-20 00:00:00-03' ;
INSERT INTO cafayate.availability_calc2 SELECT (date + interval '31 day') as date2, val, id, caf, potencia_check, irradiancia, irradiancia_check, producto_checks from cafayate.availability_calc2 WHERE date >= '2020-01-19 00:00:00-03' AND date < '2020-01-20 00:00:00-03' ;
INSERT INTO cafayate.availability_calc2 SELECT (date + interval '32 day') as date2, val, id, caf, potencia_check, irradiancia, irradiancia_check, producto_checks from cafayate.availability_calc2 WHERE date >= '2020-01-19 00:00:00-03' AND date < '2020-01-20 00:00:00-03' ;
INSERT INTO cafayate.availability_calc2 SELECT (date + interval '33 day') as date2, val, id, caf, potencia_check, irradiancia, irradiancia_check, producto_checks from cafayate.availability_calc2 WHERE date >= '2020-01-19 00:00:00-03' AND date < '2020-01-20 00:00:00-03' ;
INSERT INTO cafayate.availability_calc2 SELECT (date + interval '34 day') as date2, val, id, caf, potencia_check, irradiancia, irradiancia_check, producto_checks from cafayate.availability_calc2 WHERE date >= '2020-01-19 00:00:00-03' AND date < '2020-01-20 00:00:00-03' ;
INSERT INTO cafayate.availability_calc2 SELECT (date + interval '35 day') as date2, val, id, caf, potencia_check, irradiancia, irradiancia_check, producto_checks from cafayate.availability_calc2 WHERE date >= '2020-01-19 00:00:00-03' AND date < '2020-01-20 00:00:00-03' ;
INSERT INTO cafayate.availability_calc2 SELECT (date + interval '36 day') as date2, val, id, caf, potencia_check, irradiancia, irradiancia_check, producto_checks from cafayate.availability_calc2 WHERE date >= '2020-01-19 00:00:00-03' AND date < '2020-01-20 00:00:00-03' ;
INSERT INTO cafayate.availability_calc2 SELECT (date + interval '37 day') as date2, val, id, caf, potencia_check, irradiancia, irradiancia_check, producto_checks from cafayate.availability_calc2 WHERE date >= '2020-01-19 00:00:00-03' AND date < '2020-01-20 00:00:00-03' ;
INSERT INTO cafayate.availability_calc2 SELECT (date + interval '38 day') as date2, val, id, caf, potencia_check, irradiancia, irradiancia_check, producto_checks from cafayate.availability_calc2 WHERE date >= '2020-01-19 00:00:00-03' AND date < '2020-01-20 00:00:00-03' ;
INSERT INTO cafayate.availability_calc2 SELECT (date + interval '39 day') as date2, val, id, caf, potencia_check, irradiancia, irradiancia_check, producto_checks from cafayate.availability_calc2 WHERE date >= '2020-01-19 00:00:00-03' AND date < '2020-01-20 00:00:00-03' ;
INSERT INTO cafayate.availability_calc2 SELECT (date + interval '40 day') as date2, val, id, caf, potencia_check, irradiancia, irradiancia_check, producto_checks from cafayate.availability_calc2 WHERE date >= '2020-01-19 00:00:00-03' AND date < '2020-01-20 00:00:00-03' ;
INSERT INTO cafayate.availability_calc2 SELECT (date + interval '41 day') as date2, val, id, caf, potencia_check, irradiancia, irradiancia_check, producto_checks from cafayate.availability_calc2 WHERE date >= '2020-01-19 00:00:00-03' AND date < '2020-01-20 00:00:00-03' ;

UPDATE cafayate.availability_calc2 SET potencia_check = 0 WHERE date >= '2020-01-20 00:00:00-03' AND date < '2020-03-01 00:00:00-03';
UPDATE cafayate.availability_calc2 SET val = 0 WHERE date >= '2020-01-20 00:00:00-03' AND date < '2020-03-01 00:00:00-03';
UPDATE cafayate.availability_calc2 SET producto_checks = 0 WHERE date >= '2020-01-20 00:00:00-03' AND date < '2020-03-01 00:00:00-03';