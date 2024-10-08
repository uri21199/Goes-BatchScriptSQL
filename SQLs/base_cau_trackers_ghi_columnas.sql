-- Si existe la tabla ghi_5min_columnas la elimina
drop table if exists ghi_5min_columnas;
-- Trae esos 
SELECT dblink_connect('postgres','host=localhost port=5432 dbname=postgres user=postgres password=basegoes options=-csearch_path=');
-- Crea la tabla ghi_5min_columnas a partir de la consulta del select
create table ghi_5min_columnas as SELECT * FROM dblink('postgres', 'select * from public.ghi_5min_columnas')
as t(
    date timestamp with time zone,
    "CAU1-WS-A07" numeric(10,4),
    "CAU1-WS-A19" numeric(10,4),
    "CAU1-WS-A29" numeric(10,4),
    "CAU2-WS-B08" numeric(10,4),
    "CAU2-WS-B30" numeric(10,4),
    "CAU2-WS-B35" numeric(10,4),
    "CAU3-WS-C08" numeric(10,4),
    "CAU3-WS-C11" numeric(10,4),
    "CAU3-WS-C29" numeric(10,4),
    avg_ghi numeric,
    avg_ghi_cau1 numeric,
    avg_ghi_cau2 numeric,
    avg_ghi_cau3 numeric,
    ghi_check integer,
    ghi_max_cau1 numeric,
    ghi_max_cau2 numeric,
    ghi_max_cau3 numeric,
    ghi_min_cau1 numeric,
    ghi_min_cau2 numeric,
    ghi_min_cau3 numeric,
    ghi_max_diff_cau1 numeric,
    ghi_max_diff_cau2 numeric,
    ghi_max_diff_cau3 numeric,
    ghi_seleccionada_cau1 numeric,
    ghi_seleccionada_cau2 numeric,
    ghi_seleccionada_cau3 numeric
);