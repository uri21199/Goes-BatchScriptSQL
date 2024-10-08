
DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er861.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha861.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er862.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha862.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er863.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha863.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er864.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha864.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er865.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha865.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er866.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha866.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er867.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha867.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er868.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha868.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er869.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha869.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er870.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha870.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er889.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha889.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er890.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha890.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er891.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha891.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er892.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha892.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er893.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha893.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er894.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha894.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er895.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha895.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er896.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha896.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er897.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha897.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er898.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha898.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er899.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha899.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er900.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha900.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er901.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha901.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er902.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha902.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er903.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha903.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er904.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha904.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er905.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha905.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er906.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha906.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er907.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha907.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er908.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha908.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er909.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha909.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er910.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha910.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er911.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha911.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er912.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha912.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er913.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha913.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er914.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha914.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er915.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha915.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er916.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha916.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er917.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha917.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er918.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha918.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er919.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha919.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er920.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha920.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er921.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha921.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er922.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha922.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er923.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha923.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er924.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha924.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er925.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha925.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er926.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha926.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er927.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha927.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er928.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha928.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er929.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha929.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er930.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha930.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er931.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha931.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er932.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha932.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er933.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha933.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er934.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha934.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er935.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha935.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er936.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha936.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er937.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha937.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er938.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha938.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er939.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha939.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er940.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha940.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er941.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha941.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er942.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha942.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er943.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha943.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er944.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha944.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er945.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha945.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er946.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha946.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er947.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha947.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er948.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha948.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er949.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha949.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er950.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha950.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er951.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha951.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er952.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha952.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er953.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha953.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er954.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha954.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er955.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha955.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er956.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha956.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er957.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha957.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er958.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha958.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er959.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha959.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er960.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha960.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er961.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha961.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er962.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha962.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er963.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha963.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er964.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha964.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er965.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha965.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er966.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha966.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er967.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha967.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er968.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha968.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er969.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha969.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er970.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha970.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er971.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha971.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er972.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha972.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er973.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha973.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er974.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha974.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er975.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha975.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er976.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha976.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er977.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha977.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er978.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha978.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er979.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha979.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er980.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha980.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er981.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha981.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er982.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha982.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er983.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha983.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er984.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha984.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er985.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha985.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er986.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha986.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er987.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha987.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er988.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha988.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er989.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha989.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er990.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha990.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er991.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha991.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er992.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha992.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er993.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha993.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er994.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha994.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er995.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha995.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er996.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha996.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er997.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha997.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er998.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha998.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er999.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha999.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1000.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1000.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1001.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1001.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1002.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1002.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1003.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1003.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1004.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1004.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1005.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1005.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1006.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1006.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1007.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1007.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1008.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1008.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1009.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1009.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1010.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1010.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1011.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1011.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1012.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1012.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1013.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1013.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1014.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1014.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1015.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1015.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1016.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1016.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1017.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1017.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1018.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1018.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1019.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1019.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1020.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1020.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1021.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1021.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1022.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1022.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1023.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1023.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1024.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1024.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1025.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1025.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1026.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1026.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1027.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1027.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1028.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1028.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1029.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1029.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1030.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1030.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1031.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1031.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1032.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1032.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1033.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1033.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1034.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1034.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1035.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1035.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1036.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1036.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1037.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1037.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1038.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1038.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1039.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1039.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1040.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1040.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1041.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1041.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1042.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1042.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1043.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1043.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1044.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1044.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1045.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1045.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1046.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1046.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1047.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1047.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1048.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1048.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1049.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1049.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1050.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1050.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1051.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1051.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1052.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1052.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1053.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1053.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1054.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1054.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1055.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1055.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1056.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1056.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1057.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1057.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1058.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1058.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1059.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1059.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1060.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1060.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1061.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1061.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1062.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1062.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1063.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1063.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1064.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1064.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1065.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1065.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1066.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1066.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1067.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1067.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1068.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1068.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1069.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1069.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1070.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1070.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1071.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1071.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1072.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1072.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1073.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1073.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1074.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1074.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1075.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1075.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1076.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1076.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1077.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1077.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1078.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1078.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1079.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1079.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1080.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1080.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1081.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1081.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1082.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1082.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1083.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1083.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1084.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1084.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1085.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1085.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1086.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1086.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1087.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1087.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1088.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1088.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1089.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1089.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1090.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1090.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1091.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1091.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1092.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1092.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1093.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1093.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1094.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1094.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1095.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1095.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1096.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1096.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1097.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1097.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1098.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1098.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1099.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1099.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1100.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1100.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1101.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1101.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1102.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1102.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1103.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1103.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1104.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1104.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1105.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1105.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1106.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1106.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1107.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1107.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1108.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1108.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1109.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1109.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1110.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1110.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1111.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1111.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1112.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1112.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1113.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1113.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1114.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1114.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1115.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1115.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1116.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1116.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1117.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1117.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1118.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1118.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1119.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1119.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1120.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1120.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1121.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1121.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1122.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1122.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1123.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1123.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1124.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1124.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1125.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1125.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1126.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1126.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1127.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1127.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1128.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1128.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1129.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1129.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1130.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1130.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1131.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1131.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1132.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1132.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1133.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1133.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1134.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1134.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1135.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1135.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1136.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1136.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1137.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1137.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1138.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1138.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1139.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1139.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1140.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1140.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1141.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1141.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1142.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1142.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1143.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1143.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1144.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1144.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1145.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1145.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1146.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1146.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1147.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1147.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1148.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1148.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1149.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1149.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1150.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1150.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1151.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1151.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1152.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1152.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1153.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1153.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1154.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1154.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1155.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1155.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1156.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1156.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1157.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1157.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1158.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1158.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1159.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1159.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1160.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1160.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1161.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1161.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1162.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1162.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1163.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1163.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1164.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1164.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1165.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1165.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1166.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1166.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1167.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1167.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1168.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1168.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1169.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1169.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1170.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1170.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1171.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1171.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1172.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1172.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1173.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1173.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1174.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1174.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1175.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1175.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1176.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1176.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1177.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1177.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1178.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1178.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1179.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1179.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1180.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1180.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1181.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1181.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1182.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1182.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1183.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1183.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1184.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1184.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1185.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1185.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1186.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1186.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1187.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1187.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1188.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1188.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1189.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1189.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1190.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1190.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1191.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1191.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1192.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1192.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1193.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1193.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1194.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1194.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1195.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1195.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1196.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1196.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1197.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1197.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1198.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1198.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1199.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1199.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1200.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1200.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1201.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1201.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1202.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1202.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1203.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1203.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1204.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1204.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1205.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1205.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1206.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1206.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1207.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1207.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1208.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1208.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1209.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1209.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1210.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1210.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1211.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1211.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1212.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1212.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1213.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1213.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1214.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1214.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1215.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1215.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1216.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1216.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1217.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1217.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1218.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1218.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1219.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1219.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1220.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1220.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1221.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1221.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1222.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1222.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1223.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1223.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1224.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1224.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1225.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1225.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1226.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1226.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1227.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1227.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1228.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1228.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1229.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1229.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1230.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1230.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1231.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1231.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1232.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1232.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1233.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1233.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1234.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1234.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1235.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1235.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1236.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1236.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1237.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1237.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1238.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1238.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1239.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1239.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1240.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1240.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1241.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1241.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1242.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1242.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1243.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1243.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1244.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1244.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1245.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1245.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1246.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1246.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1247.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1247.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1248.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1248.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1249.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1249.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1250.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1250.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1251.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1251.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1252.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1252.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1253.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1253.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1254.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1254.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1255.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1255.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1256.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1256.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1257.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1257.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1258.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1258.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1259.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1259.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1260.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1260.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1261.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1261.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1262.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1262.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1263.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1263.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1264.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1264.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1265.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1265.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1266.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1266.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1267.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1267.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1268.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1268.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1269.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1269.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1270.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1270.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1271.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1271.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1272.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1272.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1273.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1273.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1274.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1274.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1275.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1275.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1276.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1276.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1277.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1277.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1278.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1278.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1279.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1279.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1280.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1280.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1281.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1281.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1282.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1282.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1283.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1283.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1284.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1284.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1285.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1285.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1286.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1286.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1287.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1287.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1288.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1288.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1289.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1289.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1290.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1290.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1291.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1291.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1292.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1292.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1293.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1293.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1294.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1294.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1295.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1295.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1296.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1296.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1297.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1297.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1298.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1298.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1299.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1299.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1300.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1300.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1301.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1301.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1302.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1302.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1303.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1303.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1304.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1304.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1305.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1305.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1306.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1306.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1307.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1307.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1308.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1308.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1309.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1309.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1310.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1310.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1311.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1311.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1312.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1312.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1313.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1313.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1314.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1314.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1315.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1315.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1316.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1316.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1317.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1317.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1318.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1318.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1319.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1319.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1320.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1320.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1321.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1321.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1322.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1322.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1323.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1323.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1324.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1324.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1325.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1325.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1326.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1326.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1327.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1327.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1328.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1328.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1329.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1329.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1330.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1330.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1331.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1331.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1332.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1332.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1333.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1333.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1334.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1334.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1335.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1335.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1336.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1336.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1337.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1337.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1338.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1338.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1339.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1339.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1340.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1340.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1341.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1341.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1342.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1342.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1343.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1343.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1344.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1344.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1345.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1345.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1346.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1346.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1347.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1347.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1348.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1348.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1349.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1349.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1350.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1350.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1351.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1351.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1352.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1352.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1353.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1353.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1354.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1354.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1355.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1355.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1356.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1356.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1357.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1357.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1358.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1358.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1359.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1359.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1360.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1360.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1361.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1361.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1362.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1362.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1363.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1363.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1364.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1364.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1365.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1365.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1366.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1366.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1367.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1367.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1368.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1368.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1369.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1369.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1370.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1370.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1371.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1371.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1372.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1372.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1373.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1373.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1374.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1374.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1375.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1375.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1376.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1376.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1377.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1377.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1378.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1378.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1379.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1379.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1380.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1380.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1381.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1381.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1382.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1382.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1383.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1383.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1384.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1384.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1385.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1385.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1386.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1386.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1387.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1387.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1388.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1388.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1389.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1389.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1390.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1390.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1391.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1391.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1392.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1392.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1393.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1393.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1394.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1394.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1395.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1395.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1396.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1396.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1397.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1397.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1398.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1398.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1399.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1399.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1400.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1400.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1401.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1401.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1402.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1402.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1403.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1403.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1404.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1404.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1405.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1405.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1406.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1406.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1407.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1407.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1408.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1408.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1409.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1409.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1410.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1410.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1411.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1411.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1412.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1412.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1413.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1413.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1414.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1414.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1415.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1415.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1416.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1416.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1417.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1417.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1418.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1418.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1419.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1419.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1420.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1420.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1421.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1421.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1422.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1422.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1423.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1423.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1424.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1424.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1425.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1425.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1426.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1426.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1427.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1427.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1428.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1428.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1429.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1429.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1430.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1430.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1431.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1431.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1432.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1432.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1433.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1433.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1434.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1434.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1435.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1435.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1436.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1436.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1437.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1437.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1438.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1438.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1439.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1439.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1440.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1440.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1441.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1441.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1442.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1442.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1443.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1443.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1444.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1444.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1445.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1445.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1446.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1446.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1447.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1447.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1448.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1448.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1449.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1449.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1450.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1450.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1451.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1451.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1452.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1452.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1453.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1453.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1454.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1454.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1455.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1455.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1456.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1456.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1457.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1457.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1458.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1458.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1459.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1459.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1460.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1460.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1461.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1461.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1462.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1462.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1463.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1463.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1464.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1464.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1465.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1465.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1466.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1466.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1467.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1467.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1468.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1468.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1469.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1469.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1470.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1470.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1471.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1471.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1472.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1472.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1473.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1473.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1474.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1474.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1475.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1475.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1476.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1476.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1477.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1477.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1478.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1478.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1479.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1479.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1480.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1480.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1481.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1481.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1482.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1482.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1483.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1483.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1484.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1484.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1485.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1485.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1486.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1486.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1487.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1487.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1488.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1488.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1489.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1489.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1490.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1490.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1491.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1491.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1492.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1492.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1493.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1493.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1494.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1494.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1495.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1495.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1496.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1496.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1497.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1497.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1498.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1498.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1499.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1499.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1500.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1500.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1501.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1501.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1502.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1502.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1503.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1503.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1504.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1504.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1505.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1505.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1506.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1506.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1507.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1507.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1508.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1508.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1509.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1509.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1510.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1510.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1511.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1511.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1512.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1512.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1513.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1513.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1514.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1514.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1515.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1515.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1516.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1516.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1517.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1517.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1518.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1518.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1519.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1519.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1520.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1520.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1521.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1521.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1522.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1522.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1523.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1523.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1524.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1524.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1525.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1525.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1526.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1526.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1527.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1527.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1528.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1528.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1529.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1529.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1530.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1530.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1531.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1531.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1532.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1532.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1533.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1533.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1534.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1534.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1535.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1535.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1536.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1536.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1537.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1537.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1538.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1538.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1539.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1539.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1540.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1540.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1541.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1541.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1542.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1542.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1543.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1543.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1544.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1544.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1545.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1545.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1546.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1546.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1547.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1547.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1548.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1548.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1549.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1549.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1550.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1550.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1551.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1551.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1552.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1552.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1553.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1553.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1554.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1554.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1555.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1555.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1556.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1556.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1557.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1557.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1558.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1558.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1559.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1559.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1560.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1560.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1561.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1561.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1562.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1562.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1563.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1563.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS tmp_er_import;
CREATE TEMP TABLE tmp_er_import (date_hour timestamptz, grupo text, egenerada numeric, eacreditada numeric, eposible numeric, epronostico numeric, evertida numeric, etakeorpay numeric, date text, hour integer); 

