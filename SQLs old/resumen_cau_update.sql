DROP TABLE IF EXISTS tmp_ocr_cau;
CREATE TEMP TABLE tmp_ocr_cau (n text, fecha_vto date, tipo_suc text, num_doc integer, imp_neto numeric, iva numeric, iva_perc numeric, fnee text, l_23_681 text, fl_m_sj text, monto_total numeric, detalle text, id integer);

COPY tmp_ocr_cau 
FROM 'C:\Users\Administrador\Desktop\bmem\Cauchari AM - BD para importar - no tocar\import\0.csv'
DELIMITER ';' NULL AS 'nan'
CSV HEADER ;
ALTER TABLE tmp_ocr_cau DROP COLUMN n;
INSERT INTO bmem.cauchari_resumen SELECT * from tmp_ocr_cau ON CONFLICT ON CONSTRAINT uc_cauchari_resumen DO NOTHING;
DROP TABLE IF EXISTS tmp_ocr_cau;
CREATE TEMP TABLE tmp_ocr_cau (n text, fecha_vto date, tipo_suc text, num_doc integer, imp_neto numeric, iva numeric, iva_perc numeric, fnee text, l_23_681 text, fl_m_sj text, monto_total numeric, detalle text, id integer);

COPY tmp_ocr_cau 
FROM 'C:\Users\Administrador\Desktop\bmem\Cauchari AM - BD para importar - no tocar\import\1.csv'
DELIMITER ';' NULL AS 'nan'
CSV HEADER ;
ALTER TABLE tmp_ocr_cau DROP COLUMN n;
INSERT INTO bmem.cauchari_resumen SELECT * from tmp_ocr_cau ON CONFLICT ON CONSTRAINT uc_cauchari_resumen DO NOTHING;
DROP TABLE IF EXISTS tmp_ocr_cau;
CREATE TEMP TABLE tmp_ocr_cau (n text, fecha_vto date, tipo_suc text, num_doc integer, imp_neto numeric, iva numeric, iva_perc numeric, fnee text, l_23_681 text, fl_m_sj text, monto_total numeric, detalle text, id integer);

COPY tmp_ocr_cau 
FROM 'C:\Users\Administrador\Desktop\bmem\Cauchari AM - BD para importar - no tocar\import\2.csv'
DELIMITER ';' NULL AS 'nan'
CSV HEADER ;
ALTER TABLE tmp_ocr_cau DROP COLUMN n;
INSERT INTO bmem.cauchari_resumen SELECT * from tmp_ocr_cau ON CONFLICT ON CONSTRAINT uc_cauchari_resumen DO NOTHING;
DROP TABLE IF EXISTS tmp_ocr_cau;
CREATE TEMP TABLE tmp_ocr_cau (n text, fecha_vto date, tipo_suc text, num_doc integer, imp_neto numeric, iva numeric, iva_perc numeric, fnee text, l_23_681 text, fl_m_sj text, monto_total numeric, detalle text, id integer);

COPY tmp_ocr_cau 
FROM 'C:\Users\Administrador\Desktop\bmem\Cauchari AM - BD para importar - no tocar\import\3.csv'
DELIMITER ';' NULL AS 'nan'
CSV HEADER ;
ALTER TABLE tmp_ocr_cau DROP COLUMN n;
INSERT INTO bmem.cauchari_resumen SELECT * from tmp_ocr_cau ON CONFLICT ON CONSTRAINT uc_cauchari_resumen DO NOTHING;
DROP TABLE IF EXISTS tmp_ocr_cau;
CREATE TEMP TABLE tmp_ocr_cau (n text, fecha_vto date, tipo_suc text, num_doc integer, imp_neto numeric, iva numeric, iva_perc numeric, fnee text, l_23_681 text, fl_m_sj text, monto_total numeric, detalle text, id integer);

COPY tmp_ocr_cau 
FROM 'C:\Users\Administrador\Desktop\bmem\Cauchari AM - BD para importar - no tocar\import\4.csv'
DELIMITER ';' NULL AS 'nan'
CSV HEADER ;
ALTER TABLE tmp_ocr_cau DROP COLUMN n;
INSERT INTO bmem.cauchari_resumen SELECT * from tmp_ocr_cau ON CONFLICT ON CONSTRAINT uc_cauchari_resumen DO NOTHING;
DROP TABLE IF EXISTS tmp_ocr_cau;
CREATE TEMP TABLE tmp_ocr_cau (n text, fecha_vto date, tipo_suc text, num_doc integer, imp_neto numeric, iva numeric, iva_perc numeric, fnee text, l_23_681 text, fl_m_sj text, monto_total numeric, detalle text, id integer);

COPY tmp_ocr_cau 
FROM 'C:\Users\Administrador\Desktop\bmem\Cauchari AM - BD para importar - no tocar\import\5.csv'
DELIMITER ';' NULL AS 'nan'
CSV HEADER ;
ALTER TABLE tmp_ocr_cau DROP COLUMN n;
INSERT INTO bmem.cauchari_resumen SELECT * from tmp_ocr_cau ON CONFLICT ON CONSTRAINT uc_cauchari_resumen DO NOTHING;