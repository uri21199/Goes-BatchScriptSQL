---------------------------precipitaciones---------------------------------
-- Elimina las tablas en caso de que existan y crea temporales
DROP TABLE IF EXISTS stage_precipitaciones;
DROP TABLE IF EXISTS stage_precipitaciones2;
CREATE TEMP TABLE stage_precipitaciones(x jsonb);
CREATE TEMP TABLE stage_precipitaciones2(date timestamptz, val numeric, id text);
DO $$
-- Declara las variables startdate y starttime
DECLARE startdate text := to_char(current_date -30, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '3 hours' + interval '3 hours'))), 'HH24MISS');
-- Se genera un bloque de codigo para cargar datos en stage_caf_potencia_72hs desde la url dada
Begin 
EXECUTE format(
           'COPY stage_precipitaciones FROM PROGRAM ''curl -H "Api-Key:e385a1a5-0441-4e06-be58-162731a7d4f9.01" "https://portal.unity.inaccess.com/ifms/sources/c5cfe3ba-8934-11e9-8620-42010afa015a/events?&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
-- Se cargan campos dentro stage_caf_potencia_72hs2 que vienen de una subconsulta a stage_caf_potencia_72hs y a la vez se actualizacion campos
INSERT INTO stage_precipitaciones2 select f.* from stage_precipitaciones, jsonb_populate_recordset(null::stage_precipitaciones2, x) f;
UPDATE stage_precipitaciones2 SET id = 'precipitaciones 9';
UPDATE stage_precipitaciones2 SET date = DATE_TRUNC('minute', date);
INSERT INTO Cafayate.precipitaciones SELECT * from stage_precipitaciones2 ON CONFLICT DO NOTHING;
-- Elimina las tablas en caso de que existan y crea temporales
DROP TABLE IF EXISTS stage_precipitaciones;
DROP TABLE IF EXISTS stage_precipitaciones2;
CREATE TEMP TABLE stage_precipitaciones(x jsonb);
CREATE TEMP TABLE stage_precipitaciones2(date timestamptz, val numeric, id text);
DO $$
-- Declara las variables startdate y starttime
DECLARE startdate text := to_char(current_date -30, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '3 hours' + interval '3 hours'))), 'HH24MISS');
-- Se genera un bloque de codigo para cargar datos en stage_caf_potencia_72hs desde la url dada
Begin 
EXECUTE format(
           'COPY stage_precipitaciones FROM PROGRAM ''curl -H "Api-Key:e385a1a5-0441-4e06-be58-162731a7d4f9.01" "https://portal.unity.inaccess.com/ifms/sources/c5bda466-8934-11e9-8620-42010afa015a/events?&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
-- Se cargan campos dentro stage_caf_potencia_72hs2 que vienen de una subconsulta a stage_caf_potencia_72hs y a la vez se actualizacion campos
INSERT INTO stage_precipitaciones2 select f.* from stage_precipitaciones, jsonb_populate_recordset(null::stage_precipitaciones2, x) f;
UPDATE stage_precipitaciones2 SET id = 'precipitaciones 4';
UPDATE stage_precipitaciones2 SET date = DATE_TRUNC('minute', date);
INSERT INTO Cafayate.precipitaciones SELECT * from stage_precipitaciones2 ON CONFLICT DO NOTHING;

---------------------------soiling---------------------------------
-- Elimina las tablas en caso de que existan y crea temporales
DROP TABLE IF EXISTS stage_soiling;
DROP TABLE IF EXISTS stage_soiling2;
CREATE TEMP TABLE stage_soiling(x jsonb);
CREATE TEMP TABLE stage_soiling2(date timestamptz, val numeric, id text);
DO $$
-- Declara las variables startdate y starttime
DECLARE startdate text := to_char(current_date -30, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '3 hours' + interval '3 hours'))), 'HH24MISS');
-- Se genera un bloque de codigo para cargar datos en stage_caf_potencia_72hs desde la url dada
Begin 
EXECUTE format(
           'COPY stage_soiling FROM PROGRAM ''curl -H "Api-Key:e385a1a5-0441-4e06-be58-162731a7d4f9.01" "https://portal.unity.inaccess.com/ifms/sources/5250446c-99a5-11e9-b890-525400b2701a/events?&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
-- Se cargan campos dentro stage_caf_potencia_72hs2 que vienen de una subconsulta a stage_caf_potencia_72hs y a la vez se actualizacion campos
INSERT INTO stage_soiling2 select f.* from stage_soiling, jsonb_populate_recordset(null::stage_soiling2, x) f;
UPDATE stage_soiling2 SET id = 'soiling 1';
UPDATE stage_soiling2 SET date = DATE_TRUNC('minute', date);
INSERT INTO Cafayate.soiling SELECT * from stage_soiling2 ON CONFLICT DO NOTHING;
-- Elimina las tablas en caso de que existan y crea temporales
DROP TABLE IF EXISTS stage_soiling;
DROP TABLE IF EXISTS stage_soiling2;
CREATE TEMP TABLE stage_soiling(x jsonb);
CREATE TEMP TABLE stage_soiling2(date timestamptz, val numeric, id text);
DO $$
-- Declara las variables startdate y starttime
DECLARE startdate text := to_char(current_date -30, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '3 hours' + interval '3 hours'))), 'HH24MISS');
-- Se genera un bloque de codigo para cargar datos en stage_caf_potencia_72hs desde la url dada
Begin 
EXECUTE format(
           'COPY stage_soiling FROM PROGRAM ''curl -H "Api-Key:e385a1a5-0441-4e06-be58-162731a7d4f9.01" "https://portal.unity.inaccess.com/ifms/sources/525072a2-99a5-11e9-b890-525400b2701a/events?&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
-- Se cargan campos dentro stage_caf_potencia_72hs2 que vienen de una subconsulta a stage_caf_potencia_72hs y a la vez se actualizacion campos
INSERT INTO stage_soiling2 select f.* from stage_soiling, jsonb_populate_recordset(null::stage_soiling2, x) f;
UPDATE stage_soiling2 SET id = 'soiling 2';
UPDATE stage_soiling2 SET date = DATE_TRUNC('minute', date);
INSERT INTO Cafayate.soiling SELECT * from stage_soiling2 ON CONFLICT DO NOTHING;

---------------------------mod_temp---------------------------------
-- Elimina las tablas en caso de que existan y crea temporales
DROP TABLE IF EXISTS stage_mod_temp;
DROP TABLE IF EXISTS stage_mod_temp2;
CREATE TEMP TABLE stage_mod_temp(x jsonb);
CREATE TEMP TABLE stage_mod_temp2(date timestamptz, val numeric, id text);
DO $$
-- Declara las variables startdate y starttime
DECLARE startdate text := to_char(current_date -30, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '3 hours' + interval '3 hours'))), 'HH24MISS');
-- Se genera un bloque de codigo para cargar datos en stage_caf_potencia_72hs desde la url dada
Begin 
EXECUTE format(
           'COPY stage_mod_temp FROM PROGRAM ''curl -H "Api-Key:e385a1a5-0441-4e06-be58-162731a7d4f9.01" "https://portal.unity.inaccess.com/ifms/sources/c59f66e0-8934-11e9-8620-42010afa015a/events?&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
-- Se cargan campos dentro stage_caf_potencia_72hs2 que vienen de una subconsulta a stage_caf_potencia_72hs y a la vez se actualizacion campos
INSERT INTO stage_mod_temp2 select f.* from stage_mod_temp, jsonb_populate_recordset(null::stage_mod_temp2, x) f;
UPDATE stage_mod_temp2 SET id = 'mod temp 4';
UPDATE stage_mod_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO Cafayate.mod_temp SELECT * from stage_mod_temp2 ON CONFLICT DO NOTHING;
-- Elimina las tablas en caso de que existan y crea temporales
DROP TABLE IF EXISTS stage_mod_temp;
DROP TABLE IF EXISTS stage_mod_temp2;
CREATE TEMP TABLE stage_mod_temp(x jsonb);
CREATE TEMP TABLE stage_mod_temp2(date timestamptz, val numeric, id text);
DO $$
-- Declara las variables startdate y starttime
DECLARE startdate text := to_char(current_date -30, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '3 hours' + interval '3 hours'))), 'HH24MISS');
-- Se genera un bloque de codigo para cargar datos en stage_caf_potencia_72hs desde la url dada
Begin 
EXECUTE format(
           'COPY stage_mod_temp FROM PROGRAM ''curl -H "Api-Key:e385a1a5-0441-4e06-be58-162731a7d4f9.01" "https://portal.unity.inaccess.com/ifms/sources/c5a3fda4-8934-11e9-8620-42010afa015a/events?&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
-- Se cargan campos dentro stage_caf_potencia_72hs2 que vienen de una subconsulta a stage_caf_potencia_72hs y a la vez se actualizacion campos
INSERT INTO stage_mod_temp2 select f.* from stage_mod_temp, jsonb_populate_recordset(null::stage_mod_temp2, x) f;
UPDATE stage_mod_temp2 SET id = 'mod temp 9';
UPDATE stage_mod_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO Cafayate.mod_temp SELECT * from stage_mod_temp2 ON CONFLICT DO NOTHING;

---------------------------HIA---------------------------------
-- Elimina las tablas en caso de que existan y crea temporales
DROP TABLE IF EXISTS stage_caf_hia;
DROP TABLE IF EXISTS stage_caf_hia2;
CREATE TEMP TABLE stage_caf_hia(x jsonb);
CREATE TEMP TABLE stage_caf_hia2(date timestamptz, val numeric, id text);
DO $$
-- Declara las variables startdate y starttime
DECLARE startdate text := to_char(current_date -30, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '3 hours' + interval '3 hours'))), 'HH24MISS');
-- Se genera un bloque de codigo para cargar datos en stage_caf_potencia_72hs desde la url dada
Begin 
EXECUTE format(
           'COPY stage_caf_hia FROM PROGRAM ''curl -H "Api-Key:e385a1a5-0441-4e06-be58-162731a7d4f9.01" "https://portal.unity.inaccess.com/ifms/sources/c5bd4322-8934-11e9-8620-42010afa015a/events?&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
-- Se cargan campos dentro stage_caf_potencia_72hs2 que vienen de una subconsulta a stage_caf_potencia_72hs y a la vez se actualizacion campos
INSERT INTO stage_caf_hia2 select f.* from stage_caf_hia, jsonb_populate_recordset(null::stage_caf_hia2, x) f;
UPDATE stage_caf_hia2 SET id = 'Horiz Irrad 4';
UPDATE stage_caf_hia2 SET date = DATE_TRUNC('minute', date);
INSERT INTO Cafayate.caf_hia SELECT * from stage_caf_hia2 ON CONFLICT DO NOTHING;
-- Elimina las tablas en caso de que existan y crea temporales
DROP TABLE IF EXISTS stage_caf_hia;
DROP TABLE IF EXISTS stage_caf_hia2;
CREATE TEMP TABLE stage_caf_hia(x jsonb);
CREATE TEMP TABLE stage_caf_hia2(date timestamptz, val numeric, id text);
DO $$
-- Declara las variables startdate y starttime
DECLARE startdate text := to_char(current_date -30, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '3 hours' + interval '3 hours'))), 'HH24MISS');
-- Se genera un bloque de codigo para cargar datos en stage_caf_potencia_72hs desde la url dada
Begin 
EXECUTE format(
           'COPY stage_caf_hia FROM PROGRAM ''curl -H "Api-Key:e385a1a5-0441-4e06-be58-162731a7d4f9.01" "https://portal.unity.inaccess.com/ifms/sources/c5c4838a-8934-11e9-8620-42010afa015a/events?&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
-- Se cargan campos dentro stage_caf_potencia_72hs2 que vienen de una subconsulta a stage_caf_potencia_72hs y a la vez se actualizacion campos
INSERT INTO stage_caf_hia2 select f.* from stage_caf_hia, jsonb_populate_recordset(null::stage_caf_hia2, x) f;
UPDATE stage_caf_hia2 SET id = 'Horiz Irrad 7';
UPDATE stage_caf_hia2 SET date = DATE_TRUNC('minute', date);
INSERT INTO Cafayate.caf_hia SELECT * from stage_caf_hia2 ON CONFLICT DO NOTHING;
-- Elimina las tablas en caso de que existan y crea temporales
DROP TABLE IF EXISTS stage_caf_hia;
DROP TABLE IF EXISTS stage_caf_hia2;
CREATE TEMP TABLE stage_caf_hia(x jsonb);
CREATE TEMP TABLE stage_caf_hia2(date timestamptz, val numeric, id text);
DO $$
-- Declara las variables startdate y starttime
DECLARE startdate text := to_char(current_date -30, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '3 hours' + interval '3 hours'))), 'HH24MISS');
-- Se genera un bloque de codigo para cargar datos en stage_caf_potencia_72hs desde la url dada
Begin 
EXECUTE format(
           'COPY stage_caf_hia FROM PROGRAM ''curl -H "Api-Key:e385a1a5-0441-4e06-be58-162731a7d4f9.01" "https://portal.unity.inaccess.com/ifms/sources/c5cf74b6-8934-11e9-8620-42010afa015a/events?&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
-- Se cargan campos dentro stage_caf_potencia_72hs2 que vienen de una subconsulta a stage_caf_potencia_72hs y a la vez se actualizacion campos
INSERT INTO stage_caf_hia2 select f.* from stage_caf_hia, jsonb_populate_recordset(null::stage_caf_hia2, x) f;
UPDATE stage_caf_hia2 SET id = 'Horiz Irrad 9';
UPDATE stage_caf_hia2 SET date = DATE_TRUNC('minute', date);
INSERT INTO Cafayate.caf_hia SELECT * from stage_caf_hia2 ON CONFLICT DO NOTHING;

---------------------------IIA-----------------------------
-- Elimina las tablas en caso de que existan y crea temporales
DROP TABLE IF EXISTS stage_caf_iia;
DROP TABLE IF EXISTS stage_caf_iia2;
CREATE TEMP TABLE stage_caf_iia(x jsonb);
CREATE TEMP TABLE stage_caf_iia2(date timestamptz, val numeric, id text);
DO $$
-- Declara las variables startdate y starttime
DECLARE startdate text := to_char(current_date -30, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '3 hours' + interval '3 hours'))), 'HH24MISS');
-- Se genera un bloque de codigo para cargar datos en stage_caf_potencia_72hs desde la url dada
Begin 
EXECUTE format(
           'COPY stage_caf_iia FROM PROGRAM ''curl -H "Api-Key:e385a1a5-0441-4e06-be58-162731a7d4f9.01" "https://portal.unity.inaccess.com/ifms/sources/c59f858a-8934-11e9-8620-42010afa015a/events?&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
-- Se cargan campos dentro stage_caf_potencia_72hs2 que vienen de una subconsulta a stage_caf_potencia_72hs y a la vez se actualizacion campos
INSERT INTO stage_caf_iia2 select f.* from stage_caf_iia, jsonb_populate_recordset(null::stage_caf_iia2, x) f;
UPDATE stage_caf_iia2 SET id = 'Inclined Irrad 4';
UPDATE stage_caf_iia2 SET date = DATE_TRUNC('minute', date);
INSERT INTO Cafayate.caf_iia SELECT * from stage_caf_iia2 ON CONFLICT DO NOTHING;
-- Elimina las tablas en caso de que existan y crea temporales
DROP TABLE IF EXISTS stage_caf_iia;
DROP TABLE IF EXISTS stage_caf_iia2;
CREATE TEMP TABLE stage_caf_iia(x jsonb);
CREATE TEMP TABLE stage_caf_iia2(date timestamptz, val numeric, id text);
DO $$
-- Declara las variables startdate y starttime
DECLARE startdate text := to_char(current_date -30, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '3 hours' + interval '3 hours'))), 'HH24MISS');
-- Se genera un bloque de codigo para cargar datos en stage_caf_potencia_72hs desde la url dada
Begin 
EXECUTE format(
           'COPY stage_caf_iia FROM PROGRAM ''curl -H "Api-Key:e385a1a5-0441-4e06-be58-162731a7d4f9.01" "https://portal.unity.inaccess.com/ifms/sources/c5a1d92a-8934-11e9-8620-42010afa015a/events?&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
-- Se cargan campos dentro stage_caf_potencia_72hs2 que vienen de una subconsulta a stage_caf_potencia_72hs y a la vez se actualizacion campos
INSERT INTO stage_caf_iia2 select f.* from stage_caf_iia, jsonb_populate_recordset(null::stage_caf_iia2, x) f;
UPDATE stage_caf_iia2 SET id = 'Inclined Irrad 7';
UPDATE stage_caf_iia2 SET date = DATE_TRUNC('minute', date);
INSERT INTO Cafayate.caf_iia SELECT * from stage_caf_iia2 ON CONFLICT DO NOTHING;
-- Elimina las tablas en caso de que existan y crea temporales
DROP TABLE IF EXISTS stage_caf_iia;
DROP TABLE IF EXISTS stage_caf_iia2;
CREATE TEMP TABLE stage_caf_iia(x jsonb);
CREATE TEMP TABLE stage_caf_iia2(date timestamptz, val numeric, id text);
DO $$
-- Declara las variables startdate y starttime
DECLARE startdate text := to_char(current_date -30, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '3 hours' + interval '3 hours'))), 'HH24MISS');
-- Se genera un bloque de codigo para cargar datos en stage_caf_potencia_72hs desde la url dada
Begin 
EXECUTE format(
           'COPY stage_caf_iia FROM PROGRAM ''curl -H "Api-Key:e385a1a5-0441-4e06-be58-162731a7d4f9.01" "https://portal.unity.inaccess.com/ifms/sources/c5a4231a-8934-11e9-8620-42010afa015a/events?&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
-- Se cargan campos dentro stage_caf_potencia_72hs2 que vienen de una subconsulta a stage_caf_potencia_72hs y a la vez se actualizacion campos
INSERT INTO stage_caf_iia2 select f.* from stage_caf_iia, jsonb_populate_recordset(null::stage_caf_iia2, x) f;
UPDATE stage_caf_iia2 SET id = 'Inclined Irrad 9';
UPDATE stage_caf_iia2 SET date = DATE_TRUNC('minute', date);
INSERT INTO Cafayate.caf_iia SELECT * from stage_caf_iia2 ON CONFLICT DO NOTHING;

----------------------------AMB TEMP---------------------------------
-- Elimina las tablas en caso de que existan y crea temporales
DROP TABLE IF EXISTS stage_caf_amb_temp;
DROP TABLE IF EXISTS stage_caf_amb_temp2;
CREATE TEMP TABLE stage_caf_amb_temp(x jsonb);
CREATE TEMP TABLE stage_caf_amb_temp2(date timestamptz, val numeric, id text);
DO $$
-- Declara las variables startdate y starttime
DECLARE startdate text := to_char(current_date -30, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '3 hours' + interval '3 hours'))), 'HH24MISS');
-- Se genera un bloque de codigo para cargar datos en stage_caf_potencia_72hs desde la url dada
Begin 
EXECUTE format(
           'COPY stage_caf_amb_temp FROM PROGRAM ''curl -H "Api-Key:e385a1a5-0441-4e06-be58-162731a7d4f9.01" "https://portal.unity.inaccess.com/ifms/sources/c59f858a-8934-11e9-8620-42010afa015a/events?&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
-- Se cargan campos dentro stage_caf_potencia_72hs2 que vienen de una subconsulta a stage_caf_potencia_72hs y a la vez se actualizacion campos
INSERT INTO stage_caf_amb_temp2 select f.* from stage_caf_amb_temp, jsonb_populate_recordset(null::stage_caf_amb_temp2, x) f;
UPDATE stage_caf_amb_temp2 SET id = 'Amb Temp 4';
UPDATE stage_caf_amb_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO Cafayate.caf_amb_temp SELECT * from stage_caf_amb_temp2 ON CONFLICT DO NOTHING;
-- Elimina las tablas en caso de que existan y crea temporales
DROP TABLE IF EXISTS stage_caf_amb_temp;
DROP TABLE IF EXISTS stage_caf_amb_temp2;
CREATE TEMP TABLE stage_caf_amb_temp(x jsonb);
CREATE TEMP TABLE stage_caf_amb_temp2(date timestamptz, val numeric, id text);
DO $$
-- Declara las variables startdate y starttime
DECLARE startdate text := to_char(current_date -30, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '3 hours' + interval '3 hours'))), 'HH24MISS');
-- Se genera un bloque de codigo para cargar datos en stage_caf_potencia_72hs desde la url dada
Begin 
EXECUTE format(
           'COPY stage_caf_amb_temp FROM PROGRAM ''curl -H "Api-Key:e385a1a5-0441-4e06-be58-162731a7d4f9.01" "https://portal.unity.inaccess.com/ifms/sources/c5c4057c-8934-11e9-8620-42010afa015a/events?&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
-- Se cargan campos dentro stage_caf_potencia_72hs2 que vienen de una subconsulta a stage_caf_potencia_72hs y a la vez se actualizacion campos
INSERT INTO stage_caf_amb_temp2 select f.* from stage_caf_amb_temp, jsonb_populate_recordset(null::stage_caf_amb_temp2, x) f;
UPDATE stage_caf_amb_temp2 SET id = 'Amb Temp 7';
UPDATE stage_caf_amb_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO Cafayate.caf_amb_temp SELECT * from stage_caf_amb_temp2 ON CONFLICT DO NOTHING;
-- Elimina las tablas en caso de que existan y crea temporales
DROP TABLE IF EXISTS stage_caf_amb_temp;
DROP TABLE IF EXISTS stage_caf_amb_temp2;
CREATE TEMP TABLE stage_caf_amb_temp(x jsonb);
CREATE TEMP TABLE stage_caf_amb_temp2(date timestamptz, val numeric, id text);
DO $$
-- Declara las variables startdate y starttime
DECLARE startdate text := to_char(current_date -30, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '3 hours' + interval '3 hours'))), 'HH24MISS');
-- Se genera un bloque de codigo para cargar datos en stage_caf_potencia_72hs desde la url dada
Begin 
EXECUTE format(
           'COPY stage_caf_amb_temp FROM PROGRAM ''curl -H "Api-Key:e385a1a5-0441-4e06-be58-162731a7d4f9.01" "https://portal.unity.inaccess.com/ifms/sources/c5ceec76-8934-11e9-8620-42010afa015a/events?&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
-- Se cargan campos dentro stage_caf_potencia_72hs2 que vienen de una subconsulta a stage_caf_potencia_72hs y a la vez se actualizacion campos
INSERT INTO stage_caf_amb_temp2 select f.* from stage_caf_amb_temp, jsonb_populate_recordset(null::stage_caf_amb_temp2, x) f;
UPDATE stage_caf_amb_temp2 SET id = 'Amb Temp 9';
UPDATE stage_caf_amb_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO Cafayate.caf_amb_temp SELECT * from stage_caf_amb_temp2 ON CONFLICT DO NOTHING;

----------------------------WIND SPEED-------------------------------
-- Elimina las tablas en caso de que existan y crea temporales
DROP TABLE IF EXISTS stage_caf_wind_speed;
DROP TABLE IF EXISTS stage_caf_wind_speed2;
CREATE TEMP TABLE stage_caf_wind_speed(x jsonb);
CREATE TEMP TABLE stage_caf_wind_speed2(date timestamptz, val numeric, id text);
DO $$
-- Declara las variables startdate y starttime
DECLARE startdate text := to_char(current_date -30, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '3 hours' + interval '3 hours'))), 'HH24MISS');
-- Se genera un bloque de codigo para cargar datos en stage_caf_potencia_72hs desde la url dada
Begin 
EXECUTE format(
           'COPY stage_caf_wind_speed FROM PROGRAM ''curl -H "Api-Key:e385a1a5-0441-4e06-be58-162731a7d4f9.01" "https://portal.unity.inaccess.com/ifms/sources/c5bd0704-8934-11e9-8620-42010afa015a/events?&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
-- Se cargan campos dentro stage_caf_potencia_72hs2 que vienen de una subconsulta a stage_caf_potencia_72hs y a la vez se actualizacion campos
INSERT INTO stage_caf_wind_speed2 select f.* from stage_caf_wind_speed, jsonb_populate_recordset(null::stage_caf_wind_speed2, x) f;
UPDATE stage_caf_wind_speed2 SET id = 'Wind Speed 4';
UPDATE stage_caf_wind_speed2 SET date = DATE_TRUNC('minute', date);
INSERT INTO Cafayate.caf_wind_speed SELECT * from stage_caf_wind_speed2 ON CONFLICT DO NOTHING;
-- Elimina las tablas en caso de que existan y crea temporales
DROP TABLE IF EXISTS stage_caf_wind_speed;
DROP TABLE IF EXISTS stage_caf_wind_speed2;
CREATE TEMP TABLE stage_caf_wind_speed(x jsonb);
CREATE TEMP TABLE stage_caf_wind_speed2(date timestamptz, val numeric, id text);
DO $$
-- Declara las variables startdate y starttime
DECLARE startdate text := to_char(current_date -30, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '3 hours' + interval '3 hours'))), 'HH24MISS');
-- Se genera un bloque de codigo para cargar datos en stage_caf_potencia_72hs desde la url dada
Begin 
EXECUTE format(
           'COPY stage_caf_wind_speed FROM PROGRAM ''curl -H "Api-Key:e385a1a5-0441-4e06-be58-162731a7d4f9.01" "https://portal.unity.inaccess.com/ifms/sources/c5c4496a-8934-11e9-8620-42010afa015a/events?&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
-- Se cargan campos dentro stage_caf_potencia_72hs2 que vienen de una subconsulta a stage_caf_potencia_72hs y a la vez se actualizacion campos
INSERT INTO stage_caf_wind_speed2 select f.* from stage_caf_wind_speed, jsonb_populate_recordset(null::stage_caf_wind_speed2, x) f;
UPDATE stage_caf_wind_speed2 SET id = 'Wind Speed 7';
UPDATE stage_caf_wind_speed2 SET date = DATE_TRUNC('minute', date);
INSERT INTO Cafayate.caf_wind_speed SELECT * from stage_caf_wind_speed2 ON CONFLICT DO NOTHING;
-- Elimina las tablas en caso de que existan y crea temporales
DROP TABLE IF EXISTS stage_caf_wind_speed;
DROP TABLE IF EXISTS stage_caf_wind_speed2;
CREATE TEMP TABLE stage_caf_wind_speed(x jsonb);
CREATE TEMP TABLE stage_caf_wind_speed2(date timestamptz, val numeric, id text);
DO $$
-- Declara las variables startdate y starttime
DECLARE startdate text := to_char(current_date -30, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '3 hours' + interval '3 hours'))), 'HH24MISS');
-- Se genera un bloque de codigo para cargar datos en stage_caf_potencia_72hs desde la url dada
Begin 
EXECUTE format(
           'COPY stage_caf_wind_speed FROM PROGRAM ''curl -H "Api-Key:e385a1a5-0441-4e06-be58-162731a7d4f9.01" "https://portal.unity.inaccess.com/ifms/sources/c5cf346a-8934-11e9-8620-42010afa015a/events?&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
-- Se cargan campos dentro stage_caf_potencia_72hs2 que vienen de una subconsulta a stage_caf_potencia_72hs y a la vez se actualizacion campos
INSERT INTO stage_caf_wind_speed2 select f.* from stage_caf_wind_speed, jsonb_populate_recordset(null::stage_caf_wind_speed2, x) f;
UPDATE stage_caf_wind_speed2 SET id = 'Wind Speed 9';
UPDATE stage_caf_wind_speed2 SET date = DATE_TRUNC('minute', date);
INSERT INTO Cafayate.caf_wind_speed SELECT * from stage_caf_wind_speed2 ON CONFLICT DO NOTHING;

----------------------------String avail-------------------------------
-- Elimina las tablas en caso de que existan y crea temporales
DROP TABLE IF EXISTS stage_caf_string_avail;
DROP TABLE IF EXISTS stage_caf_string_avail2;
CREATE TEMP TABLE stage_caf_string_avail(x jsonb);
CREATE TEMP TABLE stage_caf_string_avail2(date timestamptz, val numeric, id text);
DO $$
-- Declara las variables startdate y starttime
DECLARE startdate text := to_char(current_date -30, 'YYYYMMDD');
DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '3 hours' + interval '3 hours'))), 'HH24MISS');
-- Se genera un bloque de codigo para cargar datos en stage_caf_potencia_72hs desde la url dada
Begin 
EXECUTE format(
           'COPY stage_caf_string_avail FROM PROGRAM ''curl -H "Api-Key:e385a1a5-0441-4e06-be58-162731a7d4f9.01" "https://portal.unity.inaccess.com/ifms/sources/8473cbf6-8935-11e9-8620-42010afa015a/events?&start_date=%sT%sZ"''',
           startdate, starttime
        );
