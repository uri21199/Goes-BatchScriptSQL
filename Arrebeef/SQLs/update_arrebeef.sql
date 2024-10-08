-----------------tables--------------------
-- Si  ya existe la tabla potencia, %_CH4 y temperatura en arrebeef las elimina para crear una nueva con las columnas VarName, TimeString, VarValue, Validity, Time_ms para cada tabla creada
DROP TABLE IF EXISTS arrebeef.potencia ;
CREATE TABLE arrebeef.potencia ("VarName" text, "TimeString" timestamptz, "VarValue" numeric, "Validity" text,"Time_ms" numeric);
DROP TABLE IF EXISTS arrebeef."%_CH4" ;
CREATE TABLE arrebeef."%_CH4" ("VarName" text, "TimeString" timestamptz, "VarValue" numeric, "Validity" text,"Time_ms" numeric);
DROP TABLE IF EXISTS arrebeef.temperatura ;
CREATE TABLE arrebeef.temperatura ("VarName" text, "TimeString" timestamptz, "VarValue" numeric, "Validity" text,"Time_ms" numeric);

------------------Imports------------------
-- Elimina la tabla tmp_potencia_test para crear una nueva de manera temporal
DROP TABLE IF EXISTS tmp_potencia_test ;
CREATE TEMP TABLE tmp_potencia_test AS TABLE arrebeef.potencia LIMIT 0;
-- Modifica la tabla temporal modificando el type de sus columnas
ALTER TABLE tmp_potencia_test
  ALTER "VarValue" TYPE text 
, ALTER "Time_ms"     TYPE text;
-- Carga un CSV a la tabla tmp_potencia_test
\copy tmp_potencia_test FROM 'C:\Users\Administrador\Desktop\Arrebeef\Scripts\Latest data\ArchivioPotenza.csv' WITH CSV HEADER DELIMITER ';'
-- Ingresa datos de la tabla temporal a la tabla potencia
INSERT INTO arrebeef.potencia ("VarName", "TimeString", "VarValue", "Validity","Time_ms") 
SELECT "VarName", "TimeString", replace("VarValue", ',', '.')::numeric, "Validity", replace("Time_ms", ',', '.')::numeric
FROM tmp_potencia_test;
-- Ingresa datos en la tabla 5min_database extraidos de la tabla potencia transformando los valores de la columna TimeString
INSERT INTO arrebeef."5min_database"("TimeString") SELECT (to_timestamp(ceiling(( extract ('epoch' from ("TimeString")) ) / (60*5) ) * (60*5))) AS "TimeString2" from arrebeef.potencia GROUP BY "TimeString2" ON CONFLICT ON CONSTRAINT uc_5min_database DO NOTHING;
-- Actualiza el campo Potencia de la tabla 5min_database segun un promedio de la columna VarValue para intervalos de 5 minutos de la tabla potencia
UPDATE arrebeef."5min_database" SET "Potencia" = average_5min_calc.average_5min 
	FROM (SELECT 
		(AVG("VarValue")::numeric (10,4)) AS average_5min, 
		(to_timestamp(ceiling(( extract ('epoch' from ("TimeString")) ) / (60*5) ) * (60*5))) AS date_5min
			from arrebeef.potencia GROUP BY date_5min) AS average_5min_calc WHERE average_5min_calc.date_5min = arrebeef."5min_database"."TimeString";
----------------------
-- Elimina la tabla tmp_%_CH4 y crea una temporal
DROP TABLE IF EXISTS "tmp_%_CH4" ;
CREATE TEMP TABLE "tmp_%_CH4" AS TABLE arrebeef."%_CH4" LIMIT 0;
-- Modifica los campos de la tabla temporal a tipo texto
ALTER TABLE "tmp_%_CH4"
  ALTER "VarValue" TYPE text
, ALTER "Time_ms"     TYPE text;
-- Copia los datos del CSV de la URL dada a la tabla temporal creada recien
\copy "tmp_%_CH4" FROM 'C:\Users\Administrador\Desktop\Arrebeef\Scripts\Latest data\ArchivioAIT06_01.csv' WITH CSV HEADER DELIMITER ';'
-- Ingresa datos de la tabla tmp_%_CH4 a la tabla original 
INSERT INTO arrebeef."%_CH4" 
	("VarName", "TimeString", "VarValue", "Validity","Time_ms") 
