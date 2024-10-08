
DROP TABLE

IF EXISTS tmp_auto_po;
	CREATE TEMP TABLE tmp_auto_po (
		"Date Hour" timestamptz
		,"GRUPO" TEXT
		,"EGENERADA" NUMERIC
		,"EACREDITADA" NUMERIC
		,"EPOSIBLE" NUMERIC
		,"EPRONOSTICO" NUMERIC
		,"EVERTIDA" NUMERIC
		,"ETAKEORPAY" NUMERIC
		,DATE TEXT
		,hour INTEGER
		);

COPY tmp_auto_po("GRUPO", hour, "EGENERADA", "EACREDITADA", "EPOSIBLE", "EPRONOSTICO", "EVERTIDA", "ETAKEORPAY")
FROM 'C:\Users\Administrador\Desktop\POsept\er.csv' DELIMITER ',';

COPY tmp_auto_po("date")
FROM 'C:\Users\Administrador\Desktop\POsept\fecha.csv' DELIMITER ',';

UPDATE tmp_auto_po
SET DATE = datefix.DATE
FROM (
	SELECT DATE
	FROM tmp_auto_po
	WHERE "GRUPO" IS NULL
	) AS datefix;

ALTER TABLE tmp_auto_po

ALTER COLUMN DATE TYPE timestamptz USING to_timestamp (
	DATE
	,'YYYY-MM-DD hh24:mi:ss'
	);

DELETE
FROM tmp_auto_po
WHERE "GRUPO" IS NULL;

UPDATE tmp_auto_po
SET "Date Hour" = datefix.date2
FROM (
	SELECT "GRUPO"
		,hour
		,"EGENERADA"
		,DATE + interval '1 hour' * "hour" AS date2
	FROM tmp_auto_po
	) AS datefix
WHERE datefix."EGENERADA" = tmp_auto_po."EGENERADA"
	AND datefix.hour = tmp_auto_po.hour
	AND datefix."GRUPO" = tmp_auto_po."GRUPO";

ALTER TABLE tmp_auto_po

DROP COLUMN DATE
	,

DROP COLUMN hour;

INSERT INTO smec.po
SELECT "Date Hour"
	,"GRUPO"
	,"EGENERADA"
	,"EACREDITADA"
	,"EPOSIBLE"
	,"EPRONOSTICO"
	,"EVERTIDA"
	,"ETAKEORPAY"
FROM tmp_auto_po ON CONFLICT DO NOTHING;

INSERT INTO smec.po_general_renovables
SELECT "Date Hour"
	,"GRUPO"
	,"EGENERADA"
	,"EACREDITADA"
	,"EPOSIBLE"
	,"EPRONOSTICO"
	,"EVERTIDA"
	,"ETAKEORPAY"
FROM tmp_auto_po ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS tmp_auto_po;

CREATE TEMP TABLE tmp_auto_po (date_hour timestamptz
		,grupo TEXT
		,arl INTEGER
		,estado_ope TEXT
		,pi_sotr NUMERIC
		,arl_econ INTEGER
		,est_remun TEXT
		,energia NUMERIC
		,precio_nodo NUMERIC
		,pr_rem_energia NUMERIC
		,smec TEXT
		,pot_disp NUMERIC
		,pot_ope_cpo NUMERIC
		,compra_spot NUMERIC
		,sctd NUMERIC
		,sco NUMERIC
		,pind NUMERIC
		,pindprog NUMERIC
		,pindforz NUMERIC
		,date text
		,hour integer);

COPY tmp_auto_po(
		grupo
		,hour
		,arl 
		,estado_ope 
		,pi_sotr 
		,arl_econ 
		,est_remun 
		,energia 
		,precio_nodo 
		,pr_rem_energia 
		,smec 
		,pot_disp 
		,pot_ope_cpo 
		,compra_spot 
		,sctd 
		,sco 
		,pind 
		,pindprog 
		,pindforz) 
FROM 'C:\Users\Administrador\Desktop\POsept\vg.csv' DELIMITER ',' NULL AS '';

COPY tmp_auto_po("date")
FROM 'C:\Users\Administrador\Desktop\POsept\fecha.csv' DELIMITER ',';

UPDATE tmp_auto_po
SET DATE = datefix.DATE
FROM (
	SELECT DATE
	FROM tmp_auto_po
	WHERE grupo IS NULL
	) AS datefix;

ALTER TABLE tmp_auto_po

ALTER COLUMN DATE TYPE timestamptz USING to_timestamp (
	DATE
	,'YYYY-MM-DD hh24:mi:ss'
	);

DELETE FROM tmp_auto_po WHERE grupo IS NULL;

UPDATE tmp_auto_po
SET date_hour = datefix.date2
FROM (
	SELECT grupo
		,hour
		,compra_spot
		,DATE + interval '1 hour' * "hour" AS date2
	FROM tmp_auto_po
	) AS datefix
WHERE datefix.compra_spot = tmp_auto_po.compra_spot
	AND datefix.hour = tmp_auto_po.hour
	AND datefix.grupo = tmp_auto_po.grupo;

ALTER TABLE tmp_auto_po DROP COLUMN DATE, DROP COLUMN hour;

UPDATE smec.po
SET "EIMPORTADA" = tmp_auto_po.compra_spot
FROM (
	SELECT grupo
		,date_hour
		,compra_spot
	FROM tmp_auto_po
	) AS tmp_auto_po
WHERE tmp_auto_po.grupo = po."GRUPO"
	AND tmp_auto_po.date_hour = po."Date Hour";

UPDATE smec.po
SET pot_disp = tmp_auto_po.pot_disp
FROM (
	SELECT grupo
		,date_hour
		,pot_disp
	FROM tmp_auto_po
	) AS tmp_auto_po
WHERE tmp_auto_po.grupo = po."GRUPO"
	AND tmp_auto_po.date_hour = po."Date Hour";

INSERT INTO smec.valores_generadores SELECT date_hour 
		,grupo 
		,arl 
		,estado_ope 
		,pi_sotr 
		,arl_econ 
		,est_remun 
		,energia 
		,precio_nodo 
		,pr_rem_energia 
		,smec 
		,pot_disp 
		,pot_ope_cpo 
		,compra_spot 
		,sctd 
		,sco 
		,pind 
		,pindprog 
		,pindforz 
		FROM tmp_auto_po ON CONFLICT DO NOTHING;


DROP TABLE

IF EXISTS tmp_auto_po;
	CREATE TEMP TABLE tmp_auto_po (
		"Date Hour" timestamptz
		,"GRUPO" TEXT
		,"EGENERADA" NUMERIC
		,"EACREDITADA" NUMERIC
		,"EPOSIBLE" NUMERIC
		,"EPRONOSTICO" NUMERIC
		,"EVERTIDA" NUMERIC
		,"ETAKEORPAY" NUMERIC
		,DATE TEXT
		,hour INTEGER
		);

COPY tmp_auto_po("GRUPO", hour, "EGENERADA", "EACREDITADA", "EPOSIBLE", "EPRONOSTICO", "EVERTIDA", "ETAKEORPAY")
FROM 'C:\Users\Administrador\Desktop\POsept\er1.csv' DELIMITER ',';

COPY tmp_auto_po("date")
FROM 'C:\Users\Administrador\Desktop\POsept\fecha1.csv' DELIMITER ',';

UPDATE tmp_auto_po
SET DATE = datefix.DATE
FROM (
	SELECT DATE
	FROM tmp_auto_po
	WHERE "GRUPO" IS NULL
	) AS datefix;

ALTER TABLE tmp_auto_po

ALTER COLUMN DATE TYPE timestamptz USING to_timestamp (
	DATE
	,'YYYY-MM-DD hh24:mi:ss'
	);

DELETE
FROM tmp_auto_po
WHERE "GRUPO" IS NULL;

UPDATE tmp_auto_po
SET "Date Hour" = datefix.date2
FROM (
	SELECT "GRUPO"
		,hour
		,"EGENERADA"
		,DATE + interval '1 hour' * "hour" AS date2
	FROM tmp_auto_po
	) AS datefix
WHERE datefix."EGENERADA" = tmp_auto_po."EGENERADA"
	AND datefix.hour = tmp_auto_po.hour
	AND datefix."GRUPO" = tmp_auto_po."GRUPO";

ALTER TABLE tmp_auto_po

DROP COLUMN DATE
	,

DROP COLUMN hour;

INSERT INTO smec.po
SELECT "Date Hour"
	,"GRUPO"
	,"EGENERADA"
	,"EACREDITADA"
	,"EPOSIBLE"
	,"EPRONOSTICO"
	,"EVERTIDA"
	,"ETAKEORPAY"
FROM tmp_auto_po ON CONFLICT DO NOTHING;

INSERT INTO smec.po_general_renovables
SELECT "Date Hour"
	,"GRUPO"
	,"EGENERADA"
	,"EACREDITADA"
	,"EPOSIBLE"
	,"EPRONOSTICO"
	,"EVERTIDA"
	,"ETAKEORPAY"
FROM tmp_auto_po ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS tmp_auto_po;

CREATE TEMP TABLE tmp_auto_po (date_hour timestamptz
		,grupo TEXT
		,arl INTEGER
		,estado_ope TEXT
		,pi_sotr NUMERIC
		,arl_econ INTEGER
		,est_remun TEXT
		,energia NUMERIC
		,precio_nodo NUMERIC
		,pr_rem_energia NUMERIC
		,smec TEXT
		,pot_disp NUMERIC
		,pot_ope_cpo NUMERIC
		,compra_spot NUMERIC
		,sctd NUMERIC
		,sco NUMERIC
		,pind NUMERIC
		,pindprog NUMERIC
		,pindforz NUMERIC
		,date text
		,hour integer);

COPY tmp_auto_po(
		grupo
		,hour
		,arl 
		,estado_ope 
		,pi_sotr 
		,arl_econ 
		,est_remun 
		,energia 
		,precio_nodo 
		,pr_rem_energia 
		,smec 
		,pot_disp 
		,pot_ope_cpo 
		,compra_spot 
		,sctd 
		,sco 
		,pind 
		,pindprog 
		,pindforz) 
FROM 'C:\Users\Administrador\Desktop\POsept\vg1.csv' DELIMITER ',' NULL AS '';

COPY tmp_auto_po("date")
FROM 'C:\Users\Administrador\Desktop\POsept\fecha1.csv' DELIMITER ',';

UPDATE tmp_auto_po
SET DATE = datefix.DATE
FROM (
	SELECT DATE
	FROM tmp_auto_po
	WHERE grupo IS NULL
	) AS datefix;

ALTER TABLE tmp_auto_po

ALTER COLUMN DATE TYPE timestamptz USING to_timestamp (
	DATE
	,'YYYY-MM-DD hh24:mi:ss'
	);

DELETE FROM tmp_auto_po WHERE grupo IS NULL;

UPDATE tmp_auto_po
SET date_hour = datefix.date2
FROM (
	SELECT grupo
		,hour
		,compra_spot
		,DATE + interval '1 hour' * "hour" AS date2
	FROM tmp_auto_po
	) AS datefix
WHERE datefix.compra_spot = tmp_auto_po.compra_spot
	AND datefix.hour = tmp_auto_po.hour
	AND datefix.grupo = tmp_auto_po.grupo;

ALTER TABLE tmp_auto_po DROP COLUMN DATE, DROP COLUMN hour;

UPDATE smec.po
SET "EIMPORTADA" = tmp_auto_po.compra_spot
FROM (
	SELECT grupo
		,date_hour
		,compra_spot
	FROM tmp_auto_po
	) AS tmp_auto_po
WHERE tmp_auto_po.grupo = po."GRUPO"
	AND tmp_auto_po.date_hour = po."Date Hour";

UPDATE smec.po
SET pot_disp = tmp_auto_po.pot_disp
FROM (
	SELECT grupo
		,date_hour
		,pot_disp
	FROM tmp_auto_po
	) AS tmp_auto_po
WHERE tmp_auto_po.grupo = po."GRUPO"
	AND tmp_auto_po.date_hour = po."Date Hour";

INSERT INTO smec.valores_generadores SELECT date_hour 
		,grupo 
		,arl 
		,estado_ope 
		,pi_sotr 
		,arl_econ 
		,est_remun 
		,energia 
		,precio_nodo 
		,pr_rem_energia 
		,smec 
		,pot_disp 
		,pot_ope_cpo 
		,compra_spot 
		,sctd 
		,sco 
		,pind 
		,pindprog 
		,pindforz 
		FROM tmp_auto_po ON CONFLICT DO NOTHING;


DROP TABLE

IF EXISTS tmp_auto_po;
	CREATE TEMP TABLE tmp_auto_po (
		"Date Hour" timestamptz
		,"GRUPO" TEXT
		,"EGENERADA" NUMERIC
		,"EACREDITADA" NUMERIC
		,"EPOSIBLE" NUMERIC
		,"EPRONOSTICO" NUMERIC
		,"EVERTIDA" NUMERIC
		,"ETAKEORPAY" NUMERIC
		,DATE TEXT
		,hour INTEGER
		);

COPY tmp_auto_po("GRUPO", hour, "EGENERADA", "EACREDITADA", "EPOSIBLE", "EPRONOSTICO", "EVERTIDA", "ETAKEORPAY")
FROM 'C:\Users\Administrador\Desktop\POsept\er2.csv' DELIMITER ',';

COPY tmp_auto_po("date")
FROM 'C:\Users\Administrador\Desktop\POsept\fecha2.csv' DELIMITER ',';

UPDATE tmp_auto_po
SET DATE = datefix.DATE
FROM (
	SELECT DATE
	FROM tmp_auto_po
	WHERE "GRUPO" IS NULL
	) AS datefix;

ALTER TABLE tmp_auto_po

ALTER COLUMN DATE TYPE timestamptz USING to_timestamp (
	DATE
	,'YYYY-MM-DD hh24:mi:ss'
	);

DELETE
FROM tmp_auto_po
WHERE "GRUPO" IS NULL;

UPDATE tmp_auto_po
SET "Date Hour" = datefix.date2
FROM (
	SELECT "GRUPO"
		,hour
		,"EGENERADA"
		,DATE + interval '1 hour' * "hour" AS date2
	FROM tmp_auto_po
	) AS datefix
WHERE datefix."EGENERADA" = tmp_auto_po."EGENERADA"
	AND datefix.hour = tmp_auto_po.hour
	AND datefix."GRUPO" = tmp_auto_po."GRUPO";

ALTER TABLE tmp_auto_po

DROP COLUMN DATE
	,

DROP COLUMN hour;

INSERT INTO smec.po
SELECT "Date Hour"
	,"GRUPO"
	,"EGENERADA"
	,"EACREDITADA"
	,"EPOSIBLE"
	,"EPRONOSTICO"
	,"EVERTIDA"
	,"ETAKEORPAY"
FROM tmp_auto_po ON CONFLICT DO NOTHING;

INSERT INTO smec.po_general_renovables
SELECT "Date Hour"
	,"GRUPO"
	,"EGENERADA"
	,"EACREDITADA"
	,"EPOSIBLE"
	,"EPRONOSTICO"
	,"EVERTIDA"
	,"ETAKEORPAY"
FROM tmp_auto_po ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS tmp_auto_po;

CREATE TEMP TABLE tmp_auto_po (date_hour timestamptz
		,grupo TEXT
		,arl INTEGER
		,estado_ope TEXT
		,pi_sotr NUMERIC
		,arl_econ INTEGER
		,est_remun TEXT
		,energia NUMERIC
		,precio_nodo NUMERIC
		,pr_rem_energia NUMERIC
		,smec TEXT
		,pot_disp NUMERIC
		,pot_ope_cpo NUMERIC
		,compra_spot NUMERIC
		,sctd NUMERIC
		,sco NUMERIC
		,pind NUMERIC
		,pindprog NUMERIC
		,pindforz NUMERIC
		,date text
		,hour integer);

COPY tmp_auto_po(
		grupo
		,hour
		,arl 
		,estado_ope 
		,pi_sotr 
		,arl_econ 
		,est_remun 
		,energia 
		,precio_nodo 
		,pr_rem_energia 
		,smec 
		,pot_disp 
		,pot_ope_cpo 
		,compra_spot 
		,sctd 
		,sco 
		,pind 
		,pindprog 
		,pindforz) 
FROM 'C:\Users\Administrador\Desktop\POsept\vg2.csv' DELIMITER ',' NULL AS '';

COPY tmp_auto_po("date")
FROM 'C:\Users\Administrador\Desktop\POsept\fecha2.csv' DELIMITER ',';

UPDATE tmp_auto_po
SET DATE = datefix.DATE
FROM (
	SELECT DATE
	FROM tmp_auto_po
	WHERE grupo IS NULL
	) AS datefix;

ALTER TABLE tmp_auto_po

ALTER COLUMN DATE TYPE timestamptz USING to_timestamp (
	DATE
	,'YYYY-MM-DD hh24:mi:ss'
	);

DELETE FROM tmp_auto_po WHERE grupo IS NULL;

UPDATE tmp_auto_po
SET date_hour = datefix.date2
FROM (
	SELECT grupo
		,hour
		,compra_spot
		,DATE + interval '1 hour' * "hour" AS date2
	FROM tmp_auto_po
	) AS datefix
WHERE datefix.compra_spot = tmp_auto_po.compra_spot
	AND datefix.hour = tmp_auto_po.hour
	AND datefix.grupo = tmp_auto_po.grupo;

ALTER TABLE tmp_auto_po DROP COLUMN DATE, DROP COLUMN hour;

UPDATE smec.po
SET "EIMPORTADA" = tmp_auto_po.compra_spot
FROM (
	SELECT grupo
		,date_hour
		,compra_spot
	FROM tmp_auto_po
	) AS tmp_auto_po
WHERE tmp_auto_po.grupo = po."GRUPO"
	AND tmp_auto_po.date_hour = po."Date Hour";

UPDATE smec.po
SET pot_disp = tmp_auto_po.pot_disp
FROM (
	SELECT grupo
		,date_hour
		,pot_disp
	FROM tmp_auto_po
	) AS tmp_auto_po
WHERE tmp_auto_po.grupo = po."GRUPO"
	AND tmp_auto_po.date_hour = po."Date Hour";

INSERT INTO smec.valores_generadores SELECT date_hour 
		,grupo 
		,arl 
		,estado_ope 
		,pi_sotr 
		,arl_econ 
		,est_remun 
		,energia 
		,precio_nodo 
		,pr_rem_energia 
		,smec 
		,pot_disp 
		,pot_ope_cpo 
		,compra_spot 
		,sctd 
		,sco 
		,pind 
		,pindprog 
		,pindforz 
		FROM tmp_auto_po ON CONFLICT DO NOTHING;


DROP TABLE

IF EXISTS tmp_auto_po;
	CREATE TEMP TABLE tmp_auto_po (
		"Date Hour" timestamptz
		,"GRUPO" TEXT
		,"EGENERADA" NUMERIC
		,"EACREDITADA" NUMERIC
		,"EPOSIBLE" NUMERIC
		,"EPRONOSTICO" NUMERIC
		,"EVERTIDA" NUMERIC
		,"ETAKEORPAY" NUMERIC
		,DATE TEXT
		,hour INTEGER
		);

COPY tmp_auto_po("GRUPO", hour, "EGENERADA", "EACREDITADA", "EPOSIBLE", "EPRONOSTICO", "EVERTIDA", "ETAKEORPAY")
FROM 'C:\Users\Administrador\Desktop\POsept\er3.csv' DELIMITER ',';

COPY tmp_auto_po("date")
FROM 'C:\Users\Administrador\Desktop\POsept\fecha3.csv' DELIMITER ',';

UPDATE tmp_auto_po
SET DATE = datefix.DATE
FROM (
	SELECT DATE
	FROM tmp_auto_po
	WHERE "GRUPO" IS NULL
	) AS datefix;

ALTER TABLE tmp_auto_po

ALTER COLUMN DATE TYPE timestamptz USING to_timestamp (
	DATE
	,'YYYY-MM-DD hh24:mi:ss'
	);

DELETE
FROM tmp_auto_po
WHERE "GRUPO" IS NULL;

UPDATE tmp_auto_po
SET "Date Hour" = datefix.date2
FROM (
	SELECT "GRUPO"
		,hour
		,"EGENERADA"
		,DATE + interval '1 hour' * "hour" AS date2
	FROM tmp_auto_po
	) AS datefix
WHERE datefix."EGENERADA" = tmp_auto_po."EGENERADA"
	AND datefix.hour = tmp_auto_po.hour
	AND datefix."GRUPO" = tmp_auto_po."GRUPO";

ALTER TABLE tmp_auto_po

DROP COLUMN DATE
	,

DROP COLUMN hour;

INSERT INTO smec.po
SELECT "Date Hour"
	,"GRUPO"
	,"EGENERADA"
	,"EACREDITADA"
	,"EPOSIBLE"
	,"EPRONOSTICO"
	,"EVERTIDA"
	,"ETAKEORPAY"
FROM tmp_auto_po ON CONFLICT DO NOTHING;

INSERT INTO smec.po_general_renovables
SELECT "Date Hour"
	,"GRUPO"
	,"EGENERADA"
	,"EACREDITADA"
	,"EPOSIBLE"
	,"EPRONOSTICO"
	,"EVERTIDA"
	,"ETAKEORPAY"
FROM tmp_auto_po ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS tmp_auto_po;

CREATE TEMP TABLE tmp_auto_po (date_hour timestamptz
		,grupo TEXT
		,arl INTEGER
		,estado_ope TEXT
		,pi_sotr NUMERIC
		,arl_econ INTEGER
		,est_remun TEXT
		,energia NUMERIC
		,precio_nodo NUMERIC
		,pr_rem_energia NUMERIC
		,smec TEXT
		,pot_disp NUMERIC
		,pot_ope_cpo NUMERIC
		,compra_spot NUMERIC
		,sctd NUMERIC
		,sco NUMERIC
		,pind NUMERIC
		,pindprog NUMERIC
		,pindforz NUMERIC
		,date text
		,hour integer);

COPY tmp_auto_po(
		grupo
		,hour
		,arl 
		,estado_ope 
		,pi_sotr 
		,arl_econ 
		,est_remun 
		,energia 
		,precio_nodo 
		,pr_rem_energia 
		,smec 
		,pot_disp 
		,pot_ope_cpo 
		,compra_spot 
		,sctd 
		,sco 
		,pind 
		,pindprog 
		,pindforz) 
FROM 'C:\Users\Administrador\Desktop\POsept\vg3.csv' DELIMITER ',' NULL AS '';

COPY tmp_auto_po("date")
FROM 'C:\Users\Administrador\Desktop\POsept\fecha3.csv' DELIMITER ',';

UPDATE tmp_auto_po
SET DATE = datefix.DATE
FROM (
	SELECT DATE
	FROM tmp_auto_po
	WHERE grupo IS NULL
	) AS datefix;

ALTER TABLE tmp_auto_po

ALTER COLUMN DATE TYPE timestamptz USING to_timestamp (
	DATE
	,'YYYY-MM-DD hh24:mi:ss'
	);

DELETE FROM tmp_auto_po WHERE grupo IS NULL;

UPDATE tmp_auto_po
SET date_hour = datefix.date2
FROM (
	SELECT grupo
		,hour
		,compra_spot
		,DATE + interval '1 hour' * "hour" AS date2
	FROM tmp_auto_po
	) AS datefix