END $$ ;
-- Se cargan campos dentro stage_caf_potencia_72hs2 que vienen de una subconsulta a stage_caf_potencia_72hs y a la vez se actualizacion campos
INSERT INTO stage_caf_string_avail2 select f.* from stage_caf_string_avail, jsonb_populate_recordset(null::stage_caf_string_avail2, x) f;
UPDATE stage_caf_string_avail2 SET id = 'String lvl Availability';
UPDATE stage_caf_string_avail2 SET date = DATE_TRUNC('minute', date);
INSERT INTO Cafayate.caf_string_avail SELECT * from stage_caf_string_avail2 ON CONFLICT ON CONSTRAINT uc_caf_string DO NOTHING;
-- Se cargan campos dentro stage_caf_potencia_72hs2 que vienen de una subconsulta a stage_caf_potencia_72hs y a la vez se actualizacion campos
INSERT INTO cafayate.cafdatabasehf(date) SELECT x::timestamp
FROM   generate_series(DATE_TRUNC('day', current_date - 30)
                     , DATE_TRUNC('hour', now())
                     , interval  '5 min') t(x) ON CONFLICT ON CONSTRAINT uc_cafdatabasehf DO NOTHING;
UPDATE Cafayate.cafdatabasehf SET amb_temp04 = s.a FROM (SELECT date, val as a FROM cafayate.caf_amb_temp WHERE id = 'Amb Temp 4' AND date > now() - interval '30 days') as s WHERE s.date = cafdatabasehf.date AND cafdatabasehf.date > now() - interval '30 days';
UPDATE Cafayate.cafdatabasehf SET amb_temp07 = s.a FROM (SELECT date, val as a FROM cafayate.caf_amb_temp WHERE id = 'Amb Temp 7' AND date > now() - interval '30 days') as s WHERE s.date = cafdatabasehf.date AND cafdatabasehf.date > now() - interval '30 days';
UPDATE Cafayate.cafdatabasehf SET amb_temp09 = s.a FROM (SELECT date, val as a FROM cafayate.caf_amb_temp WHERE id = 'Amb Temp 9' AND date > now() - interval '30 days') as s WHERE s.date = cafdatabasehf.date AND cafdatabasehf.date > now() - interval '30 days';
UPDATE Cafayate.cafdatabasehf SET wind04 = s.a FROM (SELECT date, val as a FROM cafayate.caf_wind_speed WHERE id = 'Wind Speed 4' AND date > now() - interval '30 days') as s WHERE s.date = cafdatabasehf.date AND cafdatabasehf.date > now() - interval '30 days';
UPDATE Cafayate.cafdatabasehf SET wind07 = s.a FROM (SELECT date, val as a FROM cafayate.caf_wind_speed WHERE id = 'Wind Speed 7' AND date > now() - interval '30 days') as s WHERE s.date = cafdatabasehf.date AND cafdatabasehf.date > now() - interval '30 days';
UPDATE Cafayate.cafdatabasehf SET wind09 = s.a FROM (SELECT date, val as a FROM cafayate.caf_wind_speed WHERE id = 'Wind Speed 9' AND date > now() - interval '30 days') as s WHERE s.date = cafdatabasehf.date AND cafdatabasehf.date > now() - interval '30 days';
UPDATE Cafayate.cafdatabasehf SET inclined_irrad04 = s.a FROM (SELECT date, val as a FROM cafayate.caf_iia WHERE id = 'Inclined Irrad 4' AND date > now() - interval '30 days') as s WHERE s.date = cafdatabasehf.date AND cafdatabasehf.date > now() - interval '30 days';
UPDATE Cafayate.cafdatabasehf SET inclined_irrad07 = s.a FROM (SELECT date, val as a FROM cafayate.caf_iia WHERE id = 'Inclined Irrad 7' AND date > now() - interval '30 days') as s WHERE s.date = cafdatabasehf.date AND cafdatabasehf.date > now() - interval '30 days';
UPDATE Cafayate.cafdatabasehf SET inclined_irrad09 = s.a FROM (SELECT date, val as a FROM cafayate.caf_iia WHERE id = 'Inclined Irrad 9' AND date > now() - interval '30 days') as s WHERE s.date = cafdatabasehf.date AND cafdatabasehf.date > now() - interval '30 days';
UPDATE Cafayate.cafdatabasehf SET horiz_irrad04 = s.a FROM (SELECT date, val as a FROM cafayate.caf_hia WHERE id = 'Horiz Irrad 4' AND date > now() - interval '30 days') as s WHERE s.date = cafdatabasehf.date AND cafdatabasehf.date > now() - interval '30 days';
UPDATE Cafayate.cafdatabasehf SET horiz_irrad07 = s.a FROM (SELECT date, val as a FROM cafayate.caf_hia WHERE id = 'Horiz Irrad 7' AND date > now() - interval '30 days') as s WHERE s.date = cafdatabasehf.date AND cafdatabasehf.date > now() - interval '30 days';
UPDATE Cafayate.cafdatabasehf SET horiz_irrad09 = s.a FROM (SELECT date, val as a FROM cafayate.caf_hia WHERE id = 'Horiz Irrad 9' AND date > now() - interval '30 days') as s WHERE s.date = cafdatabasehf.date AND cafdatabasehf.date > now() - interval '30 days';
UPDATE Cafayate.cafdatabasehf SET string_avail = s.a FROM (SELECT date, val as a FROM cafayate.caf_string_avail WHERE date > now() - interval '30 days') as s WHERE s.date = cafdatabasehf.date AND cafdatabasehf.date > now() - interval '30 days';
UPDATE Cafayate.cafdatabasehf SET mod_temp4 = s.a FROM (SELECT date, val as a FROM cafayate.mod_temp WHERE id = 'mod temp 4' AND date > now() - interval '30 days') as s WHERE s.date = cafdatabasehf.date AND cafdatabasehf.date > now() - interval '30 days';
UPDATE Cafayate.cafdatabasehf SET mod_temp9 = s.a FROM (SELECT date, val as a FROM cafayate.mod_temp WHERE id = 'mod temp 9' AND date > now() - interval '30 days') as s WHERE s.date = cafdatabasehf.date AND cafdatabasehf.date > now() - interval '30 days';

