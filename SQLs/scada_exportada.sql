-- Crear tabla temporal para las rutas de los archivos CSV
CREATE TEMP TABLE scada_exportada_sources (url text, id text);

-- Insertar las rutas de los archivos CSV en la tabla temporal
INSERT INTO scada_exportada_sources (url, id)
VALUES
("https://portal.unity.inaccess.com/ifms/sources/66e4ebde-07be-11eb-8c92-42010afa015a/events",'CAU345FV'),
("https://portal.unity.inaccess.com/ifms/sources/c62ae0c8-0816-11eb-aeeb-42010afa015a/events",'CAU1FV'),
("https://portal.unity.inaccess.com/ifms/sources/676a0fc6-0809-11eb-8a43-42010afa015a/events",'CAU2FV'),
("https://portal.unity.inaccess.com/ifms/sources/8acddc7c-0809-11eb-8564-42010afa015a/events",'CAU3FV'),
("https://portal.unity.inaccess.com/ifms/sources/fb2dca56-f33f-11ea-83ff-42010afa015a/events",'CAFAFV');

DO $$
DECLARE startdate text := to_char(current_date - interval '3 days', 'YYYYMMDD'), starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz + interval '3 hours'))), 'HH24MISS');
BEGIN
    FOR rec IN SELECT * FROM scada_exportada_sources LOOP
        -- Eliminar tablas temporales si existen
        DROP TABLE IF EXISTS stage_scada_exportada;
        DROP TABLE IF EXISTS stage_scada_exportada2;
        -- Crear tabla temporal
        CREATE TEMP TABLE stage_scada_exportada(x jsonb);
        CREATE TEMP TABLE stage_scada_exportada2(date timestamptz, val numeric, id text);

        -- Cargar los datos desde el archivo CSV
        EXECUTE format(
            'COPY stage_scada_exportada FROM PROGRAM ''curl -H "Api-Key:38deaa51-8716-4cc9-aa42-ab14fb72a752.01" "%s?&start_date=%sT%sZ"''',
            rec.url, startdate, starttime
        );

        -- Insertar los datos finales en la tabla bmem.arb_resumen
        INSERT INTO stage_scada_exportada2 select f.* from stage_scada_exportada, jsonb_populate_recordset(null::stage_scada_exportada2, x) f;
        UPDATE stage_scada_exportada2 SET date = DATE_TRUNC('minute', date);
        EXECUTE FORMAT ('UPDATE stage_scada_exportada2 SET id = %L', rec.id);
        INSERT INTO smec.scada_exportada SELECT * from stage_scada_exportada2 ON CONFLICT DO NOTHING;
    END LOOP;
END $$;

-- Eliminar la tabla temporal de fuentes
DROP TABLE scada_exportada_sources;