SELECT "VarName", "TimeString", replace("VarValue", ',', '.')::numeric, "Validity", replace("Time_ms", ',', '.')::numeric
FROM "tmp_%_CH4";
-- Ingresa datos en la tabla 5min_database extraidos de la tabla potencia transformando los valores de la columna TimeString
INSERT INTO arrebeef."5min_database"("TimeString") SELECT (to_timestamp(ceiling(( extract ('epoch' from ("TimeString")) ) / (60*5) ) * (60*5))) AS "TimeString2" from arrebeef."%_CH4" GROUP BY "TimeString2" ON CONFLICT ON CONSTRAINT uc_5min_database DO NOTHING;
-- Actualiza el campo %_CH4 de la tabla 5min_database segun un promedio de la columna VarValue para intervalos de 5 minutos de la tabla %_CH4
UPDATE arrebeef."5min_database" SET "%_CH4" = average_5min_calc.average_5min 
	FROM (SELECT 
		(AVG("VarValue")::numeric (10,4)) AS average_5min, 
		(to_timestamp(ceiling(( extract ('epoch' from ("TimeString")) ) / (60*5) ) * (60*5))) AS date_5min
			from arrebeef."%_CH4" GROUP BY date_5min) AS average_5min_calc WHERE average_5min_calc.date_5min = arrebeef."5min_database"."TimeString";
			
--------------------
-- Elimina la tabla tmp_temperatura si existe y crea una nueva
DROP TABLE IF EXISTS tmp_temperatura ;
CREATE TEMP TABLE tmp_temperatura AS TABLE arrebeef.temperatura LIMIT 0;
-- Actualiza las columnas a tipo text de la tabla temporal recien creada
ALTER TABLE tmp_temperatura
  ALTER "VarValue" TYPE text
, ALTER "Time_ms"     TYPE text;
-- Copia los datos del CSV de la URL dada a la tabla temporal creada recien
\copy tmp_temperatura FROM 'C:\Users\Administrador\Desktop\Arrebeef\Scripts\Latest data\ArchivioTT01_01C.csv' WITH CSV HEADER DELIMITER ';'
-- Ingresa datos de la tabla tmp_temperatura a la tabla original
INSERT INTO arrebeef.temperatura 
	("VarName", "TimeString", "VarValue", "Validity","Time_ms") 
SELECT "VarName", "TimeString", replace("VarValue", ',', '.')::numeric, "Validity", replace("Time_ms", ',', '.')::numeric
FROM tmp_temperatura;
-- Ingresa datos en la tabla 5min_database extraidos de la tabla temperatura transformando los valores de la columna TimeString
INSERT INTO arrebeef."5min_database"("TimeString") SELECT (to_timestamp(ceiling(( extract ('epoch' from ("TimeString")) ) / (60*5) ) * (60*5))) AS "TimeString2" from arrebeef.temperatura GROUP BY "TimeString2" ON CONFLICT ON CONSTRAINT uc_5min_database DO NOTHING;
-- Actualiza el campo Temperatura de la tabla 5min_database segun un promedio de la columna VarValue para intervalos de 5 minutos de la tabla temperatura
UPDATE arrebeef."5min_database" SET "Temperatura" = average_5min_calc.average_5min 
	FROM (SELECT 
		(AVG("VarValue")::numeric (10,4)) AS average_5min, 
		(to_timestamp(ceiling(( extract ('epoch' from ("TimeString")) ) / (60*5) ) * (60*5))) AS date_5min
			from arrebeef.temperatura GROUP BY date_5min) AS average_5min_calc WHERE average_5min_calc.date_5min = arrebeef."5min_database"."TimeString" ;


