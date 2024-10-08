-- Crear una tabla temporal para almacenar los detalles de las URLs e IDs
CREATE TEMP TABLE full_db_sources (delete1, delete2, table1, table2, url, id, table3);

-- Insertar los detalles de las solicitudes en la tabla
INSERT INTO full_db_sources (delete1, delete2, table1, table2, url, id, table3)
VALUES
("hiCAU1", "iiCAU1_", "staget","staget2", "https://portal.unity.inaccess.com/ifms/sources/5a5d6d6a-07f9-11eb-aeeb-42010afa015a/events", "hiCAU1_WS_A07_", "hiCAU1"),
("hiCAU1", "iiCAU1_", "staget","staget2", "https://portal.unity.inaccess.com/ifms/sources/5a9dd60c-07f9-11eb-aeeb-42010afa015a/events", "hiCAU1_WS_A19", "hiCAU1"),
("hiCAU1", "iiCAU1_", "staget","staget2", "https://portal.unity.inaccess.com/ifms/sources/5adea056-07f9-11eb-aeeb-42010afa015a/events", "hiCAU1_WS_A29", "hiCAU1"),
("hiCAU1", "iiCAU1_", "staget","staget2", "https://portal.unity.inaccess.com/ifms/sources/59547e54-07f9-11eb-aeeb-42010afa015a/events", "iiCAU1_WS_A07_1", "iiCAU1_"),
("hiCAU1", "iiCAU1_", "staget","staget2", "https://portal.unity.inaccess.com/ifms/sources/594fc486-07f9-11eb-aeeb-42010afa015a/events", "iiCAU1_WS_A07_2", "iiCAU1_"),
("hiCAU1", "iiCAU1_", "staget","staget2", "https://portal.unity.inaccess.com/ifms/sources/599868d0-07f9-11eb-aeeb-42010afa015a/events", "iiCAU1_WS_A19_1", "iiCAU1_"),
("hiCAU1", "iiCAU1_", "staget","staget2", "https://portal.unity.inaccess.com/ifms/sources/59907dd2-07f9-11eb-aeeb-42010afa015a/events", "iiCAU1_WS_A19_2", "iiCAU1_"),
("hiCAU1", "iiCAU1_", "staget","staget2", "https://portal.unity.inaccess.com/ifms/sources/59ded036-07f9-11eb-aeeb-42010afa015a/events", "iiCAU1_WS_A29_1", "iiCAU1_"),
("hiCAU1", "iiCAU1_", "staget","staget2", "https://portal.unity.inaccess.com/ifms/sources/59d990bc-07f9-11eb-aeeb-42010afa015a/events", "iiCAU1_WS_A29_2", "iiCAU1_"),
("hiCAU2", "iiCAU2_", "stageb","stageb2", "https://portal.unity.inaccess.com/ifms/sources/bdab1500-07ec-11eb-8a43-42010afa015a/events", "hiCAU2_WS_B08", "hiCAU2"),
("hiCAU2", "iiCAU2_", "stageb","stageb2", "https://portal.unity.inaccess.com/ifms/sources/bdea50c6-07ec-11eb-8a43-42010afa015a/events", "hiCAU2_WS_B30", "hiCAU2"),
("hiCAU2", "iiCAU2_", "stageb","stageb2", "https://portal.unity.inaccess.com/ifms/sources/be29dc0a-07ec-11eb-8a43-42010afa015a/events", "hiCAU2_WS_B35", "hiCAU2"),
("hiCAU2", "iiCAU2_", "stageb","stageb2", "https://portal.unity.inaccess.com/ifms/sources/bcbad996-07ec-11eb-8a43-42010afa015a/events", "iiCAU2_WS_B08_1", "iiCAU2_"),
("hiCAU2", "iiCAU2_", "stageb","stageb2", "https://portal.unity.inaccess.com/ifms/sources/bcb5f80e-07ec-11eb-8a43-42010afa015a/events", "iiCAU2_WS_B08_2", "iiCAU2_"),
("hiCAU2", "iiCAU2_", "stageb","stageb2", "https://portal.unity.inaccess.com/ifms/sources/bcf43eca-07ec-11eb-8a43-42010afa015a/events", "iiCAU2_WS_B30_1", "iiCAU2_"),
("hiCAU2", "iiCAU2_", "stageb","stageb2", "https://portal.unity.inaccess.com/ifms/sources/bcef9b2c-07ec-11eb-8a43-42010afa015a/events", "iiCAU2_WS_B30_2", "iiCAU2_"),
("hiCAU2", "iiCAU2_", "stageb","stageb2", "https://portal.unity.inaccess.com/ifms/sources/bd2e1ee2-07ec-11eb-8a43-42010afa015a/events", "iiCAU2_WS_B35_1", "iiCAU2_"),
("hiCAU2", "iiCAU2_", "stageb","stageb2", "https://portal.unity.inaccess.com/ifms/sources/bd2936ca-07ec-11eb-8a43-42010afa015a/events", "iiCAU2_WS_B35_2", "iiCAU2_"),
("hiCAU3", "iiCAU3_", "stagec","stagec2", "https://portal.unity.inaccess.com/ifms/sources/12e18dd8-07ed-11eb-8564-42010afa015a/events", "hiCAU3_WS_C08", "hiCAU3"),
("hiCAU3", "iiCAU3_", "stagec","stagec2", "https://portal.unity.inaccess.com/ifms/sources/132016fc-07ed-11eb-8564-42010afa015a/events", "hiCAU3_WS_C11", "hiCAU3"),
("hiCAU3", "iiCAU3_", "stagec","stagec2", "https://portal.unity.inaccess.com/ifms/sources/135dca4c-07ed-11eb-8564-42010afa015a/events", "hiCAU3_WS_C29", "hiCAU3"),
("hiCAU3", "iiCAU3_", "stagec","stagec2", "https://portal.unity.inaccess.com/ifms/sources/11ecfa70-07ed-11eb-8564-42010afa015a/events", "iiCAU3_WS_C08_1", "iiCAU3_"),
("hiCAU3", "iiCAU3_", "stagec","stagec2", "https://portal.unity.inaccess.com/ifms/sources/11e80718-07ed-11eb-8564-42010afa015a/events", "iiCAU3_WS_C08_2", "iiCAU3_"),
("hiCAU3", "iiCAU3_", "stagec","stagec2", "https://portal.unity.inaccess.com/ifms/sources/12261f8a-07ed-11eb-8564-42010afa015a/events", "iiCAU3_WS_C11_1", "iiCAU3_"),
("hiCAU3", "iiCAU3_", "stagec","stagec2", "https://portal.unity.inaccess.com/ifms/sources/12217976-07ed-11eb-8564-42010afa015a/events", "iiCAU3_WS_C11_2", "iiCAU3_"),
("hiCAU3", "iiCAU3_", "stagec","stagec2", "https://portal.unity.inaccess.com/ifms/sources/125ee3d8-07ed-11eb-8564-42010afa015a/events", "iiCAU3_WS_C29_1", "iiCAU3_"),
("hiCAU3", "iiCAU3_", "stagec","stagec2", "https://portal.unity.inaccess.com/ifms/sources/125ad5ea-07ed-11eb-8564-42010afa015a/events", "iiCAU3_WS_C29_2", "iiCAU3_");

