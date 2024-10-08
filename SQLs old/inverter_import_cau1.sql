
DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/e4866776-07f9-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A01.05.03';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/3a0c00e8-07fa-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A01.12.03';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/eeacacfa-07fa-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A02.10.02';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/2163ab1c-07fb-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A02.14.02';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/3ffba94e-07fb-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A02.16.04';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/d64e2c96-07fb-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A03.11.04';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/fdf1d388-07fb-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A03.15.01';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/100de5ca-07fc-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A03.16.03';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/d46442ac-07fc-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A04.15.02';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/e09e4d9c-07fc-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A04.16.02';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/04a15842-07fd-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A05.02.02';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/10bd89ca-07fd-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A05.03.02';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/36f5f5be-07fd-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A05.06.02';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/40c4822c-07fd-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A05.07.01';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/5a16b3da-07fd-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A05.09.01';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/b0c8e806-07fd-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A05.16.01';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/347d2a04-07fe-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A06.09.02';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/4705a61a-07fe-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A06.10.04';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/7ea08482-07fe-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A06.15.02';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/8ae229d0-07fe-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A06.16.02';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/313b6ecc-07ff-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A07.12.04';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/477cea30-07ff-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A07.14.03';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/fa78b77c-07ff-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A08.11.02';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/09d3fb5a-0800-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A08.12.03';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/a7923758-0800-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A09.08.02';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/0a177e9c-0801-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A09.16.01';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/a0ad8fae-0801-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A10.10.03';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/e19602b2-0801-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A10.15.04';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/054c77a4-0802-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A11.01.03';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/21955bec-0802-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A11.03.04';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/7bd17046-0802-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A11.11.01';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/b131ca2e-0802-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A11.15.02';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/bd90ea48-0802-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A11.16.02';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/3bb954b4-0803-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A12.09.03';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/6aa27c1a-0803-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A12.13.02';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/73df2a30-0803-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A12.14.01';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/e230ed38-0804-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A14.08.03';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/f25d032c-0804-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A14.09.04';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/054ce808-0805-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A14.11.02';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/b4b60180-0805-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A15.08.01';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/54686e02-0806-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A16.03.04';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/8c3f4eb8-0806-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A16.08.02';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/31eeaf02-0807-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A17.06.04';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/6a5bbe20-0807-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A17.11.02';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/933836ca-0807-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A17.14.03';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/9f8a2d2a-0807-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A17.15.03';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/abf91e0e-0807-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A17.16.03';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/e579c34a-0807-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A18.04.02';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/1d152ab0-0808-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A18.08.04';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/5dd48d34-0808-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A18.13.04';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/dc67ce86-0808-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A19.07.01';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/ff4601a2-0808-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A19.09.04';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/370fdc0c-0809-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A19.14.02';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/94970bca-0809-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A20.04.04';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/97d6a50c-0809-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A20.05.01';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/c9838c8c-0809-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A20.09.01';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/075b1b92-080a-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A20.14.01';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/84cef77e-080a-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A21.05.04';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/9a9890d8-080a-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A21.07.03';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/a8004ba8-080a-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A21.08.03';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/6b531270-080b-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A22.07.02';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/c4ff8466-080b-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A22.14.03';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/0242a45c-080c-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A23.02.03';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/937b01c6-080c-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A23.14.02';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/c52dd9d2-080c-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A24.01.02';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/e475a13e-080d-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A25.07.03';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/191b425e-080e-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A25.11.03';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/4a3a4470-080e-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A25.15.03';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/8bf84d12-080e-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A26.04.01';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/09aee004-080f-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A26.12.02';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/563242f4-080f-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A27.01.03';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/8da97770-080f-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A27.06.01';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/e16a295e-080f-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A27.12.04';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/fd45f0b8-080f-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A27.15.01';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/93fcf3bc-0810-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A28.10.02';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/d19a3bb2-0810-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A28.15.02';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/1d585dae-0811-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A29.04.02';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/51ce9bc0-0811-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A29.08.03';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/6aaa8ed8-0811-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A29.10.03';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/8468e90a-0811-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A29.12.03';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/93f561c8-0811-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A29.13.04';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/afac3022-0811-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A29.16.01';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/f7f7bf18-0811-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A30.05.01';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/9c08338a-0812-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A31.01.02';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/ca1730be-0812-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A31.05.01';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/dc4e5dca-0812-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A31.06.03';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/e5843694-0812-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A31.07.02';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/243ab53e-0813-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A31.12.02';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/501ec30c-0813-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A31.15.04';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/8ed13c74-0813-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A32.04.01';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/9b0fb0c4-0813-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A32.05.01';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/019a8eb8-0814-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A32.13.02';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/1a86b564-0814-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A32.15.02';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/2a366388-0814-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A32.16.03';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/a7ca490e-0814-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A33.07.03';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/b74da448-0814-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A33.08.04';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/cceb19ac-0814-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A33.10.03';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/e985684c-0814-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A33.12.04';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/051c2a78-0815-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A33.15.01';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/2e6cb51e-0815-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A34.01.03';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/5e557c3e-0815-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A34.05.02';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/6db85eee-0815-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A34.06.03';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/049538fa-0816-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A35.01.04';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/276a084c-0816-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A35.04.03';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/3d97b3bc-0816-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A35.06.02';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/470eef46-0816-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A35.07.01';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/8032ae70-0816-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A35.11.03';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau1_temp;
DROP TABLE IF EXISTS inverters_cau1_temp2;
CREATE TEMP TABLE inverters_cau1_temp(x jsonb);
CREATE TEMP TABLE inverters_cau1_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau1_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/a93a7564-0816-11eb-aeeb-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau1_temp2 select f.* from inverters_cau1_temp, jsonb_populate_recordset(null::inverters_cau1_temp2, x) f;
UPDATE inverters_cau1_temp2 SET id = 'CAU1-INV-A35.14.04';
UPDATE inverters_cau1_temp2 SET cau = 'CAU1FV';
UPDATE inverters_cau1_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau1fv SELECT * from inverters_cau1_temp2 ON CONFLICT DO NOTHING;

