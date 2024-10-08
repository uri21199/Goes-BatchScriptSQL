DO $$
DECLARE
    i int;
BEGIN
    -- Insertar en smec.dolar_habil para los primeros 5 días al final del mes
    FOR i IN 1..5 LOOP
        INSERT INTO smec.dolar_habil 
        SELECT venta, fecha::date as cierre, DATE_TRUNC('month', fecha)::date periodo2 
        FROM smec.dolar 
        WHERE fecha = (date_trunc('month', fecha) + interval '1 month - ' || i || ' day')
        ON CONFLICT ON CONSTRAINT uc_dolar_habil DO NOTHING;
    END LOOP;

    -- Insertar en smec.dolar_habil_12 para los días del 7 al 11 del mes
    FOR i IN 7..11 LOOP
        INSERT INTO smec.dolar_habil_12 
        SELECT venta, fecha::date as cierre, DATE_TRUNC('month', fecha)::date periodo2 
        FROM smec.dolar 
        WHERE fecha = (date_trunc('month', fecha) + interval i || ' days')
        ON CONFLICT ON CONSTRAINT uc_dolar_habil_12 DO NOTHING;
    END LOOP;
END $$;