UPDATE Cafayate.cafdatabasehf SET soiling_1 = s.a FROM (SELECT date, val as a FROM cafayate.soiling WHERE id = 'soiling 1' AND date > now() - interval '30 days') as s WHERE s.date = cafdatabasehf.date AND cafdatabasehf.date > now() - interval '30 days';
UPDATE Cafayate.cafdatabasehf SET soiling_2 = s.a FROM (SELECT date, val as a FROM cafayate.soiling WHERE id = 'soiling 2' AND date > now() - interval '30 days') as s WHERE s.date = cafdatabasehf.date AND cafdatabasehf.date > now() - interval '30 days';

UPDATE Cafayate.cafdatabasehf SET precipitaciones_4 = s.a FROM (SELECT date, val as a FROM cafayate.precipitaciones WHERE id = 'precipitaciones 4' AND date > now() - interval '30 days') as s WHERE s.date = cafdatabasehf.date AND cafdatabasehf.date > now() - interval '30 days';
UPDATE Cafayate.cafdatabasehf SET precipitaciones_9 = s.a FROM (SELECT date, val as a FROM cafayate.precipitaciones WHERE id = 'precipitaciones 9' AND date > now() - interval '30 days') as s WHERE s.date = cafdatabasehf.date AND cafdatabasehf.date > now() - interval '30 days';



