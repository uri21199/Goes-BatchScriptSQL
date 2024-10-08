-- Elimina las tablas en caso de que existan
DROP TABLE IF EXISTS stageb;
DROP TABLE IF EXISTS stageb2;
DELETE FROM hiCAU2 WHERE date >= now() - interval '3 days';
DELETE FROM iiCAU2_ WHERE date >= now() - interval '3 days';

--------------------hiCAU2_WS_B08------------------------
-- Crea tablas temporales
CREATE TEMP TABLE stageb(x jsonb);
CREATE TEMP TABLE stageb2(date timestamptz, val numeric, id text);
Do $$ 
-- Declara las variables startdate y starttime
declare startdate text := to_char(current_date - 3, 'YYYYMMDD'); 
-- Se genera un bloque de codigo para cargar datos en stage_caf_potencia_72hs desde la url dada
Begin EXECUTE format('COPY stageb FROM PROGRAM ''curl -H "Api-Key:38deaa51-8716-4cc9-aa42-ab14fb72a752.01" "https://portal.unity.inaccess.com/ifms/sources/bdab1500-07ec-11eb-8a43-42010afa015a/events?&start_date=%sT000000Z"''',startdate);
End$$ ;
-- Se cargan campos dentro stage_caf_potencia_72hs2 que vienen de una subconsulta a stage_caf_potencia_72hs y a la vez se actualizacion campos
INSERT INTO stageb2 select f.* from stageb, jsonb_populate_recordset(null::stageb2, x) f;
UPDATE stageb2 SET id = 'hiCAU2_WS_B08';
UPDATE stageb2 SET date = DATE_TRUNC('minute', date);
INSERT INTO hiCAU2 SELECT * from stageb2 WHERE date >= now() - interval '3 days';
DROP TABLE IF EXISTS stageb;
DROP TABLE IF EXISTS stageb2;

------------------------hiCAU2_WS_B30--------------------
-- Crea tablas temporales
CREATE TEMP TABLE stageb(x jsonb);
CREATE TEMP TABLE stageb2(date timestamptz, val numeric, id text);
Do $$ 
-- Declara las variables startdate y starttime
declare startdate text := to_char(current_date - 3, 'YYYYMMDD'); 
-- Se genera un bloque de codigo para cargar datos en stage_caf_potencia_72hs desde la url dada
Begin EXECUTE format('COPY stageb FROM PROGRAM ''curl -H "Api-Key:38deaa51-8716-4cc9-aa42-ab14fb72a752.01" "https://portal.unity.inaccess.com/ifms/sources/bdea50c6-07ec-11eb-8a43-42010afa015a/events?&start_date=%sT000000Z"''',startdate);
End$$ ;
-- Se cargan campos dentro stage_caf_potencia_72hs2 que vienen de una subconsulta a stage_caf_potencia_72hs y a la vez se actualizacion campos
INSERT INTO stageb2 select f.* from stageb, jsonb_populate_recordset(null::stageb2, x) f;
UPDATE stageb2 SET id = 'hiCAU2_WS_B30';
UPDATE stageb2 SET date = DATE_TRUNC('minute', date);
INSERT INTO hiCAU2 SELECT * from stageb2 WHERE date >= now() - interval '3 days';
DROP TABLE IF EXISTS stageb;
DROP TABLE IF EXISTS stageb2;

-----------------------hiCAU2_WS_B35---------------------
-- Crea tablas temporales
CREATE TEMP TABLE stageb(x jsonb);
CREATE TEMP TABLE stageb2(date timestamptz, val numeric, id text);
Do $$ 
-- Declara las variables startdate y starttime
declare startdate text := to_char(current_date - 3, 'YYYYMMDD'); 
-- Se genera un bloque de codigo para cargar datos en stage_caf_potencia_72hs desde la url dada
Begin EXECUTE format('COPY stageb FROM PROGRAM ''curl -H "Api-Key:38deaa51-8716-4cc9-aa42-ab14fb72a752.01" "https://portal.unity.inaccess.com/ifms/sources/be29dc0a-07ec-11eb-8a43-42010afa015a/events?&start_date=%sT000000Z"''',startdate);
End$$ ;
-- Se cargan campos dentro stage_caf_potencia_72hs2 que vienen de una subconsulta a stage_caf_potencia_72hs y a la vez se actualizacion campos
INSERT INTO stageb2 select f.* from stageb, jsonb_populate_recordset(null::stageb2, x) f;
UPDATE stageb2 SET id = 'hiCAU2_WS_B35';
UPDATE stageb2 SET date = DATE_TRUNC('minute', date);
INSERT INTO hiCAU2 SELECT * from stageb2 WHERE date >= now() - interval '3 days';
DROP TABLE IF EXISTS stageb;
DROP TABLE IF EXISTS stageb2;

