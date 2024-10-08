
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
FROM 'C:\Users\Administrador\Desktop\PO descarga automatica\er.csv' DELIMITER ',';

COPY tmp_auto_po("date")
FROM 'C:\Users\Administrador\Desktop\PO descarga automatica\fecha.csv' DELIMITER ',';

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
FROM 'C:\Users\Administrador\Desktop\PO descarga automatica\er1.csv' DELIMITER ',';

COPY tmp_auto_po("date")
FROM 'C:\Users\Administrador\Desktop\PO descarga automatica\fecha1.csv' DELIMITER ',';

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
FROM 'C:\Users\Administrador\Desktop\PO descarga automatica\er2.csv' DELIMITER ',';

COPY tmp_auto_po("date")
FROM 'C:\Users\Administrador\Desktop\PO descarga automatica\fecha2.csv' DELIMITER ',';

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
FROM 'C:\Users\Administrador\Desktop\PO descarga automatica\er3.csv' DELIMITER ',';

COPY tmp_auto_po("date")
FROM 'C:\Users\Administrador\Desktop\PO descarga automatica\fecha3.csv' DELIMITER ',';

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
FROM 'C:\Users\Administrador\Desktop\PO descarga automatica\er4.csv' DELIMITER ',';

COPY tmp_auto_po("date")
FROM 'C:\Users\Administrador\Desktop\PO descarga automatica\fecha4.csv' DELIMITER ',';

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
FROM 'C:\Users\Administrador\Desktop\PO descarga automatica\er5.csv' DELIMITER ',';

COPY tmp_auto_po("date")
FROM 'C:\Users\Administrador\Desktop\PO descarga automatica\fecha5.csv' DELIMITER ',';

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

DROP TABLE

IF EXISTS tmp_auto_po;
	CREATE TEMP TABLE tmp_auto_po (
		"Date Hour" timestamptz
		,"GRUPO" TEXT
		,"COMPRA_SPOT" NUMERIC
		,"POT_DISP" NUMERIC
		,DATE TEXT
		,hour INTEGER
		);

COPY tmp_auto_po("GRUPO", hour, "COMPRA_SPOT", "POT_DISP")
FROM 'C:\Users\Administrador\Desktop\po test\vg.csv' DELIMITER ',';

COPY tmp_auto_po("date")
FROM 'C:\Users\Administrador\Desktop\po test\fecha.csv' DELIMITER ',';

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
		,"COMPRA_SPOT"
		,DATE + interval '1 hour' * "hour" AS date2
	FROM tmp_auto_po
	) AS datefix
WHERE datefix."COMPRA_SPOT" = tmp_auto_po."COMPRA_SPOT"
	AND datefix.hour = tmp_auto_po.hour
	AND datefix."GRUPO" = tmp_auto_po."GRUPO";

ALTER TABLE tmp_auto_po

DROP COLUMN DATE
	,

DROP COLUMN hour;

UPDATE smec.po
SET "EIMPORTADA" = tmp_auto_po."COMPRA_SPOT"
FROM (
	SELECT "GRUPO"
		,"Date Hour"
		,"COMPRA_SPOT"
	FROM tmp_auto_po
	) AS tmp_auto_po
WHERE tmp_auto_po."GRUPO" = po."GRUPO"
	AND tmp_auto_po."Date Hour" = po."Date Hour";

UPDATE smec.po
SET pot_disp = tmp_auto_po."POT_DISP"
FROM (
	SELECT "GRUPO"
		,"Date Hour"
		,"POT_DISP"
	FROM tmp_auto_po
	) AS tmp_auto_po
WHERE tmp_auto_po."GRUPO" = po."GRUPO"
	AND tmp_auto_po."Date Hour" = po."Date Hour";

DROP TABLE

IF EXISTS tmp_auto_po;
	CREATE TEMP TABLE tmp_auto_po (
		"Date Hour" timestamptz
		,"GRUPO" TEXT
		,"COMPRA_SPOT" NUMERIC
		,"POT_DISP" NUMERIC
		,DATE TEXT
		,hour INTEGER
		);

COPY tmp_auto_po("GRUPO", hour, "COMPRA_SPOT", "POT_DISP")
FROM 'C:\Users\Administrador\Desktop\po test\vg1.csv' DELIMITER ',';

COPY tmp_auto_po("date")
FROM 'C:\Users\Administrador\Desktop\po test\fecha1.csv' DELIMITER ',';

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
		,"COMPRA_SPOT"
		,DATE + interval '1 hour' * "hour" AS date2
	FROM tmp_auto_po
	) AS datefix
