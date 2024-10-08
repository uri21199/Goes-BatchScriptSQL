DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/7c6a8070-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C01.03.02';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/9445f8b4-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C01.05.02';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/dd6ddcc8-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C01.11.02';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/fb371dd2-07ed-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C01.13.04';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/95f8c6fe-07ee-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C02.09.04';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/e65a50d6-07ee-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C02.16.02';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/35748ac4-07ef-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C03.06.01';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/3b82d4a6-07f0-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C04.11.01';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/55d65e4a-07f0-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C04.13.02';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/9b9120a0-07f0-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C05.02.01';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/d44313c2-07f0-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C05.06.04';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/ebbb6f5e-07f0-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C05.08.04';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/20d9ec24-07f1-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C05.13.02';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/a4a344ec-07f1-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C06.07.03';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/de53c5d6-07f1-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C06.12.01';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/f002d2b8-07f1-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C06.13.03';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/7108f0d6-07f2-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C07.07.03';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/b81ff532-07f2-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C07.13.03';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/50c17df6-07f3-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C08.09.01';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/6b5ec358-07f3-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C08.11.02';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/e1084aa2-07f3-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C09.04.02';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/07acc26e-07f4-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C09.07.03';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/0dbb7e70-07f4-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C09.08.01';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/2b744032-07f4-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C09.10.03';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/3a67d090-07f4-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C09.11.04';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/b0dd8166-07f4-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C10.04.04';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/c5d7d5d0-07f4-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C10.06.03';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/eea8c0b4-07f4-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C10.09.04';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/720ab660-07f5-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C11.03.02';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/89ce11a2-07f5-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C11.05.02';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/9edd65d4-07f5-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C11.07.01';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/3b8202a0-07f6-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C12.03.02';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/8bc44796-07f6-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C12.10.01';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/052a85d2-07f7-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C13.03.02';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/1a60ee14-07f7-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C13.05.01';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/af7e3240-07f7-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C13.16.04';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/5eee2ef6-07f8-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C14.14.03';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/903096fc-07f8-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C15.01.04';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/963da56c-07f8-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C15.02.02';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/a7f6cedc-07f8-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C15.03.04';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/b0fc2446-07f8-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C15.04.03';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/b6f4f5d0-07f8-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C15.05.01';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/bccded9a-07f8-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C15.05.03';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/7ce9bb86-07f9-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C16.04.04';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/8eda689a-07f9-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C16.06.02';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/b01a4ffc-07f9-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C16.09.01';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/bef6157e-07f9-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C16.10.02';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/f4f5ffea-07f9-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C16.14.04';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/6d11fc2c-07fa-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C17.07.01';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/72f548ec-07fa-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C17.07.03';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/d53eb27c-07fa-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C17.15.04';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/3d1bd35c-07fb-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C18.07.03';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/4c4a153c-07fb-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C18.08.04';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/617df3d8-07fb-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C18.10.03';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/85a25b0a-07fb-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C18.13.03';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/176ea4da-07fc-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C19.12.01';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/32407446-07fc-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C19.14.02';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/660eb102-07fc-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C20.01.04';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/95f72ac0-07fc-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C20.05.04';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/c3346688-07fc-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C20.09.03';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/d8a1678c-07fc-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C20.11.02';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/fabc7c94-07fc-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C20.14.01';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/0c8125d8-07fd-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C20.15.03';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/1286ff3e-07fd-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C20.16.01';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/29aa3992-07fd-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C21.01.01';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/3c8d6a52-07fd-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C21.02.03';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/42ed961a-07fd-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C21.03.01';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/91a288ba-07fd-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C21.09.03';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/a737b0e2-07fd-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C21.11.02';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/c5575c1c-07fd-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C21.13.04';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/0d5a67ca-07fe-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C22.01.03';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/4e31a984-07fe-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C22.06.04';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/bcc2c478-07fe-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C22.15.04';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/378a20d4-07ff-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C23.09.01';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/8a76a7b8-07ff-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C23.15.04';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/a535a11c-07ff-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C24.01.01';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/d55ef118-07ff-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C24.04.04';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/f10e3090-07ff-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C24.07.01';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/030e5ce8-0800-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C24.08.03';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/79581844-0800-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C25.01.02';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/949d029a-0800-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C25.03.03';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/acdb94a2-0800-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C25.05.03';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/1a338e74-0801-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C25.14.02';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/2c5ac43c-0801-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C25.15.04';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/3865b340-0801-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C25.16.04';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/58921b54-0801-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C26.02.03';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/89c2889e-0801-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C26.06.03';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/1a223a4c-0802-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C27.01.02';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/325cf3a4-0802-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C27.03.02';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/47fa58c8-0802-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C27.05.01';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/074e2f2e-0803-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C28.02.01';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/34d77162-0803-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C28.05.04';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/90aa0de2-0803-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C28.13.02';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/abc710c0-0803-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C28.15.03';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/f9f48c50-0803-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C29.05.01';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/0f16a3e8-0804-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C29.06.04';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/187cb29c-0804-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C29.07.02';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/5b0ec97e-0804-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C29.12.04';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/a3a5a5cc-0804-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C30.01.04';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/37f4eac6-0805-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C30.13.04';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/77373338-0805-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C31.02.01';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/83d730c0-0805-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C31.03.01';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/8a7a73e2-0805-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C31.03.03';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/9dbb370c-0805-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C31.05.01';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/aa7d71c6-0805-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C31.06.01';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/c68bbecc-0805-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C31.08.02';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/cc8a6904-0805-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C31.08.04';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/93700a56-0806-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C32.08.01';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/c22c9d1e-0806-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C32.11.04';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/c8404624-0806-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C32.12.02';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/b7d3a1f4-0807-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C33.15.01';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/68d478ac-0808-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C34.12.03';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/c50d25d8-0808-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C35.01.01';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/2999d7d0-0809-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C35.09.02';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/41b15366-0809-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C35.11.02';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;


DROP TABLE IF EXISTS inverters_cau3_temp;
DROP TABLE IF EXISTS inverters_cau3_temp2;
CREATE TEMP TABLE inverters_cau3_temp(x jsonb);
CREATE TEMP TABLE inverters_cau3_temp2(date timestamptz, val numeric(10,4), id text, cau text);
COPY inverters_cau3_temp FROM PROGRAM 'curl "https://portal.unity.inaccess.com/ifms/sources/4799e324-0809-11eb-8564-42010afa015a/events?apiKey=38deaa51-8716-4cc9-aa42-ab14fb72a752.01"';
INSERT INTO inverters_cau3_temp2 select f.* from inverters_cau3_temp, jsonb_populate_recordset(null::inverters_cau3_temp2, x) f;
UPDATE inverters_cau3_temp2 SET id = 'CAU3-INV-C35.11.04';
UPDATE inverters_cau3_temp2 SET cau = 'CAU3FV';
UPDATE inverters_cau3_temp2 SET date = DATE_TRUNC('minute', date);
INSERT INTO inverters_cau3fv SELECT * from inverters_cau3_temp2 ON CONFLICT DO NOTHING;

