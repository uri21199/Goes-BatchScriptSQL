-- Crear una tabla temporal con los datos que varían
CREATE TEMP TABLE temp_sources (
    source_id text,
    id text,
    cau text
);

-- Insertar los datos correspondientes en la tabla temporal
INSERT INTO temp_sources (source_id, id, cau)
VALUES
("5a3e2216-07f9-11eb-aeeb-42010afa015a",'CAU1-WS-A07','CAU1FV'),
("5abd0540-07f9-11eb-aeeb-42010afa015a",'CAU1-WS-A29','CAU1FV'),
("5a7d7d76-07f9-11eb-aeeb-42010afa015a",'CAU1-WS-A19','CAU1FV'),
("bd8b6e9e-07ec-11eb-8a43-42010afa015a",'CAU2-WS-B08','CAU2FV'),
("bdca7102-07ec-11eb-8a43-42010afa015a",'CAU2-WS-B30','CAU2FV'),
("be093dc4-07ec-11eb-8a43-42010afa015a",'CAU2-WS-B35','CAU2FV'),
("133e7336-07ed-11eb-8564-42010afa015a",'CAU3-WS-C29','CAU3FV'),
("13009fb6-07ed-11eb-8564-42010afa015a",'CAU3-WS-C11','CAU3FV'),
("12c218fe-07ed-11eb-8564-42010afa015a",'CAU3-WS-C08','CAU3FV');

-- Iterar sobre la tabla temporal e insertar los datos en las tablas correspondientes
DO $$
DECLARE
    rec RECORD;
BEGIN
    FOR rec IN SELECT * FROM temp_sources LOOP
        -- Eliminar tablas temporales anteriores
        DROP TABLE IF EXISTS ghi_5min_temp;
        DROP TABLE IF EXISTS ghi_5min_temp2;

        -- Crear nuevas tablas temporales
        CREATE TEMP TABLE ghi_5min_temp(x jsonb);
        CREATE TEMP TABLE ghi_5min_temp2(date timestamptz, val numeric(10,4), id text, cau text);

        -- Cargar los datos desde la API correspondiente a cada fuente
        EXECUTE format(
            $$COPY ghi_5min_temp FROM PROGRAM 'curl -H "Api-Key:38deaa51-8716-4cc9-aa42-ab14fb72a752.01" "https://portal.unity.inaccess.com/ifms/sources/%s/events?&start_date=20221225T000000Z"';$$, 
            rec.source_id
        );

        -- Insertar los datos en la tabla temporal y actualizar campos necesarios
        INSERT INTO ghi_5min_temp2
        SELECT f.* 
        FROM ghi_5min_temp, jsonb_populate_recordset(null::ghi_5min_temp2, x) f;

        -- Actualizar los campos de 'id', 'cau' y 'date'
        UPDATE ghi_5min_temp2 SET id = rec.id, cau = rec.cau, date = DATE_TRUNC('minute', date);

        -- Insertar los datos finales en la tabla principal
        INSERT INTO ghi_5min 
        SELECT * FROM ghi_5min_temp2 
        ON CONFLICT DO NOTHING;
    END LOOP;
END $$;

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