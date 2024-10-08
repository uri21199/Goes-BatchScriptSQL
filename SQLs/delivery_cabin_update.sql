-- Elimina las tablas temporales en caso de que existan
DROP TABLE IF EXISTS temp_delivery_cabins_pot1;
DROP TABLE IF EXISTS temp_delivery_cabins_pot12;
DROP TABLE IF EXISTS file_sources;

-- Crea las tablas temporales
CREATE TEMP TABLE temp_delivery_cabins_pot1(x jsonb);
CREATE TEMP TABLE temp_delivery_cabins_pot12(date timestamptz, val numeric, id text);

-- Crea una tabla auxiliar para almacenar las URLs y los ID correspondientes
CREATE TEMP TABLE file_sources (
    id_name text,
    source_url text
);

-- Inserta los valores correspondientes a las fuentes de datos
INSERT INTO file_sources (id_name, source_url) VALUES
('D.A1.a Line Meter', 'https://portal.unity.inaccess.com/ifms/sources/64ce199c-07be-11eb-8c92-42010afa015a/events'),
('D.A1.b Line Meter', 'https://portal.unity.inaccess.com/ifms/sources/6513d78e-07be-11eb-8c92-42010afa015a/events'),
('D.A2 Line Meter', 'https://portal.unity.inaccess.com/ifms/sources/6546f4f2-07be-11eb-8c92-42010afa015a/events'),
('D.A3 Line Meter', 'https://portal.unity.inaccess.com/ifms/sources/6579b2ac-07be-11eb-8c92-42010afa015a/events'),
('D.B1 Line Meter', 'https://portal.unity.inaccess.com/ifms/sources/65ac5a72-07be-11eb-8c92-42010afa015a/events'),
('D.B2 Line Meter', 'https://portal.unity.inaccess.com/ifms/sources/65deebe0-07be-11eb-8c92-42010afa015a/events'),
('D.B3 Line Meter', 'https://portal.unity.inaccess.com/ifms/sources/662c6a00-07be-11eb-8c92-42010afa015a/events'),
('D.C1 Line Meter', 'https://portal.unity.inaccess.com/ifms/sources/665f3200-07be-11eb-8c92-42010afa015a/events'),
('D.C2 Line Meter', 'https://portal.unity.inaccess.com/ifms/sources/66922e6c-07be-11eb-8c92-42010afa015a/events'),
('D.C3 Line Meter', 'https://portal.unity.inaccess.com/ifms/sources/66922e6c-07be-11eb-8c92-42010afa015a/events');

-- Declara las variables startdate y starttime
DO $$
DECLARE 
    startdate text := to_char(current_date, 'YYYYMMDD');
    starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '120 minutes' + interval '3 hours'))), 'HH24MISS');
    file_record record;
BEGIN
    -- Itera sobre cada registro en la tabla file_sources
    FOR file_record IN (SELECT * FROM file_sources) LOOP
        -- Ejecuta el comando COPY para cada fuente de datos
        EXECUTE format(
            'COPY temp_delivery_cabins_pot1 FROM PROGRAM ''curl -H "Api-Key:38deaa51-8716-4cc9-aa42-ab14fb72a752.01" "%s?&start_date=%sT%sZ"''',
            file_record.source_url, startdate, starttime
        );
        
        -- Inserta los datos en la tabla temporal
        INSERT INTO temp_delivery_cabins_pot12 
        SELECT f.* 
        FROM temp_delivery_cabins_pot1, jsonb_populate_recordset(null::temp_delivery_cabins_pot12, x) f;

        -- Actualiza las columnas necesarias
        UPDATE temp_delivery_cabins_pot12 
        SET date = DATE_TRUNC('minute', date),
            id = file_record.id_name;

        -- Inserta los datos procesados en la tabla final
        INSERT INTO delivery_cabins_pot 
        SELECT * 
        FROM temp_delivery_cabins_pot12 
        ON CONFLICT DO NOTHING;

        -- Limpia la tabla temporal para el siguiente ciclo
        TRUNCATE temp_delivery_cabins_pot1, temp_delivery_cabins_pot12;
    END LOOP;
END $$;

