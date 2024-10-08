DELETE FROM alert_cau.caupotenciatrafos_cau3fv WHERE date >= now() - interval '120 minutes';
DELETE FROM caupotenciatrafos_cau3fv WHERE date >= now() - interval '120 minutes';
-- Crear una tabla temporal para almacenar los detalles de las URLs e IDs
CREATE TEMP TABLE trafos_sources (id text, url text);

-- Insertar los detalles de las solicitudes en la tabla
INSERT INTO trafos_sources (id, url)
VALUES
    ('C01', 'https://portal.unity.inaccess.com/ifms/sources/1952bcd2-07ed-11eb-8564-42010afa015a/events'),
    ('C02', 'https://portal.unity.inaccess.com/ifms/sources/19b0bbac-07ed-11eb-8564-42010afa015a/events'),
    ('C03', 'https://portal.unity.inaccess.com/ifms/sources/1a0ffa2c-07ed-11eb-8564-42010afa015a/events'),
    ('C04', 'https://portal.unity.inaccess.com/ifms/sources/1a6ce9bc-07ed-11eb-8564-42010afa015a/events'),
    ('C05', 'https://portal.unity.inaccess.com/ifms/sources/1aca84b4-07ed-11eb-8564-42010afa015a/events'),
    ('C06', 'https://portal.unity.inaccess.com/ifms/sources/1b28e3b0-07ed-11eb-8564-42010afa015a/events'),
    ('C07', 'https://portal.unity.inaccess.com/ifms/sources/1b884fee-07ed-11eb-8564-42010afa015a/events'),
    ('C08', 'https://portal.unity.inaccess.com/ifms/sources/1be654e0-07ed-11eb-8564-42010afa015a/events'),
    ('C09', 'https://portal.unity.inaccess.com/ifms/sources/1c450f12-07ed-11eb-8564-42010afa015a/events'),
    ('C10', 'https://portal.unity.inaccess.com/ifms/sources/1ca1c2d4-07ed-11eb-8564-42010afa015a/events'),
    ('C11', 'https://portal.unity.inaccess.com/ifms/sources/1d00cd06-07ed-11eb-8564-42010afa015a/events'),
    ('C12', 'https://portal.unity.inaccess.com/ifms/sources/1d5fb078-07ed-11eb-8564-42010afa015a/events'),
    ('C13', 'https://portal.unity.inaccess.com/ifms/sources/1dc04e56-07ed-11eb-8564-42010afa015a/events'),
    ('C14', 'https://portal.unity.inaccess.com/ifms/sources/1e1e08b6-07ed-11eb-8564-42010afa015a/events'),
    ('C15', 'https://portal.unity.inaccess.com/ifms/sources/1e7b4936-07ed-11eb-8564-42010afa015a/events'),
    ('C16', 'https://portal.unity.inaccess.com/ifms/sources/1eda7d20-07ed-11eb-8564-42010afa015a/events'),
    ('C17', 'https://portal.unity.inaccess.com/ifms/sources/1f39537c-07ed-11eb-8564-42010afa015a/events'),
    ('C18', 'https://portal.unity.inaccess.com/ifms/sources/1f97a4e0-07ed-11eb-8564-42010afa015a/events'),
    ('C19', 'https://portal.unity.inaccess.com/ifms/sources/1ff75372-07ed-11eb-8564-42010afa015a/events'),
    ('C20', 'https://portal.unity.inaccess.com/ifms/sources/2054ce9e-07ed-11eb-8564-42010afa015a/events'),
    ('C21', 'https://portal.unity.inaccess.com/ifms/sources/20b33f9c-07ed-11eb-8564-42010afa015a/events'),
    ('C22', 'https://portal.unity.inaccess.com/ifms/sources/211066ea-07ed-11eb-8564-42010afa015a/events'),
    ('C23', 'https://portal.unity.inaccess.com/ifms/sources/217002ee-07ed-11eb-8564-42010afa015a/events'),
    ('C24', 'https://portal.unity.inaccess.com/ifms/sources/21ce8c42-07ed-11eb-8564-42010afa015a/events'),
    ('C25', 'https://portal.unity.inaccess.com/ifms/sources/222e954c-07ed-11eb-8564-42010afa015a/events'),
    ('C26', 'https://portal.unity.inaccess.com/ifms/sources/228ce61a-07ed-11eb-8564-42010afa015a/events'),
    ('C27', 'https://portal.unity.inaccess.com/ifms/sources/22ec5e56-07ed-11eb-8564-42010afa015a/events'),
    ('C28', 'https://portal.unity.inaccess.com/ifms/sources/234b6fe0-07ed-11eb-8564-42010afa015a/events'),
    ('C29', 'https://portal.unity.inaccess.com/ifms/sources/23a95b0a-07ed-11eb-8564-42010afa015a/events'),
    ('C30', 'https://portal.unity.inaccess.com/ifms/sources/25348f94-07ed-11eb-8564-42010afa015a/events'),
    ('C31', 'https://portal.unity.inaccess.com/ifms/sources/25955130-07ed-11eb-8564-42010afa015a/events'),
    ('C32', 'https://portal.unity.inaccess.com/ifms/sources/25f4a996-07ed-11eb-8564-42010afa015a/events'),
    ('C33', 'https://portal.unity.inaccess.com/ifms/sources/265581ee-07ed-11eb-8564-42010afa015a/events'),
    ('C34', 'https://portal.unity.inaccess.com/ifms/sources/26b2afd6-07ed-11eb-8564-42010afa015a/events'),
    ('C35', 'https://portal.unity.inaccess.com/ifms/sources/2712e374-07ed-11eb-8564-42010afa015a/events');

DO $$ 
DECLARE
    startdate text := to_char(current_date, 'YYYYMMDD');
    starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '130 minutes' + interval '3 hours'))), 'HH24MISS');
    rec RECORD;
BEGIN
    FOR rec IN SELECT * FROM trafos_sources LOOP
        -- Crear tablas temporales
        DROP TABLE IF EXISTS stage_trafos_cau_3;
        DROP TABLE IF EXISTS stage_trafos_cau_32;
        CREATE TEMP TABLE stage_trafos_cau3(x jsonb);
        CREATE TEMP TABLE stage_trafos_cau_32(date timestamptz, val numeric, id text, cau text);

        -- Descargar y copiar los datos usando curl
        EXECUTE format(
            'COPY stage_trafos_cau_3 FROM PROGRAM ''curl -H "Api-Key:38deaa51-8716-4cc9-aa42-ab14fb72a752.01" "%s?&start_date=%sT%sZ"''',
            rec.url, startdate, starttime
        );

        -- Insertar los datos en la tabla temporal y hacer las actualizaciones
        INSERT INTO stage_trafos_cau_32 
        SELECT f.* 
        FROM stage_trafos_cau_3, jsonb_populate_recordset(null::stage_trafos_cau_32, x) f;

        UPDATE stage_trafos_cau_32 
        SET cau = 'cau3fv', 
            id = rec.id,
            date = DATE_TRUNC('minute', date);

        -- Insertar los datos finales en la tabla objetivo
        INSERT INTO alert_cau.caupotenciatrafos_cau3fv 
        SELECT * 
        FROM stage_trafos_cau_32 
        WHERE date >= (now()::timestamptz - interval '130 minutes');
    END LOOP;
END $$;

-- Limpiar la tabla temporal de fuentes
DROP TABLE trafos_sources;