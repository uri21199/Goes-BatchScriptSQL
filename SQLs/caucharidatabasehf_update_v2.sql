------------------powercau3----------------------------
-- Elimina las tablas en caso de que existan
DROP TABLE IF EXISTS powercau3;
-- Crea tablas temporales
CREATE TABLE powercau3 (date timestamptz, val numeric);
create temp table stagey(x jsonb);
Do $$ 
-- Declara las variables startdate y starttime
declare startdate text := to_char(current_date - 1, 'YYYYMMDD'); 
-- Se genera un bloque de codigo para cargar datos en stage_caf_potencia_72hs desde la url dada
Begin EXECUTE format('COPY stagey FROM PROGRAM ''curl -H "Api-Key:38deaa51-8716-4cc9-aa42-ab14fb72a752.01" "https://portal.unity.inaccess.com/ifms/sources/1851c03a-07ed-11eb-8564-42010afa015a/events?&start_date=%sT000000Z"''',startdate);
End$$ ;
-- Se cargan campos dentro stage_caf_potencia_72hs2 que vienen de una subconsulta a stage_caf_potencia_72hs y a la vez se actualizacion campos
INSERT into powercau3 select f.* from stagey, jsonb_populate_recordset(null::powercau3, x) f;
ALTER TABLE powercau3 RENAME COLUMN val TO powercau3 ;
UPDATE powercau3 SET date = DATE_TRUNC('minute', date);
UPDATE powercau3 SET powercau3 = powercau3 / 1000 WHERE date >= now() - interval '9 hours' AND date <= CURRENT_TIMESTAMP;
-- Elimina las tablas en caso de que existan
DROP TABLE IF EXISTS stagey;
------------------------------Energy exported CAU1------------------------------