------------------iiCAU2_WS_B08_1----------------------------
-- Crea tablas temporales
CREATE TEMP TABLE stageb(x jsonb);
CREATE TEMP TABLE stageb2(date timestamptz, val numeric, id text);
Do $$ 
-- Declara las variables startdate y starttime
declare startdate text := to_char(current_date - 3, 'YYYYMMDD'); 
-- Se genera un bloque de codigo para cargar datos en stage_caf_potencia_72hs desde la url dada
Begin EXECUTE format('COPY stageb FROM PROGRAM ''curl -H "Api-Key:38deaa51-8716-4cc9-aa42-ab14fb72a752.01" "https://portal.unity.inaccess.com/ifms/sources/bcbad996-07ec-11eb-8a43-42010afa015a/events?&start_date=%sT000000Z"''',startdate);
End$$ ;
-- Se cargan campos dentro stage_caf_potencia_72hs2 que vienen de una subconsulta a stage_caf_potencia_72hs y a la vez se actualizacion campos
INSERT INTO stageb2 select f.* from stageb, jsonb_populate_recordset(null::stageb2, x) f;
UPDATE stageb2 SET id = 'iiCAU2_WS_B08_1';
UPDATE stageb2 SET date = DATE_TRUNC('minute', date);
INSERT INTO iiCAU2_ SELECT * from stageb2 WHERE date >= now() - interval '3 days';
DROP TABLE IF EXISTS stageb;
DROP TABLE IF EXISTS stageb2;

------------------iiCAU2_WS_B08_2----------------------------
-- Crea tablas temporales
CREATE TEMP TABLE stageb(x jsonb);
CREATE TEMP TABLE stageb2(date timestamptz, val numeric, id text);
Do $$ 
-- Declara las variables startdate y starttime
declare startdate text := to_char(current_date - 3, 'YYYYMMDD'); 
-- Se genera un bloque de codigo para cargar datos en stage_caf_potencia_72hs desde la url dada
Begin EXECUTE format('COPY stageb FROM PROGRAM ''curl -H "Api-Key:38deaa51-8716-4cc9-aa42-ab14fb72a752.01" "https://portal.unity.inaccess.com/ifms/sources/bcb5f80e-07ec-11eb-8a43-42010afa015a/events?&start_date=%sT000000Z"''',startdate);
End$$ ;
-- Se cargan campos dentro stage_caf_potencia_72hs2 que vienen de una subconsulta a stage_caf_potencia_72hs y a la vez se actualizacion campos
INSERT INTO stageb2 select f.* from stageb, jsonb_populate_recordset(null::stageb2, x) f;
UPDATE stageb2 SET id = 'iiCAU2_WS_B08_2';
UPDATE stageb2 SET date = DATE_TRUNC('minute', date);
INSERT INTO iiCAU2_ SELECT * from stageb2 WHERE date >= now() - interval '3 days';
DROP TABLE IF EXISTS stageb;
DROP TABLE IF EXISTS stageb2;

------------------iiCAU2_WS_B30_1----------------------------
-- Crea tablas temporales
CREATE TEMP TABLE stageb(x jsonb);
CREATE TEMP TABLE stageb2(date timestamptz, val numeric, id text);
Do $$ 
-- Declara las variables startdate y starttime
declare startdate text := to_char(current_date - 3, 'YYYYMMDD'); 
-- Se genera un bloque de codigo para cargar datos en stage_caf_potencia_72hs desde la url dada
Begin EXECUTE format('COPY stageb FROM PROGRAM ''curl -H "Api-Key:38deaa51-8716-4cc9-aa42-ab14fb72a752.01" "https://portal.unity.inaccess.com/ifms/sources/bcf43eca-07ec-11eb-8a43-42010afa015a/events?&start_date=%sT000000Z"''',startdate);
End$$ ;
-- Se cargan campos dentro stage_caf_potencia_72hs2 que vienen de una subconsulta a stage_caf_potencia_72hs y a la vez se actualizacion campos
INSERT INTO stageb2 select f.* from stageb, jsonb_populate_recordset(null::stageb2, x) f;
UPDATE stageb2 SET id = 'iiCAU2_WS_B30_1';
UPDATE stageb2 SET date = DATE_TRUNC('minute', date);
INSERT INTO iiCAU2_ SELECT * from stageb2 WHERE date >= now() - interval '3 days';
DROP TABLE IF EXISTS stageb;
DROP TABLE IF EXISTS stageb2;

