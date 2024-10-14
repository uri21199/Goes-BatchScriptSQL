-- Crear tabla temporal para las rutas de los archivos CSV
CREATE TEMP TABLE resumen_caf_sources (url text);

-- Insertar las rutas de los archivos CSV en la tabla temporal
INSERT INTO resumen_caf_sources (url)
VALUES
('C:\Users\Administrador\Desktop\bmem\PS Cafayate - BD para importar - no tocar\import\0.csv'),
('C:\Users\Administrador\Desktop\bmem\PS Cafayate - BD para importar - no tocar\import\1.csv'),
('C:\Users\Administrador\Desktop\bmem\PS Cafayate - BD para importar - no tocar\import\2.csv'),
('C:\Users\Administrador\Desktop\bmem\PS Cafayate - BD para importar - no tocar\import\3.csv'),
('C:\Users\Administrador\Desktop\bmem\PS Cafayate - BD para importar - no tocar\import\4.csv'),
('C:\Users\Administrador\Desktop\bmem\PS Cafayate - BD para importar - no tocar\import\5.csv'),
('C:\Users\Administrador\Desktop\bmem\PS Cafayate - BD para importar - no tocar\import\6.csv'),
('C:\Users\Administrador\Desktop\bmem\PS Cafayate - BD para importar - no tocar\import\7.csv'),
('C:\Users\Administrador\Desktop\bmem\PS Cafayate - BD para importar - no tocar\import\8.csv'),
('C:\Users\Administrador\Desktop\bmem\PS Cafayate - BD para importar - no tocar\import\9.csv'),
('C:\Users\Administrador\Desktop\bmem\PS Cafayate - BD para importar - no tocar\import\10.csv'),
('C:\Users\Administrador\Desktop\bmem\PS Cafayate - BD para importar - no tocar\import\11.csv'),
('C:\Users\Administrador\Desktop\bmem\PS Cafayate - BD para importar - no tocar\import\12.csv'),
('C:\Users\Administrador\Desktop\bmem\PS Cafayate - BD para importar - no tocar\import\13.csv'),
('C:\Users\Administrador\Desktop\bmem\PS Cafayate - BD para importar - no tocar\import\14.csv'),
('C:\Users\Administrador\Desktop\bmem\PS Cafayate - BD para importar - no tocar\import\15.csv');

DO $$ 
BEGIN
    FOR rec IN SELECT * FROM resumen_caf_sources LOOP
        -- Eliminar tablas temporales si existen
        DROP TABLE IF EXISTS tmp_ocr_caf;

        -- Crear tabla temporal
        CREATE TEMP TABLE tmp_ocr_caf (
            fecha_vto date,
            tipo_suc text,
            num_doc integer,
            imp_neto numeric,
            iva numeric,
            iva_perc numeric,
            fnee text,
            l_23_681 text,
            fl_m_sj text,
            monto_total numeric,
            detalle text,
            id integer
        );

        -- Cargar los datos desde el archivo CSV
        EXECUTE format(
            'COPY tmp_ocr_caf FROM %L WITH (FORMAT CSV, DELIMITER '';'', NULL ''nan'', HEADER)',
            rec.url
        );

        -- Insertar los datos finales en la tabla bmem.caf_resumen
        INSERT INTO bmem.caf_resumen  
        SELECT * FROM tmp_ocr_caf 
        ON CONFLICT ON CONSTRAINT uc_caf_resumen DO NOTHING;
    END LOOP;
END $$;

-- Eliminar la tabla temporal de fuentes
DROP TABLE resumen_caf_sources;