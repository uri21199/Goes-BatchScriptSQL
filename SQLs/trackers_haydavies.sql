-- Crear una tabla temporal para almacenar los detalles de las URLs e IDs
CREATE TEMP TABLE trackers_sources (id text, url text);

-- Insertar los detalles de las solicitudes en la tabla
INSERT INTO trackers_sources (id, cau, url)
VALUES
    ('calcPeriodCurrentrollTrackerCAU1-Motor-29-05-04', 'cau1fv', 'https://portal.unity.inaccess.com/ifms/sources/ee6a2e6e-0810-11eb-aeeb-42010afa015a/events'),
    ('calcPeriodCurrentrollTrackerCAU1-Motor-07-06-01', 'cau1fv', 'https://portal.unity.inaccess.com/ifms/sources/9b4faf5e-07fe-11eb-aeeb-42010afa015a/events'),
    ('calcPeriodCurrentrollTrackerCAU1-Motor-19-06-01', 'cau1fv', 'https://portal.unity.inaccess.com/ifms/sources/8d2c290c-0808-11eb-aeeb-42010afa015a/events'),
    ('calcPeriodCurrentrollTrackerCAU2-Motor-08-06-01', 'cau2fv', 'https://portal.unity.inaccess.com/ifms/sources/a52218de-07f2-11eb-8a43-42010afa015a/events'),
    ('calcPeriodCurrentrollTrackerCAU2-Motor-30-06-01', 'cau2fv', 'https://portal.unity.inaccess.com/ifms/sources/6b258dd4-0804-11eb-8a43-42010afa015a/events'),
    ('calcPeriodCurrentrollTrackerCAU2-Motor-35-06-01', 'cau2fv', 'https://portal.unity.inaccess.com/ifms/sources/9daac61c-0808-11eb-8a43-42010afa015a/events'),
    ('calcPeriodCurrentrollTrackerCAU3-Motor-08-06-01', 'cau3fv', 'https://portal.unity.inaccess.com/ifms/sources/e803a352-07f2-11eb-8564-42010afa015a/events'),
    ('calcPeriodCurrentrollTrackerCAU3-Motor-11-06-01', 'cau3fv', 'https://portal.unity.inaccess.com/ifms/sources/52e58aee-07f5-11eb-8564-42010afa015a/events'),
    ('calcPeriodCurrentrollTrackerCAU3-Motor-29-06-01', 'cau3fv', 'https://portal.unity.inaccess.com/ifms/sources/c43a8786-0803-11eb-8564-42010afa015a/events');

DO $$ 
DECLARE
    startdate text := to_char(current_date, 'YYYYMMDD');

BEGIN
    FOR rec IN SELECT * FROM trackers_sources LOOP
        -- Crear tablas temporales
        DROP TABLE IF EXISTS stage_trackers_cau1_v3;
        DROP TABLE IF EXISTS stage_trackers_cau12_v3;
        CREATE TEMP TABLE stage_trackers_cau1_v3(x jsonb);
        CREATE TEMP TABLE stage_trackers_cau12_v3(date timestamptz, val numeric(10,4), id text, cau text);

        -- Descargar y copiar los datos usando curl
        EXECUTE format(
            'COPY stage_trackers_cau1_v3 FROM PROGRAM ''curl -H "Api-Key:38deaa51-8716-4cc9-aa42-ab14fb72a752.01" "%s?&start_date=%sT000000Z"''',
            rec.url, startdate
        );

        -- Insertar los datos en la tabla temporal y hacer las actualizaciones
        INSERT INTO stage_trackers_cau12_v3 
        SELECT f.* 
        FROM stage_trackers_cau1_v3, jsonb_populate_recordset(null::stage_trackers_cau12_v3, x) f;

        UPDATE stage_trackers_cau12_v3 
        SET cau = 'cau1fv', 
            id = rec.id,
            date = DATE_TRUNC('minute', date);

        -- Insertar los datos finales en la tabla objetivo
        INSERT INTO trackers_cau1fv_v2
        SELECT * 
        FROM stage_trackers_cau12_v3 
        on conflict do nothing;
    END LOOP;
END $$;

-- Limpiar la tabla temporal de fuentes
DROP TABLE trackers_sources;