-- Se cargan campos dentro stage_caf_potencia_72hs2 que vienen de una subconsulta a stage_caf_potencia_72hs y a la vez se actualizacion campos
DROP TABLE IF EXISTS alert_cau.delivery_cabins_columnas;
CREATE TABLE alert_cau.delivery_cabins_columnas ( date timestamptz, 
D_A1_a numeric, 
D_A1_b numeric, 
D_A2 numeric, 
D_A3 numeric, 
D_B1 numeric, 
D_B2 numeric,
D_B3 numeric, 
D_C1 numeric, 
D_C2 numeric, 
D_C3 numeric,
cau1_total numeric,
cau2_total numeric,
cau3_total numeric,
CONSTRAINT uc_delivery_cabins_columnas UNIQUE (date)
);

INSERT INTO alert_cau.delivery_cabins_columnas (date) select date from delivery_cabins_pot where date >= (current_Date - 4)::timestamptz on conflict on constraint uc_delivery_cabins_columnas do nothing;

UPDATE alert_cau.delivery_cabins_columnas SET D_A1_a = delivery_cabins_pot.val from delivery_cabins_pot WHERE delivery_cabins_pot.date = alert_cau.delivery_cabins_columnas.date AND delivery_cabins_pot.id = 'D.A1.a Line Meter';
UPDATE alert_cau.delivery_cabins_columnas SET D_A1_b = delivery_cabins_pot.val from delivery_cabins_pot WHERE delivery_cabins_pot.date = alert_cau.delivery_cabins_columnas.date AND delivery_cabins_pot.id = 'D.A1.b Line Meter';
UPDATE alert_cau.delivery_cabins_columnas SET D_A2 = delivery_cabins_pot.val from delivery_cabins_pot WHERE delivery_cabins_pot.date = alert_cau.delivery_cabins_columnas.date AND delivery_cabins_pot.id = 'D.A2 Line Meter';
UPDATE alert_cau.delivery_cabins_columnas SET D_A3 = delivery_cabins_pot.val from delivery_cabins_pot WHERE delivery_cabins_pot.date = alert_cau.delivery_cabins_columnas.date AND delivery_cabins_pot.id = 'D.A3 Line Meter';
UPDATE alert_cau.delivery_cabins_columnas SET D_B1 = delivery_cabins_pot.val from delivery_cabins_pot WHERE delivery_cabins_pot.date = alert_cau.delivery_cabins_columnas.date AND delivery_cabins_pot.id = 'D.B1 Line Meter';
UPDATE alert_cau.delivery_cabins_columnas SET D_B2 = delivery_cabins_pot.val from delivery_cabins_pot WHERE delivery_cabins_pot.date = alert_cau.delivery_cabins_columnas.date AND delivery_cabins_pot.id = 'D.B2 Line Meter';
UPDATE alert_cau.delivery_cabins_columnas SET D_B3 = delivery_cabins_pot.val from delivery_cabins_pot WHERE delivery_cabins_pot.date = alert_cau.delivery_cabins_columnas.date AND delivery_cabins_pot.id = 'D.B3 Line Meter';
UPDATE alert_cau.delivery_cabins_columnas SET D_C1 = delivery_cabins_pot.val from delivery_cabins_pot WHERE delivery_cabins_pot.date = alert_cau.delivery_cabins_columnas.date AND delivery_cabins_pot.id = 'D.C1 Line Meter';
UPDATE alert_cau.delivery_cabins_columnas SET D_C2 = delivery_cabins_pot.val from delivery_cabins_pot WHERE delivery_cabins_pot.date = alert_cau.delivery_cabins_columnas.date AND delivery_cabins_pot.id = 'D.C2 Line Meter';
UPDATE alert_cau.delivery_cabins_columnas SET D_C3 = delivery_cabins_pot.val from delivery_cabins_pot WHERE delivery_cabins_pot.date = alert_cau.delivery_cabins_columnas.date AND delivery_cabins_pot.id = 'D.C3 Line Meter';

UPDATE alert_cau.delivery_cabins_columnas SET cau1_total = D_A1_a + D_A1_b + D_A2 + D_A3;
UPDATE alert_cau.delivery_cabins_columnas SET cau2_total = D_B1 + D_B2 + D_B3;
UPDATE alert_cau.delivery_cabins_columnas SET cau3_total = D_C1 + D_C2 + D_C3; 