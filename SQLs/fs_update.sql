-- Elimina la tabla en caso de que exista
DROP TABLE IF EXISTS stage_fusion_api;
-- Elimina la tabla en caso de que exista
DROP TABLE IF EXISTS stage_json_api;

-- Elimina la secuencia en caso de que exista
DROP SEQUENCE IF EXISTS rd.seq_temp_json_api;
-- Crea la secuencia
CREATE SEQUENCE rd.seq_temp_json_api;

-- Crea una tabla temporal
CREATE TEMP TABLE stage_json_api (id INT DEFAULT NEXTVAL('rd.seq_temp_json_api'::regclass), json TEXT); 
 
-- Crea una tabla temporal
CREATE TEMP TABLE stage_fusion_api (x jsonb);
COPY stage_json_api(json) FROM 'C:\Users\Administrador\Desktop\rd update\FusionSolar\5minute.json';

-- Inserta datos
INSERT INTO stage_fusion_api(x)
SELECT   string_agg( json ,e'\n' ORDER BY id)::jsonb 
FROM     stage_json_api;

-- Inserta datos
INSERT INTO rd.fs_5min(devId , unix , pv1_u , pv2_u , pv3_u , power_factor , inverter_state , 
						open_time , a_i , total_cap , c_i , b_i , mppt_3_cap , a_u , reactive_power , c_u , temperature , b_u , bc_u , elec_freq ,
						mppt_4_cap , efficiency , day_cap , mppt_power , mppt_1_cap , close_time , pv1_i , pv2_i , pv3_i , active_power , mppt_2_cap , 
						ca_u , ab_u ) select 
    (value->>'devId')::text as "devId",
	(value->>'collectTime')::text as "unix",
	(value->'dataItemMap'->>'pv1_u')::numeric as "pv1_u",
	(value->'dataItemMap'->>'pv2_u')::numeric as "pv2_u",
	(value->'dataItemMap'->>'pv3_u')::numeric as "pv3_u",
	(value->'dataItemMap'->>'power_factor')::numeric as "power_factor",
	(value->'dataItemMap'->>'inverter_state')::numeric as "inverter_state",
	(value->'dataItemMap'->>'open_time')::numeric as "open_time",
	(value->'dataItemMap'->>'a_i')::numeric as "a_i",
	(value->'dataItemMap'->>'total_cap')::numeric as "total_cap",
	(value->'dataItemMap'->>'c_i')::numeric as "c_i",
	(value->'dataItemMap'->>'b_i')::numeric as "b_i",
	(value->'dataItemMap'->>'mppt_3_cap')::numeric as "mppt_3_cap",
	(value->'dataItemMap'->>'a_u')::numeric as "a_u",
	(value->'dataItemMap'->>'reactive_power')::numeric as "reactive_power",
	(value->'dataItemMap'->>'c_u')::numeric as "c_u",
	(value->'dataItemMap'->>'temperature')::numeric as "temperature",
	(value->'dataItemMap'->>'b_u')::numeric as "b_u",
	(value->'dataItemMap'->>'bc_u')::numeric as "bc_u",
	(value->'dataItemMap'->>'elec_freq')::numeric as "elec_freq",
	(value->'dataItemMap'->>'mppt_4_cap')::numeric as "mppt_4_cap",
	(value->'dataItemMap'->>'efficiency')::numeric as "efficiency",
	(value->'dataItemMap'->>'day_cap')::numeric as "day_cap",
	(value->'dataItemMap'->>'mppt_power')::numeric as "mppt_power",
	(value->'dataItemMap'->>'mppt_1_cap')::numeric as "mppt_1_cap",
	(value->'dataItemMap'->>'close_time')::numeric as "close_time",
	(value->'dataItemMap'->>'pv1_i')::numeric as "pv1_i",
	(value->'dataItemMap'->>'pv2_i')::numeric as "pv2_i",
	(value->'dataItemMap'->>'pv3_i')::numeric as "pv3_i",
	(value->'dataItemMap'->>'active_power')::numeric as "active_power",
	(value->'dataItemMap'->>'mppt_2_cap')::numeric as "mppt_2_cap",
	(value->'dataItemMap'->>'ca_u')::numeric as "ca_u",
	(value->'dataItemMap'->>'ab_u')::numeric as "ab_u"
	
from stage_fusion_api
cross join jsonb_array_elements(x->'data') ON CONFLICT DO NOTHING;