-----------------tables--------------------
-- Elimina las tablas mencionadas abajo en caso de que existan y crea nuevas tablas con las columnas VarName, TimeString, VarValue, Validity, Time_ms
DROP TABLE IF EXISTS arrebeef.caudal_rojo_a ;
CREATE TABLE arrebeef.caudal_rojo_a ("VarName" text, "TimeString" timestamptz, "VarValue" numeric, "Validity" text,"Time_ms" numeric);
DROP TABLE IF EXISTS arrebeef.caudal_rojo_b ;
CREATE TABLE arrebeef.caudal_rojo_b ("VarName" text, "TimeString" timestamptz, "VarValue" numeric, "Validity" text,"Time_ms" numeric);
DROP TABLE IF EXISTS arrebeef.caudal_verde_0202 ;
CREATE TABLE arrebeef.caudal_verde_0202 ("VarName" text, "TimeString" timestamptz, "VarValue" numeric, "Validity" text,"Time_ms" numeric);
DROP TABLE IF EXISTS arrebeef.caudal_verde_0205 ;
CREATE TABLE arrebeef.caudal_verde_0205 ("VarName" text, "TimeString" timestamptz, "VarValue" numeric, "Validity" text,"Time_ms" numeric);
DROP TABLE IF EXISTS arrebeef.caudal_amarillo ;
CREATE TABLE arrebeef.caudal_amarillo ("VarName" text, "TimeString" timestamptz, "VarValue" numeric, "Validity" text,"Time_ms" numeric);
DROP TABLE IF EXISTS arrebeef.caudal_verde_0201 ;
CREATE TABLE arrebeef.caudal_verde_0201 ("VarName" text, "TimeString" timestamptz, "VarValue" numeric, "Validity" text,"Time_ms" numeric);
DROP TABLE IF EXISTS arrebeef.caudal_verde_0203 ;
CREATE TABLE arrebeef.caudal_verde_0203 ("VarName" text, "TimeString" timestamptz, "VarValue" numeric, "Validity" text,"Time_ms" numeric);
DROP TABLE IF EXISTS arrebeef.caudal_separador ;
CREATE TABLE arrebeef.caudal_separador ("VarName" text, "TimeString" timestamptz, "VarValue" numeric, "Validity" text,"Time_ms" numeric);
------------------Imports------------------
-- Elimina la tabla tmp_caudal_rojo_a si existe y crea una nueva
DROP TABLE IF EXISTS tmp_caudal_rojo_a ;
CREATE TEMP TABLE tmp_caudal_rojo_a AS TABLE arrebeef.caudal_rojo_a LIMIT 0;
-- Actualiza las columnas a tipo text de la tabla temporal recien creada
ALTER TABLE tmp_caudal_rojo_a
  ALTER "VarValue" TYPE text 
, ALTER "Time_ms"     TYPE text;
-- Copia los datos del CSV de la URL dada a la tabla temporal creada recien
\copy tmp_caudal_rojo_a FROM 'C:\Users\Administrador\Desktop\Arrebeef\Scripts\Latest data\ArchivioFIT01_05A.csv' WITH CSV HEADER DELIMITER ';'
-- Ingresa datos de la tabla tmp_caudal_rojo_a a la tabla original
INSERT INTO arrebeef.caudal_rojo_a 
	("VarName", "TimeString", "VarValue", "Validity","Time_ms") 
SELECT "VarName", "TimeString", replace("VarValue", ',', '.')::numeric, 
							  "Validity"
							  , replace("Time_ms", ',', '.')::numeric
FROM tmp_caudal_rojo_a;
-- Ingresa datos en la tabla 5min_caudal extraidos de la tabla caudal_rojo_a transformando los valores de la columna TimeString
INSERT INTO arrebeef."5min_caudal"("VarName", "TimeString") SELECT "VarName", (to_timestamp(ceiling(( extract ('epoch' from ("TimeString")) ) / (60*5) ) * (60*5))) AS "TimeString2" from arrebeef.caudal_rojo_a GROUP BY "TimeString2", "VarName" ON CONFLICT DO NOTHING;
-- Actualiza el campo VarValue de la tabla 5min_caudal segun un promedio de la columna VarValue para intervalos de 5 minutos de la tabla caudal_rojo_a
UPDATE arrebeef."5min_caudal" SET "VarValue" = average_5min_calc.average_5min 
	FROM (SELECT 
		(AVG("VarValue")::numeric (10,4)) AS average_5min, 
		(to_timestamp(ceiling(( extract ('epoch' from ("TimeString")) ) / (60*5) ) * (60*5))) AS date_5min
			from arrebeef.caudal_rojo_a GROUP BY date_5min) AS average_5min_calc WHERE average_5min_calc.date_5min = arrebeef."5min_caudal"."TimeString" AND arrebeef."5min_caudal"."VarName" = 'DB_Misure_FIT 01.05A.Analogico.Output';
			
