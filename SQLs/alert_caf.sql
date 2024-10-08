-- Elimina las tablas temporales en caso de que existan
DROP TABLE IF EXISTS stage_caf_alert;
DROP TABLE IF EXISTS stage_caf_alert2;
DROP TABLE IF EXISTS file_sources_alert;

-- Crea las tablas temporales
CREATE TEMP TABLE stage_caf_alert(x jsonb);
CREATE TEMP TABLE stage_caf_alert2(date timestamptz, val numeric);

-- Crea una tabla auxiliar para almacenar las URLs y los nombres de columna correspondientes
CREATE TEMP TABLE file_sources_alert (
    id_name text,
    source_url text
);

-- Inserta los valores correspondientes a las fuentes de datos
INSERT INTO file_sources_alert (id_name, source_url) VALUES
('frecuencia', 'https://portal.unity.inaccess.com/ifms/sources/c6585600-8934-11e9-8620-42010afa015a/events'),
('p_activa', 'https://portal.unity.inaccess.com/ifms/sources/c651c074-8934-11e9-8620-42010afa015a/events'),
('q_reactiva', 'https://portal.unity.inaccess.com/ifms/sources/c651b674-8934-11e9-8620-42010afa015a/events'),
('tension', 'https://portal.unity.inaccess.com/ifms/sources/c656ab66-8934-11e9-8620-42010afa015a/events');

-- Declara las variables startdate y starttime
DO $$
DECLARE 
    startdate text := to_char(current_date - 7, 'YYYYMMDD');
    starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '3 hours' + interval '3 hours'))), 'HH24MISS');
    file_record record;
BEGIN
    -- Itera sobre cada registro en la tabla file_sources_alert
    FOR file_record IN (SELECT * FROM file_sources_alert) LOOP
        -- Ejecuta el comando COPY para cada fuente de datos
        EXECUTE format(
            'COPY stage_caf_alert FROM PROGRAM ''curl -H "Api-Key:e385a1a5-0441-4e06-be58-162731a7d4f9.01" "%s?&start_date=%sT%sZ"''',
            file_record.source_url, startdate, starttime
        );

        -- Inserta los datos en la tabla temporal stage_caf_alert2
        INSERT INTO stage_caf_alert2 
        SELECT f.* 
        FROM stage_caf_alert, jsonb_populate_recordset(null::stage_caf_alert2, x) f;

        -- Actualiza la columna date
        UPDATE stage_caf_alert2 SET date = DATE_TRUNC('minute', date);

        -- Actualiza la columna correspondiente en la tabla alert_caf de Cafayate
        UPDATE Cafayate.alert_caf 
        SET 
            CASE file_record.id_name 
                WHEN 'frecuencia' THEN frecuencia = s.a 
                WHEN 'p_activa' THEN p_activa = s.a 
                WHEN 'q_reactiva' THEN q_reactiva = s.a 
                WHEN 'tension' THEN tension = s.a 
            END
        FROM (SELECT date, val AS a FROM stage_caf_alert2) AS s 
        WHERE s.date = alert_caf.date;
        
        -- Limpia la tabla temporal para el siguiente ciclo
        TRUNCATE stage_caf_alert, stage_caf_alert2;
    END LOOP;
END $$;
