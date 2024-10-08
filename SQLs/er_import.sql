DO $$
DECLARE
    file_id int;
BEGIN
    -- Loop desde el archivo 861 hasta el 1564
    FOR file_id IN 861..1564 LOOP
        BEGIN
            -- Crear tabla temporal
            EXECUTE format('
                DROP TABLE IF EXISTS tmp_er_import;
                CREATE TEMP TABLE tmp_er_import (
                    date_hour timestamptz,
                    grupo text,
                    egenerada numeric,
                    eacreditada numeric,
                    eposible numeric,
                    epronostico numeric,
                    evertida numeric,
                    etakeorpay numeric,
                    date text,
                    hour integer
                );
            ');

            -- Intentar copiar datos del archivo principal
            BEGIN
                EXECUTE format('
                    COPY tmp_er_import (grupo, hour, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay)
                    FROM ''C:\\Users\\Administrador\\Desktop\\PO historico\\csv\\er%s.csv''
                    DELIMITER '','' NULL AS '''';
                ', file_id);
            EXCEPTION
                WHEN others THEN
                    RAISE NOTICE 'Archivo er%s.csv no encontrado. Continuando con el siguiente.', file_id;
                    CONTINUE;
            END;

            -- Intentar copiar datos del archivo de fecha
            BEGIN
                EXECUTE format('
                    COPY tmp_er_import ("date")
                    FROM ''C:\\Users\\Administrador\\Desktop\\PO historico\\csv\\fecha%s.csv''
                    DELIMITER '','' NULL AS '''';
                ', file_id);
            EXCEPTION
                WHEN others THEN
                    RAISE NOTICE 'Archivo fecha%s.csv no encontrado. Continuando con el siguiente.', file_id;
                    CONTINUE;
            END;

            -- Si las copias anteriores fueron exitosas, realizar las demás operaciones
            EXECUTE '
                UPDATE tmp_er_import
                SET date = datefix.date
                FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;

                ALTER TABLE tmp_er_import
                ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, ''YYYY-MM-DD hh24:mi:ss'');

                DELETE FROM tmp_er_import WHERE grupo IS NULL;

                UPDATE tmp_er_import
                SET date_hour = datefix.date2
                FROM (
                    SELECT grupo, hour, egenerada, date + interval ''1 hour'' * "hour" as date2
                    FROM tmp_er_import
                ) AS datefix
                WHERE datefix.egenerada = tmp_er_import.egenerada
                AND datefix.hour = tmp_er_import.hour
                AND datefix.grupo = tmp_er_import.grupo;
            ';

            -- Insertar datos en la tabla final
            EXECUTE '
                INSERT INTO smec.energias_renovables
                SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay
                FROM tmp_er_import
                ON CONFLICT DO NOTHING;
            ';

        EXCEPTION
            -- Capturar cualquier otro error que ocurra durante la ejecución del bloque principal
            WHEN others THEN
                RAISE NOTICE 'Ocurrió un error con el archivo er%s.csv. Continuando con el siguiente.', file_id;
        END;
    END LOOP;
END $$;