----------------------
-- Elimina la tabla tmp_caudal_rojo_b si existe y crea una nueva
DROP TABLE IF EXISTS tmp_caudal_rojo_b ;
CREATE TEMP TABLE tmp_caudal_rojo_b AS TABLE arrebeef.caudal_rojo_a LIMIT 0;
-- Actualiza las columnas a tipo text de la tabla temporal recien creada
ALTER TABLE tmp_caudal_rojo_b
  ALTER "VarValue" TYPE text 
, ALTER "Time_ms"     TYPE text;
-- Copia los datos del CSV de la URL dada a la tabla temporal creada recien
\copy tmp_caudal_rojo_b FROM 'C:\Users\Administrador\Desktop\Arrebeef\Scripts\Latest data\ArchivioFIT01_05B.csv' WITH CSV HEADER DELIMITER ';'
-- Ingresa datos de la tabla tmp_caudal_rojo_b a la tabla original
INSERT INTO arrebeef.caudal_rojo_b 
	("VarName", "TimeString", "VarValue", "Validity","Time_ms") 
SELECT "VarName", "TimeString", replace("VarValue", ',', '.')::numeric, 
							  "Validity"
							  , replace("Time_ms", ',', '.')::numeric
FROM tmp_caudal_rojo_b;
-- Ingresa datos en la tabla 5min_caudal extraidos de la tabla caudal_rojo_b transformando los valores de la columna TimeString
INSERT INTO arrebeef."5min_caudal"("VarName", "TimeString") SELECT "VarName", (to_timestamp(ceiling(( extract ('epoch' from ("TimeString")) ) / (60*5) ) * (60*5))) AS "TimeString2" from arrebeef.caudal_rojo_b GROUP BY "TimeString2", "VarName" ON CONFLICT DO NOTHING;
-- Actualiza el campo VarValue de la tabla 5min_caudal segun un promedio de la columna VarValue para intervalos de 5 minutos de la tabla caudal_rojo_b
UPDATE arrebeef."5min_caudal" SET "VarValue" = average_5min_calc.average_5min 
	FROM (SELECT 
		(AVG("VarValue")::numeric (10,4)) AS average_5min, 
		(to_timestamp(ceiling(( extract ('epoch' from ("TimeString")) ) / (60*5) ) * (60*5))) AS date_5min
			from arrebeef.caudal_rojo_b GROUP BY date_5min) AS average_5min_calc WHERE average_5min_calc.date_5min = arrebeef."5min_caudal"."TimeString" AND arrebeef."5min_caudal"."VarName" = 'DB_Misure_FIT 01.05B.Analogico.Output';
			
----------------------
-- Elimina la tabla tmp_caudal_verde_0202 si existe y crea una nueva
DROP TABLE IF EXISTS tmp_caudal_verde_0202 ;
CREATE TEMP TABLE tmp_caudal_verde_0202 AS TABLE arrebeef.caudal_verde_0202 LIMIT 0;
-- Actualiza las columnas a tipo text de la tabla temporal recien creada
ALTER TABLE tmp_caudal_verde_0202
  ALTER "VarValue" TYPE text 
, ALTER "Time_ms"     TYPE text;
-- Copia los datos del CSV de la URL dada a la tabla temporal creada recien
\copy tmp_caudal_verde_0202 FROM 'C:\Users\Administrador\Desktop\Arrebeef\Scripts\Latest data\ArchivioFIT02_02.csv' WITH CSV HEADER DELIMITER ';'
-- Ingresa datos de la tabla tmp_caudal_verde_0202 a la tabla original
INSERT INTO arrebeef.caudal_verde_0202 
	("VarName", "TimeString", "VarValue", "Validity","Time_ms") 
SELECT "VarName", "TimeString", replace("VarValue", ',', '.')::numeric, 
							  "Validity"
							  , replace("Time_ms", ',', '.')::numeric
