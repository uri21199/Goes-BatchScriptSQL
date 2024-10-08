DELETE FROM caupotenciatrafos_cau1fv WHERE date >= now() - interval '120 minutes';
-- Crear una tabla temporal para almacenar los detalles de las URLs e IDs
CREATE TEMP TABLE trafos_sources (id text, url text);

-- Insertar los detalles de las solicitudes en la tabla
INSERT INTO trafos_sources (id, url)
VALUES
    ('A01', 'https://portal.unity.inaccess.com/ifms/sources/60e39524-07f9-11eb-aeeb-42010afa015a/events'),
    ('A02', 'https://portal.unity.inaccess.com/ifms/sources/61444e0a-07f9-11eb-aeeb-42010afa015a/events'),
    ('A03', 'https://portal.unity.inaccess.com/ifms/sources/61a645ec-07f9-11eb-aeeb-42010afa015a/events'),
    ('A04', 'https://portal.unity.inaccess.com/ifms/sources/6205b05e-07f9-11eb-aeeb-42010afa015a/events'),
    ('A05', 'https://portal.unity.inaccess.com/ifms/sources/6267127c-07f9-11eb-aeeb-42010afa015a/events'),
    ('A06', 'https://portal.unity.inaccess.com/ifms/sources/62c73a9e-07f9-11eb-aeeb-42010afa015a/events'),
    ('A07', 'https://portal.unity.inaccess.com/ifms/sources/63277526-07f9-11eb-aeeb-42010afa015a/events'),
    ('A08', 'https://portal.unity.inaccess.com/ifms/sources/638796d6-07f9-11eb-aeeb-42010afa015a/events'),
    ('A09', 'https://portal.unity.inaccess.com/ifms/sources/63e89864-07f9-11eb-aeeb-42010afa015a/events'),
    ('A10', 'https://portal.unity.inaccess.com/ifms/sources/644994a2-07f9-11eb-aeeb-42010afa015a/events'),
    ('A11', 'https://portal.unity.inaccess.com/ifms/sources/64ab8e46-07f9-11eb-aeeb-42010afa015a/events'),
    ('A12', 'https://portal.unity.inaccess.com/ifms/sources/650c86ec-07f9-11eb-aeeb-42010afa015a/events'),
    ('A13', 'https://portal.unity.inaccess.com/ifms/sources/65716846-07f9-11eb-aeeb-42010afa015a/events'),
    ('A14', 'https://portal.unity.inaccess.com/ifms/sources/65d3c612-07f9-11eb-aeeb-42010afa015a/events'),
    ('A15', 'https://portal.unity.inaccess.com/ifms/sources/66363d74-07f9-11eb-aeeb-42010afa015a/events'),
    ('A16', 'https://portal.unity.inaccess.com/ifms/sources/6699229a-07f9-11eb-aeeb-42010afa015a/events'),
    ('A17', 'https://portal.unity.inaccess.com/ifms/sources/66fcf90a-07f9-11eb-aeeb-42010afa015a/events'),
    ('A18', 'https://portal.unity.inaccess.com/ifms/sources/675d9436-07f9-11eb-aeeb-42010afa015a/events'),
    ('A19', 'https://portal.unity.inaccess.com/ifms/sources/67c1c096-07f9-11eb-aeeb-42010afa015a/events'),
    ('A20', 'https://portal.unity.inaccess.com/ifms/sources/6827407e-07f9-11eb-aeeb-42010afa015a/events'),
    ('A21', 'https://portal.unity.inaccess.com/ifms/sources/688b7c38-07f9-11eb-aeeb-42010afa015a/events'),
    ('A22', 'https://portal.unity.inaccess.com/ifms/sources/68edc4ce-07f9-11eb-aeeb-42010afa015a/events'),
    ('A23', 'https://portal.unity.inaccess.com/ifms/sources/694f19ea-07f9-11eb-aeeb-42010afa015a/events'),
    ('A24', 'https://portal.unity.inaccess.com/ifms/sources/69b0a2a0-07f9-11eb-aeeb-42010afa015a/events'),
    ('A25', 'https://portal.unity.inaccess.com/ifms/sources/6a144a94-07f9-11eb-aeeb-42010afa015a/events'),
    ('A26', 'https://portal.unity.inaccess.com/ifms/sources/6a7748a6-07f9-11eb-aeeb-42010afa015a/events'),
    ('A27', 'https://portal.unity.inaccess.com/ifms/sources/6ade1cf2-07f9-11eb-aeeb-42010afa015a/events'),
    ('A28', 'https://portal.unity.inaccess.com/ifms/sources/6b4097b0-07f9-11eb-aeeb-42010afa015a/events'),
    ('A29', 'https://portal.unity.inaccess.com/ifms/sources/6ba3bd40-07f9-11eb-aeeb-42010afa015a/events'),
    ('A30', 'https://portal.unity.inaccess.com/ifms/sources/6c06caac-07f9-11eb-aeeb-42010afa015a/events'),
    ('A31', 'https://portal.unity.inaccess.com/ifms/sources/6c66dc08-07f9-11eb-aeeb-42010afa015a/events'),
    ('A32', 'https://portal.unity.inaccess.com/ifms/sources/6ccc015a-07f9-11eb-aeeb-42010afa015a/events'),
    ('A33', 'https://portal.unity.inaccess.com/ifms/sources/6d317f3a-07f9-11eb-aeeb-42010afa015a/events'),
    ('A34', 'https://portal.unity.inaccess.com/ifms/sources/6d94d90e-07f9-11eb-aeeb-42010afa015a/events'),
    ('A35', 'https://portal.unity.inaccess.com/ifms/sources/6dfa0b12-07f9-11eb-aeeb-42010afa015a/events');

DO $$ 
DECLARE
    startdate text := to_char(current_date, 'YYYYMMDD');
    starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '12 hours' + interval '3 hours'))), 'HH24MISS');
    rec RECORD;
BEGIN
    FOR rec IN SELECT * FROM trafos_sources LOOP
        -- Crear tablas temporales
        DROP TABLE IF EXISTS stage_trafos_cau1;
        DROP TABLE IF EXISTS stage_trafos_cau12;
        CREATE TEMP TABLE stage_trafos_cau1(x jsonb);
        CREATE TEMP TABLE stage_trafos_cau12(date timestamptz, val numeric, id text, cau text);

        -- Descargar y copiar los datos usando curl
        EXECUTE format(
            'COPY stage_trafos_cau1 FROM PROGRAM ''curl -H "Api-Key:38deaa51-8716-4cc9-aa42-ab14fb72a752.01" "%s?&start_date=%sT%sZ"''',
            rec.url, startdate, starttime
        );

        -- Insertar los datos en la tabla temporal y hacer las actualizaciones
        INSERT INTO stage_trafos_cau12 
        SELECT f.* 
        FROM stage_trafos_cau1, jsonb_populate_recordset(null::stage_trafos_cau12, x) f;

        UPDATE stage_trafos_cau12 
        SET cau = 'cau1fv', 
            id = rec.id,
            date = DATE_TRUNC('minute', date);

        -- Insertar los datos finales en la tabla objetivo
        INSERT INTO caupotenciatrafos_cau1fv
        SELECT * 
        FROM stage_trafos_cau12 
        WHERE date >= (now()::timestamptz - interval '12 hours');
    END LOOP;
END $$;

-- Limpiar la tabla temporal de fuentes
DROP TABLE trafos_sources;