WHERE datefix.compra_spot = tmp_auto_po.compra_spot
	AND datefix.hour = tmp_auto_po.hour
	AND datefix.grupo = tmp_auto_po.grupo;

ALTER TABLE tmp_auto_po DROP COLUMN DATE, DROP COLUMN hour;

UPDATE smec.po
SET "EIMPORTADA" = tmp_auto_po.compra_spot
FROM (
	SELECT grupo
		,date_hour
		,compra_spot
	FROM tmp_auto_po
	) AS tmp_auto_po
WHERE tmp_auto_po.grupo = po."GRUPO"
	AND tmp_auto_po.date_hour = po."Date Hour";

UPDATE smec.po
SET pot_disp = tmp_auto_po.pot_disp
FROM (
	SELECT grupo
		,date_hour
		,pot_disp
	FROM tmp_auto_po
	) AS tmp_auto_po
WHERE tmp_auto_po.grupo = po."GRUPO"
	AND tmp_auto_po.date_hour = po."Date Hour";

INSERT INTO smec.valores_generadores SELECT date_hour 
		,grupo 
		,arl 
		,estado_ope 
		,pi_sotr 
		,arl_econ 
		,est_remun 
		,energia 
		,precio_nodo 
		,pr_rem_energia 
		,smec 
		,pot_disp 
		,pot_ope_cpo 
		,compra_spot 
		,sctd 
		,sco 
		,pind 
		,pindprog 
		,pindforz 
		FROM tmp_auto_po ON CONFLICT DO NOTHING;


DROP TABLE

IF EXISTS tmp_auto_po;
	CREATE TEMP TABLE tmp_auto_po (
		"Date Hour" timestamptz
		,"GRUPO" TEXT
		,"EGENERADA" NUMERIC
		,"EACREDITADA" NUMERIC
		,"EPOSIBLE" NUMERIC
		,"EPRONOSTICO" NUMERIC
		,"EVERTIDA" NUMERIC
		,"ETAKEORPAY" NUMERIC
		,DATE TEXT
		,hour INTEGER
		);

COPY tmp_auto_po("GRUPO", hour, "EGENERADA", "EACREDITADA", "EPOSIBLE", "EPRONOSTICO", "EVERTIDA", "ETAKEORPAY")
FROM 'C:\Users\Administrador\Desktop\POsept\er4.csv' DELIMITER ',';

COPY tmp_auto_po("date")
FROM 'C:\Users\Administrador\Desktop\POsept\fecha4.csv' DELIMITER ',';

UPDATE tmp_auto_po
SET DATE = datefix.DATE
FROM (
	SELECT DATE
	FROM tmp_auto_po
	WHERE "GRUPO" IS NULL
	) AS datefix;

ALTER TABLE tmp_auto_po

ALTER COLUMN DATE TYPE timestamptz USING to_timestamp (
	DATE
	,'YYYY-MM-DD hh24:mi:ss'
	);

DELETE
FROM tmp_auto_po
WHERE "GRUPO" IS NULL;

UPDATE tmp_auto_po
SET "Date Hour" = datefix.date2
FROM (
	SELECT "GRUPO"
		,hour
		,"EGENERADA"
		,DATE + interval '1 hour' * "hour" AS date2
	FROM tmp_auto_po
	) AS datefix
WHERE datefix."EGENERADA" = tmp_auto_po."EGENERADA"
	AND datefix.hour = tmp_auto_po.hour
	AND datefix."GRUPO" = tmp_auto_po."GRUPO";

ALTER TABLE tmp_auto_po

DROP COLUMN DATE
	,

DROP COLUMN hour;

INSERT INTO smec.po
SELECT "Date Hour"
	,"GRUPO"
	,"EGENERADA"
	,"EACREDITADA"
	,"EPOSIBLE"
	,"EPRONOSTICO"
	,"EVERTIDA"
	,"ETAKEORPAY"
FROM tmp_auto_po ON CONFLICT DO NOTHING;

INSERT INTO smec.po_general_renovables
SELECT "Date Hour"
	,"GRUPO"
	,"EGENERADA"
	,"EACREDITADA"
	,"EPOSIBLE"
	,"EPRONOSTICO"
	,"EVERTIDA"
	,"ETAKEORPAY"
FROM tmp_auto_po ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS tmp_auto_po;

CREATE TEMP TABLE tmp_auto_po (date_hour timestamptz
		,grupo TEXT
		,arl INTEGER
		,estado_ope TEXT
		,pi_sotr NUMERIC
		,arl_econ INTEGER
		,est_remun TEXT
		,energia NUMERIC
		,precio_nodo NUMERIC
		,pr_rem_energia NUMERIC
		,smec TEXT
		,pot_disp NUMERIC
		,pot_ope_cpo NUMERIC
		,compra_spot NUMERIC
		,sctd NUMERIC
		,sco NUMERIC
		,pind NUMERIC
		,pindprog NUMERIC
		,pindforz NUMERIC
		,date text
		,hour integer);

COPY tmp_auto_po(
		grupo
		,hour
		,arl 
		,estado_ope 
		,pi_sotr 
		,arl_econ 
		,est_remun 
		,energia 
		,precio_nodo 
		,pr_rem_energia 
		,smec 
		,pot_disp 
		,pot_ope_cpo 
		,compra_spot 
		,sctd 
		,sco 
		,pind 
		,pindprog 
		,pindforz) 
FROM 'C:\Users\Administrador\Desktop\POsept\vg4.csv' DELIMITER ',' NULL AS '';

COPY tmp_auto_po("date")
FROM 'C:\Users\Administrador\Desktop\POsept\fecha4.csv' DELIMITER ',';

UPDATE tmp_auto_po
SET DATE = datefix.DATE
FROM (
	SELECT DATE
	FROM tmp_auto_po
	WHERE grupo IS NULL
	) AS datefix;

ALTER TABLE tmp_auto_po

ALTER COLUMN DATE TYPE timestamptz USING to_timestamp (
	DATE
	,'YYYY-MM-DD hh24:mi:ss'
	);

DELETE FROM tmp_auto_po WHERE grupo IS NULL;

UPDATE tmp_auto_po
SET date_hour = datefix.date2
FROM (
	SELECT grupo
		,hour
		,compra_spot
		,DATE + interval '1 hour' * "hour" AS date2
	FROM tmp_auto_po
	) AS datefix
WHERE datefix.compra_spot = tmp_auto_po.compra_spot
	AND datefix.hour = tmp_auto_po.hour
	AND datefix.grupo = tmp_auto_po.grupo;

ALTER TABLE tmp_auto_po DROP COLUMN DATE, DROP COLUMN hour;

UPDATE smec.po
SET "EIMPORTADA" = tmp_auto_po.compra_spot
FROM (
	SELECT grupo
		,date_hour
		,compra_spot
	FROM tmp_auto_po
	) AS tmp_auto_po
WHERE tmp_auto_po.grupo = po."GRUPO"
	AND tmp_auto_po.date_hour = po."Date Hour";

UPDATE smec.po
SET pot_disp = tmp_auto_po.pot_disp
FROM (
	SELECT grupo
		,date_hour
		,pot_disp
	FROM tmp_auto_po
	) AS tmp_auto_po
WHERE tmp_auto_po.grupo = po."GRUPO"
	AND tmp_auto_po.date_hour = po."Date Hour";

INSERT INTO smec.valores_generadores SELECT date_hour 
		,grupo 
		,arl 
		,estado_ope 
		,pi_sotr 
		,arl_econ 
		,est_remun 
		,energia 
		,precio_nodo 
		,pr_rem_energia 
		,smec 
		,pot_disp 
		,pot_ope_cpo 
		,compra_spot 
		,sctd 
		,sco 
		,pind 
		,pindprog 
		,pindforz 
		FROM tmp_auto_po ON CONFLICT DO NOTHING;


DROP TABLE

IF EXISTS tmp_auto_po;
	CREATE TEMP TABLE tmp_auto_po (
		"Date Hour" timestamptz
		,"GRUPO" TEXT
		,"EGENERADA" NUMERIC
		,"EACREDITADA" NUMERIC
		,"EPOSIBLE" NUMERIC
		,"EPRONOSTICO" NUMERIC
		,"EVERTIDA" NUMERIC
		,"ETAKEORPAY" NUMERIC
		,DATE TEXT
		,hour INTEGER
		);

COPY tmp_auto_po("GRUPO", hour, "EGENERADA", "EACREDITADA", "EPOSIBLE", "EPRONOSTICO", "EVERTIDA", "ETAKEORPAY")
FROM 'C:\Users\Administrador\Desktop\POsept\er5.csv' DELIMITER ',';

COPY tmp_auto_po("date")
FROM 'C:\Users\Administrador\Desktop\POsept\fecha5.csv' DELIMITER ',';

UPDATE tmp_auto_po
SET DATE = datefix.DATE
FROM (
	SELECT DATE
	FROM tmp_auto_po
	WHERE "GRUPO" IS NULL
	) AS datefix;

ALTER TABLE tmp_auto_po

ALTER COLUMN DATE TYPE timestamptz USING to_timestamp (
	DATE
	,'YYYY-MM-DD hh24:mi:ss'
	);

DELETE
FROM tmp_auto_po
WHERE "GRUPO" IS NULL;

UPDATE tmp_auto_po
SET "Date Hour" = datefix.date2
FROM (
	SELECT "GRUPO"
		,hour
		,"EGENERADA"
		,DATE + interval '1 hour' * "hour" AS date2
	FROM tmp_auto_po
	) AS datefix
WHERE datefix."EGENERADA" = tmp_auto_po."EGENERADA"
	AND datefix.hour = tmp_auto_po.hour
	AND datefix."GRUPO" = tmp_auto_po."GRUPO";

ALTER TABLE tmp_auto_po

DROP COLUMN DATE
	,

DROP COLUMN hour;

INSERT INTO smec.po
SELECT "Date Hour"
	,"GRUPO"
	,"EGENERADA"
	,"EACREDITADA"
	,"EPOSIBLE"
	,"EPRONOSTICO"
	,"EVERTIDA"
	,"ETAKEORPAY"
FROM tmp_auto_po ON CONFLICT DO NOTHING;

INSERT INTO smec.po_general_renovables
SELECT "Date Hour"
	,"GRUPO"
	,"EGENERADA"
	,"EACREDITADA"
	,"EPOSIBLE"
	,"EPRONOSTICO"
	,"EVERTIDA"
	,"ETAKEORPAY"
FROM tmp_auto_po ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS tmp_auto_po;

CREATE TEMP TABLE tmp_auto_po (date_hour timestamptz
		,grupo TEXT
		,arl INTEGER
		,estado_ope TEXT
		,pi_sotr NUMERIC
		,arl_econ INTEGER
		,est_remun TEXT
		,energia NUMERIC
		,precio_nodo NUMERIC
		,pr_rem_energia NUMERIC
		,smec TEXT
		,pot_disp NUMERIC
		,pot_ope_cpo NUMERIC
		,compra_spot NUMERIC
		,sctd NUMERIC
		,sco NUMERIC
		,pind NUMERIC
		,pindprog NUMERIC
		,pindforz NUMERIC
		,date text
		,hour integer);

COPY tmp_auto_po(
		grupo
		,hour
		,arl 
		,estado_ope 
		,pi_sotr 
		,arl_econ 
		,est_remun 
		,energia 
		,precio_nodo 
		,pr_rem_energia 
		,smec 
		,pot_disp 
		,pot_ope_cpo 
		,compra_spot 
		,sctd 
		,sco 
		,pind 
		,pindprog 
		,pindforz) 
FROM 'C:\Users\Administrador\Desktop\POsept\vg5.csv' DELIMITER ',' NULL AS '';

COPY tmp_auto_po("date")
FROM 'C:\Users\Administrador\Desktop\POsept\fecha5.csv' DELIMITER ',';

UPDATE tmp_auto_po
SET DATE = datefix.DATE
FROM (
	SELECT DATE
	FROM tmp_auto_po
	WHERE grupo IS NULL
	) AS datefix;

ALTER TABLE tmp_auto_po

ALTER COLUMN DATE TYPE timestamptz USING to_timestamp (
	DATE
	,'YYYY-MM-DD hh24:mi:ss'
	);

DELETE FROM tmp_auto_po WHERE grupo IS NULL;

UPDATE tmp_auto_po
SET date_hour = datefix.date2
FROM (
	SELECT grupo
		,hour
		,compra_spot
		,DATE + interval '1 hour' * "hour" AS date2
	FROM tmp_auto_po
	) AS datefix
WHERE datefix.compra_spot = tmp_auto_po.compra_spot
	AND datefix.hour = tmp_auto_po.hour
	AND datefix.grupo = tmp_auto_po.grupo;

ALTER TABLE tmp_auto_po DROP COLUMN DATE, DROP COLUMN hour;

UPDATE smec.po
SET "EIMPORTADA" = tmp_auto_po.compra_spot
FROM (
	SELECT grupo
		,date_hour
		,compra_spot
	FROM tmp_auto_po
	) AS tmp_auto_po
WHERE tmp_auto_po.grupo = po."GRUPO"
	AND tmp_auto_po.date_hour = po."Date Hour";

UPDATE smec.po
SET pot_disp = tmp_auto_po.pot_disp
FROM (
	SELECT grupo
		,date_hour
		,pot_disp
	FROM tmp_auto_po
	) AS tmp_auto_po
WHERE tmp_auto_po.grupo = po."GRUPO"
	AND tmp_auto_po.date_hour = po."Date Hour";

INSERT INTO smec.valores_generadores SELECT date_hour 
		,grupo 
		,arl 
		,estado_ope 
		,pi_sotr 
		,arl_econ 
		,est_remun 
		,energia 
		,precio_nodo 
		,pr_rem_energia 
		,smec 
		,pot_disp 
		,pot_ope_cpo 
		,compra_spot 
		,sctd 
		,sco 
		,pind 
		,pindprog 
		,pindforz 
		FROM tmp_auto_po ON CONFLICT DO NOTHING;


DROP TABLE

IF EXISTS tmp_auto_po;
	CREATE TEMP TABLE tmp_auto_po (
		"Date Hour" timestamptz
		,"GRUPO" TEXT
		,"EGENERADA" NUMERIC
		,"EACREDITADA" NUMERIC
		,"EPOSIBLE" NUMERIC
		,"EPRONOSTICO" NUMERIC
		,"EVERTIDA" NUMERIC
		,"ETAKEORPAY" NUMERIC
		,DATE TEXT
		,hour INTEGER
		);

COPY tmp_auto_po("GRUPO", hour, "EGENERADA", "EACREDITADA", "EPOSIBLE", "EPRONOSTICO", "EVERTIDA", "ETAKEORPAY")
FROM 'C:\Users\Administrador\Desktop\POsept\er6.csv' DELIMITER ',';

COPY tmp_auto_po("date")
FROM 'C:\Users\Administrador\Desktop\POsept\fecha6.csv' DELIMITER ',';

UPDATE tmp_auto_po
SET DATE = datefix.DATE
FROM (
	SELECT DATE
	FROM tmp_auto_po
	WHERE "GRUPO" IS NULL
	) AS datefix;

ALTER TABLE tmp_auto_po

ALTER COLUMN DATE TYPE timestamptz USING to_timestamp (
	DATE
	,'YYYY-MM-DD hh24:mi:ss'
	);

DELETE
FROM tmp_auto_po
WHERE "GRUPO" IS NULL;

UPDATE tmp_auto_po
SET "Date Hour" = datefix.date2
FROM (
	SELECT "GRUPO"
		,hour
		,"EGENERADA"
		,DATE + interval '1 hour' * "hour" AS date2
	FROM tmp_auto_po
	) AS datefix
WHERE datefix."EGENERADA" = tmp_auto_po."EGENERADA"
	AND datefix.hour = tmp_auto_po.hour
	AND datefix."GRUPO" = tmp_auto_po."GRUPO";

ALTER TABLE tmp_auto_po

DROP COLUMN DATE
	,

DROP COLUMN hour;

INSERT INTO smec.po
SELECT "Date Hour"
	,"GRUPO"
	,"EGENERADA"
	,"EACREDITADA"
	,"EPOSIBLE"
	,"EPRONOSTICO"
	,"EVERTIDA"
	,"ETAKEORPAY"
FROM tmp_auto_po ON CONFLICT DO NOTHING;

INSERT INTO smec.po_general_renovables
SELECT "Date Hour"
	,"GRUPO"
	,"EGENERADA"
	,"EACREDITADA"
	,"EPOSIBLE"
	,"EPRONOSTICO"
	,"EVERTIDA"
	,"ETAKEORPAY"
FROM tmp_auto_po ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS tmp_auto_po;

CREATE TEMP TABLE tmp_auto_po (date_hour timestamptz
		,grupo TEXT
		,arl INTEGER
		,estado_ope TEXT
		,pi_sotr NUMERIC
		,arl_econ INTEGER
		,est_remun TEXT
		,energia NUMERIC
		,precio_nodo NUMERIC
		,pr_rem_energia NUMERIC
		,smec TEXT
		,pot_disp NUMERIC
		,pot_ope_cpo NUMERIC
		,compra_spot NUMERIC
		,sctd NUMERIC
		,sco NUMERIC
		,pind NUMERIC
		,pindprog NUMERIC
		,pindforz NUMERIC
		,date text
		,hour integer);

COPY tmp_auto_po(
		grupo
		,hour
		,arl 
		,estado_ope 
		,pi_sotr 
		,arl_econ 
		,est_remun 
		,energia 
		,precio_nodo 
		,pr_rem_energia 
		,smec 
		,pot_disp 
		,pot_ope_cpo 
		,compra_spot 
		,sctd 
		,sco 
		,pind 
		,pindprog 
		,pindforz) 
FROM 'C:\Users\Administrador\Desktop\POsept\vg6.csv' DELIMITER ',' NULL AS '';

COPY tmp_auto_po("date")
FROM 'C:\Users\Administrador\Desktop\POsept\fecha6.csv' DELIMITER ',';

UPDATE tmp_auto_po
SET DATE = datefix.DATE
FROM (
	SELECT DATE
	FROM tmp_auto_po
	WHERE grupo IS NULL
	) AS datefix;

ALTER TABLE tmp_auto_po

ALTER COLUMN DATE TYPE timestamptz USING to_timestamp (
	DATE
	,'YYYY-MM-DD hh24:mi:ss'
	);

DELETE FROM tmp_auto_po WHERE grupo IS NULL;

UPDATE tmp_auto_po
SET date_hour = datefix.date2
FROM (
	SELECT grupo
		,hour
		,compra_spot
		,DATE + interval '1 hour' * "hour" AS date2
	FROM tmp_auto_po
	) AS datefix
WHERE datefix.compra_spot = tmp_auto_po.compra_spot
	AND datefix.hour = tmp_auto_po.hour
	AND datefix.grupo = tmp_auto_po.grupo;

ALTER TABLE tmp_auto_po DROP COLUMN DATE, DROP COLUMN hour;

UPDATE smec.po
SET "EIMPORTADA" = tmp_auto_po.compra_spot
FROM (
	SELECT grupo
		,date_hour
		,compra_spot
	FROM tmp_auto_po
	) AS tmp_auto_po
WHERE tmp_auto_po.grupo = po."GRUPO"
	AND tmp_auto_po.date_hour = po."Date Hour";

UPDATE smec.po
SET pot_disp = tmp_auto_po.pot_disp
FROM (
	SELECT grupo
		,date_hour
		,pot_disp
	FROM tmp_auto_po
	) AS tmp_auto_po
WHERE tmp_auto_po.grupo = po."GRUPO"
	AND tmp_auto_po.date_hour = po."Date Hour";

INSERT INTO smec.valores_generadores SELECT date_hour 
		,grupo 
		,arl 
		,estado_ope 
		,pi_sotr 
		,arl_econ 
		,est_remun 
		,energia 
		,precio_nodo 
		,pr_rem_energia 
		,smec 
		,pot_disp 
		,pot_ope_cpo 
		,compra_spot 
		,sctd 
		,sco 
		,pind 
		,pindprog 
		,pindforz 
		FROM tmp_auto_po ON CONFLICT DO NOTHING;


DROP TABLE

IF EXISTS tmp_auto_po;
	CREATE TEMP TABLE tmp_auto_po (
		"Date Hour" timestamptz
		,"GRUPO" TEXT
		,"EGENERADA" NUMERIC
		,"EACREDITADA" NUMERIC
		,"EPOSIBLE" NUMERIC
		,"EPRONOSTICO" NUMERIC
		,"EVERTIDA" NUMERIC
		,"ETAKEORPAY" NUMERIC
		,DATE TEXT
		,hour INTEGER
		);

COPY tmp_auto_po("GRUPO", hour, "EGENERADA", "EACREDITADA", "EPOSIBLE", "EPRONOSTICO", "EVERTIDA", "ETAKEORPAY")
FROM 'C:\Users\Administrador\Desktop\POsept\er7.csv' DELIMITER ',';

COPY tmp_auto_po("date")
FROM 'C:\Users\Administrador\Desktop\POsept\fecha7.csv' DELIMITER ',';

UPDATE tmp_auto_po
SET DATE = datefix.DATE
FROM (
	SELECT DATE
	FROM tmp_auto_po
	WHERE "GRUPO" IS NULL
	) AS datefix;

ALTER TABLE tmp_auto_po

ALTER COLUMN DATE TYPE timestamptz USING to_timestamp (
	DATE
	,'YYYY-MM-DD hh24:mi:ss'
	);

DELETE
FROM tmp_auto_po
WHERE "GRUPO" IS NULL;

UPDATE tmp_auto_po
SET "Date Hour" = datefix.date2
FROM (
	SELECT "GRUPO"
		,hour
		,"EGENERADA"
		,DATE + interval '1 hour' * "hour" AS date2
	FROM tmp_auto_po
	) AS datefix
WHERE datefix."EGENERADA" = tmp_auto_po."EGENERADA"
	AND datefix.hour = tmp_auto_po.hour
	AND datefix."GRUPO" = tmp_auto_po."GRUPO";

ALTER TABLE tmp_auto_po

DROP COLUMN DATE
	,

DROP COLUMN hour;

INSERT INTO smec.po
SELECT "Date Hour"
	,"GRUPO"
	,"EGENERADA"
	,"EACREDITADA"
	,"EPOSIBLE"
	,"EPRONOSTICO"
	,"EVERTIDA"
	,"ETAKEORPAY"
FROM tmp_auto_po ON CONFLICT DO NOTHING;

INSERT INTO smec.po_general_renovables
SELECT "Date Hour"
	,"GRUPO"
	,"EGENERADA"
	,"EACREDITADA"
	,"EPOSIBLE"
	,"EPRONOSTICO"
	,"EVERTIDA"
	,"ETAKEORPAY"
FROM tmp_auto_po ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS tmp_auto_po;

CREATE TEMP TABLE tmp_auto_po (date_hour timestamptz
		,grupo TEXT
		,arl INTEGER
		,estado_ope TEXT
		,pi_sotr NUMERIC
		,arl_econ INTEGER
		,est_remun TEXT
		,energia NUMERIC
		,precio_nodo NUMERIC
		,pr_rem_energia NUMERIC
		,smec TEXT
		,pot_disp NUMERIC
		,pot_ope_cpo NUMERIC
		,compra_spot NUMERIC
		,sctd NUMERIC
		,sco NUMERIC
		,pind NUMERIC
		,pindprog NUMERIC
		,pindforz NUMERIC
		,date text
		,hour integer);

