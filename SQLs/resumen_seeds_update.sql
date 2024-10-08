DROP TABLE IF EXISTS tmp_ocr_seeds;
CREATE TEMP TABLE tmp_ocr_seeds (n text, fecha_vto date, tipo_suc text, num_doc integer, imp_neto numeric, iva numeric, iva_perc numeric, fnee text, l_23_681 text, fl_m_sj text, monto_total numeric, detalle text, id integer);

COPY tmp_ocr_seeds 
FROM 'C:\Users\Administrador\Desktop\bmem\Seeds AM - BD para importar - no tocar\import\0.csv'
DELIMITER ';' NULL AS 'nan'
CSV HEADER ;
ALTER TABLE tmp_ocr_seeds DROP COLUMN n;
INSERT INTO bmem.seeds_resumen SELECT * from tmp_ocr_seeds ON CONFLICT ON CONSTRAINT uc_seeds_resumen DO NOTHING;
DROP TABLE IF EXISTS tmp_ocr_seeds;
CREATE TEMP TABLE tmp_ocr_seeds (n text, fecha_vto date, tipo_suc text, num_doc integer, imp_neto numeric, iva numeric, iva_perc numeric, fnee text, l_23_681 text, fl_m_sj text, monto_total numeric, detalle text, id integer);

COPY tmp_ocr_seeds 
FROM 'C:\Users\Administrador\Desktop\bmem\Seeds AM - BD para importar - no tocar\import\1.csv'
DELIMITER ';' NULL AS 'nan'
CSV HEADER ;
ALTER TABLE tmp_ocr_seeds DROP COLUMN n;
INSERT INTO bmem.seeds_resumen SELECT * from tmp_ocr_seeds ON CONFLICT ON CONSTRAINT uc_seeds_resumen DO NOTHING;
DROP TABLE IF EXISTS tmp_ocr_seeds;
CREATE TEMP TABLE tmp_ocr_seeds (n text, fecha_vto date, tipo_suc text, num_doc integer, imp_neto numeric, iva numeric, iva_perc numeric, fnee text, l_23_681 text, fl_m_sj text, monto_total numeric, detalle text, id integer);

COPY tmp_ocr_seeds 
FROM 'C:\Users\Administrador\Desktop\bmem\Seeds AM - BD para importar - no tocar\import\2.csv'
DELIMITER ';' NULL AS 'nan'
CSV HEADER ;
ALTER TABLE tmp_ocr_seeds DROP COLUMN n;
INSERT INTO bmem.seeds_resumen SELECT * from tmp_ocr_seeds ON CONFLICT ON CONSTRAINT uc_seeds_resumen DO NOTHING;
DROP TABLE IF EXISTS tmp_ocr_seeds;
CREATE TEMP TABLE tmp_ocr_seeds (n text, fecha_vto date, tipo_suc text, num_doc integer, imp_neto numeric, iva numeric, iva_perc numeric, fnee text, l_23_681 text, fl_m_sj text, monto_total numeric, detalle text, id integer);

COPY tmp_ocr_seeds 
FROM 'C:\Users\Administrador\Desktop\bmem\Seeds AM - BD para importar - no tocar\import\3.csv'
DELIMITER ';' NULL AS 'nan'
CSV HEADER ;
ALTER TABLE tmp_ocr_seeds DROP COLUMN n;
INSERT INTO bmem.seeds_resumen SELECT * from tmp_ocr_seeds ON CONFLICT ON CONSTRAINT uc_seeds_resumen DO NOTHING;

DROP TABLE IF EXISTS tmp_ocr_seeds;
CREATE TEMP TABLE tmp_ocr_seeds (n text, fecha_vto date, tipo_suc text, num_doc integer, imp_neto numeric, iva numeric, iva_perc numeric, fnee text, l_23_681 text, fl_m_sj text, monto_total numeric, detalle text, id integer);

COPY tmp_ocr_seeds 
FROM 'C:\Users\Administrador\Desktop\bmem\Seeds AM - BD para importar - no tocar\import\4.csv'
DELIMITER ';' NULL AS 'nan'
CSV HEADER ;
ALTER TABLE tmp_ocr_seeds DROP COLUMN n;
INSERT INTO bmem.seeds_resumen SELECT * from tmp_ocr_seeds ON CONFLICT ON CONSTRAINT uc_seeds_resumen DO NOTHING;
DROP TABLE IF EXISTS tmp_ocr_seeds;
CREATE TEMP TABLE tmp_ocr_seeds (n text, fecha_vto date, tipo_suc text, num_doc integer, imp_neto numeric, iva numeric, iva_perc numeric, fnee text, l_23_681 text, fl_m_sj text, monto_total numeric, detalle text, id integer);