DO $$ 
DECLARE
    startdate text := to_char(current_date - 2, 'YYYYMMDD');
BEGIN
    FOR rec IN SELECT * FROM full_db_sources LOOP
        -- Eliminar los registros antiguos de la tabla objetivo
        DELETE FROM rec.delete1 WHERE date >= now() - interval '15 days';
        DELETE FROM rec.delete2 WHERE date >= now() - interval '15 days';
        -- Crear tablas temporales
        DROP TABLE IF EXISTS rec.table1;
        DROP TABLE IF EXISTS rec.table2;
        CREATE TEMP TABLE rec.table1(x jsonb);
        CREATE TEMP TABLE rec.table2(date timestamptz, val numeric, id text);

        -- Descargar y copiar los datos usando curl
        EXECUTE format(
            'COPY %s FROM PROGRAM ''curl -H "Api-Key:38deaa51-8716-4cc9-aa42-ab14fb72a752.01" "%s?&start_date=%sT000000Z"''',
            rec.table1, rec.url, startdate
        );

        -- Insertar los datos en la tabla temporal
        INSERT INTO rec.table2 
        SELECT f.* 
        FROM rec.table1, jsonb_populate_recordset(null::rec.table2, x) f;

        -- Actualizar los valores de ID, cau y truncar la fecha a minutos
        UPDATE rec.table2 
        SET id = rec.id,  
        date = DATE_TRUNC('minute', date);

        -- Insertar los datos finales en la tabla objetivo
        INSERT INTO rec.table3
        SELECT * 
        FROM rec.table2 
        WHERE date >= now() - interval '15 days';
    END LOOP;
END $$;

-- Limpiar la tabla temporal de fuentes
DROP TABLE full_db_sources2;

-- Crear una tabla temporal para almacenar los detalles de las URLs e IDs
CREATE TEMP TABLE full_db_sources2 (table1, table2, url, col1);