UPDATE rd.fs_5min SET date = s.a FROM (select to_timestamp(unix::numeric/1000) as a, devId, unix from rd.fs_5min WHERE date is null) as s WHERE s.devId = fs_5min.devId AND s.unix = fs_5min.unix AND date is null;

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Elimina la tabla en caso de que exista
DROP TABLE IF EXISTS stage_fusion_api;
-- Elimina la tabla en caso de que exista
DROP TABLE IF EXISTS stage_json_api;

-- Elimina la secuencia en caso de que exista
DROP SEQUENCE IF EXISTS rd.seq_temp_json_api;
-- Crea la secuencia
CREATE SEQUENCE rd.seq_temp_json_api;

-- Crea una tabla temporal
CREATE TEMP TABLE stage_json_api (id INT DEFAULT NEXTVAL('rd.seq_temp_json_api'::regclass), json TEXT); 
 
-- Crea una tabla temporal
CREATE TEMP TABLE stage_fusion_api (x jsonb);
COPY stage_json_api(json) FROM 'C:\Users\Administrador\Desktop\rd update\FusionSolar\39.json';

-- Inserta datos
INSERT INTO stage_fusion_api(x)
SELECT   string_agg( json ,e'\n' ORDER BY id)::jsonb 
FROM     stage_json_api;

-- Inserta datos
INSERT INTO rd.fs_5min(devId , unix , pv1_u , pv2_u , pv3_u , power_factor , inverter_state , 
						open_time , a_i , total_cap , c_i , b_i , mppt_3_cap , a_u , reactive_power , c_u , temperature , b_u , bc_u , elec_freq ,
						mppt_4_cap , efficiency , day_cap , mppt_power , mppt_1_cap , close_time , pv1_i , pv2_i , pv3_i , active_power , mppt_2_cap , 
						ca_u , ab_u ) select 
    (value->>'devId')::text as "devId",
	(value->>'collectTime')::text as "unix",
	(value->'dataItemMap'->>'pv1_u')::numeric as "pv1_u",
	(value->'dataItemMap'->>'pv2_u')::numeric as "pv2_u",
	(value->'dataItemMap'->>'pv3_u')::numeric as "pv3_u",
	(value->'dataItemMap'->>'power_factor')::numeric as "power_factor",
	(value->'dataItemMap'->>'inverter_state')::numeric as "inverter_state",
	(value->'dataItemMap'->>'open_time')::numeric as "open_time",
	(value->'dataItemMap'->>'a_i')::numeric as "a_i",
	(value->'dataItemMap'->>'total_cap')::numeric as "total_cap",
	(value->'dataItemMap'->>'c_i')::numeric as "c_i",
	(value->'dataItemMap'->>'b_i')::numeric as "b_i",
	(value->'dataItemMap'->>'mppt_3_cap')::numeric as "mppt_3_cap",
	(value->'dataItemMap'->>'a_u')::numeric as "a_u",
	(value->'dataItemMap'->>'reactive_power')::numeric as "reactive_power",
	(value->'dataItemMap'->>'c_u')::numeric as "c_u",
	(value->'dataItemMap'->>'temperature')::numeric as "temperature",
	(value->'dataItemMap'->>'b_u')::numeric as "b_u",
	(value->'dataItemMap'->>'bc_u')::numeric as "bc_u",
	(value->'dataItemMap'->>'elec_freq')::numeric as "elec_freq",
	(value->'dataItemMap'->>'mppt_4_cap')::numeric as "mppt_4_cap",
	(value->'dataItemMap'->>'efficiency')::numeric as "efficiency",
	(value->'dataItemMap'->>'day_cap')::numeric as "day_cap",
	(value->'dataItemMap'->>'mppt_power')::numeric as "mppt_power",
	(value->'dataItemMap'->>'mppt_1_cap')::numeric as "mppt_1_cap",
	(value->'dataItemMap'->>'close_time')::numeric as "close_time",
	(value->'dataItemMap'->>'pv1_i')::numeric as "pv1_i",
	(value->'dataItemMap'->>'pv2_i')::numeric as "pv2_i",
	(value->'dataItemMap'->>'pv3_i')::numeric as "pv3_i",
	(value->'dataItemMap'->>'active_power')::numeric as "active_power",
	(value->'dataItemMap'->>'mppt_2_cap')::numeric as "mppt_2_cap",
	(value->'dataItemMap'->>'ca_u')::numeric as "ca_u",
	(value->'dataItemMap'->>'ab_u')::numeric as "ab_u"
	