COPY tmp_ocr_seeds 
FROM 'C:\Users\Administrador\Desktop\bmem\Seeds AM - BD para importar - no tocar\import\5.csv'
DELIMITER ';' NULL AS 'nan'
CSV HEADER ;
ALTER TABLE tmp_ocr_seeds DROP COLUMN n;
INSERT INTO bmem.seeds_resumen SELECT * from tmp_ocr_seeds ON CONFLICT ON CONSTRAINT uc_seeds_resumen DO NOTHING;
DROP TABLE IF EXISTS tmp_ocr_seeds;
CREATE TEMP TABLE tmp_ocr_seeds (n text, fecha_vto date, tipo_suc text, num_doc integer, imp_neto numeric, iva numeric, iva_perc numeric, fnee text, l_23_681 text, fl_m_sj text, monto_total numeric, detalle text, id integer);

COPY tmp_ocr_seeds 
FROM 'C:\Users\Administrador\Desktop\bmem\Seeds AM - BD para importar - no tocar\import\6.csv'
DELIMITER ';' NULL AS 'nan'
CSV HEADER ;
ALTER TABLE tmp_ocr_seeds DROP COLUMN n;
INSERT INTO bmem.seeds_resumen SELECT * from tmp_ocr_seeds ON CONFLICT ON CONSTRAINT uc_seeds_resumen DO NOTHING;
DROP TABLE IF EXISTS tmp_ocr_seeds;
CREATE TEMP TABLE tmp_ocr_seeds (n text, fecha_vto date, tipo_suc text, num_doc integer, imp_neto numeric, iva numeric, iva_perc numeric, fnee text, l_23_681 text, fl_m_sj text, monto_total numeric, detalle text, id integer);

COPY tmp_ocr_seeds 
FROM 'C:\Users\Administrador\Desktop\bmem\Seeds AM - BD para importar - no tocar\import\7.csv'
DELIMITER ';' NULL AS 'nan'
CSV HEADER ;
ALTER TABLE tmp_ocr_seeds DROP COLUMN n;
INSERT INTO bmem.seeds_resumen SELECT * from tmp_ocr_seeds ON CONFLICT ON CONSTRAINT uc_seeds_resumen DO NOTHING;

DROP TABLE IF EXISTS tmp_ocr_seeds;
CREATE TEMP TABLE tmp_ocr_seeds (n text, fecha_vto date, tipo_suc text, num_doc integer, imp_neto numeric, iva numeric, iva_perc numeric, fnee text, l_23_681 text, fl_m_sj text, monto_total numeric, detalle text, id integer);

COPY tmp_ocr_seeds 
FROM 'C:\Users\Administrador\Desktop\bmem\Seeds AM - BD para importar - no tocar\import\8.csv'
DELIMITER ';' NULL AS 'nan'
CSV HEADER ;
ALTER TABLE tmp_ocr_seeds DROP COLUMN n;
INSERT INTO bmem.seeds_resumen SELECT * from tmp_ocr_seeds ON CONFLICT ON CONSTRAINT uc_seeds_resumen DO NOTHING;
DROP TABLE IF EXISTS tmp_ocr_seeds;
CREATE TEMP TABLE tmp_ocr_seeds (n text, fecha_vto date, tipo_suc text, num_doc integer, imp_neto numeric, iva numeric, iva_perc numeric, fnee text, l_23_681 text, fl_m_sj text, monto_total numeric, detalle text, id integer);

COPY tmp_ocr_seeds 
FROM 'C:\Users\Administrador\Desktop\bmem\Seeds AM - BD para importar - no tocar\import\9.csv'
DELIMITER ';' NULL AS 'nan'
CSV HEADER ;
ALTER TABLE tmp_ocr_seeds DROP COLUMN n;
INSERT INTO bmem.seeds_resumen SELECT * from tmp_ocr_seeds ON CONFLICT ON CONSTRAINT uc_seeds_resumen DO NOTHING;
DROP TABLE IF EXISTS tmp_ocr_seeds;
CREATE TEMP TABLE tmp_ocr_seeds (n text, fecha_vto date, tipo_suc text, num_doc integer, imp_neto numeric, iva numeric, iva_perc numeric, fnee text, l_23_681 text, fl_m_sj text, monto_total numeric, detalle text, id integer);

COPY tmp_ocr_seeds 
FROM 'C:\Users\Administrador\Desktop\bmem\Seeds AM - BD para importar - no tocar\import\10.csv'
DELIMITER ';' NULL AS 'nan'
CSV HEADER ;
ALTER TABLE tmp_ocr_seeds DROP COLUMN n;
INSERT INTO bmem.seeds_resumen SELECT * from tmp_ocr_seeds ON CONFLICT ON CONSTRAINT uc_seeds_resumen DO NOTHING;
DROP TABLE IF EXISTS tmp_ocr_seeds;
CREATE TEMP TABLE tmp_ocr_seeds (n text, fecha_vto date, tipo_suc text, num_doc integer, imp_neto numeric, iva numeric, iva_perc numeric, fnee text, l_23_681 text, fl_m_sj text, monto_total numeric, detalle text, id integer);

