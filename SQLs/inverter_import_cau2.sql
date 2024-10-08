
DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/0dc49ebc-07ed-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B01.01.01';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/16a47070-07ed-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B01.01.04';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/6fddf292-07ed-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B01.09.01';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/99a11050-07ed-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B01.12.03';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/bee34626-07ed-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B01.15.03';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/cb26140e-07ed-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B01.16.03';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/e4f09864-07ed-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B02.01.04';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/f0c693d2-07ed-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B02.02.04';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/fff9905c-07ed-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B02.04.01';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/02df063a-07ee-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B02.04.02';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/1187f50c-07ee-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B02.05.03';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/178ab714-07ee-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B02.06.01';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/23a0872c-07ee-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B02.07.01';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/2c5e8dd2-07ee-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B02.07.04';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/3e15f2fe-07ee-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B02.09.02';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/41378452-07ee-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B02.09.03';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/4ef4ff0c-07ee-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B02.10.03';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/64942900-07ee-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B02.12.02';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/677cb704-07ee-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B02.12.03';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/7c4db534-07ee-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B02.14.02';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/8532d88c-07ee-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B02.15.01';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/8820b67c-07ee-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B02.15.02';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/99de43ca-07ee-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B02.16.04';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/aec70c2c-07ee-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B03.01.03';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/b1b92028-07ee-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B03.01.04';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/c972ce30-07ee-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B03.03.04';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/d5501a5a-07ee-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B03.04.04';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/d85f3ef6-07ee-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B03.05.01';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/e7218534-07ee-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B03.06.02';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/ea0c63fe-07ee-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B03.06.03';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/effd1a92-07ee-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B03.07.01';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/3a26a110-07ef-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B03.13.01';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/668e5040-07ef-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B03.16.04';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/7ae1a13c-07ef-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B04.01.03';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/87636904-07ef-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B04.02.03';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/8d9d8098-07ef-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B04.03.01';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/909a869c-07ef-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B04.03.02';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/99ee625e-07ef-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B04.04.01';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/9ce8b702-07ef-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B04.04.02';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/9fd8b296-07ef-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B04.04.03';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/a2cd1de8-07ef-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B04.04.04';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/bdc474c0-07ef-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B04.07.01';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/db89e8aa-07ef-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B04.09.03';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/f0960ec2-07ef-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B04.11.01';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/fc761822-07ef-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B04.12.01';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/22cabb5e-07f0-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B04.15.02';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/2eb71d4a-07f0-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B04.16.02';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/53f95758-07f0-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B05.02.03';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/62a862b2-07f0-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B05.03.04';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/a71179fc-07f0-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B05.09.03';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/c4cfbd64-07f0-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B05.12.01';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/ea6f8d42-07f0-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B05.15.01';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/f74e505c-07f0-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B05.16.01';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/137bcff2-07f1-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B06.01.01';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/269b260a-07f1-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B06.02.03';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/5ec98de6-07f1-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B06.07.02';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/7945b186-07f1-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B06.09.03';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/7c2ef88a-07f1-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B06.09.04';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/7f3ea296-07f1-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B06.10.01';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/8de6be82-07f1-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B06.11.02';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/90eaba84-07f1-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B06.11.03';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/99e3617c-07f1-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B06.12.02';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/ba8ef148-07f1-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B06.15.01';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/c6530fb4-07f1-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B06.16.01';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/dfb63d64-07f1-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B07.01.02';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/eb82a380-07f1-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B07.02.02';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/002814be-07f2-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B07.04.01';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/17e3deda-07f2-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B07.06.01';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/20a63a7c-07f2-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B07.06.04';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/269978f4-07f2-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B07.07.02';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/2fac0fc4-07f2-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B07.08.01';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/357315ce-07f2-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B07.08.03';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/3e47599e-07f2-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B07.09.02';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/441459b2-07f2-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B07.09.04';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/4d03c9c2-07f2-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B07.10.03';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/58c7d9c4-07f2-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B07.11.03';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/64aef3e4-07f2-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B07.12.03';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/6f7b8ac6-07f2-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B07.13.01';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/9bb19360-07f2-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B07.16.04';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/a978fb00-07f2-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B08.01.01';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/af539530-07f2-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B08.01.03';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/c74c7fda-07f2-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B08.03.03';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/d31a5b48-07f2-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B08.04.03';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/dc0e0696-07f2-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B08.05.02';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/eac7d4b4-07f2-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B08.06.03';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/026b28b4-07f3-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B08.08.03';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/0b41079c-07f3-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B08.09.02';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/16ffc96a-07f3-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B08.10.02';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/1fdf9448-07f3-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B08.11.01';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/2bd3fa28-07f3-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B08.12.01';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/55489fc6-07f3-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B08.15.03';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/a730d84e-07f3-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B09.05.03';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/aa464596-07f3-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B09.05.04';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/ad530f58-07f3-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B09.06.01';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/cb313720-07f3-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B09.08.03';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/d7bd0122-07f3-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B09.09.03';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/e6b08956-07f3-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B09.10.04';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/0a7680d4-07f4-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B09.13.04';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/10e9cd90-07f4-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B09.14.02';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/27733f92-07f4-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B09.16.01';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/2aa8bfe8-07f4-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B09.16.02';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/33cb5f86-07f4-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B09.16.03';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/36be58d8-07f4-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B09.16.04';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/596c21ee-07f4-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B10.02.04';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/5f63efdc-07f4-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B10.03.02';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/6b4d1724-07f4-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B10.04.02';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/8c2eebe8-07f4-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B10.07.01';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/8f15cbec-07f4-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B10.07.02';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/9801330e-07f4-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B10.08.01';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/bee70be2-07f4-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B10.11.02';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/c4bc469a-07f4-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B10.11.04';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/cdda6b12-07f4-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B10.12.03';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/fd09cdce-07f4-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B10.16.02';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/25fc0c88-07f5-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B11.02.04';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/44df9a52-07f5-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B11.05.02';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/4813c4aa-07f5-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B11.05.03';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/59fbef58-07f5-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B11.07.01';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/7d991f9e-07f5-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B11.10.01';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/8082f39c-07f5-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B11.10.02';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/9b4fc2ae-07f5-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B11.12.03';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/aa56d706-07f5-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B11.13.04';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/b36492a2-07f5-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B11.14.03';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/c55df886-07f5-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B11.16.01';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/cb37e028-07f5-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B11.16.03';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/d948bfb6-07f5-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B12.02.01';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/eb00c302-07f5-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B12.05.03';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/05b2c614-07f6-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B12.07.04';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/0bac2f60-07f6-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B12.08.02';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/384a07cc-07f6-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B12.12.01';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/41110180-07f6-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B12.12.04';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/60b65864-07f6-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B12.14.04';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/63cdd914-07f6-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B12.15.01';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/6c9ccde8-07f6-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B12.15.04';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/6fb28018-07f6-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B12.16.01';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/85c134f8-07f6-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B13.01.01';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/88b4c652-07f6-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B13.01.02';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/9a87f19c-07f6-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B13.02.04';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/af7b1a5c-07f6-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B13.04.03';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/b888ac68-07f6-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B13.05.02';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/bb7f3b1c-07f6-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B13.05.03';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/d3b01d8c-07f6-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B13.07.03';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/dd821414-07f6-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B13.08.02';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/e073401c-07f6-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B13.08.03';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/e993be74-07f6-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B13.09.02';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/0287c9c0-07f7-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B13.11.02';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/1deebe8a-07f7-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B13.13.03';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/2a2e4a58-07f7-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B13.14.03';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/2d215c0a-07f7-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B13.14.04';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/65239e9c-07f7-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B14.02.03';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/6815e0d8-07f7-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B14.02.04';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/711bd200-07f7-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B14.03.03';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/740ea910-07f7-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B14.03.04';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/92209cec-07f7-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B14.06.02';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/0febc5e8-07f8-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B14.16.04';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/1dbbaabc-07f8-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B15.01.01';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/20d81384-07f8-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B15.01.02';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/36a99f0c-07f8-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B15.03.01';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/3cab5f08-07f8-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B15.03.03';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/42c6b45a-07f8-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B15.04.01';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/45c41b48-07f8-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B15.04.02';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/4ba4cdd2-07f8-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B15.04.04';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/54a4b744-07f8-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B15.05.03';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/5aaa0e28-07f8-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B15.06.01';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/6c756c06-07f8-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B15.07.03';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/81a68e98-07f8-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B15.09.02';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/a5819c36-07f8-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B15.12.02';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/c34744e6-07f8-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B15.14.04';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/c659bf7e-07f8-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B15.15.01';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/c945c2a0-07f8-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B15.15.02';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/cc322b7a-07f8-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B15.15.03';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/d236fd52-07f8-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B15.16.01';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/ebd886e0-07f8-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B16.01.02';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/fae5bb9e-07f8-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B16.02.03';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/37c5e246-07f9-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B16.06.04';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/40b2188e-07f9-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B16.07.03';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/43a16194-07f9-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B16.07.04';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/49a8be2a-07f9-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B16.08.02';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/8bdb26a2-07f9-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B16.13.04';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/8eff1208-07f9-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B16.14.01';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/c3e7dd06-07f9-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B17.01.03';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/cfd3e7f4-07f9-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B17.02.03';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/0bfaf07e-07fa-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B17.07.03';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/17ff2192-07fa-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B17.08.03';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/54b13864-07fa-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B17.13.03';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/60afb56e-07fa-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B17.14.03';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/66c204a2-07fa-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B17.15.01';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/69bca892-07fa-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B17.15.02';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/6cb30f46-07fa-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B17.15.03';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/72c5ebce-07fa-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B17.16.01';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/78afd36a-07fa-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B17.16.03';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/7ba08718-07fa-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B17.16.04';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/89dd34fc-07fa-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B18.01.01';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/8fd65050-07fa-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B18.01.03';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/a1d135d6-07fa-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B18.03.01';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/aac12b10-07fa-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B18.03.04';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/02fedb10-07fb-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B18.11.01';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/0606cafc-07fb-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B18.11.02';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/0f4918c2-07fb-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B18.12.01';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/3f9472e2-07fb-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B18.16.01';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/45ca6cfc-07fb-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B18.16.03';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/60281b30-07fb-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B19.01.04';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/84c8a3f6-07fb-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B19.04.04';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/a98b81ae-07fb-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B19.07.04';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/282db522-07fc-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B20.01.02';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/2b272682-07fc-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B20.01.03';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/2e2305f4-07fc-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B20.01.04';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/3a2f0956-07fc-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B20.02.04';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/3d536078-07fc-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B20.03.01';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/43450e28-07fc-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B20.03.03';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/4c6e441a-07fc-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B20.04.02';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/61d7844c-07fc-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B20.06.01';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/654893fa-07fc-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B20.06.02';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/87f8147a-07fc-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B20.08.01';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/da52af50-07fc-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B20.14.04';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/e9d999b6-07fc-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B20.16.01';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/f2c0d396-07fc-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B20.16.04';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/02062644-07fd-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B21.01.01';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/04f98c60-07fd-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B21.01.02';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/300dfa62-07fd-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B21.04.04';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/4987269e-07fd-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B21.06.04';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/500310c8-07fd-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B21.07.02';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/52fcb09a-07fd-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B21.07.03';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/5917fafc-07fd-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B21.08.01';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/5c0ffaa2-07fd-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B21.08.02';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/6523567a-07fd-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B21.09.01';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/6e10e0a4-07fd-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B21.09.04';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/8ce658b0-07fd-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B21.12.02';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/8fe22738-07fd-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B21.12.03';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/98ffac46-07fd-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B21.13.02';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/b1c54510-07fd-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B21.15.02';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/be156e26-07fd-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B21.16.02';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/e4dca632-07fd-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B22.02.03';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/f3e9b4ee-07fd-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B22.03.04';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/1d78aaea-07fe-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B22.07.01';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/32ac18e8-07fe-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B22.08.04';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/35cef72a-07fe-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B22.09.01';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/573b548a-07fe-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B22.11.04';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/6caabc8e-07fe-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B22.13.03';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/f302927a-07fe-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B23.07.03';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/409270f0-07ff-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B23.13.04';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/46aacd20-07ff-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B23.14.02';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/be0fc79e-07ff-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B24.07.01';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/d94298d4-07ff-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B24.09.01';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/dc41b98e-07ff-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B24.09.02';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/00c7ec38-0800-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B24.12.02';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/5225a5de-0800-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B25.02.01';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/5523de5e-0800-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B25.02.02';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/5b2492a8-0800-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B25.02.04';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/6847fc0e-0800-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B25.03.04';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/7aa59884-0800-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B25.05.02';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/95ffd4a0-0800-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B25.07.03';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/b7827236-0800-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B25.10.02';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/f6258c08-0800-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B25.13.03';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/fc537c98-0800-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B25.14.01';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/0252088a-0801-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B25.14.03';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/6ea484fe-0801-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B26.06.03';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/cad485da-0801-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B26.14.01';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/d1336f04-0801-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B26.14.03';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/12a5de5e-0802-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B27.02.04';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/15c9618c-0802-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B27.03.01';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/25959d4c-0802-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B27.04.02';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/2ebd9b40-0802-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B27.05.01';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/37c0c8ac-0802-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B27.05.04';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/7541d04a-0802-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B27.10.04';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/7869721e-0802-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B27.11.01';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/7b685e9e-0802-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B27.11.02';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/8a9eacb0-0802-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B27.12.03';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/8d9a5b26-0802-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B27.12.04';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/90c1f71e-0802-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B27.13.01';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/96b8b464-0802-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B27.13.03';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/9ce007ca-0802-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B27.14.01';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/a5edf4ee-0802-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B27.14.04';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/eede41ea-0802-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B28.03.04';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/22ff5da6-0803-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B28.08.01';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/25fe8856-0803-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B28.08.02';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/2c015a30-0803-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B28.08.04';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/3bc93dde-0803-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B28.10.01';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/3f16362c-0803-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B28.10.02';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/514c608c-0803-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B28.11.04';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/577175c4-0803-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B28.12.02';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/69ce7ff0-0803-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B28.13.04';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/7f329fca-0803-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B28.15.03';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/a23e54f0-0803-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B29.01.03';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/ba8f9bfe-0803-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B29.03.03';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/c9e562a0-0803-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B29.04.04';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/cd671f86-0803-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B29.05.01';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/ec12e1ea-0803-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B29.07.03';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/f23e8808-0803-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B29.08.01';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/f54ba04e-0803-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B29.08.02';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/fb442d36-0803-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B29.08.04';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/0191029a-0804-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B29.09.02';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/0798367c-0804-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B29.09.04';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/12fe38fe-0804-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B29.10.03';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/1d23897e-0804-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B29.11.02';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/2c670a8c-0804-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B29.12.03';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/610ad9c6-0804-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B29.16.04';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/6f9e6714-0804-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B30.01.01';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/75966ebe-0804-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B30.01.03';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/7bdb684c-0804-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B30.02.01';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/8e265f7a-0804-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B30.03.03';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/974a0c3c-0804-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B30.04.02';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/a3a838e6-0804-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B30.05.02';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/a6a3f008-0804-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B30.05.03';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/f3e5369c-0804-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B30.11.04';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/00176e1c-0805-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B30.12.04';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/03541a58-0805-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B30.13.01';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/0f7c58f4-0805-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B30.14.01';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/41263118-0805-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B31.01.01';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/475f48b2-0805-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B31.01.03';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/4d868318-0805-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B31.02.01';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/8185cdae-0805-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B31.06.02';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/8592b948-0805-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B31.06.03';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/921211b4-0805-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B31.07.03';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/9bbce4d2-0805-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B31.08.02';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/aefa5b38-0805-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B31.09.04';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/c0315ea6-0805-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B31.11.01';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/c93bc144-0805-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B31.11.04';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/d8ca9fe0-0805-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B31.13.01';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/e7f75cce-0805-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B31.14.02';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/fa34b3b4-0805-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B31.15.04';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/34fb88a6-0806-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B32.03.03';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/92ad2c02-0806-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B32.09.01';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/d7193f5c-0806-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B32.14.03';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/da2370c8-0806-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B32.14.04';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/15b4be44-0807-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B33.02.04';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/18e201bc-0807-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B33.03.01';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/2814daec-0807-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B33.04.02';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/2b2cc000-0807-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B33.04.03';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/2e33fdae-0807-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B33.04.04';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/504b4410-0807-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B33.07.03';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/6f016bc8-0807-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B33.10.01';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/72148c1e-0807-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B33.10.02';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/8dd786e0-0807-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B33.12.03';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/f28e6770-0807-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B34.03.04';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/fbbfcba4-0807-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B34.04.03';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/141be99e-0808-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B34.06.03';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/1719ef1a-0808-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B34.06.04';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/38dd37b0-0808-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B34.09.03';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/54826ca6-0808-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B34.11.04';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/ba876fe2-0808-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B35.03.01';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/bd863a0c-0808-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B35.03.02';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/c38573dc-0808-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B35.03.04';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/c6af9858-0808-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B35.04.01';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/f211b198-0808-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B35.07.03';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/fe597e36-0808-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B35.08.03';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/048652fc-0809-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B35.09.01';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/4d3e0544-0809-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B35.15.01';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/5037271c-0809-11eb-8a43-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = 'CAU2-INV-B35.15.02';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau2_temp;
DROP TABLE IF EXISTS inverters_cau2_temp2;
CREATE TEMP TABLE inverters_cau2_temp(x jsonb);
CREATE TEMP TABLE inverters_cau2_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau2_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/                                    /events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau2_temp2 select f.* from inverters_cau2_temp, jsonb_populate_recordset(null::inverters_cau2_temp2, x) f;
UPDATE inverters_cau2_temp2 SET id = '                  ';
UPDATE inverters_cau2_temp2 SET cau = 'CAU2FV';
UPDATE inverters_cau2_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau2fv SELECT * from inverters_cau2_temp2 ON CONFLICT DO NOTHING;