COPY tmp_auto_po(
		grupo
		,hour
		,arl 
		,estado_ope 
		,pi_sotr 
		,arl_econ 
		,est_remun 
		,energia 
		,precio_nodo 
		,pr_rem_energia 
		,smec 
		,pot_disp 
		,pot_ope_cpo 
		,compra_spot 
		,sctd 
		,sco 
		,pind 
		,pindprog 
		,pindforz) 
FROM 'C:\Users\Administrador\Desktop\POsept\vg7.csv' DELIMITER ',' NULL AS '';

COPY tmp_auto_po("date")
FROM 'C:\Users\Administrador\Desktop\POsept\fecha7.csv' DELIMITER ',';

UPDATE tmp_auto_po
SET DATE = datefix.DATE
FROM (
	SELECT DATE
	FROM tmp_auto_po
	WHERE grupo IS NULL
	) AS datefix;

ALTER TABLE tmp_auto_po

ALTER COLUMN DATE TYPE timestamptz USING to_timestamp (
	DATE
	,'YYYY-MM-DD hh24:mi:ss'
	);

DELETE FROM tmp_auto_po WHERE grupo IS NULL;

UPDATE tmp_auto_po
SET date_hour = datefix.date2
FROM (
	SELECT grupo
		,hour
		,compra_spot
		,DATE + interval '1 hour' * "hour" AS date2
	FROM tmp_auto_po
	) AS datefix
WHERE datefix.compra_spot = tmp_auto_po.compra_spot
	AND datefix.hour = tmp_auto_po.hour
	AND datefix.grupo = tmp_auto_po.grupo;

ALTER TABLE tmp_auto_po DROP COLUMN DATE, DROP COLUMN hour;

UPDATE smec.po
SET "EIMPORTADA" = tmp_auto_po.compra_spot
FROM (
	SELECT grupo
		,date_hour
		,compra_spot
	FROM tmp_auto_po
	) AS tmp_auto_po
WHERE tmp_auto_po.grupo = po."GRUPO"
	AND tmp_auto_po.date_hour = po."Date Hour";

UPDATE smec.po
SET pot_disp = tmp_auto_po.pot_disp
FROM (
	SELECT grupo
		,date_hour
		,pot_disp
	FROM tmp_auto_po
	) AS tmp_auto_po
WHERE tmp_auto_po.grupo = po."GRUPO"
	AND tmp_auto_po.date_hour = po."Date Hour";

INSERT INTO smec.valores_generadores SELECT date_hour 
		,grupo 
		,arl 
		,estado_ope 
		,pi_sotr 
		,arl_econ 
		,est_remun 
		,energia 
		,precio_nodo 
		,pr_rem_energia 
		,smec 
		,pot_disp 
		,pot_ope_cpo 
		,compra_spot 
		,sctd 
		,sco 
		,pind 
		,pindprog 
		,pindforz 
		FROM tmp_auto_po ON CONFLICT DO NOTHING;


DROP TABLE

IF EXISTS tmp_auto_po;
	CREATE TEMP TABLE tmp_auto_po (
		"Date Hour" timestamptz
		,"GRUPO" TEXT
		,"EGENERADA" NUMERIC
		,"EACREDITADA" NUMERIC
		,"EPOSIBLE" NUMERIC
		,"EPRONOSTICO" NUMERIC
		,"EVERTIDA" NUMERIC
		,"ETAKEORPAY" NUMERIC
		,DATE TEXT
		,hour INTEGER
		);

COPY tmp_auto_po("GRUPO", hour, "EGENERADA", "EACREDITADA", "EPOSIBLE", "EPRONOSTICO", "EVERTIDA", "ETAKEORPAY")
FROM 'C:\Users\Administrador\Desktop\POsept\er8.csv' DELIMITER ',';

COPY tmp_auto_po("date")
FROM 'C:\Users\Administrador\Desktop\POsept\fecha8.csv' DELIMITER ',';

UPDATE tmp_auto_po
SET DATE = datefix.DATE
FROM (
	SELECT DATE
	FROM tmp_auto_po
	WHERE "GRUPO" IS NULL
	) AS datefix;

ALTER TABLE tmp_auto_po

ALTER COLUMN DATE TYPE timestamptz USING to_timestamp (
	DATE
	,'YYYY-MM-DD hh24:mi:ss'
	);

DELETE
FROM tmp_auto_po
WHERE "GRUPO" IS NULL;

UPDATE tmp_auto_po
SET "Date Hour" = datefix.date2
FROM (
	SELECT "GRUPO"
		,hour
		,"EGENERADA"
		,DATE + interval '1 hour' * "hour" AS date2
	FROM tmp_auto_po
	) AS datefix
WHERE datefix."EGENERADA" = tmp_auto_po."EGENERADA"
	AND datefix.hour = tmp_auto_po.hour
	AND datefix."GRUPO" = tmp_auto_po."GRUPO";

ALTER TABLE tmp_auto_po

DROP COLUMN DATE
	,

DROP COLUMN hour;

INSERT INTO smec.po
SELECT "Date Hour"
	,"GRUPO"
	,"EGENERADA"
	,"EACREDITADA"
	,"EPOSIBLE"
	,"EPRONOSTICO"
	,"EVERTIDA"
	,"ETAKEORPAY"
FROM tmp_auto_po ON CONFLICT DO NOTHING;

INSERT INTO smec.po_general_renovables
SELECT "Date Hour"
	,"GRUPO"
	,"EGENERADA"
	,"EACREDITADA"
	,"EPOSIBLE"
	,"EPRONOSTICO"
	,"EVERTIDA"
	,"ETAKEORPAY"
FROM tmp_auto_po ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS tmp_auto_po;

CREATE TEMP TABLE tmp_auto_po (date_hour timestamptz
		,grupo TEXT
		,arl INTEGER
		,estado_ope TEXT
		,pi_sotr NUMERIC
		,arl_econ INTEGER
		,est_remun TEXT
		,energia NUMERIC
		,precio_nodo NUMERIC
		,pr_rem_energia NUMERIC
		,smec TEXT
		,pot_disp NUMERIC
		,pot_ope_cpo NUMERIC
		,compra_spot NUMERIC
		,sctd NUMERIC
		,sco NUMERIC
		,pind NUMERIC
		,pindprog NUMERIC
		,pindforz NUMERIC
		,date text
		,hour integer);

COPY tmp_auto_po(
		grupo
		,hour
		,arl 
		,estado_ope 
		,pi_sotr 
		,arl_econ 
		,est_remun 
		,energia 
		,precio_nodo 
		,pr_rem_energia 
		,smec 
		,pot_disp 
		,pot_ope_cpo 
		,compra_spot 
		,sctd 
		,sco 
		,pind 
		,pindprog 
		,pindforz) 
FROM 'C:\Users\Administrador\Desktop\POsept\vg8.csv' DELIMITER ',' NULL AS '';

COPY tmp_auto_po("date")
FROM 'C:\Users\Administrador\Desktop\POsept\fecha8.csv' DELIMITER ',';

UPDATE tmp_auto_po
SET DATE = datefix.DATE
FROM (
	SELECT DATE
	FROM tmp_auto_po
	WHERE grupo IS NULL
	) AS datefix;

ALTER TABLE tmp_auto_po

ALTER COLUMN DATE TYPE timestamptz USING to_timestamp (
	DATE
	,'YYYY-MM-DD hh24:mi:ss'
	);

DELETE FROM tmp_auto_po WHERE grupo IS NULL;

UPDATE tmp_auto_po
SET date_hour = datefix.date2
FROM (
	SELECT grupo
		,hour
		,compra_spot
		,DATE + interval '1 hour' * "hour" AS date2
	FROM tmp_auto_po
	) AS datefix
WHERE datefix.compra_spot = tmp_auto_po.compra_spot
	AND datefix.hour = tmp_auto_po.hour
	AND datefix.grupo = tmp_auto_po.grupo;

ALTER TABLE tmp_auto_po DROP COLUMN DATE, DROP COLUMN hour;

UPDATE smec.po
SET "EIMPORTADA" = tmp_auto_po.compra_spot
FROM (
	SELECT grupo
		,date_hour
		,compra_spot
	FROM tmp_auto_po
	) AS tmp_auto_po
WHERE tmp_auto_po.grupo = po."GRUPO"
	AND tmp_auto_po.date_hour = po."Date Hour";

UPDATE smec.po
SET pot_disp = tmp_auto_po.pot_disp
FROM (
	SELECT grupo
		,date_hour
		,pot_disp
	FROM tmp_auto_po
	) AS tmp_auto_po
WHERE tmp_auto_po.grupo = po."GRUPO"
	AND tmp_auto_po.date_hour = po."Date Hour";

INSERT INTO smec.valores_generadores SELECT date_hour 
		,grupo 
		,arl 
		,estado_ope 
		,pi_sotr 
		,arl_econ 
		,est_remun 
		,energia 
		,precio_nodo 
		,pr_rem_energia 
		,smec 
		,pot_disp 
		,pot_ope_cpo 
		,compra_spot 
		,sctd 
		,sco 
		,pind 
		,pindprog 
		,pindforz 
		FROM tmp_auto_po ON CONFLICT DO NOTHING;


DROP TABLE

IF EXISTS tmp_auto_po;
	CREATE TEMP TABLE tmp_auto_po (
		"Date Hour" timestamptz
		,"GRUPO" TEXT
		,"EGENERADA" NUMERIC
		,"EACREDITADA" NUMERIC
		,"EPOSIBLE" NUMERIC
		,"EPRONOSTICO" NUMERIC
		,"EVERTIDA" NUMERIC
		,"ETAKEORPAY" NUMERIC
		,DATE TEXT
		,hour INTEGER
		);

COPY tmp_auto_po("GRUPO", hour, "EGENERADA", "EACREDITADA", "EPOSIBLE", "EPRONOSTICO", "EVERTIDA", "ETAKEORPAY")
FROM 'C:\Users\Administrador\Desktop\POsept\er9.csv' DELIMITER ',';

COPY tmp_auto_po("date")
FROM 'C:\Users\Administrador\Desktop\POsept\fecha9.csv' DELIMITER ',';

UPDATE tmp_auto_po
SET DATE = datefix.DATE
FROM (
	SELECT DATE
	FROM tmp_auto_po
	WHERE "GRUPO" IS NULL
	) AS datefix;

ALTER TABLE tmp_auto_po

ALTER COLUMN DATE TYPE timestamptz USING to_timestamp (
	DATE
	,'YYYY-MM-DD hh24:mi:ss'
	);

DELETE
FROM tmp_auto_po
WHERE "GRUPO" IS NULL;

UPDATE tmp_auto_po
SET "Date Hour" = datefix.date2
FROM (
	SELECT "GRUPO"
		,hour
		,"EGENERADA"
		,DATE + interval '1 hour' * "hour" AS date2
	FROM tmp_auto_po
	) AS datefix
WHERE datefix."EGENERADA" = tmp_auto_po."EGENERADA"
	AND datefix.hour = tmp_auto_po.hour
	AND datefix."GRUPO" = tmp_auto_po."GRUPO";

ALTER TABLE tmp_auto_po

DROP COLUMN DATE
	,

DROP COLUMN hour;

INSERT INTO smec.po
SELECT "Date Hour"
	,"GRUPO"
	,"EGENERADA"
	,"EACREDITADA"
	,"EPOSIBLE"
	,"EPRONOSTICO"
	,"EVERTIDA"
	,"ETAKEORPAY"
FROM tmp_auto_po ON CONFLICT DO NOTHING;

INSERT INTO smec.po_general_renovables
SELECT "Date Hour"
	,"GRUPO"
	,"EGENERADA"
	,"EACREDITADA"
	,"EPOSIBLE"
	,"EPRONOSTICO"
	,"EVERTIDA"
	,"ETAKEORPAY"
FROM tmp_auto_po ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS tmp_auto_po;

CREATE TEMP TABLE tmp_auto_po (date_hour timestamptz
		,grupo TEXT
		,arl INTEGER
		,estado_ope TEXT
		,pi_sotr NUMERIC
		,arl_econ INTEGER
		,est_remun TEXT
		,energia NUMERIC
		,precio_nodo NUMERIC
		,pr_rem_energia NUMERIC
		,smec TEXT
		,pot_disp NUMERIC
		,pot_ope_cpo NUMERIC
		,compra_spot NUMERIC
		,sctd NUMERIC
		,sco NUMERIC
		,pind NUMERIC
		,pindprog NUMERIC
		,pindforz NUMERIC
		,date text
		,hour integer);

COPY tmp_auto_po(
		grupo
		,hour
		,arl 
		,estado_ope 
		,pi_sotr 
		,arl_econ 
		,est_remun 
		,energia 
		,precio_nodo 
		,pr_rem_energia 
		,smec 
		,pot_disp 
		,pot_ope_cpo 
		,compra_spot 
		,sctd 
		,sco 
		,pind 
		,pindprog 
		,pindforz) 
FROM 'C:\Users\Administrador\Desktop\POsept\vg9.csv' DELIMITER ',' NULL AS '';

COPY tmp_auto_po("date")
FROM 'C:\Users\Administrador\Desktop\POsept\fecha9.csv' DELIMITER ',';

UPDATE tmp_auto_po
SET DATE = datefix.DATE
FROM (
	SELECT DATE
	FROM tmp_auto_po
	WHERE grupo IS NULL
	) AS datefix;

ALTER TABLE tmp_auto_po

ALTER COLUMN DATE TYPE timestamptz USING to_timestamp (
	DATE
	,'YYYY-MM-DD hh24:mi:ss'
	);

DELETE FROM tmp_auto_po WHERE grupo IS NULL;

UPDATE tmp_auto_po
SET date_hour = datefix.date2
FROM (
	SELECT grupo
		,hour
		,compra_spot
		,DATE + interval '1 hour' * "hour" AS date2
	FROM tmp_auto_po
	) AS datefix
WHERE datefix.compra_spot = tmp_auto_po.compra_spot
	AND datefix.hour = tmp_auto_po.hour
	AND datefix.grupo = tmp_auto_po.grupo;

ALTER TABLE tmp_auto_po DROP COLUMN DATE, DROP COLUMN hour;

UPDATE smec.po
SET "EIMPORTADA" = tmp_auto_po.compra_spot
FROM (
	SELECT grupo
		,date_hour
		,compra_spot
	FROM tmp_auto_po
	) AS tmp_auto_po
WHERE tmp_auto_po.grupo = po."GRUPO"
	AND tmp_auto_po.date_hour = po."Date Hour";

UPDATE smec.po
SET pot_disp = tmp_auto_po.pot_disp
FROM (
	SELECT grupo
		,date_hour
		,pot_disp
	FROM tmp_auto_po
	) AS tmp_auto_po
WHERE tmp_auto_po.grupo = po."GRUPO"
	AND tmp_auto_po.date_hour = po."Date Hour";

INSERT INTO smec.valores_generadores SELECT date_hour 
		,grupo 
		,arl 
		,estado_ope 
		,pi_sotr 
		,arl_econ 
		,est_remun 
		,energia 
		,precio_nodo 
		,pr_rem_energia 
		,smec 
		,pot_disp 
		,pot_ope_cpo 
		,compra_spot 
		,sctd 
		,sco 
		,pind 
		,pindprog 
		,pindforz 
		FROM tmp_auto_po ON CONFLICT DO NOTHING;


DROP TABLE

IF EXISTS tmp_auto_po;
	CREATE TEMP TABLE tmp_auto_po (
		"Date Hour" timestamptz
		,"GRUPO" TEXT
		,"EGENERADA" NUMERIC
		,"EACREDITADA" NUMERIC
		,"EPOSIBLE" NUMERIC
		,"EPRONOSTICO" NUMERIC
		,"EVERTIDA" NUMERIC
		,"ETAKEORPAY" NUMERIC
		,DATE TEXT
		,hour INTEGER
		);

COPY tmp_auto_po("GRUPO", hour, "EGENERADA", "EACREDITADA", "EPOSIBLE", "EPRONOSTICO", "EVERTIDA", "ETAKEORPAY")
FROM 'C:\Users\Administrador\Desktop\POsept\er10.csv' DELIMITER ',';

COPY tmp_auto_po("date")
FROM 'C:\Users\Administrador\Desktop\POsept\fecha10.csv' DELIMITER ',';

UPDATE tmp_auto_po
SET DATE = datefix.DATE
FROM (
	SELECT DATE
	FROM tmp_auto_po
	WHERE "GRUPO" IS NULL
	) AS datefix;

ALTER TABLE tmp_auto_po

ALTER COLUMN DATE TYPE timestamptz USING to_timestamp (
	DATE
	,'YYYY-MM-DD hh24:mi:ss'
	);

DELETE
FROM tmp_auto_po
WHERE "GRUPO" IS NULL;

UPDATE tmp_auto_po
SET "Date Hour" = datefix.date2
FROM (
	SELECT "GRUPO"
		,hour
		,"EGENERADA"
		,DATE + interval '1 hour' * "hour" AS date2
	FROM tmp_auto_po
	) AS datefix
WHERE datefix."EGENERADA" = tmp_auto_po."EGENERADA"
	AND datefix.hour = tmp_auto_po.hour
	AND datefix."GRUPO" = tmp_auto_po."GRUPO";

ALTER TABLE tmp_auto_po

DROP COLUMN DATE
	,

DROP COLUMN hour;

INSERT INTO smec.po
SELECT "Date Hour"
	,"GRUPO"
	,"EGENERADA"
	,"EACREDITADA"
	,"EPOSIBLE"
	,"EPRONOSTICO"
	,"EVERTIDA"
	,"ETAKEORPAY"
FROM tmp_auto_po ON CONFLICT DO NOTHING;

INSERT INTO smec.po_general_renovables
SELECT "Date Hour"
	,"GRUPO"
	,"EGENERADA"
	,"EACREDITADA"
	,"EPOSIBLE"
	,"EPRONOSTICO"
	,"EVERTIDA"
	,"ETAKEORPAY"
FROM tmp_auto_po ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS tmp_auto_po;

CREATE TEMP TABLE tmp_auto_po (date_hour timestamptz
		,grupo TEXT
		,arl INTEGER
		,estado_ope TEXT
		,pi_sotr NUMERIC
		,arl_econ INTEGER
		,est_remun TEXT
		,energia NUMERIC
		,precio_nodo NUMERIC
		,pr_rem_energia NUMERIC
		,smec TEXT
		,pot_disp NUMERIC
		,pot_ope_cpo NUMERIC
		,compra_spot NUMERIC
		,sctd NUMERIC
		,sco NUMERIC
		,pind NUMERIC
		,pindprog NUMERIC
		,pindforz NUMERIC
		,date text
		,hour integer);

COPY tmp_auto_po(
		grupo
		,hour
		,arl 
		,estado_ope 
		,pi_sotr 
		,arl_econ 
		,est_remun 
		,energia 
		,precio_nodo 
		,pr_rem_energia 
		,smec 
		,pot_disp 
		,pot_ope_cpo 
		,compra_spot 
		,sctd 
		,sco 
		,pind 
		,pindprog 
		,pindforz) 
FROM 'C:\Users\Administrador\Desktop\POsept\vg10.csv' DELIMITER ',' NULL AS '';

COPY tmp_auto_po("date")
FROM 'C:\Users\Administrador\Desktop\POsept\fecha10.csv' DELIMITER ',';

UPDATE tmp_auto_po
SET DATE = datefix.DATE
FROM (
	SELECT DATE
	FROM tmp_auto_po
	WHERE grupo IS NULL
	) AS datefix;

ALTER TABLE tmp_auto_po

ALTER COLUMN DATE TYPE timestamptz USING to_timestamp (
	DATE
	,'YYYY-MM-DD hh24:mi:ss'
	);

DELETE FROM tmp_auto_po WHERE grupo IS NULL;

UPDATE tmp_auto_po
SET date_hour = datefix.date2
FROM (
	SELECT grupo
		,hour
		,compra_spot
		,DATE + interval '1 hour' * "hour" AS date2
	FROM tmp_auto_po
	) AS datefix
WHERE datefix.compra_spot = tmp_auto_po.compra_spot
	AND datefix.hour = tmp_auto_po.hour
	AND datefix.grupo = tmp_auto_po.grupo;

ALTER TABLE tmp_auto_po DROP COLUMN DATE, DROP COLUMN hour;

UPDATE smec.po
SET "EIMPORTADA" = tmp_auto_po.compra_spot
FROM (
	SELECT grupo
		,date_hour
		,compra_spot
	FROM tmp_auto_po
	) AS tmp_auto_po
WHERE tmp_auto_po.grupo = po."GRUPO"
	AND tmp_auto_po.date_hour = po."Date Hour";

UPDATE smec.po
SET pot_disp = tmp_auto_po.pot_disp
FROM (
	SELECT grupo
		,date_hour
		,pot_disp
	FROM tmp_auto_po
	) AS tmp_auto_po
WHERE tmp_auto_po.grupo = po."GRUPO"
	AND tmp_auto_po.date_hour = po."Date Hour";

INSERT INTO smec.valores_generadores SELECT date_hour 
		,grupo 
		,arl 
		,estado_ope 
		,pi_sotr 
		,arl_econ 
		,est_remun 
		,energia 
		,precio_nodo 
		,pr_rem_energia 
		,smec 
		,pot_disp 
		,pot_ope_cpo 
		,compra_spot 
		,sctd 
		,sco 
		,pind 
		,pindprog 
		,pindforz 
		FROM tmp_auto_po ON CONFLICT DO NOTHING;


DROP TABLE

IF EXISTS tmp_auto_po;
	CREATE TEMP TABLE tmp_auto_po (
		"Date Hour" timestamptz
		,"GRUPO" TEXT
		,"EGENERADA" NUMERIC
		,"EACREDITADA" NUMERIC
		,"EPOSIBLE" NUMERIC
		,"EPRONOSTICO" NUMERIC
		,"EVERTIDA" NUMERIC
		,"ETAKEORPAY" NUMERIC
		,DATE TEXT
		,hour INTEGER
		);

COPY tmp_auto_po("GRUPO", hour, "EGENERADA", "EACREDITADA", "EPOSIBLE", "EPRONOSTICO", "EVERTIDA", "ETAKEORPAY")
FROM 'C:\Users\Administrador\Desktop\POsept\er11.csv' DELIMITER ',';

COPY tmp_auto_po("date")
FROM 'C:\Users\Administrador\Desktop\POsept\fecha11.csv' DELIMITER ',';

UPDATE tmp_auto_po
SET DATE = datefix.DATE
FROM (
	SELECT DATE
	FROM tmp_auto_po
	WHERE "GRUPO" IS NULL
	) AS datefix;

ALTER TABLE tmp_auto_po

ALTER COLUMN DATE TYPE timestamptz USING to_timestamp (
	DATE
	,'YYYY-MM-DD hh24:mi:ss'
	);

DELETE
FROM tmp_auto_po
WHERE "GRUPO" IS NULL;

