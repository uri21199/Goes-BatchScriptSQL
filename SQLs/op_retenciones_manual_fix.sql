-- Elimina la tabla en caso de que exista y crea una temporal
DROP TABLE IF EXISTS temp_op_fix;
CREATE TEMP TABLE temp_op_fix as select * from bmem.op_retenciones limit 0;
-- Carga datos en la tabla copiados del CSV de la URL dada
COPY temp_op_fix
FROM 'C:\Users\Administrador\Desktop\import\op_helios_fix.csv' header DELIMITER ',' NULL AS '';
-- Ingresa datos
insert into bmem.op_retenciones select * from temp_op_fix on conflict do nothing;