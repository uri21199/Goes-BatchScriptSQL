-- Elimina las tablas en caso de que existan
DROP TABLE IF EXISTS stage_forecast_power_caf;
DROP TABLE IF EXISTS stage_json_caf;
-- Elimina la secuncia
DROP SEQUENCE seq_temp_json;
-- Crea la secuencia
create sequence seq_temp_json;
-- Crea una tabla temporal
CREATE TEMP TABLE stage_json_caf (id INT DEFAULT NEXTVAL('seq_temp_json'::regclass), json TEXT); 
-- Crea una tabla temporal
CREATE TEMP TABLE stage_forecast_power_caf (x jsonb);
-- Copia los datos extraidos de la URL dada
COPY stage_json_caf(json) FROM PROGRAM 'curl -H "Accept: application/json" -H "Authorization: Bearer 9jrB9TTzKLushlw1rrvcksb9lppmOw0c" "https://api.solcast.com.au/utility_scale_sites/0bc9-4365-d578-789a/forecasts?period=PT30M&format=json"';
-- Insertar datos
INSERT INTO stage_forecast_power_caf(x)
SELECT string_agg( json ,e'\n' ORDER BY id)::jsonb 
FROM stage_json_caf;
-- Insertar datos
INSERT INTO cafayate.forecast_power_caf select 
    (value->>'pv_estimate')::numeric (6,2) as "pv_estimate",
	(value->>'pv_estimate10')::numeric (6,2) as "pv_estimate10",
	(value->>'pv_estimate90')::numeric (6,2) as "pv_estimate90",
	(value->>'period_end')::timestamptz as "period_end"
	
from stage_forecast_power_caf
cross join jsonb_array_elements(x->'forecasts') ON CONFLICT ON CONSTRAINT uc_forecast_power_caf DO NOTHING;

-------------------WEATHER-----------------------
-- Elimina las tablas en caso de que existan
DROP TABLE IF EXISTS stage_forecast_weather_caf;
DROP TABLE IF EXISTS stage_json_caf;
-- Elimina la secuencia
DROP SEQUENCE seq_temp_json;
-- Crea la secuencia
create sequence seq_temp_json;
-- Crea una tabla temporal
CREATE TEMP TABLE stage_json_caf (id INT DEFAULT NEXTVAL('seq_temp_json'::regclass), json TEXT); 
CREATE TEMP TABLE stage_forecast_weather_caf (x jsonb);
-- Copia los datos extraidos de la URL
COPY stage_json_caf(json) FROM PROGRAM 'curl -H "Accept: application/json" -H "Authorization: Bearer 9jrB9TTzKLushlw1rrvcksb9lppmOw0c" "https://api.solcast.com.au/utility_scale_sites/0bc9-4365-d578-789a/weather/forecasts?period=PT30M&format=json"';
-- Insertar datos
INSERT INTO stage_forecast_weather_caf(x)
SELECT   string_agg( json ,e'\n' ORDER BY id)::jsonb 
FROM     stage_json_caf;
-- Insertar datos
INSERT INTO cafayate.forecast_weather_caf select 
    (value->>'ghi')::integer as "ghi",
	(value->>'ghi10')::integer as "ghi10",
	(value->>'ghi90')::integer as "ghi90",
	(value->>'dni')::integer as "dni",
	(value->>'dni10')::integer as "dni10",
	(value->>'dni90')::integer as "dni90",
	(value->>'ebh')::integer as "ebh",
	(value->>'dhi')::integer as "dhi",
	(value->>'air_temp')::integer as "air_temp",
	(value->>'azimuth')::numeric (6,2) as "azimuth",
	(value->>'cloud_opacity')::integer as "cloud_opacity",
	(value->>'period_end')::timestamptz as "period_end"
from stage_forecast_weather_caf
cross join jsonb_array_elements(x->'forecasts') ON CONFLICT ON CONSTRAINT uc_forecast_weather_caf DO NOTHING;