from stage_fusion_api
cross join jsonb_array_elements(x->'data') ON CONFLICT DO NOTHING;

UPDATE rd.fs_5min SET date = s.a FROM (select to_timestamp(unix::numeric/1000) as a, devId, unix from rd.fs_5min WHERE date is null) as s WHERE s.devId = fs_5min.devId AND s.unix = fs_5min.unix AND date is null;

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Elimina la tabla en caso de que exista
DROP TABLE IF EXISTS stage_fusion_api;
-- Elimina la tabla en caso de que exista
DROP TABLE IF EXISTS stage_json_api;

-- Elimina la secuencia en caso de que exista
DROP SEQUENCE IF EXISTS rd.seq_temp_json_api;
-- Crea la secuencia
CREATE SEQUENCE rd.seq_temp_json_api;

-- Crea una tabla temporal
CREATE TEMP TABLE stage_json_api (id INT DEFAULT NEXTVAL('rd.seq_temp_json_api'::regclass), json TEXT); 
 
-- Crea una tabla temporal
CREATE TEMP TABLE stage_fusion_api (x jsonb);
COPY stage_json_api(json) FROM 'C:\Users\Administrador\Desktop\rd update\FusionSolar\1.json';

-- Inserta datos
INSERT INTO stage_fusion_api(x)
SELECT   string_agg( json ,e'\n' ORDER BY id)::jsonb 
FROM     stage_json_api;

-- Inserta datos
INSERT INTO rd.fs_5min(devId , unix , pv1_u , pv2_u , pv3_u , power_factor , inverter_state , open_time , a_i , total_cap , c_i , b_i , mppt_3_cap , a_u , reactive_power , c_u , temperature , b_u , bc_u , elec_freq ,
						mppt_4_cap , efficiency , day_cap , mppt_power , mppt_1_cap , close_time , pv1_i , pv2_i , pv3_i , active_power , mppt_2_cap , 
						ca_u , ab_u ) select 
    (value->>'devId')::text as "devId",
	(value->>'collectTime')::text as "unix",
	(value->'dataItemMap'->>'pv1_u')::numeric as "pv1_u",
	(value->'dataItemMap'->>'pv2_u')::numeric as "pv2_u",
	(value->'dataItemMap'->>'pv3_u')::numeric as "pv3_u",
	(value->'dataItemMap'->>'power_factor')::numeric as "power_factor",
	(value->'dataItemMap'->>'inverter_state')::numeric as "inverter_state",
	(value->'dataItemMap'->>'open_time')::numeric as "open_time",
	(value->'dataItemMap'->>'a_i')::numeric as "a_i",
	(value->'dataItemMap'->>'total_cap')::numeric as "total_cap",
	(value->'dataItemMap'->>'c_i')::numeric as "c_i",
	(value->'dataItemMap'->>'b_i')::numeric as "b_i",
	(value->'dataItemMap'->>'mppt_3_cap')::numeric as "mppt_3_cap",
	(value->'dataItemMap'->>'a_u')::numeric as "a_u",
	(value->'dataItemMap'->>'reactive_power')::numeric as "reactive_power",
	(value->'dataItemMap'->>'c_u')::numeric as "c_u",
	(value->'dataItemMap'->>'temperature')::numeric as "temperature",
	(value->'dataItemMap'->>'b_u')::numeric as "b_u",
	(value->'dataItemMap'->>'bc_u')::numeric as "bc_u",
	(value->'dataItemMap'->>'elec_freq')::numeric as "elec_freq",
	(value->'dataItemMap'->>'mppt_4_cap')::numeric as "mppt_4_cap",
	(value->'dataItemMap'->>'efficiency')::numeric as "efficiency",
	(value->'dataItemMap'->>'day_cap')::numeric as "day_cap",
	(value->'dataItemMap'->>'mppt_power')::numeric as "mppt_power",
	(value->'dataItemMap'->>'mppt_1_cap')::numeric as "mppt_1_cap",
	(value->'dataItemMap'->>'close_time')::numeric as "close_time",
	(value->'dataItemMap'->>'pv1_i')::numeric as "pv1_i",
	(value->'dataItemMap'->>'pv2_i')::numeric as "pv2_i",
	(value->'dataItemMap'->>'pv3_i')::numeric as "pv3_i",
	(value->'dataItemMap'->>'active_power')::numeric as "active_power",
	(value->'dataItemMap'->>'mppt_2_cap')::numeric as "mppt_2_cap",
	(value->'dataItemMap'->>'ca_u')::numeric as "ca_u",
	(value->'dataItemMap'->>'ab_u')::numeric as "ab_u"
	