-- Insertar los detalles de las solicitudes en la tabla
INSERT INTO full_db_sources2 (table1, table2, url, col1)
VALUES
("powercau3", "stagey", "https://portal.unity.inaccess.com/ifms/sources/1851c03a-07ed-11eb-8564-42010afa015a/events","powercau3"),
("eecau1", "stagey", "https://portal.unity.inaccess.com/ifms/sources/c62ae0c8-0816-11eb-aeeb-42010afa015a/events","eecau1val"),
("eecau2", "stagey", "https://portal.unity.inaccess.com/ifms/sources/676a0fc6-0809-11eb-8a43-42010afa015a/events","eecau2val"),
("eecau3", "stagey", "https://portal.unity.inaccess.com/ifms/sources/8acddc7c-0809-11eb-8564-42010afa015a/events","eecau3val"),
("availcau1", "stagey", "https://portal.unity.inaccess.com/ifms/sources/9dbe91f7-1dfe-4b1a-bc5e-c70fea655af4/events","availcau1"),
("availcau2", "stagey", "https://portal.unity.inaccess.com/ifms/sources/691e6d91-3f18-490e-80fd-45680a5a61d4/events","availcau2"),
("availcau3", "stagey", "https://portal.unity.inaccess.com/ifms/sources/b82ea7ce-7f07-476b-9153-b84c690f3fbf/events","availcau3"),
("poicau1", "stagey", "https://portal.unity.inaccess.com/ifms/sources/c62977d8-0816-11eb-aeeb-42010afa015a/events","poicau1"),
("poicau2", "stagey", "https://portal.unity.inaccess.com/ifms/sources/67685e10-0809-11eb-8a43-42010afa015a/events","poicau2"),
("poicau3", "stagey", "https://portal.unity.inaccess.com/ifms/sources/8acca398-0809-11eb-8564-42010afa015a/events","poicau3"),
("powercau1", "stagey", "https://portal.unity.inaccess.com/ifms/sources/5fea3ca4-07f9-11eb-aeeb-42010afa015a/events","powercau1"),
("powercau2", "stagey", "https://portal.unity.inaccess.com/ifms/sources/c320449c-07ec-11eb-8a43-42010afa015a/events","powercau2"),
("lvcau1", "stagex", "https://portal.unity.inaccess.com/ifms/sources/607234a6-07f9-11eb-aeeb-42010afa015a/events","lvcau1"),
("lvcau2", "stagex", "https://portal.unity.inaccess.com/ifms/sources/c3bb19d6-07ec-11eb-8a43-42010afa015a/events","lvcau2"),
("lvcau3", "stagex", "https://portal.unity.inaccess.com/ifms/sources/18e60db2-07ed-11eb-8564-42010afa015a/events","lvcau3"),
("freccau1", "stagex", "https://portal.unity.inaccess.com/ifms/sources/7fb8f65c-29bd-11eb-a0f9-42010afa015a/events","freccau1"),
("freccau2", "stagex", "https://portal.unity.inaccess.com/ifms/sources/142c54ac-298f-11eb-9edf-42010afa015a/events","freccau2"),
("freccau3", "stagex", "https://portal.unity.inaccess.com/ifms/sources/67593d54-28ed-11eb-b18a-42010afa015a/events","freccau3"),
("rpcau1", "stagex", "https://portal.unity.inaccess.com/ifms/sources/608f4776-07f9-11eb-aeeb-42010afa015a/events","rpcau1"),
("rpcau2", "stagex", "https://portal.unity.inaccess.com/ifms/sources/c3d79778-07ec-11eb-8a43-42010afa015a/events","rpcau2"),
("rpcau3", "stagex", "https://portal.unity.inaccess.com/ifms/sources/19024cac-07ed-11eb-8564-42010afa015a/events","rpcau3");

DO $$ 
DECLARE
    startdate text := to_char(current_date - 2, 'YYYYMMDD');
BEGIN
    FOR rec IN SELECT * FROM full_db_sources2 LOOP
        -- Crear tablas temporales
        DROP TABLE IF EXISTS rec.table2;
        CREATE TEMP TABLE rec.table1(x jsonb);
        CREATE TABLE rec.table2(date timestamptz, val numeric);

        -- Descargar y copiar los datos usando curl
        EXECUTE format(
            'COPY %s FROM PROGRAM ''curl -H "Api-Key:38deaa51-8716-4cc9-aa42-ab14fb72a752.01" "%s?&start_date=%sT000000Z"''',
            rec.table1, rec.url, startdate
        );

        -- Insertar los datos en la tabla temporal
        INSERT INTO rec.table2 
        SELECT f.* 
        FROM rec.table1, jsonb_populate_recordset(null::rec.table2, x) f;

        ALTER TABLE rec.table2 RENAME COLUMN val TO rec.col1;

        -- Actualizar los valores de ID, cau y truncar la fecha a minutos
        UPDATE rec.table2 
        SET date = DATE_TRUNC('minute', date),
        rec.col1 = rec.col1 / 1000 WHERE date >= now() - interval '15 days' AND date <= CURRENT_TIMESTAMP;
    END LOOP;
END $$;

-- Limpiar la tabla temporal de fuentes
DROP TABLE full_db_sources2;

-----------------------------------------------unir en 1 tabla y dividir por 1000 ------------------------------



