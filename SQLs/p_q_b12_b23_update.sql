DELETE FROM P_Q_B15_B23 WHERE date >= now() - interval '8 hours';
-- Insertar los detalles de las solicitudes en la tabla
CREATE TEMP TABLE p_q_sources (url text, id text);

-- Insertar los detalles de las solicitudes en la tabla
INSERT INTO p_q_sources (url, id)
VALUES
("https://portal.unity.inaccess.com/ifms/sources/c98b6834-07ec-11eb-8a43-42010afa015a/events", 'P B15'),
("https://portal.unity.inaccess.com/ifms/sources/c97cadf8-07ec-11eb-8a43-42010afa015a/events", 'Q B15'),
("https://portal.unity.inaccess.com/ifms/sources/ccbbda0c-07ec-11eb-8a43-42010afa015a/events", 'P B23'),
("https://portal.unity.inaccess.com/ifms/sources/ccb0d580-07ec-11eb-8a43-42010afa015a/events", 'Q B23');

DO $$ 
BEGIN
        DECLARE startdate text := to_char(current_date - interval '1 day', 'YYYYMMDD');
        DECLARE starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz + interval '3 hours'))), 'HH24MISS');
    FOR rec IN SELECT * FROM p_q_sources LOOP
        -- Eliminar tablas temporales si existen
        DROP TABLE IF EXISTS stage_p_q;
        DROP TABLE IF EXISTS stage_p_q2;

        -- Crear tablas temporales
        CREATE TEMP TABLE stage_p_q(x jsonb);
        CREATE TEMP TABLE stage_p_q2(date timestamptz, val numeric, id text);

        -- Descargar y copiar los datos usando curl
        EXECUTE format(
            'COPY stage_p_q FROM PROGRAM ''curl "%s?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"''',
            rec.url
        );

        -- Insertar los datos en la tabla temporal y poblar inverters_cau1_temp2
        INSERT INTO stage_p_q2
        SELECT f.* 
        FROM stage_p_q, jsonb_populate_recordset(null::stage_p_q2, x) f;

        -- Actualizar la fecha truncada al minuto y el valor de cau
        EXECUTE format(
            'UPDATE stage_p_q2 
            SET id = %L,
                date = DATE_TRUNC(''minute'', date)',
            rec.id
        );

        -- Insertar los datos finales en la tabla inverters_cau1fv
        INSERT INTO P_Q_B15_B23 
        SELECT * FROM stage_p_q2 
        WHERE date >= (now()::timestamptz - interval '8 hours');
    END LOOP;
END $$;

-- Limpiar la tabla temporal de fuentes
DROP TABLE p_q_sources;