from stage_fusion_api
cross join jsonb_array_elements(x->'data') ON CONFLICT DO NOTHING;

UPDATE rd.fs_5min SET date = s.a FROM (select to_timestamp(unix::numeric/1000) as a, devId, unix from rd.fs_5min WHERE date is null) as s WHERE s.devId = fs_5min.devId AND s.unix = fs_5min.unix AND date is null;

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Elimina la tabla en caso de que exista
DROP TABLE IF EXISTS stage_fs_api;
-- Elimina la tabla en caso de que exista
DROP TABLE IF EXISTS stage_json_api;

-- Elimina la secuencia en caso de que exista
DROP SEQUENCE IF EXISTS rd.seq_temp_json_api;
-- Crea la secuencia
CREATE SEQUENCE rd.seq_temp_json_api;

-- Crea una tabla temporal
CREATE TEMP TABLE stage_json_api (id INT DEFAULT NEXTVAL('rd.seq_temp_json_api'::regclass), json TEXT); 
 
-- Crea una tabla temporal
CREATE TEMP TABLE stage_fs_api (x jsonb);
COPY stage_json_api(json) FROM 'C:\Users\Administrador\Desktop\rd update\FusionSolar\alarms.json' csv quote e'\x01' delimiter e'\x02';

-- Inserta datos
INSERT INTO stage_fs_api(x)
SELECT   string_agg( json ,e'\n' ORDER BY id)::jsonb 
FROM     stage_json_api;

-- Inserta datos
INSERT INTO rd.fs_alarm(alarmCause, 
						  alarmId, 
						  alarmName, 
						  alarmType, 
						  causeId, 
						  devName, 
						  devTypeId, 
						  esnCode, 
						  lev, 
						  raiseTime, 
						  repairSuggestion, 
						  stationCode, 
						  stationName, 
						  status) select 
    (value->>'alarmCause')::text as "alarmCause",
	(value->>'alarmId')::text as "alarmId",
	(value->>'alarmName')::text as "alarmName",
	(value->>'alarmType')::text as "alarmType",
	(value->>'causeId')::text as "causeId",
	(value->>'devName')::text as "devName",
	(value->>'devTypeId')::text as "devTypeId",
	(value->>'esnCode')::text as "esnCode",
	(value->>'lev')::text as "lev",
	(value->>'raiseTime')::text as "raiseTime",
	(value->>'repairSuggestion')::text as "repairSuggestion",
	(value->>'stationCode')::text as "stationCode",
	(value->>'stationName')::text as "stationName",
	(value->>'status')::text as "status"

	
from stage_fs_api
cross join jsonb_array_elements(x->'data') ON CONFLICT DO NOTHING;

UPDATE rd.fs_alarm SET date = s.a FROM (select to_timestamp(raiseTime::numeric/1000) as a, raiseTime from rd.fs_alarm WHERE date is null) as s WHERE s.raiseTime = fs_alarm.raiseTime AND s.raiseTime = fs_alarm.raiseTime AND date is null;