UPDATE public.caucharidatabasehf SET eecau1val = eecau1.eecau1val FROM public.eecau1 WHERE public.eecau1.date = caucharidatabasehf.date AND caucharidatabasehf.date >= now() - interval '15 days' AND caucharidatabasehf.date <= CURRENT_TIMESTAMP;
UPDATE public.caucharidatabasehf SET eecau2val = eecau2.eecau2val FROM public.eecau2 WHERE public.eecau2.date = caucharidatabasehf.date AND caucharidatabasehf.date >= now() - interval '15 days' AND caucharidatabasehf.date <= CURRENT_TIMESTAMP;
UPDATE public.caucharidatabasehf SET eecau3val = eecau3.eecau3val FROM public.eecau3 WHERE public.eecau3.date = caucharidatabasehf.date AND caucharidatabasehf.date >= now() - interval '15 days' AND caucharidatabasehf.date <= CURRENT_TIMESTAMP;
UPDATE public.caucharidatabasehf SET availcau1 = availcau1.availcau1 FROM public.availcau1 WHERE public.availcau1.date = caucharidatabasehf.date AND caucharidatabasehf.date >= now() - interval '15 days' AND caucharidatabasehf.date <= CURRENT_TIMESTAMP;
UPDATE public.caucharidatabasehf SET availcau2 = availcau2.availcau2 FROM public.availcau2 WHERE public.availcau2.date = caucharidatabasehf.date AND caucharidatabasehf.date >= now() - interval '15 days' AND caucharidatabasehf.date <= CURRENT_TIMESTAMP;
UPDATE public.caucharidatabasehf SET availcau3 = availcau3.availcau3 FROM public.availcau3 WHERE public.availcau3.date = caucharidatabasehf.date AND caucharidatabasehf.date >= now() - interval '15 days' AND caucharidatabasehf.date <= CURRENT_TIMESTAMP;
UPDATE public.caucharidatabasehf SET poicau1 = poicau1.poicau1 FROM public.poicau1 WHERE public.poicau1.date = caucharidatabasehf.date AND caucharidatabasehf.date >= now() - interval '15 days' AND caucharidatabasehf.date <= CURRENT_TIMESTAMP;
UPDATE public.caucharidatabasehf SET poicau2 = poicau2.poicau2 FROM public.poicau2 WHERE public.poicau2.date = caucharidatabasehf.date AND caucharidatabasehf.date >= now() - interval '15 days' AND caucharidatabasehf.date <= CURRENT_TIMESTAMP;
UPDATE public.caucharidatabasehf SET poicau3 = poicau3.poicau3 FROM public.poicau3 WHERE public.poicau3.date = caucharidatabasehf.date AND caucharidatabasehf.date >= now() - interval '15 days' AND caucharidatabasehf.date <= CURRENT_TIMESTAMP;
UPDATE public.caucharidatabasehf SET powercau1 = powercau1.powercau1 FROM public.powercau1 WHERE public.powercau1.date = caucharidatabasehf.date AND caucharidatabasehf.date >= now() - interval '15 days' AND caucharidatabasehf.date <= CURRENT_TIMESTAMP;
UPDATE public.caucharidatabasehf SET powercau2 = powercau2.powercau2 FROM public.powercau2 WHERE public.powercau2.date = caucharidatabasehf.date AND caucharidatabasehf.date >= now() - interval '15 days' AND caucharidatabasehf.date <= CURRENT_TIMESTAMP;
UPDATE public.caucharidatabasehf SET powercau3 = powercau3.powercau3 FROM public.powercau3 WHERE public.powercau3.date = caucharidatabasehf.date AND caucharidatabasehf.date >= now() - interval '15 days' AND caucharidatabasehf.date <= CURRENT_TIMESTAMP;

UPDATE public.caucharidatabasehf SET lvcau1 = lvcau1.lvcau1 FROM public.lvcau1 WHERE public.lvcau1.date = caucharidatabasehf.date AND caucharidatabasehf.date >= now() - interval '15 days' AND caucharidatabasehf.date <= CURRENT_TIMESTAMP;
UPDATE public.caucharidatabasehf SET lvcau2 = lvcau2.lvcau2 FROM public.lvcau2 WHERE public.lvcau2.date = caucharidatabasehf.date AND caucharidatabasehf.date >= now() - interval '15 days' AND caucharidatabasehf.date <= CURRENT_TIMESTAMP;
UPDATE public.caucharidatabasehf SET lvcau3 = lvcau3.lvcau3 FROM public.lvcau3 WHERE public.lvcau3.date = caucharidatabasehf.date AND caucharidatabasehf.date >= now() - interval '15 days' AND caucharidatabasehf.date <= CURRENT_TIMESTAMP;
UPDATE public.caucharidatabasehf SET freccau1 = freccau1.freccau1 FROM public.freccau1 WHERE public.freccau1.date = caucharidatabasehf.date AND caucharidatabasehf.date >= now() - interval '15 days' AND caucharidatabasehf.date <= CURRENT_TIMESTAMP;
UPDATE public.caucharidatabasehf SET freccau2 = freccau2.freccau2 FROM public.freccau2 WHERE public.freccau2.date = caucharidatabasehf.date AND caucharidatabasehf.date >= now() - interval '15 days' AND caucharidatabasehf.date <= CURRENT_TIMESTAMP;
UPDATE public.caucharidatabasehf SET freccau3 = freccau3.freccau3 FROM public.freccau3 WHERE public.freccau3.date = caucharidatabasehf.date AND caucharidatabasehf.date >= now() - interval '15 days' AND caucharidatabasehf.date <= CURRENT_TIMESTAMP;
UPDATE public.caucharidatabasehf SET rpcau1 = rpcau1.rpcau1 FROM public.rpcau1 WHERE public.rpcau1.date = caucharidatabasehf.date AND caucharidatabasehf.date >= now() - interval '15 days' AND caucharidatabasehf.date <= CURRENT_TIMESTAMP;
UPDATE public.caucharidatabasehf SET rpcau2 = rpcau2.rpcau2 FROM public.rpcau2 WHERE public.rpcau2.date = caucharidatabasehf.date AND caucharidatabasehf.date >= now() - interval '15 days' AND caucharidatabasehf.date <= CURRENT_TIMESTAMP;
UPDATE public.caucharidatabasehf SET rpcau3 = rpcau3.rpcau3 FROM public.rpcau3 WHERE public.rpcau3.date = caucharidatabasehf.date AND caucharidatabasehf.date >= now() - interval '15 days' AND caucharidatabasehf.date <= CURRENT_TIMESTAMP;



-------------------------------------------------------------
-----------------------TRAFOS--------------------------------
-------------------------------------------------------------
DELETE FROM caupotenciatrafos_cau1fv WHERE date >= now() - interval '15 days';
-- Crear una tabla temporal para almacenar los detalles de las URLs e IDs
CREATE TEMP TABLE trafos_sources (id text, url text);