UPDATE tmp_auto_po
SET "Date Hour" = datefix.date2
FROM (
	SELECT "GRUPO"
		,hour
		,"EGENERADA"
		,DATE + interval '1 hour' * "hour" AS date2
	FROM tmp_auto_po
	) AS datefix
WHERE datefix."EGENERADA" = tmp_auto_po."EGENERADA"
	AND datefix.hour = tmp_auto_po.hour
	AND datefix."GRUPO" = tmp_auto_po."GRUPO";

ALTER TABLE tmp_auto_po

DROP COLUMN DATE
	,

DROP COLUMN hour;

INSERT INTO smec.po
SELECT "Date Hour"
	,"GRUPO"
	,"EGENERADA"
	,"EACREDITADA"
	,"EPOSIBLE"
	,"EPRONOSTICO"
	,"EVERTIDA"
	,"ETAKEORPAY"
FROM tmp_auto_po ON CONFLICT DO NOTHING;

INSERT INTO smec.po_general_renovables
SELECT "Date Hour"
	,"GRUPO"
	,"EGENERADA"
	,"EACREDITADA"
	,"EPOSIBLE"
	,"EPRONOSTICO"
	,"EVERTIDA"
	,"ETAKEORPAY"
FROM tmp_auto_po ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS tmp_auto_po;

CREATE TEMP TABLE tmp_auto_po (date_hour timestamptz
		,grupo TEXT
		,arl INTEGER
		,estado_ope TEXT
		,pi_sotr NUMERIC
		,arl_econ INTEGER
		,est_remun TEXT
		,energia NUMERIC
		,precio_nodo NUMERIC
		,pr_rem_energia NUMERIC
		,smec TEXT
		,pot_disp NUMERIC
		,pot_ope_cpo NUMERIC
		,compra_spot NUMERIC
		,sctd NUMERIC
		,sco NUMERIC
		,pind NUMERIC
		,pindprog NUMERIC
		,pindforz NUMERIC
		,date text
		,hour integer);

COPY tmp_auto_po(
		grupo
		,hour
		,arl 
		,estado_ope 
		,pi_sotr 
		,arl_econ 
		,est_remun 
		,energia 
		,precio_nodo 
		,pr_rem_energia 
		,smec 
		,pot_disp 
		,pot_ope_cpo 
		,compra_spot 
		,sctd 
		,sco 
		,pind 
		,pindprog 
		,pindforz) 
FROM 'C:\Users\Administrador\Desktop\POsept\vg11.csv' DELIMITER ',' NULL AS '';

COPY tmp_auto_po("date")
FROM 'C:\Users\Administrador\Desktop\POsept\fecha11.csv' DELIMITER ',';

UPDATE tmp_auto_po
SET DATE = datefix.DATE
FROM (
	SELECT DATE
	FROM tmp_auto_po
	WHERE grupo IS NULL
	) AS datefix;

ALTER TABLE tmp_auto_po

ALTER COLUMN DATE TYPE timestamptz USING to_timestamp (
	DATE
	,'YYYY-MM-DD hh24:mi:ss'
	);

DELETE FROM tmp_auto_po WHERE grupo IS NULL;

UPDATE tmp_auto_po
SET date_hour = datefix.date2
FROM (
	SELECT grupo
		,hour
		,compra_spot
		,DATE + interval '1 hour' * "hour" AS date2
	FROM tmp_auto_po
	) AS datefix
WHERE datefix.compra_spot = tmp_auto_po.compra_spot
	AND datefix.hour = tmp_auto_po.hour
	AND datefix.grupo = tmp_auto_po.grupo;

ALTER TABLE tmp_auto_po DROP COLUMN DATE, DROP COLUMN hour;

UPDATE smec.po
SET "EIMPORTADA" = tmp_auto_po.compra_spot
FROM (
	SELECT grupo
		,date_hour
		,compra_spot
	FROM tmp_auto_po
	) AS tmp_auto_po
WHERE tmp_auto_po.grupo = po."GRUPO"
	AND tmp_auto_po.date_hour = po."Date Hour";

UPDATE smec.po
SET pot_disp = tmp_auto_po.pot_disp
FROM (
	SELECT grupo
		,date_hour
		,pot_disp
	FROM tmp_auto_po
	) AS tmp_auto_po
WHERE tmp_auto_po.grupo = po."GRUPO"
	AND tmp_auto_po.date_hour = po."Date Hour";

INSERT INTO smec.valores_generadores SELECT date_hour 
		,grupo 
		,arl 
		,estado_ope 
		,pi_sotr 
		,arl_econ 
		,est_remun 
		,energia 
		,precio_nodo 
		,pr_rem_energia 
		,smec 
		,pot_disp 
		,pot_ope_cpo 
		,compra_spot 
		,sctd 
		,sco 
		,pind 
		,pindprog 
		,pindforz 
		FROM tmp_auto_po ON CONFLICT DO NOTHING;


DROP TABLE

IF EXISTS tmp_auto_po;
	CREATE TEMP TABLE tmp_auto_po (
		"Date Hour" timestamptz
		,"GRUPO" TEXT
		,"EGENERADA" NUMERIC
		,"EACREDITADA" NUMERIC
		,"EPOSIBLE" NUMERIC
		,"EPRONOSTICO" NUMERIC
		,"EVERTIDA" NUMERIC
		,"ETAKEORPAY" NUMERIC
		,DATE TEXT
		,hour INTEGER
		);

COPY tmp_auto_po("GRUPO", hour, "EGENERADA", "EACREDITADA", "EPOSIBLE", "EPRONOSTICO", "EVERTIDA", "ETAKEORPAY")
FROM 'C:\Users\Administrador\Desktop\POsept\er12.csv' DELIMITER ',';

COPY tmp_auto_po("date")
FROM 'C:\Users\Administrador\Desktop\POsept\fecha12.csv' DELIMITER ',';

UPDATE tmp_auto_po
SET DATE = datefix.DATE
FROM (
	SELECT DATE
	FROM tmp_auto_po
	WHERE "GRUPO" IS NULL
	) AS datefix;

ALTER TABLE tmp_auto_po

ALTER COLUMN DATE TYPE timestamptz USING to_timestamp (
	DATE
	,'YYYY-MM-DD hh24:mi:ss'
	);

DELETE
FROM tmp_auto_po
WHERE "GRUPO" IS NULL;

UPDATE tmp_auto_po
SET "Date Hour" = datefix.date2
FROM (
	SELECT "GRUPO"
		,hour
		,"EGENERADA"
		,DATE + interval '1 hour' * "hour" AS date2
	FROM tmp_auto_po
	) AS datefix
WHERE datefix."EGENERADA" = tmp_auto_po."EGENERADA"
	AND datefix.hour = tmp_auto_po.hour
	AND datefix."GRUPO" = tmp_auto_po."GRUPO";

ALTER TABLE tmp_auto_po

DROP COLUMN DATE
	,

DROP COLUMN hour;

INSERT INTO smec.po
SELECT "Date Hour"
	,"GRUPO"
	,"EGENERADA"
	,"EACREDITADA"
	,"EPOSIBLE"
	,"EPRONOSTICO"
	,"EVERTIDA"
	,"ETAKEORPAY"
FROM tmp_auto_po ON CONFLICT DO NOTHING;

INSERT INTO smec.po_general_renovables
SELECT "Date Hour"
	,"GRUPO"
	,"EGENERADA"
	,"EACREDITADA"
	,"EPOSIBLE"
	,"EPRONOSTICO"
	,"EVERTIDA"
	,"ETAKEORPAY"
FROM tmp_auto_po ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS tmp_auto_po;

CREATE TEMP TABLE tmp_auto_po (date_hour timestamptz
		,grupo TEXT
		,arl INTEGER
		,estado_ope TEXT
		,pi_sotr NUMERIC
		,arl_econ INTEGER
		,est_remun TEXT
		,energia NUMERIC
		,precio_nodo NUMERIC
		,pr_rem_energia NUMERIC
		,smec TEXT
		,pot_disp NUMERIC
		,pot_ope_cpo NUMERIC
		,compra_spot NUMERIC
		,sctd NUMERIC
		,sco NUMERIC
		,pind NUMERIC
		,pindprog NUMERIC
		,pindforz NUMERIC
		,date text
		,hour integer);

COPY tmp_auto_po(
		grupo
		,hour
		,arl 
		,estado_ope 
		,pi_sotr 
		,arl_econ 
		,est_remun 
		,energia 
		,precio_nodo 
		,pr_rem_energia 
		,smec 
		,pot_disp 
		,pot_ope_cpo 
		,compra_spot 
		,sctd 
		,sco 
		,pind 
		,pindprog 
		,pindforz) 
FROM 'C:\Users\Administrador\Desktop\POsept\vg12.csv' DELIMITER ',' NULL AS '';

COPY tmp_auto_po("date")
FROM 'C:\Users\Administrador\Desktop\POsept\fecha12.csv' DELIMITER ',';

UPDATE tmp_auto_po
SET DATE = datefix.DATE
FROM (
	SELECT DATE
	FROM tmp_auto_po
	WHERE grupo IS NULL
	) AS datefix;

ALTER TABLE tmp_auto_po

ALTER COLUMN DATE TYPE timestamptz USING to_timestamp (
	DATE
	,'YYYY-MM-DD hh24:mi:ss'
	);

DELETE FROM tmp_auto_po WHERE grupo IS NULL;

UPDATE tmp_auto_po
SET date_hour = datefix.date2
FROM (
	SELECT grupo
		,hour
		,compra_spot
		,DATE + interval '1 hour' * "hour" AS date2
	FROM tmp_auto_po
	) AS datefix
WHERE datefix.compra_spot = tmp_auto_po.compra_spot
	AND datefix.hour = tmp_auto_po.hour
	AND datefix.grupo = tmp_auto_po.grupo;

ALTER TABLE tmp_auto_po DROP COLUMN DATE, DROP COLUMN hour;

UPDATE smec.po
SET "EIMPORTADA" = tmp_auto_po.compra_spot
FROM (
	SELECT grupo
		,date_hour
		,compra_spot
	FROM tmp_auto_po
	) AS tmp_auto_po
WHERE tmp_auto_po.grupo = po."GRUPO"
	AND tmp_auto_po.date_hour = po."Date Hour";

UPDATE smec.po
SET pot_disp = tmp_auto_po.pot_disp
FROM (
	SELECT grupo
		,date_hour
		,pot_disp
	FROM tmp_auto_po
	) AS tmp_auto_po
WHERE tmp_auto_po.grupo = po."GRUPO"
	AND tmp_auto_po.date_hour = po."Date Hour";

INSERT INTO smec.valores_generadores SELECT date_hour 
		,grupo 
		,arl 
		,estado_ope 
		,pi_sotr 
		,arl_econ 
		,est_remun 
		,energia 
		,precio_nodo 
		,pr_rem_energia 
		,smec 
		,pot_disp 
		,pot_ope_cpo 
		,compra_spot 
		,sctd 
		,sco 
		,pind 
		,pindprog 
		,pindforz 
		FROM tmp_auto_po ON CONFLICT DO NOTHING;


DROP TABLE

IF EXISTS tmp_auto_po;
	CREATE TEMP TABLE tmp_auto_po (
		"Date Hour" timestamptz
		,"GRUPO" TEXT
		,"EGENERADA" NUMERIC
		,"EACREDITADA" NUMERIC
		,"EPOSIBLE" NUMERIC
		,"EPRONOSTICO" NUMERIC
		,"EVERTIDA" NUMERIC
		,"ETAKEORPAY" NUMERIC
		,DATE TEXT
		,hour INTEGER
		);

COPY tmp_auto_po("GRUPO", hour, "EGENERADA", "EACREDITADA", "EPOSIBLE", "EPRONOSTICO", "EVERTIDA", "ETAKEORPAY")
FROM 'C:\Users\Administrador\Desktop\POsept\er13.csv' DELIMITER ',';

COPY tmp_auto_po("date")
FROM 'C:\Users\Administrador\Desktop\POsept\fecha13.csv' DELIMITER ',';

UPDATE tmp_auto_po
SET DATE = datefix.DATE
FROM (
	SELECT DATE
	FROM tmp_auto_po
	WHERE "GRUPO" IS NULL
	) AS datefix;

ALTER TABLE tmp_auto_po

ALTER COLUMN DATE TYPE timestamptz USING to_timestamp (
	DATE
	,'YYYY-MM-DD hh24:mi:ss'
	);

DELETE
FROM tmp_auto_po
WHERE "GRUPO" IS NULL;

UPDATE tmp_auto_po
SET "Date Hour" = datefix.date2
FROM (
	SELECT "GRUPO"
		,hour
		,"EGENERADA"
		,DATE + interval '1 hour' * "hour" AS date2
	FROM tmp_auto_po
	) AS datefix
WHERE datefix."EGENERADA" = tmp_auto_po."EGENERADA"
	AND datefix.hour = tmp_auto_po.hour
	AND datefix."GRUPO" = tmp_auto_po."GRUPO";

ALTER TABLE tmp_auto_po

DROP COLUMN DATE
	,

DROP COLUMN hour;

INSERT INTO smec.po
SELECT "Date Hour"
	,"GRUPO"
	,"EGENERADA"
	,"EACREDITADA"
	,"EPOSIBLE"
	,"EPRONOSTICO"
	,"EVERTIDA"
	,"ETAKEORPAY"
FROM tmp_auto_po ON CONFLICT DO NOTHING;

INSERT INTO smec.po_general_renovables
SELECT "Date Hour"
	,"GRUPO"
	,"EGENERADA"
	,"EACREDITADA"
	,"EPOSIBLE"
	,"EPRONOSTICO"
	,"EVERTIDA"
	,"ETAKEORPAY"
FROM tmp_auto_po ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS tmp_auto_po;

CREATE TEMP TABLE tmp_auto_po (date_hour timestamptz
		,grupo TEXT
		,arl INTEGER
		,estado_ope TEXT
		,pi_sotr NUMERIC
		,arl_econ INTEGER
		,est_remun TEXT
		,energia NUMERIC
		,precio_nodo NUMERIC
		,pr_rem_energia NUMERIC
		,smec TEXT
		,pot_disp NUMERIC
		,pot_ope_cpo NUMERIC
		,compra_spot NUMERIC
		,sctd NUMERIC
		,sco NUMERIC
		,pind NUMERIC
		,pindprog NUMERIC
		,pindforz NUMERIC
		,date text
		,hour integer);

COPY tmp_auto_po(
		grupo
		,hour
		,arl 
		,estado_ope 
		,pi_sotr 
		,arl_econ 
		,est_remun 
		,energia 
		,precio_nodo 
		,pr_rem_energia 
		,smec 
		,pot_disp 
		,pot_ope_cpo 
		,compra_spot 
		,sctd 
		,sco 
		,pind 
		,pindprog 
		,pindforz) 
FROM 'C:\Users\Administrador\Desktop\POsept\vg13.csv' DELIMITER ',' NULL AS '';

COPY tmp_auto_po("date")
FROM 'C:\Users\Administrador\Desktop\POsept\fecha13.csv' DELIMITER ',';

UPDATE tmp_auto_po
SET DATE = datefix.DATE
FROM (
	SELECT DATE
	FROM tmp_auto_po
	WHERE grupo IS NULL
	) AS datefix;

ALTER TABLE tmp_auto_po

ALTER COLUMN DATE TYPE timestamptz USING to_timestamp (
	DATE
	,'YYYY-MM-DD hh24:mi:ss'
	);

DELETE FROM tmp_auto_po WHERE grupo IS NULL;

UPDATE tmp_auto_po
SET date_hour = datefix.date2
FROM (
	SELECT grupo
		,hour
		,compra_spot
		,DATE + interval '1 hour' * "hour" AS date2
	FROM tmp_auto_po
	) AS datefix
WHERE datefix.compra_spot = tmp_auto_po.compra_spot
	AND datefix.hour = tmp_auto_po.hour
	AND datefix.grupo = tmp_auto_po.grupo;

ALTER TABLE tmp_auto_po DROP COLUMN DATE, DROP COLUMN hour;

UPDATE smec.po
SET "EIMPORTADA" = tmp_auto_po.compra_spot
FROM (
	SELECT grupo
		,date_hour
		,compra_spot
	FROM tmp_auto_po
	) AS tmp_auto_po
WHERE tmp_auto_po.grupo = po."GRUPO"
	AND tmp_auto_po.date_hour = po."Date Hour";

UPDATE smec.po
SET pot_disp = tmp_auto_po.pot_disp
FROM (
	SELECT grupo
		,date_hour
		,pot_disp
	FROM tmp_auto_po
	) AS tmp_auto_po
WHERE tmp_auto_po.grupo = po."GRUPO"
	AND tmp_auto_po.date_hour = po."Date Hour";

INSERT INTO smec.valores_generadores SELECT date_hour 
		,grupo 
		,arl 
		,estado_ope 
		,pi_sotr 
		,arl_econ 
		,est_remun 
		,energia 
		,precio_nodo 
		,pr_rem_energia 
		,smec 
		,pot_disp 
		,pot_ope_cpo 
		,compra_spot 
		,sctd 
		,sco 
		,pind 
		,pindprog 
		,pindforz 
		FROM tmp_auto_po ON CONFLICT DO NOTHING;


DROP TABLE

IF EXISTS tmp_auto_po;
	CREATE TEMP TABLE tmp_auto_po (
		"Date Hour" timestamptz
		,"GRUPO" TEXT
		,"EGENERADA" NUMERIC
		,"EACREDITADA" NUMERIC
		,"EPOSIBLE" NUMERIC
		,"EPRONOSTICO" NUMERIC
		,"EVERTIDA" NUMERIC
		,"ETAKEORPAY" NUMERIC
		,DATE TEXT
		,hour INTEGER
		);

COPY tmp_auto_po("GRUPO", hour, "EGENERADA", "EACREDITADA", "EPOSIBLE", "EPRONOSTICO", "EVERTIDA", "ETAKEORPAY")
FROM 'C:\Users\Administrador\Desktop\POsept\er14.csv' DELIMITER ',';

COPY tmp_auto_po("date")
FROM 'C:\Users\Administrador\Desktop\POsept\fecha14.csv' DELIMITER ',';

UPDATE tmp_auto_po
SET DATE = datefix.DATE
FROM (
	SELECT DATE
	FROM tmp_auto_po
	WHERE "GRUPO" IS NULL
	) AS datefix;

ALTER TABLE tmp_auto_po

ALTER COLUMN DATE TYPE timestamptz USING to_timestamp (
	DATE
	,'YYYY-MM-DD hh24:mi:ss'
	);

DELETE
FROM tmp_auto_po
WHERE "GRUPO" IS NULL;

UPDATE tmp_auto_po
SET "Date Hour" = datefix.date2
FROM (
	SELECT "GRUPO"
		,hour
		,"EGENERADA"
		,DATE + interval '1 hour' * "hour" AS date2
	FROM tmp_auto_po
	) AS datefix
WHERE datefix."EGENERADA" = tmp_auto_po."EGENERADA"
	AND datefix.hour = tmp_auto_po.hour
	AND datefix."GRUPO" = tmp_auto_po."GRUPO";

ALTER TABLE tmp_auto_po

DROP COLUMN DATE
	,

DROP COLUMN hour;

INSERT INTO smec.po
SELECT "Date Hour"
	,"GRUPO"
	,"EGENERADA"
	,"EACREDITADA"
	,"EPOSIBLE"
	,"EPRONOSTICO"
	,"EVERTIDA"
	,"ETAKEORPAY"
FROM tmp_auto_po ON CONFLICT DO NOTHING;

INSERT INTO smec.po_general_renovables
SELECT "Date Hour"
	,"GRUPO"
	,"EGENERADA"
	,"EACREDITADA"
	,"EPOSIBLE"
	,"EPRONOSTICO"
	,"EVERTIDA"
	,"ETAKEORPAY"
FROM tmp_auto_po ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS tmp_auto_po;

CREATE TEMP TABLE tmp_auto_po (date_hour timestamptz
		,grupo TEXT
		,arl INTEGER
		,estado_ope TEXT
		,pi_sotr NUMERIC
		,arl_econ INTEGER
		,est_remun TEXT
		,energia NUMERIC
		,precio_nodo NUMERIC
		,pr_rem_energia NUMERIC
		,smec TEXT
		,pot_disp NUMERIC
		,pot_ope_cpo NUMERIC
		,compra_spot NUMERIC
		,sctd NUMERIC
		,sco NUMERIC
		,pind NUMERIC
		,pindprog NUMERIC
		,pindforz NUMERIC
		,date text
		,hour integer);

COPY tmp_auto_po(
		grupo
		,hour
		,arl 
		,estado_ope 
		,pi_sotr 
		,arl_econ 
		,est_remun 
		,energia 
		,precio_nodo 
		,pr_rem_energia 
		,smec 
		,pot_disp 
		,pot_ope_cpo 
		,compra_spot 
		,sctd 
		,sco 
		,pind 
		,pindprog 
		,pindforz) 
FROM 'C:\Users\Administrador\Desktop\POsept\vg14.csv' DELIMITER ',' NULL AS '';

COPY tmp_auto_po("date")
FROM 'C:\Users\Administrador\Desktop\POsept\fecha14.csv' DELIMITER ',';

UPDATE tmp_auto_po
SET DATE = datefix.DATE
FROM (
	SELECT DATE
	FROM tmp_auto_po
	WHERE grupo IS NULL
	) AS datefix;

ALTER TABLE tmp_auto_po

ALTER COLUMN DATE TYPE timestamptz USING to_timestamp (
	DATE
	,'YYYY-MM-DD hh24:mi:ss'
	);

DELETE FROM tmp_auto_po WHERE grupo IS NULL;

UPDATE tmp_auto_po
SET date_hour = datefix.date2
FROM (
	SELECT grupo
		,hour
		,compra_spot
		,DATE + interval '1 hour' * "hour" AS date2
	FROM tmp_auto_po
	) AS datefix
WHERE datefix.compra_spot = tmp_auto_po.compra_spot
	AND datefix.hour = tmp_auto_po.hour
	AND datefix.grupo = tmp_auto_po.grupo;

ALTER TABLE tmp_auto_po DROP COLUMN DATE, DROP COLUMN hour;

UPDATE smec.po
SET "EIMPORTADA" = tmp_auto_po.compra_spot
FROM (
	SELECT grupo
		,date_hour
		,compra_spot
	FROM tmp_auto_po
	) AS tmp_auto_po
WHERE tmp_auto_po.grupo = po."GRUPO"
	AND tmp_auto_po.date_hour = po."Date Hour";

UPDATE smec.po
SET pot_disp = tmp_auto_po.pot_disp
FROM (
	SELECT grupo
		,date_hour
		,pot_disp
	FROM tmp_auto_po
	) AS tmp_auto_po
WHERE tmp_auto_po.grupo = po."GRUPO"
	AND tmp_auto_po.date_hour = po."Date Hour";

INSERT INTO smec.valores_generadores SELECT date_hour 
		,grupo 
		,arl 
		,estado_ope 
		,pi_sotr 
		,arl_econ 
		,est_remun 
		,energia 
		,precio_nodo 
		,pr_rem_energia 
		,smec 
		,pot_disp 
		,pot_ope_cpo 
		,compra_spot 
		,sctd 
		,sco 
		,pind 
		,pindprog 
		,pindforz 
		FROM tmp_auto_po ON CONFLICT DO NOTHING;


DROP TABLE