UPDATE rd.fs_5min SET row = s.a FROM (SELECT devid, row_number() over (ORDER BY devid, date) as a, date, day_cap FROM rd.fs_5min WHERE devid = '1000000033661691' ORDER BY devid, date) as s WHERE s.date = fs_5min.date AND s.devid = fs_5min.devid ;
UPDATE rd.fs_5min SET row = s.a FROM (SELECT devid, row_number() over (ORDER BY devid, date) as a, date, day_cap FROM rd.fs_5min WHERE devid = '1000000033690893' ORDER BY devid, date) as s WHERE s.date = fs_5min.date AND s.devid = fs_5min.devid ;
UPDATE rd.fs_5min SET row = s.a FROM (SELECT devid, row_number() over (ORDER BY devid, date) as a, date, day_cap FROM rd.fs_5min WHERE devid = '1000000033690896' ORDER BY devid, date) as s WHERE s.date = fs_5min.date AND s.devid = fs_5min.devid ;
UPDATE rd.fs_5min SET row = s.a FROM (SELECT devid, row_number() over (ORDER BY devid, date) as a, date, day_cap FROM rd.fs_5min WHERE devid = '1000000033682796' ORDER BY devid, date) as s WHERE s.date = fs_5min.date AND s.devid = fs_5min.devid ;
UPDATE rd.fs_5min SET row = s.a FROM (SELECT devid, row_number() over (ORDER BY devid, date) as a, date, day_cap FROM rd.fs_5min WHERE devid = '1000000033659023' ORDER BY devid, date) as s WHERE s.date = fs_5min.date AND s.devid = fs_5min.devid ;
UPDATE rd.fs_5min SET row = s.a FROM (SELECT devid, row_number() over (ORDER BY devid, date) as a, date, day_cap FROM rd.fs_5min WHERE devid = '1000000033662146' ORDER BY devid, date) as s WHERE s.date = fs_5min.date AND s.devid = fs_5min.devid ;
UPDATE rd.fs_5min SET row = s.a FROM (SELECT devid, row_number() over (ORDER BY devid, date) as a, date, day_cap FROM rd.fs_5min WHERE devid = '1000000033659065' ORDER BY devid, date) as s WHERE s.date = fs_5min.date AND s.devid = fs_5min.devid ;
UPDATE rd.fs_5min SET row = s.a FROM (SELECT devid, row_number() over (ORDER BY devid, date) as a, date, day_cap FROM rd.fs_5min WHERE devid = '1000000033669594' ORDER BY devid, date) as s WHERE s.date = fs_5min.date AND s.devid = fs_5min.devid ;
UPDATE rd.fs_5min SET row = s.a FROM (SELECT devid, row_number() over (ORDER BY devid, date) as a, date, day_cap FROM rd.fs_5min WHERE devid = '1000000033657576' ORDER BY devid, date) as s WHERE s.date = fs_5min.date AND s.devid = fs_5min.devid ;
UPDATE rd.fs_5min SET row = s.a FROM (SELECT devid, row_number() over (ORDER BY devid, date) as a, date, day_cap FROM rd.fs_5min WHERE devid = '1000000033661492' ORDER BY devid, date) as s WHERE s.date = fs_5min.date AND s.devid = fs_5min.devid ;
UPDATE rd.fs_5min SET row = s.a FROM (SELECT devid, row_number() over (ORDER BY devid, date) as a, date, day_cap FROM rd.fs_5min WHERE devid = '1000000033682799' ORDER BY devid, date) as s WHERE s.date = fs_5min.date AND s.devid = fs_5min.devid ;
UPDATE rd.fs_5min SET row = s.a FROM (SELECT devid, row_number() over (ORDER BY devid, date) as a, date, day_cap FROM rd.fs_5min WHERE devid = '1000000033662412' ORDER BY devid, date) as s WHERE s.date = fs_5min.date AND s.devid = fs_5min.devid ;
UPDATE rd.fs_5min SET row = s.a FROM (SELECT devid, row_number() over (ORDER BY devid, date) as a, date, day_cap FROM rd.fs_5min WHERE devid = '1000000033659022' ORDER BY devid, date) as s WHERE s.date = fs_5min.date AND s.devid = fs_5min.devid ;
UPDATE rd.fs_5min SET row = s.a FROM (SELECT devid, row_number() over (ORDER BY devid, date) as a, date, day_cap FROM rd.fs_5min WHERE devid = '1000000033658457' ORDER BY devid, date) as s WHERE s.date = fs_5min.date AND s.devid = fs_5min.devid ;
UPDATE rd.fs_5min SET row = s.a FROM (SELECT devid, row_number() over (ORDER BY devid, date) as a, date, day_cap FROM rd.fs_5min WHERE devid = '1000000033669593' ORDER BY devid, date) as s WHERE s.date = fs_5min.date AND s.devid = fs_5min.devid ;

UPDATE rd.fs_5min SET energy = s.a FROM (SELECT row, devid, date, day_cap, b.row2, b.devid2, b.date2, b.day_cap2, day_cap - COALESCE(day_cap2, day_cap) as a FROM rd.fs_5min as a
LEFT JOIN ( SELECT row +1 as row2, devid as devid2, date as date2, day_cap as day_cap2 FROM rd.fs_5min WHERE devid = '1000000033661691') as b ON a.row = b.row2 WHERE devid = '1000000033661691' ORDER BY row) as s where s.date = fs_5min.date AND s.devid = fs_5min.devid ;