-- Insertar los detalles de las solicitudes en la tabla
INSERT INTO trafos_sources (id, url)
VALUES
    ('A01', 'https://portal.unity.inaccess.com/ifms/sources/60e39524-07f9-11eb-aeeb-42010afa015a/events'),
    ('A02', 'https://portal.unity.inaccess.com/ifms/sources/61444e0a-07f9-11eb-aeeb-42010afa015a/events'),
    ('A03', 'https://portal.unity.inaccess.com/ifms/sources/61a645ec-07f9-11eb-aeeb-42010afa015a/events'),
    ('A04', 'https://portal.unity.inaccess.com/ifms/sources/6205b05e-07f9-11eb-aeeb-42010afa015a/events'),
    ('A05', 'https://portal.unity.inaccess.com/ifms/sources/6267127c-07f9-11eb-aeeb-42010afa015a/events'),
    ('A06', 'https://portal.unity.inaccess.com/ifms/sources/62c73a9e-07f9-11eb-aeeb-42010afa015a/events'),
    ('A07', 'https://portal.unity.inaccess.com/ifms/sources/63277526-07f9-11eb-aeeb-42010afa015a/events'),
    ('A08', 'https://portal.unity.inaccess.com/ifms/sources/638796d6-07f9-11eb-aeeb-42010afa015a/events'),
    ('A09', 'https://portal.unity.inaccess.com/ifms/sources/63e89864-07f9-11eb-aeeb-42010afa015a/events'),
    ('A10', 'https://portal.unity.inaccess.com/ifms/sources/644994a2-07f9-11eb-aeeb-42010afa015a/events'),
    ('A11', 'https://portal.unity.inaccess.com/ifms/sources/64ab8e46-07f9-11eb-aeeb-42010afa015a/events'),
    ('A12', 'https://portal.unity.inaccess.com/ifms/sources/650c86ec-07f9-11eb-aeeb-42010afa015a/events'),
    ('A13', 'https://portal.unity.inaccess.com/ifms/sources/65716846-07f9-11eb-aeeb-42010afa015a/events'),
    ('A14', 'https://portal.unity.inaccess.com/ifms/sources/65d3c612-07f9-11eb-aeeb-42010afa015a/events'),
    ('A15', 'https://portal.unity.inaccess.com/ifms/sources/66363d74-07f9-11eb-aeeb-42010afa015a/events'),
    ('A16', 'https://portal.unity.inaccess.com/ifms/sources/6699229a-07f9-11eb-aeeb-42010afa015a/events'),
    ('A17', 'https://portal.unity.inaccess.com/ifms/sources/66fcf90a-07f9-11eb-aeeb-42010afa015a/events'),
    ('A18', 'https://portal.unity.inaccess.com/ifms/sources/675d9436-07f9-11eb-aeeb-42010afa015a/events'),
    ('A19', 'https://portal.unity.inaccess.com/ifms/sources/67c1c096-07f9-11eb-aeeb-42010afa015a/events'),
    ('A20', 'https://portal.unity.inaccess.com/ifms/sources/6827407e-07f9-11eb-aeeb-42010afa015a/events'),
    ('A21', 'https://portal.unity.inaccess.com/ifms/sources/688b7c38-07f9-11eb-aeeb-42010afa015a/events'),
    ('A22', 'https://portal.unity.inaccess.com/ifms/sources/68edc4ce-07f9-11eb-aeeb-42010afa015a/events'),
    ('A23', 'https://portal.unity.inaccess.com/ifms/sources/694f19ea-07f9-11eb-aeeb-42010afa015a/events'),
    ('A24', 'https://portal.unity.inaccess.com/ifms/sources/69b0a2a0-07f9-11eb-aeeb-42010afa015a/events'),
    ('A25', 'https://portal.unity.inaccess.com/ifms/sources/6a144a94-07f9-11eb-aeeb-42010afa015a/events'),
    ('A26', 'https://portal.unity.inaccess.com/ifms/sources/6a7748a6-07f9-11eb-aeeb-42010afa015a/events'),
    ('A27', 'https://portal.unity.inaccess.com/ifms/sources/6ade1cf2-07f9-11eb-aeeb-42010afa015a/events'),
    ('A28', 'https://portal.unity.inaccess.com/ifms/sources/6b4097b0-07f9-11eb-aeeb-42010afa015a/events'),
    ('A29', 'https://portal.unity.inaccess.com/ifms/sources/6ba3bd40-07f9-11eb-aeeb-42010afa015a/events'),
    ('A30', 'https://portal.unity.inaccess.com/ifms/sources/6c06caac-07f9-11eb-aeeb-42010afa015a/events'),
    ('A31', 'https://portal.unity.inaccess.com/ifms/sources/6c66dc08-07f9-11eb-aeeb-42010afa015a/events'),
    ('A32', 'https://portal.unity.inaccess.com/ifms/sources/6ccc015a-07f9-11eb-aeeb-42010afa015a/events'),
    ('A33', 'https://portal.unity.inaccess.com/ifms/sources/6d317f3a-07f9-11eb-aeeb-42010afa015a/events'),
    ('A34', 'https://portal.unity.inaccess.com/ifms/sources/6d94d90e-07f9-11eb-aeeb-42010afa015a/events'),
    ('A35', 'https://portal.unity.inaccess.com/ifms/sources/6dfa0b12-07f9-11eb-aeeb-42010afa015a/events');

