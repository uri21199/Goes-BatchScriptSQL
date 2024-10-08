-- Elimina la tabla temporal si existe y crea una nueva
DROP TABLE IF EXISTS tmp_ocr_tassaroli;
CREATE TEMP TABLE tmp_ocr_tassaroli (
    n text, 
    cantidad numeric, 
    n2 text, 
    detalle text, 
    importe numeric, 
    ajuste_doc text, 
    tipo_doc text, 
    num_doc text, 
    emision date, 
    vencimiento date, 
    agente text, 
    periodo text,
    id integer
);

-- Tabla auxiliar para las rutas de los archivos CSV
CREATE TEMP TABLE file_paths_tassaroli (
    id serial PRIMARY KEY,
    file_path text
);

-- Insertar las rutas de los archivos CSV en la tabla auxiliar
INSERT INTO file_paths_tassaroli (file_path) VALUES
('C:\Users\Administrador\Desktop\bmem\Tassaroli - BD para importar - no tocar\import\0.csv'),
('C:\Users\Administrador\Desktop\bmem\Tassaroli - BD para importar - no tocar\import\1.csv'),
('C:\Users\Administrador\Desktop\bmem\Tassaroli - BD para importar - no tocar\import\2.csv'),
('C:\Users\Administrador\Desktop\bmem\Tassaroli - BD para importar - no tocar\import\3.csv'),
('C:\Users\Administrador\Desktop\bmem\Tassaroli - BD para importar - no tocar\import\4.csv'),
('C:\Users\Administrador\Desktop\bmem\Tassaroli - BD para importar - no tocar\import\5.csv');

-- Iterar sobre cada archivo y cargar los datos
DO $$ 
DECLARE 
    file_record record;
BEGIN
    FOR file_record IN (SELECT file_path FROM file_paths_tassaroli) LOOP
        EXECUTE format('
            COPY tmp_ocr_tassaroli FROM %L DELIMITER '';'' NULL AS ''NaN'' CSV HEADER', file_record.file_path);
    END LOOP;
END $$;

-- Modifica las columnas, actualiza campos e inserta nuevos datos
ALTER TABLE tmp_ocr_tassaroli ADD COLUMN periodo2 date;
UPDATE tmp_ocr_tassaroli SET periodo2 = CONCAT('01/', periodo)::date;

-- Eliminación de columnas no necesarias
ALTER TABLE tmp_ocr_tassaroli 
DROP COLUMN n, 
DROP COLUMN n2, 
DROP COLUMN periodo;

-- Actualización de datos usando CASE
UPDATE tmp_ocr_tassaroli
SET detalle = CASE
    WHEN detalle LIKE 'Remu%' THEN 'Remuneracion Base Energia No Convencionales'
    WHEN detalle LIKE 'Valo%' THEN 'Valorizacion Energia - Cargo Variable'
    ELSE detalle
END;

-- Insertar datos procesados en la tabla final
INSERT INTO bmem.tassaroli_detalle 
SELECT 
    cantidad, 
    detalle, 
    importe, 
    ajuste_doc, 
    tipo_doc, 
    num_doc, 
    emision, 
    vencimiento, 
    agente, 
    periodo2, 
    id  
FROM tmp_ocr_tassaroli 
ON CONFLICT DO NOTHING;