IF EXISTS tmp_auto_po;
	CREATE TEMP TABLE tmp_auto_po (
		"Date Hour" timestamptz
		,"GRUPO" TEXT
		,"EGENERADA" NUMERIC
		,"EACREDITADA" NUMERIC
		,"EPOSIBLE" NUMERIC
		,"EPRONOSTICO" NUMERIC
		,"EVERTIDA" NUMERIC
		,"ETAKEORPAY" NUMERIC
		,DATE TEXT
		,hour INTEGER
		);

COPY tmp_auto_po("GRUPO", hour, "EGENERADA", "EACREDITADA", "EPOSIBLE", "EPRONOSTICO", "EVERTIDA", "ETAKEORPAY")
FROM 'C:\Users\Administrador\Desktop\POsept\er15.csv' DELIMITER ',';

COPY tmp_auto_po("date")
FROM 'C:\Users\Administrador\Desktop\POsept\fecha15.csv' DELIMITER ',';

UPDATE tmp_auto_po
SET DATE = datefix.DATE
FROM (
	SELECT DATE
	FROM tmp_auto_po
	WHERE "GRUPO" IS NULL
	) AS datefix;

ALTER TABLE tmp_auto_po

ALTER COLUMN DATE TYPE timestamptz USING to_timestamp (
	DATE
	,'YYYY-MM-DD hh24:mi:ss'
	);

DELETE
FROM tmp_auto_po
WHERE "GRUPO" IS NULL;

UPDATE tmp_auto_po
SET "Date Hour" = datefix.date2
FROM (
	SELECT "GRUPO"
		,hour
		,"EGENERADA"
		,DATE + interval '1 hour' * "hour" AS date2
	FROM tmp_auto_po
	) AS datefix
WHERE datefix."EGENERADA" = tmp_auto_po."EGENERADA"
	AND datefix.hour = tmp_auto_po.hour
	AND datefix."GRUPO" = tmp_auto_po."GRUPO";

ALTER TABLE tmp_auto_po

DROP COLUMN DATE
	,

DROP COLUMN hour;

INSERT INTO smec.po
SELECT "Date Hour"
	,"GRUPO"
	,"EGENERADA"
	,"EACREDITADA"
	,"EPOSIBLE"
	,"EPRONOSTICO"
	,"EVERTIDA"
	,"ETAKEORPAY"
FROM tmp_auto_po ON CONFLICT DO NOTHING;

INSERT INTO smec.po_general_renovables
SELECT "Date Hour"
	,"GRUPO"
	,"EGENERADA"
	,"EACREDITADA"
	,"EPOSIBLE"
	,"EPRONOSTICO"
	,"EVERTIDA"
	,"ETAKEORPAY"
FROM tmp_auto_po ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS tmp_auto_po;

CREATE TEMP TABLE tmp_auto_po (date_hour timestamptz
		,grupo TEXT
		,arl INTEGER
		,estado_ope TEXT
		,pi_sotr NUMERIC
		,arl_econ INTEGER
		,est_remun TEXT
		,energia NUMERIC
		,precio_nodo NUMERIC
		,pr_rem_energia NUMERIC
		,smec TEXT
		,pot_disp NUMERIC
		,pot_ope_cpo NUMERIC
		,compra_spot NUMERIC
		,sctd NUMERIC
		,sco NUMERIC
		,pind NUMERIC
		,pindprog NUMERIC
		,pindforz NUMERIC
		,date text
		,hour integer);

COPY tmp_auto_po(
		grupo
		,hour
		,arl 
		,estado_ope 
		,pi_sotr 
		,arl_econ 
		,est_remun 
		,energia 
		,precio_nodo 
		,pr_rem_energia 
		,smec 
		,pot_disp 
		,pot_ope_cpo 
		,compra_spot 
		,sctd 
		,sco 
		,pind 
		,pindprog 
		,pindforz) 
FROM 'C:\Users\Administrador\Desktop\POsept\vg15.csv' DELIMITER ',' NULL AS '';

COPY tmp_auto_po("date")
FROM 'C:\Users\Administrador\Desktop\POsept\fecha15.csv' DELIMITER ',';

UPDATE tmp_auto_po
SET DATE = datefix.DATE
FROM (
	SELECT DATE
	FROM tmp_auto_po
	WHERE grupo IS NULL
	) AS datefix;

ALTER TABLE tmp_auto_po

ALTER COLUMN DATE TYPE timestamptz USING to_timestamp (
	DATE
	,'YYYY-MM-DD hh24:mi:ss'
	);

DELETE FROM tmp_auto_po WHERE grupo IS NULL;

UPDATE tmp_auto_po
SET date_hour = datefix.date2
FROM (
	SELECT grupo
		,hour
		,compra_spot
		,DATE + interval '1 hour' * "hour" AS date2
	FROM tmp_auto_po
	) AS datefix
WHERE datefix.compra_spot = tmp_auto_po.compra_spot
	AND datefix.hour = tmp_auto_po.hour
	AND datefix.grupo = tmp_auto_po.grupo;

ALTER TABLE tmp_auto_po DROP COLUMN DATE, DROP COLUMN hour;

UPDATE smec.po
SET "EIMPORTADA" = tmp_auto_po.compra_spot
FROM (
	SELECT grupo
		,date_hour
		,compra_spot
	FROM tmp_auto_po
	) AS tmp_auto_po
WHERE tmp_auto_po.grupo = po."GRUPO"
	AND tmp_auto_po.date_hour = po."Date Hour";

UPDATE smec.po
SET pot_disp = tmp_auto_po.pot_disp
FROM (
	SELECT grupo
		,date_hour
		,pot_disp
	FROM tmp_auto_po
	) AS tmp_auto_po
WHERE tmp_auto_po.grupo = po."GRUPO"
	AND tmp_auto_po.date_hour = po."Date Hour";

INSERT INTO smec.valores_generadores SELECT date_hour 
		,grupo 
		,arl 
		,estado_ope 
		,pi_sotr 
		,arl_econ 
		,est_remun 
		,energia 
		,precio_nodo 
		,pr_rem_energia 
		,smec 
		,pot_disp 
		,pot_ope_cpo 
		,compra_spot 
		,sctd 
		,sco 
		,pind 
		,pindprog 
		,pindforz 
		FROM tmp_auto_po ON CONFLICT DO NOTHING;


DROP TABLE

IF EXISTS tmp_auto_po;
	CREATE TEMP TABLE tmp_auto_po (
		"Date Hour" timestamptz
		,"GRUPO" TEXT
		,"EGENERADA" NUMERIC
		,"EACREDITADA" NUMERIC
		,"EPOSIBLE" NUMERIC
		,"EPRONOSTICO" NUMERIC
		,"EVERTIDA" NUMERIC
		,"ETAKEORPAY" NUMERIC
		,DATE TEXT
		,hour INTEGER
		);

COPY tmp_auto_po("GRUPO", hour, "EGENERADA", "EACREDITADA", "EPOSIBLE", "EPRONOSTICO", "EVERTIDA", "ETAKEORPAY")
FROM 'C:\Users\Administrador\Desktop\POsept\er16.csv' DELIMITER ',';

COPY tmp_auto_po("date")
FROM 'C:\Users\Administrador\Desktop\POsept\fecha16.csv' DELIMITER ',';

UPDATE tmp_auto_po
SET DATE = datefix.DATE
FROM (
	SELECT DATE
	FROM tmp_auto_po
	WHERE "GRUPO" IS NULL
	) AS datefix;

ALTER TABLE tmp_auto_po

ALTER COLUMN DATE TYPE timestamptz USING to_timestamp (
	DATE
	,'YYYY-MM-DD hh24:mi:ss'
	);

DELETE
FROM tmp_auto_po
WHERE "GRUPO" IS NULL;

UPDATE tmp_auto_po
SET "Date Hour" = datefix.date2
FROM (
	SELECT "GRUPO"
		,hour
		,"EGENERADA"
		,DATE + interval '1 hour' * "hour" AS date2
	FROM tmp_auto_po
	) AS datefix
WHERE datefix."EGENERADA" = tmp_auto_po."EGENERADA"
	AND datefix.hour = tmp_auto_po.hour
	AND datefix."GRUPO" = tmp_auto_po."GRUPO";

ALTER TABLE tmp_auto_po

DROP COLUMN DATE
	,

DROP COLUMN hour;

INSERT INTO smec.po
SELECT "Date Hour"
	,"GRUPO"
	,"EGENERADA"
	,"EACREDITADA"
	,"EPOSIBLE"
	,"EPRONOSTICO"
	,"EVERTIDA"
	,"ETAKEORPAY"
FROM tmp_auto_po ON CONFLICT DO NOTHING;

INSERT INTO smec.po_general_renovables
SELECT "Date Hour"
	,"GRUPO"
	,"EGENERADA"
	,"EACREDITADA"
	,"EPOSIBLE"
	,"EPRONOSTICO"
	,"EVERTIDA"
	,"ETAKEORPAY"
FROM tmp_auto_po ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS tmp_auto_po;

CREATE TEMP TABLE tmp_auto_po (date_hour timestamptz
		,grupo TEXT
		,arl INTEGER
		,estado_ope TEXT
		,pi_sotr NUMERIC
		,arl_econ INTEGER
		,est_remun TEXT
		,energia NUMERIC
		,precio_nodo NUMERIC
		,pr_rem_energia NUMERIC
		,smec TEXT
		,pot_disp NUMERIC
		,pot_ope_cpo NUMERIC
		,compra_spot NUMERIC
		,sctd NUMERIC
		,sco NUMERIC
		,pind NUMERIC
		,pindprog NUMERIC
		,pindforz NUMERIC
		,date text
		,hour integer);

COPY tmp_auto_po(
		grupo
		,hour
		,arl 
		,estado_ope 
		,pi_sotr 
		,arl_econ 
		,est_remun 
		,energia 
		,precio_nodo 
		,pr_rem_energia 
		,smec 
		,pot_disp 
		,pot_ope_cpo 
		,compra_spot 
		,sctd 
		,sco 
		,pind 
		,pindprog 
		,pindforz) 
FROM 'C:\Users\Administrador\Desktop\POsept\vg16.csv' DELIMITER ',' NULL AS '';

COPY tmp_auto_po("date")
FROM 'C:\Users\Administrador\Desktop\POsept\fecha16.csv' DELIMITER ',';

UPDATE tmp_auto_po
SET DATE = datefix.DATE
FROM (
	SELECT DATE
	FROM tmp_auto_po
	WHERE grupo IS NULL
	) AS datefix;

ALTER TABLE tmp_auto_po

ALTER COLUMN DATE TYPE timestamptz USING to_timestamp (
	DATE
	,'YYYY-MM-DD hh24:mi:ss'
	);

DELETE FROM tmp_auto_po WHERE grupo IS NULL;

UPDATE tmp_auto_po
SET date_hour = datefix.date2
FROM (
	SELECT grupo
		,hour
		,compra_spot
		,DATE + interval '1 hour' * "hour" AS date2
	FROM tmp_auto_po
	) AS datefix
WHERE datefix.compra_spot = tmp_auto_po.compra_spot
	AND datefix.hour = tmp_auto_po.hour
	AND datefix.grupo = tmp_auto_po.grupo;

ALTER TABLE tmp_auto_po DROP COLUMN DATE, DROP COLUMN hour;

UPDATE smec.po
SET "EIMPORTADA" = tmp_auto_po.compra_spot
FROM (
	SELECT grupo
		,date_hour
		,compra_spot
	FROM tmp_auto_po
	) AS tmp_auto_po
WHERE tmp_auto_po.grupo = po."GRUPO"
	AND tmp_auto_po.date_hour = po."Date Hour";

UPDATE smec.po
SET pot_disp = tmp_auto_po.pot_disp
FROM (
	SELECT grupo
		,date_hour
		,pot_disp
	FROM tmp_auto_po
	) AS tmp_auto_po
WHERE tmp_auto_po.grupo = po."GRUPO"
	AND tmp_auto_po.date_hour = po."Date Hour";

INSERT INTO smec.valores_generadores SELECT date_hour 
		,grupo 
		,arl 
		,estado_ope 
		,pi_sotr 
		,arl_econ 
		,est_remun 
		,energia 
		,precio_nodo 
		,pr_rem_energia 
		,smec 
		,pot_disp 
		,pot_ope_cpo 
		,compra_spot 
		,sctd 
		,sco 
		,pind 
		,pindprog 
		,pindforz 
		FROM tmp_auto_po ON CONFLICT DO NOTHING;


DROP TABLE

IF EXISTS tmp_auto_po;
	CREATE TEMP TABLE tmp_auto_po (
		"Date Hour" timestamptz
		,"GRUPO" TEXT
		,"EGENERADA" NUMERIC
		,"EACREDITADA" NUMERIC
		,"EPOSIBLE" NUMERIC
		,"EPRONOSTICO" NUMERIC
		,"EVERTIDA" NUMERIC
		,"ETAKEORPAY" NUMERIC
		,DATE TEXT
		,hour INTEGER
		);

COPY tmp_auto_po("GRUPO", hour, "EGENERADA", "EACREDITADA", "EPOSIBLE", "EPRONOSTICO", "EVERTIDA", "ETAKEORPAY")
FROM 'C:\Users\Administrador\Desktop\POsept\er17.csv' DELIMITER ',';

COPY tmp_auto_po("date")
FROM 'C:\Users\Administrador\Desktop\POsept\fecha17.csv' DELIMITER ',';

UPDATE tmp_auto_po
SET DATE = datefix.DATE
FROM (
	SELECT DATE
	FROM tmp_auto_po
	WHERE "GRUPO" IS NULL
	) AS datefix;

ALTER TABLE tmp_auto_po

ALTER COLUMN DATE TYPE timestamptz USING to_timestamp (
	DATE
	,'YYYY-MM-DD hh24:mi:ss'
	);

DELETE
FROM tmp_auto_po
WHERE "GRUPO" IS NULL;

UPDATE tmp_auto_po
SET "Date Hour" = datefix.date2
FROM (
	SELECT "GRUPO"
		,hour
		,"EGENERADA"
		,DATE + interval '1 hour' * "hour" AS date2
	FROM tmp_auto_po
	) AS datefix
WHERE datefix."EGENERADA" = tmp_auto_po."EGENERADA"
	AND datefix.hour = tmp_auto_po.hour
	AND datefix."GRUPO" = tmp_auto_po."GRUPO";

ALTER TABLE tmp_auto_po

DROP COLUMN DATE
	,

DROP COLUMN hour;

INSERT INTO smec.po
SELECT "Date Hour"
	,"GRUPO"
	,"EGENERADA"
	,"EACREDITADA"
	,"EPOSIBLE"
	,"EPRONOSTICO"
	,"EVERTIDA"
	,"ETAKEORPAY"
FROM tmp_auto_po ON CONFLICT DO NOTHING;

INSERT INTO smec.po_general_renovables
SELECT "Date Hour"
	,"GRUPO"
	,"EGENERADA"
	,"EACREDITADA"
	,"EPOSIBLE"
	,"EPRONOSTICO"
	,"EVERTIDA"
	,"ETAKEORPAY"
FROM tmp_auto_po ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS tmp_auto_po;

CREATE TEMP TABLE tmp_auto_po (date_hour timestamptz
		,grupo TEXT
		,arl INTEGER
		,estado_ope TEXT
		,pi_sotr NUMERIC
		,arl_econ INTEGER
		,est_remun TEXT
		,energia NUMERIC
		,precio_nodo NUMERIC
		,pr_rem_energia NUMERIC
		,smec TEXT
		,pot_disp NUMERIC
		,pot_ope_cpo NUMERIC
		,compra_spot NUMERIC
		,sctd NUMERIC
		,sco NUMERIC
		,pind NUMERIC
		,pindprog NUMERIC
		,pindforz NUMERIC
		,date text
		,hour integer);

COPY tmp_auto_po(
		grupo
		,hour
		,arl 
		,estado_ope 
		,pi_sotr 
		,arl_econ 
		,est_remun 
		,energia 
		,precio_nodo 
		,pr_rem_energia 
		,smec 
		,pot_disp 
		,pot_ope_cpo 
		,compra_spot 
		,sctd 
		,sco 
		,pind 
		,pindprog 
		,pindforz) 
FROM 'C:\Users\Administrador\Desktop\POsept\vg17.csv' DELIMITER ',' NULL AS '';

COPY tmp_auto_po("date")
FROM 'C:\Users\Administrador\Desktop\POsept\fecha17.csv' DELIMITER ',';

UPDATE tmp_auto_po
SET DATE = datefix.DATE
FROM (
	SELECT DATE
	FROM tmp_auto_po
	WHERE grupo IS NULL
	) AS datefix;

ALTER TABLE tmp_auto_po

ALTER COLUMN DATE TYPE timestamptz USING to_timestamp (
	DATE
	,'YYYY-MM-DD hh24:mi:ss'
	);

DELETE FROM tmp_auto_po WHERE grupo IS NULL;

UPDATE tmp_auto_po
SET date_hour = datefix.date2
FROM (
	SELECT grupo
		,hour
		,compra_spot
		,DATE + interval '1 hour' * "hour" AS date2
	FROM tmp_auto_po
	) AS datefix
WHERE datefix.compra_spot = tmp_auto_po.compra_spot
	AND datefix.hour = tmp_auto_po.hour
	AND datefix.grupo = tmp_auto_po.grupo;

ALTER TABLE tmp_auto_po DROP COLUMN DATE, DROP COLUMN hour;

UPDATE smec.po
SET "EIMPORTADA" = tmp_auto_po.compra_spot
FROM (
	SELECT grupo
		,date_hour
		,compra_spot
	FROM tmp_auto_po
	) AS tmp_auto_po
WHERE tmp_auto_po.grupo = po."GRUPO"
	AND tmp_auto_po.date_hour = po."Date Hour";

UPDATE smec.po
SET pot_disp = tmp_auto_po.pot_disp
FROM (
	SELECT grupo
		,date_hour
		,pot_disp
	FROM tmp_auto_po
	) AS tmp_auto_po
WHERE tmp_auto_po.grupo = po."GRUPO"
	AND tmp_auto_po.date_hour = po."Date Hour";

INSERT INTO smec.valores_generadores SELECT date_hour 
		,grupo 
		,arl 
		,estado_ope 
		,pi_sotr 
		,arl_econ 
		,est_remun 
		,energia 
		,precio_nodo 
		,pr_rem_energia 
		,smec 
		,pot_disp 
		,pot_ope_cpo 
		,compra_spot 
		,sctd 
		,sco 
		,pind 
		,pindprog 
		,pindforz 
		FROM tmp_auto_po ON CONFLICT DO NOTHING;


DROP TABLE

IF EXISTS tmp_auto_po;
	CREATE TEMP TABLE tmp_auto_po (
		"Date Hour" timestamptz
		,"GRUPO" TEXT
		,"EGENERADA" NUMERIC
		,"EACREDITADA" NUMERIC
		,"EPOSIBLE" NUMERIC
		,"EPRONOSTICO" NUMERIC
		,"EVERTIDA" NUMERIC
		,"ETAKEORPAY" NUMERIC
		,DATE TEXT
		,hour INTEGER
		);

COPY tmp_auto_po("GRUPO", hour, "EGENERADA", "EACREDITADA", "EPOSIBLE", "EPRONOSTICO", "EVERTIDA", "ETAKEORPAY")
FROM 'C:\Users\Administrador\Desktop\POsept\er18.csv' DELIMITER ',';

COPY tmp_auto_po("date")
FROM 'C:\Users\Administrador\Desktop\POsept\fecha18.csv' DELIMITER ',';

UPDATE tmp_auto_po
SET DATE = datefix.DATE
FROM (
	SELECT DATE
	FROM tmp_auto_po
	WHERE "GRUPO" IS NULL
	) AS datefix;

ALTER TABLE tmp_auto_po

ALTER COLUMN DATE TYPE timestamptz USING to_timestamp (
	DATE
	,'YYYY-MM-DD hh24:mi:ss'
	);

DELETE
FROM tmp_auto_po
WHERE "GRUPO" IS NULL;

UPDATE tmp_auto_po
SET "Date Hour" = datefix.date2
FROM (
	SELECT "GRUPO"
		,hour
		,"EGENERADA"
		,DATE + interval '1 hour' * "hour" AS date2
	FROM tmp_auto_po
	) AS datefix
WHERE datefix."EGENERADA" = tmp_auto_po."EGENERADA"
	AND datefix.hour = tmp_auto_po.hour
	AND datefix."GRUPO" = tmp_auto_po."GRUPO";

ALTER TABLE tmp_auto_po

DROP COLUMN DATE
	,

DROP COLUMN hour;

INSERT INTO smec.po
SELECT "Date Hour"
	,"GRUPO"
	,"EGENERADA"
	,"EACREDITADA"
	,"EPOSIBLE"
	,"EPRONOSTICO"
	,"EVERTIDA"
	,"ETAKEORPAY"
FROM tmp_auto_po ON CONFLICT DO NOTHING;

INSERT INTO smec.po_general_renovables
SELECT "Date Hour"
	,"GRUPO"
	,"EGENERADA"
	,"EACREDITADA"
	,"EPOSIBLE"
	,"EPRONOSTICO"
	,"EVERTIDA"
	,"ETAKEORPAY"
FROM tmp_auto_po ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS tmp_auto_po;

CREATE TEMP TABLE tmp_auto_po (date_hour timestamptz
		,grupo TEXT
		,arl INTEGER
		,estado_ope TEXT
		,pi_sotr NUMERIC
		,arl_econ INTEGER
		,est_remun TEXT
		,energia NUMERIC
		,precio_nodo NUMERIC
		,pr_rem_energia NUMERIC
		,smec TEXT
		,pot_disp NUMERIC
		,pot_ope_cpo NUMERIC
		,compra_spot NUMERIC
		,sctd NUMERIC
		,sco NUMERIC
		,pind NUMERIC
		,pindprog NUMERIC
		,pindforz NUMERIC
		,date text
		,hour integer);

COPY tmp_auto_po(
		grupo
		,hour
		,arl 
		,estado_ope 
		,pi_sotr 
		,arl_econ 
		,est_remun 
		,energia 
		,precio_nodo 
		,pr_rem_energia 
		,smec 
		,pot_disp 
		,pot_ope_cpo 
		,compra_spot 
		,sctd 
		,sco 
		,pind 
		,pindprog 
		,pindforz) 
FROM 'C:\Users\Administrador\Desktop\POsept\vg18.csv' DELIMITER ',' NULL AS '';

COPY tmp_auto_po("date")
FROM 'C:\Users\Administrador\Desktop\POsept\fecha18.csv' DELIMITER ',';

UPDATE tmp_auto_po
SET DATE = datefix.DATE
FROM (
	SELECT DATE
	FROM tmp_auto_po
	WHERE grupo IS NULL
	) AS datefix;

ALTER TABLE tmp_auto_po

ALTER COLUMN DATE TYPE timestamptz USING to_timestamp (
	DATE
	,'YYYY-MM-DD hh24:mi:ss'
	);

DELETE FROM tmp_auto_po WHERE grupo IS NULL;

UPDATE tmp_auto_po
SET date_hour = datefix.date2
FROM (
	SELECT grupo
		,hour
		,compra_spot
		,DATE + interval '1 hour' * "hour" AS date2
	FROM tmp_auto_po
	) AS datefix