DO $$ 
DECLARE
    startdate text := to_char(current_date - 15, 'YYYYMMDD');
    starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
    rec RECORD;
BEGIN
    FOR rec IN SELECT * FROM trafos_sources LOOP
        -- Crear tablas temporales
        DROP TABLE IF EXISTS stage_trafos_cau1;
        DROP TABLE IF EXISTS stage_trafos_cau12;
        CREATE TEMP TABLE stage_trafos_cau1(x jsonb);
        CREATE TEMP TABLE stage_trafos_cau12(date timestamptz, val numeric, id text, cau text);

        -- Descargar y copiar los datos usando curl
        EXECUTE format(
           'COPY stage_trafos_cau1 FROM PROGRAM ''curl "%s?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           rec.url, startdate, starttime
        );

        -- Insertar los datos en la tabla temporal y hacer las actualizaciones
        INSERT INTO stage_trafos_cau12 
        SELECT f.* 
        FROM stage_trafos_cau1, jsonb_populate_recordset(null::stage_trafos_cau12, x) f;

        UPDATE stage_trafos_cau12 
        SET cau = 'cau1fv', 
            id = rec.id,
            date = DATE_TRUNC('minute', date);

        -- Insertar los datos finales en la tabla objetivo
        INSERT INTO caupotenciatrafos_cau1fv
        SELECT * 
        FROM stage_trafos_cau12 
        WHERE date >= (now()::timestamptz - interval '15 days');
    END LOOP;
END $$;

-- Limpiar la tabla temporal de fuentes
DROP TABLE trafos_sources;

DELETE FROM caupotenciatrafos_cau2fv WHERE date >= now() - interval '15 days';
-- Crear una tabla temporal para almacenar los detalles de las URLs e IDs
CREATE TEMP TABLE trafos_sources (id text, url text);

-- Insertar los detalles de las solicitudes en la tabla
INSERT INTO trafos_sources (id, url)
VALUES
    ('B01', 'https://portal.unity.inaccess.com/ifms/sources/c4295d06-07ec-11eb-8a43-42010afa015a/events'),
    ('B02', 'https://portal.unity.inaccess.com/ifms/sources/c4884bcc-07ec-11eb-8a43-42010afa015a/events'),
    ('B03', 'https://portal.unity.inaccess.com/ifms/sources/c4fa5f82-07ec-11eb-8a43-42010afa015a/events'),
    ('B04', 'https://portal.unity.inaccess.com/ifms/sources/c57308c4-07ec-11eb-8a43-42010afa015a/events'),
    ('B05', 'https://portal.unity.inaccess.com/ifms/sources/c5d18660-07ec-11eb-8a43-42010afa015a/events'),
    ('B06', 'https://portal.unity.inaccess.com/ifms/sources/c6303dc2-07ec-11eb-8a43-42010afa015a/events'),
    ('B07', 'https://portal.unity.inaccess.com/ifms/sources/c6903ede-07ec-11eb-8a43-42010afa015a/events'),
    ('B08', 'https://portal.unity.inaccess.com/ifms/sources/c6ed3972-07ec-11eb-8a43-42010afa015a/events'),
    ('B09', 'https://portal.unity.inaccess.com/ifms/sources/c74dcec2-07ec-11eb-8a43-42010afa015a/events'),
    ('B10', 'https://portal.unity.inaccess.com/ifms/sources/c7abad76-07ec-11eb-8a43-42010afa015a/events'),
    ('B11', 'https://portal.unity.inaccess.com/ifms/sources/c809f250-07ec-11eb-8a43-42010afa015a/events'),
    ('B12', 'https://portal.unity.inaccess.com/ifms/sources/c867cad8-07ec-11eb-8a43-42010afa015a/events'),
    ('B13', 'https://portal.unity.inaccess.com/ifms/sources/c8ca6fb2-07ec-11eb-8a43-42010afa015a/events'),
    ('B14', 'https://portal.unity.inaccess.com/ifms/sources/c9287882-07ec-11eb-8a43-42010afa015a/events'),
    ('B15', 'https://portal.unity.inaccess.com/ifms/sources/c98b6834-07ec-11eb-8a43-42010afa015a/events'),
    ('B16', 'https://portal.unity.inaccess.com/ifms/sources/c9ed3140-07ec-11eb-8a43-42010afa015a/events'),
    ('B17', 'https://portal.unity.inaccess.com/ifms/sources/ca4f887c-07ec-11eb-8a43-42010afa015a/events'),
    ('B18', 'https://portal.unity.inaccess.com/ifms/sources/cac17a4a-07ec-11eb-8a43-42010afa015a/events'),
    ('B19', 'https://portal.unity.inaccess.com/ifms/sources/cb2791ae-07ec-11eb-8a43-42010afa015a/events'),
    ('B20', 'https://portal.unity.inaccess.com/ifms/sources/cb888004-07ec-11eb-8a43-42010afa015a/events'),
    ('B21', 'https://portal.unity.inaccess.com/ifms/sources/cbf4d970-07ec-11eb-8a43-42010afa015a/events'),
    ('B22', 'https://portal.unity.inaccess.com/ifms/sources/cc5939c4-07ec-11eb-8a43-42010afa015a/events'),
    ('B23', 'https://portal.unity.inaccess.com/ifms/sources/ccbbda0c-07ec-11eb-8a43-42010afa015a/events'),
    ('B24', 'https://portal.unity.inaccess.com/ifms/sources/cd1fd232-07ec-11eb-8a43-42010afa015a/events'),
    ('B25', 'https://portal.unity.inaccess.com/ifms/sources/cd82c9c8-07ec-11eb-8a43-42010afa015a/events'),
    ('B26', 'https://portal.unity.inaccess.com/ifms/sources/cde9ec66-07ec-11eb-8a43-42010afa015a/events'),
    ('B27', 'https://portal.unity.inaccess.com/ifms/sources/ce4e1876-07ec-11eb-8a43-42010afa015a/events'),
    ('B28', 'https://portal.unity.inaccess.com/ifms/sources/ceb1801e-07ec-11eb-8a43-42010afa015a/events'),
    ('B29', 'https://portal.unity.inaccess.com/ifms/sources/cf18ce18-07ec-11eb-8a43-42010afa015a/events'),
    ('B30', 'https://portal.unity.inaccess.com/ifms/sources/cf786d14-07ec-11eb-8a43-42010afa015a/events'),
    ('B31', 'https://portal.unity.inaccess.com/ifms/sources/cfdae2f0-07ec-11eb-8a43-42010afa015a/events'),
    ('B32', 'https://portal.unity.inaccess.com/ifms/sources/d03e9886-07ec-11eb-8a43-42010afa015a/events'),
    ('B33', 'https://portal.unity.inaccess.com/ifms/sources/d0a16ff6-07ec-11eb-8a43-42010afa015a/events'),
    ('B34', 'https://portal.unity.inaccess.com/ifms/sources/d102e8f8-07ec-11eb-8a43-42010afa015a/events'),
    ('B35', 'https://portal.unity.inaccess.com/ifms/sources/d1665f8c-07ec-11eb-8a43-42010afa015a/events');

