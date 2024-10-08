DROP TABLE IF EXISTS tmp_ocr_helios;
CREATE TEMP TABLE tmp_ocr_helios (n text, cantidad numeric, n2 text, detalle text, importe numeric, ajuste_doc text, tipo_doc text, num_doc text, emision date, vencimiento date, agente text, periodo text,id integer);

COPY tmp_ocr_helios 
FROM 'C:\Users\Administrador\Desktop\bmem\Helios - BD para importar - no tocar\import\0.csv'
DELIMITER ';' NULL AS 'NaN'
CSV HEADER ;

ALTER TABLE tmp_ocr_helios add COLUMN periodo2 date;
UPDATE tmp_ocr_helios SET periodo2 = CONCAT('01/', periodo)::date;
ALTER TABLE tmp_ocr_helios DROP COLUMN n, DROP COLUMN n2, DROP COLUMN periodo;
UPDATE tmp_ocr_helios SET detalle = 'Remuneracion Base Energia No Convencionales' WHERE detalle like  'Remu%';
UPDATE tmp_ocr_helios SET detalle = 'Valorizacion Energia - Cargo Variable' WHERE detalle like  'Valo%';
INSERT INTO bmem.helios_detalle SELECT cantidad , detalle , importe , ajuste_doc , tipo_doc , num_doc , emision , vencimiento , agente , periodo2 , id  from tmp_ocr_helios ON CONFLICT DO NOTHING;
------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_ocr_helios;
CREATE TEMP TABLE tmp_ocr_helios (n text, cantidad numeric, n2 text, detalle text, importe numeric, ajuste_doc text, tipo_doc text, num_doc text, emision date, vencimiento date, agente text, periodo text,id integer);

COPY tmp_ocr_helios 
FROM 'C:\Users\Administrador\Desktop\bmem\Helios - BD para importar - no tocar\import\1.csv'
DELIMITER ';' NULL AS 'NaN'
CSV HEADER ;

ALTER TABLE tmp_ocr_helios add COLUMN periodo2 date;
UPDATE tmp_ocr_helios SET periodo2 = CONCAT('01/', periodo)::date;
ALTER TABLE tmp_ocr_helios DROP COLUMN n, DROP COLUMN n2, DROP COLUMN periodo;
UPDATE tmp_ocr_helios SET detalle = 'Remuneracion Base Energia No Convencionales' WHERE detalle like  'Remu%';
UPDATE tmp_ocr_helios SET detalle = 'Valorizacion Energia - Cargo Variable' WHERE detalle like  'Valo%';
INSERT INTO bmem.helios_detalle SELECT cantidad , detalle , importe , ajuste_doc , tipo_doc , num_doc , emision , vencimiento , agente , periodo2 , id  from tmp_ocr_helios ON CONFLICT DO NOTHING;
------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_ocr_helios;
CREATE TEMP TABLE tmp_ocr_helios (n text, cantidad numeric, n2 text, detalle text, importe numeric, ajuste_doc text, tipo_doc text, num_doc text, emision date, vencimiento date, agente text, periodo text,id integer);

COPY tmp_ocr_helios 
FROM 'C:\Users\Administrador\Desktop\bmem\Helios - BD para importar - no tocar\import\2.csv'
DELIMITER ';' NULL AS 'NaN'
CSV HEADER ;

ALTER TABLE tmp_ocr_helios add COLUMN periodo2 date;
UPDATE tmp_ocr_helios SET periodo2 = CONCAT('01/', periodo)::date;
ALTER TABLE tmp_ocr_helios DROP COLUMN n, DROP COLUMN n2, DROP COLUMN periodo;
UPDATE tmp_ocr_helios SET detalle = 'Remuneracion Base Energia No Convencionales' WHERE detalle like  'Remu%';
UPDATE tmp_ocr_helios SET detalle = 'Valorizacion Energia - Cargo Variable' WHERE detalle like  'Valo%';
INSERT INTO bmem.helios_detalle SELECT cantidad , detalle , importe , ajuste_doc , tipo_doc , num_doc , emision , vencimiento , agente , periodo2 , id  from tmp_ocr_helios ON CONFLICT DO NOTHING;
------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_ocr_helios;
CREATE TEMP TABLE tmp_ocr_helios (n text, cantidad numeric, n2 text, detalle text, importe numeric, ajuste_doc text, tipo_doc text, num_doc text, emision date, vencimiento date, agente text, periodo text,id integer);

COPY tmp_ocr_helios 
FROM 'C:\Users\Administrador\Desktop\bmem\Helios - BD para importar - no tocar\import\3.csv'
DELIMITER ';' NULL AS 'NaN'
CSV HEADER ;

ALTER TABLE tmp_ocr_helios add COLUMN periodo2 date;
UPDATE tmp_ocr_helios SET periodo2 = CONCAT('01/', periodo)::date;
ALTER TABLE tmp_ocr_helios DROP COLUMN n, DROP COLUMN n2, DROP COLUMN periodo;
UPDATE tmp_ocr_helios SET detalle = 'Remuneracion Base Energia No Convencionales' WHERE detalle like  'Remu%';
UPDATE tmp_ocr_helios SET detalle = 'Valorizacion Energia - Cargo Variable' WHERE detalle like  'Valo%';
INSERT INTO bmem.helios_detalle SELECT cantidad , detalle , importe , ajuste_doc , tipo_doc , num_doc , emision , vencimiento , agente , periodo2 , id  from tmp_ocr_helios ON CONFLICT DO NOTHING;
------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmp_ocr_helios;
CREATE TEMP TABLE tmp_ocr_helios (n text, cantidad numeric, n2 text, detalle text, importe numeric, ajuste_doc text, tipo_doc text, num_doc text, emision date, vencimiento date, agente text, periodo text,id integer);

COPY tmp_ocr_helios 
FROM 'C:\Users\Administrador\Desktop\bmem\Helios - BD para importar - no tocar\import\4.csv'
DELIMITER ';' NULL AS 'NaN'
CSV HEADER ;

ALTER TABLE tmp_ocr_helios add COLUMN periodo2 date;
UPDATE tmp_ocr_helios SET periodo2 = CONCAT('01/', periodo)::date;
ALTER TABLE tmp_ocr_helios DROP COLUMN n, DROP COLUMN n2, DROP COLUMN periodo;
UPDATE tmp_ocr_helios SET detalle = 'Remuneracion Base Energia No Convencionales' WHERE detalle like  'Remu%';
UPDATE tmp_ocr_helios SET detalle = 'Valorizacion Energia - Cargo Variable' WHERE detalle like  'Valo%';
INSERT INTO bmem.helios_detalle SELECT cantidad , detalle , importe , ajuste_doc , tipo_doc , num_doc , emision , vencimiento , agente , periodo2 , id  from tmp_ocr_helios ON CONFLICT DO NOTHING;
------------------------------------------------------------------------------------------------
