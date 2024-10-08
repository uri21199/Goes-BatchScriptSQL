-- Elimina las tablas en caso de que existan
DROP TABLE IF EXISTS stagec;
DROP TABLE IF EXISTS stagec2;
DELETE FROM hiCAU3 WHERE date >= now() - interval '3 days';
DELETE FROM iiCAU3_ WHERE date >= now() - interval '3 days';

--------------------hiCAU3_WS_C08------------------------
-- Crea tablas temporales
CREATE TEMP TABLE stagec(x jsonb);
CREATE TEMP TABLE stagec2(date timestamptz, val numeric, id text);
Do $$ 
-- Declara las variables startdate y starttime
declare startdate text := to_char(current_date - 3, 'YYYYMMDD'); 
-- Se genera un bloque de codigo para cargar datos en stage_caf_potencia_72hs desde la url dada
Begin EXECUTE format('COPY stagec FROM PROGRAM ''curl -H "Api-Key:38deaa51-8716-4cc9-aa42-ab14fb72a752.01" "https://portal.unity.inaccess.com/ifms/sources/12e18dd8-07ed-11eb-8564-42010afa015a/events?&start_date=%sT000000Z"''',startdate);
End$$ ;
-- Se cargan campos dentro stage_caf_potencia_72hs2 que vienen de una subconsulta a stage_caf_potencia_72hs y a la vez se actualizacion campos
INSERT INTO stagec2 select f.* from stagec, jsonb_populate_recordset(null::stagec2, x) f;
UPDATE stagec2 SET id = 'hiCAU3_WS_C08';
UPDATE stagec2 SET date = DATE_TRUNC('minute', date);
INSERT INTO hiCAU3 SELECT * from stagec2 WHERE date >= now() - interval '3 days';
DROP TABLE IF EXISTS stagec;
DROP TABLE IF EXISTS stagec2;

------------------------hiCAU3_WS_C11--------------------
-- Crea tablas temporales
CREATE TEMP TABLE stagec(x jsonb);
CREATE TEMP TABLE stagec2(date timestamptz, val numeric, id text);
Do $$ 
-- Declara las variables startdate y starttime
declare startdate text := to_char(current_date - 3, 'YYYYMMDD'); 
-- Se genera un bloque de codigo para cargar datos en stage_caf_potencia_72hs desde la url dada
Begin EXECUTE format('COPY stagec FROM PROGRAM ''curl -H "Api-Key:38deaa51-8716-4cc9-aa42-ab14fb72a752.01" "https://portal.unity.inaccess.com/ifms/sources/132016fc-07ed-11eb-8564-42010afa015a/events?&start_date=%sT000000Z"''',startdate);
End$$ ;
-- Se cargan campos dentro stage_caf_potencia_72hs2 que vienen de una subconsulta a stage_caf_potencia_72hs y a la vez se actualizacion campos
INSERT INTO stagec2 select f.* from stagec, jsonb_populate_recordset(null::stagec2, x) f;
UPDATE stagec2 SET id = 'hiCAU3_WS_C11';
UPDATE stagec2 SET date = DATE_TRUNC('minute', date);
INSERT INTO hiCAU3 SELECT * from stagec2 WHERE date >= now() - interval '3 days';
DROP TABLE IF EXISTS stagec;
DROP TABLE IF EXISTS stagec2;

-----------------------hiCAU3_WS_C29---------------------
-- Crea tablas temporales
CREATE TEMP TABLE stagec(x jsonb);
CREATE TEMP TABLE stagec2(date timestamptz, val numeric, id text);
Do $$ 
-- Declara las variables startdate y starttime
declare startdate text := to_char(current_date - 3, 'YYYYMMDD'); 
-- Se genera un bloque de codigo para cargar datos en stage_caf_potencia_72hs desde la url dada
Begin EXECUTE format('COPY stagec FROM PROGRAM ''curl -H "Api-Key:38deaa51-8716-4cc9-aa42-ab14fb72a752.01" "https://portal.unity.inaccess.com/ifms/sources/135dca4c-07ed-11eb-8564-42010afa015a/events?&start_date=%sT000000Z"''',startdate);
End$$ ;
-- Se cargan campos dentro stage_caf_potencia_72hs2 que vienen de una subconsulta a stage_caf_potencia_72hs y a la vez se actualizacion campos
INSERT INTO stagec2 select f.* from stagec, jsonb_populate_recordset(null::stagec2, x) f;
UPDATE stagec2 SET id = 'hiCAU3_WS_C29';
UPDATE stagec2 SET date = DATE_TRUNC('minute', date);
INSERT INTO hiCAU3 SELECT * from stagec2 WHERE date >= now() - interval '3 days';
DROP TABLE IF EXISTS stagec;
DROP TABLE IF EXISTS stagec2;