DO $$ 
DECLARE
    startdate text := to_char(current_date - 15, 'YYYYMMDD');
    starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
    rec RECORD;
BEGIN
    FOR rec IN SELECT * FROM trafos_sources LOOP
        -- Crear tablas temporales
        DROP TABLE IF EXISTS stage_trafos_cau2;
        DROP TABLE IF EXISTS stage_trafos_cau22;
        CREATE TEMP TABLE stage_trafos_cau2(x jsonb);
        CREATE TEMP TABLE stage_trafos_cau22(date timestamptz, val numeric, id text, cau text);

        -- Descargar y copiar los datos usando curl
        EXECUTE format(
           'COPY stage_trafos_cau2 FROM PROGRAM ''curl "%s?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           rec.url, startdate, starttime
        );

        -- Insertar los datos en la tabla temporal y hacer las actualizaciones
        INSERT INTO stage_trafos_cau22 
        SELECT f.* 
        FROM stage_trafos_cau2, jsonb_populate_recordset(null::stage_trafos_cau22, x) f;

        UPDATE stage_trafos_cau22 
        SET cau = 'cau2fv', 
            id = rec.id,
            date = DATE_TRUNC('minute', date);

        -- Insertar los datos finales en la tabla objetivo
        INSERT INTO alert_cau.caupotenciatrafos_cau2fv 
        SELECT * 
        FROM stage_trafos_cau22 
        WHERE date >= (now()::timestamptz - interval '15 days');
    END LOOP;
END $$;

-- Limpiar la tabla temporal de fuentes
DROP TABLE trafos_sources;

DELETE FROM caupotenciatrafos_cau3fv WHERE date >= now() - interval '15 days';
-- Crear una tabla temporal para almacenar los detalles de las URLs e IDs
CREATE TEMP TABLE trafos_sources (id text, url text);

