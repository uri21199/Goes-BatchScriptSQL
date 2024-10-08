
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
FROM 'C:\Users\Administrador\Desktop\PO descarga automatica\er.csv'  DELIMITER ',' NULL AS '';

COPY tmp_auto_po("date")
FROM 'C:\Users\Administrador\Desktop\PO descarga automatica\fecha.csv'  DELIMITER ',' NULL AS '';

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
FROM 'C:\Users\Administrador\Desktop\PO descarga automatica\er1.csv'  DELIMITER ',' NULL AS '';

COPY tmp_auto_po("date")
FROM 'C:\Users\Administrador\Desktop\PO descarga automatica\fecha1.csv'  DELIMITER ',' NULL AS '';

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
FROM 'C:\Users\Administrador\Desktop\PO descarga automatica\er2.csv'  DELIMITER ',' NULL AS '';

COPY tmp_auto_po("date")
FROM 'C:\Users\Administrador\Desktop\PO descarga automatica\fecha2.csv'  DELIMITER ',' NULL AS '';

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
FROM 'C:\Users\Administrador\Desktop\PO descarga automatica\er3.csv'  DELIMITER ',' NULL AS '';

COPY tmp_auto_po("date")
FROM 'C:\Users\Administrador\Desktop\PO descarga automatica\fecha3.csv'  DELIMITER ',' NULL AS '';

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
FROM 'C:\Users\Administrador\Desktop\PO descarga automatica\er4.csv'  DELIMITER ',' NULL AS '';

COPY tmp_auto_po("date")
FROM 'C:\Users\Administrador\Desktop\PO descarga automatica\fecha4.csv'  DELIMITER ',' NULL AS '';

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
FROM 'C:\Users\Administrador\Desktop\PO descarga automatica\er5.csv' DELIMITER ',' NULL AS '';

COPY tmp_auto_po("date")
FROM 'C:\Users\Administrador\Desktop\PO descarga automatica\fecha5.csv'  DELIMITER ',' NULL AS '';

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
FROM 'C:\Users\Administrador\Desktop\PO descarga automatica\vg.csv' DELIMITER ',' NULL AS '';

COPY tmp_auto_po("date")
FROM 'C:\Users\Administrador\Desktop\PO descarga automatica\fecha.csv'  DELIMITER ',' NULL AS '';

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
-------------------------------------------------------------------------------------------------------------------------
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
FROM 'C:\Users\Administrador\Desktop\PO descarga automatica\vg1.csv' DELIMITER ',' NULL AS '';

COPY tmp_auto_po("date")
FROM 'C:\Users\Administrador\Desktop\PO descarga automatica\fecha1.csv'  DELIMITER ',' NULL AS '';

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
-------------------------------------------------------------------------------------------------------------------------
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
FROM 'C:\Users\Administrador\Desktop\PO descarga automatica\vg2.csv' DELIMITER ',' NULL AS '';

COPY tmp_auto_po("date")
FROM 'C:\Users\Administrador\Desktop\PO descarga automatica\fecha2.csv'  DELIMITER ',' NULL AS '';

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
-------------------------------------------------------------------------------------------------------------------------
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
FROM 'C:\Users\Administrador\Desktop\PO descarga automatica\vg3.csv' DELIMITER ',' NULL AS '';

COPY tmp_auto_po("date")
FROM 'C:\Users\Administrador\Desktop\PO descarga automatica\fecha3.csv'  DELIMITER ',' NULL AS '';

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
-------------------------------------------------------------------------------------------------------------------------
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
FROM 'C:\Users\Administrador\Desktop\PO descarga automatica\vg4.csv' DELIMITER ',' NULL AS '';

COPY tmp_auto_po("date")
FROM 'C:\Users\Administrador\Desktop\PO descarga automatica\fecha4.csv'  DELIMITER ',' NULL AS '';

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
-------------------------------------------------------------------------------------------------------------------------
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
FROM 'C:\Users\Administrador\Desktop\PO descarga automatica\vg5.csv' DELIMITER ',' NULL AS '';

COPY tmp_auto_po("date")
FROM 'C:\Users\Administrador\Desktop\PO descarga automatica\fecha5.csv'  DELIMITER ',' NULL AS '';

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
-------------------------------------------------------------------------------------------------------------------------

UPDATE smec.po_general_renovables SET arl = s.arl, estado_ope = s.estado_ope, pi_sotr = s.pi_sotr, arl_econ = s.arl_econ, est_remun = s.est_remun, energia = s.energia, precio_nodo = s.precio_nodo, pr_rem_energia = s.pr_rem_energia, smec = s.smec, pot_disp = s.pot_disp, pot_ope_cpo = s.pot_ope_cpo, compra_spot = s.compra_spot, sctd = s.sctd, sco = s.sco, pind = s.pind, pindprog = s.pindprog, pindforz = s.pindforz
	FROM (SELECT arl, estado_ope, pi_sotr, arl_econ, est_remun, energia, precio_nodo, pr_rem_energia, smec, pot_disp, pot_ope_cpo, compra_spot, sctd, sco, pind, pindprog, pindforz, grupo, date_hour FROM smec.valores_generadores) AS s WHERE s.grupo = po_general_renovables.grupo AND s.date_hour = po_general_renovables.date_hour AND po_general_renovables.date_hour >= now() - interval '7 days';