------------------iiCAU3_WS_C08_1----------------------------
-- Crea tablas temporales
CREATE TEMP TABLE stagec(x jsonb);
CREATE TEMP TABLE stagec2(date timestamptz, val numeric, id text);
Do $$ 
-- Declara las variables startdate y starttime
declare startdate text := to_char(current_date - 3, 'YYYYMMDD'); 
-- Se genera un bloque de codigo para cargar datos en stage_caf_potencia_72hs desde la url dada
Begin EXECUTE format('COPY stagec FROM PROGRAM ''curl -H "Api-Key:38deaa51-8716-4cc9-aa42-ab14fb72a752.01" "https://portal.unity.inaccess.com/ifms/sources/11ecfa70-07ed-11eb-8564-42010afa015a/events?&start_date=%sT000000Z"''',startdate);
End$$ ;
-- Se cargan campos dentro stage_caf_potencia_72hs2 que vienen de una subconsulta a stage_caf_potencia_72hs y a la vez se actualizacion campos
INSERT INTO stagec2 select f.* from stagec, jsonb_populate_recordset(null::stagec2, x) f;
UPDATE stagec2 SET id = 'iiCAU3_WS_C08_1';
UPDATE stagec2 SET date = DATE_TRUNC('minute', date);
INSERT INTO iiCAU3_ SELECT * from stagec2 WHERE date >= now() - interval '3 days';
DROP TABLE IF EXISTS stagec;
DROP TABLE IF EXISTS stagec2;

------------------iiCAU3_WS_C08_2----------------------------
-- Crea tablas temporales
CREATE TEMP TABLE stagec(x jsonb);
CREATE TEMP TABLE stagec2(date timestamptz, val numeric, id text);
Do $$ 
-- Declara las variables startdate y starttime
declare startdate text := to_char(current_date - 3, 'YYYYMMDD'); 
-- Se genera un bloque de codigo para cargar datos en stage_caf_potencia_72hs desde la url dada
Begin EXECUTE format('COPY stagec FROM PROGRAM ''curl -H "Api-Key:38deaa51-8716-4cc9-aa42-ab14fb72a752.01" "https://portal.unity.inaccess.com/ifms/sources/11e80718-07ed-11eb-8564-42010afa015a/events?&start_date=%sT000000Z"''',startdate);
End$$ ;
-- Se cargan campos dentro stage_caf_potencia_72hs2 que vienen de una subconsulta a stage_caf_potencia_72hs y a la vez se actualizacion campos
INSERT INTO stagec2 select f.* from stagec, jsonb_populate_recordset(null::stagec2, x) f;
UPDATE stagec2 SET id = 'iiCAU3_WS_C08_2';
UPDATE stagec2 SET date = DATE_TRUNC('minute', date);
INSERT INTO iiCAU3_ SELECT * from stagec2 WHERE date >= now() - interval '3 days';
DROP TABLE IF EXISTS stagec;
DROP TABLE IF EXISTS stagec2;

------------------iiCAU3_WS_C11_1----------------------------
-- Crea tablas temporales
CREATE TEMP TABLE stagec(x jsonb);
CREATE TEMP TABLE stagec2(date timestamptz, val numeric, id text);
Do $$ 
-- Declara las variables startdate y starttime
declare startdate text := to_char(current_date - 3, 'YYYYMMDD'); 
-- Se genera un bloque de codigo para cargar datos en stage_caf_potencia_72hs desde la url dada
Begin EXECUTE format('COPY stagec FROM PROGRAM ''curl -H "Api-Key:38deaa51-8716-4cc9-aa42-ab14fb72a752.01" "https://portal.unity.inaccess.com/ifms/sources/12261f8a-07ed-11eb-8564-42010afa015a/events?&start_date=%sT000000Z"''',startdate);
End$$ ;
-- Se cargan campos dentro stage_caf_potencia_72hs2 que vienen de una subconsulta a stage_caf_potencia_72hs y a la vez se actualizacion campos
INSERT INTO stagec2 select f.* from stagec, jsonb_populate_recordset(null::stagec2, x) f;
UPDATE stagec2 SET id = 'iiCAU3_WS_C11_1';
UPDATE stagec2 SET date = DATE_TRUNC('minute', date);
INSERT INTO iiCAU3_ SELECT * from stagec2 WHERE date >= now() - interval '3 days';
DROP TABLE IF EXISTS stagec;
DROP TABLE IF EXISTS stagec2;