WHERE datefix.compra_spot = tmp_auto_po.compra_spot
	AND datefix.hour = tmp_auto_po.hour
	AND datefix.grupo = tmp_auto_po.grupo;

ALTER TABLE tmp_auto_po DROP COLUMN DATE, DROP COLUMN hour;

UPDATE smec.po
SET "EIMPORTADA" = tmp_auto_po.compra_spot
FROM (
	SELECT grupo
		,date_hour
		,compra_spot
	FROM tmp_auto_po
	) AS tmp_auto_po
WHERE tmp_auto_po.grupo = po."GRUPO"
	AND tmp_auto_po.date_hour = po."Date Hour";

UPDATE smec.po
SET pot_disp = tmp_auto_po.pot_disp
FROM (
	SELECT grupo
		,date_hour
		,pot_disp
	FROM tmp_auto_po
	) AS tmp_auto_po
WHERE tmp_auto_po.grupo = po."GRUPO"
	AND tmp_auto_po.date_hour = po."Date Hour";

INSERT INTO smec.valores_generadores SELECT date_hour 
		,grupo 
		,arl 
		,estado_ope 
		,pi_sotr 
		,arl_econ 
		,est_remun 
		,energia 
		,precio_nodo 
		,pr_rem_energia 
		,smec 
		,pot_disp 
		,pot_ope_cpo 
		,compra_spot 
		,sctd 
		,sco 
		,pind 
		,pindprog 
		,pindforz 
		FROM tmp_auto_po ON CONFLICT DO NOTHING;


DROP TABLE

IF EXISTS tmp_auto_po;
	CREATE TEMP TABLE tmp_auto_po (
		"Date Hour" timestamptz
		,"GRUPO" TEXT
		,"EGENERADA" NUMERIC
		,"EACREDITADA" NUMERIC
		,"EPOSIBLE" NUMERIC
		,"EPRONOSTICO" NUMERIC
		,"EVERTIDA" NUMERIC
		,"ETAKEORPAY" NUMERIC
		,DATE TEXT
		,hour INTEGER
		);

COPY tmp_auto_po("GRUPO", hour, "EGENERADA", "EACREDITADA", "EPOSIBLE", "EPRONOSTICO", "EVERTIDA", "ETAKEORPAY")
FROM 'C:\Users\Administrador\Desktop\POsept\er19.csv' DELIMITER ',';

COPY tmp_auto_po("date")
FROM 'C:\Users\Administrador\Desktop\POsept\fecha19.csv' DELIMITER ',';

UPDATE tmp_auto_po
SET DATE = datefix.DATE
FROM (
	SELECT DATE
	FROM tmp_auto_po
	WHERE "GRUPO" IS NULL
	) AS datefix;

ALTER TABLE tmp_auto_po

ALTER COLUMN DATE TYPE timestamptz USING to_timestamp (
	DATE
	,'YYYY-MM-DD hh24:mi:ss'
	);

DELETE
FROM tmp_auto_po
WHERE "GRUPO" IS NULL;

UPDATE tmp_auto_po
SET "Date Hour" = datefix.date2
FROM (
	SELECT "GRUPO"
		,hour
		,"EGENERADA"
		,DATE + interval '1 hour' * "hour" AS date2
	FROM tmp_auto_po
	) AS datefix
WHERE datefix."EGENERADA" = tmp_auto_po."EGENERADA"
	AND datefix.hour = tmp_auto_po.hour
	AND datefix."GRUPO" = tmp_auto_po."GRUPO";

ALTER TABLE tmp_auto_po

DROP COLUMN DATE
	,

DROP COLUMN hour;

INSERT INTO smec.po
SELECT "Date Hour"
	,"GRUPO"
	,"EGENERADA"
	,"EACREDITADA"
	,"EPOSIBLE"
	,"EPRONOSTICO"
	,"EVERTIDA"
	,"ETAKEORPAY"
FROM tmp_auto_po ON CONFLICT DO NOTHING;

INSERT INTO smec.po_general_renovables
SELECT "Date Hour"
	,"GRUPO"
	,"EGENERADA"
	,"EACREDITADA"
	,"EPOSIBLE"
	,"EPRONOSTICO"
	,"EVERTIDA"
	,"ETAKEORPAY"
FROM tmp_auto_po ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS tmp_auto_po;

CREATE TEMP TABLE tmp_auto_po (date_hour timestamptz
		,grupo TEXT
		,arl INTEGER
		,estado_ope TEXT
		,pi_sotr NUMERIC
		,arl_econ INTEGER
		,est_remun TEXT
		,energia NUMERIC
		,precio_nodo NUMERIC
		,pr_rem_energia NUMERIC
		,smec TEXT
		,pot_disp NUMERIC
		,pot_ope_cpo NUMERIC
		,compra_spot NUMERIC
		,sctd NUMERIC
		,sco NUMERIC
		,pind NUMERIC
		,pindprog NUMERIC
		,pindforz NUMERIC
		,date text
		,hour integer);

COPY tmp_auto_po(
		grupo
		,hour
		,arl 
		,estado_ope 
		,pi_sotr 
		,arl_econ 
		,est_remun 
		,energia 
		,precio_nodo 
		,pr_rem_energia 
		,smec 
		,pot_disp 
		,pot_ope_cpo 
		,compra_spot 
		,sctd 
		,sco 
		,pind 
		,pindprog 
		,pindforz) 
FROM 'C:\Users\Administrador\Desktop\POsept\vg19.csv' DELIMITER ',' NULL AS '';

COPY tmp_auto_po("date")
FROM 'C:\Users\Administrador\Desktop\POsept\fecha19.csv' DELIMITER ',';

UPDATE tmp_auto_po
SET DATE = datefix.DATE
FROM (
	SELECT DATE
	FROM tmp_auto_po
	WHERE grupo IS NULL
	) AS datefix;

ALTER TABLE tmp_auto_po

ALTER COLUMN DATE TYPE timestamptz USING to_timestamp (
	DATE
	,'YYYY-MM-DD hh24:mi:ss'
	);

DELETE FROM tmp_auto_po WHERE grupo IS NULL;

UPDATE tmp_auto_po
SET date_hour = datefix.date2
FROM (
	SELECT grupo
		,hour
		,compra_spot
		,DATE + interval '1 hour' * "hour" AS date2
	FROM tmp_auto_po
	) AS datefix
WHERE datefix.compra_spot = tmp_auto_po.compra_spot
	AND datefix.hour = tmp_auto_po.hour
	AND datefix.grupo = tmp_auto_po.grupo;

ALTER TABLE tmp_auto_po DROP COLUMN DATE, DROP COLUMN hour;

UPDATE smec.po
SET "EIMPORTADA" = tmp_auto_po.compra_spot
FROM (
	SELECT grupo
		,date_hour
		,compra_spot
	FROM tmp_auto_po
	) AS tmp_auto_po
WHERE tmp_auto_po.grupo = po."GRUPO"
	AND tmp_auto_po.date_hour = po."Date Hour";

UPDATE smec.po
SET pot_disp = tmp_auto_po.pot_disp
FROM (
	SELECT grupo
		,date_hour
		,pot_disp
	FROM tmp_auto_po
	) AS tmp_auto_po
WHERE tmp_auto_po.grupo = po."GRUPO"
	AND tmp_auto_po.date_hour = po."Date Hour";

INSERT INTO smec.valores_generadores SELECT date_hour 
		,grupo 
		,arl 
		,estado_ope 
		,pi_sotr 
		,arl_econ 
		,est_remun 
		,energia 
		,precio_nodo 
		,pr_rem_energia 
		,smec 
		,pot_disp 
		,pot_ope_cpo 
		,compra_spot 
		,sctd 
		,sco 
		,pind 
		,pindprog 
		,pindforz 
		FROM tmp_auto_po ON CONFLICT DO NOTHING;


DROP TABLE

IF EXISTS tmp_auto_po;
	CREATE TEMP TABLE tmp_auto_po (
		"Date Hour" timestamptz
		,"GRUPO" TEXT
		,"EGENERADA" NUMERIC
		,"EACREDITADA" NUMERIC
		,"EPOSIBLE" NUMERIC
		,"EPRONOSTICO" NUMERIC
		,"EVERTIDA" NUMERIC
		,"ETAKEORPAY" NUMERIC
		,DATE TEXT
		,hour INTEGER
		);

COPY tmp_auto_po("GRUPO", hour, "EGENERADA", "EACREDITADA", "EPOSIBLE", "EPRONOSTICO", "EVERTIDA", "ETAKEORPAY")
FROM 'C:\Users\Administrador\Desktop\POsept\er20.csv' DELIMITER ',';

COPY tmp_auto_po("date")
FROM 'C:\Users\Administrador\Desktop\POsept\fecha20.csv' DELIMITER ',';

UPDATE tmp_auto_po
SET DATE = datefix.DATE
FROM (
	SELECT DATE
	FROM tmp_auto_po
	WHERE "GRUPO" IS NULL
	) AS datefix;

ALTER TABLE tmp_auto_po

ALTER COLUMN DATE TYPE timestamptz USING to_timestamp (
	DATE
	,'YYYY-MM-DD hh24:mi:ss'
	);

DELETE
FROM tmp_auto_po
WHERE "GRUPO" IS NULL;

UPDATE tmp_auto_po
SET "Date Hour" = datefix.date2
FROM (
	SELECT "GRUPO"
		,hour
		,"EGENERADA"
		,DATE + interval '1 hour' * "hour" AS date2
	FROM tmp_auto_po
	) AS datefix
WHERE datefix."EGENERADA" = tmp_auto_po."EGENERADA"
	AND datefix.hour = tmp_auto_po.hour
	AND datefix."GRUPO" = tmp_auto_po."GRUPO";

ALTER TABLE tmp_auto_po

DROP COLUMN DATE
	,

DROP COLUMN hour;

INSERT INTO smec.po
SELECT "Date Hour"
	,"GRUPO"
	,"EGENERADA"
	,"EACREDITADA"
	,"EPOSIBLE"
	,"EPRONOSTICO"
	,"EVERTIDA"
	,"ETAKEORPAY"
FROM tmp_auto_po ON CONFLICT DO NOTHING;

INSERT INTO smec.po_general_renovables
SELECT "Date Hour"
	,"GRUPO"
	,"EGENERADA"
	,"EACREDITADA"
	,"EPOSIBLE"
	,"EPRONOSTICO"
	,"EVERTIDA"
	,"ETAKEORPAY"
FROM tmp_auto_po ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS tmp_auto_po;

CREATE TEMP TABLE tmp_auto_po (date_hour timestamptz
		,grupo TEXT
		,arl INTEGER
		,estado_ope TEXT
		,pi_sotr NUMERIC
		,arl_econ INTEGER
		,est_remun TEXT
		,energia NUMERIC
		,precio_nodo NUMERIC
		,pr_rem_energia NUMERIC
		,smec TEXT
		,pot_disp NUMERIC
		,pot_ope_cpo NUMERIC
		,compra_spot NUMERIC
		,sctd NUMERIC
		,sco NUMERIC
		,pind NUMERIC
		,pindprog NUMERIC
		,pindforz NUMERIC
		,date text
		,hour integer);

COPY tmp_auto_po(
		grupo
		,hour
		,arl 
		,estado_ope 
		,pi_sotr 
		,arl_econ 
		,est_remun 
		,energia 
		,precio_nodo 
		,pr_rem_energia 
		,smec 
		,pot_disp 
		,pot_ope_cpo 
		,compra_spot 
		,sctd 
		,sco 
		,pind 
		,pindprog 
		,pindforz) 
FROM 'C:\Users\Administrador\Desktop\POsept\vg20.csv' DELIMITER ',' NULL AS '';

COPY tmp_auto_po("date")
FROM 'C:\Users\Administrador\Desktop\POsept\fecha20.csv' DELIMITER ',';

UPDATE tmp_auto_po
SET DATE = datefix.DATE
FROM (
	SELECT DATE
	FROM tmp_auto_po
	WHERE grupo IS NULL
	) AS datefix;

ALTER TABLE tmp_auto_po

ALTER COLUMN DATE TYPE timestamptz USING to_timestamp (
	DATE
	,'YYYY-MM-DD hh24:mi:ss'
	);

DELETE FROM tmp_auto_po WHERE grupo IS NULL;

UPDATE tmp_auto_po
SET date_hour = datefix.date2
FROM (
	SELECT grupo
		,hour
		,compra_spot
		,DATE + interval '1 hour' * "hour" AS date2
	FROM tmp_auto_po
	) AS datefix
WHERE datefix.compra_spot = tmp_auto_po.compra_spot
	AND datefix.hour = tmp_auto_po.hour
	AND datefix.grupo = tmp_auto_po.grupo;

ALTER TABLE tmp_auto_po DROP COLUMN DATE, DROP COLUMN hour;

UPDATE smec.po
SET "EIMPORTADA" = tmp_auto_po.compra_spot
FROM (
	SELECT grupo
		,date_hour
		,compra_spot
	FROM tmp_auto_po
	) AS tmp_auto_po
WHERE tmp_auto_po.grupo = po."GRUPO"
	AND tmp_auto_po.date_hour = po."Date Hour";

UPDATE smec.po
SET pot_disp = tmp_auto_po.pot_disp
FROM (
	SELECT grupo
		,date_hour
		,pot_disp
	FROM tmp_auto_po
	) AS tmp_auto_po
WHERE tmp_auto_po.grupo = po."GRUPO"
	AND tmp_auto_po.date_hour = po."Date Hour";

INSERT INTO smec.valores_generadores SELECT date_hour 
		,grupo 
		,arl 
		,estado_ope 
		,pi_sotr 
		,arl_econ 
		,est_remun 
		,energia 
		,precio_nodo 
		,pr_rem_energia 
		,smec 
		,pot_disp 
		,pot_ope_cpo 
		,compra_spot 
		,sctd 
		,sco 
		,pind 
		,pindprog 
		,pindforz 
		FROM tmp_auto_po ON CONFLICT DO NOTHING;


DROP TABLE

IF EXISTS tmp_auto_po;
	CREATE TEMP TABLE tmp_auto_po (
		"Date Hour" timestamptz
		,"GRUPO" TEXT
		,"EGENERADA" NUMERIC
		,"EACREDITADA" NUMERIC
		,"EPOSIBLE" NUMERIC
		,"EPRONOSTICO" NUMERIC
		,"EVERTIDA" NUMERIC
		,"ETAKEORPAY" NUMERIC
		,DATE TEXT
		,hour INTEGER
		);

COPY tmp_auto_po("GRUPO", hour, "EGENERADA", "EACREDITADA", "EPOSIBLE", "EPRONOSTICO", "EVERTIDA", "ETAKEORPAY")
FROM 'C:\Users\Administrador\Desktop\POsept\er21.csv' DELIMITER ',';

COPY tmp_auto_po("date")
FROM 'C:\Users\Administrador\Desktop\POsept\fecha21.csv' DELIMITER ',';

UPDATE tmp_auto_po
SET DATE = datefix.DATE
FROM (
	SELECT DATE
	FROM tmp_auto_po
	WHERE "GRUPO" IS NULL
	) AS datefix;

ALTER TABLE tmp_auto_po

ALTER COLUMN DATE TYPE timestamptz USING to_timestamp (
	DATE
	,'YYYY-MM-DD hh24:mi:ss'
	);

DELETE
FROM tmp_auto_po
WHERE "GRUPO" IS NULL;

UPDATE tmp_auto_po
SET "Date Hour" = datefix.date2
FROM (
	SELECT "GRUPO"
		,hour
		,"EGENERADA"
		,DATE + interval '1 hour' * "hour" AS date2
	FROM tmp_auto_po
	) AS datefix
WHERE datefix."EGENERADA" = tmp_auto_po."EGENERADA"
	AND datefix.hour = tmp_auto_po.hour
	AND datefix."GRUPO" = tmp_auto_po."GRUPO";

ALTER TABLE tmp_auto_po

DROP COLUMN DATE
	,

DROP COLUMN hour;

INSERT INTO smec.po
SELECT "Date Hour"
	,"GRUPO"
	,"EGENERADA"
	,"EACREDITADA"
	,"EPOSIBLE"
	,"EPRONOSTICO"
	,"EVERTIDA"
	,"ETAKEORPAY"
FROM tmp_auto_po ON CONFLICT DO NOTHING;

INSERT INTO smec.po_general_renovables
SELECT "Date Hour"
	,"GRUPO"
	,"EGENERADA"
	,"EACREDITADA"
	,"EPOSIBLE"
	,"EPRONOSTICO"
	,"EVERTIDA"
	,"ETAKEORPAY"
FROM tmp_auto_po ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS tmp_auto_po;

CREATE TEMP TABLE tmp_auto_po (date_hour timestamptz
		,grupo TEXT
		,arl INTEGER
		,estado_ope TEXT
		,pi_sotr NUMERIC
		,arl_econ INTEGER
		,est_remun TEXT
		,energia NUMERIC
		,precio_nodo NUMERIC
		,pr_rem_energia NUMERIC
		,smec TEXT
		,pot_disp NUMERIC
		,pot_ope_cpo NUMERIC
		,compra_spot NUMERIC
		,sctd NUMERIC
		,sco NUMERIC
		,pind NUMERIC
		,pindprog NUMERIC
		,pindforz NUMERIC
		,date text
		,hour integer);

COPY tmp_auto_po(
		grupo
		,hour
		,arl 
		,estado_ope 
		,pi_sotr 
		,arl_econ 
		,est_remun 
		,energia 
		,precio_nodo 
		,pr_rem_energia 
		,smec 
		,pot_disp 
		,pot_ope_cpo 
		,compra_spot 
		,sctd 
		,sco 
		,pind 
		,pindprog 
		,pindforz) 
FROM 'C:\Users\Administrador\Desktop\POsept\vg21.csv' DELIMITER ',' NULL AS '';

COPY tmp_auto_po("date")
FROM 'C:\Users\Administrador\Desktop\POsept\fecha21.csv' DELIMITER ',';

UPDATE tmp_auto_po
SET DATE = datefix.DATE
FROM (
	SELECT DATE
	FROM tmp_auto_po
	WHERE grupo IS NULL
	) AS datefix;

ALTER TABLE tmp_auto_po

ALTER COLUMN DATE TYPE timestamptz USING to_timestamp (
	DATE
	,'YYYY-MM-DD hh24:mi:ss'
	);

DELETE FROM tmp_auto_po WHERE grupo IS NULL;

UPDATE tmp_auto_po
SET date_hour = datefix.date2
FROM (
	SELECT grupo
		,hour
		,compra_spot
		,DATE + interval '1 hour' * "hour" AS date2
	FROM tmp_auto_po
	) AS datefix
WHERE datefix.compra_spot = tmp_auto_po.compra_spot
	AND datefix.hour = tmp_auto_po.hour
	AND datefix.grupo = tmp_auto_po.grupo;

ALTER TABLE tmp_auto_po DROP COLUMN DATE, DROP COLUMN hour;

UPDATE smec.po
SET "EIMPORTADA" = tmp_auto_po.compra_spot
FROM (
	SELECT grupo
		,date_hour
		,compra_spot
	FROM tmp_auto_po
	) AS tmp_auto_po
WHERE tmp_auto_po.grupo = po."GRUPO"
	AND tmp_auto_po.date_hour = po."Date Hour";

UPDATE smec.po
SET pot_disp = tmp_auto_po.pot_disp
FROM (
	SELECT grupo
		,date_hour
		,pot_disp
	FROM tmp_auto_po
	) AS tmp_auto_po
WHERE tmp_auto_po.grupo = po."GRUPO"
	AND tmp_auto_po.date_hour = po."Date Hour";

INSERT INTO smec.valores_generadores SELECT date_hour 
		,grupo 
		,arl 
		,estado_ope 
		,pi_sotr 
		,arl_econ 
		,est_remun 
		,energia 
		,precio_nodo 
		,pr_rem_energia 
		,smec 
		,pot_disp 
		,pot_ope_cpo 
		,compra_spot 
		,sctd 
		,sco 
		,pind 
		,pindprog 
		,pindforz 
		FROM tmp_auto_po ON CONFLICT DO NOTHING;


DROP TABLE

IF EXISTS tmp_auto_po;
	CREATE TEMP TABLE tmp_auto_po (
		"Date Hour" timestamptz
		,"GRUPO" TEXT
		,"EGENERADA" NUMERIC
		,"EACREDITADA" NUMERIC
		,"EPOSIBLE" NUMERIC
		,"EPRONOSTICO" NUMERIC
		,"EVERTIDA" NUMERIC
		,"ETAKEORPAY" NUMERIC
		,DATE TEXT
		,hour INTEGER
		);

COPY tmp_auto_po("GRUPO", hour, "EGENERADA", "EACREDITADA", "EPOSIBLE", "EPRONOSTICO", "EVERTIDA", "ETAKEORPAY")
FROM 'C:\Users\Administrador\Desktop\POsept\er22.csv' DELIMITER ',';

COPY tmp_auto_po("date")
FROM 'C:\Users\Administrador\Desktop\POsept\fecha22.csv' DELIMITER ',';

UPDATE tmp_auto_po
SET DATE = datefix.DATE
FROM (
	SELECT DATE
	FROM tmp_auto_po
	WHERE "GRUPO" IS NULL
	) AS datefix;

ALTER TABLE tmp_auto_po

ALTER COLUMN DATE TYPE timestamptz USING to_timestamp (
	DATE
	,'YYYY-MM-DD hh24:mi:ss'
	);

DELETE
FROM tmp_auto_po
WHERE "GRUPO" IS NULL;

UPDATE tmp_auto_po
SET "Date Hour" = datefix.date2
FROM (
	SELECT "GRUPO"
		,hour
		,"EGENERADA"
		,DATE + interval '1 hour' * "hour" AS date2
	FROM tmp_auto_po
	) AS datefix
WHERE datefix."EGENERADA" = tmp_auto_po."EGENERADA"
	AND datefix.hour = tmp_auto_po.hour
	AND datefix."GRUPO" = tmp_auto_po."GRUPO";

ALTER TABLE tmp_auto_po

DROP COLUMN DATE
	,

DROP COLUMN hour;

INSERT INTO smec.po
SELECT "Date Hour"
	,"GRUPO"
	,"EGENERADA"
	,"EACREDITADA"
	,"EPOSIBLE"
	,"EPRONOSTICO"
	,"EVERTIDA"
	,"ETAKEORPAY"
FROM tmp_auto_po ON CONFLICT DO NOTHING;

INSERT INTO smec.po_general_renovables
SELECT "Date Hour"
	,"GRUPO"
	,"EGENERADA"
	,"EACREDITADA"
	,"EPOSIBLE"
	,"EPRONOSTICO"
	,"EVERTIDA"
	,"ETAKEORPAY"
FROM tmp_auto_po ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS tmp_auto_po;

CREATE TEMP TABLE tmp_auto_po (date_hour timestamptz
		,grupo TEXT
		,arl INTEGER
		,estado_ope TEXT
		,pi_sotr NUMERIC
		,arl_econ INTEGER
		,est_remun TEXT
		,energia NUMERIC
		,precio_nodo NUMERIC
		,pr_rem_energia NUMERIC
		,smec TEXT
		,pot_disp NUMERIC
		,pot_ope_cpo NUMERIC
		,compra_spot NUMERIC
		,sctd NUMERIC
		,sco NUMERIC
		,pind NUMERIC
		,pindprog NUMERIC
		,pindforz NUMERIC
		,date text
		,hour integer);

