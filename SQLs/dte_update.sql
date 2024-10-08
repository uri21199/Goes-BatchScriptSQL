-- Elimina la tabla si ya existe
DROP TABLE IF EXISTS tmp_reporte_import;
-- Crea una tabla temporal
CREATE TEMP TABLE tmp_reporte_import (date timestamptz, nemo text, rol text, doc text, ord integer, descripcion text, abreviatura text, cantidad numeric, importe numeric); 
-- Copia datos en la tabla trayendo desde la URL detallada
COPY tmp_reporte_import (nemo, rol, doc, ord, descripcion, abreviatura, cantidad, importe)
FROM 'C:\Users\Administrador\Desktop\DTE update\reporte0.csv'
DELIMITER ',' NULL AS '';
-- Copia datos en la tabla trayendo desde la URL detallada
COPY tmp_reporte_import ("date")
FROM 'C:\Users\Administrador\Desktop\DTE update\fecha0.csv'
DELIMITER ',';
-- Actualiza la fecha desde una subconsulta de la tabla anterior
UPDATE tmp_reporte_import SET date = datefix.date FROM (SELECT date FROM tmp_reporte_import WHERE nemo IS NULL) as datefix;
-- Elimina los datos cuando la columna nemo sea nula
DELETE FROM tmp_reporte_import WHERE nemo IS NULL;
-- Inserta datos en el SMEC con una subconsulta a la tabla utilizada
INSERT INTO smec.reporte_dte SELECT date, nemo, rol, doc, ord, descripcion, abreviatura, cantidad, importe FROM tmp_reporte_import ON CONFLICT DO NOTHING;

-- Elimina la tabla si ya existe
DROP TABLE IF EXISTS tmp_licit_import;
-- Crea una tabla temporal
CREATE TEMP TABLE tmp_licit_import (date timestamptz ,agente text,energia_abastecida NUMERIC,precio_adjudicado NUMERIC,precio_anual NUMERIC,precio_contrato NUMERIC,remuneracion NUMERIC,energia_deficiencia NUMERIC,multa_deficiencia NUMERIC,anio numeric,mes numeric,energia_producida NUMERIC,energia_acreditada NUMERIC,energia_ajustada NUMERIC,energia_comprometida NUMERIC,energia_minima NUMERIC,energia_anio_recupero NUMERIC,deficiencia_menor NUMERIC,deficiencia_mayor NUMERIC); 
-- Copia datos en la tabla trayendo desde la URL detallada
COPY tmp_licit_import (agente ,energia_abastecida ,precio_adjudicado ,precio_anual ,precio_contrato ,remuneracion ,energia_deficiencia ,multa_deficiencia ,anio ,mes ,energia_producida ,energia_acreditada ,energia_ajustada ,energia_comprometida ,energia_minima ,energia_anio_recupero ,deficiencia_menor ,deficiencia_mayor )
FROM 'C:\Users\Administrador\Desktop\DTE update\licit0.csv'
DELIMITER ',' NULL AS '';
-- Copia datos en la tabla trayendo desde la URL detallada
COPY tmp_licit_import ("date")
FROM 'C:\Users\Administrador\Desktop\DTE update\fecha0.csv'
DELIMITER ',';
-- Actualiza la fecha desde una subconsulta de la tabla anterior
UPDATE tmp_licit_import SET date = datefix.date FROM (SELECT date FROM tmp_licit_import WHERE agente IS NULL) as datefix;
-- Elimina los datos cuando la columna agente sea nula
DELETE FROM tmp_licit_import WHERE agente IS NULL;
-- Inserta datos en el SMEC con una subconsulta a la tabla utilizada
INSERT INTO smec.licit_ren_dte SELECT date, agente ,energia_abastecida ,precio_adjudicado ,precio_anual ,precio_contrato ,remuneracion ,energia_deficiencia ,multa_deficiencia ,anio ,mes ,energia_producida ,energia_acreditada ,energia_ajustada ,energia_comprometida ,energia_minima ,energia_anio_recupero ,deficiencia_menor ,deficiencia_mayor FROM tmp_licit_import ON CONFLICT DO NOTHING;

-- Elimina la tabla si ya existe
DROP TABLE IF EXISTS tmp_matrenov;
-- Crea una tabla temporal
CREATE TEMP TABLE tmp_matrenov (date timestamp, agente_gen text, conjunto text, agente_dem text, agente_com text, energia_cont numeric, importe numeric); 
-- Copia datos en la tabla trayendo desde la URL detallada
COPY tmp_matrenov (agente_gen , conjunto , agente_dem , agente_com , energia_cont , importe)
FROM 'C:\Users\Administrador\Desktop\DTE update\matr0.csv'
DELIMITER ',' NULL AS '';
-- Copia datos en la tabla trayendo desde la URL detallada
COPY tmp_matrenov ("date")
FROM 'C:\Users\Administrador\Desktop\DTE update\fecha0.csv'
DELIMITER ',';
-- Actualiza la fecha desde una subconsulta de la tabla anterior
UPDATE tmp_matrenov SET date = datefix.date FROM (SELECT date FROM tmp_matrenov WHERE agente_gen IS NULL) as datefix;
-- Elimina los datos cuando la columna agente_gen sea nula
DELETE FROM tmp_matrenov WHERE agente_gen IS NULL;
-- Inserta datos en el SMEC con una subconsulta a la tabla utilizada
INSERT INTO smec.matrenov SELECT date, agente_gen , conjunto , agente_dem , agente_com , energia_cont , importe FROM tmp_matrenov ON CONFLICT DO NOTHING;