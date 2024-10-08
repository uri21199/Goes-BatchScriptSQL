-- Elimina las tablas en caso de que existan y crea una nueva
DROP TABLE IF EXISTS cafayate.availability_calc;
DROP TABLE IF EXISTS availability_calc_ii;
CREATE TABLE cafayate.availability_calc(date timestamptz, irrad4 numeric (10, 4), irrad7 numeric (10, 4), irrad9 numeric (10, 4));
-- Inserta datos en la tabla availability_calc tomando marcas de tiempos a partir del 15-6-2019 cada 1 minuto
INSERT INTO cafayate.availability_calc SELECT x::timestamptz
FROM   generate_series(timestamp '2019-06-15 00:00'
                     , DATE_TRUNC('minute', now())
                     , interval  '1 min') t(x);


-------------------------------------4-------------------------------
-- Elimina la tabla en caso de que exista y crea una nueva
DROP TABLE IF EXISTS availability_calc_ii;
CREATE TEMP TABLE availability_calc_ii(date timestamptz, val numeric);
-- Elimiina las tablas en caso de que existan y crea una nueva
DROP TABLE IF EXISTS stage_caf_availability_calc;
DROP TABLE IF EXISTS stage_caf_availability_calc2;
CREATE TEMP TABLE stage_caf_availability_calc(x jsonb);
CREATE TEMP TABLE stage_caf_availability_calc2(date timestamptz, val numeric);
-- Carga en la tabla stage_caf_availability_calc los datos de la URL dada
COPY stage_caf_availability_calc FROM PROGRAM 'curl -H "Api-Key:e385a1a5-0441-4e06-be58-162731a7d4f9.01" "https://portal.unity.inaccess.com/ifms/sources/c59f858a-8934-11e9-8620-42010afa015a/events?&start_date=20190101T000000Z"';
-- Ingresa en la tabla stage_caf_availability_calc2 los datos de la subconsulta que se hace a la tabla stage_caf_availability_calc y actualiza la columna date
INSERT INTO stage_caf_availability_calc2 select f.* from stage_caf_availability_calc, jsonb_populate_recordset(null::stage_caf_availability_calc2, x) f;
UPDATE stage_caf_availability_calc2 SET date = DATE_TRUNC('minute', date);
INSERT INTO availability_calc_ii SELECT * from stage_caf_availability_calc2;
-- Elimina la tabla en caso de que exista y crea una nueva
DROP TABLE IF EXISTS stage_caf_availability_calc;
DROP TABLE IF EXISTS stage_caf_availability_calc2;
CREATE TEMP TABLE stage_caf_availability_calc(x jsonb);
CREATE TEMP TABLE stage_caf_availability_calc2(date timestamptz, val numeric);
-- Carga en la tabla stage_caf_availability_calc los datos de la URL dada
COPY stage_caf_availability_calc FROM PROGRAM 'curl -H "Api-Key:e385a1a5-0441-4e06-be58-162731a7d4f9.01" "https://portal.unity.inaccess.com/ifms/sources/c59f858a-8934-11e9-8620-42010afa015a/events?&start_date=20190101T000000Z"';
-- Ingresa en la tabla stage_caf_availability_calc2 los datos de la subconsulta que se hace a la tabla stage_caf_availability_calc y actualiza la columna date
INSERT INTO stage_caf_availability_calc2 select f.* from stage_caf_availability_calc, jsonb_populate_recordset(null::stage_caf_availability_calc2, x) f;
UPDATE stage_caf_availability_calc2 SET date = DATE_TRUNC('minute', date);
INSERT INTO availability_calc_ii SELECT * from stage_caf_availability_calc2;
-- Actualiza la columna irrad4 de la tabla availability_calc trayendo datos de la subconsulta availability_calc_ii
UPDATE cafayate.availability_calc SET irrad4 = irrad4.avg_val FROM (SELECT date, AVG(val) as avg_val FROM availability_calc_ii GROUP BY date) AS irrad4 WHERE cafayate.availability_calc.date=irrad4.date;
-------------------------------------7-------------------------------
-- Elimina la tabla en caso de que exista y crea una nueva temporal
DROP TABLE IF EXISTS availability_calc_ii;
CREATE TEMP TABLE availability_calc_ii(date timestamptz, val numeric);
-- Elimina las tablas en caso de que existan y crea unas nuevas temporales
DROP TABLE IF EXISTS stage_caf_availability_calc;
DROP TABLE IF EXISTS stage_caf_availability_calc2;
CREATE TEMP TABLE stage_caf_availability_calc(x jsonb);
CREATE TEMP TABLE stage_caf_availability_calc2(date timestamptz, val numeric);
-- Carga en la tabla stage_caf_availability_calc los datos de la URL dada
COPY stage_caf_availability_calc FROM PROGRAM 'curl -H "Api-Key:e385a1a5-0441-4e06-be58-162731a7d4f9.01" "https://portal.unity.inaccess.com/ifms/sources/c5a1d92a-8934-11e9-8620-42010afa015a/events?&start_date=20190101T000000Z"';
-- Ingresa en la tabla stage_caf_availability_calc2 los datos de la subconsulta que se hace a la tabla stage_caf_availability_calc y actualiza la columna date
INSERT INTO stage_caf_availability_calc2 select f.* from stage_caf_availability_calc, jsonb_populate_recordset(null::stage_caf_availability_calc2, x) f;
UPDATE stage_caf_availability_calc2 SET date = DATE_TRUNC('minute', date);
INSERT INTO availability_calc_ii SELECT * from stage_caf_availability_calc2;
-- Elimina las tablas en caso de que existan y crea unas nuevas temporales
DROP TABLE IF EXISTS stage_caf_availability_calc;
DROP TABLE IF EXISTS stage_caf_availability_calc2;
CREATE TEMP TABLE stage_caf_availability_calc(x jsonb);
CREATE TEMP TABLE stage_caf_availability_calc2(date timestamptz, val numeric);
-- Carga en la tabla stage_caf_availability_calc los datos de la URL dada
COPY stage_caf_availability_calc FROM PROGRAM 'curl -H "Api-Key:e385a1a5-0441-4e06-be58-162731a7d4f9.01" "https://portal.unity.inaccess.com/ifms/sources/c5a1d92a-8934-11e9-8620-42010afa015a/events?&start_date=20190101T000000Z"';
-- Ingresa en la tabla stage_caf_availability_calc2 los datos de la subconsulta que se hace a la tabla stage_caf_availability_calc y actualiza la columna date
INSERT INTO stage_caf_availability_calc2 select f.* from stage_caf_availability_calc, jsonb_populate_recordset(null::stage_caf_availability_calc2, x) f;
UPDATE stage_caf_availability_calc2 SET date = DATE_TRUNC('minute', date);
INSERT INTO availability_calc_ii SELECT * from stage_caf_availability_calc2;
-- Actualiza la columna irrad7 de la tabla availability_calc trayendo datos de la subconsulta availability_calc_ii
UPDATE cafayate.availability_calc SET irrad7 = irrad7.avg_val FROM (SELECT date, AVG(val) as avg_val FROM availability_calc_ii GROUP BY date) AS irrad7 WHERE cafayate.availability_calc.date=irrad7.date;
-------------------------------------9-------------------------------
-- Elimina la tabla en caso de que exista y crea una nueva temporal
DROP TABLE IF EXISTS availability_calc_ii;
CREATE TEMP TABLE availability_calc_ii(date timestamptz, val numeric);
-- Elimina las tablas en caso de que existan y crea unas nuevas temporales
DROP TABLE IF EXISTS stage_caf_availability_calc;
DROP TABLE IF EXISTS stage_caf_availability_calc2;
CREATE TEMP TABLE stage_caf_availability_calc(x jsonb);
CREATE TEMP TABLE stage_caf_availability_calc2(date timestamptz, val numeric);
-- Carga en la tabla stage_caf_availability_calc los datos de la URL dada
COPY stage_caf_availability_calc FROM PROGRAM 'curl -H "Api-Key:e385a1a5-0441-4e06-be58-162731a7d4f9.01" "https://portal.unity.inaccess.com/ifms/sources/c5a4231a-8934-11e9-8620-42010afa015a/events?&start_date=20190101T000000Z"';
-- Ingresa en la tabla stage_caf_availability_calc2 los datos de la subconsulta que se hace a la tabla stage_caf_availability_calc y actualiza la columna date
INSERT INTO stage_caf_availability_calc2 select f.* from stage_caf_availability_calc, jsonb_populate_recordset(null::stage_caf_availability_calc2, x) f;
UPDATE stage_caf_availability_calc2 SET date = DATE_TRUNC('minute', date);
INSERT INTO availability_calc_ii SELECT * from stage_caf_availability_calc2;
-- Elimina las tablas en caso de que existan y crea unas nuevas temporales
DROP TABLE IF EXISTS stage_caf_availability_calc;
DROP TABLE IF EXISTS stage_caf_availability_calc2;
CREATE TEMP TABLE stage_caf_availability_calc(x jsonb);
CREATE TEMP TABLE stage_caf_availability_calc2(date timestamptz, val numeric);
-- Carga en la tabla stage_caf_availability_calc los datos de la URL dada
COPY stage_caf_availability_calc FROM PROGRAM 'curl -H "Api-Key:e385a1a5-0441-4e06-be58-162731a7d4f9.01" "https://portal.unity.inaccess.com/ifms/sources/c5a4231a-8934-11e9-8620-42010afa015a/events?&start_date=20190101T000000Z"';
-- Ingresa en la tabla stage_caf_availability_calc2 los datos de la subconsulta que se hace a la tabla stage_caf_availability_calc y actualiza la columna date
INSERT INTO stage_caf_availability_calc2 select f.* from stage_caf_availability_calc, jsonb_populate_recordset(null::stage_caf_availability_calc2, x) f;
UPDATE stage_caf_availability_calc2 SET date = DATE_TRUNC('minute', date);
INSERT INTO availability_calc_ii SELECT * from stage_caf_availability_calc2;
-- Actualiza la columna irrad9 de la tabla availability_calc trayendo datos de la subconsulta availability_calc_ii
UPDATE cafayate.availability_calc SET irrad9 = irrad9.avg_val FROM (SELECT date, AVG(val) as avg_val FROM availability_calc_ii GROUP BY date) AS irrad9 WHERE cafayate.availability_calc.date=irrad9.date;