COPY tmp_auto_po(
		grupo
		,hour
		,arl 
		,estado_ope 
		,pi_sotr 
		,arl_econ 
		,est_remun 
		,energia 
		,precio_nodo 
		,pr_rem_energia 
		,smec 
		,pot_disp 
		,pot_ope_cpo 
		,compra_spot 
		,sctd 
		,sco 
		,pind 
		,pindprog 
		,pindforz) 
FROM 'C:\Users\Administrador\Desktop\POsept\vg22.csv' DELIMITER ',' NULL AS '';

COPY tmp_auto_po("date")
FROM 'C:\Users\Administrador\Desktop\POsept\fecha22.csv' DELIMITER ',';

UPDATE tmp_auto_po
SET DATE = datefix.DATE
FROM (
	SELECT DATE
	FROM tmp_auto_po
	WHERE grupo IS NULL
	) AS datefix;

ALTER TABLE tmp_auto_po

ALTER COLUMN DATE TYPE timestamptz USING to_timestamp (
	DATE
	,'YYYY-MM-DD hh24:mi:ss'
	);

DELETE FROM tmp_auto_po WHERE grupo IS NULL;

UPDATE tmp_auto_po
SET date_hour = datefix.date2
FROM (
	SELECT grupo
		,hour
		,compra_spot
		,DATE + interval '1 hour' * "hour" AS date2
	FROM tmp_auto_po
	) AS datefix
WHERE datefix.compra_spot = tmp_auto_po.compra_spot
	AND datefix.hour = tmp_auto_po.hour
	AND datefix.grupo = tmp_auto_po.grupo;

ALTER TABLE tmp_auto_po DROP COLUMN DATE, DROP COLUMN hour;

UPDATE smec.po
SET "EIMPORTADA" = tmp_auto_po.compra_spot
FROM (
	SELECT grupo
		,date_hour
		,compra_spot
	FROM tmp_auto_po
	) AS tmp_auto_po
WHERE tmp_auto_po.grupo = po."GRUPO"
	AND tmp_auto_po.date_hour = po."Date Hour";

UPDATE smec.po
SET pot_disp = tmp_auto_po.pot_disp
FROM (
	SELECT grupo
		,date_hour
		,pot_disp
	FROM tmp_auto_po
	) AS tmp_auto_po
WHERE tmp_auto_po.grupo = po."GRUPO"
	AND tmp_auto_po.date_hour = po."Date Hour";

INSERT INTO smec.valores_generadores SELECT date_hour 
		,grupo 
		,arl 
		,estado_ope 
		,pi_sotr 
		,arl_econ 
		,est_remun 
		,energia 
		,precio_nodo 
		,pr_rem_energia 
		,smec 
		,pot_disp 
		,pot_ope_cpo 
		,compra_spot 
		,sctd 
		,sco 
		,pind 
		,pindprog 
		,pindforz 
		FROM tmp_auto_po ON CONFLICT DO NOTHING;


DROP TABLE

IF EXISTS tmp_auto_po;
	CREATE TEMP TABLE tmp_auto_po (
		"Date Hour" timestamptz
		,"GRUPO" TEXT
		,"EGENERADA" NUMERIC
		,"EACREDITADA" NUMERIC
		,"EPOSIBLE" NUMERIC
		,"EPRONOSTICO" NUMERIC
		,"EVERTIDA" NUMERIC
		,"ETAKEORPAY" NUMERIC
		,DATE TEXT
		,hour INTEGER
		);

COPY tmp_auto_po("GRUPO", hour, "EGENERADA", "EACREDITADA", "EPOSIBLE", "EPRONOSTICO", "EVERTIDA", "ETAKEORPAY")
FROM 'C:\Users\Administrador\Desktop\POsept\er23.csv' DELIMITER ',';

COPY tmp_auto_po("date")
FROM 'C:\Users\Administrador\Desktop\POsept\fecha23.csv' DELIMITER ',';

UPDATE tmp_auto_po
SET DATE = datefix.DATE
FROM (
	SELECT DATE
	FROM tmp_auto_po
	WHERE "GRUPO" IS NULL
	) AS datefix;

ALTER TABLE tmp_auto_po

ALTER COLUMN DATE TYPE timestamptz USING to_timestamp (
	DATE
	,'YYYY-MM-DD hh24:mi:ss'
	);

DELETE
FROM tmp_auto_po
WHERE "GRUPO" IS NULL;

UPDATE tmp_auto_po
SET "Date Hour" = datefix.date2
FROM (
	SELECT "GRUPO"
		,hour
		,"EGENERADA"
		,DATE + interval '1 hour' * "hour" AS date2
	FROM tmp_auto_po
	) AS datefix
WHERE datefix."EGENERADA" = tmp_auto_po."EGENERADA"
	AND datefix.hour = tmp_auto_po.hour
	AND datefix."GRUPO" = tmp_auto_po."GRUPO";

ALTER TABLE tmp_auto_po

DROP COLUMN DATE
	,

DROP COLUMN hour;

INSERT INTO smec.po
SELECT "Date Hour"
	,"GRUPO"
	,"EGENERADA"
	,"EACREDITADA"
	,"EPOSIBLE"
	,"EPRONOSTICO"
	,"EVERTIDA"
	,"ETAKEORPAY"
FROM tmp_auto_po ON CONFLICT DO NOTHING;

INSERT INTO smec.po_general_renovables
SELECT "Date Hour"
	,"GRUPO"
	,"EGENERADA"
	,"EACREDITADA"
	,"EPOSIBLE"
	,"EPRONOSTICO"
	,"EVERTIDA"
	,"ETAKEORPAY"
FROM tmp_auto_po ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS tmp_auto_po;

CREATE TEMP TABLE tmp_auto_po (date_hour timestamptz
		,grupo TEXT
		,arl INTEGER
		,estado_ope TEXT
		,pi_sotr NUMERIC
		,arl_econ INTEGER
		,est_remun TEXT
		,energia NUMERIC
		,precio_nodo NUMERIC
		,pr_rem_energia NUMERIC
		,smec TEXT
		,pot_disp NUMERIC
		,pot_ope_cpo NUMERIC
		,compra_spot NUMERIC
		,sctd NUMERIC
		,sco NUMERIC
		,pind NUMERIC
		,pindprog NUMERIC
		,pindforz NUMERIC
		,date text
		,hour integer);

COPY tmp_auto_po(
		grupo
		,hour
		,arl 
		,estado_ope 
		,pi_sotr 
		,arl_econ 
		,est_remun 
		,energia 
		,precio_nodo 
		,pr_rem_energia 
		,smec 
		,pot_disp 
		,pot_ope_cpo 
		,compra_spot 
		,sctd 
		,sco 
		,pind 
		,pindprog 
		,pindforz) 
FROM 'C:\Users\Administrador\Desktop\POsept\vg23.csv' DELIMITER ',' NULL AS '';

COPY tmp_auto_po("date")
FROM 'C:\Users\Administrador\Desktop\POsept\fecha23.csv' DELIMITER ',';

UPDATE tmp_auto_po
SET DATE = datefix.DATE
FROM (
	SELECT DATE
	FROM tmp_auto_po
	WHERE grupo IS NULL
	) AS datefix;

ALTER TABLE tmp_auto_po

ALTER COLUMN DATE TYPE timestamptz USING to_timestamp (
	DATE
	,'YYYY-MM-DD hh24:mi:ss'
	);

DELETE FROM tmp_auto_po WHERE grupo IS NULL;

UPDATE tmp_auto_po
SET date_hour = datefix.date2
FROM (
	SELECT grupo
		,hour
		,compra_spot
		,DATE + interval '1 hour' * "hour" AS date2
	FROM tmp_auto_po
	) AS datefix
WHERE datefix.compra_spot = tmp_auto_po.compra_spot
	AND datefix.hour = tmp_auto_po.hour
	AND datefix.grupo = tmp_auto_po.grupo;

ALTER TABLE tmp_auto_po DROP COLUMN DATE, DROP COLUMN hour;

UPDATE smec.po
SET "EIMPORTADA" = tmp_auto_po.compra_spot
FROM (
	SELECT grupo
		,date_hour
		,compra_spot
	FROM tmp_auto_po
	) AS tmp_auto_po
WHERE tmp_auto_po.grupo = po."GRUPO"
	AND tmp_auto_po.date_hour = po."Date Hour";

UPDATE smec.po
SET pot_disp = tmp_auto_po.pot_disp
FROM (
	SELECT grupo
		,date_hour
		,pot_disp
	FROM tmp_auto_po
	) AS tmp_auto_po
WHERE tmp_auto_po.grupo = po."GRUPO"
	AND tmp_auto_po.date_hour = po."Date Hour";

INSERT INTO smec.valores_generadores SELECT date_hour 
		,grupo 
		,arl 
		,estado_ope 
		,pi_sotr 
		,arl_econ 
		,est_remun 
		,energia 
		,precio_nodo 
		,pr_rem_energia 
		,smec 
		,pot_disp 
		,pot_ope_cpo 
		,compra_spot 
		,sctd 
		,sco 
		,pind 
		,pindprog 
		,pindforz 
		FROM tmp_auto_po ON CONFLICT DO NOTHING;


DROP TABLE

IF EXISTS tmp_auto_po;
	CREATE TEMP TABLE tmp_auto_po (
		"Date Hour" timestamptz
		,"GRUPO" TEXT
		,"EGENERADA" NUMERIC
		,"EACREDITADA" NUMERIC
		,"EPOSIBLE" NUMERIC
		,"EPRONOSTICO" NUMERIC
		,"EVERTIDA" NUMERIC
		,"ETAKEORPAY" NUMERIC
		,DATE TEXT
		,hour INTEGER
		);

COPY tmp_auto_po("GRUPO", hour, "EGENERADA", "EACREDITADA", "EPOSIBLE", "EPRONOSTICO", "EVERTIDA", "ETAKEORPAY")
FROM 'C:\Users\Administrador\Desktop\POsept\er24.csv' DELIMITER ',';

COPY tmp_auto_po("date")
FROM 'C:\Users\Administrador\Desktop\POsept\fecha24.csv' DELIMITER ',';

UPDATE tmp_auto_po
SET DATE = datefix.DATE
FROM (
	SELECT DATE
	FROM tmp_auto_po
	WHERE "GRUPO" IS NULL
	) AS datefix;

ALTER TABLE tmp_auto_po

ALTER COLUMN DATE TYPE timestamptz USING to_timestamp (
	DATE
	,'YYYY-MM-DD hh24:mi:ss'
	);

DELETE
FROM tmp_auto_po
WHERE "GRUPO" IS NULL;

UPDATE tmp_auto_po
SET "Date Hour" = datefix.date2
FROM (
	SELECT "GRUPO"
		,hour
		,"EGENERADA"
		,DATE + interval '1 hour' * "hour" AS date2
	FROM tmp_auto_po
	) AS datefix
WHERE datefix."EGENERADA" = tmp_auto_po."EGENERADA"
	AND datefix.hour = tmp_auto_po.hour
	AND datefix."GRUPO" = tmp_auto_po."GRUPO";

ALTER TABLE tmp_auto_po

DROP COLUMN DATE
	,

DROP COLUMN hour;

INSERT INTO smec.po
SELECT "Date Hour"
	,"GRUPO"
	,"EGENERADA"
	,"EACREDITADA"
	,"EPOSIBLE"
	,"EPRONOSTICO"
	,"EVERTIDA"
	,"ETAKEORPAY"
FROM tmp_auto_po ON CONFLICT DO NOTHING;

INSERT INTO smec.po_general_renovables
SELECT "Date Hour"
	,"GRUPO"
	,"EGENERADA"
	,"EACREDITADA"
	,"EPOSIBLE"
	,"EPRONOSTICO"
	,"EVERTIDA"
	,"ETAKEORPAY"
FROM tmp_auto_po ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS tmp_auto_po;

CREATE TEMP TABLE tmp_auto_po (date_hour timestamptz
		,grupo TEXT
		,arl INTEGER
		,estado_ope TEXT
		,pi_sotr NUMERIC
		,arl_econ INTEGER
		,est_remun TEXT
		,energia NUMERIC
		,precio_nodo NUMERIC
		,pr_rem_energia NUMERIC
		,smec TEXT
		,pot_disp NUMERIC
		,pot_ope_cpo NUMERIC
		,compra_spot NUMERIC
		,sctd NUMERIC
		,sco NUMERIC
		,pind NUMERIC
		,pindprog NUMERIC
		,pindforz NUMERIC
		,date text
		,hour integer);

COPY tmp_auto_po(
		grupo
		,hour
		,arl 
		,estado_ope 
		,pi_sotr 
		,arl_econ 
		,est_remun 
		,energia 
		,precio_nodo 
		,pr_rem_energia 
		,smec 
		,pot_disp 
		,pot_ope_cpo 
		,compra_spot 
		,sctd 
		,sco 
		,pind 
		,pindprog 
		,pindforz) 
FROM 'C:\Users\Administrador\Desktop\POsept\vg24.csv' DELIMITER ',' NULL AS '';

COPY tmp_auto_po("date")
FROM 'C:\Users\Administrador\Desktop\POsept\fecha24.csv' DELIMITER ',';

UPDATE tmp_auto_po
SET DATE = datefix.DATE
FROM (
	SELECT DATE
	FROM tmp_auto_po
	WHERE grupo IS NULL
	) AS datefix;

ALTER TABLE tmp_auto_po

ALTER COLUMN DATE TYPE timestamptz USING to_timestamp (
	DATE
	,'YYYY-MM-DD hh24:mi:ss'
	);

DELETE FROM tmp_auto_po WHERE grupo IS NULL;

UPDATE tmp_auto_po
SET date_hour = datefix.date2
FROM (
	SELECT grupo
		,hour
		,compra_spot
		,DATE + interval '1 hour' * "hour" AS date2
	FROM tmp_auto_po
	) AS datefix
WHERE datefix.compra_spot = tmp_auto_po.compra_spot
	AND datefix.hour = tmp_auto_po.hour
	AND datefix.grupo = tmp_auto_po.grupo;

ALTER TABLE tmp_auto_po DROP COLUMN DATE, DROP COLUMN hour;

UPDATE smec.po
SET "EIMPORTADA" = tmp_auto_po.compra_spot
FROM (
	SELECT grupo
		,date_hour
		,compra_spot
	FROM tmp_auto_po
	) AS tmp_auto_po
WHERE tmp_auto_po.grupo = po."GRUPO"
	AND tmp_auto_po.date_hour = po."Date Hour";

UPDATE smec.po
SET pot_disp = tmp_auto_po.pot_disp
FROM (
	SELECT grupo
		,date_hour
		,pot_disp
	FROM tmp_auto_po
	) AS tmp_auto_po
WHERE tmp_auto_po.grupo = po."GRUPO"
	AND tmp_auto_po.date_hour = po."Date Hour";

INSERT INTO smec.valores_generadores SELECT date_hour 
		,grupo 
		,arl 
		,estado_ope 
		,pi_sotr 
		,arl_econ 
		,est_remun 
		,energia 
		,precio_nodo 
		,pr_rem_energia 
		,smec 
		,pot_disp 
		,pot_ope_cpo 
		,compra_spot 
		,sctd 
		,sco 
		,pind 
		,pindprog 
		,pindforz 
		FROM tmp_auto_po ON CONFLICT DO NOTHING;


DROP TABLE

IF EXISTS tmp_auto_po;
	CREATE TEMP TABLE tmp_auto_po (
		"Date Hour" timestamptz
		,"GRUPO" TEXT
		,"EGENERADA" NUMERIC
		,"EACREDITADA" NUMERIC
		,"EPOSIBLE" NUMERIC
		,"EPRONOSTICO" NUMERIC
		,"EVERTIDA" NUMERIC
		,"ETAKEORPAY" NUMERIC
		,DATE TEXT
		,hour INTEGER
		);

COPY tmp_auto_po("GRUPO", hour, "EGENERADA", "EACREDITADA", "EPOSIBLE", "EPRONOSTICO", "EVERTIDA", "ETAKEORPAY")
FROM 'C:\Users\Administrador\Desktop\POsept\er25.csv' DELIMITER ',';

COPY tmp_auto_po("date")
FROM 'C:\Users\Administrador\Desktop\POsept\fecha25.csv' DELIMITER ',';

UPDATE tmp_auto_po
SET DATE = datefix.DATE
FROM (
	SELECT DATE
	FROM tmp_auto_po
	WHERE "GRUPO" IS NULL
	) AS datefix;

ALTER TABLE tmp_auto_po

ALTER COLUMN DATE TYPE timestamptz USING to_timestamp (
	DATE
	,'YYYY-MM-DD hh24:mi:ss'
	);

DELETE
FROM tmp_auto_po
WHERE "GRUPO" IS NULL;

UPDATE tmp_auto_po
SET "Date Hour" = datefix.date2
FROM (
	SELECT "GRUPO"
		,hour
		,"EGENERADA"
		,DATE + interval '1 hour' * "hour" AS date2
	FROM tmp_auto_po
	) AS datefix
WHERE datefix."EGENERADA" = tmp_auto_po."EGENERADA"
	AND datefix.hour = tmp_auto_po.hour
	AND datefix."GRUPO" = tmp_auto_po."GRUPO";

ALTER TABLE tmp_auto_po

DROP COLUMN DATE
	,

DROP COLUMN hour;

INSERT INTO smec.po
SELECT "Date Hour"
	,"GRUPO"
	,"EGENERADA"
	,"EACREDITADA"
	,"EPOSIBLE"
	,"EPRONOSTICO"
	,"EVERTIDA"
	,"ETAKEORPAY"
FROM tmp_auto_po ON CONFLICT DO NOTHING;

INSERT INTO smec.po_general_renovables
SELECT "Date Hour"
	,"GRUPO"
	,"EGENERADA"
	,"EACREDITADA"
	,"EPOSIBLE"
	,"EPRONOSTICO"
	,"EVERTIDA"
	,"ETAKEORPAY"
FROM tmp_auto_po ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS tmp_auto_po;

CREATE TEMP TABLE tmp_auto_po (date_hour timestamptz
		,grupo TEXT
		,arl INTEGER
		,estado_ope TEXT
		,pi_sotr NUMERIC
		,arl_econ INTEGER
		,est_remun TEXT
		,energia NUMERIC
		,precio_nodo NUMERIC
		,pr_rem_energia NUMERIC
		,smec TEXT
		,pot_disp NUMERIC
		,pot_ope_cpo NUMERIC
		,compra_spot NUMERIC
		,sctd NUMERIC
		,sco NUMERIC
		,pind NUMERIC
		,pindprog NUMERIC
		,pindforz NUMERIC
		,date text
		,hour integer);

COPY tmp_auto_po(
		grupo
		,hour
		,arl 
		,estado_ope 
		,pi_sotr 
		,arl_econ 
		,est_remun 
		,energia 
		,precio_nodo 
		,pr_rem_energia 
		,smec 
		,pot_disp 
		,pot_ope_cpo 
		,compra_spot 
		,sctd 
		,sco 
		,pind 
		,pindprog 
		,pindforz) 
FROM 'C:\Users\Administrador\Desktop\POsept\vg25.csv' DELIMITER ',' NULL AS '';

COPY tmp_auto_po("date")
FROM 'C:\Users\Administrador\Desktop\POsept\fecha25.csv' DELIMITER ',';

UPDATE tmp_auto_po
SET DATE = datefix.DATE
FROM (
	SELECT DATE
	FROM tmp_auto_po
	WHERE grupo IS NULL
	) AS datefix;

ALTER TABLE tmp_auto_po

ALTER COLUMN DATE TYPE timestamptz USING to_timestamp (
	DATE
	,'YYYY-MM-DD hh24:mi:ss'
	);

DELETE FROM tmp_auto_po WHERE grupo IS NULL;

UPDATE tmp_auto_po
SET date_hour = datefix.date2
FROM (
	SELECT grupo
		,hour
		,compra_spot
		,DATE + interval '1 hour' * "hour" AS date2
	FROM tmp_auto_po
	) AS datefix
WHERE datefix.compra_spot = tmp_auto_po.compra_spot
	AND datefix.hour = tmp_auto_po.hour
	AND datefix.grupo = tmp_auto_po.grupo;

ALTER TABLE tmp_auto_po DROP COLUMN DATE, DROP COLUMN hour;

UPDATE smec.po
SET "EIMPORTADA" = tmp_auto_po.compra_spot
FROM (
	SELECT grupo
		,date_hour
		,compra_spot
	FROM tmp_auto_po
	) AS tmp_auto_po
WHERE tmp_auto_po.grupo = po."GRUPO"
	AND tmp_auto_po.date_hour = po."Date Hour";

UPDATE smec.po
SET pot_disp = tmp_auto_po.pot_disp
FROM (
	SELECT grupo
		,date_hour
		,pot_disp
	FROM tmp_auto_po
	) AS tmp_auto_po
WHERE tmp_auto_po.grupo = po."GRUPO"
	AND tmp_auto_po.date_hour = po."Date Hour";

INSERT INTO smec.valores_generadores SELECT date_hour 
		,grupo 
		,arl 
		,estado_ope 
		,pi_sotr 
		,arl_econ 
		,est_remun 
		,energia 
		,precio_nodo 
		,pr_rem_energia 
		,smec 
		,pot_disp 
		,pot_ope_cpo 
		,compra_spot 
		,sctd 
		,sco 
		,pind 
		,pindprog 
		,pindforz 
		FROM tmp_auto_po ON CONFLICT DO NOTHING;


DROP TABLE

IF EXISTS tmp_auto_po;
	CREATE TEMP TABLE tmp_auto_po (
		"Date Hour" timestamptz
		,"GRUPO" TEXT
		,"EGENERADA" NUMERIC
		,"EACREDITADA" NUMERIC
		,"EPOSIBLE" NUMERIC
		,"EPRONOSTICO" NUMERIC
		,"EVERTIDA" NUMERIC
		,"ETAKEORPAY" NUMERIC
		,DATE TEXT
		,hour INTEGER
		);

COPY tmp_auto_po("GRUPO", hour, "EGENERADA", "EACREDITADA", "EPOSIBLE", "EPRONOSTICO", "EVERTIDA", "ETAKEORPAY")
FROM 'C:\Users\Administrador\Desktop\POsept\er26.csv' DELIMITER ',';

COPY tmp_auto_po("date")
FROM 'C:\Users\Administrador\Desktop\POsept\fecha26.csv' DELIMITER ',';

UPDATE tmp_auto_po
SET DATE = datefix.DATE
FROM (
	SELECT DATE
	FROM tmp_auto_po
	WHERE "GRUPO" IS NULL
	) AS datefix;

ALTER TABLE tmp_auto_po

ALTER COLUMN DATE TYPE timestamptz USING to_timestamp (
	DATE
	,'YYYY-MM-DD hh24:mi:ss'
	);

DELETE
FROM tmp_auto_po
WHERE "GRUPO" IS NULL;

UPDATE tmp_auto_po
SET "Date Hour" = datefix.date2
FROM (
	SELECT "GRUPO"
		,hour
		,"EGENERADA"
		,DATE + interval '1 hour' * "hour" AS date2
	FROM tmp_auto_po
	) AS datefix
