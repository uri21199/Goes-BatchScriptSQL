-- Insertar los detalles de las solicitudes en la tabla
CREATE TEMP TABLE IA_update_sources (table1 text, table2 text, url text, table3 text, col1 text, col2 text, col3 text, col4 text);

-- Insertar los detalles de las solicitudes en la tabla
INSERT INTO IA_update_sources (table1, table2, url, table3, col1, col2, col3, col4)
VALUES
('stage_ghi_cau2_', 'stage_ghi_cau2_2', 'https://portal.unity.inaccess.com/ifms/sources/bc1ef47c-07ec-11eb-8a43-42010afa015a/events', 'ia_cau2', 'ghi', 'ghi.val', 'ghi.date', 'ia_cau2.date'),
('stage_ia_power_cau2_', 'stage_ia_power_cau2_2', 'https://portal.unity.inaccess.com/ifms/sources/6254118a-0809-11eb-8a43-42010afa015a/events', 'ia_cau2', 'power', 'power.val', 'power.date', 'ia_cau2.date'),
('stage_ia_wind_cau2_', 'stage_ia_wind_cau2_2', 'https://portal.unity.inaccess.com/ifms/sources/be08d0aa-07ec-11eb-8a43-42010afa015a/events', 'ia_cau2', 'wind', 'wind.val', 'wind.date', 'ia_cau2.date'),
('stage_ia_modtemp_cau2_', 'stage_ia_modtemp_cau2_2', 'https://portal.unity.inaccess.com/ifms/sources/bccd2a2e-07ec-11eb-8a43-42010afa015a/events', 'ia_cau2', 'modtemp', 'modtemp.val', 'modtemp.date', 'ia_cau2.date');

DO $$ 
DECLARE
    startdate text := to_char(current_date - interval '2 days', 'YYYYMMDD');
    starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz + interval '3 hours'))), 'HH24MISS');
    rec RECORD;
BEGIN
    FOR rec IN SELECT * FROM IA_update_sources LOOP
        -- Crear tablas temporales dinámicamente
        EXECUTE format('DROP TABLE IF EXISTS %I', rec.table1);
        EXECUTE format('DROP TABLE IF EXISTS %I', rec.table2);
        EXECUTE format('CREATE TEMP TABLE %I (x jsonb)', rec.table1);
        EXECUTE format('CREATE TEMP TABLE %I (date timestamptz, val numeric)', rec.table2);

        -- Descargar y copiar los datos usando curl
        EXECUTE format(
                'COPY %I FROM PROGRAM ''curl "%s?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
                rec.table1, rec.url, startdate, starttime
        );

        -- Insertar los datos en la tabla temporal
        EXECUTE format(
            'INSERT INTO %I SELECT f.* FROM %I, jsonb_populate_recordset(null::%I, x) f',
            rec.table2, rec.table1, rec.table2
        );

        -- Actualizar la fecha
        EXECUTE format(
            'UPDATE %I SET date = DATE_TRUNC(''minute'', date)',
            rec.table2
        );

        -- Actualizar los valores en la tabla final
        EXECUTE format(
            'UPDATE %I SET %I = %I.val FROM (SELECT date, val FROM %I WHERE date >= (now() - interval ''1 days'')) AS val_data WHERE %I = %I',
            rec.table3, rec.col1, rec.table2, rec.table2, rec.col3, rec.col4
        );
    END LOOP;
END $$;

-- Limpiar la tabla temporal de fuentes
DROP TABLE IA_update_sources;

-- Actualización final
UPDATE ia_cau2 
SET tracker = tracker.val 
FROM (SELECT date, val FROM trackers_cau2fv WHERE id = 'calcPeriodCurrentrollTrackerCAU2-Motor-35-08-04' AND date >= (now() - interval '1 days')) AS tracker 
WHERE tracker.date = ia_cau2.date;

UPDATE ia_cau2 
SET zenith = 148.65623094716693;