------------------iiCAU2_WS_B30_2----------------------------
-- Crea tablas temporales
CREATE TEMP TABLE stageb(x jsonb);
CREATE TEMP TABLE stageb2(date timestamptz, val numeric, id text);
Do $$ 
-- Declara las variables startdate y starttime
declare startdate text := to_char(current_date - 3, 'YYYYMMDD'); 
-- Se genera un bloque de codigo para cargar datos en stage_caf_potencia_72hs desde la url dada
Begin EXECUTE format('COPY stageb FROM PROGRAM ''curl -H "Api-Key:38deaa51-8716-4cc9-aa42-ab14fb72a752.01" "https://portal.unity.inaccess.com/ifms/sources/bcef9b2c-07ec-11eb-8a43-42010afa015a/events?&start_date=%sT000000Z"''',startdate);
End$$ ;
-- Se cargan campos dentro stage_caf_potencia_72hs2 que vienen de una subconsulta a stage_caf_potencia_72hs y a la vez se actualizacion campos
INSERT INTO stageb2 select f.* from stageb, jsonb_populate_recordset(null::stageb2, x) f;
UPDATE stageb2 SET id = 'iiCAU2_WS_B30_2';
UPDATE stageb2 SET date = DATE_TRUNC('minute', date);
INSERT INTO iiCAU2_ SELECT * from stageb2 WHERE date >= now() - interval '3 days';
DROP TABLE IF EXISTS stageb;
DROP TABLE IF EXISTS stageb2;

------------------iiCAU2_WS_B35_1----------------------------
-- Crea tablas temporales
CREATE TEMP TABLE stageb(x jsonb);
CREATE TEMP TABLE stageb2(date timestamptz, val numeric, id text);
Do $$ 
-- Declara las variables startdate y starttime
declare startdate text := to_char(current_date - 3, 'YYYYMMDD'); 
-- Se genera un bloque de codigo para cargar datos en stage_caf_potencia_72hs desde la url dada
Begin EXECUTE format('COPY stageb FROM PROGRAM ''curl -H "Api-Key:38deaa51-8716-4cc9-aa42-ab14fb72a752.01" "https://portal.unity.inaccess.com/ifms/sources/bd2e1ee2-07ec-11eb-8a43-42010afa015a/events?&start_date=%sT000000Z"''',startdate);
End$$ ;
-- Se cargan campos dentro stage_caf_potencia_72hs2 que vienen de una subconsulta a stage_caf_potencia_72hs y a la vez se actualizacion campos
INSERT INTO stageb2 select f.* from stageb, jsonb_populate_recordset(null::stageb2, x) f;
UPDATE stageb2 SET id = 'iiCAU2_WS_B35_1';
UPDATE stageb2 SET date = DATE_TRUNC('minute', date);
INSERT INTO iiCAU2_ SELECT * from stageb2 WHERE date >= now() - interval '3 days';
DROP TABLE IF EXISTS stageb;
DROP TABLE IF EXISTS stageb2;

------------------iiCAU2_WS_B35_2----------------------------
-- Crea tablas temporales
CREATE TEMP TABLE stageb(x jsonb);
CREATE TEMP TABLE stageb2(date timestamptz, val numeric, id text);
Do $$ 
-- Declara las variables startdate y starttime
declare startdate text := to_char(current_date - 3, 'YYYYMMDD'); 
-- Se genera un bloque de codigo para cargar datos en stage_caf_potencia_72hs desde la url dada
Begin EXECUTE format('COPY stageb FROM PROGRAM ''curl -H "Api-Key:38deaa51-8716-4cc9-aa42-ab14fb72a752.01" "https://portal.unity.inaccess.com/ifms/sources/bd2936ca-07ec-11eb-8a43-42010afa015a/events?&start_date=%sT000000Z"''',startdate);
End$$ ;
-- Se cargan campos dentro stage_caf_potencia_72hs2 que vienen de una subconsulta a stage_caf_potencia_72hs y a la vez se actualizacion campos
INSERT INTO stageb2 select f.* from stageb, jsonb_populate_recordset(null::stageb2, x) f;
UPDATE stageb2 SET id = 'iiCAU2_WS_B35_2';
UPDATE stageb2 SET date = DATE_TRUNC('minute', date);
INSERT INTO iiCAU2_ SELECT * from stageb2 WHERE date >= now() - interval '3 days';
DROP TABLE IF EXISTS stageb;
DROP TABLE IF EXISTS stageb2;