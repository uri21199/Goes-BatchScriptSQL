-- Crear una tabla temporal para almacenar los detalles de las URLs, IDs y valores de CAU
CREATE TEMP TABLE ghi_requests(id text, cau text, url text);

-- Insertar los detalles de las solicitudes en la tabla
INSERT INTO ghi_requests (id, cau, url)
VALUES
    ('CAU1-WS-A07', 'CAU1FV', 'https://portal.unity.inaccess.com/ifms/sources/5a3e2216-07f9-11eb-aeeb-42010afa015a/events?&start_date=20240620T000000Z'),
    ('CAU1-WS-A29', 'CAU1FV', 'https://portal.unity.inaccess.com/ifms/sources/5abd0540-07f9-11eb-aeeb-42010afa015a/events?&start_date=20240620T000000Z'),
    ('CAU1-WS-A19', 'CAU1FV', 'https://portal.unity.inaccess.com/ifms/sources/5a7d7d76-07f9-11eb-aeeb-42010afa015a/events?&start_date=20240620T000000Z'),
    ('CAU2-WS-B08', 'CAU2FV', 'https://portal.unity.inaccess.com/ifms/sources/bd8b6e9e-07ec-11eb-8a43-42010afa015a/events?&start_date=20240620T000000Z'),
    ('CAU2-WS-B30', 'CAU2FV', 'https://portal.unity.inaccess.com/ifms/sources/bdca7102-07ec-11eb-8a43-42010afa015a/events?&start_date=20240620T000000Z'),
    ('CAU2-WS-B35', 'CAU2FV', 'https://portal.unity.inaccess.com/ifms/sources/be093dc4-07ec-11eb-8a43-42010afa015a/events?&start_date=20240620T000000Z'),
    ('CAU3-WS-C29', 'CAU3FV', 'https://portal.unity.inaccess.com/ifms/sources/133e7336-07ed-11eb-8564-42010afa015a/events?&start_date=20240620T000000Z'),
    ('CAU3-WS-C11', 'CAU3FV', 'https://portal.unity.inaccess.com/ifms/sources/13009fb6-07ed-11eb-8564-42010afa015a/events?&start_date=20240620T000000Z'),
    ('CAU3-WS-C08', 'CAU3FV', 'https://portal.unity.inaccess.com/ifms/sources/12c218fe-07ed-11eb-8564-42010afa015a/events?&start_date=20240620T000000Z');

-- Iterar sobre cada fila en la tabla temporal y realizar las operaciones
DO $$ 
DECLARE
    req RECORD;
