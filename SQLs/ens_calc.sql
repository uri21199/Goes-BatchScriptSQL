-- Actualiza la columna ref de la tabla caf_potencia a partir de una subconsulta en la misma tabla
UPDATE cafayate.caf_potencia set ref = reference_calc.max FROM (SELECT date,  (MAX(val)) FROM cafayate.caf_potencia where date > now() - interval '30 days' GROUP BY date) as reference_calc  WHERE reference_calc.date = caf_potencia.date ;
-- Actualiza la columna reg a 1 cuando la fecha sea mayor a 30 dias
UPDATE cafayate.caf_potencia set reg = 1 where date > now() - interval '30 days';
-- Elimina la tabla en caso de que exista y la crea
DROP TABLE IF EXISTS cafayate.ens_calc;
CREATE TABLE cafayate.ens_calc (date timestamp, val_sum numeric, id text, ref_sum numeric, reg integer);
-- Crea un indice en las columnas date y la columna id
CREATE UNIQUE INDEX IF NOT EXISTS idx_ens_calc
    ON cafayate.ens_calc USING btree
    (date , id )
    TABLESPACE pg_default;
-- Ingresa datos en la tabla a partir de nuevamente una subconsulta para la tabla caf_potencia
INSERT INTO cafayate.ens_calc SELECT date_trunc('day', date) as date1, sum(val) as val, id, sum(ref) as reference, sum(reg) FROM cafayate.caf_potencia where date > now() - interval '14 years' GROUP BY date1, id ON CONFLICT DO NOTHING;
-- Actualiza campos
update cafayate.ens_calc set val_sum = null where reg < 250;
update cafayate.ens_calc set ref_sum = null where reg < 250;
-- Agrega columnas
ALTER TABLE cafayate.ens_calc ADD COLUMN val_sum_energy numeric;
ALTER TABLE cafayate.ens_calc ADD COLUMN ref_sum_energy numeric;
-- Actualiza campos 
UPDATE cafayate.ens_calc SET val_sum_energy = val_sum * 0.08333333;
UPDATE cafayate.ens_calc SET ref_sum_energy = ref_sum * 0.08333333;
-- Elimina la tabla en caso de que exista y crea una nueva
drop table if exists cafayate.ens_calc_total;
CREATE TABLE cafayate.ens_calc_total (date timestamp, smec numeric, val_sum numeric, medidores_offline integer, energia_offline numeric, energia_offline_por_medidor numeric);
-- Ingresa datos a aprtir de una subconsulta
INSERT INTO cafayate.ens_calc_total select date_trunc('day', date) as date1, sum(exportada_cammesa) as exportada_cammesa from smec.consolidador_Caf where exportada_cammesa is not null group by date1;
UPDATE cafayate.ens_calc_total set val_sum = a.s from (select date_trunc('day', date) as date1, (sum(val_sum) * 0.08333333)/1000 as s from cafayate.ens_calc group by date1) as a where a.date1 = ens_calc_total.date;
-- Actualiza datos
UPDATE cafayate.ens_calc_total set energia_offline = smec - val_sum;
UPDATE cafayate.ens_calc_total set medidores_offline = a.s FROM (select date, count(id) as s from cafayate.ens_calc group by date ) as a  where a.date = ens_calc_total.date;
UPDATE cafayate.ens_calc_total set medidores_offline = 26 - medidores_offline;
UPDATE cafayate.ens_calc_total set energia_offline_por_medidor = energia_offline / NULLIF(medidores_offline, 0);
-- Ingresa datos a partir de una subconsulta
INSERT into cafayate.ens_calc(date, val_sum_energy, id) select * from ((select date, energia_offline_por_medidor * 1000 from cafayate.ens_calc_total) as a CROSS JOIN (select distinct id from cafayate.caf_potencia) as b) ON CONFLICT DO NOTHING;
-- Actualiza datos
update cafayate.ens_calc set ref_sum_energy = a.s from ( select date, ref_sum_energy as s from cafayate.ens_calc where ref_sum_energy is not null group by date, ref_sum_energy) as a where a.date = ens_calc.date;