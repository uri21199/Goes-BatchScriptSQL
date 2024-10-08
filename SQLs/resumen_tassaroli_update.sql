DROP TABLE IF EXISTS tmp_ocr_tassaroli;
CREATE TEMP TABLE tmp_ocr_tassaroli (n text, fecha_vto date, tipo_suc text, num_doc integer, imp_neto numeric, iva numeric, iva_perc numeric, fnee text, l_23_681 text, fl_m_sj text, monto_total numeric, detalle text, id integer);

COPY tmp_ocr_tassaroli 
FROM 'C:\Users\Administrador\Desktop\bmem\Tassaroli - BD para importar - no tocar\import\0.csv'
DELIMITER ';' NULL AS 'nan'
CSV HEADER ;
ALTER TABLE tmp_ocr_tassaroli DROP COLUMN n;
INSERT INTO bmem.tassaroli_resumen SELECT * from tmp_ocr_tassaroli ON CONFLICT ON CONSTRAINT uc_tassaroli_resumen DO NOTHING;

DROP TABLE IF EXISTS tmp_ocr_tassaroli;
CREATE TEMP TABLE tmp_ocr_tassaroli (n text, fecha_vto date, tipo_suc text, num_doc integer, imp_neto numeric, iva numeric, iva_perc numeric, fnee text, l_23_681 text, fl_m_sj text, monto_total numeric, detalle text, id integer);

COPY tmp_ocr_tassaroli 
FROM 'C:\Users\Administrador\Desktop\bmem\Tassaroli - BD para importar - no tocar\import\1.csv'
DELIMITER ';' NULL AS 'nan'
CSV HEADER ;
ALTER TABLE tmp_ocr_tassaroli DROP COLUMN n;
INSERT INTO bmem.tassaroli_resumen SELECT * from tmp_ocr_tassaroli ON CONFLICT ON CONSTRAINT uc_tassaroli_resumen DO NOTHING;

DROP TABLE IF EXISTS tmp_ocr_tassaroli;
CREATE TEMP TABLE tmp_ocr_tassaroli (n text, fecha_vto date, tipo_suc text, num_doc integer, imp_neto numeric, iva numeric, iva_perc numeric, fnee text, l_23_681 text, fl_m_sj text, monto_total numeric, detalle text, id integer);

COPY tmp_ocr_tassaroli 
FROM 'C:\Users\Administrador\Desktop\bmem\Tassaroli - BD para importar - no tocar\import\2.csv'
DELIMITER ';' NULL AS 'nan'
CSV HEADER ;
ALTER TABLE tmp_ocr_tassaroli DROP COLUMN n;
INSERT INTO bmem.tassaroli_resumen SELECT * from tmp_ocr_tassaroli ON CONFLICT ON CONSTRAINT uc_tassaroli_resumen DO NOTHING;

DROP TABLE IF EXISTS tmp_ocr_tassaroli;
CREATE TEMP TABLE tmp_ocr_tassaroli (n text, fecha_vto date, tipo_suc text, num_doc integer, imp_neto numeric, iva numeric, iva_perc numeric, fnee text, l_23_681 text, fl_m_sj text, monto_total numeric, detalle text, id integer);

COPY tmp_ocr_tassaroli 
FROM 'C:\Users\Administrador\Desktop\bmem\Tassaroli - BD para importar - no tocar\import\3.csv'
DELIMITER ';' NULL AS 'nan'
CSV HEADER ;
ALTER TABLE tmp_ocr_tassaroli DROP COLUMN n;
INSERT INTO bmem.tassaroli_resumen SELECT * from tmp_ocr_tassaroli ON CONFLICT ON CONSTRAINT uc_tassaroli_resumen DO NOTHING;

DROP TABLE IF EXISTS tmp_ocr_tassaroli;
CREATE TEMP TABLE tmp_ocr_tassaroli (n text, fecha_vto date, tipo_suc text, num_doc integer, imp_neto numeric, iva numeric, iva_perc numeric, fnee text, l_23_681 text, fl_m_sj text, monto_total numeric, detalle text, id integer);

COPY tmp_ocr_tassaroli 
FROM 'C:\Users\Administrador\Desktop\bmem\Tassaroli - BD para importar - no tocar\import\4.csv'
DELIMITER ';' NULL AS 'nan'
CSV HEADER ;
ALTER TABLE tmp_ocr_tassaroli DROP COLUMN n;
INSERT INTO bmem.tassaroli_resumen SELECT * from tmp_ocr_tassaroli ON CONFLICT ON CONSTRAINT uc_tassaroli_resumen DO NOTHING;

DROP TABLE IF EXISTS tmp_ocr_tassaroli;
CREATE TEMP TABLE tmp_ocr_tassaroli (n text, fecha_vto date, tipo_suc text, num_doc integer, imp_neto numeric, iva numeric, iva_perc numeric, fnee text, l_23_681 text, fl_m_sj text, monto_total numeric, detalle text, id integer);

COPY tmp_ocr_tassaroli 
FROM 'C:\Users\Administrador\Desktop\bmem\Tassaroli - BD para importar - no tocar\import\5.csv'
DELIMITER ';' NULL AS 'nan'
CSV HEADER ;
ALTER TABLE tmp_ocr_tassaroli DROP COLUMN n;
INSERT INTO bmem.tassaroli_resumen SELECT * from tmp_ocr_tassaroli ON CONFLICT ON CONSTRAINT uc_tassaroli_resumen DO NOTHING;