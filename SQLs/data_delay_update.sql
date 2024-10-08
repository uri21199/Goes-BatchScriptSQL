-- Elimina las tablas temporales en caso de que existan
DROP TABLE IF EXISTS stage_data_delay;
DROP TABLE IF EXISTS stage_data_delay2;
DROP TABLE IF EXISTS file_sources_delay;

-- Crea las tablas temporales
CREATE TEMP TABLE stage_data_delay(x jsonb);
CREATE TEMP TABLE stage_data_delay2(date timestamptz, val numeric, id text);

-- Crea una tabla auxiliar para almacenar las URLs y los ID correspondientes
CREATE TEMP TABLE file_sources_delay (
    id_name text,
    source_url text
);

-- Inserta los valores correspondientes a las fuentes de datos
INSERT INTO file_sources_delay (id_name, source_url) VALUES
('data_delay_cau1', 'https://portal.unity.inaccess.com/ifms/sources/c61e9322-0816-11eb-aeeb-42010afa015a/events'),
('data_delay_cau2', 'https://portal.unity.inaccess.com/ifms/sources/6754e114-0809-11eb-8a43-42010afa015a/events'),
('data_delay_cau3', 'https://portal.unity.inaccess.com/ifms/sources/8ac24baa-0809-11eb-8564-42010afa015a/events');

-- Elimina datos anteriores en la tabla de destino
DELETE FROM data_delay WHERE date >= now() - interval '12 hours';

-- Declara las variables startdate y starttime
DO $$
DECLARE 
    startdate text := to_char(current_date - 1, 'YYYYMMDD');
    file_record record;
BEGIN
    -- Itera sobre cada registro en la tabla file_sources_delay
    FOR file_record IN (SELECT * FROM file_sources_delay) LOOP
        -- Ejecuta el comando COPY para cada fuente de datos
        EXECUTE format(
            'COPY stage_data_delay FROM PROGRAM ''curl -H "Api-Key:38deaa51-8716-4cc9-aa42-ab14fb72a752.01" "%s?&start_date=%sT000000Z"''',
            file_record.source_url, startdate
        );
        
        -- Inserta los datos en la tabla temporal
        INSERT INTO stage_data_delay2 
        SELECT f.* 
        FROM stage_data_delay, jsonb_populate_recordset(null::stage_data_delay2, x) f;

        -- Actualiza las columnas necesarias
        UPDATE stage_data_delay2 
        SET date = DATE_TRUNC('minute', date),
            id = file_record.id_name;

        -- Inserta los datos procesados en la tabla final
        INSERT INTO data_delay 
        SELECT * 
        FROM stage_data_delay2 
        WHERE date >= now() - interval '12 hours';

        -- Limpia la tabla temporal para el siguiente ciclo
        TRUNCATE stage_data_delay, stage_data_delay2;
    END LOOP;
END $$;