WHERE datefix."COMPRA_SPOT" = tmp_auto_po."COMPRA_SPOT"
	AND datefix.hour = tmp_auto_po.hour
	AND datefix."GRUPO" = tmp_auto_po."GRUPO";

ALTER TABLE tmp_auto_po

DROP COLUMN DATE
	,

DROP COLUMN hour;

UPDATE smec.po
SET "EIMPORTADA" = tmp_auto_po."COMPRA_SPOT"
FROM (
	SELECT "GRUPO"
		,"Date Hour"
		,"COMPRA_SPOT"
	FROM tmp_auto_po
	) AS tmp_auto_po
WHERE tmp_auto_po."GRUPO" = po."GRUPO"
	AND tmp_auto_po."Date Hour" = po."Date Hour";

UPDATE smec.po
SET pot_disp = tmp_auto_po."POT_DISP"
FROM (
	SELECT "GRUPO"
		,"Date Hour"
		,"POT_DISP"
	FROM tmp_auto_po
	) AS tmp_auto_po
WHERE tmp_auto_po."GRUPO" = po."GRUPO"
	AND tmp_auto_po."Date Hour" = po."Date Hour";

DROP TABLE

IF EXISTS tmp_auto_po;
	CREATE TEMP TABLE tmp_auto_po (
		"Date Hour" timestamptz
		,"GRUPO" TEXT
		,"COMPRA_SPOT" NUMERIC
		,"POT_DISP" NUMERIC
		,DATE TEXT
		,hour INTEGER
		);

COPY tmp_auto_po("GRUPO", hour, "COMPRA_SPOT", "POT_DISP")
FROM 'C:\Users\Administrador\Desktop\po test\vg2.csv' DELIMITER ',';

COPY tmp_auto_po("date")
FROM 'C:\Users\Administrador\Desktop\po test\fecha2.csv' DELIMITER ',';

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
		,"COMPRA_SPOT"
		,DATE + interval '1 hour' * "hour" AS date2
	FROM tmp_auto_po
	) AS datefix
WHERE datefix."COMPRA_SPOT" = tmp_auto_po."COMPRA_SPOT"
	AND datefix.hour = tmp_auto_po.hour
	AND datefix."GRUPO" = tmp_auto_po."GRUPO";

ALTER TABLE tmp_auto_po

DROP COLUMN DATE
	,

DROP COLUMN hour;

UPDATE smec.po
SET "EIMPORTADA" = tmp_auto_po."COMPRA_SPOT"
FROM (
	SELECT "GRUPO"
		,"Date Hour"
		,"COMPRA_SPOT"
	FROM tmp_auto_po
	) AS tmp_auto_po
WHERE tmp_auto_po."GRUPO" = po."GRUPO"
	AND tmp_auto_po."Date Hour" = po."Date Hour";

UPDATE smec.po
SET pot_disp = tmp_auto_po."POT_DISP"
FROM (
	SELECT "GRUPO"
		,"Date Hour"
		,"POT_DISP"
	FROM tmp_auto_po
	) AS tmp_auto_po
WHERE tmp_auto_po."GRUPO" = po."GRUPO"
	AND tmp_auto_po."Date Hour" = po."Date Hour";

DROP TABLE

IF EXISTS tmp_auto_po;
	CREATE TEMP TABLE tmp_auto_po (
		"Date Hour" timestamptz
		,"GRUPO" TEXT
		,"COMPRA_SPOT" NUMERIC
		,"POT_DISP" NUMERIC
		,DATE TEXT
		,hour INTEGER
		);

COPY tmp_auto_po("GRUPO", hour, "COMPRA_SPOT", "POT_DISP")
FROM 'C:\Users\Administrador\Desktop\po test\vg3.csv' DELIMITER ',';

COPY tmp_auto_po("date")
FROM 'C:\Users\Administrador\Desktop\po test\fecha3.csv' DELIMITER ',';

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
		,"COMPRA_SPOT"
		,DATE + interval '1 hour' * "hour" AS date2
	FROM tmp_auto_po
	) AS datefix
WHERE datefix."COMPRA_SPOT" = tmp_auto_po."COMPRA_SPOT"
	AND datefix.hour = tmp_auto_po.hour
	AND datefix."GRUPO" = tmp_auto_po."GRUPO";

ALTER TABLE tmp_auto_po

DROP COLUMN DATE
	,

DROP COLUMN hour;

UPDATE smec.po
SET "EIMPORTADA" = tmp_auto_po."COMPRA_SPOT"
FROM (
	SELECT "GRUPO"
		,"Date Hour"
		,"COMPRA_SPOT"
	FROM tmp_auto_po
	) AS tmp_auto_po