FROM tmp_caudal_verde_0202;
-- Ingresa datos en la tabla 5min_caudal extraidos de la tabla caudal_verde_0202 transformando los valores de la columna TimeString
INSERT INTO arrebeef."5min_caudal"("VarName", "TimeString") SELECT "VarName", (to_timestamp(ceiling(( extract ('epoch' from ("TimeString")) ) / (60*5) ) * (60*5))) AS "TimeString2" from arrebeef.caudal_verde_0202 GROUP BY "TimeString2", "VarName" ON CONFLICT DO NOTHING;
-- Actualiza el campo VarValue de la tabla 5min_caudal segun un promedio de la columna VarValue para intervalos de 5 minutos de la tabla caudal_verde_0202
UPDATE arrebeef."5min_caudal" SET "VarValue" = average_5min_calc.average_5min 
	FROM (SELECT 
		(AVG("VarValue")::numeric (10,4)) AS average_5min, 
		(to_timestamp(ceiling(( extract ('epoch' from ("TimeString")) ) / (60*5) ) * (60*5))) AS date_5min
			from arrebeef.caudal_verde_0202 GROUP BY date_5min) AS average_5min_calc WHERE average_5min_calc.date_5min = arrebeef."5min_caudal"."TimeString" AND arrebeef."5min_caudal"."VarName" = 'DB_Misure_FIT 02.02.Analogico.Output';

----------------------
-- Elimina la tabla tmp_caudal_verde_0205 si existe y crea una nueva
DROP TABLE IF EXISTS tmp_caudal_verde_0205;
CREATE TEMP TABLE tmp_caudal_verde_0205 AS TABLE arrebeef.caudal_verde_0205 LIMIT 0;
-- Actualiza las columnas a tipo text de la tabla temporal recien creada
ALTER TABLE tmp_caudal_verde_0205
  ALTER "VarValue" TYPE text 
, ALTER "Time_ms"     TYPE text;
-- Copia los datos del CSV de la URL dada a la tabla temporal creada recien
\copy tmp_caudal_verde_0205 FROM 'C:\Users\Administrador\Desktop\Arrebeef\Scripts\Latest data\ArchivioFIT02_05.csv' WITH CSV HEADER DELIMITER ';'
-- Ingresa datos de la tabla tmp_caudal_verde_0205 a la tabla original
INSERT INTO arrebeef.caudal_verde_0205 
	("VarName", "TimeString", "VarValue", "Validity","Time_ms") 
SELECT "VarName", "TimeString", replace("VarValue", ',', '.')::numeric, 
							  "Validity"
							  , replace("Time_ms", ',', '.')::numeric
FROM tmp_caudal_verde_0205;
-- Ingresa datos en la tabla 5min_caudal extraidos de la tabla caudal_verde_0205 transformando los valores de la columna TimeString
INSERT INTO arrebeef."5min_caudal"("VarName", "TimeString") SELECT "VarName", (to_timestamp(ceiling(( extract ('epoch' from ("TimeString")) ) / (60*5) ) * (60*5))) AS "TimeString2" from arrebeef.caudal_verde_0205 GROUP BY "TimeString2", "VarName" ON CONFLICT DO NOTHING;
-- Actualiza el campo VarValue de la tabla 5min_caudal segun un promedio de la columna VarValue para intervalos de 5 minutos de la tabla caudal_verde_0205
UPDATE arrebeef."5min_caudal" SET "VarValue" = average_5min_calc.average_5min 
	FROM (SELECT 
		(AVG("VarValue")::numeric (10,4)) AS average_5min, 
		(to_timestamp(ceiling(( extract ('epoch' from ("TimeString")) ) / (60*5) ) * (60*5))) AS date_5min
			from arrebeef.caudal_verde_0205 GROUP BY date_5min) AS average_5min_calc WHERE average_5min_calc.date_5min = arrebeef."5min_caudal"."TimeString" AND arrebeef."5min_caudal"."VarName" = 'DB_Misure_FIT 02.05.Analogico.Output';

----------------------
-- Elimina la tabla tmp_caudal_amarillo si existe y crea una nueva
DROP TABLE IF EXISTS tmp_caudal_amarillo ;
CREATE TEMP TABLE tmp_caudal_amarillo AS TABLE arrebeef.caudal_verde_0202 LIMIT 0;
-- Actualiza las columnas a tipo text de la tabla temporal recien creada
ALTER TABLE tmp_caudal_amarillo
  ALTER "VarValue" TYPE text
