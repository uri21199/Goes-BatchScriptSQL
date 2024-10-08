---------------------POWER------------------

DROP TABLE IF EXISTS stage_forecast_power_cauchari;
DROP TABLE IF EXISTS stage_json_cau;
DROP SEQUENCE seq_temp_json;

create sequence seq_temp_json;

CREATE TEMP TABLE stage_json_cau 
  ( 
     id     INT DEFAULT NEXTVAL('seq_temp_json'::regclass), 
     json TEXT 
  ); 
 
CREATE TEMP TABLE stage_forecast_power_cauchari (x jsonb);
COPY stage_json_cau(json) FROM PROGRAM 'curl -H "Accept: application/json" -H "Authorization: Bearer QbkFB-yEJmIS5EikH7j_DCVbWVih1mM1" "https://api.solcast.com.au/utility_scale_sites/30ad-0a5e-3313-528a/forecasts?period=PT30M&format=json"';

INSERT INTO stage_forecast_power_cauchari(x)
SELECT   string_agg( json ,e'\n' ORDER BY id)::jsonb 
FROM     stage_json_cau;

INSERT INTO forecast_power_cauchari select 
    (value->>'pv_estimate')::numeric (6,2) as "pv_estimate",
	(value->>'pv_estimate10')::numeric (6,2) as "pv_estimate10",
	(value->>'pv_estimate90')::numeric (6,2) as "pv_estimate90",
	(value->>'period_end')::timestamptz as "period_end"
	
from stage_forecast_power_cauchari
cross join jsonb_array_elements(x->'forecasts') ON CONFLICT ON CONSTRAINT uc_forecast_power_cauchari DO NOTHING;

-------------------WEATHER-----------------------

DROP TABLE IF EXISTS stage_forecast_weather_cauchari;
DROP TABLE IF EXISTS stage_json_cau;
DROP SEQUENCE seq_temp_json;

create sequence seq_temp_json;

CREATE TEMP TABLE stage_json_cau 
  ( 
     id     INT DEFAULT NEXTVAL('seq_temp_json'::regclass), 
     json TEXT 
  ); 
 
CREATE TEMP TABLE stage_forecast_weather_cauchari (x jsonb);
COPY stage_json_cau(json) FROM PROGRAM 'curl -H "Accept: application/json" -H "Authorization: Bearer QbkFB-yEJmIS5EikH7j_DCVbWVih1mM1" "https://api.solcast.com.au/utility_scale_sites/30ad-0a5e-3313-528a/weather/forecasts?period=PT30M&format=json"';

INSERT INTO stage_forecast_weather_cauchari(x)
SELECT   string_agg( json ,e'\n' ORDER BY id)::jsonb 
FROM     stage_json_cau;

INSERT INTO forecast_weather_cauchari select 
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
	
from stage_forecast_weather_cauchari
cross join jsonb_array_elements(x->'forecasts') ON CONFLICT ON CONSTRAINT uc_forecast_weather_cauchari DO NOTHING;