BEGIN
    FOR req IN SELECT * FROM ghi_requests LOOP
        -- Crear tablas temporales
        DROP TABLE IF EXISTS ghi_5min_temp;
        DROP TABLE IF EXISTS ghi_5min_temp2;
        CREATE TEMP TABLE ghi_5min_temp(x jsonb);
        CREATE TEMP TABLE ghi_5min_temp2(date timestamptz, val numeric(10,4), id text, cau text);

        -- Descargar y copiar los datos usando curl
        EXECUTE format('COPY ghi_5min_temp FROM PROGRAM ''curl -H "Api-Key:38deaa51-8716-4cc9-aa42-ab14fb72a752.01" ''%s'''';', req.url);

        -- Poblar la tabla temporal y actualizar los valores
        INSERT INTO ghi_5min_temp2 
        SELECT f.* 
        FROM ghi_5min_temp, jsonb_populate_recordset(null::ghi_5min_temp2, x) f;

        -- Actualizar los valores de id y cau según los parámetros de la tabla temporal
        UPDATE ghi_5min_temp2 SET id = req.id;
        UPDATE ghi_5min_temp2 SET cau = req.cau;
        UPDATE ghi_5min_temp2 SET date = DATE_TRUNC('minute', date);

        -- Insertar los datos en la tabla final
        INSERT INTO ghi_5min 
        SELECT * 
        FROM ghi_5min_temp2 
        ON CONFLICT DO NOTHING;

    END LOOP;
END $$;

-- Limpiar la tabla temporal
DROP TABLE ghi_requests;

INSERT INTO ghi_5min(id, date) SELECT * from poa_ids CROSS JOIN generate_series(date_trunc('hour', now() - interval '3 days'),date_trunc('hour', now()), interval '5 minutes') ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS ghi_5min_columnas;
CREATE TABLE ghi_5min_columnas AS (select *
    from crosstab (
        'select date, id, val
        from ghi_5min
        order by 1, 2')
    AS ct(date timestamptz, 
	"CAU1-WS-A07" numeric(10,4), 
	"CAU1-WS-A19" numeric(10,4), 
	"CAU1-WS-A29" numeric(10,4),
	"CAU2-WS-B08" numeric(10,4),
	"CAU2-WS-B30" numeric(10,4),
	"CAU2-WS-B35" numeric(10,4),
	"CAU3-WS-C08" numeric(10,4),
	"CAU3-WS-C11" numeric(10,4),
	"CAU3-WS-C29" numeric(10,4)
	) ORDER BY date);


ALTER TABLE ghi_5min_columnas ADD COLUMN avg_ghi numeric;
UPDATE ghi_5min_columnas SET avg_ghi = s.b FROM (SELECT date,
       (SELECT AVG(a)::numeric (10, 4)
        FROM   (VALUES("CAU1-WS-A07"),
                      ("CAU1-WS-A29"),
                      ("CAU1-WS-A19"),
					  ("CAU2-WS-B08"),
                      ("CAU2-WS-B30"),
					  ("CAU2-WS-B35"),
					  ("CAU3-WS-C29"),
					  ("CAU3-WS-C11"),
                      ("CAU3-WS-C08")) T (a)) AS b
FROM   ghi_5min_columnas ) AS s WHERE s.date = ghi_5min_columnas.date;

ALTER TABLE ghi_5min_columnas ADD COLUMN avg_ghi_cau1 numeric;
UPDATE ghi_5min_columnas SET avg_ghi_cau1 = s.b FROM (SELECT date,
       (SELECT AVG(a)::numeric (10, 4)
        FROM   (VALUES("CAU1-WS-A07"),
                      ("CAU1-WS-A29"),
                      ("CAU1-WS-A19")) T (a)) AS b
FROM   ghi_5min_columnas ) AS s WHERE s.date = ghi_5min_columnas.date;

ALTER TABLE ghi_5min_columnas ADD COLUMN avg_ghi_cau2 numeric;
UPDATE ghi_5min_columnas SET avg_ghi_cau2 = s.b FROM (SELECT date,
       (SELECT AVG(a)::numeric (10, 4)
        FROM   (VALUES("CAU2-WS-B08"),
                      ("CAU2-WS-B30"),
					  ("CAU2-WS-B35")) T (a)) AS b
FROM   ghi_5min_columnas ) AS s WHERE s.date = ghi_5min_columnas.date;

ALTER TABLE ghi_5min_columnas ADD COLUMN avg_ghi_cau3 numeric;
UPDATE ghi_5min_columnas SET avg_ghi_cau3 = s.b FROM (SELECT date,
       (SELECT AVG(a)::numeric (10, 4)
        FROM   (VALUES("CAU3-WS-C29"),
					  ("CAU3-WS-C11"),
                      ("CAU3-WS-C08")) T (a)) AS b
FROM   ghi_5min_columnas ) AS s WHERE s.date = ghi_5min_columnas.date;


alter table ghi_5min_columnas add column ghi_check integer;
UPDATE ghi_5min_columnas SET ghi_check = 1 where avg_ghi >= 50;
UPDATE ghi_5min_columnas SET ghi_check = 0 where avg_ghi < 50;

GRANT SELECT ON TABLE public.ghi_5min_columnas TO python_pvlib;

ALTER TABLE ghi_5min_columnas ADD COLUMN ghi_max_cau1 numeric;
ALTER TABLE ghi_5min_columnas ADD COLUMN ghi_max_cau2 numeric;
ALTER TABLE ghi_5min_columnas ADD COLUMN ghi_max_cau3 numeric;

ALTER TABLE ghi_5min_columnas ADD COLUMN ghi_min_cau1 numeric;
ALTER TABLE ghi_5min_columnas ADD COLUMN ghi_min_cau2 numeric;
ALTER TABLE ghi_5min_columnas ADD COLUMN ghi_min_cau3 numeric;

ALTER TABLE ghi_5min_columnas ADD COLUMN ghi_max_diff_cau1 numeric;
ALTER TABLE ghi_5min_columnas ADD COLUMN ghi_max_diff_cau2 numeric;
ALTER TABLE ghi_5min_columnas ADD COLUMN ghi_max_diff_cau3 numeric;

ALTER TABLE ghi_5min_columnas ADD COLUMN ghi_seleccionada_cau1 numeric;
ALTER TABLE ghi_5min_columnas ADD COLUMN ghi_seleccionada_cau2 numeric;
ALTER TABLE ghi_5min_columnas ADD COLUMN ghi_seleccionada_cau3 numeric;


UPDATE ghi_5min_columnas 
	SET ghi_max_cau1 = ghi_max_cau1_calc.ghi_max_cau1 
	FROM (SELECT date,
       (SELECT MAX(b)::numeric (10, 4)
        FROM   (VALUES("CAU1-WS-A07"),
                      ("CAU1-WS-A19"),
                      ("CAU1-WS-A29")) T (b)) AS ghi_max_cau1
FROM   ghi_5min_columnas) AS ghi_max_cau1_calc WHERE ghi_max_cau1_calc.date=ghi_5min_columnas.date;

UPDATE ghi_5min_columnas 
	SET ghi_max_cau2 = ghi_max_cau2_calc.ghi_max_cau2 
	FROM (SELECT date,
       (SELECT MAX(b)::numeric (10, 4)
        FROM   (VALUES("CAU2-WS-B08"),
                      ("CAU2-WS-B30"),
                      ("CAU2-WS-B35")) T (b)) AS ghi_max_cau2
FROM   ghi_5min_columnas) AS ghi_max_cau2_calc WHERE ghi_max_cau2_calc.date=ghi_5min_columnas.date;

UPDATE ghi_5min_columnas 
	SET ghi_max_cau3 = ghi_max_cau3_calc.ghi_max_cau3 
	FROM (SELECT date,
       (SELECT MAX(b)::numeric (10, 4)
        FROM   (VALUES("CAU3-WS-C08"),
                      ("CAU3-WS-C11"),
                      ("CAU3-WS-C29")) T (b)) AS ghi_max_cau3
FROM   ghi_5min_columnas) AS ghi_max_cau3_calc WHERE ghi_max_cau3_calc.date=ghi_5min_columnas.date;

-------------

UPDATE ghi_5min_columnas 
	SET ghi_min_cau1 = ghi_min_cau1_calc.ghi_min_cau1 
	FROM (SELECT date,
       (SELECT min(b)::numeric (10, 4)
        FROM   (VALUES("CAU1-WS-A07"),
                      ("CAU1-WS-A19"),
                      ("CAU1-WS-A29")) T (b)) AS ghi_min_cau1
FROM   ghi_5min_columnas) AS ghi_min_cau1_calc WHERE ghi_min_cau1_calc.date=ghi_5min_columnas.date;

UPDATE ghi_5min_columnas 
	SET ghi_min_cau2 = ghi_min_cau2_calc.ghi_min_cau2 
	FROM (SELECT date,
       (SELECT min(b)::numeric (10, 4)
        FROM   (VALUES("CAU2-WS-B08"),
                      ("CAU2-WS-B30"),
                      ("CAU2-WS-B35")) T (b)) AS ghi_min_cau2
FROM   ghi_5min_columnas) AS ghi_min_cau2_calc WHERE ghi_min_cau2_calc.date=ghi_5min_columnas.date;

UPDATE ghi_5min_columnas 
	SET ghi_min_cau3 = ghi_min_cau3_calc.ghi_min_cau3 
	FROM (SELECT date,
       (SELECT min(b)::numeric (10, 4)
        FROM   (VALUES("CAU3-WS-C08"),
                      ("CAU3-WS-C11"),
                      ("CAU3-WS-C29")) T (b)) AS ghi_min_cau3
FROM   ghi_5min_columnas) AS ghi_min_cau3_calc WHERE ghi_min_cau3_calc.date=ghi_5min_columnas.date;

-----
UPDATE ghi_5min_columnas SET ghi_max_diff_cau1 = ghi_max_diff_cau1_calc.ghi_max_diff_cau1 FROM (SELECT date, ABS((ghi_max_cau1 / COALESCE(NULLIF(ghi_min_cau1,0), 1))-1) AS ghi_max_diff_cau1 FROM ghi_5min_columnas) AS ghi_max_diff_cau1_calc WHERE ghi_max_diff_cau1_calc.date=ghi_5min_columnas.date;

UPDATE ghi_5min_columnas SET ghi_seleccionada_cau1 = avg_ghi_cau1 WHERE  ghi_max_diff_cau1 <= 0.02;
UPDATE ghi_5min_columnas SET ghi_seleccionada_cau1 = ghi_max_cau1 WHERE  ghi_max_diff_cau1 > 0.02;
-----
UPDATE ghi_5min_columnas SET ghi_max_diff_cau2 = ghi_max_diff_cau2_calc.ghi_max_diff_cau2 FROM (SELECT date, ABS((ghi_max_cau2 / COALESCE(NULLIF(ghi_min_cau2,0), 1))-1) AS ghi_max_diff_cau2 FROM ghi_5min_columnas) AS ghi_max_diff_cau2_calc WHERE ghi_max_diff_cau2_calc.date=ghi_5min_columnas.date;

UPDATE ghi_5min_columnas SET ghi_seleccionada_cau2 = avg_ghi_cau2 WHERE  ghi_max_diff_cau2 <= 0.02;
UPDATE ghi_5min_columnas SET ghi_seleccionada_cau2 = ghi_max_cau2 WHERE  ghi_max_diff_cau2 > 0.02;
-----
UPDATE ghi_5min_columnas SET ghi_max_diff_cau3 = ghi_max_diff_cau3_calc.ghi_max_diff_cau3 FROM (SELECT date, ABS((ghi_max_cau3 / COALESCE(NULLIF(ghi_min_cau3,0), 1))-1) AS ghi_max_diff_cau3 FROM ghi_5min_columnas) AS ghi_max_diff_cau3_calc WHERE ghi_max_diff_cau3_calc.date=ghi_5min_columnas.date;

UPDATE ghi_5min_columnas SET ghi_seleccionada_cau3 = avg_ghi_cau3 WHERE  ghi_max_diff_cau3 <= 0.02;
UPDATE ghi_5min_columnas SET ghi_seleccionada_cau3 = ghi_max_cau3 WHERE  ghi_max_diff_cau3 > 0.02;

delete from ghi_5min_columnas where date > now() - interval '15 minutes';
------------------------------------------------------------------------------------

INSERT INTO poa_5min_columnas SELECT x::timestamptz
FROM   generate_series(DATE_TRUNC('minute', (current_date::timestamptz - interval '3 days'))
                     , DATE_TRUNC('minute', current_date::timestamptz)
                     , interval  '5 min') t(x) ON CONFLICT ON CONSTRAINT uc_poa_5min_columnas DO NOTHING;

------------------------------------------------------------------------------------
DROP TABLE IF EXISTS poa_ii;
CREATE TEMP TABLE poa_ii(date timestamptz, val numeric);

DROP TABLE IF EXISTS stage_poa_cau1;
DROP TABLE IF EXISTS stage_poa_cau12;
CREATE TEMP TABLE stage_poa_cau1(x jsonb);
CREATE TEMP TABLE stage_poa_cau12(date timestamptz, val numeric);
COPY stage_poa_cau1 FROM PROGRAM 'curl -H "Api-Key:38deaa51-8716-4cc9-aa42-ab14fb72a752.01" "https://portal.unity.inaccess.com/ifms/sources/592be124-07f9-11eb-aeeb-42010afa015a/events?&start_date=20240620T000000Z"';
INSERT INTO stage_poa_cau12 select f.* from stage_poa_cau1, jsonb_populate_recordset(null::stage_poa_cau12, x) f;
UPDATE stage_poa_cau12 SET date = DATE_TRUNC('minute', date);
INSERT INTO poa_ii SELECT * from stage_poa_cau12;

DROP TABLE IF EXISTS stage_poa_cau1;
DROP TABLE IF EXISTS stage_poa_cau12;
CREATE TEMP TABLE stage_poa_cau1(x jsonb);
CREATE TEMP TABLE stage_poa_cau12(date timestamptz, val numeric);
COPY stage_poa_cau1 FROM PROGRAM 'curl -H "Api-Key:38deaa51-8716-4cc9-aa42-ab14fb72a752.01" "https://portal.unity.inaccess.com/ifms/sources/592c5686-07f9-11eb-aeeb-42010afa015a/events?&start_date=20240620T000000Z"';
INSERT INTO stage_poa_cau12 select f.* from stage_poa_cau1, jsonb_populate_recordset(null::stage_poa_cau12, x) f;
UPDATE stage_poa_cau12 SET date = DATE_TRUNC('minute', date);
INSERT INTO poa_ii SELECT * from stage_poa_cau12;

UPDATE poa_5min_columnas SET "CAU1-WS-A07" = "CAU1-WS-A07".avg_val FROM (SELECT date, AVG(val) as avg_val FROM poa_ii GROUP BY date) AS "CAU1-WS-A07" WHERE poa_5min_columnas.date="CAU1-WS-A07".date;
-------------------------------------WS-A19-------------------------------
DROP TABLE IF EXISTS poa_ii;
CREATE TEMP TABLE poa_ii(date timestamptz, val numeric);

DROP TABLE IF EXISTS stage_poa_cau1;
DROP TABLE IF EXISTS stage_poa_cau12;
CREATE TEMP TABLE stage_poa_cau1(x jsonb);
CREATE TEMP TABLE stage_poa_cau12(date timestamptz, val numeric);
COPY stage_poa_cau1 FROM PROGRAM 'curl -H "Api-Key:38deaa51-8716-4cc9-aa42-ab14fb72a752.01" "https://portal.unity.inaccess.com/ifms/sources/5968cbb6-07f9-11eb-aeeb-42010afa015a/events?&start_date=20240620T000000Z"';
INSERT INTO stage_poa_cau12 select f.* from stage_poa_cau1, jsonb_populate_recordset(null::stage_poa_cau12, x) f;
UPDATE stage_poa_cau12 SET date = DATE_TRUNC('minute', date);
INSERT INTO poa_ii SELECT * from stage_poa_cau12;

DROP TABLE IF EXISTS stage_poa_cau1;
DROP TABLE IF EXISTS stage_poa_cau12;
CREATE TEMP TABLE stage_poa_cau1(x jsonb);
CREATE TEMP TABLE stage_poa_cau12(date timestamptz, val numeric);
COPY stage_poa_cau1 FROM PROGRAM 'curl -H "Api-Key:38deaa51-8716-4cc9-aa42-ab14fb72a752.01" "https://portal.unity.inaccess.com/ifms/sources/596952b6-07f9-11eb-aeeb-42010afa015a/events?&start_date=20240620T000000Z"';
INSERT INTO stage_poa_cau12 select f.* from stage_poa_cau1, jsonb_populate_recordset(null::stage_poa_cau12, x) f;
UPDATE stage_poa_cau12 SET date = DATE_TRUNC('minute', date);
INSERT INTO poa_ii SELECT * from stage_poa_cau12;

UPDATE poa_5min_columnas SET "CAU1-WS-A19" = "CAU1-WS-A19".avg_val FROM (SELECT date, AVG(val) as avg_val FROM poa_ii GROUP BY date) AS "CAU1-WS-A19" WHERE poa_5min_columnas.date="CAU1-WS-A19".date;
-------------------------------------WS-A29-------------------------------
DROP TABLE IF EXISTS poa_ii;
CREATE TEMP TABLE poa_ii(date timestamptz, val numeric);

DROP TABLE IF EXISTS stage_poa_cau1;
DROP TABLE IF EXISTS stage_poa_cau12;
CREATE TEMP TABLE stage_poa_cau1(x jsonb);
CREATE TEMP TABLE stage_poa_cau12(date timestamptz, val numeric);
COPY stage_poa_cau1 FROM PROGRAM 'curl -H "Api-Key:38deaa51-8716-4cc9-aa42-ab14fb72a752.01" "https://portal.unity.inaccess.com/ifms/sources/59b02ccc-07f9-11eb-aeeb-42010afa015a/events?&start_date=20240620T000000Z"';
INSERT INTO stage_poa_cau12 select f.* from stage_poa_cau1, jsonb_populate_recordset(null::stage_poa_cau12, x) f;
UPDATE stage_poa_cau12 SET date = DATE_TRUNC('minute', date);
INSERT INTO poa_ii SELECT * from stage_poa_cau12;

DROP TABLE IF EXISTS stage_poa_cau1;
DROP TABLE IF EXISTS stage_poa_cau12;
CREATE TEMP TABLE stage_poa_cau1(x jsonb);
CREATE TEMP TABLE stage_poa_cau12(date timestamptz, val numeric);
COPY stage_poa_cau1 FROM PROGRAM 'curl -H "Api-Key:38deaa51-8716-4cc9-aa42-ab14fb72a752.01" "https://portal.unity.inaccess.com/ifms/sources/59b0a170-07f9-11eb-aeeb-42010afa015a/events?&start_date=20240620T000000Z"';
INSERT INTO stage_poa_cau12 select f.* from stage_poa_cau1, jsonb_populate_recordset(null::stage_poa_cau12, x) f;
UPDATE stage_poa_cau12 SET date = DATE_TRUNC('minute', date);
INSERT INTO poa_ii SELECT * from stage_poa_cau12;

UPDATE poa_5min_columnas SET "CAU1-WS-A29" = "CAU1-WS-A29".avg_val FROM (SELECT date, AVG(val) as avg_val FROM poa_ii GROUP BY date) AS "CAU1-WS-A29" WHERE poa_5min_columnas.date="CAU1-WS-A29".date;



-------------------------------------"CAU2-WS-B08"-------------------------------
DROP TABLE IF EXISTS poa_ii2;
CREATE TEMP TABLE poa_ii2(date timestamptz, val numeric);

DROP TABLE IF EXISTS stage_poa_cau2;
DROP TABLE IF EXISTS stage_poa_cau22;
CREATE TEMP TABLE stage_poa_cau2(x jsonb);
CREATE TEMP TABLE stage_poa_cau22(date timestamptz, val numeric);
COPY stage_poa_cau2 FROM PROGRAM 'curl -H "Api-Key:38deaa51-8716-4cc9-aa42-ab14fb72a752.01" "https://portal.unity.inaccess.com/ifms/sources/bc954d7a-07ec-11eb-8a43-42010afa015a/events?&start_date=20240620T000000Z"';
INSERT INTO stage_poa_cau22 select f.* from stage_poa_cau2, jsonb_populate_recordset(null::stage_poa_cau22, x) f;
UPDATE stage_poa_cau22 SET date = DATE_TRUNC('minute', date);
INSERT INTO poa_ii2 SELECT * from stage_poa_cau22;

DROP TABLE IF EXISTS stage_poa_cau2;
DROP TABLE IF EXISTS stage_poa_cau22;
CREATE TEMP TABLE stage_poa_cau2(x jsonb);
CREATE TEMP TABLE stage_poa_cau22(date timestamptz, val numeric);
COPY stage_poa_cau2 FROM PROGRAM 'curl -H "Api-Key:38deaa51-8716-4cc9-aa42-ab14fb72a752.01" "https://portal.unity.inaccess.com/ifms/sources/bc95b9f4-07ec-11eb-8a43-42010afa015a/events?&start_date=20240620T000000Z"';
INSERT INTO stage_poa_cau22 select f.* from stage_poa_cau2, jsonb_populate_recordset(null::stage_poa_cau22, x) f;
UPDATE stage_poa_cau22 SET date = DATE_TRUNC('minute', date);
INSERT INTO poa_ii2 SELECT * from stage_poa_cau22;

UPDATE poa_5min_columnas SET "CAU2-WS-B08" = "CAU2-WS-B08".avg_val FROM (SELECT date, AVG(val) as avg_val FROM poa_ii2 GROUP BY date) AS "CAU2-WS-B08" WHERE poa_5min_columnas.date="CAU2-WS-B08".date;
-------------------------------------"CAU2-WS-B30"-------------------------------
DROP TABLE IF EXISTS poa_ii2;
CREATE TEMP TABLE poa_ii2(date timestamptz, val numeric);

DROP TABLE IF EXISTS stage_poa_cau2;
DROP TABLE IF EXISTS stage_poa_cau22;
CREATE TEMP TABLE stage_poa_cau2(x jsonb);
CREATE TEMP TABLE stage_poa_cau22(date timestamptz, val numeric);
COPY stage_poa_cau2 FROM PROGRAM 'curl -H "Api-Key:38deaa51-8716-4cc9-aa42-ab14fb72a752.01" "https://portal.unity.inaccess.com/ifms/sources/bccd55d0-07ec-11eb-8a43-42010afa015a/events?&start_date=20240620T000000Z"';
INSERT INTO stage_poa_cau22 select f.* from stage_poa_cau2, jsonb_populate_recordset(null::stage_poa_cau22, x) f;
UPDATE stage_poa_cau22 SET date = DATE_TRUNC('minute', date);
INSERT INTO poa_ii2 SELECT * from stage_poa_cau22;

DROP TABLE IF EXISTS stage_poa_cau2;
DROP TABLE IF EXISTS stage_poa_cau22;
CREATE TEMP TABLE stage_poa_cau2(x jsonb);
CREATE TEMP TABLE stage_poa_cau22(date timestamptz, val numeric);
COPY stage_poa_cau2 FROM PROGRAM 'curl -H "Api-Key:38deaa51-8716-4cc9-aa42-ab14fb72a752.01" "https://portal.unity.inaccess.com/ifms/sources/bccdbe30-07ec-11eb-8a43-42010afa015a/events?&start_date=20240620T000000Z"';
INSERT INTO stage_poa_cau22 select f.* from stage_poa_cau2, jsonb_populate_recordset(null::stage_poa_cau22, x) f;
UPDATE stage_poa_cau22 SET date = DATE_TRUNC('minute', date);
INSERT INTO poa_ii2 SELECT * from stage_poa_cau22;

UPDATE poa_5min_columnas SET "CAU2-WS-B30" = "CAU2-WS-B30".avg_val FROM (SELECT date, AVG(val) as avg_val FROM poa_ii2 GROUP BY date) AS "CAU2-WS-B30" WHERE poa_5min_columnas.date="CAU2-WS-B30".date;
-------------------------------------"CAU2-WS-B35"-------------------------------
DROP TABLE IF EXISTS poa_ii2;
CREATE TEMP TABLE poa_ii2(date timestamptz, val numeric);

DROP TABLE IF EXISTS stage_poa_cau2;
DROP TABLE IF EXISTS stage_poa_cau22;
CREATE TEMP TABLE stage_poa_cau2(x jsonb);
CREATE TEMP TABLE stage_poa_cau22(date timestamptz, val numeric);
COPY stage_poa_cau2 FROM PROGRAM 'curl -H "Api-Key:38deaa51-8716-4cc9-aa42-ab14fb72a752.01" "https://portal.unity.inaccess.com/ifms/sources/bd070910-07ec-11eb-8a43-42010afa015a/events?&start_date=20240620T000000Z"';
INSERT INTO stage_poa_cau22 select f.* from stage_poa_cau2, jsonb_populate_recordset(null::stage_poa_cau22, x) f;
UPDATE stage_poa_cau22 SET date = DATE_TRUNC('minute', date);
INSERT INTO poa_ii2 SELECT * from stage_poa_cau22;

DROP TABLE IF EXISTS stage_poa_cau2;
DROP TABLE IF EXISTS stage_poa_cau22;
CREATE TEMP TABLE stage_poa_cau2(x jsonb);
CREATE TEMP TABLE stage_poa_cau22(date timestamptz, val numeric);
COPY stage_poa_cau2 FROM PROGRAM 'curl -H "Api-Key:38deaa51-8716-4cc9-aa42-ab14fb72a752.01" "https://portal.unity.inaccess.com/ifms/sources/bd078c82-07ec-11eb-8a43-42010afa015a/events?&start_date=20240620T000000Z"';
INSERT INTO stage_poa_cau22 select f.* from stage_poa_cau2, jsonb_populate_recordset(null::stage_poa_cau22, x) f;
UPDATE stage_poa_cau22 SET date = DATE_TRUNC('minute', date);
INSERT INTO poa_ii2 SELECT * from stage_poa_cau22;

UPDATE poa_5min_columnas SET "CAU2-WS-B35" = "CAU2-WS-B35".avg_val FROM (SELECT date, AVG(val) as avg_val FROM poa_ii2 GROUP BY date) AS "CAU2-WS-B35" WHERE poa_5min_columnas.date="CAU2-WS-B35".date;

-------------------------------------"CAU3-WS-C29"-------------------------------
DROP TABLE IF EXISTS poa_ii3;
CREATE TEMP TABLE poa_ii3(date timestamptz, val numeric);

DROP TABLE IF EXISTS stage_poa_cau3;
DROP TABLE IF EXISTS stage_poa_cau32;
CREATE TEMP TABLE stage_poa_cau3(x jsonb);
CREATE TEMP TABLE stage_poa_cau32(date timestamptz, val numeric);
COPY stage_poa_cau3 FROM PROGRAM 'curl -H "Api-Key:38deaa51-8716-4cc9-aa42-ab14fb72a752.01" "https://portal.unity.inaccess.com/ifms/sources/1238808a-07ed-11eb-8564-42010afa015a/events?&start_date=20240620T000000Z"';
INSERT INTO stage_poa_cau32 select f.* from stage_poa_cau3, jsonb_populate_recordset(null::stage_poa_cau32, x) f;
UPDATE stage_poa_cau32 SET date = DATE_TRUNC('minute', date);
INSERT INTO poa_ii3 SELECT * from stage_poa_cau32;

DROP TABLE IF EXISTS stage_poa_cau3;
DROP TABLE IF EXISTS stage_poa_cau32;
CREATE TEMP TABLE stage_poa_cau3(x jsonb);
CREATE TEMP TABLE stage_poa_cau32(date timestamptz, val numeric);
COPY stage_poa_cau3 FROM PROGRAM 'curl -H "Api-Key:38deaa51-8716-4cc9-aa42-ab14fb72a752.01" "https://portal.unity.inaccess.com/ifms/sources/1238eb06-07ed-11eb-8564-42010afa015a/events?&start_date=20240620T000000Z"';
INSERT INTO stage_poa_cau32 select f.* from stage_poa_cau3, jsonb_populate_recordset(null::stage_poa_cau32, x) f;
UPDATE stage_poa_cau32 SET date = DATE_TRUNC('minute', date);
INSERT INTO poa_ii3 SELECT * from stage_poa_cau32;

UPDATE poa_5min_columnas SET "CAU3-WS-C29" = "CAU3-WS-C29".avg_val FROM (SELECT date, AVG(val) as avg_val FROM poa_ii3 GROUP BY date) AS "CAU3-WS-C29" WHERE poa_5min_columnas.date="CAU3-WS-C29".date;
-------------------------------------"CAU3-WS-C11"-------------------------------
DROP TABLE IF EXISTS poa_ii3;
CREATE TEMP TABLE poa_ii3(date timestamptz, val numeric);

DROP TABLE IF EXISTS stage_poa_cau3;
DROP TABLE IF EXISTS stage_poa_cau32;
CREATE TEMP TABLE stage_poa_cau3(x jsonb);
CREATE TEMP TABLE stage_poa_cau32(date timestamptz, val numeric);
COPY stage_poa_cau3 FROM PROGRAM 'curl -H "Api-Key:38deaa51-8716-4cc9-aa42-ab14fb72a752.01" "https://portal.unity.inaccess.com/ifms/sources/11ff716e-07ed-11eb-8564-42010afa015a/events?&start_date=20240620T000000Z"';
INSERT INTO stage_poa_cau32 select f.* from stage_poa_cau3, jsonb_populate_recordset(null::stage_poa_cau32, x) f;
UPDATE stage_poa_cau32 SET date = DATE_TRUNC('minute', date);
INSERT INTO poa_ii3 SELECT * from stage_poa_cau32;

DROP TABLE IF EXISTS stage_poa_cau3;
DROP TABLE IF EXISTS stage_poa_cau32;
CREATE TEMP TABLE stage_poa_cau3(x jsonb);
CREATE TEMP TABLE stage_poa_cau32(date timestamptz, val numeric);
COPY stage_poa_cau3 FROM PROGRAM 'curl -H "Api-Key:38deaa51-8716-4cc9-aa42-ab14fb72a752.01" "https://portal.unity.inaccess.com/ifms/sources/11ffe5f4-07ed-11eb-8564-42010afa015a/events?&start_date=20240620T000000Z"';
INSERT INTO stage_poa_cau32 select f.* from stage_poa_cau3, jsonb_populate_recordset(null::stage_poa_cau32, x) f;
UPDATE stage_poa_cau32 SET date = DATE_TRUNC('minute', date);
INSERT INTO poa_ii3 SELECT * from stage_poa_cau32;

UPDATE poa_5min_columnas SET "CAU3-WS-C11" = "CAU3-WS-C11".avg_val FROM (SELECT date, AVG(val) as avg_val FROM poa_ii3 GROUP BY date) AS "CAU3-WS-C11" WHERE poa_5min_columnas.date="CAU3-WS-C11".date;
-------------------------------------"CAU3-WS-C08"-------------------------------
DROP TABLE IF EXISTS poa_ii3;
CREATE TEMP TABLE poa_ii3(date timestamptz, val numeric);

DROP TABLE IF EXISTS stage_poa_cau3;
DROP TABLE IF EXISTS stage_poa_cau32;
CREATE TEMP TABLE stage_poa_cau3(x jsonb);
CREATE TEMP TABLE stage_poa_cau32(date timestamptz, val numeric);
COPY stage_poa_cau3 FROM PROGRAM 'curl -H "Api-Key:38deaa51-8716-4cc9-aa42-ab14fb72a752.01" "https://portal.unity.inaccess.com/ifms/sources/11c6f5fa-07ed-11eb-8564-42010afa015a/events?&start_date=20240620T000000Z"';
INSERT INTO stage_poa_cau32 select f.* from stage_poa_cau3, jsonb_populate_recordset(null::stage_poa_cau32, x) f;
UPDATE stage_poa_cau32 SET date = DATE_TRUNC('minute', date);
INSERT INTO poa_ii3 SELECT * from stage_poa_cau32;

DROP TABLE IF EXISTS stage_poa_cau3;
DROP TABLE IF EXISTS stage_poa_cau32;
CREATE TEMP TABLE stage_poa_cau3(x jsonb);
CREATE TEMP TABLE stage_poa_cau32(date timestamptz, val numeric);
COPY stage_poa_cau3 FROM PROGRAM 'curl -H "Api-Key:38deaa51-8716-4cc9-aa42-ab14fb72a752.01" "https://portal.unity.inaccess.com/ifms/sources/11c76c2e-07ed-11eb-8564-42010afa015a/events?&start_date=20240620T000000Z"';
INSERT INTO stage_poa_cau32 select f.* from stage_poa_cau3, jsonb_populate_recordset(null::stage_poa_cau32, x) f;
UPDATE stage_poa_cau32 SET date = DATE_TRUNC('minute', date);
INSERT INTO poa_ii3 SELECT * from stage_poa_cau32;

UPDATE poa_5min_columnas SET "CAU3-WS-C08" = "CAU3-WS-C08".avg_val FROM (SELECT date, AVG(val) as avg_val FROM poa_ii3 GROUP BY date) AS "CAU3-WS-C08" WHERE poa_5min_columnas.date="CAU3-WS-C08".date;


UPDATE poa_5min_columnas SET avg_poa = s.b FROM (SELECT date,
       (SELECT AVG(a)::numeric (10, 4)
        FROM   (VALUES("CAU1-WS-A07"),
                      ("CAU1-WS-A29"),
                      ("CAU1-WS-A19"),
					  ("CAU2-WS-B08"),
                      ("CAU2-WS-B30"),
					  ("CAU2-WS-B35"),
					  ("CAU3-WS-C29"),
					  ("CAU3-WS-C11"),
                      ("CAU3-WS-C08")) T (a)) AS b
FROM   poa_5min_columnas ) AS s WHERE s.date = poa_5min_columnas.date;


UPDATE poa_5min_columnas SET avg_poa_cau1 = s.b FROM (SELECT date,
       (SELECT AVG(a)::numeric (10, 4)
        FROM   (VALUES("CAU1-WS-A07"),
                      ("CAU1-WS-A29"),
                      ("CAU1-WS-A19")) T (a)) AS b
FROM   poa_5min_columnas ) AS s WHERE s.date = poa_5min_columnas.date;


UPDATE poa_5min_columnas SET avg_poa_cau2 = s.b FROM (SELECT date,
       (SELECT AVG(a)::numeric (10, 4)
        FROM   (VALUES("CAU2-WS-B08"),
                      ("CAU2-WS-B30"),
					  ("CAU2-WS-B35")) T (a)) AS b
FROM   poa_5min_columnas ) AS s WHERE s.date = poa_5min_columnas.date;


UPDATE poa_5min_columnas SET avg_poa_cau3 = s.b FROM (SELECT date,
       (SELECT AVG(a)::numeric (10, 4)
        FROM   (VALUES("CAU3-WS-C29"),
					  ("CAU3-WS-C11"),
                      ("CAU3-WS-C08")) T (a)) AS b
FROM   poa_5min_columnas ) AS s WHERE s.date = poa_5min_columnas.date;


UPDATE poa_5min_columnas SET poa_check = 1 where avg_poa >= 50;
UPDATE poa_5min_columnas SET poa_check = 0 where avg_poa < 50;

UPDATE poa_5min_columnas 
	SET poa_max_cau1 = poa_max_cau1_calc.poa_max_cau1 
	FROM (SELECT date,
       (SELECT MAX(b)::numeric (10, 4)
        FROM   (VALUES("CAU1-WS-A07"),
                      ("CAU1-WS-A19"),
                      ("CAU1-WS-A29")) T (b)) AS poa_max_cau1
FROM   poa_5min_columnas) AS poa_max_cau1_calc WHERE poa_max_cau1_calc.date=poa_5min_columnas.date;

UPDATE poa_5min_columnas 
	SET poa_max_cau2 = poa_max_cau2_calc.poa_max_cau2 
	FROM (SELECT date,
       (SELECT MAX(b)::numeric (10, 4)
        FROM   (VALUES("CAU2-WS-B08"),
                      ("CAU2-WS-B30"),
                      ("CAU2-WS-B35")) T (b)) AS poa_max_cau2
FROM   poa_5min_columnas) AS poa_max_cau2_calc WHERE poa_max_cau2_calc.date=poa_5min_columnas.date;

UPDATE poa_5min_columnas 
	SET poa_max_cau3 = poa_max_cau3_calc.poa_max_cau3 
	FROM (SELECT date,
       (SELECT MAX(b)::numeric (10, 4)
        FROM   (VALUES("CAU3-WS-C08"),
                      ("CAU3-WS-C11"),
                      ("CAU3-WS-C29")) T (b)) AS poa_max_cau3
FROM   poa_5min_columnas) AS poa_max_cau3_calc WHERE poa_max_cau3_calc.date=poa_5min_columnas.date;

-------------

UPDATE poa_5min_columnas 
	SET poa_min_cau1 = poa_min_cau1_calc.poa_min_cau1 
	FROM (SELECT date,
       (SELECT min(b)::numeric (10, 4)
        FROM   (VALUES("CAU1-WS-A07"),
                      ("CAU1-WS-A19"),
                      ("CAU1-WS-A29")) T (b)) AS poa_min_cau1
FROM   poa_5min_columnas) AS poa_min_cau1_calc WHERE poa_min_cau1_calc.date=poa_5min_columnas.date;

UPDATE poa_5min_columnas 
	SET poa_min_cau2 = poa_min_cau2_calc.poa_min_cau2 
	FROM (SELECT date,
       (SELECT min(b)::numeric (10, 4)
        FROM   (VALUES("CAU2-WS-B08"),
                      ("CAU2-WS-B30"),
                      ("CAU2-WS-B35")) T (b)) AS poa_min_cau2
FROM   poa_5min_columnas) AS poa_min_cau2_calc WHERE poa_min_cau2_calc.date=poa_5min_columnas.date;

UPDATE poa_5min_columnas 
	SET poa_min_cau3 = poa_min_cau3_calc.poa_min_cau3 
	FROM (SELECT date,
       (SELECT min(b)::numeric (10, 4)
        FROM   (VALUES("CAU3-WS-C08"),
                      ("CAU3-WS-C11"),
                      ("CAU3-WS-C29")) T (b)) AS poa_min_cau3
FROM   poa_5min_columnas) AS poa_min_cau3_calc WHERE poa_min_cau3_calc.date=poa_5min_columnas.date;

-----
UPDATE poa_5min_columnas SET poa_max_diff_cau1 = poa_max_diff_cau1_calc.poa_max_diff_cau1 FROM (SELECT date, ABS((poa_max_cau1 / COALESCE(NULLIF(poa_min_cau1,0), 1))-1) AS poa_max_diff_cau1 FROM poa_5min_columnas) AS poa_max_diff_cau1_calc WHERE poa_max_diff_cau1_calc.date=poa_5min_columnas.date;

UPDATE poa_5min_columnas SET poa_seleccionada_cau1 = avg_poa_cau1 WHERE  poa_max_diff_cau1 <= 0.02;
UPDATE poa_5min_columnas SET poa_seleccionada_cau1 = poa_max_cau1 WHERE  poa_max_diff_cau1 > 0.02;
-----
UPDATE poa_5min_columnas SET poa_max_diff_cau2 = poa_max_diff_cau2_calc.poa_max_diff_cau2 FROM (SELECT date, ABS((poa_max_cau2 / COALESCE(NULLIF(poa_min_cau2,0), 1))-1) AS poa_max_diff_cau2 FROM poa_5min_columnas) AS poa_max_diff_cau2_calc WHERE poa_max_diff_cau2_calc.date=poa_5min_columnas.date;

UPDATE poa_5min_columnas SET poa_seleccionada_cau2 = avg_poa_cau2 WHERE  poa_max_diff_cau2 <= 0.02;
UPDATE poa_5min_columnas SET poa_seleccionada_cau2 = poa_max_cau2 WHERE  poa_max_diff_cau2 > 0.02;
-----
UPDATE poa_5min_columnas SET poa_max_diff_cau3 = poa_max_diff_cau3_calc.poa_max_diff_cau3 FROM (SELECT date, ABS((poa_max_cau3 / COALESCE(NULLIF(poa_min_cau3,0), 1))-1) AS poa_max_diff_cau3 FROM poa_5min_columnas) AS poa_max_diff_cau3_calc WHERE poa_max_diff_cau3_calc.date=poa_5min_columnas.date;

UPDATE poa_5min_columnas SET poa_seleccionada_cau3 = avg_poa_cau3 WHERE  poa_max_diff_cau3 <= 0.02;
UPDATE poa_5min_columnas SET poa_seleccionada_cau3 = poa_max_cau3 WHERE  poa_max_diff_cau3 > 0.02;

delete from poa_5min_columnas where date > now() - interval '15 minutes';
-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS wind_5min_temp;
DROP TABLE IF EXISTS wind_5min_temp2;
CREATE TEMP TABLE wind_5min_temp(x jsonb);
CREATE TEMP TABLE wind_5min_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY wind_5min_temp FROM PROGRAM 'curl -H "Api-Key:38deaa51-8716-4cc9-aa42-ab14fb72a752.01" "https://portal.unity.inaccess.com/ifms/sources/5a5bf804-07f9-11eb-aeeb-42010afa015a/events?&start_date=20240620T000000Z"';
INSERT INTO wind_5min_temp2 select f.* from wind_5min_temp, jsonb_populate_recordset(null::wind_5min_temp2, x) f;
UPDATE wind_5min_temp2 SET id = 'CAU1-WS-A07';
UPDATE wind_5min_temp2 SET cau = 'CAU1FV';
UPDATE wind_5min_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO wind_5min SELECT * from wind_5min_temp2 ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS wind_5min_temp;
DROP TABLE IF EXISTS wind_5min_temp2;
CREATE TEMP TABLE wind_5min_temp(x jsonb);
CREATE TEMP TABLE wind_5min_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY wind_5min_temp FROM PROGRAM 'curl -H "Api-Key:38deaa51-8716-4cc9-aa42-ab14fb72a752.01" "https://portal.unity.inaccess.com/ifms/sources/5adc0e9a-07f9-11eb-aeeb-42010afa015a/events?&start_date=20240620T000000Z"';
INSERT INTO wind_5min_temp2 select f.* from wind_5min_temp, jsonb_populate_recordset(null::wind_5min_temp2, x) f;
UPDATE wind_5min_temp2 SET id = 'CAU1-WS-A29';
UPDATE wind_5min_temp2 SET cau = 'CAU1FV';
UPDATE wind_5min_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO wind_5min SELECT * from wind_5min_temp2 ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS wind_5min_temp;
DROP TABLE IF EXISTS wind_5min_temp2;
CREATE TEMP TABLE wind_5min_temp(x jsonb);
CREATE TEMP TABLE wind_5min_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY wind_5min_temp FROM PROGRAM 'curl -H "Api-Key:38deaa51-8716-4cc9-aa42-ab14fb72a752.01" "https://portal.unity.inaccess.com/ifms/sources/5a9b752e-07f9-11eb-aeeb-42010afa015a/events?&start_date=20240620T000000Z"';
INSERT INTO wind_5min_temp2 select f.* from wind_5min_temp, jsonb_populate_recordset(null::wind_5min_temp2, x) f;
UPDATE wind_5min_temp2 SET id = 'CAU1-WS-A19';
UPDATE wind_5min_temp2 SET cau = 'CAU1FV';
UPDATE wind_5min_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO wind_5min SELECT * from wind_5min_temp2 ON CONFLICT DO NOTHING;

-------------------------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS wind_5min_temp;
DROP TABLE IF EXISTS wind_5min_temp2;
CREATE TEMP TABLE wind_5min_temp(x jsonb);
CREATE TEMP TABLE wind_5min_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY wind_5min_temp FROM PROGRAM 'curl -H "Api-Key:38deaa51-8716-4cc9-aa42-ab14fb72a752.01" "https://portal.unity.inaccess.com/ifms/sources/bda99a86-07ec-11eb-8a43-42010afa015a/events?&start_date=20240620T000000Z"';
INSERT INTO wind_5min_temp2 select f.* from wind_5min_temp, jsonb_populate_recordset(null::wind_5min_temp2, x) f;
UPDATE wind_5min_temp2 SET id = 'CAU2-WS-B08';
UPDATE wind_5min_temp2 SET cau = 'CAU2FV';
UPDATE wind_5min_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO wind_5min SELECT * from wind_5min_temp2 ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS wind_5min_temp;
DROP TABLE IF EXISTS wind_5min_temp2;
CREATE TEMP TABLE wind_5min_temp(x jsonb);
CREATE TEMP TABLE wind_5min_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY wind_5min_temp FROM PROGRAM 'curl -H "Api-Key:38deaa51-8716-4cc9-aa42-ab14fb72a752.01" "https://portal.unity.inaccess.com/ifms/sources/bde7f4b6-07ec-11eb-8a43-42010afa015a/events?&start_date=20240620T000000Z"';
INSERT INTO wind_5min_temp2 select f.* from wind_5min_temp, jsonb_populate_recordset(null::wind_5min_temp2, x) f;
UPDATE wind_5min_temp2 SET id = 'CAU2-WS-B30';
UPDATE wind_5min_temp2 SET cau = 'CAU2FV';
UPDATE wind_5min_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO wind_5min SELECT * from wind_5min_temp2 ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS wind_5min_temp;
DROP TABLE IF EXISTS wind_5min_temp2;
CREATE TEMP TABLE wind_5min_temp(x jsonb);
CREATE TEMP TABLE wind_5min_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY wind_5min_temp FROM PROGRAM 'curl -H "Api-Key:38deaa51-8716-4cc9-aa42-ab14fb72a752.01" "https://portal.unity.inaccess.com/ifms/sources/be27a480-07ec-11eb-8a43-42010afa015a/events?&start_date=20240620T000000Z"';
INSERT INTO wind_5min_temp2 select f.* from wind_5min_temp, jsonb_populate_recordset(null::wind_5min_temp2, x) f;
UPDATE wind_5min_temp2 SET id = 'CAU2-WS-B35';
UPDATE wind_5min_temp2 SET cau = 'CAU2FV';
UPDATE wind_5min_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO wind_5min SELECT * from wind_5min_temp2 ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS wind_5min_temp;
DROP TABLE IF EXISTS wind_5min_temp2;
CREATE TEMP TABLE wind_5min_temp(x jsonb);
CREATE TEMP TABLE wind_5min_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY wind_5min_temp FROM PROGRAM 'curl -H "Api-Key:38deaa51-8716-4cc9-aa42-ab14fb72a752.01" "https://portal.unity.inaccess.com/ifms/sources/135b3638-07ed-11eb-8564-42010afa015a/events?&start_date=20240620T000000Z"';
INSERT INTO wind_5min_temp2 select f.* from wind_5min_temp, jsonb_populate_recordset(null::wind_5min_temp2, x) f;
UPDATE wind_5min_temp2 SET id = 'CAU3-WS-C29';
UPDATE wind_5min_temp2 SET cau = 'CAU3FV';
UPDATE wind_5min_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO wind_5min SELECT * from wind_5min_temp2 ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS wind_5min_temp;
DROP TABLE IF EXISTS wind_5min_temp2;
CREATE TEMP TABLE wind_5min_temp(x jsonb);
CREATE TEMP TABLE wind_5min_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY wind_5min_temp FROM PROGRAM 'curl -H "Api-Key:38deaa51-8716-4cc9-aa42-ab14fb72a752.01" "https://portal.unity.inaccess.com/ifms/sources/131db8a8-07ed-11eb-8564-42010afa015a/events?&start_date=20240620T000000Z"';
INSERT INTO wind_5min_temp2 select f.* from wind_5min_temp, jsonb_populate_recordset(null::wind_5min_temp2, x) f;
UPDATE wind_5min_temp2 SET id = 'CAU3-WS-C11';
UPDATE wind_5min_temp2 SET cau = 'CAU3FV';
UPDATE wind_5min_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO wind_5min SELECT * from wind_5min_temp2 ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS wind_5min_temp;
DROP TABLE IF EXISTS wind_5min_temp2;
CREATE TEMP TABLE wind_5min_temp(x jsonb);
CREATE TEMP TABLE wind_5min_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY wind_5min_temp FROM PROGRAM 'curl -H "Api-Key:38deaa51-8716-4cc9-aa42-ab14fb72a752.01" "https://portal.unity.inaccess.com/ifms/sources/12e01f70-07ed-11eb-8564-42010afa015a/events?&start_date=20240620T000000Z"';
INSERT INTO wind_5min_temp2 select f.* from wind_5min_temp, jsonb_populate_recordset(null::wind_5min_temp2, x) f;
UPDATE wind_5min_temp2 SET id = 'CAU3-WS-C08';
UPDATE wind_5min_temp2 SET cau = 'CAU3FV';
UPDATE wind_5min_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO wind_5min SELECT * from wind_5min_temp2 ON CONFLICT DO NOTHING;

INSERT INTO wind_5min(id, date) SELECT * from poa_ids CROSS JOIN generate_series(date_trunc('hour', now() - interval '3 days'), date_trunc('minute', now()), interval '1 minutes') ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS wind_5min_columnas;
CREATE TABLE wind_5min_columnas AS (select *
    from crosstab (
        'select date, id, val
        from wind_5min
        order by 1, 2')
    AS ct(date timestamptz, 
	"CAU1-WS-A07" numeric(10,4), 
	"CAU1-WS-A19" numeric(10,4), 
	"CAU1-WS-A29" numeric(10,4),
	"CAU2-WS-B08" numeric(10,4),
	"CAU2-WS-B30" numeric(10,4),
	"CAU2-WS-B35" numeric(10,4),
	"CAU3-WS-C08" numeric(10,4),
	"CAU3-WS-C11" numeric(10,4),
	"CAU3-WS-C29" numeric(10,4)
	) ORDER BY date);


ALTER TABLE wind_5min_columnas ADD COLUMN avg_wind numeric;
UPDATE wind_5min_columnas SET avg_wind = s.b FROM (SELECT date,
       (SELECT AVG(a)::numeric (10, 4)
        FROM   (VALUES("CAU1-WS-A07"),
                      ("CAU1-WS-A29"),
                      ("CAU1-WS-A19"),
					  ("CAU2-WS-B08"),
                      ("CAU2-WS-B30"),
					  ("CAU2-WS-B35"),
					  ("CAU3-WS-C29"),
					  ("CAU3-WS-C11"),
                      ("CAU3-WS-C08")) T (a)) AS b
FROM   wind_5min_columnas ) AS s WHERE s.date = wind_5min_columnas.date;

ALTER TABLE wind_5min_columnas ADD COLUMN avg_wind_cau1 numeric;
UPDATE wind_5min_columnas SET avg_wind_cau1 = s.b FROM (SELECT date,
       (SELECT AVG(a)::numeric (10, 4)
        FROM   (VALUES("CAU1-WS-A07"),
                      ("CAU1-WS-A29"),
                      ("CAU1-WS-A19")) T (a)) AS b
FROM   wind_5min_columnas ) AS s WHERE s.date = wind_5min_columnas.date;

ALTER TABLE wind_5min_columnas ADD COLUMN avg_wind_cau2 numeric;
UPDATE wind_5min_columnas SET avg_wind_cau2 = s.b FROM (SELECT date,
       (SELECT AVG(a)::numeric (10, 4)
        FROM   (VALUES("CAU2-WS-B08"),
                      ("CAU2-WS-B30"),
					  ("CAU2-WS-B35")) T (a)) AS b
FROM   wind_5min_columnas ) AS s WHERE s.date = wind_5min_columnas.date;

ALTER TABLE wind_5min_columnas ADD COLUMN avg_wind_cau3 numeric;
UPDATE wind_5min_columnas SET avg_wind_cau3 = s.b FROM (SELECT date,
       (SELECT AVG(a)::numeric (10, 4)
        FROM   (VALUES("CAU3-WS-C29"),
					  ("CAU3-WS-C11"),
                      ("CAU3-WS-C08")) T (a)) AS b
FROM   wind_5min_columnas ) AS s WHERE s.date = wind_5min_columnas.date;


-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS temp_5min_temp;
DROP TABLE IF EXISTS temp_5min_temp2;
CREATE TEMP TABLE temp_5min_temp(x jsonb);
CREATE TEMP TABLE temp_5min_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY temp_5min_temp FROM PROGRAM 'curl -H "Api-Key:38deaa51-8716-4cc9-aa42-ab14fb72a752.01" "https://portal.unity.inaccess.com/ifms/sources/5a626b44-07f9-11eb-aeeb-42010afa015a/events?&start_date=20240620T000000Z"';
INSERT INTO temp_5min_temp2 select f.* from temp_5min_temp, jsonb_populate_recordset(null::temp_5min_temp2, x) f;
UPDATE temp_5min_temp2 SET id = 'CAU1-WS-A07';
UPDATE temp_5min_temp2 SET cau = 'CAU1FV';
UPDATE temp_5min_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO temp_5min SELECT * from temp_5min_temp2 ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS temp_5min_temp;
DROP TABLE IF EXISTS temp_5min_temp2;
CREATE TEMP TABLE temp_5min_temp(x jsonb);
CREATE TEMP TABLE temp_5min_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY temp_5min_temp FROM PROGRAM 'curl -H "Api-Key:38deaa51-8716-4cc9-aa42-ab14fb72a752.01" "https://portal.unity.inaccess.com/ifms/sources/5ae2ea1c-07f9-11eb-aeeb-42010afa015a/events?&start_date=20240620T000000Z"';
INSERT INTO temp_5min_temp2 select f.* from temp_5min_temp, jsonb_populate_recordset(null::temp_5min_temp2, x) f;
UPDATE temp_5min_temp2 SET id = 'CAU1-WS-A29';
UPDATE temp_5min_temp2 SET cau = 'CAU1FV';
UPDATE temp_5min_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO temp_5min SELECT * from temp_5min_temp2 ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS temp_5min_temp;
DROP TABLE IF EXISTS temp_5min_temp2;
CREATE TEMP TABLE temp_5min_temp(x jsonb);
CREATE TEMP TABLE temp_5min_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY temp_5min_temp FROM PROGRAM 'curl -H "Api-Key:38deaa51-8716-4cc9-aa42-ab14fb72a752.01" "https://portal.unity.inaccess.com/ifms/sources/5aa263e8-07f9-11eb-aeeb-42010afa015a/events?&start_date=20240620T000000Z"';
INSERT INTO temp_5min_temp2 select f.* from temp_5min_temp, jsonb_populate_recordset(null::temp_5min_temp2, x) f;
UPDATE temp_5min_temp2 SET id = 'CAU1-WS-A19';
UPDATE temp_5min_temp2 SET cau = 'CAU1FV';
UPDATE temp_5min_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO temp_5min SELECT * from temp_5min_temp2 ON CONFLICT DO NOTHING;

-------------------------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS temp_5min_temp;
DROP TABLE IF EXISTS temp_5min_temp2;
CREATE TEMP TABLE temp_5min_temp(x jsonb);
CREATE TEMP TABLE temp_5min_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY temp_5min_temp FROM PROGRAM 'curl -H "Api-Key:38deaa51-8716-4cc9-aa42-ab14fb72a752.01" "https://portal.unity.inaccess.com/ifms/sources/bdb00fc4-07ec-11eb-8a43-42010afa015a/events?&start_date=20240620T000000Z"';
INSERT INTO temp_5min_temp2 select f.* from temp_5min_temp, jsonb_populate_recordset(null::temp_5min_temp2, x) f;
UPDATE temp_5min_temp2 SET id = 'CAU2-WS-B08';
UPDATE temp_5min_temp2 SET cau = 'CAU2FV';
UPDATE temp_5min_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO temp_5min SELECT * from temp_5min_temp2 ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS temp_5min_temp;
DROP TABLE IF EXISTS temp_5min_temp2;
CREATE TEMP TABLE temp_5min_temp(x jsonb);
CREATE TEMP TABLE temp_5min_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY temp_5min_temp FROM PROGRAM 'curl -H "Api-Key:38deaa51-8716-4cc9-aa42-ab14fb72a752.01" "https://portal.unity.inaccess.com/ifms/sources/bdef07b0-07ec-11eb-8a43-42010afa015a/events?&start_date=20240620T000000Z"';
INSERT INTO temp_5min_temp2 select f.* from temp_5min_temp, jsonb_populate_recordset(null::temp_5min_temp2, x) f;
UPDATE temp_5min_temp2 SET id = 'CAU2-WS-B30';
UPDATE temp_5min_temp2 SET cau = 'CAU2FV';
UPDATE temp_5min_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO temp_5min SELECT * from temp_5min_temp2 ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS temp_5min_temp;
DROP TABLE IF EXISTS temp_5min_temp2;
CREATE TEMP TABLE temp_5min_temp(x jsonb);
CREATE TEMP TABLE temp_5min_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY temp_5min_temp FROM PROGRAM 'curl -H "Api-Key:38deaa51-8716-4cc9-aa42-ab14fb72a752.01" "https://portal.unity.inaccess.com/ifms/sources/be2e1cde-07ec-11eb-8a43-42010afa015a/events?&start_date=20240620T000000Z"';
INSERT INTO temp_5min_temp2 select f.* from temp_5min_temp, jsonb_populate_recordset(null::temp_5min_temp2, x) f;
UPDATE temp_5min_temp2 SET id = 'CAU2-WS-B35';
UPDATE temp_5min_temp2 SET cau = 'CAU2FV';
UPDATE temp_5min_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO temp_5min SELECT * from temp_5min_temp2 ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS temp_5min_temp;
DROP TABLE IF EXISTS temp_5min_temp2;
CREATE TEMP TABLE temp_5min_temp(x jsonb);
CREATE TEMP TABLE temp_5min_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY temp_5min_temp FROM PROGRAM 'curl -H "Api-Key:38deaa51-8716-4cc9-aa42-ab14fb72a752.01" "https://portal.unity.inaccess.com/ifms/sources/13620e72-07ed-11eb-8564-42010afa015a/events?&start_date=20240620T000000Z"';
INSERT INTO temp_5min_temp2 select f.* from temp_5min_temp, jsonb_populate_recordset(null::temp_5min_temp2, x) f;
UPDATE temp_5min_temp2 SET id = 'CAU3-WS-C29';
UPDATE temp_5min_temp2 SET cau = 'CAU3FV';
UPDATE temp_5min_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO temp_5min SELECT * from temp_5min_temp2 ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS temp_5min_temp;
DROP TABLE IF EXISTS temp_5min_temp2;
CREATE TEMP TABLE temp_5min_temp(x jsonb);
CREATE TEMP TABLE temp_5min_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY temp_5min_temp FROM PROGRAM 'curl -H "Api-Key:38deaa51-8716-4cc9-aa42-ab14fb72a752.01" "https://portal.unity.inaccess.com/ifms/sources/1324b234-07ed-11eb-8564-42010afa015a/events?&start_date=20240620T000000Z"';
INSERT INTO temp_5min_temp2 select f.* from temp_5min_temp, jsonb_populate_recordset(null::temp_5min_temp2, x) f;
UPDATE temp_5min_temp2 SET id = 'CAU3-WS-C11';
UPDATE temp_5min_temp2 SET cau = 'CAU3FV';
UPDATE temp_5min_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO temp_5min SELECT * from temp_5min_temp2 ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS temp_5min_temp;
DROP TABLE IF EXISTS temp_5min_temp2;
CREATE TEMP TABLE temp_5min_temp(x jsonb);
CREATE TEMP TABLE temp_5min_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY temp_5min_temp FROM PROGRAM 'curl -H "Api-Key:38deaa51-8716-4cc9-aa42-ab14fb72a752.01" "https://portal.unity.inaccess.com/ifms/sources/12e69378-07ed-11eb-8564-42010afa015a/events?&start_date=20240620T000000Z"';
INSERT INTO temp_5min_temp2 select f.* from temp_5min_temp, jsonb_populate_recordset(null::temp_5min_temp2, x) f;
UPDATE temp_5min_temp2 SET id = 'CAU3-WS-C08';
UPDATE temp_5min_temp2 SET cau = 'CAU3FV';
UPDATE temp_5min_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO temp_5min SELECT * from temp_5min_temp2 ON CONFLICT DO NOTHING;

INSERT INTO temp_5min(id, date) SELECT * from poa_ids CROSS JOIN generate_series(date_trunc('hour', now() - interval '3 days'), date_trunc('hours', now()), interval '1 minutes') ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS temp_5min_columnas;
CREATE TABLE temp_5min_columnas AS (select *
    from crosstab (
        'select date, id, val
        from temp_5min
        order by 1, 2')
    AS ct(date timestamptz, 
	"CAU1-WS-A07" numeric(10,4), 
	"CAU1-WS-A19" numeric(10,4), 
	"CAU1-WS-A29" numeric(10,4),
	"CAU2-WS-B08" numeric(10,4),
	"CAU2-WS-B30" numeric(10,4),
	"CAU2-WS-B35" numeric(10,4),
	"CAU3-WS-C08" numeric(10,4),
	"CAU3-WS-C11" numeric(10,4),
	"CAU3-WS-C29" numeric(10,4)
	) ORDER BY date);


ALTER TABLE temp_5min_columnas ADD COLUMN avg_temp numeric;
UPDATE temp_5min_columnas SET avg_temp = s.b FROM (SELECT date,
       (SELECT AVG(a)::numeric (10, 4)
        FROM   (VALUES("CAU1-WS-A07"),
                      ("CAU1-WS-A29"),
                      ("CAU1-WS-A19"),
					  ("CAU2-WS-B08"),
                      ("CAU2-WS-B30"),
					  ("CAU2-WS-B35"),
					  ("CAU3-WS-C29"),
					  ("CAU3-WS-C11"),
                      ("CAU3-WS-C08")) T (a)) AS b
FROM   temp_5min_columnas ) AS s WHERE s.date = temp_5min_columnas.date;

ALTER TABLE temp_5min_columnas ADD COLUMN avg_temp_cau1 numeric;
UPDATE temp_5min_columnas SET avg_temp_cau1 = s.b FROM (SELECT date,
       (SELECT AVG(a)::numeric (10, 4)
        FROM   (VALUES("CAU1-WS-A07"),
                      ("CAU1-WS-A29"),
                      ("CAU1-WS-A19")) T (a)) AS b
FROM   temp_5min_columnas ) AS s WHERE s.date = temp_5min_columnas.date;

ALTER TABLE temp_5min_columnas ADD COLUMN avg_temp_cau2 numeric;
UPDATE temp_5min_columnas SET avg_temp_cau2 = s.b FROM (SELECT date,
       (SELECT AVG(a)::numeric (10, 4)
        FROM   (VALUES("CAU2-WS-B08"),
                      ("CAU2-WS-B30"),
					  ("CAU2-WS-B35")) T (a)) AS b
FROM   temp_5min_columnas ) AS s WHERE s.date = temp_5min_columnas.date;

ALTER TABLE temp_5min_columnas ADD COLUMN avg_temp_cau3 numeric;
UPDATE temp_5min_columnas SET avg_temp_cau3 = s.b FROM (SELECT date,
       (SELECT AVG(a)::numeric (10, 4)
        FROM   (VALUES("CAU3-WS-C29"),
					  ("CAU3-WS-C11"),
                      ("CAU3-WS-C08")) T (a)) AS b
FROM   temp_5min_columnas ) AS s WHERE s.date = temp_5min_columnas.date;

-----------

DROP TABLE IF EXISTS mod_temp_5min_temp;
DROP TABLE IF EXISTS mod_temp_5min_temp2;
CREATE TEMP TABLE mod_temp_5min_temp(x jsonb);
CREATE TEMP TABLE mod_temp_5min_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY mod_temp_5min_temp FROM PROGRAM 'curl -H "Api-Key:38deaa51-8716-4cc9-aa42-ab14fb72a752.01" "https://portal.unity.inaccess.com/ifms/sources/592bb10e-07f9-11eb-aeeb-42010afa015a/events?start_date=20240620T000000Z"';
INSERT INTO mod_temp_5min_temp2 select f.* from mod_temp_5min_temp, jsonb_populate_recordset(null::mod_temp_5min_temp2, x) f;
UPDATE mod_temp_5min_temp2 SET id = 'CAU1-WS-A07-1';
UPDATE mod_temp_5min_temp2 SET cau = 'CAU1FV';
UPDATE mod_temp_5min_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO mod_temp_5min SELECT * from mod_temp_5min_temp2 ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS mod_temp_5min_temp;
DROP TABLE IF EXISTS mod_temp_5min_temp2;
CREATE TEMP TABLE mod_temp_5min_temp(x jsonb);
CREATE TEMP TABLE mod_temp_5min_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY mod_temp_5min_temp FROM PROGRAM 'curl -H "Api-Key:38deaa51-8716-4cc9-aa42-ab14fb72a752.01" "https://portal.unity.inaccess.com/ifms/sources/5968959c-07f9-11eb-aeeb-42010afa015a/events?start_date=20240620T000000Z"';
INSERT INTO mod_temp_5min_temp2 select f.* from mod_temp_5min_temp, jsonb_populate_recordset(null::mod_temp_5min_temp2, x) f;
UPDATE mod_temp_5min_temp2 SET id = 'CAU1-WS-A19-1';
UPDATE mod_temp_5min_temp2 SET cau = 'CAU1FV';
UPDATE mod_temp_5min_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO mod_temp_5min SELECT * from mod_temp_5min_temp2 ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS mod_temp_5min_temp;
DROP TABLE IF EXISTS mod_temp_5min_temp2;
CREATE TEMP TABLE mod_temp_5min_temp(x jsonb);
CREATE TEMP TABLE mod_temp_5min_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY mod_temp_5min_temp FROM PROGRAM 'curl -H "Api-Key:38deaa51-8716-4cc9-aa42-ab14fb72a752.01" "https://portal.unity.inaccess.com/ifms/sources/59aff55e-07f9-11eb-aeeb-42010afa015a/events?start_date=20240620T000000Z"';
INSERT INTO mod_temp_5min_temp2 select f.* from mod_temp_5min_temp, jsonb_populate_recordset(null::mod_temp_5min_temp2, x) f;
UPDATE mod_temp_5min_temp2 SET id = 'CAU1-WS-A29-1';
UPDATE mod_temp_5min_temp2 SET cau = 'CAU1FV';
UPDATE mod_temp_5min_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO mod_temp_5min SELECT * from mod_temp_5min_temp2 ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS mod_temp_5min_temp;
DROP TABLE IF EXISTS mod_temp_5min_temp2;
CREATE TEMP TABLE mod_temp_5min_temp(x jsonb);
CREATE TEMP TABLE mod_temp_5min_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY mod_temp_5min_temp FROM PROGRAM 'curl -H "Api-Key:38deaa51-8716-4cc9-aa42-ab14fb72a752.01" "https://portal.unity.inaccess.com/ifms/sources/59b01476-07f9-11eb-aeeb-42010afa015a/events?start_date=20240620T000000Z"';
INSERT INTO mod_temp_5min_temp2 select f.* from mod_temp_5min_temp, jsonb_populate_recordset(null::mod_temp_5min_temp2, x) f;
UPDATE mod_temp_5min_temp2 SET id = 'CAU1-WS-A29-2';
UPDATE mod_temp_5min_temp2 SET cau = 'CAU1FV';
UPDATE mod_temp_5min_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO mod_temp_5min SELECT * from mod_temp_5min_temp2 ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS mod_temp_5min_temp;
DROP TABLE IF EXISTS mod_temp_5min_temp2;
CREATE TEMP TABLE mod_temp_5min_temp(x jsonb);
CREATE TEMP TABLE mod_temp_5min_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY mod_temp_5min_temp FROM PROGRAM 'curl -H "Api-Key:38deaa51-8716-4cc9-aa42-ab14fb72a752.01" "https://portal.unity.inaccess.com/ifms/sources/592bcd6a-07f9-11eb-aeeb-42010afa015a/events?start_date=20240620T000000Z"';
INSERT INTO mod_temp_5min_temp2 select f.* from mod_temp_5min_temp, jsonb_populate_recordset(null::mod_temp_5min_temp2, x) f;
UPDATE mod_temp_5min_temp2 SET id = 'CAU1-WS-A07-2';
UPDATE mod_temp_5min_temp2 SET cau = 'CAU1FV';
UPDATE mod_temp_5min_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO mod_temp_5min SELECT * from mod_temp_5min_temp2 ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS mod_temp_5min_temp;
DROP TABLE IF EXISTS mod_temp_5min_temp2;
CREATE TEMP TABLE mod_temp_5min_temp(x jsonb);
CREATE TEMP TABLE mod_temp_5min_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY mod_temp_5min_temp FROM PROGRAM 'curl -H "Api-Key:38deaa51-8716-4cc9-aa42-ab14fb72a752.01" "https://portal.unity.inaccess.com/ifms/sources/5968b55e-07f9-11eb-aeeb-42010afa015a/events?start_date=20240620T000000Z"';
INSERT INTO mod_temp_5min_temp2 select f.* from mod_temp_5min_temp, jsonb_populate_recordset(null::mod_temp_5min_temp2, x) f;
UPDATE mod_temp_5min_temp2 SET id = 'CAU1-WS-A19-2';
UPDATE mod_temp_5min_temp2 SET cau = 'CAU1FV';
UPDATE mod_temp_5min_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO mod_temp_5min SELECT * from mod_temp_5min_temp2 ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS mod_temp_5min_temp;
DROP TABLE IF EXISTS mod_temp_5min_temp2;
CREATE TEMP TABLE mod_temp_5min_temp(x jsonb);
CREATE TEMP TABLE mod_temp_5min_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY mod_temp_5min_temp FROM PROGRAM 'curl -H "Api-Key:38deaa51-8716-4cc9-aa42-ab14fb72a752.01" "https://portal.unity.inaccess.com/ifms/sources/bc951a30-07ec-11eb-8a43-42010afa015a/events?start_date=20240620T000000Z"';
INSERT INTO mod_temp_5min_temp2 select f.* from mod_temp_5min_temp, jsonb_populate_recordset(null::mod_temp_5min_temp2, x) f;
UPDATE mod_temp_5min_temp2 SET id = 'CAU2-WS-B08-1';
UPDATE mod_temp_5min_temp2 SET cau = 'CAU2FV';
UPDATE mod_temp_5min_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO mod_temp_5min SELECT * from mod_temp_5min_temp2 ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS mod_temp_5min_temp;
DROP TABLE IF EXISTS mod_temp_5min_temp2;
CREATE TEMP TABLE mod_temp_5min_temp(x jsonb);
CREATE TEMP TABLE mod_temp_5min_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY mod_temp_5min_temp FROM PROGRAM 'curl -H "Api-Key:38deaa51-8716-4cc9-aa42-ab14fb72a752.01" "https://portal.unity.inaccess.com/ifms/sources/bccd2a2e-07ec-11eb-8a43-42010afa015a/events?start_date=20240620T000000Z"';
INSERT INTO mod_temp_5min_temp2 select f.* from mod_temp_5min_temp, jsonb_populate_recordset(null::mod_temp_5min_temp2, x) f;
UPDATE mod_temp_5min_temp2 SET id = 'CAU2-WS-B30-1';
UPDATE mod_temp_5min_temp2 SET cau = 'CAU2FV';
UPDATE mod_temp_5min_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO mod_temp_5min SELECT * from mod_temp_5min_temp2 ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS mod_temp_5min_temp;
DROP TABLE IF EXISTS mod_temp_5min_temp2;
CREATE TEMP TABLE mod_temp_5min_temp(x jsonb);
CREATE TEMP TABLE mod_temp_5min_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY mod_temp_5min_temp FROM PROGRAM 'curl -H "Api-Key:38deaa51-8716-4cc9-aa42-ab14fb72a752.01" "https://portal.unity.inaccess.com/ifms/sources/bd06d062-07ec-11eb-8a43-42010afa015a/events?start_date=20240620T000000Z"';
INSERT INTO mod_temp_5min_temp2 select f.* from mod_temp_5min_temp, jsonb_populate_recordset(null::mod_temp_5min_temp2, x) f;
UPDATE mod_temp_5min_temp2 SET id = 'CAU2-WS-B35-1';
UPDATE mod_temp_5min_temp2 SET cau = 'CAU2FV';
UPDATE mod_temp_5min_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO mod_temp_5min SELECT * from mod_temp_5min_temp2 ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS mod_temp_5min_temp;
DROP TABLE IF EXISTS mod_temp_5min_temp2;
CREATE TEMP TABLE mod_temp_5min_temp(x jsonb);
CREATE TEMP TABLE mod_temp_5min_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY mod_temp_5min_temp FROM PROGRAM 'curl -H "Api-Key:38deaa51-8716-4cc9-aa42-ab14fb72a752.01" "https://portal.unity.inaccess.com/ifms/sources/bc953948-07ec-11eb-8a43-42010afa015a/events?start_date=20240620T000000Z"';
INSERT INTO mod_temp_5min_temp2 select f.* from mod_temp_5min_temp, jsonb_populate_recordset(null::mod_temp_5min_temp2, x) f;
UPDATE mod_temp_5min_temp2 SET id = 'CAU2-WS-B08-2';
UPDATE mod_temp_5min_temp2 SET cau = 'CAU2FV';
UPDATE mod_temp_5min_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO mod_temp_5min SELECT * from mod_temp_5min_temp2 ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS mod_temp_5min_temp;
DROP TABLE IF EXISTS mod_temp_5min_temp2;
CREATE TEMP TABLE mod_temp_5min_temp(x jsonb);
CREATE TEMP TABLE mod_temp_5min_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY mod_temp_5min_temp FROM PROGRAM 'curl -H "Api-Key:38deaa51-8716-4cc9-aa42-ab14fb72a752.01" "https://portal.unity.inaccess.com/ifms/sources/bccd427a-07ec-11eb-8a43-42010afa015a/events?start_date=20240620T000000Z"';
INSERT INTO mod_temp_5min_temp2 select f.* from mod_temp_5min_temp, jsonb_populate_recordset(null::mod_temp_5min_temp2, x) f;
UPDATE mod_temp_5min_temp2 SET id = 'CAU2-WS-B30-2';
UPDATE mod_temp_5min_temp2 SET cau = 'CAU2FV';
UPDATE mod_temp_5min_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO mod_temp_5min SELECT * from mod_temp_5min_temp2 ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS mod_temp_5min_temp;
DROP TABLE IF EXISTS mod_temp_5min_temp2;
CREATE TEMP TABLE mod_temp_5min_temp(x jsonb);
CREATE TEMP TABLE mod_temp_5min_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY mod_temp_5min_temp FROM PROGRAM 'curl -H "Api-Key:38deaa51-8716-4cc9-aa42-ab14fb72a752.01" "https://portal.unity.inaccess.com/ifms/sources/bd06f308-07ec-11eb-8a43-42010afa015a/events?start_date=20240620T000000Z"';
INSERT INTO mod_temp_5min_temp2 select f.* from mod_temp_5min_temp, jsonb_populate_recordset(null::mod_temp_5min_temp2, x) f;
UPDATE mod_temp_5min_temp2 SET id = 'CAU2-WS-B35-2';
UPDATE mod_temp_5min_temp2 SET cau = 'CAU2FV';
UPDATE mod_temp_5min_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO mod_temp_5min SELECT * from mod_temp_5min_temp2 ON CONFLICT DO NOTHING;
-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS mod_temp_5min_temp;
DROP TABLE IF EXISTS mod_temp_5min_temp2;
CREATE TEMP TABLE mod_temp_5min_temp(x jsonb);
CREATE TEMP TABLE mod_temp_5min_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY mod_temp_5min_temp FROM PROGRAM 'curl -H "Api-Key:38deaa51-8716-4cc9-aa42-ab14fb72a752.01" "https://portal.unity.inaccess.com/ifms/sources/11c6cecc-07ed-11eb-8564-42010afa015a/events?start_date=20240620T000000Z"';
INSERT INTO mod_temp_5min_temp2 select f.* from mod_temp_5min_temp, jsonb_populate_recordset(null::mod_temp_5min_temp2, x) f;
UPDATE mod_temp_5min_temp2 SET id = 'CAU3-WS-C08-1';
UPDATE mod_temp_5min_temp2 SET cau = 'CAU3FV';
UPDATE mod_temp_5min_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO mod_temp_5min SELECT * from mod_temp_5min_temp2 ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS mod_temp_5min_temp;
DROP TABLE IF EXISTS mod_temp_5min_temp2;
CREATE TEMP TABLE mod_temp_5min_temp(x jsonb);
CREATE TEMP TABLE mod_temp_5min_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY mod_temp_5min_temp FROM PROGRAM 'curl -H "Api-Key:38deaa51-8716-4cc9-aa42-ab14fb72a752.01" "https://portal.unity.inaccess.com/ifms/sources/11ff51e8-07ed-11eb-8564-42010afa015a/events?start_date=20240620T000000Z"';
INSERT INTO mod_temp_5min_temp2 select f.* from mod_temp_5min_temp, jsonb_populate_recordset(null::mod_temp_5min_temp2, x) f;
UPDATE mod_temp_5min_temp2 SET id = 'CAU3-WS-C11-1';
UPDATE mod_temp_5min_temp2 SET cau = 'CAU3FV';
UPDATE mod_temp_5min_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO mod_temp_5min SELECT * from mod_temp_5min_temp2 ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS mod_temp_5min_temp;
DROP TABLE IF EXISTS mod_temp_5min_temp2;
CREATE TEMP TABLE mod_temp_5min_temp(x jsonb);
CREATE TEMP TABLE mod_temp_5min_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY mod_temp_5min_temp FROM PROGRAM 'curl -H "Api-Key:38deaa51-8716-4cc9-aa42-ab14fb72a752.01" "https://portal.unity.inaccess.com/ifms/sources/1238547a-07ed-11eb-8564-42010afa015a/events?start_date=20240620T000000Z"';
INSERT INTO mod_temp_5min_temp2 select f.* from mod_temp_5min_temp, jsonb_populate_recordset(null::mod_temp_5min_temp2, x) f;
UPDATE mod_temp_5min_temp2 SET id = 'CAU3-WS-C29-1';
UPDATE mod_temp_5min_temp2 SET cau = 'CAU3FV';
UPDATE mod_temp_5min_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO mod_temp_5min SELECT * from mod_temp_5min_temp2 ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS mod_temp_5min_temp;
DROP TABLE IF EXISTS mod_temp_5min_temp2;
CREATE TEMP TABLE mod_temp_5min_temp(x jsonb);
CREATE TEMP TABLE mod_temp_5min_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY mod_temp_5min_temp FROM PROGRAM 'curl -H "Api-Key:38deaa51-8716-4cc9-aa42-ab14fb72a752.01" "https://portal.unity.inaccess.com/ifms/sources/11c6dda4-07ed-11eb-8564-42010afa015a/events?start_date=20240620T000000Z"';
INSERT INTO mod_temp_5min_temp2 select f.* from mod_temp_5min_temp, jsonb_populate_recordset(null::mod_temp_5min_temp2, x) f;
UPDATE mod_temp_5min_temp2 SET id = 'CAU3-WS-C08-2';
UPDATE mod_temp_5min_temp2 SET cau = 'CAU3FV';
UPDATE mod_temp_5min_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO mod_temp_5min SELECT * from mod_temp_5min_temp2 ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS mod_temp_5min_temp;
DROP TABLE IF EXISTS mod_temp_5min_temp2;
CREATE TEMP TABLE mod_temp_5min_temp(x jsonb);
CREATE TEMP TABLE mod_temp_5min_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY mod_temp_5min_temp FROM PROGRAM 'curl -H "Api-Key:38deaa51-8716-4cc9-aa42-ab14fb72a752.01" "https://portal.unity.inaccess.com/ifms/sources/11ff5b84-07ed-11eb-8564-42010afa015a/events?start_date=20240620T000000Z"';
INSERT INTO mod_temp_5min_temp2 select f.* from mod_temp_5min_temp, jsonb_populate_recordset(null::mod_temp_5min_temp2, x) f;
UPDATE mod_temp_5min_temp2 SET id = 'CAU3-WS-C11-2';
UPDATE mod_temp_5min_temp2 SET cau = 'CAU3FV';
UPDATE mod_temp_5min_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO mod_temp_5min SELECT * from mod_temp_5min_temp2 ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS mod_temp_5min_temp;
DROP TABLE IF EXISTS mod_temp_5min_temp2;
CREATE TEMP TABLE mod_temp_5min_temp(x jsonb);
CREATE TEMP TABLE mod_temp_5min_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY mod_temp_5min_temp FROM PROGRAM 'curl -H "Api-Key:38deaa51-8716-4cc9-aa42-ab14fb72a752.01" "https://portal.unity.inaccess.com/ifms/sources/12386d34-07ed-11eb-8564-42010afa015a/events?start_date=20240620T000000Z"';
INSERT INTO mod_temp_5min_temp2 select f.* from mod_temp_5min_temp, jsonb_populate_recordset(null::mod_temp_5min_temp2, x) f;
UPDATE mod_temp_5min_temp2 SET id = 'CAU3-WS-C29-2';
UPDATE mod_temp_5min_temp2 SET cau = 'CAU3FV';
UPDATE mod_temp_5min_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO mod_temp_5min SELECT * from mod_temp_5min_temp2 ON CONFLICT DO NOTHING;

INSERT INTO mod_temp_5min(id, date) SELECT * from mod_temp_ids CROSS JOIN generate_series(date_trunc('hour', now() - interval '45 days'), date_trunc('minute', now()), interval '5 minutes') ON CONFLICT DO NOTHING;


CREATE TEMP TABLE mod_temp_5min_columnas2 AS (select *
    from crosstab (
        'select date, id, val
        from mod_temp_5min where date > current_date - 15
        order by 1, 2')
    AS ct(date timestamptz, 
	"CAU1-WS-A07-1" numeric(10,4), 
	"CAU1-WS-A19-1" numeric(10,4), 
	"CAU1-WS-A29-1" numeric(10,4),
	"CAU2-WS-B08-1" numeric(10,4),
	"CAU2-WS-B30-1" numeric(10,4),
	"CAU2-WS-B35-1" numeric(10,4),
	"CAU3-WS-C08-1" numeric(10,4),
	"CAU3-WS-C11-1" numeric(10,4),
	"CAU3-WS-C29-1" numeric(10,4),
	"CAU1-WS-A07-2" numeric(10,4), 
	"CAU1-WS-A19-2" numeric(10,4), 
	"CAU1-WS-A29-2" numeric(10,4),
	"CAU2-WS-B08-2" numeric(10,4),
	"CAU2-WS-B30-2" numeric(10,4),
	"CAU2-WS-B35-2" numeric(10,4),
	"CAU3-WS-C08-2" numeric(10,4),
	"CAU3-WS-C11-2" numeric(10,4),
	"CAU3-WS-C29-2" numeric(10,4)
	) ORDER BY date);

UPDATE mod_temp_5min_columnas2 set "CAU1-WS-A07-1" = null where "CAU1-WS-A07-1" > 80;
UPDATE mod_temp_5min_columnas2 set "CAU1-WS-A19-1" = null where "CAU1-WS-A19-1" > 80;
UPDATE mod_temp_5min_columnas2 set "CAU1-WS-A29-1" = null where "CAU1-WS-A29-1" > 80;
UPDATE mod_temp_5min_columnas2 set "CAU2-WS-B08-1" = null where "CAU2-WS-B08-1" > 80;
UPDATE mod_temp_5min_columnas2 set "CAU2-WS-B30-1" = null where "CAU2-WS-B30-1" > 80;
UPDATE mod_temp_5min_columnas2 set "CAU2-WS-B35-1" = null where "CAU2-WS-B35-1" > 80;
UPDATE mod_temp_5min_columnas2 set "CAU3-WS-C08-1" = null where "CAU3-WS-C08-1" > 80;
UPDATE mod_temp_5min_columnas2 set "CAU3-WS-C11-1" = null where "CAU3-WS-C11-1" > 80;
UPDATE mod_temp_5min_columnas2 set "CAU3-WS-C29-1" = null where "CAU3-WS-C29-1" > 80;
UPDATE mod_temp_5min_columnas2 set "CAU1-WS-A07-2" = null where "CAU1-WS-A07-2" > 80;
UPDATE mod_temp_5min_columnas2 set "CAU1-WS-A19-2" = null where "CAU1-WS-A19-2" > 80;
UPDATE mod_temp_5min_columnas2 set "CAU1-WS-A29-2" = null where "CAU1-WS-A29-2" > 80;
UPDATE mod_temp_5min_columnas2 set "CAU2-WS-B08-2" = null where "CAU2-WS-B08-2" > 80;
UPDATE mod_temp_5min_columnas2 set "CAU2-WS-B30-2" = null where "CAU2-WS-B30-2" > 80;
UPDATE mod_temp_5min_columnas2 set "CAU2-WS-B35-2" = null where "CAU2-WS-B35-2" > 80;
UPDATE mod_temp_5min_columnas2 set "CAU3-WS-C08-2" = null where "CAU3-WS-C08-2" > 80;
UPDATE mod_temp_5min_columnas2 set "CAU3-WS-C11-2" = null where "CAU3-WS-C11-2" > 80;
UPDATE mod_temp_5min_columnas2 set "CAU3-WS-C29-2" = null where "CAU3-WS-C29-2" > 80;
															              
UPDATE mod_temp_5min_columnas2 set "CAU1-WS-A07-1" = null where "CAU1-WS-A07-1" < -20;
UPDATE mod_temp_5min_columnas2 set "CAU1-WS-A19-1" = null where "CAU1-WS-A19-1" < -20;
UPDATE mod_temp_5min_columnas2 set "CAU1-WS-A29-1" = null where "CAU1-WS-A29-1" < -20;
UPDATE mod_temp_5min_columnas2 set "CAU2-WS-B08-1" = null where "CAU2-WS-B08-1" < -20;
UPDATE mod_temp_5min_columnas2 set "CAU2-WS-B30-1" = null where "CAU2-WS-B30-1" < -20;
UPDATE mod_temp_5min_columnas2 set "CAU2-WS-B35-1" = null where "CAU2-WS-B35-1" < -20;
UPDATE mod_temp_5min_columnas2 set "CAU3-WS-C08-1" = null where "CAU3-WS-C08-1" < -20;
UPDATE mod_temp_5min_columnas2 set "CAU3-WS-C11-1" = null where "CAU3-WS-C11-1" < -20;
UPDATE mod_temp_5min_columnas2 set "CAU3-WS-C29-1" = null where "CAU3-WS-C29-1" < -20;
UPDATE mod_temp_5min_columnas2 set "CAU1-WS-A07-2" = null where "CAU1-WS-A07-2" < -20;
UPDATE mod_temp_5min_columnas2 set "CAU1-WS-A19-2" = null where "CAU1-WS-A19-2" < -20;
UPDATE mod_temp_5min_columnas2 set "CAU1-WS-A29-2" = null where "CAU1-WS-A29-2" < -20;
UPDATE mod_temp_5min_columnas2 set "CAU2-WS-B08-2" = null where "CAU2-WS-B08-2" < -20;
UPDATE mod_temp_5min_columnas2 set "CAU2-WS-B30-2" = null where "CAU2-WS-B30-2" < -20;
UPDATE mod_temp_5min_columnas2 set "CAU2-WS-B35-2" = null where "CAU2-WS-B35-2" < -20;
UPDATE mod_temp_5min_columnas2 set "CAU3-WS-C08-2" = null where "CAU3-WS-C08-2" < -20;
UPDATE mod_temp_5min_columnas2 set "CAU3-WS-C11-2" = null where "CAU3-WS-C11-2" < -20;
UPDATE mod_temp_5min_columnas2 set "CAU3-WS-C29-2" = null where "CAU3-WS-C29-2" < -20;

insert into mod_temp_5min_columnas select * from mod_temp_5min_columnas2 on conflict do nothing;


UPDATE mod_temp_5min_columnas SET avg_mod_temp_a07 = s.b FROM (SELECT date,
       (SELECT AVG(a)::numeric (10, 4)
        FROM   (VALUES("CAU1-WS-A07-1"),
                      ("CAU1-WS-A07-2")) T (a)) AS b
FROM   mod_temp_5min_columnas ) AS s WHERE s.date = mod_temp_5min_columnas.date;



UPDATE mod_temp_5min_columnas SET avg_mod_temp_a19 = s.b FROM (SELECT date,
       (SELECT AVG(a)::numeric (10, 4)
        FROM   (VALUES("CAU1-WS-A19-1"),
                      ("CAU1-WS-A19-2")) T (a)) AS b
FROM   mod_temp_5min_columnas ) AS s WHERE s.date = mod_temp_5min_columnas.date;


UPDATE mod_temp_5min_columnas SET avg_mod_temp_a29 = s.b FROM (SELECT date,
       (SELECT AVG(a)::numeric (10, 4)
        FROM   (VALUES("CAU1-WS-A29-1"),
                      ("CAU1-WS-A29-2")) T (a)) AS b
FROM   mod_temp_5min_columnas ) AS s WHERE s.date = mod_temp_5min_columnas.date;


UPDATE mod_temp_5min_columnas SET avg_mod_temp_b08 = s.b FROM (SELECT date,
       (SELECT AVG(a)::numeric (10, 4)
        FROM   (VALUES("CAU2-WS-B08-1"),
                      ("CAU2-WS-B08-2")) T (a)) AS b
FROM   mod_temp_5min_columnas ) AS s WHERE s.date = mod_temp_5min_columnas.date;


UPDATE mod_temp_5min_columnas SET avg_mod_temp_b30 = s.b FROM (SELECT date,
       (SELECT AVG(a)::numeric (10, 4)
        FROM   (VALUES("CAU2-WS-B30-1"),
                      ("CAU2-WS-B30-2")) T (a)) AS b
FROM   mod_temp_5min_columnas ) AS s WHERE s.date = mod_temp_5min_columnas.date;


UPDATE mod_temp_5min_columnas SET avg_mod_temp_b35 = s.b FROM (SELECT date,
       (SELECT AVG(a)::numeric (10, 4)
        FROM   (VALUES("CAU2-WS-B35-1"),
                      ("CAU2-WS-B35-2")) T (a)) AS b
FROM   mod_temp_5min_columnas ) AS s WHERE s.date = mod_temp_5min_columnas.date;


UPDATE mod_temp_5min_columnas SET avg_mod_temp_c08 = s.b FROM (SELECT date,
       (SELECT AVG(a)::numeric (10, 4)
        FROM   (VALUES("CAU3-WS-C08-1"),
                      ("CAU3-WS-C08-2")) T (a)) AS b
FROM   mod_temp_5min_columnas ) AS s WHERE s.date = mod_temp_5min_columnas.date;


UPDATE mod_temp_5min_columnas SET avg_mod_temp_c11 = s.b FROM (SELECT date,
       (SELECT AVG(a)::numeric (10, 4)
        FROM   (VALUES("CAU3-WS-C11-1"),
                      ("CAU3-WS-C11-2")) T (a)) AS b
FROM   mod_temp_5min_columnas ) AS s WHERE s.date = mod_temp_5min_columnas.date;


UPDATE mod_temp_5min_columnas SET avg_mod_temp_c29 = s.b FROM (SELECT date,
       (SELECT AVG(a)::numeric (10, 4)
        FROM   (VALUES("CAU3-WS-C29-1"),
                      ("CAU3-WS-C29-2")) T (a)) AS b
FROM   mod_temp_5min_columnas ) AS s WHERE s.date = mod_temp_5min_columnas.date;


UPDATE mod_temp_5min_columnas 
	SET mt_max_cau1 = mt_max_cau1_calc.mt_max_cau1 
	FROM (SELECT date,
       (SELECT MAX(b)::numeric (10, 4)
        FROM   (VALUES(avg_mod_temp_a07),
                      (avg_mod_temp_a19),
                      (avg_mod_temp_a29)) T (b)) AS mt_max_cau1
FROM   mod_temp_5min_columnas) AS mt_max_cau1_calc WHERE mt_max_cau1_calc.date=mod_temp_5min_columnas.date;

UPDATE mod_temp_5min_columnas 
	SET mt_max_cau2 = mt_max_cau2_calc.mt_max_cau2 
	FROM (SELECT date,
       (SELECT MAX(b)::numeric (10, 4)
        FROM   (VALUES(avg_mod_temp_b08),
                      (avg_mod_temp_b30),
                      (avg_mod_temp_b35)) T (b)) AS mt_max_cau2
FROM   mod_temp_5min_columnas) AS mt_max_cau2_calc WHERE mt_max_cau2_calc.date=mod_temp_5min_columnas.date;

UPDATE mod_temp_5min_columnas 
	SET mt_max_cau3 = mt_max_cau3_calc.mt_max_cau3 
	FROM (SELECT date,
       (SELECT MAX(b)::numeric (10, 4)
        FROM   (VALUES(avg_mod_temp_c08),
                      (avg_mod_temp_c11),
                      (avg_mod_temp_c29)) T (b)) AS mt_max_cau3
FROM   mod_temp_5min_columnas) AS mt_max_cau3_calc WHERE mt_max_cau3_calc.date=mod_temp_5min_columnas.date;

-------------

UPDATE mod_temp_5min_columnas 
	SET mt_min_cau1 = mt_min_cau1_calc.mt_min_cau1 
	FROM (SELECT date,
       (SELECT min(b)::numeric (10, 4)
        FROM   (VALUES(avg_mod_temp_a07),
                      (avg_mod_temp_a19),
                      (avg_mod_temp_a29)) T (b)) AS mt_min_cau1
FROM   mod_temp_5min_columnas) AS mt_min_cau1_calc WHERE mt_min_cau1_calc.date=mod_temp_5min_columnas.date;

UPDATE mod_temp_5min_columnas 
	SET mt_min_cau2 = mt_min_cau2_calc.mt_min_cau2 
	FROM (SELECT date,
       (SELECT min(b)::numeric (10, 4)
        FROM   (VALUES(avg_mod_temp_b08),
                      (avg_mod_temp_b30),
                      (avg_mod_temp_b35)) T (b)) AS mt_min_cau2
FROM   mod_temp_5min_columnas) AS mt_min_cau2_calc WHERE mt_min_cau2_calc.date=mod_temp_5min_columnas.date;

UPDATE mod_temp_5min_columnas 
	SET mt_min_cau3 = mt_min_cau3_calc.mt_min_cau3 
	FROM (SELECT date,
       (SELECT min(b)::numeric (10, 4)
        FROM   (VALUES(avg_mod_temp_c08),
                      (avg_mod_temp_c11),
                      (avg_mod_temp_c29)) T (b)) AS mt_min_cau3
FROM   mod_temp_5min_columnas) AS mt_min_cau3_calc WHERE mt_min_cau3_calc.date=mod_temp_5min_columnas.date;

-------------

UPDATE mod_temp_5min_columnas 
	SET mt_avg_cau1 = mt_avg_cau1_calc.mt_avg_cau1 
	FROM (SELECT date,
       (SELECT avg(b)::numeric (10, 4)
        FROM   (VALUES(avg_mod_temp_a07),
                      (avg_mod_temp_a19),
                      (avg_mod_temp_a29)) T (b)) AS mt_avg_cau1
FROM   mod_temp_5min_columnas) AS mt_avg_cau1_calc WHERE mt_avg_cau1_calc.date=mod_temp_5min_columnas.date;

UPDATE mod_temp_5min_columnas 
	SET mt_avg_cau2 = mt_avg_cau2_calc.mt_avg_cau2 
	FROM (SELECT date,
       (SELECT avg(b)::numeric (10, 4)
        FROM   (VALUES(avg_mod_temp_b08),
                      (avg_mod_temp_b30),
                      (avg_mod_temp_b35)) T (b)) AS mt_avg_cau2
FROM   mod_temp_5min_columnas) AS mt_avg_cau2_calc WHERE mt_avg_cau2_calc.date=mod_temp_5min_columnas.date;

UPDATE mod_temp_5min_columnas 
	SET mt_avg_cau3 = mt_avg_cau3_calc.mt_avg_cau3 
	FROM (SELECT date,
       (SELECT avg(b)::numeric (10, 4)
        FROM   (VALUES(avg_mod_temp_c08),
                      (avg_mod_temp_c11),
                      (avg_mod_temp_c29)) T (b)) AS mt_avg_cau3
FROM   mod_temp_5min_columnas) AS mt_avg_cau3_calc WHERE mt_avg_cau3_calc.date=mod_temp_5min_columnas.date;
-----
UPDATE mod_temp_5min_columnas SET mt_max_diff_cau1 = mt_max_diff_cau1_calc.mt_max_diff_cau1 FROM (SELECT date, ABS((mt_max_cau1 / COALESCE(NULLIF(mt_min_cau1,0), 1))-1) AS mt_max_diff_cau1 FROM mod_temp_5min_columnas) AS mt_max_diff_cau1_calc WHERE mt_max_diff_cau1_calc.date=mod_temp_5min_columnas.date;

UPDATE mod_temp_5min_columnas SET mt_seleccionada_cau1 = mt_avg_cau1 WHERE  mt_max_diff_cau1 <= 0.02;
UPDATE mod_temp_5min_columnas SET mt_seleccionada_cau1 = mt_min_cau1 WHERE  mt_max_diff_cau1 > 0.02;
-----
UPDATE mod_temp_5min_columnas SET mt_max_diff_cau2 = mt_max_diff_cau2_calc.mt_max_diff_cau2 FROM (SELECT date, ABS((mt_max_cau2 / COALESCE(NULLIF(mt_min_cau2,0), 1))-1) AS mt_max_diff_cau2 FROM mod_temp_5min_columnas) AS mt_max_diff_cau2_calc WHERE mt_max_diff_cau2_calc.date=mod_temp_5min_columnas.date;

UPDATE mod_temp_5min_columnas SET mt_seleccionada_cau2 = mt_avg_cau2 WHERE  mt_max_diff_cau2 <= 0.02;
UPDATE mod_temp_5min_columnas SET mt_seleccionada_cau2 = mt_min_cau2 WHERE  mt_max_diff_cau2 > 0.02;
-----
UPDATE mod_temp_5min_columnas SET mt_max_diff_cau3 = mt_max_diff_cau3_calc.mt_max_diff_cau3 FROM (SELECT date, ABS((mt_max_cau3 / COALESCE(NULLIF(mt_min_cau3,0), 1))-1) AS mt_max_diff_cau3 FROM mod_temp_5min_columnas) AS mt_max_diff_cau3_calc WHERE mt_max_diff_cau3_calc.date=mod_temp_5min_columnas.date;

UPDATE mod_temp_5min_columnas SET mt_seleccionada_cau3 = mt_avg_cau3 WHERE  mt_max_diff_cau3 <= 0.02;
UPDATE mod_temp_5min_columnas SET mt_seleccionada_cau3 = mt_min_cau3 WHERE  mt_max_diff_cau3 > 0.02;

delete from mod_temp_5min_columnas where date > now() - interval '15 minutes';