UPDATE rd.fs_5min SET energy = s.a FROM (SELECT row, devid, date, day_cap, b.row2, b.devid2, b.date2, b.day_cap2, day_cap - COALESCE(day_cap2, day_cap) as a FROM rd.fs_5min as a
LEFT JOIN ( SELECT row +1 as row2, devid as devid2, date as date2, day_cap as day_cap2 FROM rd.fs_5min WHERE devid = '1000000033690893') as b ON a.row = b.row2 WHERE devid = '1000000033690893' ORDER BY row) as s where s.date = fs_5min.date AND s.devid = fs_5min.devid ;

UPDATE rd.fs_5min SET energy = s.a FROM (SELECT row, devid, date, day_cap, b.row2, b.devid2, b.date2, b.day_cap2, day_cap - COALESCE(day_cap2, day_cap) as a FROM rd.fs_5min as a
LEFT JOIN ( SELECT row +1 as row2, devid as devid2, date as date2, day_cap as day_cap2 FROM rd.fs_5min WHERE devid = '1000000033690896') as b ON a.row = b.row2 WHERE devid = '1000000033690896' ORDER BY row) as s where s.date = fs_5min.date AND s.devid = fs_5min.devid ;

UPDATE rd.fs_5min SET energy = s.a FROM (SELECT row, devid, date, day_cap, b.row2, b.devid2, b.date2, b.day_cap2, day_cap - COALESCE(day_cap2, day_cap) as a FROM rd.fs_5min as a
LEFT JOIN ( SELECT row +1 as row2, devid as devid2, date as date2, day_cap as day_cap2 FROM rd.fs_5min WHERE devid = '1000000033682796') as b ON a.row = b.row2 WHERE devid = '1000000033682796' ORDER BY row) as s where s.date = fs_5min.date AND s.devid = fs_5min.devid ;

UPDATE rd.fs_5min SET energy = s.a FROM (SELECT row, devid, date, day_cap, b.row2, b.devid2, b.date2, b.day_cap2, day_cap - COALESCE(day_cap2, day_cap) as a FROM rd.fs_5min as a
LEFT JOIN ( SELECT row +1 as row2, devid as devid2, date as date2, day_cap as day_cap2 FROM rd.fs_5min WHERE devid = '1000000033659023') as b ON a.row = b.row2 WHERE devid = '1000000033659023' ORDER BY row) as s where s.date = fs_5min.date AND s.devid = fs_5min.devid ;

UPDATE rd.fs_5min SET energy = s.a FROM (SELECT row, devid, date, day_cap, b.row2, b.devid2, b.date2, b.day_cap2, day_cap - COALESCE(day_cap2, day_cap) as a FROM rd.fs_5min as a
LEFT JOIN ( SELECT row +1 as row2, devid as devid2, date as date2, day_cap as day_cap2 FROM rd.fs_5min WHERE devid = '1000000033662146') as b ON a.row = b.row2 WHERE devid = '1000000033662146' ORDER BY row) as s where s.date = fs_5min.date AND s.devid = fs_5min.devid ;

UPDATE rd.fs_5min SET energy = s.a FROM (SELECT row, devid, date, day_cap, b.row2, b.devid2, b.date2, b.day_cap2, day_cap - COALESCE(day_cap2, day_cap) as a FROM rd.fs_5min as a
LEFT JOIN ( SELECT row +1 as row2, devid as devid2, date as date2, day_cap as day_cap2 FROM rd.fs_5min WHERE devid = '1000000033669594') as b ON a.row = b.row2 WHERE devid = '1000000033669594' ORDER BY row) as s where s.date = fs_5min.date AND s.devid = fs_5min.devid ;

UPDATE rd.fs_5min SET energy = s.a FROM (SELECT row, devid, date, day_cap, b.row2, b.devid2, b.date2, b.day_cap2, day_cap - COALESCE(day_cap2, day_cap) as a FROM rd.fs_5min as a
LEFT JOIN ( SELECT row +1 as row2, devid as devid2, date as date2, day_cap as day_cap2 FROM rd.fs_5min WHERE devid = '1000000033657576') as b ON a.row = b.row2 WHERE devid = '1000000033657576' ORDER BY row) as s where s.date = fs_5min.date AND s.devid = fs_5min.devid ;