COPY tmp_ocr_seeds 
FROM 'C:\Users\Administrador\Desktop\bmem\Seeds AM - BD para importar - no tocar\import\11.csv'
DELIMITER ';' NULL AS 'nan'
CSV HEADER ;
ALTER TABLE tmp_ocr_seeds DROP COLUMN n;
INSERT INTO bmem.seeds_resumen SELECT * from tmp_ocr_seeds ON CONFLICT ON CONSTRAINT uc_seeds_resumen DO NOTHING;

DROP TABLE IF EXISTS tmp_ocr_seeds;
CREATE TEMP TABLE tmp_ocr_seeds (n text, fecha_vto date, tipo_suc text, num_doc integer, imp_neto numeric, iva numeric, iva_perc numeric, fnee text, l_23_681 text, fl_m_sj text, monto_total numeric, detalle text, id integer);

COPY tmp_ocr_seeds 
FROM 'C:\Users\Administrador\Desktop\bmem\Seeds AM - BD para importar - no tocar\import\12.csv'
DELIMITER ';' NULL AS 'nan'
CSV HEADER ;
ALTER TABLE tmp_ocr_seeds DROP COLUMN n;
INSERT INTO bmem.seeds_resumen SELECT * from tmp_ocr_seeds ON CONFLICT ON CONSTRAINT uc_seeds_resumen DO NOTHING;
DROP TABLE IF EXISTS tmp_ocr_seeds;
CREATE TEMP TABLE tmp_ocr_seeds (n text, fecha_vto date, tipo_suc text, num_doc integer, imp_neto numeric, iva numeric, iva_perc numeric, fnee text, l_23_681 text, fl_m_sj text, monto_total numeric, detalle text, id integer);

COPY tmp_ocr_seeds 
FROM 'C:\Users\Administrador\Desktop\bmem\Seeds AM - BD para importar - no tocar\import\13.csv'
DELIMITER ';' NULL AS 'nan'
CSV HEADER ;
ALTER TABLE tmp_ocr_seeds DROP COLUMN n;
INSERT INTO bmem.seeds_resumen SELECT * from tmp_ocr_seeds ON CONFLICT ON CONSTRAINT uc_seeds_resumen DO NOTHING;
DROP TABLE IF EXISTS tmp_ocr_seeds;
CREATE TEMP TABLE tmp_ocr_seeds (n text, fecha_vto date, tipo_suc text, num_doc integer, imp_neto numeric, iva numeric, iva_perc numeric, fnee text, l_23_681 text, fl_m_sj text, monto_total numeric, detalle text, id integer);

COPY tmp_ocr_seeds 
FROM 'C:\Users\Administrador\Desktop\bmem\Seeds AM - BD para importar - no tocar\import\14.csv'
DELIMITER ';' NULL AS 'nan'
CSV HEADER ;
ALTER TABLE tmp_ocr_seeds DROP COLUMN n;
INSERT INTO bmem.seeds_resumen SELECT * from tmp_ocr_seeds ON CONFLICT ON CONSTRAINT uc_seeds_resumen DO NOTHING;
DROP TABLE IF EXISTS tmp_ocr_seeds;
CREATE TEMP TABLE tmp_ocr_seeds (n text, fecha_vto date, tipo_suc text, num_doc integer, imp_neto numeric, iva numeric, iva_perc numeric, fnee text, l_23_681 text, fl_m_sj text, monto_total numeric, detalle text, id integer);

COPY tmp_ocr_seeds 
FROM 'C:\Users\Administrador\Desktop\bmem\Seeds AM - BD para importar - no tocar\import\15.csv'
DELIMITER ';' NULL AS 'nan'
CSV HEADER ;
ALTER TABLE tmp_ocr_seeds DROP COLUMN n;
INSERT INTO bmem.seeds_resumen SELECT * from tmp_ocr_seeds ON CONFLICT ON CONSTRAINT uc_seeds_resumen DO NOTHING;

DROP TABLE IF EXISTS tmp_ocr_seeds;
CREATE TEMP TABLE tmp_ocr_seeds (n text, fecha_vto date, tipo_suc text, num_doc integer, imp_neto numeric, iva numeric, iva_perc numeric, fnee text, l_23_681 text, fl_m_sj text, monto_total numeric, detalle text, id integer);

