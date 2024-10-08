DELETE FROM caupotenciatrafos_cau2fv WHERE date >= now() - interval '120 minutes';
-- Crear una tabla temporal para almacenar los detalles de las URLs e IDs
CREATE TEMP TABLE trafos_sources (id text, url text);

-- Insertar los detalles de las solicitudes en la tabla
INSERT INTO trafos_sources (id, url)
VALUES
    ('B01', 'https://portal.unity.inaccess.com/ifms/sources/c4295d06-07ec-11eb-8a43-42010afa015a/events'),
    ('B02', 'https://portal.unity.inaccess.com/ifms/sources/c4884bcc-07ec-11eb-8a43-42010afa015a/events'),
    ('B03', 'https://portal.unity.inaccess.com/ifms/sources/c4fa5f82-07ec-11eb-8a43-42010afa015a/events'),
    ('B04', 'https://portal.unity.inaccess.com/ifms/sources/c57308c4-07ec-11eb-8a43-42010afa015a/events'),
    ('B05', 'https://portal.unity.inaccess.com/ifms/sources/c5d18660-07ec-11eb-8a43-42010afa015a/events'),
    ('B06', 'https://portal.unity.inaccess.com/ifms/sources/c6303dc2-07ec-11eb-8a43-42010afa015a/events'),
    ('B07', 'https://portal.unity.inaccess.com/ifms/sources/c6903ede-07ec-11eb-8a43-42010afa015a/events'),
    ('B08', 'https://portal.unity.inaccess.com/ifms/sources/c6ed3972-07ec-11eb-8a43-42010afa015a/events'),
    ('B09', 'https://portal.unity.inaccess.com/ifms/sources/c74dcec2-07ec-11eb-8a43-42010afa015a/events'),
    ('B10', 'https://portal.unity.inaccess.com/ifms/sources/c7abad76-07ec-11eb-8a43-42010afa015a/events'),
    ('B11', 'https://portal.unity.inaccess.com/ifms/sources/c809f250-07ec-11eb-8a43-42010afa015a/events'),
    ('B12', 'https://portal.unity.inaccess.com/ifms/sources/c867cad8-07ec-11eb-8a43-42010afa015a/events'),
    ('B13', 'https://portal.unity.inaccess.com/ifms/sources/c8ca6fb2-07ec-11eb-8a43-42010afa015a/events'),
    ('B14', 'https://portal.unity.inaccess.com/ifms/sources/c9287882-07ec-11eb-8a43-42010afa015a/events'),
    ('B15', 'https://portal.unity.inaccess.com/ifms/sources/c98b6834-07ec-11eb-8a43-42010afa015a/events'),
    ('B16', 'https://portal.unity.inaccess.com/ifms/sources/c9ed3140-07ec-11eb-8a43-42010afa015a/events'),
    ('B17', 'https://portal.unity.inaccess.com/ifms/sources/ca4f887c-07ec-11eb-8a43-42010afa015a/events'),
    ('B18', 'https://portal.unity.inaccess.com/ifms/sources/cac17a4a-07ec-11eb-8a43-42010afa015a/events'),
    ('B19', 'https://portal.unity.inaccess.com/ifms/sources/cb2791ae-07ec-11eb-8a43-42010afa015a/events'),
    ('B20', 'https://portal.unity.inaccess.com/ifms/sources/cb888004-07ec-11eb-8a43-42010afa015a/events'),
    ('B21', 'https://portal.unity.inaccess.com/ifms/sources/cbf4d970-07ec-11eb-8a43-42010afa015a/events'),
    ('B22', 'https://portal.unity.inaccess.com/ifms/sources/cc5939c4-07ec-11eb-8a43-42010afa015a/events'),
    ('B23', 'https://portal.unity.inaccess.com/ifms/sources/ccbbda0c-07ec-11eb-8a43-42010afa015a/events'),
    ('B24', 'https://portal.unity.inaccess.com/ifms/sources/cd1fd232-07ec-11eb-8a43-42010afa015a/events'),
    ('B25', 'https://portal.unity.inaccess.com/ifms/sources/cd82c9c8-07ec-11eb-8a43-42010afa015a/events'),
    ('B26', 'https://portal.unity.inaccess.com/ifms/sources/cde9ec66-07ec-11eb-8a43-42010afa015a/events'),
    ('B27', 'https://portal.unity.inaccess.com/ifms/sources/ce4e1876-07ec-11eb-8a43-42010afa015a/events'),
    ('B28', 'https://portal.unity.inaccess.com/ifms/sources/ceb1801e-07ec-11eb-8a43-42010afa015a/events'),
    ('B29', 'https://portal.unity.inaccess.com/ifms/sources/cf18ce18-07ec-11eb-8a43-42010afa015a/events'),
    ('B30', 'https://portal.unity.inaccess.com/ifms/sources/cf786d14-07ec-11eb-8a43-42010afa015a/events'),
    ('B31', 'https://portal.unity.inaccess.com/ifms/sources/cfdae2f0-07ec-11eb-8a43-42010afa015a/events'),
    ('B32', 'https://portal.unity.inaccess.com/ifms/sources/d03e9886-07ec-11eb-8a43-42010afa015a/events'),
    ('B33', 'https://portal.unity.inaccess.com/ifms/sources/d0a16ff6-07ec-11eb-8a43-42010afa015a/events'),
    ('B34', 'https://portal.unity.inaccess.com/ifms/sources/d102e8f8-07ec-11eb-8a43-42010afa015a/events'),
    ('B35', 'https://portal.unity.inaccess.com/ifms/sources/d1665f8c-07ec-11eb-8a43-42010afa015a/events');

DO $$ 
DECLARE
    startdate text := to_char(current_date, 'YYYYMMDD');
    starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz - interval '12 hours' + interval '3 hours'))), 'HH24MISS');
    rec RECORD;
BEGIN
    FOR rec IN SELECT * FROM trafos_sources LOOP
        -- Crear tablas temporales
        DROP TABLE IF EXISTS stage_trafos_cau2;
        DROP TABLE IF EXISTS stage_trafos_cau22;
        CREATE TEMP TABLE stage_trafos_cau2(x jsonb);
        CREATE TEMP TABLE stage_trafos_cau22(date timestamptz, val numeric, id text, cau text);

        -- Descargar y copiar los datos usando curl
        EXECUTE format(
            'COPY stage_trafos_cau2 FROM PROGRAM ''curl -H "Api-Key:38deaa51-8716-4cc9-aa42-ab14fb72a752.01" "%s?&start_date=%sT%sZ"''',
            rec.url, startdate, starttime
        );

        -- Insertar los datos en la tabla temporal y hacer las actualizaciones
        INSERT INTO stage_trafos_cau22 
        SELECT f.* 
        FROM stage_trafos_cau2, jsonb_populate_recordset(null::stage_trafos_cau22, x) f;

        UPDATE stage_trafos_cau22 
        SET cau = 'cau2fv', 
            id = rec.id,
            date = DATE_TRUNC('minute', date);

        -- Insertar los datos finales en la tabla objetivo
        INSERT INTO alert_cau.caupotenciatrafos_cau2fv 
        SELECT * 
        FROM stage_trafos_cau22 
        WHERE date >= (now()::timestamptz - interval '12 hours');
    END LOOP;
END $$;

-- Limpiar la tabla temporal de fuentes
DROP TABLE trafos_sources;