UPDATE rd.fs_5min SET energy = s.a FROM (SELECT row, devid, date, day_cap, b.row2, b.devid2, b.date2, b.day_cap2, day_cap - COALESCE(day_cap2, day_cap) as a FROM rd.fs_5min as a
LEFT JOIN ( SELECT row +1 as row2, devid as devid2, date as date2, day_cap as day_cap2 FROM rd.fs_5min WHERE devid = '1000000033661492') as b ON a.row = b.row2 WHERE devid = '1000000033661492' ORDER BY row) as s where s.date = fs_5min.date AND s.devid = fs_5min.devid ;

UPDATE rd.fs_5min SET energy = s.a FROM (SELECT row, devid, date, day_cap, b.row2, b.devid2, b.date2, b.day_cap2, day_cap - COALESCE(day_cap2, day_cap) as a FROM rd.fs_5min as a
LEFT JOIN ( SELECT row +1 as row2, devid as devid2, date as date2, day_cap as day_cap2 FROM rd.fs_5min WHERE devid = '1000000033659065') as b ON a.row = b.row2 WHERE devid = '1000000033659065' ORDER BY row) as s where s.date = fs_5min.date AND s.devid = fs_5min.devid ;

UPDATE rd.fs_5min SET energy = s.a FROM (SELECT row, devid, date, day_cap, b.row2, b.devid2, b.date2, b.day_cap2, day_cap - COALESCE(day_cap2, day_cap) as a FROM rd.fs_5min as a
LEFT JOIN ( SELECT row +1 as row2, devid as devid2, date as date2, day_cap as day_cap2 FROM rd.fs_5min WHERE devid = '1000000033662412') as b ON a.row = b.row2 WHERE devid = '1000000033662412' ORDER BY row) as s where s.date = fs_5min.date AND s.devid = fs_5min.devid ;

UPDATE rd.fs_5min SET energy = s.a FROM (SELECT row, devid, date, day_cap, b.row2, b.devid2, b.date2, b.day_cap2, day_cap - COALESCE(day_cap2, day_cap) as a FROM rd.fs_5min as a
LEFT JOIN ( SELECT row +1 as row2, devid as devid2, date as date2, day_cap as day_cap2 FROM rd.fs_5min WHERE devid = '1000000033658457') as b ON a.row = b.row2 WHERE devid = '1000000033658457' ORDER BY row) as s where s.date = fs_5min.date AND s.devid = fs_5min.devid ;

UPDATE rd.fs_5min SET energy = s.a FROM (SELECT row, devid, date, day_cap, b.row2, b.devid2, b.date2, b.day_cap2, day_cap - COALESCE(day_cap2, day_cap) as a FROM rd.fs_5min as a
LEFT JOIN ( SELECT row +1 as row2, devid as devid2, date as date2, day_cap as day_cap2 FROM rd.fs_5min WHERE devid = '1000000033682799') as b ON a.row = b.row2 WHERE devid = '1000000033682799' ORDER BY row) as s where s.date = fs_5min.date AND s.devid = fs_5min.devid ;

UPDATE rd.fs_5min SET energy = s.a FROM (SELECT row, devid, date, day_cap, b.row2, b.devid2, b.date2, b.day_cap2, day_cap - COALESCE(day_cap2, day_cap) as a FROM rd.fs_5min as a
LEFT JOIN ( SELECT row +1 as row2, devid as devid2, date as date2, day_cap as day_cap2 FROM rd.fs_5min WHERE devid = '1000000033659022') as b ON a.row = b.row2 WHERE devid = '1000000033659022' ORDER BY row) as s where s.date = fs_5min.date AND s.devid = fs_5min.devid ;

UPDATE rd.fs_5min SET energy = s.a FROM (SELECT row, devid, date, day_cap, b.row2, b.devid2, b.date2, b.day_cap2, day_cap - COALESCE(day_cap2, day_cap) as a FROM rd.fs_5min as a
LEFT JOIN ( SELECT row +1 as row2, devid as devid2, date as date2, day_cap as day_cap2 FROM rd.fs_5min WHERE devid = '1000000033669593') as b ON a.row = b.row2 WHERE devid = '1000000033669593' ORDER BY row) as s where s.date = fs_5min.date AND s.devid = fs_5min.devid ;

UPDATE rd.fs_5min SET energy = 0 WHERE energy < 0;