, ALTER "Time_ms"     TYPE text;
-- Copia los datos del CSV de la URL dada a la tabla temporal creada recien
\copy tmp_caudal_amarillo FROM 'C:\Users\Administrador\Desktop\Arrebeef\Scripts\Latest data\ArchivioFIT06_01.csv' WITH CSV HEADER DELIMITER ';'
-- Ingresa datos de la tabla tmp_caudal_amarillo a la tabla original
INSERT INTO arrebeef.caudal_amarillo 
	("VarName", "TimeString", "VarValue", "Validity","Time_ms") 
SELECT "VarName", "TimeString", replace("VarValue", ',', '.')::numeric, 
							  "Validity"
							  , replace("Time_ms", ',', '.')::numeric
FROM tmp_caudal_amarillo;
-- Ingresa datos en la tabla 5min_caudal extraidos de la tabla caudal_amarillo transformando los valores de la columna TimeString
INSERT INTO arrebeef."5min_caudal"("VarName", "TimeString") SELECT "VarName", (to_timestamp(ceiling(( extract ('epoch' from ("TimeString")) ) / (60*5) ) * (60*5))) AS "TimeString2" from arrebeef.caudal_amarillo GROUP BY "TimeString2", "VarName" ON CONFLICT DO NOTHING;
-- Actualiza el campo VarValue de la tabla 5min_caudal segun un promedio de la columna VarValue para intervalos de 5 minutos de la tabla caudal_amarillo
UPDATE arrebeef."5min_caudal" SET "VarValue" = average_5min_calc.average_5min 
	FROM (SELECT 
		(AVG("VarValue")::numeric (10,4)) AS average_5min, 
		(to_timestamp(ceiling(( extract ('epoch' from ("TimeString")) ) / (60*5) ) * (60*5))) AS date_5min
			from arrebeef.caudal_amarillo GROUP BY date_5min) AS average_5min_calc WHERE average_5min_calc.date_5min = arrebeef."5min_caudal"."TimeString" AND arrebeef."5min_caudal"."VarName" = 'DB_Misure_FIT 06.01.Analogico.Output';

------------------------
-- Elimina la tabla caudal_grasa si existe y crea una nueva
DROP TABLE IF EXISTS arrebeef.caudal_grasa ;
CREATE TABLE arrebeef.caudal_grasa ("VarName" text, "TimeString" timestamptz, "VarValue" numeric, "Validity" text,"Time_ms" numeric);
-- Elimina la tabla tmp_caudal_grasa si existe y crea una temporal copiando a la tabla caudal_grasa
DROP TABLE IF EXISTS tmp_caudal_grasa ;
CREATE TEMP TABLE tmp_caudal_grasa AS TABLE arrebeef.caudal_grasa LIMIT 0;
-- Actualiza las columnas a tipo text de la tabla temporal recien creada
ALTER TABLE tmp_caudal_grasa
  ALTER "VarValue" TYPE text
, ALTER "Time_ms"     TYPE text;
-- Copia los datos del CSV de la URL dada a la tabla temporal creada recien
\copy tmp_caudal_grasa FROM 'C:\Users\Administrador\Desktop\Arrebeef\Scripts\Latest data\ArchivioFIT05_01.csv' WITH CSV HEADER DELIMITER ';'
-- Ingresa datos de la tabla tmp_caudal_grasa a la tabla original
INSERT INTO arrebeef.caudal_grasa  
	("VarName", "TimeString", "VarValue", "Validity","Time_ms") 
SELECT "VarName", "TimeString", replace("VarValue", ',', '.')::numeric, 
							  "Validity"
							  , replace("Time_ms", ',', '.')::numeric