UPDATE Cafayate.cafdatabasehf 
	SET amb_temp_avg = g_average_calc.g_average
	FROM (SELECT date,
       (SELECT AVG(a)::numeric (10, 4)
        FROM   (VALUES(amb_temp04),
                      (amb_temp07),
                      (amb_temp09)) T (a)) AS g_average
FROM   Cafayate.cafdatabasehf WHERE date >= (now() - interval '30 days')) AS g_average_calc WHERE g_average_calc.date=Cafayate.cafdatabasehf.date;

UPDATE Cafayate.cafdatabasehf 
	SET wind_speed_avg = g_average_calc.g_average
	FROM (SELECT date,
       (SELECT AVG(a)::numeric (10, 4)
        FROM   (VALUES(wind04),
                      (wind07),
                      (wind09)) T (a)) AS g_average
FROM   Cafayate.cafdatabasehf WHERE date >= (now() - interval '30 days')) AS g_average_calc WHERE g_average_calc.date=Cafayate.cafdatabasehf.date;

UPDATE Cafayate.cafdatabasehf 
	SET inclined_irrad_avg = g_average_calc.g_average
	FROM (SELECT date,
       (SELECT AVG(a)::numeric (10, 4)
        FROM   (VALUES(inclined_irrad04),
                      (inclined_irrad07),
                      (inclined_irrad09)) T (a)) AS g_average
FROM   Cafayate.cafdatabasehf WHERE date >= (now() - interval '30 days')) AS g_average_calc WHERE g_average_calc.date=Cafayate.cafdatabasehf.date;

UPDATE Cafayate.cafdatabasehf 
	SET horiz_irrad_avg = g_average_calc.g_average
	FROM (SELECT date,
       (SELECT AVG(a)::numeric (10, 4)
        FROM   (VALUES(horiz_irrad04),
                      (horiz_irrad07),
                      (horiz_irrad09)) T (a)) AS g_average
FROM   Cafayate.cafdatabasehf WHERE date >= (now() - interval '30 days')) AS g_average_calc WHERE g_average_calc.date=Cafayate.cafdatabasehf.date;

UPDATE Cafayate.cafdatabasehf 
	SET mod_temp_avg = g_average_calc.g_average
	FROM (SELECT date,
       (SELECT AVG(a)::numeric (10, 4)
        FROM   (VALUES(mod_temp4),
                      (mod_temp9)) T (a)) AS g_average
FROM   Cafayate.cafdatabasehf WHERE date >= (now() - interval '30 days')) AS g_average_calc WHERE g_average_calc.date=Cafayate.cafdatabasehf.date;