-- Insertar los detalles de las solicitudes en la tabla
INSERT INTO trafos_sources (id, url)
VALUES
    ('C01', 'https://portal.unity.inaccess.com/ifms/sources/1952bcd2-07ed-11eb-8564-42010afa015a/events'),
    ('C02', 'https://portal.unity.inaccess.com/ifms/sources/19b0bbac-07ed-11eb-8564-42010afa015a/events'),
    ('C03', 'https://portal.unity.inaccess.com/ifms/sources/1a0ffa2c-07ed-11eb-8564-42010afa015a/events'),
    ('C04', 'https://portal.unity.inaccess.com/ifms/sources/1a6ce9bc-07ed-11eb-8564-42010afa015a/events'),
    ('C05', 'https://portal.unity.inaccess.com/ifms/sources/1aca84b4-07ed-11eb-8564-42010afa015a/events'),
    ('C06', 'https://portal.unity.inaccess.com/ifms/sources/1b28e3b0-07ed-11eb-8564-42010afa015a/events'),
    ('C07', 'https://portal.unity.inaccess.com/ifms/sources/1b884fee-07ed-11eb-8564-42010afa015a/events'),
    ('C08', 'https://portal.unity.inaccess.com/ifms/sources/1be654e0-07ed-11eb-8564-42010afa015a/events'),
    ('C09', 'https://portal.unity.inaccess.com/ifms/sources/1c450f12-07ed-11eb-8564-42010afa015a/events'),
    ('C10', 'https://portal.unity.inaccess.com/ifms/sources/1ca1c2d4-07ed-11eb-8564-42010afa015a/events'),
    ('C11', 'https://portal.unity.inaccess.com/ifms/sources/1d00cd06-07ed-11eb-8564-42010afa015a/events'),
    ('C12', 'https://portal.unity.inaccess.com/ifms/sources/1d5fb078-07ed-11eb-8564-42010afa015a/events'),
    ('C13', 'https://portal.unity.inaccess.com/ifms/sources/1dc04e56-07ed-11eb-8564-42010afa015a/events'),
    ('C14', 'https://portal.unity.inaccess.com/ifms/sources/1e1e08b6-07ed-11eb-8564-42010afa015a/events'),
    ('C15', 'https://portal.unity.inaccess.com/ifms/sources/1e7b4936-07ed-11eb-8564-42010afa015a/events'),
    ('C16', 'https://portal.unity.inaccess.com/ifms/sources/1eda7d20-07ed-11eb-8564-42010afa015a/events'),
    ('C17', 'https://portal.unity.inaccess.com/ifms/sources/1f39537c-07ed-11eb-8564-42010afa015a/events'),
    ('C18', 'https://portal.unity.inaccess.com/ifms/sources/1f97a4e0-07ed-11eb-8564-42010afa015a/events'),
    ('C19', 'https://portal.unity.inaccess.com/ifms/sources/1ff75372-07ed-11eb-8564-42010afa015a/events'),
    ('C20', 'https://portal.unity.inaccess.com/ifms/sources/2054ce9e-07ed-11eb-8564-42010afa015a/events'),
    ('C21', 'https://portal.unity.inaccess.com/ifms/sources/20b33f9c-07ed-11eb-8564-42010afa015a/events'),
    ('C22', 'https://portal.unity.inaccess.com/ifms/sources/211066ea-07ed-11eb-8564-42010afa015a/events'),
    ('C23', 'https://portal.unity.inaccess.com/ifms/sources/217002ee-07ed-11eb-8564-42010afa015a/events'),
    ('C24', 'https://portal.unity.inaccess.com/ifms/sources/21ce8c42-07ed-11eb-8564-42010afa015a/events'),
    ('C25', 'https://portal.unity.inaccess.com/ifms/sources/222e954c-07ed-11eb-8564-42010afa015a/events'),
    ('C26', 'https://portal.unity.inaccess.com/ifms/sources/228ce61a-07ed-11eb-8564-42010afa015a/events'),
    ('C27', 'https://portal.unity.inaccess.com/ifms/sources/22ec5e56-07ed-11eb-8564-42010afa015a/events'),
    ('C28', 'https://portal.unity.inaccess.com/ifms/sources/234b6fe0-07ed-11eb-8564-42010afa015a/events'),
    ('C29', 'https://portal.unity.inaccess.com/ifms/sources/23a95b0a-07ed-11eb-8564-42010afa015a/events'),
    ('C30', 'https://portal.unity.inaccess.com/ifms/sources/25348f94-07ed-11eb-8564-42010afa015a/events'),
    ('C31', 'https://portal.unity.inaccess.com/ifms/sources/25955130-07ed-11eb-8564-42010afa015a/events'),
    ('C32', 'https://portal.unity.inaccess.com/ifms/sources/25f4a996-07ed-11eb-8564-42010afa015a/events'),
    ('C33', 'https://portal.unity.inaccess.com/ifms/sources/265581ee-07ed-11eb-8564-42010afa015a/events'),
    ('C34', 'https://portal.unity.inaccess.com/ifms/sources/26b2afd6-07ed-11eb-8564-42010afa015a/events'),
    ('C35', 'https://portal.unity.inaccess.com/ifms/sources/2712e374-07ed-11eb-8564-42010afa015a/events');

DO $$ 
DECLARE
    startdate text := to_char(current_date - 15, 'YYYYMMDD');
    starttime text := to_char((DATE_TRUNC('minute', (now()::timestamptz  + interval '3 hours'))), 'HH24MISS');
    rec RECORD;
BEGIN
    FOR rec IN SELECT * FROM trafos_sources LOOP
        -- Crear tablas temporales
        DROP TABLE IF EXISTS stage_trafos_cau3;
        DROP TABLE IF EXISTS stage_trafos_cau32;
        CREATE TEMP TABLE stage_trafos_cau3(x jsonb);
        CREATE TEMP TABLE stage_trafos_cau32(date timestamptz, val numeric, id text, cau text);

        -- Descargar y copiar los datos usando curl
        EXECUTE format(
           'COPY stage_trafos_cau3 FROM PROGRAM ''curl "%s?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01&start_date=%sT%sZ"''',
           rec.url, startdate, starttime
        );

        -- Insertar los datos en la tabla temporal y hacer las actualizaciones
        INSERT INTO stage_trafos_cau32 
        SELECT f.* 
        FROM stage_trafos_cau3, jsonb_populate_recordset(null::stage_trafos_cau32, x) f;

        UPDATE stage_trafos_cau32 
        SET cau = 'cau3fv', 
            id = rec.id,
            date = DATE_TRUNC('minute', date);

        -- Insertar los datos finales en la tabla objetivo
        INSERT INTO caupotenciatrafos_cau3fv 
        SELECT * 
        FROM stage_trafos_cau32 
        WHERE date >= (now()::timestamptz - interval '15 days');
    END LOOP;
END $$;

-- Limpiar la tabla temporal de fuentes
DROP TABLE trafos_sources;