------------------iiCAU3_WS_C11_2----------------------------
-- Crea tablas temporales
CREATE TEMP TABLE stagec(x jsonb);
CREATE TEMP TABLE stagec2(date timestamptz, val numeric, id text);
Do $$ 
-- Declara las variables startdate y starttime
declare startdate text := to_char(current_date - 3, 'YYYYMMDD'); 
-- Se genera un bloque de codigo para cargar datos en stage_caf_potencia_72hs desde la url dada
Begin EXECUTE format('COPY stagec FROM PROGRAM ''curl -H "Api-Key:38deaa51-8716-4cc9-aa42-ab14fb72a752.01" "https://portal.unity.inaccess.com/ifms/sources/12217976-07ed-11eb-8564-42010afa015a/events?&start_date=%sT000000Z"''',startdate);
End$$ ;
-- Se cargan campos dentro stage_caf_potencia_72hs2 que vienen de una subconsulta a stage_caf_potencia_72hs y a la vez se actualizacion campos
INSERT INTO stagec2 select f.* from stagec, jsonb_populate_recordset(null::stagec2, x) f;
UPDATE stagec2 SET id = 'iiCAU3_WS_C11_2';
UPDATE stagec2 SET date = DATE_TRUNC('minute', date);
INSERT INTO iiCAU3_ SELECT * from stagec2 WHERE date >= now() - interval '3 days';
DROP TABLE IF EXISTS stagec;
DROP TABLE IF EXISTS stagec2;

------------------iiCAU3_WS_C29_1----------------------------
-- Crea tablas temporales
CREATE TEMP TABLE stagec(x jsonb);
CREATE TEMP TABLE stagec2(date timestamptz, val numeric, id text);
Do $$ 
-- Declara las variables startdate y starttime
declare startdate text := to_char(current_date - 3, 'YYYYMMDD'); 
-- Se genera un bloque de codigo para cargar datos en stage_caf_potencia_72hs desde la url dada
Begin EXECUTE format('COPY stagec FROM PROGRAM ''curl -H "Api-Key:38deaa51-8716-4cc9-aa42-ab14fb72a752.01" "https://portal.unity.inaccess.com/ifms/sources/125ee3d8-07ed-11eb-8564-42010afa015a/events?&start_date=%sT000000Z"''',startdate);
End$$ ;
-- Se cargan campos dentro stage_caf_potencia_72hs2 que vienen de una subconsulta a stage_caf_potencia_72hs y a la vez se actualizacion campos
INSERT INTO stagec2 select f.* from stagec, jsonb_populate_recordset(null::stagec2, x) f;
UPDATE stagec2 SET id = 'iiCAU3_WS_C29_1';
UPDATE stagec2 SET date = DATE_TRUNC('minute', date);
INSERT INTO iiCAU3_ SELECT * from stagec2 WHERE date >= now() - interval '3 days';
DROP TABLE IF EXISTS stagec;
DROP TABLE IF EXISTS stagec2;

------------------iiCAU3_WS_C29_2----------------------------
-- Crea tablas temporales
CREATE TEMP TABLE stagec(x jsonb);
CREATE TEMP TABLE stagec2(date timestamptz, val numeric, id text);
Do $$ 
-- Declara las variables startdate y starttime
declare startdate text := to_char(current_date - 3, 'YYYYMMDD'); 
-- Se genera un bloque de codigo para cargar datos en stage_caf_potencia_72hs desde la url dada
Begin EXECUTE format('COPY stagec FROM PROGRAM ''curl -H "Api-Key:38deaa51-8716-4cc9-aa42-ab14fb72a752.01" "https://portal.unity.inaccess.com/ifms/sources/125ad5ea-07ed-11eb-8564-42010afa015a/events?&start_date=%sT000000Z"''',startdate);
End$$ ;
-- Se cargan campos dentro stage_caf_potencia_72hs2 que vienen de una subconsulta a stage_caf_potencia_72hs y a la vez se actualizacion campos
INSERT INTO stagec2 select f.* from stagec, jsonb_populate_recordset(null::stagec2, x) f;
UPDATE stagec2 SET id = 'iiCAU3_WS_C29_2';
UPDATE stagec2 SET date = DATE_TRUNC('minute', date);
INSERT INTO iiCAU3_ SELECT * from stagec2 WHERE date >= now() - interval '3 days';
DROP TABLE IF EXISTS stagec;
DROP TABLE IF EXISTS stagec2;