WHERE tmp_auto_po."GRUPO" = po."GRUPO"
	AND tmp_auto_po."Date Hour" = po."Date Hour";

UPDATE smec.po
SET pot_disp = tmp_auto_po."POT_DISP"
FROM (
	SELECT "GRUPO"
		,"Date Hour"
		,"POT_DISP"
	FROM tmp_auto_po
	) AS tmp_auto_po
WHERE tmp_auto_po."GRUPO" = po."GRUPO"
	AND tmp_auto_po."Date Hour" = po."Date Hour";

DROP TABLE

IF EXISTS tmp_auto_po;
	CREATE TEMP TABLE tmp_auto_po (
		"Date Hour" timestamptz
		,"GRUPO" TEXT
		,"COMPRA_SPOT" NUMERIC
		,"POT_DISP" NUMERIC
		,DATE TEXT
		,hour INTEGER
		);

COPY tmp_auto_po("GRUPO", hour, "COMPRA_SPOT", "POT_DISP")
FROM 'C:\Users\Administrador\Desktop\po test\vg4.csv' DELIMITER ',';

COPY tmp_auto_po("date")
FROM 'C:\Users\Administrador\Desktop\po test\fecha4.csv' DELIMITER ',';

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
		,"COMPRA_SPOT"
		,DATE + interval '1 hour' * "hour" AS date2
	FROM tmp_auto_po
	) AS datefix
WHERE datefix."COMPRA_SPOT" = tmp_auto_po."COMPRA_SPOT"
	AND datefix.hour = tmp_auto_po.hour
	AND datefix."GRUPO" = tmp_auto_po."GRUPO";

ALTER TABLE tmp_auto_po

DROP COLUMN DATE
	,

DROP COLUMN hour;

UPDATE smec.po
SET "EIMPORTADA" = tmp_auto_po."COMPRA_SPOT"
FROM (
	SELECT "GRUPO"
		,"Date Hour"
		,"COMPRA_SPOT"
	FROM tmp_auto_po
	) AS tmp_auto_po
WHERE tmp_auto_po."GRUPO" = po."GRUPO"
	AND tmp_auto_po."Date Hour" = po."Date Hour";

UPDATE smec.po
SET pot_disp = tmp_auto_po."POT_DISP"
FROM (
	SELECT "GRUPO"
		,"Date Hour"
		,"POT_DISP"
	FROM tmp_auto_po
	) AS tmp_auto_po
WHERE tmp_auto_po."GRUPO" = po."GRUPO"
	AND tmp_auto_po."Date Hour" = po."Date Hour";

DROP TABLE

IF EXISTS tmp_auto_po;
	CREATE TEMP TABLE tmp_auto_po (
		"Date Hour" timestamptz
		,"GRUPO" TEXT
		,"COMPRA_SPOT" NUMERIC
		,"POT_DISP" NUMERIC
		,DATE TEXT
		,hour INTEGER
		);

COPY tmp_auto_po("GRUPO", hour, "COMPRA_SPOT", "POT_DISP")
FROM 'C:\Users\Administrador\Desktop\po test\vg5.csv' DELIMITER ',';

COPY tmp_auto_po("date")
FROM 'C:\Users\Administrador\Desktop\po test\fecha5.csv' DELIMITER ',';

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
		,"COMPRA_SPOT"
		,DATE + interval '1 hour' * "hour" AS date2
	FROM tmp_auto_po
	) AS datefix
WHERE datefix."COMPRA_SPOT" = tmp_auto_po."COMPRA_SPOT"
	AND datefix.hour = tmp_auto_po.hour
	AND datefix."GRUPO" = tmp_auto_po."GRUPO";

ALTER TABLE tmp_auto_po

DROP COLUMN DATE
	,

DROP COLUMN hour;

UPDATE smec.po
SET "EIMPORTADA" = tmp_auto_po."COMPRA_SPOT"
FROM (
	SELECT "GRUPO"
		,"Date Hour"
		,"COMPRA_SPOT"
	FROM tmp_auto_po
	) AS tmp_auto_po
WHERE tmp_auto_po."GRUPO" = po."GRUPO"
	AND tmp_auto_po."Date Hour" = po."Date Hour";

UPDATE smec.po
SET pot_disp = tmp_auto_po."POT_DISP"
FROM (
	SELECT "GRUPO"
		,"Date Hour"
		,"POT_DISP"
	FROM tmp_auto_po
	) AS tmp_auto_po
WHERE tmp_auto_po."GRUPO" = po."GRUPO"
	AND tmp_auto_po."Date Hour" = po."Date Hour";