-- Elimina las tablas en caso de que existan
DROP TABLE IF EXISTS eecau1;
-- Crea tablas temporales
CREATE TABLE eecau1 (date timestamptz, val numeric);
create temp table stagey(x jsonb);
Do $$ 
-- Declara las variables startdate y starttime
declare startdate text := to_char(current_date - 1, 'YYYYMMDD'); 
-- Se genera un bloque de codigo para cargar datos en stage_caf_potencia_72hs desde la url dada
Begin EXECUTE format('COPY stagey FROM PROGRAM ''curl -H "Api-Key:38deaa51-8716-4cc9-aa42-ab14fb72a752.01" "https://portal.unity.inaccess.com/ifms/sources/c62ae0c8-0816-11eb-aeeb-42010afa015a/events?&start_date=%sT000000Z"''',startdate);
End$$ ;
-- Se cargan campos dentro stage_caf_potencia_72hs2 que vienen de una subconsulta a stage_caf_potencia_72hs y a la vez se actualizacion campos
INSERT into eecau1 select f.* from stagey, jsonb_populate_recordset(null::eecau1, x) f;
ALTER TABLE eecau1 RENAME COLUMN val TO eecau1val ;
UPDATE eecau1 SET date = DATE_TRUNC('minute', date);
UPDATE eecau1 SET eecau1val = eecau1val / 1000 WHERE date >= now() - interval '9 hours' AND date <= CURRENT_TIMESTAMP;
-- Elimina las tablas en caso de que existan
DROP TABLE IF EXISTS stagey;
------------------------------Energy exported CAU2------------------------------
-- Elimina las tablas en caso de que existan
DROP TABLE IF EXISTS eecau2;
-- Crea tablas temporales
CREATE TABLE eecau2 (date timestamptz, val numeric);
create temp table stagey(x jsonb);
Do $$ 
-- Declara las variables startdate y starttime
declare startdate text := to_char(current_date - 1, 'YYYYMMDD'); 
-- Se genera un bloque de codigo para cargar datos en stage_caf_potencia_72hs desde la url dada
Begin EXECUTE format('COPY stagey FROM PROGRAM ''curl -H "Api-Key:38deaa51-8716-4cc9-aa42-ab14fb72a752.01" "https://portal.unity.inaccess.com/ifms/sources/676a0fc6-0809-11eb-8a43-42010afa015a/events?&start_date=%sT000000Z"''',startdate);
End$$ ;
-- Se cargan campos dentro stage_caf_potencia_72hs2 que vienen de una subconsulta a stage_caf_potencia_72hs y a la vez se actualizacion campos
INSERT into eecau2 select f.* from stagey, jsonb_populate_recordset(null::eecau2, x) f;
ALTER TABLE eecau2 RENAME COLUMN val TO eecau2val ;
UPDATE eecau2 SET date = DATE_TRUNC('minute', date);
UPDATE eecau2 SET eecau2val = eecau2val / 1000 WHERE date >= now() - interval '9 hours' AND date <= CURRENT_TIMESTAMP;
-- Elimina las tablas en caso de que existan
DROP TABLE IF EXISTS stagey;
------------------------------Energy exported CAU3------------------------------
-- Elimina las tablas en caso de que existan
DROP TABLE IF EXISTS eecau3;
-- Crea tablas temporales
CREATE TABLE eecau3 (date timestamptz, val numeric);
create temp table stagey(x jsonb);
Do $$ 
-- Declara las variables startdate y starttime
declare startdate text := to_char(current_date - 1, 'YYYYMMDD'); 
-- Se genera un bloque de codigo para cargar datos en stage_caf_potencia_72hs desde la url dada
Begin EXECUTE format('COPY stagey FROM PROGRAM ''curl -H "Api-Key:38deaa51-8716-4cc9-aa42-ab14fb72a752.01" "https://portal.unity.inaccess.com/ifms/sources/8acddc7c-0809-11eb-8564-42010afa015a/events?&start_date=%sT000000Z"''',startdate);
End$$ ;
-- Se cargan campos dentro stage_caf_potencia_72hs2 que vienen de una subconsulta a stage_caf_potencia_72hs y a la vez se actualizacion campos
INSERT into eecau3 select f.* from stagey, jsonb_populate_recordset(null::eecau3, x) f;
ALTER TABLE eecau3 RENAME COLUMN val TO eecau3val ;
UPDATE eecau3 SET date = DATE_TRUNC('minute', date);
UPDATE eecau3 SET eecau3val = eecau3val / 1000 WHERE date >= now() - interval '9 hours' AND date <= CURRENT_TIMESTAMP;
-- Elimina las tablas en caso de que existan
DROP TABLE IF EXISTS stagey;
------------------powercau1----------------------------
-- Elimina las tablas en caso de que existan
DROP TABLE IF EXISTS powercau1;
-- Crea tablas temporales
CREATE TABLE powercau1 (date timestamptz, val numeric);
create temp table stagey(x jsonb);
Do $$ 
-- Declara las variables startdate y starttime
declare startdate text := to_char(current_date - 1, 'YYYYMMDD'); 
-- Se genera un bloque de codigo para cargar datos en stage_caf_potencia_72hs desde la url dada
Begin EXECUTE format('COPY stagey FROM PROGRAM ''curl -H "Api-Key:38deaa51-8716-4cc9-aa42-ab14fb72a752.01" "https://portal.unity.inaccess.com/ifms/sources/5fea3ca4-07f9-11eb-aeeb-42010afa015a/events?&start_date=%sT000000Z"''',startdate);
End$$ ;
-- Se cargan campos dentro stage_caf_potencia_72hs2 que vienen de una subconsulta a stage_caf_potencia_72hs y a la vez se actualizacion campos
INSERT into powercau1 select f.* from stagey, jsonb_populate_recordset(null::powercau1, x) f;
ALTER TABLE powercau1 RENAME COLUMN val TO powercau1 ;
UPDATE powercau1 SET date = DATE_TRUNC('minute', date);
UPDATE powercau1 SET powercau1 = powercau1 / 1000 WHERE date >= now() - interval '9 hours' AND date <= CURRENT_TIMESTAMP;
-- Elimina las tablas en caso de que existan
DROP TABLE IF EXISTS stagey;
------------------powercau2----------------------------
-- Elimina las tablas en caso de que existan
DROP TABLE IF EXISTS powercau2;
-- Crea tablas temporales
CREATE TABLE powercau2 (date timestamptz, val numeric);
create temp table stagey(x jsonb);
Do $$ 
-- Declara las variables startdate y starttime
declare startdate text := to_char(current_date - 1, 'YYYYMMDD'); 
-- Se genera un bloque de codigo para cargar datos en stage_caf_potencia_72hs desde la url dada
Begin EXECUTE format('COPY stagey FROM PROGRAM ''curl -H "Api-Key:38deaa51-8716-4cc9-aa42-ab14fb72a752.01" "https://portal.unity.inaccess.com/ifms/sources/c320449c-07ec-11eb-8a43-42010afa015a/events?&start_date=%sT000000Z"''',startdate);
End$$ ;
-- Se cargan campos dentro stage_caf_potencia_72hs2 que vienen de una subconsulta a stage_caf_potencia_72hs y a la vez se actualizacion campos
INSERT into powercau2 select f.* from stagey, jsonb_populate_recordset(null::powercau2, x) f;
ALTER TABLE powercau2 RENAME COLUMN val TO powercau2 ;
UPDATE powercau2 SET date = DATE_TRUNC('minute', date);
UPDATE powercau2 SET powercau2 = powercau2 / 1000 WHERE date >= now() - interval '9 hours' AND date <= CURRENT_TIMESTAMP;
-- Elimina las tablas en caso de que existan
DROP TABLE IF EXISTS stagey;