------------------------COLUMNAS CALCULADAS----------------------------------
-- Modificacion de columnas en la tabla vailability_calc 
ALTER TABLE cafayate.availability_calc ADD COLUMN g_average numeric(10, 4);
ALTER TABLE cafayate.availability_calc ADD COLUMN g_max numeric(10, 4);
ALTER TABLE cafayate.availability_calc ADD COLUMN g_min numeric(10, 4);
ALTER TABLE cafayate.availability_calc ADD COLUMN max_diff decimal(5, 2);
-- Actualizacion de g_average en la columna availability_calc a traves de una subconsulta en la misma tabla
UPDATE cafayate.availability_calc 
	SET g_average = g_average_calc.g_average
	FROM (SELECT date,
       (SELECT AVG(a)::numeric (10, 4)
        FROM   (VALUES(irrad4),
                      (irrad7),
                      (irrad9)) T (a)) AS g_average
FROM   cafayate.availability_calc ) AS g_average_calc WHERE g_average_calc.date=cafayate.availability_calc.date;
-- Actualizacion de g_max en la columna availability_calc a traves de una subconsulta en la misma tabla
UPDATE cafayate.availability_calc 
	SET g_max = g_max_calc.g_max 
	FROM (SELECT date,
       (SELECT MAX(b)::numeric (10, 4)
        FROM   (VALUES(irrad4),
                      (irrad7),
                      (irrad9)) T (b)) AS g_max
FROM   cafayate.availability_calc ) AS g_max_calc WHERE g_max_calc.date=cafayate.availability_calc.date;
-- Actualizacion de g_min en la columna availability_calc a traves de una subconsulta en la misma tabla
UPDATE cafayate.availability_calc 
	SET g_min = g_min_calc.g_min 
	FROM (SELECT date,
       (SELECT Min(c)::numeric (10, 4)
        FROM   (VALUES(irrad4),
                      (irrad7),
                      (irrad9)) T (c)) AS g_min
FROM   cafayate.availability_calc ) AS g_min_calc WHERE g_min_calc.date=cafayate.availability_calc.date;

-- Actualización de la columna max_diff en la tabla availability_calc: se calcula el valor absoluto de la diferencia relativa entre g_max y g_min (g_max dividido por g_min menos 1), y se asigna a la columna max_diff para cada fila donde coincida la fecha
UPDATE cafayate.availability_calc 
SET max_diff = max_diff_calc.max_diff 
FROM (
    SELECT date, 
           ABS((g_max / COALESCE(NULLIF(g_min, 0), 1)) - 1) AS max_diff 
    FROM cafayate.availability_calc
) AS max_diff_calc 
WHERE max_diff_calc.date = cafayate.availability_calc.date;

-- Son modificaciones a distintas columnas y agregado de columnas nuevas en la tabla availability_calc
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
-- Se elimina datos segun las condiciones en los WHERE
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