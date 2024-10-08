DROP TABLE IF EXISTS tmp_reporte_import;
CREATE TEMP TABLE tmp_reporte_import (date timestamptz, nemo text, rol text, doc text, ord integer, descripcion text, abreviatura text, cantidad numeric, importe numeric); 

COPY tmp_reporte_import (nemo,
rol,
doc,
ord, 
descripcion, 
abreviatura, 
cantidad, 
importe)
FROM 'C:\Users\Administrador\Desktop\DTE update\reporte0.csv'
DELIMITER ',' NULL AS '';

COPY tmp_reporte_import ("date")
FROM 'C:\Users\Administrador\Desktop\DTE update\fecha0.csv'
DELIMITER ',';

UPDATE tmp_reporte_import SET date = datefix.date FROM (SELECT date FROM tmp_reporte_import WHERE nemo IS NULL) as datefix;
DELETE FROM tmp_reporte_import WHERE nemo IS NULL;
INSERT INTO smec.reporte_dte SELECT date, nemo, rol, doc, ord, descripcion, abreviatura, cantidad, importe FROM tmp_reporte_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_licit_import;
CREATE TEMP TABLE tmp_licit_import (date timestamptz ,agente text,energia_abastecida NUMERIC,precio_adjudicado NUMERIC,precio_anual NUMERIC,precio_contrato NUMERIC,remuneracion NUMERIC,energia_deficiencia NUMERIC,multa_deficiencia NUMERIC,anio numeric,mes numeric,energia_producida NUMERIC,energia_acreditada NUMERIC,energia_ajustada NUMERIC,energia_comprometida NUMERIC,energia_minima NUMERIC,energia_anio_recupero NUMERIC,deficiencia_menor NUMERIC,deficiencia_mayor NUMERIC); 

COPY tmp_licit_import (agente ,energia_abastecida ,precio_adjudicado ,precio_anual ,precio_contrato ,remuneracion ,energia_deficiencia ,multa_deficiencia ,anio ,mes ,energia_producida ,energia_acreditada ,energia_ajustada ,energia_comprometida ,energia_minima ,energia_anio_recupero ,deficiencia_menor ,deficiencia_mayor )
FROM 'C:\Users\Administrador\Desktop\DTE update\licit0.csv'
DELIMITER ',' NULL AS '';

COPY tmp_licit_import ("date")
FROM 'C:\Users\Administrador\Desktop\DTE update\fecha0.csv'
DELIMITER ',';

UPDATE tmp_licit_import SET date = datefix.date FROM (SELECT date FROM tmp_licit_import WHERE agente IS NULL) as datefix;
DELETE FROM tmp_licit_import WHERE agente IS NULL;
INSERT INTO smec.licit_ren_dte SELECT date, agente ,energia_abastecida ,precio_adjudicado ,precio_anual ,precio_contrato ,remuneracion ,energia_deficiencia ,multa_deficiencia ,anio ,mes ,energia_producida ,energia_acreditada ,energia_ajustada ,energia_comprometida ,energia_minima ,energia_anio_recupero ,deficiencia_menor ,deficiencia_mayor FROM tmp_licit_import ON CONFLICT DO NOTHING;