COPY tmp_er_import (grupo,
hour,
egenerada, 
eacreditada, 
eposible, 
epronostico, 
evertida, 
etakeorpay)
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\er1564.csv'
DELIMITER ',' NULL AS '';

COPY tmp_er_import ("date")
FROM 'C:\Users\Administrador\Desktop\PO historico\csv\fecha1564.csv'
DELIMITER ',' NULL AS '';

UPDATE tmp_er_import SET date = datefix.date FROM (SELECT date FROM tmp_er_import WHERE grupo IS NULL) as datefix;
ALTER TABLE tmp_er_import ALTER COLUMN date TYPE timestamptz USING to_timestamp(date, 'YYYY-MM-DD hh24:mi:ss');
DELETE FROM tmp_er_import WHERE grupo IS NULL;
UPDATE tmp_er_import SET date_hour = datefix.date2 FROM (SELECT grupo, hour, egenerada, date + interval '1 hour' * "hour" as date2 FROM tmp_er_import) AS datefix WHERE datefix.egenerada = tmp_er_import.egenerada AND datefix.hour = tmp_er_import.hour AND datefix.grupo = tmp_er_import.grupo;
ALTER TABLE tmp_er_import DROP COLUMN date, DROP COLUMN hour;
INSERT INTO smec.energias_renovables SELECT date_hour, grupo, egenerada, eacreditada, eposible, epronostico, evertida, etakeorpay FROM tmp_er_import ON CONFLICT DO NOTHING;