-----------------------------------------------unir en 1 tabla y dividir por 1000 ------------------------------



UPDATE public.caucharidatabasehf SET eecau1val = eecau1.eecau1val FROM public.eecau1 WHERE public.eecau1.date = caucharidatabasehf.date AND caucharidatabasehf.date >= now() - interval '8 hours' AND caucharidatabasehf.date <= CURRENT_TIMESTAMP;
UPDATE public.caucharidatabasehf SET eecau2val = eecau2.eecau2val FROM public.eecau2 WHERE public.eecau2.date = caucharidatabasehf.date AND caucharidatabasehf.date >= now() - interval '8 hours' AND caucharidatabasehf.date <= CURRENT_TIMESTAMP;
UPDATE public.caucharidatabasehf SET eecau3val = eecau3.eecau3val FROM public.eecau3 WHERE public.eecau3.date = caucharidatabasehf.date AND caucharidatabasehf.date >= now() - interval '8 hours' AND caucharidatabasehf.date <= CURRENT_TIMESTAMP;

UPDATE public.caucharidatabasehf SET powercau1 = powercau1.powercau1 FROM public.powercau1 WHERE public.powercau1.date = caucharidatabasehf.date AND caucharidatabasehf.date >= now() - interval '8 hours' AND caucharidatabasehf.date <= CURRENT_TIMESTAMP;
UPDATE public.caucharidatabasehf SET powercau2 = powercau2.powercau2 FROM public.powercau2 WHERE public.powercau2.date = caucharidatabasehf.date AND caucharidatabasehf.date >= now() - interval '8 hours' AND caucharidatabasehf.date <= CURRENT_TIMESTAMP;
UPDATE public.caucharidatabasehf SET powercau3 = powercau3.powercau3 FROM public.powercau3 WHERE public.powercau3.date = caucharidatabasehf.date AND caucharidatabasehf.date >= now() - interval '8 hours' AND caucharidatabasehf.date <= CURRENT_TIMESTAMP;


DELETE FROM caucharidatabasehf2;
INSERT INTO caucharidatabasehf2 SELECT * FROM caucharidatabasehf WHERE date >= now() - interval '1 day' AND DATE >= current_date AND date < now() ON CONFLICT ON CONSTRAINT uc_caucharidatabasehf2 DO NOTHING;