COPY tmp_ocr_seeds 
FROM 'C:\Users\Administrador\Desktop\bmem\Seeds AM - BD para importar - no tocar\import\16.csv'
DELIMITER ';' NULL AS 'nan'
CSV HEADER ;
ALTER TABLE tmp_ocr_seeds DROP COLUMN n;
INSERT INTO bmem.seeds_resumen SELECT * from tmp_ocr_seeds ON CONFLICT ON CONSTRAINT uc_seeds_resumen DO NOTHING;
DROP TABLE IF EXISTS tmp_ocr_seeds;
CREATE TEMP TABLE tmp_ocr_seeds (n text, fecha_vto date, tipo_suc text, num_doc integer, imp_neto numeric, iva numeric, iva_perc numeric, fnee text, l_23_681 text, fl_m_sj text, monto_total numeric, detalle text, id integer);

COPY tmp_ocr_seeds 
FROM 'C:\Users\Administrador\Desktop\bmem\Seeds AM - BD para importar - no tocar\import\17.csv'
DELIMITER ';' NULL AS 'nan'
CSV HEADER ;
ALTER TABLE tmp_ocr_seeds DROP COLUMN n;
INSERT INTO bmem.seeds_resumen SELECT * from tmp_ocr_seeds ON CONFLICT ON CONSTRAINT uc_seeds_resumen DO NOTHING;

DROP TABLE IF EXISTS tmp_ocr_seeds;
CREATE TEMP TABLE tmp_ocr_seeds (n text, fecha_vto date, tipo_suc text, num_doc integer, imp_neto numeric, iva numeric, iva_perc numeric, fnee text, l_23_681 text, fl_m_sj text, monto_total numeric, detalle text, id integer);

COPY tmp_ocr_seeds 
FROM 'C:\Users\Administrador\Desktop\bmem\Seeds AM - BD para importar - no tocar\import\18.csv'
DELIMITER ';' NULL AS 'nan'
CSV HEADER ;
ALTER TABLE tmp_ocr_seeds DROP COLUMN n;
INSERT INTO bmem.seeds_resumen SELECT * from tmp_ocr_seeds ON CONFLICT ON CONSTRAINT uc_seeds_resumen DO NOTHING;
DROP TABLE IF EXISTS tmp_ocr_seeds;
CREATE TEMP TABLE tmp_ocr_seeds (n text, fecha_vto date, tipo_suc text, num_doc integer, imp_neto numeric, iva numeric, iva_perc numeric, fnee text, l_23_681 text, fl_m_sj text, monto_total numeric, detalle text, id integer);

COPY tmp_ocr_seeds 
FROM 'C:\Users\Administrador\Desktop\bmem\Seeds AM - BD para importar - no tocar\import\19.csv'
DELIMITER ';' NULL AS 'nan'
CSV HEADER ;
ALTER TABLE tmp_ocr_seeds DROP COLUMN n;
INSERT INTO bmem.seeds_resumen SELECT * from tmp_ocr_seeds ON CONFLICT ON CONSTRAINT uc_seeds_resumen DO NOTHING;
DROP TABLE IF EXISTS tmp_ocr_seeds;
CREATE TEMP TABLE tmp_ocr_seeds (n text, fecha_vto date, tipo_suc text, num_doc integer, imp_neto numeric, iva numeric, iva_perc numeric, fnee text, l_23_681 text, fl_m_sj text, monto_total numeric, detalle text, id integer);

COPY tmp_ocr_seeds 
FROM 'C:\Users\Administrador\Desktop\bmem\Seeds AM - BD para importar - no tocar\import\20.csv'
DELIMITER ';' NULL AS 'nan'
CSV HEADER ;
ALTER TABLE tmp_ocr_seeds DROP COLUMN n;
INSERT INTO bmem.seeds_resumen SELECT * from tmp_ocr_seeds ON CONFLICT ON CONSTRAINT uc_seeds_resumen DO NOTHING;
DROP TABLE IF EXISTS tmp_ocr_seeds;
CREATE TEMP TABLE tmp_ocr_seeds (n text, fecha_vto date, tipo_suc text, num_doc integer, imp_neto numeric, iva numeric, iva_perc numeric, fnee text, l_23_681 text, fl_m_sj text, monto_total numeric, detalle text, id integer);

COPY tmp_ocr_seeds 
FROM 'C:\Users\Administrador\Desktop\bmem\Seeds AM - BD para importar - no tocar\import\21.csv'
DELIMITER ';' NULL AS 'nan'
CSV HEADER ;
ALTER TABLE tmp_ocr_seeds DROP COLUMN n;
INSERT INTO bmem.seeds_resumen SELECT * from tmp_ocr_seeds ON CONFLICT ON CONSTRAINT uc_seeds_resumen DO NOTHING;