FROM tmp_caudal_grasa;
-- Ingresa datos en la tabla 5min_caudal extraidos de la tabla caudal_grasa transformando los valores de la columna TimeString
INSERT INTO arrebeef."5min_caudal"("VarName", "TimeString") SELECT "VarName", (to_timestamp(ceiling(( extract ('epoch' from ("TimeString")) ) / (60*5) ) * (60*5))) AS "TimeString2" from arrebeef.caudal_grasa GROUP BY "TimeString2", "VarName" ON CONFLICT DO NOTHING;
-- Actualiza el campo VarValue de la tabla 5min_caudal segun un promedio de la columna VarValue para intervalos de 5 minutos de la tabla caudal_grasa
UPDATE arrebeef."5min_caudal" SET "VarValue" = average_5min_calc.average_5min 
	FROM (SELECT 
		(AVG("VarValue")::numeric (10,4)) AS average_5min, 
		(to_timestamp(ceiling(( extract ('epoch' from ("TimeString")) ) / (60*5) ) * (60*5))) AS date_5min
			from arrebeef.caudal_grasa GROUP BY date_5min) AS average_5min_calc WHERE average_5min_calc.date_5min = arrebeef."5min_caudal"."TimeString" AND arrebeef."5min_caudal"."VarName" = 'DB_Misure_FIT 05.01.Analogico.Output';
-------------------
-- Elimina la tabla tmp_caudal_separador si existe y crea una nueva
DROP TABLE IF EXISTS tmp_caudal_separador ;
CREATE TEMP TABLE tmp_caudal_separador AS TABLE arrebeef.caudal_separador LIMIT 0;
-- Actualiza las columnas a tipo text de la tabla temporal recien creada
ALTER TABLE tmp_caudal_separador
  ALTER "VarValue" TYPE text
, ALTER "Time_ms"     TYPE text;
-- Copia los datos del CSV de la URL dada a la tabla temporal creada recien
\copy tmp_caudal_separador FROM 'C:\Users\Administrador\Desktop\Arrebeef\Scripts\Latest data\ArchivioFIT08_01.csv' WITH CSV HEADER DELIMITER ';'
-- Ingresa datos de la tabla tmp_caudal_separador a la tabla original
INSERT INTO arrebeef.caudal_separador  
	("VarName", "TimeString", "VarValue", "Validity","Time_ms") 
SELECT "VarName", "TimeString", replace("VarValue", ',', '.')::numeric, 
							  "Validity"
							  , replace("Time_ms", ',', '.')::numeric
FROM tmp_caudal_separador;
-- Ingresa datos en la tabla 5min_caudal extraidos de la tabla caudal_separador transformando los valores de la columna TimeString
INSERT INTO arrebeef."5min_caudal"("VarName", "TimeString") SELECT "VarName", (to_timestamp(ceiling(( extract ('epoch' from ("TimeString")) ) / (60*5) ) * (60*5))) AS "TimeString2" from arrebeef.caudal_separador GROUP BY "TimeString2", "VarName" ON CONFLICT DO NOTHING;
-- Actualiza el campo VarValue de la tabla 5min_caudal segun un promedio de la columna VarValue para intervalos de 5 minutos de la tabla caudal_separador
UPDATE arrebeef."5min_caudal" SET "VarValue" = average_5min_calc.average_5min 
	FROM (SELECT 
		(AVG("VarValue")::numeric (10,4)) AS average_5min, 
		(to_timestamp(ceiling(( extract ('epoch' from ("TimeString")) ) / (60*5) ) * (60*5))) AS date_5min
			from arrebeef.caudal_separador GROUP BY date_5min) AS average_5min_calc WHERE average_5min_calc.date_5min = arrebeef."5min_caudal"."TimeString" AND arrebeef."5min_caudal"."VarName" = 'DB_Misure_FIT 08.01.Analogico.Output';
----------------------
-- Elimina la tabla tmp_caudal_verde_0201 si existe y crea una nueva
DROP TABLE IF EXISTS tmp_caudal_verde_0201 ;
CREATE TEMP TABLE tmp_caudal_verde_0201 AS TABLE arrebeef.caudal_verde_0201 LIMIT 0;
-- Actualiza las columnas a tipo text de la tabla temporal recien creada
ALTER TABLE tmp_caudal_verde_0201
  ALTER "VarValue" TYPE text 
, ALTER "Time_ms"     TYPE text;
-- Copia los datos del CSV de la URL dada a la tabla temporal creada recien
\copy tmp_caudal_verde_0201 FROM 'C:\Users\Administrador\Desktop\Arrebeef\Scripts\Latest data\ArchivioFIT02_03.csv' WITH CSV HEADER DELIMITER ';'
-- Ingresa datos de la tabla tmp_caudal_verde_0201 a la tabla original
INSERT INTO arrebeef.caudal_verde_0201 
	("VarName", "TimeString", "VarValue", "Validity","Time_ms") 
