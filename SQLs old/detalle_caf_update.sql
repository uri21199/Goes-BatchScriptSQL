DROP TABLE IF EXISTS tmp_ocr_caf;
CREATE TEMP TABLE tmp_ocr_caf (n text, cantidad numeric, n2 text, detalle text, importe numeric, ajuste_doc text, tipo_doc text, num_doc text, emision date, vencimiento date, agente text, periodo text,id integer);

COPY tmp_ocr_caf 
FROM 'C:\Users\Administrador\Desktop\bmem\PS Cafayate - BD para importar - no tocar\import\0.csv'
DELIMITER ';' NULL AS 'NaN'
CSV HEADER ;

ALTER TABLE tmp_ocr_caf add COLUMN periodo2 date;
UPDATE tmp_ocr_caf SET periodo2 = CONCAT('01/', periodo)::date;
ALTER TABLE tmp_ocr_caf DROP COLUMN n, DROP COLUMN n2, DROP COLUMN periodo;
UPDATE tmp_ocr_caf SET detalle = 'Remuneracion Base Energia No Convencionales' WHERE detalle like  'Remu%';
UPDATE tmp_ocr_caf SET detalle = 'Valorizacion Energia - Cargo Variable' WHERE detalle like  'Valo%';
INSERT INTO bmem.cafayate_detalle SELECT cantidad , detalle , importe , ajuste_doc , tipo_doc , num_doc , emision , vencimiento , agente , periodo2 , id  from tmp_ocr_caf ON CONFLICT DO NOTHING;
----------------------------------------------
DROP TABLE IF EXISTS tmp_ocr_caf;
CREATE TEMP TABLE tmp_ocr_caf (n text, cantidad numeric, n2 text, detalle text, importe numeric, ajuste_doc text, tipo_doc text, num_doc text, emision date, vencimiento date, agente text, periodo text,id integer);

COPY tmp_ocr_caf 
FROM 'C:\Users\Administrador\Desktop\bmem\PS Cafayate - BD para importar - no tocar\import\1.csv'
DELIMITER ';' NULL AS 'NaN'
CSV HEADER ;

ALTER TABLE tmp_ocr_caf add COLUMN periodo2 date;
UPDATE tmp_ocr_caf SET periodo2 = CONCAT('01/', periodo)::date;
ALTER TABLE tmp_ocr_caf DROP COLUMN n, DROP COLUMN n2, DROP COLUMN periodo;
UPDATE tmp_ocr_caf SET detalle = 'Remuneracion Base Energia No Convencionales' WHERE detalle like  'Remu%';
UPDATE tmp_ocr_caf SET detalle = 'Valorizacion Energia - Cargo Variable' WHERE detalle like  'Valo%';
INSERT INTO bmem.cafayate_detalle SELECT cantidad , detalle , importe , ajuste_doc , tipo_doc , num_doc , emision , vencimiento , agente , periodo2 , id  from tmp_ocr_caf ON CONFLICT DO NOTHING;
----------------------------------------------
DROP TABLE IF EXISTS tmp_ocr_caf;
CREATE TEMP TABLE tmp_ocr_caf (n text, cantidad numeric, n2 text, detalle text, importe numeric, ajuste_doc text, tipo_doc text, num_doc text, emision date, vencimiento date, agente text, periodo text,id integer);

COPY tmp_ocr_caf 
FROM 'C:\Users\Administrador\Desktop\bmem\PS Cafayate - BD para importar - no tocar\import\2.csv'
DELIMITER ';' NULL AS 'NaN'
CSV HEADER ;

ALTER TABLE tmp_ocr_caf add COLUMN periodo2 date;
UPDATE tmp_ocr_caf SET periodo2 = CONCAT('01/', periodo)::date;
ALTER TABLE tmp_ocr_caf DROP COLUMN n, DROP COLUMN n2, DROP COLUMN periodo;
UPDATE tmp_ocr_caf SET detalle = 'Remuneracion Base Energia No Convencionales' WHERE detalle like  'Remu%';
UPDATE tmp_ocr_caf SET detalle = 'Valorizacion Energia - Cargo Variable' WHERE detalle like  'Valo%';
INSERT INTO bmem.cafayate_detalle SELECT cantidad , detalle , importe , ajuste_doc , tipo_doc , num_doc , emision , vencimiento , agente , periodo2 , id  from tmp_ocr_caf ON CONFLICT DO NOTHING;
----------------------------------------------
DROP TABLE IF EXISTS tmp_ocr_caf;
CREATE TEMP TABLE tmp_ocr_caf (n text, cantidad numeric, n2 text, detalle text, importe numeric, ajuste_doc text, tipo_doc text, num_doc text, emision date, vencimiento date, agente text, periodo text,id integer);

COPY tmp_ocr_caf 
FROM 'C:\Users\Administrador\Desktop\bmem\PS Cafayate - BD para importar - no tocar\import\3.csv'
DELIMITER ';' NULL AS 'NaN'
CSV HEADER ;

ALTER TABLE tmp_ocr_caf add COLUMN periodo2 date;
UPDATE tmp_ocr_caf SET periodo2 = CONCAT('01/', periodo)::date;
ALTER TABLE tmp_ocr_caf DROP COLUMN n, DROP COLUMN n2, DROP COLUMN periodo;
UPDATE tmp_ocr_caf SET detalle = 'Remuneracion Base Energia No Convencionales' WHERE detalle like  'Remu%';
UPDATE tmp_ocr_caf SET detalle = 'Valorizacion Energia - Cargo Variable' WHERE detalle like  'Valo%';
INSERT INTO bmem.cafayate_detalle SELECT cantidad , detalle , importe , ajuste_doc , tipo_doc , num_doc , emision , vencimiento , agente , periodo2 , id  from tmp_ocr_caf ON CONFLICT DO NOTHING;
----------------------------------------------
DROP TABLE IF EXISTS tmp_ocr_caf;
CREATE TEMP TABLE tmp_ocr_caf (n text, cantidad numeric, n2 text, detalle text, importe numeric, ajuste_doc text, tipo_doc text, num_doc text, emision date, vencimiento date, agente text, periodo text,id integer);

COPY tmp_ocr_caf 
FROM 'C:\Users\Administrador\Desktop\bmem\PS Cafayate - BD para importar - no tocar\import\4.csv'
DELIMITER ';' NULL AS 'NaN'
CSV HEADER ;

ALTER TABLE tmp_ocr_caf add COLUMN periodo2 date;
UPDATE tmp_ocr_caf SET periodo2 = CONCAT('01/', periodo)::date;
ALTER TABLE tmp_ocr_caf DROP COLUMN n, DROP COLUMN n2, DROP COLUMN periodo;
UPDATE tmp_ocr_caf SET detalle = 'Remuneracion Base Energia No Convencionales' WHERE detalle like  'Remu%';
UPDATE tmp_ocr_caf SET detalle = 'Valorizacion Energia - Cargo Variable' WHERE detalle like  'Valo%';
INSERT INTO bmem.cafayate_detalle SELECT cantidad , detalle , importe , ajuste_doc , tipo_doc , num_doc , emision , vencimiento , agente , periodo2 , id  from tmp_ocr_caf ON CONFLICT DO NOTHING;
----------------------------------------------