WHERE datefix."EGENERADA" = tmp_auto_po."EGENERADA"
	AND datefix.hour = tmp_auto_po.hour
	AND datefix."GRUPO" = tmp_auto_po."GRUPO";

ALTER TABLE tmp_auto_po

DROP COLUMN DATE
	,

DROP COLUMN hour;

INSERT INTO smec.po
SELECT "Date Hour"
	,"GRUPO"
	,"EGENERADA"
	,"EACREDITADA"
	,"EPOSIBLE"
	,"EPRONOSTICO"
	,"EVERTIDA"
	,"ETAKEORPAY"
FROM tmp_auto_po ON CONFLICT DO NOTHING;

INSERT INTO smec.po_general_renovables
SELECT "Date Hour"
	,"GRUPO"
	,"EGENERADA"
	,"EACREDITADA"
	,"EPOSIBLE"
	,"EPRONOSTICO"
	,"EVERTIDA"
	,"ETAKEORPAY"
FROM tmp_auto_po ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS tmp_auto_po;

CREATE TEMP TABLE tmp_auto_po (date_hour timestamptz
		,grupo TEXT
		,arl INTEGER
		,estado_ope TEXT
		,pi_sotr NUMERIC
		,arl_econ INTEGER
		,est_remun TEXT
		,energia NUMERIC
		,precio_nodo NUMERIC
		,pr_rem_energia NUMERIC
		,smec TEXT
		,pot_disp NUMERIC
		,pot_ope_cpo NUMERIC
		,compra_spot NUMERIC
		,sctd NUMERIC
		,sco NUMERIC
		,pind NUMERIC
		,pindprog NUMERIC
		,pindforz NUMERIC
		,date text
		,hour integer);

COPY tmp_auto_po(
		grupo
		,hour
		,arl 
		,estado_ope 
		,pi_sotr 
		,arl_econ 
		,est_remun 
		,energia 
		,precio_nodo 
		,pr_rem_energia 
		,smec 
		,pot_disp 
		,pot_ope_cpo 
		,compra_spot 
		,sctd 
		,sco 
		,pind 
		,pindprog 
		,pindforz) 
FROM 'C:\Users\Administrador\Desktop\POsept\vg26.csv' DELIMITER ',' NULL AS '';

COPY tmp_auto_po("date")
FROM 'C:\Users\Administrador\Desktop\POsept\fecha26.csv' DELIMITER ',';

UPDATE tmp_auto_po
SET DATE = datefix.DATE
FROM (
	SELECT DATE
	FROM tmp_auto_po
	WHERE grupo IS NULL
	) AS datefix;

ALTER TABLE tmp_auto_po

ALTER COLUMN DATE TYPE timestamptz USING to_timestamp (
	DATE
	,'YYYY-MM-DD hh24:mi:ss'
	);

DELETE FROM tmp_auto_po WHERE grupo IS NULL;

UPDATE tmp_auto_po
SET date_hour = datefix.date2
FROM (
	SELECT grupo
		,hour
		,compra_spot
		,DATE + interval '1 hour' * "hour" AS date2
	FROM tmp_auto_po
	) AS datefix
WHERE datefix.compra_spot = tmp_auto_po.compra_spot
	AND datefix.hour = tmp_auto_po.hour
	AND datefix.grupo = tmp_auto_po.grupo;

ALTER TABLE tmp_auto_po DROP COLUMN DATE, DROP COLUMN hour;

UPDATE smec.po
SET "EIMPORTADA" = tmp_auto_po.compra_spot
FROM (
	SELECT grupo
		,date_hour
		,compra_spot
	FROM tmp_auto_po
	) AS tmp_auto_po
WHERE tmp_auto_po.grupo = po."GRUPO"
	AND tmp_auto_po.date_hour = po."Date Hour";

UPDATE smec.po
SET pot_disp = tmp_auto_po.pot_disp
FROM (
	SELECT grupo
		,date_hour
		,pot_disp
	FROM tmp_auto_po
	) AS tmp_auto_po
WHERE tmp_auto_po.grupo = po."GRUPO"
	AND tmp_auto_po.date_hour = po."Date Hour";

INSERT INTO smec.valores_generadores SELECT date_hour 
		,grupo 
		,arl 
		,estado_ope 
		,pi_sotr 
		,arl_econ 
		,est_remun 
		,energia 
		,precio_nodo 
		,pr_rem_energia 
		,smec 
		,pot_disp 
		,pot_ope_cpo 
		,compra_spot 
		,sctd 
		,sco 
		,pind 
		,pindprog 
		,pindforz 
		FROM tmp_auto_po ON CONFLICT DO NOTHING;


DROP TABLE

IF EXISTS tmp_auto_po;
	CREATE TEMP TABLE tmp_auto_po (
		"Date Hour" timestamptz
		,"GRUPO" TEXT
		,"EGENERADA" NUMERIC
		,"EACREDITADA" NUMERIC
		,"EPOSIBLE" NUMERIC
		,"EPRONOSTICO" NUMERIC
		,"EVERTIDA" NUMERIC
		,"ETAKEORPAY" NUMERIC
		,DATE TEXT
		,hour INTEGER
		);

COPY tmp_auto_po("GRUPO", hour, "EGENERADA", "EACREDITADA", "EPOSIBLE", "EPRONOSTICO", "EVERTIDA", "ETAKEORPAY")
FROM 'C:\Users\Administrador\Desktop\POsept\er27.csv' DELIMITER ',';

COPY tmp_auto_po("date")
FROM 'C:\Users\Administrador\Desktop\POsept\fecha27.csv' DELIMITER ',';

UPDATE tmp_auto_po
SET DATE = datefix.DATE
FROM (
	SELECT DATE
	FROM tmp_auto_po
	WHERE "GRUPO" IS NULL
	) AS datefix;

ALTER TABLE tmp_auto_po

ALTER COLUMN DATE TYPE timestamptz USING to_timestamp (
	DATE
	,'YYYY-MM-DD hh24:mi:ss'
	);

DELETE
FROM tmp_auto_po
WHERE "GRUPO" IS NULL;

UPDATE tmp_auto_po
SET "Date Hour" = datefix.date2
FROM (
	SELECT "GRUPO"
		,hour
		,"EGENERADA"
		,DATE + interval '1 hour' * "hour" AS date2
	FROM tmp_auto_po
	) AS datefix
WHERE datefix."EGENERADA" = tmp_auto_po."EGENERADA"
	AND datefix.hour = tmp_auto_po.hour
	AND datefix."GRUPO" = tmp_auto_po."GRUPO";

ALTER TABLE tmp_auto_po

DROP COLUMN DATE
	,

DROP COLUMN hour;

INSERT INTO smec.po
SELECT "Date Hour"
	,"GRUPO"
	,"EGENERADA"
	,"EACREDITADA"
	,"EPOSIBLE"
	,"EPRONOSTICO"
	,"EVERTIDA"
	,"ETAKEORPAY"
FROM tmp_auto_po ON CONFLICT DO NOTHING;

INSERT INTO smec.po_general_renovables
SELECT "Date Hour"
	,"GRUPO"
	,"EGENERADA"
	,"EACREDITADA"
	,"EPOSIBLE"
	,"EPRONOSTICO"
	,"EVERTIDA"
	,"ETAKEORPAY"
FROM tmp_auto_po ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS tmp_auto_po;

CREATE TEMP TABLE tmp_auto_po (date_hour timestamptz
		,grupo TEXT
		,arl INTEGER
		,estado_ope TEXT
		,pi_sotr NUMERIC
		,arl_econ INTEGER
		,est_remun TEXT
		,energia NUMERIC
		,precio_nodo NUMERIC
		,pr_rem_energia NUMERIC
		,smec TEXT
		,pot_disp NUMERIC
		,pot_ope_cpo NUMERIC
		,compra_spot NUMERIC
		,sctd NUMERIC
		,sco NUMERIC
		,pind NUMERIC
		,pindprog NUMERIC
		,pindforz NUMERIC
		,date text
		,hour integer);

COPY tmp_auto_po(
		grupo
		,hour
		,arl 
		,estado_ope 
		,pi_sotr 
		,arl_econ 
		,est_remun 
		,energia 
		,precio_nodo 
		,pr_rem_energia 
		,smec 
		,pot_disp 
		,pot_ope_cpo 
		,compra_spot 
		,sctd 
		,sco 
		,pind 
		,pindprog 
		,pindforz) 
FROM 'C:\Users\Administrador\Desktop\POsept\vg27.csv' DELIMITER ',' NULL AS '';

COPY tmp_auto_po("date")
FROM 'C:\Users\Administrador\Desktop\POsept\fecha27.csv' DELIMITER ',';

UPDATE tmp_auto_po
SET DATE = datefix.DATE
FROM (
	SELECT DATE
	FROM tmp_auto_po
	WHERE grupo IS NULL
	) AS datefix;

ALTER TABLE tmp_auto_po

ALTER COLUMN DATE TYPE timestamptz USING to_timestamp (
	DATE
	,'YYYY-MM-DD hh24:mi:ss'
	);

DELETE FROM tmp_auto_po WHERE grupo IS NULL;

UPDATE tmp_auto_po
SET date_hour = datefix.date2
FROM (
	SELECT grupo
		,hour
		,compra_spot
		,DATE + interval '1 hour' * "hour" AS date2
	FROM tmp_auto_po
	) AS datefix
WHERE datefix.compra_spot = tmp_auto_po.compra_spot
	AND datefix.hour = tmp_auto_po.hour
	AND datefix.grupo = tmp_auto_po.grupo;

ALTER TABLE tmp_auto_po DROP COLUMN DATE, DROP COLUMN hour;

UPDATE smec.po
SET "EIMPORTADA" = tmp_auto_po.compra_spot
FROM (
	SELECT grupo
		,date_hour
		,compra_spot
	FROM tmp_auto_po
	) AS tmp_auto_po
WHERE tmp_auto_po.grupo = po."GRUPO"
	AND tmp_auto_po.date_hour = po."Date Hour";

UPDATE smec.po
SET pot_disp = tmp_auto_po.pot_disp
FROM (
	SELECT grupo
		,date_hour
		,pot_disp
	FROM tmp_auto_po
	) AS tmp_auto_po
WHERE tmp_auto_po.grupo = po."GRUPO"
	AND tmp_auto_po.date_hour = po."Date Hour";

INSERT INTO smec.valores_generadores SELECT date_hour 
		,grupo 
		,arl 
		,estado_ope 
		,pi_sotr 
		,arl_econ 
		,est_remun 
		,energia 
		,precio_nodo 
		,pr_rem_energia 
		,smec 
		,pot_disp 
		,pot_ope_cpo 
		,compra_spot 
		,sctd 
		,sco 
		,pind 
		,pindprog 
		,pindforz 
		FROM tmp_auto_po ON CONFLICT DO NOTHING;


DROP TABLE

IF EXISTS tmp_auto_po;
	CREATE TEMP TABLE tmp_auto_po (
		"Date Hour" timestamptz
		,"GRUPO" TEXT
		,"EGENERADA" NUMERIC
		,"EACREDITADA" NUMERIC
		,"EPOSIBLE" NUMERIC
		,"EPRONOSTICO" NUMERIC
		,"EVERTIDA" NUMERIC
		,"ETAKEORPAY" NUMERIC
		,DATE TEXT
		,hour INTEGER
		);

COPY tmp_auto_po("GRUPO", hour, "EGENERADA", "EACREDITADA", "EPOSIBLE", "EPRONOSTICO", "EVERTIDA", "ETAKEORPAY")
FROM 'C:\Users\Administrador\Desktop\POsept\er28.csv' DELIMITER ',';

COPY tmp_auto_po("date")
FROM 'C:\Users\Administrador\Desktop\POsept\fecha28.csv' DELIMITER ',';

UPDATE tmp_auto_po
SET DATE = datefix.DATE
FROM (
	SELECT DATE
	FROM tmp_auto_po
	WHERE "GRUPO" IS NULL
	) AS datefix;

ALTER TABLE tmp_auto_po

ALTER COLUMN DATE TYPE timestamptz USING to_timestamp (
	DATE
	,'YYYY-MM-DD hh24:mi:ss'
	);

DELETE
FROM tmp_auto_po
WHERE "GRUPO" IS NULL;

UPDATE tmp_auto_po
SET "Date Hour" = datefix.date2
FROM (
	SELECT "GRUPO"
		,hour
		,"EGENERADA"
		,DATE + interval '1 hour' * "hour" AS date2
	FROM tmp_auto_po
	) AS datefix
WHERE datefix."EGENERADA" = tmp_auto_po."EGENERADA"
	AND datefix.hour = tmp_auto_po.hour
	AND datefix."GRUPO" = tmp_auto_po."GRUPO";

ALTER TABLE tmp_auto_po

DROP COLUMN DATE
	,

DROP COLUMN hour;

INSERT INTO smec.po
SELECT "Date Hour"
	,"GRUPO"
	,"EGENERADA"
	,"EACREDITADA"
	,"EPOSIBLE"
	,"EPRONOSTICO"
	,"EVERTIDA"
	,"ETAKEORPAY"
FROM tmp_auto_po ON CONFLICT DO NOTHING;

INSERT INTO smec.po_general_renovables
SELECT "Date Hour"
	,"GRUPO"
	,"EGENERADA"
	,"EACREDITADA"
	,"EPOSIBLE"
	,"EPRONOSTICO"
	,"EVERTIDA"
	,"ETAKEORPAY"
FROM tmp_auto_po ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS tmp_auto_po;

CREATE TEMP TABLE tmp_auto_po (date_hour timestamptz
		,grupo TEXT
		,arl INTEGER
		,estado_ope TEXT
		,pi_sotr NUMERIC
		,arl_econ INTEGER
		,est_remun TEXT
		,energia NUMERIC
		,precio_nodo NUMERIC
		,pr_rem_energia NUMERIC
		,smec TEXT
		,pot_disp NUMERIC
		,pot_ope_cpo NUMERIC
		,compra_spot NUMERIC
		,sctd NUMERIC
		,sco NUMERIC
		,pind NUMERIC
		,pindprog NUMERIC
		,pindforz NUMERIC
		,date text
		,hour integer);

COPY tmp_auto_po(
		grupo
		,hour
		,arl 
		,estado_ope 
		,pi_sotr 
		,arl_econ 
		,est_remun 
		,energia 
		,precio_nodo 
		,pr_rem_energia 
		,smec 
		,pot_disp 
		,pot_ope_cpo 
		,compra_spot 
		,sctd 
		,sco 
		,pind 
		,pindprog 
		,pindforz) 
FROM 'C:\Users\Administrador\Desktop\POsept\vg28.csv' DELIMITER ',' NULL AS '';

COPY tmp_auto_po("date")
FROM 'C:\Users\Administrador\Desktop\POsept\fecha28.csv' DELIMITER ',';

UPDATE tmp_auto_po
SET DATE = datefix.DATE
FROM (
	SELECT DATE
	FROM tmp_auto_po
	WHERE grupo IS NULL
	) AS datefix;

ALTER TABLE tmp_auto_po

ALTER COLUMN DATE TYPE timestamptz USING to_timestamp (
	DATE
	,'YYYY-MM-DD hh24:mi:ss'
	);

DELETE FROM tmp_auto_po WHERE grupo IS NULL;

UPDATE tmp_auto_po
SET date_hour = datefix.date2
FROM (
	SELECT grupo
		,hour
		,compra_spot
		,DATE + interval '1 hour' * "hour" AS date2
	FROM tmp_auto_po
	) AS datefix
WHERE datefix.compra_spot = tmp_auto_po.compra_spot
	AND datefix.hour = tmp_auto_po.hour
	AND datefix.grupo = tmp_auto_po.grupo;

ALTER TABLE tmp_auto_po DROP COLUMN DATE, DROP COLUMN hour;

UPDATE smec.po
SET "EIMPORTADA" = tmp_auto_po.compra_spot
FROM (
	SELECT grupo
		,date_hour
		,compra_spot
	FROM tmp_auto_po
	) AS tmp_auto_po
WHERE tmp_auto_po.grupo = po."GRUPO"
	AND tmp_auto_po.date_hour = po."Date Hour";

UPDATE smec.po
SET pot_disp = tmp_auto_po.pot_disp
FROM (
	SELECT grupo
		,date_hour
		,pot_disp
	FROM tmp_auto_po
	) AS tmp_auto_po
WHERE tmp_auto_po.grupo = po."GRUPO"
	AND tmp_auto_po.date_hour = po."Date Hour";

INSERT INTO smec.valores_generadores SELECT date_hour 
		,grupo 
		,arl 
		,estado_ope 
		,pi_sotr 
		,arl_econ 
		,est_remun 
		,energia 
		,precio_nodo 
		,pr_rem_energia 
		,smec 
		,pot_disp 
		,pot_ope_cpo 
		,compra_spot 
		,sctd 
		,sco 
		,pind 
		,pindprog 
		,pindforz 
		FROM tmp_auto_po ON CONFLICT DO NOTHING;


DROP TABLE

IF EXISTS tmp_auto_po;
	CREATE TEMP TABLE tmp_auto_po (
		"Date Hour" timestamptz
		,"GRUPO" TEXT
		,"EGENERADA" NUMERIC
		,"EACREDITADA" NUMERIC
		,"EPOSIBLE" NUMERIC
		,"EPRONOSTICO" NUMERIC
		,"EVERTIDA" NUMERIC
		,"ETAKEORPAY" NUMERIC
		,DATE TEXT
		,hour INTEGER
		);

COPY tmp_auto_po("GRUPO", hour, "EGENERADA", "EACREDITADA", "EPOSIBLE", "EPRONOSTICO", "EVERTIDA", "ETAKEORPAY")
FROM 'C:\Users\Administrador\Desktop\POsept\er29.csv' DELIMITER ',';

COPY tmp_auto_po("date")
FROM 'C:\Users\Administrador\Desktop\POsept\fecha29.csv' DELIMITER ',';

UPDATE tmp_auto_po
SET DATE = datefix.DATE
FROM (
	SELECT DATE
	FROM tmp_auto_po
	WHERE "GRUPO" IS NULL
	) AS datefix;

ALTER TABLE tmp_auto_po

ALTER COLUMN DATE TYPE timestamptz USING to_timestamp (
	DATE
	,'YYYY-MM-DD hh24:mi:ss'
	);

DELETE
FROM tmp_auto_po
WHERE "GRUPO" IS NULL;

UPDATE tmp_auto_po
SET "Date Hour" = datefix.date2
FROM (
	SELECT "GRUPO"
		,hour
		,"EGENERADA"
		,DATE + interval '1 hour' * "hour" AS date2
	FROM tmp_auto_po
	) AS datefix
WHERE datefix."EGENERADA" = tmp_auto_po."EGENERADA"
	AND datefix.hour = tmp_auto_po.hour
	AND datefix."GRUPO" = tmp_auto_po."GRUPO";

ALTER TABLE tmp_auto_po

DROP COLUMN DATE
	,

DROP COLUMN hour;

INSERT INTO smec.po
SELECT "Date Hour"
	,"GRUPO"
	,"EGENERADA"
	,"EACREDITADA"
	,"EPOSIBLE"
	,"EPRONOSTICO"
	,"EVERTIDA"
	,"ETAKEORPAY"
FROM tmp_auto_po ON CONFLICT DO NOTHING;

INSERT INTO smec.po_general_renovables
SELECT "Date Hour"
	,"GRUPO"
	,"EGENERADA"
	,"EACREDITADA"
	,"EPOSIBLE"
	,"EPRONOSTICO"
	,"EVERTIDA"
	,"ETAKEORPAY"
FROM tmp_auto_po ON CONFLICT DO NOTHING;

DROP TABLE IF EXISTS tmp_auto_po;

CREATE TEMP TABLE tmp_auto_po (date_hour timestamptz
		,grupo TEXT
		,arl INTEGER
		,estado_ope TEXT
		,pi_sotr NUMERIC
		,arl_econ INTEGER
		,est_remun TEXT
		,energia NUMERIC
		,precio_nodo NUMERIC
		,pr_rem_energia NUMERIC
		,smec TEXT
		,pot_disp NUMERIC
		,pot_ope_cpo NUMERIC
		,compra_spot NUMERIC
		,sctd NUMERIC
		,sco NUMERIC
		,pind NUMERIC
		,pindprog NUMERIC
		,pindforz NUMERIC
		,date text
		,hour integer);

COPY tmp_auto_po(
		grupo
		,hour
		,arl 
		,estado_ope 
		,pi_sotr 
		,arl_econ 
		,est_remun 
		,energia 
		,precio_nodo 
		,pr_rem_energia 
		,smec 
		,pot_disp 
		,pot_ope_cpo 
		,compra_spot 
		,sctd 
		,sco 
		,pind 
		,pindprog 
		,pindforz) 
FROM 'C:\Users\Administrador\Desktop\POsept\vg29.csv' DELIMITER ',' NULL AS '';

COPY tmp_auto_po("date")
FROM 'C:\Users\Administrador\Desktop\POsept\fecha29.csv' DELIMITER ',';

UPDATE tmp_auto_po
SET DATE = datefix.DATE
FROM (
	SELECT DATE
	FROM tmp_auto_po
	WHERE grupo IS NULL
	) AS datefix;

ALTER TABLE tmp_auto_po

ALTER COLUMN DATE TYPE timestamptz USING to_timestamp (
	DATE
	,'YYYY-MM-DD hh24:mi:ss'
	);

DELETE FROM tmp_auto_po WHERE grupo IS NULL;

UPDATE tmp_auto_po
SET date_hour = datefix.date2
FROM (
	SELECT grupo
		,hour
		,compra_spot
		,DATE + interval '1 hour' * "hour" AS date2
	FROM tmp_auto_po
	) AS datefix
WHERE datefix.compra_spot = tmp_auto_po.compra_spot
	AND datefix.hour = tmp_auto_po.hour
	AND datefix.grupo = tmp_auto_po.grupo;

ALTER TABLE tmp_auto_po DROP COLUMN DATE, DROP COLUMN hour;

UPDATE smec.po
SET "EIMPORTADA" = tmp_auto_po.compra_spot
FROM (
	SELECT grupo
		,date_hour
		,compra_spot
	FROM tmp_auto_po
	) AS tmp_auto_po
WHERE tmp_auto_po.grupo = po."GRUPO"
	AND tmp_auto_po.date_hour = po."Date Hour";

UPDATE smec.po
SET pot_disp = tmp_auto_po.pot_disp
FROM (
	SELECT grupo
		,date_hour
		,pot_disp
	FROM tmp_auto_po
	) AS tmp_auto_po
WHERE tmp_auto_po.grupo = po."GRUPO"
	AND tmp_auto_po.date_hour = po."Date Hour";

INSERT INTO smec.valores_generadores SELECT date_hour 
		,grupo 
		,arl 
		,estado_ope 
		,pi_sotr 
		,arl_econ 
		,est_remun 
		,energia 
		,precio_nodo 
		,pr_rem_energia 
		,smec 
		,pot_disp 
		,pot_ope_cpo 
		,compra_spot 
		,sctd 
		,sco 
		,pind 
		,pindprog 
		,pindforz 
		FROM tmp_auto_po ON CONFLICT DO NOTHING;