SELECT "VarName", "TimeString", replace("VarValue", ',', '.')::numeric, 
							  "Validity"
							  , replace("Time_ms", ',', '.')::numeric
FROM tmp_caudal_verde_0201;
-- Ingresa datos en la tabla 5min_caudal extraidos de la tabla caudal_verde_0201 transformando los valores de la columna TimeString
INSERT INTO arrebeef."5min_caudal"("VarName", "TimeString") SELECT "VarName", (to_timestamp(ceiling(( extract ('epoch' from ("TimeString")) ) / (60*5) ) * (60*5))) AS "TimeString2" from arrebeef.caudal_verde_0201 GROUP BY "TimeString2", "VarName" ON CONFLICT DO NOTHING;
-- Actualiza el campo VarValue de la tabla 5min_caudal segun un promedio de la columna VarValue para intervalos de 5 minutos de la tabla caudal_verde_0201
UPDATE arrebeef."5min_caudal" SET "VarValue" = average_5min_calc.average_5min 
	FROM (SELECT 
		(AVG("VarValue")::numeric (10,4)) AS average_5min, 
		(to_timestamp(ceiling(( extract ('epoch' from ("TimeString")) ) / (60*5) ) * (60*5))) AS date_5min
			from arrebeef.caudal_verde_0201 GROUP BY date_5min) AS average_5min_calc WHERE average_5min_calc.date_5min = arrebeef."5min_caudal"."TimeString" AND arrebeef."5min_caudal"."VarName" = 'DB_Misure_FIT 02.01.Analogico.Output';
----------------------
-- Elimina la tabla tmp_caudal_verde_0203 si existe y crea una nueva
DROP TABLE IF EXISTS tmp_caudal_verde_0203 ;
CREATE TEMP TABLE tmp_caudal_verde_0203 AS TABLE arrebeef.caudal_verde_0203 LIMIT 0;
-- Actualiza las columnas a tipo text de la tabla temporal recien creada
ALTER TABLE tmp_caudal_verde_0203
  ALTER "VarValue" TYPE text 
, ALTER "Time_ms"     TYPE text;
-- Copia los datos del CSV de la URL dada a la tabla temporal creada recien
\copy tmp_caudal_verde_0203 FROM 'C:\Users\Administrador\Desktop\Arrebeef\Scripts\Latest data\ArchivioFIT02_03.csv' WITH CSV HEADER DELIMITER ';'
-- Ingresa datos de la tabla tmp_caudal_verde_0203 a la tabla original
INSERT INTO arrebeef.caudal_verde_0203 
	("VarName", "TimeString", "VarValue", "Validity","Time_ms") 
SELECT "VarName", "TimeString", replace("VarValue", ',', '.')::numeric, 
							  "Validity"
							  , replace("Time_ms", ',', '.')::numeric
FROM tmp_caudal_verde_0203;
-- Ingresa datos en la tabla 5min_caudal extraidos de la tabla caudal_verde_0203 transformando los valores de la columna TimeString
INSERT INTO arrebeef."5min_caudal"("VarName", "TimeString") SELECT "VarName", (to_timestamp(ceiling(( extract ('epoch' from ("TimeString")) ) / (60*5) ) * (60*5))) AS "TimeString2" from arrebeef.caudal_verde_0203 GROUP BY "TimeString2", "VarName" ON CONFLICT DO NOTHING;
-- Actualiza el campo VarValue de la tabla 5min_caudal segun un promedio de la columna VarValue para intervalos de 5 minutos de la tabla caudal_verde_0203
UPDATE arrebeef."5min_caudal" SET "VarValue" = average_5min_calc.average_5min 
	FROM (SELECT 
		(AVG("VarValue")::numeric (10,4)) AS average_5min, 
		(to_timestamp(ceiling(( extract ('epoch' from ("TimeString")) ) / (60*5) ) * (60*5))) AS date_5min
			from arrebeef.caudal_verde_0203 GROUP BY date_5min) AS average_5min_calc WHERE average_5min_calc.date_5min = arrebeef."5min_caudal"."TimeString" AND arrebeef."5min_caudal"."VarName" = 'DB_Misure_FIT 02.03.Analogico.Output';
