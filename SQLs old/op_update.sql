
ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

DROP TABLE IF EXISTS stage_op;
DROP TABLE IF EXISTS stage_json_d_aplicado;


CREATE TEMP TABLE stage_json_d_aplicado 
  ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     json text 
  ); 
 
CREATE TEMP TABLE stage_op (x jsonb);
COPY stage_json_d_aplicado(json) FROM 'C:\Users\Administrador\GoesGreen SRL\I4 - AUTO\import\0.json' csv quote e'\x01' delimiter e'\x02';

INSERT INTO stage_op(x)
SELECT   string_agg( json ,e'\n' ORDER BY id)::jsonb 
FROM     stage_json_d_aplicado;


ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->0->'cells');

DELETE FROM  stage_d_aplicado2 WHERE id >= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE 'Total%');
DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%Neto%');
DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';

DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op'::regclass), 
     content2 text,
     columna text	  ); 


INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;

UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'fecha' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'comprobante' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'documento_int' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'importe_bruto' WHERE id = 4 ;
UPDATE stage_d_aplicado3 SET columna = 'importe_retenido' WHERE id = 5 ;
UPDATE stage_d_aplicado3 SET columna = 'importe_neto' WHERE id = 6 ;

ALTER SEQUENCE  bmem.rowname RESTART;


DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;


DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) = 6 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
    comprobante text COLLATE pg_catalog."default",
    documento_int text COLLATE pg_catalog."default",
    fecha text COLLATE pg_catalog."default",
    importe_bruto text COLLATE pg_catalog."default",
    importe_neto text COLLATE pg_catalog."default",
    importe_retenido text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	comprobante text, 
	documento_int text,
	fecha text, 
	importe_bruto text,	
	importe_neto text,
	importe_retenido text
	));


INSERT INTO bmem.op_detalle_de_aplicado (WITH t AS (select x::json->'documents'->0->'fields'->'CustomerName'->>'content' as cliente,
				x::json->'documents'->0->'fields'->'InvoiceId'->>'content' as doc_id, 
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') as fecha_emision,
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') - interval '2 months' as periodo
from stage_op)
SELECT id, REPLACE(comprobante, '_', '') AS comprobante, REPLACE(documento_int, '_', '') AS documento_int, 
						TO_DATE(REPLACE(fecha, '_', ''), 'DD.MM.YYYY') AS fecha, 
						CASE WHEN importe_bruto LIKE '%-%' THEN ((REPLACE(REPLACE(TRANSLATE(importe_bruto, ' ._', ''), ',', '.'), '-', ''))::numeric *-1) ELSE (REPLACE(TRANSLATE(importe_bruto, ' ._', ''), ',', '.'))::numeric END AS importe_bruto, 
						CASE WHEN REPLACE(REPLACE(importe_neto, '$', ''), '_', '') LIKE '%-%' THEN ((REPLACE(REPLACE(TRANSLATE(importe_neto, ' _.$', ''), ',', '.'), '-', ''))::numeric *-1) ELSE (REPLACE(REPLACE(TRANSLATE(importe_neto, ' _.$', ''), ',', '.'), '-', '')::numeric) END AS importe_neto,
						CASE WHEN importe_retenido LIKE '%-%' THEN ((REPLACE(REPLACE(TRANSLATE(importe_retenido, ' .$_', ''), ',', '.'), '-', ''))::numeric *-1) ELSE (REPLACE(TRANSLATE(importe_retenido, ' .$_', ''), ',', '.'))::numeric END AS importe_retenido,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;

--------------------------------------------------
ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_pago RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->1->'cells');


DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%porte%');DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';

DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op_pago'::regclass), 
     content2 text,
     columna text	  ); 


INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;
UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'concepto' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'banco' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'cuenta_banc' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'cheque' WHERE id = 4 ;
UPDATE stage_d_aplicado3 SET columna = 'importe' WHERE id = 5 ;

ALTER SEQUENCE  bmem.rowname RESTART;

DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;



DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;

insert into stage_d_aplicado4 
select id, content2, 'importe' FROM stage_d_aplicado4 WHERE columna = 'cheque'
AND not exists (
    select id from stage_d_aplicado4 where columna = 'importe'
);


UPDATE stage_d_aplicado4 SET content2 = null WHERE columna = 'cheque';

DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) = 5 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
    banco text COLLATE pg_catalog."default",
    cuenta_banc text COLLATE pg_catalog."default",
    concepto text COLLATE pg_catalog."default",
    cheque text COLLATE pg_catalog."default",
    importe text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	concepto text, 
	banco text,
	cuenta_banc text, 
	cheque text,	
	importe text
	));

UPDATE stage_d_aplicado5 SET cheque = null;


INSERT INTO bmem.op_detalle_de_pago (WITH t AS (select x::json->'documents'->0->'fields'->'CustomerName'->>'content' as cliente,
				x::json->'documents'->0->'fields'->'InvoiceId'->>'content' as doc_id, 
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') as fecha_emision,
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') - interval '2 months' as periodo
from stage_op)
SELECT id, 
		TRANSLATE(banco, '_0123456789', '') AS banco, 
		regexp_replace(banco, '\D','','g') as cuenta_banc,
		concepto,
		(REPLACE(TRANSLATE(cheque, '._$ ', ''), ',', '.'))::numeric  as cheque,
		(REPLACE(TRANSLATE(importe, '._$ ', ''), ',', '.'))::numeric  as importe,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;
						
--------------------------------------------------------------------------------------------------------------

ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones2 RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->2->'cells');


DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%porte%');DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';


DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op_retenciones'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;
UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'concepto' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'num_certif' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'cod_seg' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'importe' WHERE id = 4 ;

ALTER SEQUENCE  bmem.rowname RESTART;

DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;

insert into stage_d_aplicado4 
select id, content2, 'importe' FROM stage_d_aplicado4 WHERE columna = 'cod_seg'
AND not exists (
    select id from stage_d_aplicado4 where columna = 'importe'
);

UPDATE stage_d_aplicado4 SET content2 = null WHERE columna = 'cod_seg';UPDATE stage_d_aplicado4 SET content2 = ((RIGHT(content2, -5))) WHERE content2 like '____% % %$';

DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) <= 4 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
	cod_seg text,
    concepto text COLLATE pg_catalog."default",
    importe text COLLATE pg_catalog."default",
    num_certif text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	cod_seg text,
	concepto text, 
	importe text,
	num_certif text
	)) ;


DO $$
DECLARE sql TEXT;
BEGIN
    SELECT CASE 
            WHEN (select 1 from stage_d_aplicado5 WHERE importe ~ '^[^0-9]+$' limit 1) = 1
                THEN 'DROP TABLE stage_d_aplicado5;'
            ELSE 'INSERT INTO bmem.op_retenciones(id , concepto , importe , num_certif , doc_id , fecha_emision , cliente , periodo ) (WITH t AS (select x::json->''documents''->0->''fields''->''CustomerName''->>''content'' as cliente,
				x::json->''documents''->0->''fields''->''InvoiceId''->>''content'' as doc_id, 
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') as fecha_emision,
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') - interval ''2 months'' as periodo
from stage_op)
SELECT id, 
		TRANSLATE(concepto, ''_'', '''') AS concepto, 
		((REPLACE(TRANSLATE(importe, ''.-_$ '', ''''), '','', ''.''))::numeric *-1)  as importe,
		TRANSLATE(num_certif, ''_'', '''') AS num_certif,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;'
            END AS qry
    INTO sql
    FROM stage_d_aplicado5 limit 1;
    EXECUTE (sql);
END $$;
------------------------------------------------------------
DELETE from bmem.op_retenciones WHERE concepto NOT like '%MEM%'; DELETE FROM bmem.op_retenciones WHERE importe < -9999999999;
------------------------------------------------------------
ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones2 RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->2->'cells');


DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%porte%');DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';


DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op_retenciones2'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;
UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'concepto' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'num_certif' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'cod_seg' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'importe' WHERE id = 4 ;

ALTER SEQUENCE  bmem.rowname RESTART;

DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;

insert into stage_d_aplicado4 
select id, content2, 'importe' FROM stage_d_aplicado4 WHERE columna = 'cod_seg'
AND not exists (
    select id from stage_d_aplicado4 where columna = 'importe'
);

UPDATE stage_d_aplicado4 SET content2 = null WHERE columna = 'cod_seg';UPDATE stage_d_aplicado4 SET content2 = ((RIGHT(content2, -5))) WHERE content2 like '____% % %$';

DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) <= 4 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
	cod_seg text,
    concepto text COLLATE pg_catalog."default",
    importe text COLLATE pg_catalog."default",
    num_certif text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	cod_seg text,
	concepto text, 
	importe text,
	num_certif text
	)) ;


DO $$
DECLARE sql TEXT;
BEGIN
    SELECT CASE 
            WHEN (select 1 from stage_d_aplicado5 WHERE importe ~ '^[^0-9]+$' limit 1) = 1
                THEN 'DROP TABLE stage_d_aplicado5;'
            ELSE 'INSERT INTO bmem.op_retenciones(id , concepto , importe , num_certif , doc_id , fecha_emision , cliente , periodo ) (WITH t AS (select x::json->''documents''->0->''fields''->''CustomerName''->>''content'' as cliente,
				x::json->''documents''->0->''fields''->''InvoiceId''->>''content'' as doc_id, 
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') as fecha_emision,
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') - interval ''2 months'' as periodo
from stage_op)
SELECT id, 
		TRANSLATE(concepto, ''_'', '''') AS concepto, 
		((REPLACE(TRANSLATE(importe, ''.-_$ '', ''''), '','', ''.''))::numeric *-1)  as importe,
		TRANSLATE(num_certif, ''_'', '''') AS num_certif,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;'
            END AS qry
    INTO sql
    FROM stage_d_aplicado5 limit 1;
    EXECUTE (sql);
END $$;

--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------

ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

DROP TABLE IF EXISTS stage_op;
DROP TABLE IF EXISTS stage_json_d_aplicado;


CREATE TEMP TABLE stage_json_d_aplicado 
  ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     json text 
  ); 
 
CREATE TEMP TABLE stage_op (x jsonb);
COPY stage_json_d_aplicado(json) FROM 'C:\Users\Administrador\GoesGreen SRL\I4 - AUTO\import\1.json' csv quote e'\x01' delimiter e'\x02';

INSERT INTO stage_op(x)
SELECT   string_agg( json ,e'\n' ORDER BY id)::jsonb 
FROM     stage_json_d_aplicado;


ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->0->'cells');

DELETE FROM  stage_d_aplicado2 WHERE id >= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE 'Total%');
DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%Neto%');
DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';

DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op'::regclass), 
     content2 text,
     columna text	  ); 


INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;

UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'fecha' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'comprobante' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'documento_int' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'importe_bruto' WHERE id = 4 ;
UPDATE stage_d_aplicado3 SET columna = 'importe_retenido' WHERE id = 5 ;
UPDATE stage_d_aplicado3 SET columna = 'importe_neto' WHERE id = 6 ;

ALTER SEQUENCE  bmem.rowname RESTART;


DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;


DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) = 6 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
    comprobante text COLLATE pg_catalog."default",
    documento_int text COLLATE pg_catalog."default",
    fecha text COLLATE pg_catalog."default",
    importe_bruto text COLLATE pg_catalog."default",
    importe_neto text COLLATE pg_catalog."default",
    importe_retenido text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	comprobante text, 
	documento_int text,
	fecha text, 
	importe_bruto text,	
	importe_neto text,
	importe_retenido text
	));


INSERT INTO bmem.op_detalle_de_aplicado (WITH t AS (select x::json->'documents'->0->'fields'->'CustomerName'->>'content' as cliente,
				x::json->'documents'->0->'fields'->'InvoiceId'->>'content' as doc_id, 
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') as fecha_emision,
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') - interval '2 months' as periodo
from stage_op)
SELECT id, REPLACE(comprobante, '_', '') AS comprobante, REPLACE(documento_int, '_', '') AS documento_int, 
						TO_DATE(REPLACE(fecha, '_', ''), 'DD.MM.YYYY') AS fecha, 
						CASE WHEN importe_bruto LIKE '%-%' THEN ((REPLACE(REPLACE(TRANSLATE(importe_bruto, ' ._', ''), ',', '.'), '-', ''))::numeric *-1) ELSE (REPLACE(TRANSLATE(importe_bruto, ' ._', ''), ',', '.'))::numeric END AS importe_bruto, 
						CASE WHEN REPLACE(REPLACE(importe_neto, '$', ''), '_', '') LIKE '%-%' THEN ((REPLACE(REPLACE(TRANSLATE(importe_neto, ' _.$', ''), ',', '.'), '-', ''))::numeric *-1) ELSE (REPLACE(REPLACE(TRANSLATE(importe_neto, ' _.$', ''), ',', '.'), '-', '')::numeric) END AS importe_neto,
						CASE WHEN importe_retenido LIKE '%-%' THEN ((REPLACE(REPLACE(TRANSLATE(importe_retenido, ' .$_', ''), ',', '.'), '-', ''))::numeric *-1) ELSE (REPLACE(TRANSLATE(importe_retenido, ' .$_', ''), ',', '.'))::numeric END AS importe_retenido,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;

--------------------------------------------------
ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_pago RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->1->'cells');


DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%porte%');DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';

DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op_pago'::regclass), 
     content2 text,
     columna text	  ); 


INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;
UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'concepto' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'banco' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'cuenta_banc' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'cheque' WHERE id = 4 ;
UPDATE stage_d_aplicado3 SET columna = 'importe' WHERE id = 5 ;

ALTER SEQUENCE  bmem.rowname RESTART;

DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;



DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;

insert into stage_d_aplicado4 
select id, content2, 'importe' FROM stage_d_aplicado4 WHERE columna = 'cheque'
AND not exists (
    select id from stage_d_aplicado4 where columna = 'importe'
);


UPDATE stage_d_aplicado4 SET content2 = null WHERE columna = 'cheque';

DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) = 5 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
    banco text COLLATE pg_catalog."default",
    cuenta_banc text COLLATE pg_catalog."default",
    concepto text COLLATE pg_catalog."default",
    cheque text COLLATE pg_catalog."default",
    importe text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	concepto text, 
	banco text,
	cuenta_banc text, 
	cheque text,	
	importe text
	));

UPDATE stage_d_aplicado5 SET cheque = null;


INSERT INTO bmem.op_detalle_de_pago (WITH t AS (select x::json->'documents'->0->'fields'->'CustomerName'->>'content' as cliente,
				x::json->'documents'->0->'fields'->'InvoiceId'->>'content' as doc_id, 
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') as fecha_emision,
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') - interval '2 months' as periodo
from stage_op)
SELECT id, 
		TRANSLATE(banco, '_0123456789', '') AS banco, 
		regexp_replace(banco, '\D','','g') as cuenta_banc,
		concepto,
		(REPLACE(TRANSLATE(cheque, '._$ ', ''), ',', '.'))::numeric  as cheque,
		(REPLACE(TRANSLATE(importe, '._$ ', ''), ',', '.'))::numeric  as importe,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;
						
--------------------------------------------------------------------------------------------------------------

ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones2 RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->2->'cells');


DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%porte%');DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';


DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op_retenciones'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;
UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'concepto' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'num_certif' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'cod_seg' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'importe' WHERE id = 4 ;

ALTER SEQUENCE  bmem.rowname RESTART;

DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;

insert into stage_d_aplicado4 
select id, content2, 'importe' FROM stage_d_aplicado4 WHERE columna = 'cod_seg'
AND not exists (
    select id from stage_d_aplicado4 where columna = 'importe'
);

UPDATE stage_d_aplicado4 SET content2 = null WHERE columna = 'cod_seg';UPDATE stage_d_aplicado4 SET content2 = ((RIGHT(content2, -5))) WHERE content2 like '____% % %$';

DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) <= 4 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
	cod_seg text,
    concepto text COLLATE pg_catalog."default",
    importe text COLLATE pg_catalog."default",
    num_certif text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	cod_seg text,
	concepto text, 
	importe text,
	num_certif text
	)) ;


DO $$
DECLARE sql TEXT;
BEGIN
    SELECT CASE 
            WHEN (select 1 from stage_d_aplicado5 WHERE importe ~ '^[^0-9]+$' limit 1) = 1
                THEN 'DROP TABLE stage_d_aplicado5;'
            ELSE 'INSERT INTO bmem.op_retenciones(id , concepto , importe , num_certif , doc_id , fecha_emision , cliente , periodo ) (WITH t AS (select x::json->''documents''->0->''fields''->''CustomerName''->>''content'' as cliente,
				x::json->''documents''->0->''fields''->''InvoiceId''->>''content'' as doc_id, 
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') as fecha_emision,
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') - interval ''2 months'' as periodo
from stage_op)
SELECT id, 
		TRANSLATE(concepto, ''_'', '''') AS concepto, 
		((REPLACE(TRANSLATE(importe, ''.-_$ '', ''''), '','', ''.''))::numeric *-1)  as importe,
		TRANSLATE(num_certif, ''_'', '''') AS num_certif,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;'
            END AS qry
    INTO sql
    FROM stage_d_aplicado5 limit 1;
    EXECUTE (sql);
END $$;
------------------------------------------------------------
DELETE from bmem.op_retenciones WHERE concepto NOT like '%MEM%'; DELETE FROM bmem.op_retenciones WHERE importe < -9999999999;
------------------------------------------------------------
ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones2 RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->2->'cells');


DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%porte%');DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';


DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op_retenciones2'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;
UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'concepto' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'num_certif' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'cod_seg' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'importe' WHERE id = 4 ;

ALTER SEQUENCE  bmem.rowname RESTART;

DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;

insert into stage_d_aplicado4 
select id, content2, 'importe' FROM stage_d_aplicado4 WHERE columna = 'cod_seg'
AND not exists (
    select id from stage_d_aplicado4 where columna = 'importe'
);

UPDATE stage_d_aplicado4 SET content2 = null WHERE columna = 'cod_seg';UPDATE stage_d_aplicado4 SET content2 = ((RIGHT(content2, -5))) WHERE content2 like '____% % %$';

DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) <= 4 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
	cod_seg text,
    concepto text COLLATE pg_catalog."default",
    importe text COLLATE pg_catalog."default",
    num_certif text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	cod_seg text,
	concepto text, 
	importe text,
	num_certif text
	)) ;


DO $$
DECLARE sql TEXT;
BEGIN
    SELECT CASE 
            WHEN (select 1 from stage_d_aplicado5 WHERE importe ~ '^[^0-9]+$' limit 1) = 1
                THEN 'DROP TABLE stage_d_aplicado5;'
            ELSE 'INSERT INTO bmem.op_retenciones(id , concepto , importe , num_certif , doc_id , fecha_emision , cliente , periodo ) (WITH t AS (select x::json->''documents''->0->''fields''->''CustomerName''->>''content'' as cliente,
				x::json->''documents''->0->''fields''->''InvoiceId''->>''content'' as doc_id, 
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') as fecha_emision,
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') - interval ''2 months'' as periodo
from stage_op)
SELECT id, 
		TRANSLATE(concepto, ''_'', '''') AS concepto, 
		((REPLACE(TRANSLATE(importe, ''.-_$ '', ''''), '','', ''.''))::numeric *-1)  as importe,
		TRANSLATE(num_certif, ''_'', '''') AS num_certif,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;'
            END AS qry
    INTO sql
    FROM stage_d_aplicado5 limit 1;
    EXECUTE (sql);
END $$;

--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------

ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

DROP TABLE IF EXISTS stage_op;
DROP TABLE IF EXISTS stage_json_d_aplicado;


CREATE TEMP TABLE stage_json_d_aplicado 
  ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     json text 
  ); 
 
CREATE TEMP TABLE stage_op (x jsonb);
COPY stage_json_d_aplicado(json) FROM 'C:\Users\Administrador\GoesGreen SRL\I4 - AUTO\import\2.json' csv quote e'\x01' delimiter e'\x02';

INSERT INTO stage_op(x)
SELECT   string_agg( json ,e'\n' ORDER BY id)::jsonb 
FROM     stage_json_d_aplicado;


ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->0->'cells');

DELETE FROM  stage_d_aplicado2 WHERE id >= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE 'Total%');
DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%Neto%');
DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';

DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op'::regclass), 
     content2 text,
     columna text	  ); 


INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;

UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'fecha' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'comprobante' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'documento_int' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'importe_bruto' WHERE id = 4 ;
UPDATE stage_d_aplicado3 SET columna = 'importe_retenido' WHERE id = 5 ;
UPDATE stage_d_aplicado3 SET columna = 'importe_neto' WHERE id = 6 ;

ALTER SEQUENCE  bmem.rowname RESTART;


DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;


DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) = 6 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
    comprobante text COLLATE pg_catalog."default",
    documento_int text COLLATE pg_catalog."default",
    fecha text COLLATE pg_catalog."default",
    importe_bruto text COLLATE pg_catalog."default",
    importe_neto text COLLATE pg_catalog."default",
    importe_retenido text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	comprobante text, 
	documento_int text,
	fecha text, 
	importe_bruto text,	
	importe_neto text,
	importe_retenido text
	));


INSERT INTO bmem.op_detalle_de_aplicado (WITH t AS (select x::json->'documents'->0->'fields'->'CustomerName'->>'content' as cliente,
				x::json->'documents'->0->'fields'->'InvoiceId'->>'content' as doc_id, 
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') as fecha_emision,
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') - interval '2 months' as periodo
from stage_op)
SELECT id, REPLACE(comprobante, '_', '') AS comprobante, REPLACE(documento_int, '_', '') AS documento_int, 
						TO_DATE(REPLACE(fecha, '_', ''), 'DD.MM.YYYY') AS fecha, 
						CASE WHEN importe_bruto LIKE '%-%' THEN ((REPLACE(REPLACE(TRANSLATE(importe_bruto, ' ._', ''), ',', '.'), '-', ''))::numeric *-1) ELSE (REPLACE(TRANSLATE(importe_bruto, ' ._', ''), ',', '.'))::numeric END AS importe_bruto, 
						CASE WHEN REPLACE(REPLACE(importe_neto, '$', ''), '_', '') LIKE '%-%' THEN ((REPLACE(REPLACE(TRANSLATE(importe_neto, ' _.$', ''), ',', '.'), '-', ''))::numeric *-1) ELSE (REPLACE(REPLACE(TRANSLATE(importe_neto, ' _.$', ''), ',', '.'), '-', '')::numeric) END AS importe_neto,
						CASE WHEN importe_retenido LIKE '%-%' THEN ((REPLACE(REPLACE(TRANSLATE(importe_retenido, ' .$_', ''), ',', '.'), '-', ''))::numeric *-1) ELSE (REPLACE(TRANSLATE(importe_retenido, ' .$_', ''), ',', '.'))::numeric END AS importe_retenido,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;

--------------------------------------------------
ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_pago RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->1->'cells');


DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%porte%');DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';

DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op_pago'::regclass), 
     content2 text,
     columna text	  ); 


INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;
UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'concepto' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'banco' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'cuenta_banc' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'cheque' WHERE id = 4 ;
UPDATE stage_d_aplicado3 SET columna = 'importe' WHERE id = 5 ;

ALTER SEQUENCE  bmem.rowname RESTART;

DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;



DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;

insert into stage_d_aplicado4 
select id, content2, 'importe' FROM stage_d_aplicado4 WHERE columna = 'cheque'
AND not exists (
    select id from stage_d_aplicado4 where columna = 'importe'
);


UPDATE stage_d_aplicado4 SET content2 = null WHERE columna = 'cheque';

DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) = 5 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
    banco text COLLATE pg_catalog."default",
    cuenta_banc text COLLATE pg_catalog."default",
    concepto text COLLATE pg_catalog."default",
    cheque text COLLATE pg_catalog."default",
    importe text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	concepto text, 
	banco text,
	cuenta_banc text, 
	cheque text,	
	importe text
	));

UPDATE stage_d_aplicado5 SET cheque = null;


INSERT INTO bmem.op_detalle_de_pago (WITH t AS (select x::json->'documents'->0->'fields'->'CustomerName'->>'content' as cliente,
				x::json->'documents'->0->'fields'->'InvoiceId'->>'content' as doc_id, 
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') as fecha_emision,
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') - interval '2 months' as periodo
from stage_op)
SELECT id, 
		TRANSLATE(banco, '_0123456789', '') AS banco, 
		regexp_replace(banco, '\D','','g') as cuenta_banc,
		concepto,
		(REPLACE(TRANSLATE(cheque, '._$ ', ''), ',', '.'))::numeric  as cheque,
		(REPLACE(TRANSLATE(importe, '._$ ', ''), ',', '.'))::numeric  as importe,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;
						
--------------------------------------------------------------------------------------------------------------

ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones2 RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->2->'cells');


DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%porte%');DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';


DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op_retenciones'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;
UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'concepto' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'num_certif' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'cod_seg' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'importe' WHERE id = 4 ;

ALTER SEQUENCE  bmem.rowname RESTART;

DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;

insert into stage_d_aplicado4 
select id, content2, 'importe' FROM stage_d_aplicado4 WHERE columna = 'cod_seg'
AND not exists (
    select id from stage_d_aplicado4 where columna = 'importe'
);

UPDATE stage_d_aplicado4 SET content2 = null WHERE columna = 'cod_seg';UPDATE stage_d_aplicado4 SET content2 = ((RIGHT(content2, -5))) WHERE content2 like '____% % %$';

DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) <= 4 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
	cod_seg text,
    concepto text COLLATE pg_catalog."default",
    importe text COLLATE pg_catalog."default",
    num_certif text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	cod_seg text,
	concepto text, 
	importe text,
	num_certif text
	)) ;


DO $$
DECLARE sql TEXT;
BEGIN
    SELECT CASE 
            WHEN (select 1 from stage_d_aplicado5 WHERE importe ~ '^[^0-9]+$' limit 1) = 1
                THEN 'DROP TABLE stage_d_aplicado5;'
            ELSE 'INSERT INTO bmem.op_retenciones(id , concepto , importe , num_certif , doc_id , fecha_emision , cliente , periodo ) (WITH t AS (select x::json->''documents''->0->''fields''->''CustomerName''->>''content'' as cliente,
				x::json->''documents''->0->''fields''->''InvoiceId''->>''content'' as doc_id, 
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') as fecha_emision,
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') - interval ''2 months'' as periodo
from stage_op)
SELECT id, 
		TRANSLATE(concepto, ''_'', '''') AS concepto, 
		((REPLACE(TRANSLATE(importe, ''.-_$ '', ''''), '','', ''.''))::numeric *-1)  as importe,
		TRANSLATE(num_certif, ''_'', '''') AS num_certif,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;'
            END AS qry
    INTO sql
    FROM stage_d_aplicado5 limit 1;
    EXECUTE (sql);
END $$;
------------------------------------------------------------
DELETE from bmem.op_retenciones WHERE concepto NOT like '%MEM%'; DELETE FROM bmem.op_retenciones WHERE importe < -9999999999; 
------------------------------------------------------------
ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones2 RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->2->'cells');


DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%porte%');DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';


DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op_retenciones2'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;
UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'concepto' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'num_certif' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'cod_seg' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'importe' WHERE id = 4 ;

ALTER SEQUENCE  bmem.rowname RESTART;

DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;

insert into stage_d_aplicado4 
select id, content2, 'importe' FROM stage_d_aplicado4 WHERE columna = 'cod_seg'
AND not exists (
    select id from stage_d_aplicado4 where columna = 'importe'
);

UPDATE stage_d_aplicado4 SET content2 = null WHERE columna = 'cod_seg';UPDATE stage_d_aplicado4 SET content2 = ((RIGHT(content2, -5))) WHERE content2 like '____% % %$';

DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) <= 4 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
	cod_seg text,
    concepto text COLLATE pg_catalog."default",
    importe text COLLATE pg_catalog."default",
    num_certif text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	cod_seg text,
	concepto text, 
	importe text,
	num_certif text
	)) ;


DO $$
DECLARE sql TEXT;
BEGIN
    SELECT CASE 
            WHEN (select 1 from stage_d_aplicado5 WHERE importe ~ '^[^0-9]+$' limit 1) = 1
                THEN 'DROP TABLE stage_d_aplicado5;'
            ELSE 'INSERT INTO bmem.op_retenciones(id , concepto , importe , num_certif , doc_id , fecha_emision , cliente , periodo ) (WITH t AS (select x::json->''documents''->0->''fields''->''CustomerName''->>''content'' as cliente,
				x::json->''documents''->0->''fields''->''InvoiceId''->>''content'' as doc_id, 
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') as fecha_emision,
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') - interval ''2 months'' as periodo
from stage_op)
SELECT id, 
		TRANSLATE(concepto, ''_'', '''') AS concepto, 
		((REPLACE(TRANSLATE(importe, ''.-_$ '', ''''), '','', ''.''))::numeric *-1)  as importe,
		TRANSLATE(num_certif, ''_'', '''') AS num_certif,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;'
            END AS qry
    INTO sql
    FROM stage_d_aplicado5 limit 1;
    EXECUTE (sql);
END $$;

--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------

ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

DROP TABLE IF EXISTS stage_op;
DROP TABLE IF EXISTS stage_json_d_aplicado;


CREATE TEMP TABLE stage_json_d_aplicado 
  ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     json text 
  ); 
 
CREATE TEMP TABLE stage_op (x jsonb);
COPY stage_json_d_aplicado(json) FROM 'C:\Users\Administrador\GoesGreen SRL\I4 - AUTO\import\3.json' csv quote e'\x01' delimiter e'\x02';

INSERT INTO stage_op(x)
SELECT   string_agg( json ,e'\n' ORDER BY id)::jsonb 
FROM     stage_json_d_aplicado;


ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->0->'cells');

DELETE FROM  stage_d_aplicado2 WHERE id >= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE 'Total%');
DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%Neto%');
DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';

DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op'::regclass), 
     content2 text,
     columna text	  ); 


INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;

UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'fecha' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'comprobante' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'documento_int' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'importe_bruto' WHERE id = 4 ;
UPDATE stage_d_aplicado3 SET columna = 'importe_retenido' WHERE id = 5 ;
UPDATE stage_d_aplicado3 SET columna = 'importe_neto' WHERE id = 6 ;

ALTER SEQUENCE  bmem.rowname RESTART;


DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;


DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) = 6 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
    comprobante text COLLATE pg_catalog."default",
    documento_int text COLLATE pg_catalog."default",
    fecha text COLLATE pg_catalog."default",
    importe_bruto text COLLATE pg_catalog."default",
    importe_neto text COLLATE pg_catalog."default",
    importe_retenido text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	comprobante text, 
	documento_int text,
	fecha text, 
	importe_bruto text,	
	importe_neto text,
	importe_retenido text
	));


INSERT INTO bmem.op_detalle_de_aplicado (WITH t AS (select x::json->'documents'->0->'fields'->'CustomerName'->>'content' as cliente,
				x::json->'documents'->0->'fields'->'InvoiceId'->>'content' as doc_id, 
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') as fecha_emision,
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') - interval '2 months' as periodo
from stage_op)
SELECT id, REPLACE(comprobante, '_', '') AS comprobante, REPLACE(documento_int, '_', '') AS documento_int, 
						TO_DATE(REPLACE(fecha, '_', ''), 'DD.MM.YYYY') AS fecha, 
						CASE WHEN importe_bruto LIKE '%-%' THEN ((REPLACE(REPLACE(TRANSLATE(importe_bruto, ' ._', ''), ',', '.'), '-', ''))::numeric *-1) ELSE (REPLACE(TRANSLATE(importe_bruto, ' ._', ''), ',', '.'))::numeric END AS importe_bruto, 
						CASE WHEN REPLACE(REPLACE(importe_neto, '$', ''), '_', '') LIKE '%-%' THEN ((REPLACE(REPLACE(TRANSLATE(importe_neto, ' _.$', ''), ',', '.'), '-', ''))::numeric *-1) ELSE (REPLACE(REPLACE(TRANSLATE(importe_neto, ' _.$', ''), ',', '.'), '-', '')::numeric) END AS importe_neto,
						CASE WHEN importe_retenido LIKE '%-%' THEN ((REPLACE(REPLACE(TRANSLATE(importe_retenido, ' .$_', ''), ',', '.'), '-', ''))::numeric *-1) ELSE (REPLACE(TRANSLATE(importe_retenido, ' .$_', ''), ',', '.'))::numeric END AS importe_retenido,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;

--------------------------------------------------
ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_pago RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->1->'cells');


DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%porte%');DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';

DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op_pago'::regclass), 
     content2 text,
     columna text	  ); 


INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;
UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'concepto' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'banco' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'cuenta_banc' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'cheque' WHERE id = 4 ;
UPDATE stage_d_aplicado3 SET columna = 'importe' WHERE id = 5 ;

ALTER SEQUENCE  bmem.rowname RESTART;

DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;



DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;

insert into stage_d_aplicado4 
select id, content2, 'importe' FROM stage_d_aplicado4 WHERE columna = 'cheque'
AND not exists (
    select id from stage_d_aplicado4 where columna = 'importe'
);


UPDATE stage_d_aplicado4 SET content2 = null WHERE columna = 'cheque';

DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) = 5 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
    banco text COLLATE pg_catalog."default",
    cuenta_banc text COLLATE pg_catalog."default",
    concepto text COLLATE pg_catalog."default",
    cheque text COLLATE pg_catalog."default",
    importe text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	concepto text, 
	banco text,
	cuenta_banc text, 
	cheque text,	
	importe text
	));

UPDATE stage_d_aplicado5 SET cheque = null;


INSERT INTO bmem.op_detalle_de_pago (WITH t AS (select x::json->'documents'->0->'fields'->'CustomerName'->>'content' as cliente,
				x::json->'documents'->0->'fields'->'InvoiceId'->>'content' as doc_id, 
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') as fecha_emision,
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') - interval '2 months' as periodo
from stage_op)
SELECT id, 
		TRANSLATE(banco, '_0123456789', '') AS banco, 
		regexp_replace(banco, '\D','','g') as cuenta_banc,
		concepto,
		(REPLACE(TRANSLATE(cheque, '._$ ', ''), ',', '.'))::numeric  as cheque,
		(REPLACE(TRANSLATE(importe, '._$ ', ''), ',', '.'))::numeric  as importe,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;
						
--------------------------------------------------------------------------------------------------------------

ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones2 RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->2->'cells');


DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%porte%');DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';


DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op_retenciones'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;
UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'concepto' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'num_certif' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'cod_seg' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'importe' WHERE id = 4 ;

ALTER SEQUENCE  bmem.rowname RESTART;

DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;

insert into stage_d_aplicado4 
select id, content2, 'importe' FROM stage_d_aplicado4 WHERE columna = 'cod_seg'
AND not exists (
    select id from stage_d_aplicado4 where columna = 'importe'
);

UPDATE stage_d_aplicado4 SET content2 = null WHERE columna = 'cod_seg';UPDATE stage_d_aplicado4 SET content2 = ((RIGHT(content2, -5))) WHERE content2 like '____% % %$';

DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) <= 4 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
	cod_seg text,
    concepto text COLLATE pg_catalog."default",
    importe text COLLATE pg_catalog."default",
    num_certif text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	cod_seg text,
	concepto text, 
	importe text,
	num_certif text
	)) ;


DO $$
DECLARE sql TEXT;
BEGIN
    SELECT CASE 
            WHEN (select 1 from stage_d_aplicado5 WHERE importe ~ '^[^0-9]+$' limit 1) = 1
                THEN 'DROP TABLE stage_d_aplicado5;'
            ELSE 'INSERT INTO bmem.op_retenciones(id , concepto , importe , num_certif , doc_id , fecha_emision , cliente , periodo ) (WITH t AS (select x::json->''documents''->0->''fields''->''CustomerName''->>''content'' as cliente,
				x::json->''documents''->0->''fields''->''InvoiceId''->>''content'' as doc_id, 
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') as fecha_emision,
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') - interval ''2 months'' as periodo
from stage_op)
SELECT id, 
		TRANSLATE(concepto, ''_'', '''') AS concepto, 
		((REPLACE(TRANSLATE(importe, ''.-_$ '', ''''), '','', ''.''))::numeric *-1)  as importe,
		TRANSLATE(num_certif, ''_'', '''') AS num_certif,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;'
            END AS qry
    INTO sql
    FROM stage_d_aplicado5 limit 1;
    EXECUTE (sql);
END $$;
------------------------------------------------------------
DELETE from bmem.op_retenciones WHERE concepto NOT like '%MEM%'; DELETE FROM bmem.op_retenciones WHERE importe < -9999999999;
------------------------------------------------------------
ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones2 RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->2->'cells');


DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%porte%');DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';


DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op_retenciones2'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;
UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'concepto' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'num_certif' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'cod_seg' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'importe' WHERE id = 4 ;

ALTER SEQUENCE  bmem.rowname RESTART;

DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;

insert into stage_d_aplicado4 
select id, content2, 'importe' FROM stage_d_aplicado4 WHERE columna = 'cod_seg'
AND not exists (
    select id from stage_d_aplicado4 where columna = 'importe'
);

UPDATE stage_d_aplicado4 SET content2 = null WHERE columna = 'cod_seg';UPDATE stage_d_aplicado4 SET content2 = ((RIGHT(content2, -5))) WHERE content2 like '____% % %$';

DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) <= 4 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
	cod_seg text,
    concepto text COLLATE pg_catalog."default",
    importe text COLLATE pg_catalog."default",
    num_certif text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	cod_seg text,
	concepto text, 
	importe text,
	num_certif text
	)) ;


DO $$
DECLARE sql TEXT;
BEGIN
    SELECT CASE 
            WHEN (select 1 from stage_d_aplicado5 WHERE importe ~ '^[^0-9]+$' limit 1) = 1
                THEN 'DROP TABLE stage_d_aplicado5;'
            ELSE 'INSERT INTO bmem.op_retenciones(id , concepto , importe , num_certif , doc_id , fecha_emision , cliente , periodo ) (WITH t AS (select x::json->''documents''->0->''fields''->''CustomerName''->>''content'' as cliente,
				x::json->''documents''->0->''fields''->''InvoiceId''->>''content'' as doc_id, 
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') as fecha_emision,
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') - interval ''2 months'' as periodo
from stage_op)
SELECT id, 
		TRANSLATE(concepto, ''_'', '''') AS concepto, 
		((REPLACE(TRANSLATE(importe, ''.-_$ '', ''''), '','', ''.''))::numeric *-1)  as importe,
		TRANSLATE(num_certif, ''_'', '''') AS num_certif,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;'
            END AS qry
    INTO sql
    FROM stage_d_aplicado5 limit 1;
    EXECUTE (sql);
END $$;

--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------

ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

DROP TABLE IF EXISTS stage_op;
DROP TABLE IF EXISTS stage_json_d_aplicado;


CREATE TEMP TABLE stage_json_d_aplicado 
  ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     json text 
  ); 
 
CREATE TEMP TABLE stage_op (x jsonb);
COPY stage_json_d_aplicado(json) FROM 'C:\Users\Administrador\GoesGreen SRL\I4 - AUTO\import\4.json' csv quote e'\x01' delimiter e'\x02';

INSERT INTO stage_op(x)
SELECT   string_agg( json ,e'\n' ORDER BY id)::jsonb 
FROM     stage_json_d_aplicado;


ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->0->'cells');

DELETE FROM  stage_d_aplicado2 WHERE id >= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE 'Total%');
DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%Neto%');
DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';

DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op'::regclass), 
     content2 text,
     columna text	  ); 


INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;

UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'fecha' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'comprobante' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'documento_int' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'importe_bruto' WHERE id = 4 ;
UPDATE stage_d_aplicado3 SET columna = 'importe_retenido' WHERE id = 5 ;
UPDATE stage_d_aplicado3 SET columna = 'importe_neto' WHERE id = 6 ;

ALTER SEQUENCE  bmem.rowname RESTART;


DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;


DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) = 6 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
    comprobante text COLLATE pg_catalog."default",
    documento_int text COLLATE pg_catalog."default",
    fecha text COLLATE pg_catalog."default",
    importe_bruto text COLLATE pg_catalog."default",
    importe_neto text COLLATE pg_catalog."default",
    importe_retenido text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	comprobante text, 
	documento_int text,
	fecha text, 
	importe_bruto text,	
	importe_neto text,
	importe_retenido text
	));


INSERT INTO bmem.op_detalle_de_aplicado (WITH t AS (select x::json->'documents'->0->'fields'->'CustomerName'->>'content' as cliente,
				x::json->'documents'->0->'fields'->'InvoiceId'->>'content' as doc_id, 
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') as fecha_emision,
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') - interval '2 months' as periodo
from stage_op)
SELECT id, REPLACE(comprobante, '_', '') AS comprobante, REPLACE(documento_int, '_', '') AS documento_int, 
						TO_DATE(REPLACE(fecha, '_', ''), 'DD.MM.YYYY') AS fecha, 
						CASE WHEN importe_bruto LIKE '%-%' THEN ((REPLACE(REPLACE(TRANSLATE(importe_bruto, ' ._', ''), ',', '.'), '-', ''))::numeric *-1) ELSE (REPLACE(TRANSLATE(importe_bruto, ' ._', ''), ',', '.'))::numeric END AS importe_bruto, 
						CASE WHEN REPLACE(REPLACE(importe_neto, '$', ''), '_', '') LIKE '%-%' THEN ((REPLACE(REPLACE(TRANSLATE(importe_neto, ' _.$', ''), ',', '.'), '-', ''))::numeric *-1) ELSE (REPLACE(REPLACE(TRANSLATE(importe_neto, ' _.$', ''), ',', '.'), '-', '')::numeric) END AS importe_neto,
						CASE WHEN importe_retenido LIKE '%-%' THEN ((REPLACE(REPLACE(TRANSLATE(importe_retenido, ' .$_', ''), ',', '.'), '-', ''))::numeric *-1) ELSE (REPLACE(TRANSLATE(importe_retenido, ' .$_', ''), ',', '.'))::numeric END AS importe_retenido,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;

--------------------------------------------------
ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_pago RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->1->'cells');


DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%porte%');DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';

DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op_pago'::regclass), 
     content2 text,
     columna text	  ); 


INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;
UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'concepto' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'banco' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'cuenta_banc' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'cheque' WHERE id = 4 ;
UPDATE stage_d_aplicado3 SET columna = 'importe' WHERE id = 5 ;

ALTER SEQUENCE  bmem.rowname RESTART;

DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;



DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;

insert into stage_d_aplicado4 
select id, content2, 'importe' FROM stage_d_aplicado4 WHERE columna = 'cheque'
AND not exists (
    select id from stage_d_aplicado4 where columna = 'importe'
);


UPDATE stage_d_aplicado4 SET content2 = null WHERE columna = 'cheque';

DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) = 5 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
    banco text COLLATE pg_catalog."default",
    cuenta_banc text COLLATE pg_catalog."default",
    concepto text COLLATE pg_catalog."default",
    cheque text COLLATE pg_catalog."default",
    importe text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	concepto text, 
	banco text,
	cuenta_banc text, 
	cheque text,	
	importe text
	));

UPDATE stage_d_aplicado5 SET cheque = null;


INSERT INTO bmem.op_detalle_de_pago (WITH t AS (select x::json->'documents'->0->'fields'->'CustomerName'->>'content' as cliente,
				x::json->'documents'->0->'fields'->'InvoiceId'->>'content' as doc_id, 
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') as fecha_emision,
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') - interval '2 months' as periodo
from stage_op)
SELECT id, 
		TRANSLATE(banco, '_0123456789', '') AS banco, 
		regexp_replace(banco, '\D','','g') as cuenta_banc,
		concepto,
		(REPLACE(TRANSLATE(cheque, '._$ ', ''), ',', '.'))::numeric  as cheque,
		(REPLACE(TRANSLATE(importe, '._$ ', ''), ',', '.'))::numeric  as importe,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;
						
--------------------------------------------------------------------------------------------------------------

ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones2 RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->2->'cells');


DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%porte%');DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';


DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op_retenciones'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;
UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'concepto' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'num_certif' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'cod_seg' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'importe' WHERE id = 4 ;

ALTER SEQUENCE  bmem.rowname RESTART;

DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;

insert into stage_d_aplicado4 
select id, content2, 'importe' FROM stage_d_aplicado4 WHERE columna = 'cod_seg'
AND not exists (
    select id from stage_d_aplicado4 where columna = 'importe'
);

UPDATE stage_d_aplicado4 SET content2 = null WHERE columna = 'cod_seg';UPDATE stage_d_aplicado4 SET content2 = ((RIGHT(content2, -5))) WHERE content2 like '____% % %$';

DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) <= 4 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
	cod_seg text,
    concepto text COLLATE pg_catalog."default",
    importe text COLLATE pg_catalog."default",
    num_certif text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	cod_seg text,
	concepto text, 
	importe text,
	num_certif text
	)) ;


DO $$
DECLARE sql TEXT;
BEGIN
    SELECT CASE 
            WHEN (select 1 from stage_d_aplicado5 WHERE importe ~ '^[^0-9]+$' limit 1) = 1
                THEN 'DROP TABLE stage_d_aplicado5;'
            ELSE 'INSERT INTO bmem.op_retenciones(id , concepto , importe , num_certif , doc_id , fecha_emision , cliente , periodo ) (WITH t AS (select x::json->''documents''->0->''fields''->''CustomerName''->>''content'' as cliente,
				x::json->''documents''->0->''fields''->''InvoiceId''->>''content'' as doc_id, 
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') as fecha_emision,
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') - interval ''2 months'' as periodo
from stage_op)
SELECT id, 
		TRANSLATE(concepto, ''_'', '''') AS concepto, 
		((REPLACE(TRANSLATE(importe, ''.-_$ '', ''''), '','', ''.''))::numeric *-1)  as importe,
		TRANSLATE(num_certif, ''_'', '''') AS num_certif,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;'
            END AS qry
    INTO sql
    FROM stage_d_aplicado5 limit 1;
    EXECUTE (sql);
END $$;
------------------------------------------------------------
DELETE from bmem.op_retenciones WHERE concepto NOT like '%MEM%'; DELETE FROM bmem.op_retenciones WHERE importe < -9999999999;
------------------------------------------------------------
ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones2 RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->2->'cells');


DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%porte%');DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';


DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op_retenciones2'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;
UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'concepto' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'num_certif' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'cod_seg' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'importe' WHERE id = 4 ;

ALTER SEQUENCE  bmem.rowname RESTART;

DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;

insert into stage_d_aplicado4 
select id, content2, 'importe' FROM stage_d_aplicado4 WHERE columna = 'cod_seg'
AND not exists (
    select id from stage_d_aplicado4 where columna = 'importe'
);

UPDATE stage_d_aplicado4 SET content2 = null WHERE columna = 'cod_seg';UPDATE stage_d_aplicado4 SET content2 = ((RIGHT(content2, -5))) WHERE content2 like '____% % %$';

DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) <= 4 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
	cod_seg text,
    concepto text COLLATE pg_catalog."default",
    importe text COLLATE pg_catalog."default",
    num_certif text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	cod_seg text,
	concepto text, 
	importe text,
	num_certif text
	)) ;


DO $$
DECLARE sql TEXT;
BEGIN
    SELECT CASE 
            WHEN (select 1 from stage_d_aplicado5 WHERE importe ~ '^[^0-9]+$' limit 1) = 1
                THEN 'DROP TABLE stage_d_aplicado5;'
            ELSE 'INSERT INTO bmem.op_retenciones(id , concepto , importe , num_certif , doc_id , fecha_emision , cliente , periodo ) (WITH t AS (select x::json->''documents''->0->''fields''->''CustomerName''->>''content'' as cliente,
				x::json->''documents''->0->''fields''->''InvoiceId''->>''content'' as doc_id, 
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') as fecha_emision,
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') - interval ''2 months'' as periodo
from stage_op)
SELECT id, 
		TRANSLATE(concepto, ''_'', '''') AS concepto, 
		((REPLACE(TRANSLATE(importe, ''.-_$ '', ''''), '','', ''.''))::numeric *-1)  as importe,
		TRANSLATE(num_certif, ''_'', '''') AS num_certif,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;'
            END AS qry
    INTO sql
    FROM stage_d_aplicado5 limit 1;
    EXECUTE (sql);
END $$;

--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------

ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

DROP TABLE IF EXISTS stage_op;
DROP TABLE IF EXISTS stage_json_d_aplicado;


CREATE TEMP TABLE stage_json_d_aplicado 
  ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     json text 
  ); 
 
CREATE TEMP TABLE stage_op (x jsonb);
COPY stage_json_d_aplicado(json) FROM 'C:\Users\Administrador\GoesGreen SRL\I4 - AUTO\import\5.json' csv quote e'\x01' delimiter e'\x02';

INSERT INTO stage_op(x)
SELECT   string_agg( json ,e'\n' ORDER BY id)::jsonb 
FROM     stage_json_d_aplicado;


ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->0->'cells');

DELETE FROM  stage_d_aplicado2 WHERE id >= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE 'Total%');
DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%Neto%');
DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';

DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op'::regclass), 
     content2 text,
     columna text	  ); 


INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;

UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'fecha' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'comprobante' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'documento_int' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'importe_bruto' WHERE id = 4 ;
UPDATE stage_d_aplicado3 SET columna = 'importe_retenido' WHERE id = 5 ;
UPDATE stage_d_aplicado3 SET columna = 'importe_neto' WHERE id = 6 ;

ALTER SEQUENCE  bmem.rowname RESTART;


DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;


DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) = 6 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
    comprobante text COLLATE pg_catalog."default",
    documento_int text COLLATE pg_catalog."default",
    fecha text COLLATE pg_catalog."default",
    importe_bruto text COLLATE pg_catalog."default",
    importe_neto text COLLATE pg_catalog."default",
    importe_retenido text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	comprobante text, 
	documento_int text,
	fecha text, 
	importe_bruto text,	
	importe_neto text,
	importe_retenido text
	));


INSERT INTO bmem.op_detalle_de_aplicado (WITH t AS (select x::json->'documents'->0->'fields'->'CustomerName'->>'content' as cliente,
				x::json->'documents'->0->'fields'->'InvoiceId'->>'content' as doc_id, 
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') as fecha_emision,
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') - interval '2 months' as periodo
from stage_op)
SELECT id, REPLACE(comprobante, '_', '') AS comprobante, REPLACE(documento_int, '_', '') AS documento_int, 
						TO_DATE(REPLACE(fecha, '_', ''), 'DD.MM.YYYY') AS fecha, 
						CASE WHEN importe_bruto LIKE '%-%' THEN ((REPLACE(REPLACE(TRANSLATE(importe_bruto, ' ._', ''), ',', '.'), '-', ''))::numeric *-1) ELSE (REPLACE(TRANSLATE(importe_bruto, ' ._', ''), ',', '.'))::numeric END AS importe_bruto, 
						CASE WHEN REPLACE(REPLACE(importe_neto, '$', ''), '_', '') LIKE '%-%' THEN ((REPLACE(REPLACE(TRANSLATE(importe_neto, ' _.$', ''), ',', '.'), '-', ''))::numeric *-1) ELSE (REPLACE(REPLACE(TRANSLATE(importe_neto, ' _.$', ''), ',', '.'), '-', '')::numeric) END AS importe_neto,
						CASE WHEN importe_retenido LIKE '%-%' THEN ((REPLACE(REPLACE(TRANSLATE(importe_retenido, ' .$_', ''), ',', '.'), '-', ''))::numeric *-1) ELSE (REPLACE(TRANSLATE(importe_retenido, ' .$_', ''), ',', '.'))::numeric END AS importe_retenido,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;

--------------------------------------------------
ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_pago RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->1->'cells');


DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%porte%');DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';

DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op_pago'::regclass), 
     content2 text,
     columna text	  ); 


INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;
UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'concepto' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'banco' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'cuenta_banc' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'cheque' WHERE id = 4 ;
UPDATE stage_d_aplicado3 SET columna = 'importe' WHERE id = 5 ;

ALTER SEQUENCE  bmem.rowname RESTART;

DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;



DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;

insert into stage_d_aplicado4 
select id, content2, 'importe' FROM stage_d_aplicado4 WHERE columna = 'cheque'
AND not exists (
    select id from stage_d_aplicado4 where columna = 'importe'
);


UPDATE stage_d_aplicado4 SET content2 = null WHERE columna = 'cheque';

DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) = 5 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
    banco text COLLATE pg_catalog."default",
    cuenta_banc text COLLATE pg_catalog."default",
    concepto text COLLATE pg_catalog."default",
    cheque text COLLATE pg_catalog."default",
    importe text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	concepto text, 
	banco text,
	cuenta_banc text, 
	cheque text,	
	importe text
	));

UPDATE stage_d_aplicado5 SET cheque = null;


INSERT INTO bmem.op_detalle_de_pago (WITH t AS (select x::json->'documents'->0->'fields'->'CustomerName'->>'content' as cliente,
				x::json->'documents'->0->'fields'->'InvoiceId'->>'content' as doc_id, 
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') as fecha_emision,
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') - interval '2 months' as periodo
from stage_op)
SELECT id, 
		TRANSLATE(banco, '_0123456789', '') AS banco, 
		regexp_replace(banco, '\D','','g') as cuenta_banc,
		concepto,
		(REPLACE(TRANSLATE(cheque, '._$ ', ''), ',', '.'))::numeric  as cheque,
		(REPLACE(TRANSLATE(importe, '._$ ', ''), ',', '.'))::numeric  as importe,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;
						
--------------------------------------------------------------------------------------------------------------

ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones2 RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->2->'cells');


DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%porte%');DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';


DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op_retenciones'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;
UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'concepto' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'num_certif' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'cod_seg' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'importe' WHERE id = 4 ;

ALTER SEQUENCE  bmem.rowname RESTART;

DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;

insert into stage_d_aplicado4 
select id, content2, 'importe' FROM stage_d_aplicado4 WHERE columna = 'cod_seg'
AND not exists (
    select id from stage_d_aplicado4 where columna = 'importe'
);

UPDATE stage_d_aplicado4 SET content2 = null WHERE columna = 'cod_seg';UPDATE stage_d_aplicado4 SET content2 = ((RIGHT(content2, -5))) WHERE content2 like '____% % %$';

DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) <= 4 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
	cod_seg text,
    concepto text COLLATE pg_catalog."default",
    importe text COLLATE pg_catalog."default",
    num_certif text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	cod_seg text,
	concepto text, 
	importe text,
	num_certif text
	)) ;


DO $$
DECLARE sql TEXT;
BEGIN
    SELECT CASE 
            WHEN (select 1 from stage_d_aplicado5 WHERE importe ~ '^[^0-9]+$' limit 1) = 1
                THEN 'DROP TABLE stage_d_aplicado5;'
            ELSE 'INSERT INTO bmem.op_retenciones(id , concepto , importe , num_certif , doc_id , fecha_emision , cliente , periodo ) (WITH t AS (select x::json->''documents''->0->''fields''->''CustomerName''->>''content'' as cliente,
				x::json->''documents''->0->''fields''->''InvoiceId''->>''content'' as doc_id, 
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') as fecha_emision,
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') - interval ''2 months'' as periodo
from stage_op)
SELECT id, 
		TRANSLATE(concepto, ''_'', '''') AS concepto, 
		((REPLACE(TRANSLATE(importe, ''.-_$ '', ''''), '','', ''.''))::numeric *-1)  as importe,
		TRANSLATE(num_certif, ''_'', '''') AS num_certif,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;'
            END AS qry
    INTO sql
    FROM stage_d_aplicado5 limit 1;
    EXECUTE (sql);
END $$;
------------------------------------------------------------
DELETE from bmem.op_retenciones WHERE concepto NOT like '%MEM%'; DELETE FROM bmem.op_retenciones WHERE importe < -9999999999;
------------------------------------------------------------
ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones2 RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->2->'cells');


DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%porte%');DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';


DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op_retenciones2'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;
UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'concepto' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'num_certif' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'cod_seg' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'importe' WHERE id = 4 ;

ALTER SEQUENCE  bmem.rowname RESTART;

DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;

insert into stage_d_aplicado4 
select id, content2, 'importe' FROM stage_d_aplicado4 WHERE columna = 'cod_seg'
AND not exists (
    select id from stage_d_aplicado4 where columna = 'importe'
);

UPDATE stage_d_aplicado4 SET content2 = null WHERE columna = 'cod_seg';UPDATE stage_d_aplicado4 SET content2 = ((RIGHT(content2, -5))) WHERE content2 like '____% % %$';

DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) <= 4 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
	cod_seg text,
    concepto text COLLATE pg_catalog."default",
    importe text COLLATE pg_catalog."default",
    num_certif text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	cod_seg text,
	concepto text, 
	importe text,
	num_certif text
	)) ;


DO $$
DECLARE sql TEXT;
BEGIN
    SELECT CASE 
            WHEN (select 1 from stage_d_aplicado5 WHERE importe ~ '^[^0-9]+$' limit 1) = 1
                THEN 'DROP TABLE stage_d_aplicado5;'
            ELSE 'INSERT INTO bmem.op_retenciones(id , concepto , importe , num_certif , doc_id , fecha_emision , cliente , periodo ) (WITH t AS (select x::json->''documents''->0->''fields''->''CustomerName''->>''content'' as cliente,
				x::json->''documents''->0->''fields''->''InvoiceId''->>''content'' as doc_id, 
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') as fecha_emision,
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') - interval ''2 months'' as periodo
from stage_op)
SELECT id, 
		TRANSLATE(concepto, ''_'', '''') AS concepto, 
		((REPLACE(TRANSLATE(importe, ''.-_$ '', ''''), '','', ''.''))::numeric *-1)  as importe,
		TRANSLATE(num_certif, ''_'', '''') AS num_certif,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;'
            END AS qry
    INTO sql
    FROM stage_d_aplicado5 limit 1;
    EXECUTE (sql);
END $$;

--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------

ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

DROP TABLE IF EXISTS stage_op;
DROP TABLE IF EXISTS stage_json_d_aplicado;


CREATE TEMP TABLE stage_json_d_aplicado 
  ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     json text 
  ); 
 
CREATE TEMP TABLE stage_op (x jsonb);
COPY stage_json_d_aplicado(json) FROM 'C:\Users\Administrador\GoesGreen SRL\I4 - AUTO\import\6.json' csv quote e'\x01' delimiter e'\x02';

INSERT INTO stage_op(x)
SELECT   string_agg( json ,e'\n' ORDER BY id)::jsonb 
FROM     stage_json_d_aplicado;


ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->0->'cells');

DELETE FROM  stage_d_aplicado2 WHERE id >= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE 'Total%');
DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%Neto%');
DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';

DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op'::regclass), 
     content2 text,
     columna text	  ); 


INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;

UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'fecha' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'comprobante' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'documento_int' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'importe_bruto' WHERE id = 4 ;
UPDATE stage_d_aplicado3 SET columna = 'importe_retenido' WHERE id = 5 ;
UPDATE stage_d_aplicado3 SET columna = 'importe_neto' WHERE id = 6 ;

ALTER SEQUENCE  bmem.rowname RESTART;


DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;


DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) = 6 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
    comprobante text COLLATE pg_catalog."default",
    documento_int text COLLATE pg_catalog."default",
    fecha text COLLATE pg_catalog."default",
    importe_bruto text COLLATE pg_catalog."default",
    importe_neto text COLLATE pg_catalog."default",
    importe_retenido text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	comprobante text, 
	documento_int text,
	fecha text, 
	importe_bruto text,	
	importe_neto text,
	importe_retenido text
	));


INSERT INTO bmem.op_detalle_de_aplicado (WITH t AS (select x::json->'documents'->0->'fields'->'CustomerName'->>'content' as cliente,
				x::json->'documents'->0->'fields'->'InvoiceId'->>'content' as doc_id, 
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') as fecha_emision,
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') - interval '2 months' as periodo
from stage_op)
SELECT id, REPLACE(comprobante, '_', '') AS comprobante, REPLACE(documento_int, '_', '') AS documento_int, 
						TO_DATE(REPLACE(fecha, '_', ''), 'DD.MM.YYYY') AS fecha, 
						CASE WHEN importe_bruto LIKE '%-%' THEN ((REPLACE(REPLACE(TRANSLATE(importe_bruto, ' ._', ''), ',', '.'), '-', ''))::numeric *-1) ELSE (REPLACE(TRANSLATE(importe_bruto, ' ._', ''), ',', '.'))::numeric END AS importe_bruto, 
						CASE WHEN REPLACE(REPLACE(importe_neto, '$', ''), '_', '') LIKE '%-%' THEN ((REPLACE(REPLACE(TRANSLATE(importe_neto, ' _.$', ''), ',', '.'), '-', ''))::numeric *-1) ELSE (REPLACE(REPLACE(TRANSLATE(importe_neto, ' _.$', ''), ',', '.'), '-', '')::numeric) END AS importe_neto,
						CASE WHEN importe_retenido LIKE '%-%' THEN ((REPLACE(REPLACE(TRANSLATE(importe_retenido, ' .$_', ''), ',', '.'), '-', ''))::numeric *-1) ELSE (REPLACE(TRANSLATE(importe_retenido, ' .$_', ''), ',', '.'))::numeric END AS importe_retenido,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;

--------------------------------------------------
ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_pago RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->1->'cells');


DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%porte%');DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';

DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op_pago'::regclass), 
     content2 text,
     columna text	  ); 


INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;
UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'concepto' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'banco' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'cuenta_banc' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'cheque' WHERE id = 4 ;
UPDATE stage_d_aplicado3 SET columna = 'importe' WHERE id = 5 ;

ALTER SEQUENCE  bmem.rowname RESTART;

DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;



DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;

insert into stage_d_aplicado4 
select id, content2, 'importe' FROM stage_d_aplicado4 WHERE columna = 'cheque'
AND not exists (
    select id from stage_d_aplicado4 where columna = 'importe'
);


UPDATE stage_d_aplicado4 SET content2 = null WHERE columna = 'cheque';

DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) = 5 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
    banco text COLLATE pg_catalog."default",
    cuenta_banc text COLLATE pg_catalog."default",
    concepto text COLLATE pg_catalog."default",
    cheque text COLLATE pg_catalog."default",
    importe text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	concepto text, 
	banco text,
	cuenta_banc text, 
	cheque text,	
	importe text
	));

UPDATE stage_d_aplicado5 SET cheque = null;


INSERT INTO bmem.op_detalle_de_pago (WITH t AS (select x::json->'documents'->0->'fields'->'CustomerName'->>'content' as cliente,
				x::json->'documents'->0->'fields'->'InvoiceId'->>'content' as doc_id, 
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') as fecha_emision,
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') - interval '2 months' as periodo
from stage_op)
SELECT id, 
		TRANSLATE(banco, '_0123456789', '') AS banco, 
		regexp_replace(banco, '\D','','g') as cuenta_banc,
		concepto,
		(REPLACE(TRANSLATE(cheque, '._$ ', ''), ',', '.'))::numeric  as cheque,
		(REPLACE(TRANSLATE(importe, '._$ ', ''), ',', '.'))::numeric  as importe,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;
						
--------------------------------------------------------------------------------------------------------------

ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones2 RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->2->'cells');


DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%porte%');DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';


DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op_retenciones'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;
UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'concepto' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'num_certif' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'cod_seg' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'importe' WHERE id = 4 ;

ALTER SEQUENCE  bmem.rowname RESTART;

DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;

insert into stage_d_aplicado4 
select id, content2, 'importe' FROM stage_d_aplicado4 WHERE columna = 'cod_seg'
AND not exists (
    select id from stage_d_aplicado4 where columna = 'importe'
);

UPDATE stage_d_aplicado4 SET content2 = null WHERE columna = 'cod_seg';UPDATE stage_d_aplicado4 SET content2 = ((RIGHT(content2, -5))) WHERE content2 like '____% % %$';

DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) <= 4 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
	cod_seg text,
    concepto text COLLATE pg_catalog."default",
    importe text COLLATE pg_catalog."default",
    num_certif text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	cod_seg text,
	concepto text, 
	importe text,
	num_certif text
	)) ;


DO $$
DECLARE sql TEXT;
BEGIN
    SELECT CASE 
            WHEN (select 1 from stage_d_aplicado5 WHERE importe ~ '^[^0-9]+$' limit 1) = 1
                THEN 'DROP TABLE stage_d_aplicado5;'
            ELSE 'INSERT INTO bmem.op_retenciones(id , concepto , importe , num_certif , doc_id , fecha_emision , cliente , periodo ) (WITH t AS (select x::json->''documents''->0->''fields''->''CustomerName''->>''content'' as cliente,
				x::json->''documents''->0->''fields''->''InvoiceId''->>''content'' as doc_id, 
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') as fecha_emision,
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') - interval ''2 months'' as periodo
from stage_op)
SELECT id, 
		TRANSLATE(concepto, ''_'', '''') AS concepto, 
		((REPLACE(TRANSLATE(importe, ''.-_$ '', ''''), '','', ''.''))::numeric *-1)  as importe,
		TRANSLATE(num_certif, ''_'', '''') AS num_certif,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;'
            END AS qry
    INTO sql
    FROM stage_d_aplicado5 limit 1;
    EXECUTE (sql);
END $$;
------------------------------------------------------------
DELETE from bmem.op_retenciones WHERE concepto NOT like '%MEM%'; DELETE FROM bmem.op_retenciones WHERE importe < -9999999999;
------------------------------------------------------------
ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones2 RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->2->'cells');


DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%porte%');DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';


DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op_retenciones2'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;
UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'concepto' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'num_certif' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'cod_seg' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'importe' WHERE id = 4 ;

ALTER SEQUENCE  bmem.rowname RESTART;

DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;

insert into stage_d_aplicado4 
select id, content2, 'importe' FROM stage_d_aplicado4 WHERE columna = 'cod_seg'
AND not exists (
    select id from stage_d_aplicado4 where columna = 'importe'
);

UPDATE stage_d_aplicado4 SET content2 = null WHERE columna = 'cod_seg';UPDATE stage_d_aplicado4 SET content2 = ((RIGHT(content2, -5))) WHERE content2 like '____% % %$';

DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) <= 4 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
	cod_seg text,
    concepto text COLLATE pg_catalog."default",
    importe text COLLATE pg_catalog."default",
    num_certif text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	cod_seg text,
	concepto text, 
	importe text,
	num_certif text
	)) ;


DO $$
DECLARE sql TEXT;
BEGIN
    SELECT CASE 
            WHEN (select 1 from stage_d_aplicado5 WHERE importe ~ '^[^0-9]+$' limit 1) = 1
                THEN 'DROP TABLE stage_d_aplicado5;'
            ELSE 'INSERT INTO bmem.op_retenciones(id , concepto , importe , num_certif , doc_id , fecha_emision , cliente , periodo ) (WITH t AS (select x::json->''documents''->0->''fields''->''CustomerName''->>''content'' as cliente,
				x::json->''documents''->0->''fields''->''InvoiceId''->>''content'' as doc_id, 
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') as fecha_emision,
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') - interval ''2 months'' as periodo
from stage_op)
SELECT id, 
		TRANSLATE(concepto, ''_'', '''') AS concepto, 
		((REPLACE(TRANSLATE(importe, ''.-_$ '', ''''), '','', ''.''))::numeric *-1)  as importe,
		TRANSLATE(num_certif, ''_'', '''') AS num_certif,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;'
            END AS qry
    INTO sql
    FROM stage_d_aplicado5 limit 1;
    EXECUTE (sql);
END $$;

--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------

ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

DROP TABLE IF EXISTS stage_op;
DROP TABLE IF EXISTS stage_json_d_aplicado;


CREATE TEMP TABLE stage_json_d_aplicado 
  ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     json text 
  ); 
 
CREATE TEMP TABLE stage_op (x jsonb);
COPY stage_json_d_aplicado(json) FROM 'C:\Users\Administrador\GoesGreen SRL\I4 - AUTO\import\7.json' csv quote e'\x01' delimiter e'\x02';

INSERT INTO stage_op(x)
SELECT   string_agg( json ,e'\n' ORDER BY id)::jsonb 
FROM     stage_json_d_aplicado;


ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->0->'cells');

DELETE FROM  stage_d_aplicado2 WHERE id >= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE 'Total%');
DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%Neto%');
DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';

DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op'::regclass), 
     content2 text,
     columna text	  ); 


INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;

UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'fecha' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'comprobante' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'documento_int' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'importe_bruto' WHERE id = 4 ;
UPDATE stage_d_aplicado3 SET columna = 'importe_retenido' WHERE id = 5 ;
UPDATE stage_d_aplicado3 SET columna = 'importe_neto' WHERE id = 6 ;

ALTER SEQUENCE  bmem.rowname RESTART;


DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;


DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) = 6 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
    comprobante text COLLATE pg_catalog."default",
    documento_int text COLLATE pg_catalog."default",
    fecha text COLLATE pg_catalog."default",
    importe_bruto text COLLATE pg_catalog."default",
    importe_neto text COLLATE pg_catalog."default",
    importe_retenido text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	comprobante text, 
	documento_int text,
	fecha text, 
	importe_bruto text,	
	importe_neto text,
	importe_retenido text
	));


INSERT INTO bmem.op_detalle_de_aplicado (WITH t AS (select x::json->'documents'->0->'fields'->'CustomerName'->>'content' as cliente,
				x::json->'documents'->0->'fields'->'InvoiceId'->>'content' as doc_id, 
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') as fecha_emision,
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') - interval '2 months' as periodo
from stage_op)
SELECT id, REPLACE(comprobante, '_', '') AS comprobante, REPLACE(documento_int, '_', '') AS documento_int, 
						TO_DATE(REPLACE(fecha, '_', ''), 'DD.MM.YYYY') AS fecha, 
						CASE WHEN importe_bruto LIKE '%-%' THEN ((REPLACE(REPLACE(TRANSLATE(importe_bruto, ' ._', ''), ',', '.'), '-', ''))::numeric *-1) ELSE (REPLACE(TRANSLATE(importe_bruto, ' ._', ''), ',', '.'))::numeric END AS importe_bruto, 
						CASE WHEN REPLACE(REPLACE(importe_neto, '$', ''), '_', '') LIKE '%-%' THEN ((REPLACE(REPLACE(TRANSLATE(importe_neto, ' _.$', ''), ',', '.'), '-', ''))::numeric *-1) ELSE (REPLACE(REPLACE(TRANSLATE(importe_neto, ' _.$', ''), ',', '.'), '-', '')::numeric) END AS importe_neto,
						CASE WHEN importe_retenido LIKE '%-%' THEN ((REPLACE(REPLACE(TRANSLATE(importe_retenido, ' .$_', ''), ',', '.'), '-', ''))::numeric *-1) ELSE (REPLACE(TRANSLATE(importe_retenido, ' .$_', ''), ',', '.'))::numeric END AS importe_retenido,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;

--------------------------------------------------
ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_pago RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->1->'cells');


DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%porte%');DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';

DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op_pago'::regclass), 
     content2 text,
     columna text	  ); 


INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;
UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'concepto' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'banco' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'cuenta_banc' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'cheque' WHERE id = 4 ;
UPDATE stage_d_aplicado3 SET columna = 'importe' WHERE id = 5 ;

ALTER SEQUENCE  bmem.rowname RESTART;

DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;



DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;

insert into stage_d_aplicado4 
select id, content2, 'importe' FROM stage_d_aplicado4 WHERE columna = 'cheque'
AND not exists (
    select id from stage_d_aplicado4 where columna = 'importe'
);


UPDATE stage_d_aplicado4 SET content2 = null WHERE columna = 'cheque';

DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) = 5 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
    banco text COLLATE pg_catalog."default",
    cuenta_banc text COLLATE pg_catalog."default",
    concepto text COLLATE pg_catalog."default",
    cheque text COLLATE pg_catalog."default",
    importe text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	concepto text, 
	banco text,
	cuenta_banc text, 
	cheque text,	
	importe text
	));

UPDATE stage_d_aplicado5 SET cheque = null;


INSERT INTO bmem.op_detalle_de_pago (WITH t AS (select x::json->'documents'->0->'fields'->'CustomerName'->>'content' as cliente,
				x::json->'documents'->0->'fields'->'InvoiceId'->>'content' as doc_id, 
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') as fecha_emision,
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') - interval '2 months' as periodo
from stage_op)
SELECT id, 
		TRANSLATE(banco, '_0123456789', '') AS banco, 
		regexp_replace(banco, '\D','','g') as cuenta_banc,
		concepto,
		(REPLACE(TRANSLATE(cheque, '._$ ', ''), ',', '.'))::numeric  as cheque,
		(REPLACE(TRANSLATE(importe, '._$ ', ''), ',', '.'))::numeric  as importe,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;
						
--------------------------------------------------------------------------------------------------------------

ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones2 RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->2->'cells');


DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%porte%');DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';


DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op_retenciones'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;
UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'concepto' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'num_certif' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'cod_seg' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'importe' WHERE id = 4 ;

ALTER SEQUENCE  bmem.rowname RESTART;

DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;

insert into stage_d_aplicado4 
select id, content2, 'importe' FROM stage_d_aplicado4 WHERE columna = 'cod_seg'
AND not exists (
    select id from stage_d_aplicado4 where columna = 'importe'
);

UPDATE stage_d_aplicado4 SET content2 = null WHERE columna = 'cod_seg';UPDATE stage_d_aplicado4 SET content2 = ((RIGHT(content2, -5))) WHERE content2 like '____% % %$';

DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) <= 4 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
	cod_seg text,
    concepto text COLLATE pg_catalog."default",
    importe text COLLATE pg_catalog."default",
    num_certif text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	cod_seg text,
	concepto text, 
	importe text,
	num_certif text
	)) ;


DO $$
DECLARE sql TEXT;
BEGIN
    SELECT CASE 
            WHEN (select 1 from stage_d_aplicado5 WHERE importe ~ '^[^0-9]+$' limit 1) = 1
                THEN 'DROP TABLE stage_d_aplicado5;'
            ELSE 'INSERT INTO bmem.op_retenciones(id , concepto , importe , num_certif , doc_id , fecha_emision , cliente , periodo ) (WITH t AS (select x::json->''documents''->0->''fields''->''CustomerName''->>''content'' as cliente,
				x::json->''documents''->0->''fields''->''InvoiceId''->>''content'' as doc_id, 
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') as fecha_emision,
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') - interval ''2 months'' as periodo
from stage_op)
SELECT id, 
		TRANSLATE(concepto, ''_'', '''') AS concepto, 
		((REPLACE(TRANSLATE(importe, ''.-_$ '', ''''), '','', ''.''))::numeric *-1)  as importe,
		TRANSLATE(num_certif, ''_'', '''') AS num_certif,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;'
            END AS qry
    INTO sql
    FROM stage_d_aplicado5 limit 1;
    EXECUTE (sql);
END $$;
------------------------------------------------------------
DELETE from bmem.op_retenciones WHERE concepto NOT like '%MEM%'; DELETE FROM bmem.op_retenciones WHERE importe < -9999999999;
------------------------------------------------------------
ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones2 RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->2->'cells');


DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%porte%');DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';


DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op_retenciones2'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;
UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'concepto' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'num_certif' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'cod_seg' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'importe' WHERE id = 4 ;

ALTER SEQUENCE  bmem.rowname RESTART;

DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;

insert into stage_d_aplicado4 
select id, content2, 'importe' FROM stage_d_aplicado4 WHERE columna = 'cod_seg'
AND not exists (
    select id from stage_d_aplicado4 where columna = 'importe'
);

UPDATE stage_d_aplicado4 SET content2 = null WHERE columna = 'cod_seg';UPDATE stage_d_aplicado4 SET content2 = ((RIGHT(content2, -5))) WHERE content2 like '____% % %$';

DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) <= 4 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
	cod_seg text,
    concepto text COLLATE pg_catalog."default",
    importe text COLLATE pg_catalog."default",
    num_certif text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	cod_seg text,
	concepto text, 
	importe text,
	num_certif text
	)) ;


DO $$
DECLARE sql TEXT;
BEGIN
    SELECT CASE 
            WHEN (select 1 from stage_d_aplicado5 WHERE importe ~ '^[^0-9]+$' limit 1) = 1
                THEN 'DROP TABLE stage_d_aplicado5;'
            ELSE 'INSERT INTO bmem.op_retenciones(id , concepto , importe , num_certif , doc_id , fecha_emision , cliente , periodo ) (WITH t AS (select x::json->''documents''->0->''fields''->''CustomerName''->>''content'' as cliente,
				x::json->''documents''->0->''fields''->''InvoiceId''->>''content'' as doc_id, 
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') as fecha_emision,
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') - interval ''2 months'' as periodo
from stage_op)
SELECT id, 
		TRANSLATE(concepto, ''_'', '''') AS concepto, 
		((REPLACE(TRANSLATE(importe, ''.-_$ '', ''''), '','', ''.''))::numeric *-1)  as importe,
		TRANSLATE(num_certif, ''_'', '''') AS num_certif,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;'
            END AS qry
    INTO sql
    FROM stage_d_aplicado5 limit 1;
    EXECUTE (sql);
END $$;

--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------

ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

DROP TABLE IF EXISTS stage_op;
DROP TABLE IF EXISTS stage_json_d_aplicado;


CREATE TEMP TABLE stage_json_d_aplicado 
  ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     json text 
  ); 
 
CREATE TEMP TABLE stage_op (x jsonb);
COPY stage_json_d_aplicado(json) FROM 'C:\Users\Administrador\GoesGreen SRL\I4 - AUTO\import\8.json' csv quote e'\x01' delimiter e'\x02';

INSERT INTO stage_op(x)
SELECT   string_agg( json ,e'\n' ORDER BY id)::jsonb 
FROM     stage_json_d_aplicado;


ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->0->'cells');

DELETE FROM  stage_d_aplicado2 WHERE id >= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE 'Total%');
DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%Neto%');
DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';

DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op'::regclass), 
     content2 text,
     columna text	  ); 


INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;

UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'fecha' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'comprobante' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'documento_int' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'importe_bruto' WHERE id = 4 ;
UPDATE stage_d_aplicado3 SET columna = 'importe_retenido' WHERE id = 5 ;
UPDATE stage_d_aplicado3 SET columna = 'importe_neto' WHERE id = 6 ;

ALTER SEQUENCE  bmem.rowname RESTART;


DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;


DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) = 6 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
    comprobante text COLLATE pg_catalog."default",
    documento_int text COLLATE pg_catalog."default",
    fecha text COLLATE pg_catalog."default",
    importe_bruto text COLLATE pg_catalog."default",
    importe_neto text COLLATE pg_catalog."default",
    importe_retenido text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	comprobante text, 
	documento_int text,
	fecha text, 
	importe_bruto text,	
	importe_neto text,
	importe_retenido text
	));


INSERT INTO bmem.op_detalle_de_aplicado (WITH t AS (select x::json->'documents'->0->'fields'->'CustomerName'->>'content' as cliente,
				x::json->'documents'->0->'fields'->'InvoiceId'->>'content' as doc_id, 
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') as fecha_emision,
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') - interval '2 months' as periodo
from stage_op)
SELECT id, REPLACE(comprobante, '_', '') AS comprobante, REPLACE(documento_int, '_', '') AS documento_int, 
						TO_DATE(REPLACE(fecha, '_', ''), 'DD.MM.YYYY') AS fecha, 
						CASE WHEN importe_bruto LIKE '%-%' THEN ((REPLACE(REPLACE(TRANSLATE(importe_bruto, ' ._', ''), ',', '.'), '-', ''))::numeric *-1) ELSE (REPLACE(TRANSLATE(importe_bruto, ' ._', ''), ',', '.'))::numeric END AS importe_bruto, 
						CASE WHEN REPLACE(REPLACE(importe_neto, '$', ''), '_', '') LIKE '%-%' THEN ((REPLACE(REPLACE(TRANSLATE(importe_neto, ' _.$', ''), ',', '.'), '-', ''))::numeric *-1) ELSE (REPLACE(REPLACE(TRANSLATE(importe_neto, ' _.$', ''), ',', '.'), '-', '')::numeric) END AS importe_neto,
						CASE WHEN importe_retenido LIKE '%-%' THEN ((REPLACE(REPLACE(TRANSLATE(importe_retenido, ' .$_', ''), ',', '.'), '-', ''))::numeric *-1) ELSE (REPLACE(TRANSLATE(importe_retenido, ' .$_', ''), ',', '.'))::numeric END AS importe_retenido,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;

--------------------------------------------------
ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_pago RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->1->'cells');


DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%porte%');DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';

DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op_pago'::regclass), 
     content2 text,
     columna text	  ); 


INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;
UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'concepto' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'banco' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'cuenta_banc' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'cheque' WHERE id = 4 ;
UPDATE stage_d_aplicado3 SET columna = 'importe' WHERE id = 5 ;

ALTER SEQUENCE  bmem.rowname RESTART;

DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;



DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;

insert into stage_d_aplicado4 
select id, content2, 'importe' FROM stage_d_aplicado4 WHERE columna = 'cheque'
AND not exists (
    select id from stage_d_aplicado4 where columna = 'importe'
);


UPDATE stage_d_aplicado4 SET content2 = null WHERE columna = 'cheque';

DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) = 5 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
    banco text COLLATE pg_catalog."default",
    cuenta_banc text COLLATE pg_catalog."default",
    concepto text COLLATE pg_catalog."default",
    cheque text COLLATE pg_catalog."default",
    importe text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	concepto text, 
	banco text,
	cuenta_banc text, 
	cheque text,	
	importe text
	));

UPDATE stage_d_aplicado5 SET cheque = null;


INSERT INTO bmem.op_detalle_de_pago (WITH t AS (select x::json->'documents'->0->'fields'->'CustomerName'->>'content' as cliente,
				x::json->'documents'->0->'fields'->'InvoiceId'->>'content' as doc_id, 
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') as fecha_emision,
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') - interval '2 months' as periodo
from stage_op)
SELECT id, 
		TRANSLATE(banco, '_0123456789', '') AS banco, 
		regexp_replace(banco, '\D','','g') as cuenta_banc,
		concepto,
		(REPLACE(TRANSLATE(cheque, '._$ ', ''), ',', '.'))::numeric  as cheque,
		(REPLACE(TRANSLATE(importe, '._$ ', ''), ',', '.'))::numeric  as importe,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;
						
--------------------------------------------------------------------------------------------------------------

ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones2 RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->2->'cells');


DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%porte%');DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';


DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op_retenciones'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;
UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'concepto' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'num_certif' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'cod_seg' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'importe' WHERE id = 4 ;

ALTER SEQUENCE  bmem.rowname RESTART;

DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;

insert into stage_d_aplicado4 
select id, content2, 'importe' FROM stage_d_aplicado4 WHERE columna = 'cod_seg'
AND not exists (
    select id from stage_d_aplicado4 where columna = 'importe'
);

UPDATE stage_d_aplicado4 SET content2 = null WHERE columna = 'cod_seg';UPDATE stage_d_aplicado4 SET content2 = ((RIGHT(content2, -5))) WHERE content2 like '____% % %$';

DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) <= 4 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
	cod_seg text,
    concepto text COLLATE pg_catalog."default",
    importe text COLLATE pg_catalog."default",
    num_certif text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	cod_seg text,
	concepto text, 
	importe text,
	num_certif text
	)) ;


DO $$
DECLARE sql TEXT;
BEGIN
    SELECT CASE 
            WHEN (select 1 from stage_d_aplicado5 WHERE importe ~ '^[^0-9]+$' limit 1) = 1
                THEN 'DROP TABLE stage_d_aplicado5;'
            ELSE 'INSERT INTO bmem.op_retenciones(id , concepto , importe , num_certif , doc_id , fecha_emision , cliente , periodo ) (WITH t AS (select x::json->''documents''->0->''fields''->''CustomerName''->>''content'' as cliente,
				x::json->''documents''->0->''fields''->''InvoiceId''->>''content'' as doc_id, 
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') as fecha_emision,
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') - interval ''2 months'' as periodo
from stage_op)
SELECT id, 
		TRANSLATE(concepto, ''_'', '''') AS concepto, 
		((REPLACE(TRANSLATE(importe, ''.-_$ '', ''''), '','', ''.''))::numeric *-1)  as importe,
		TRANSLATE(num_certif, ''_'', '''') AS num_certif,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;'
            END AS qry
    INTO sql
    FROM stage_d_aplicado5 limit 1;
    EXECUTE (sql);
END $$;
------------------------------------------------------------
DELETE from bmem.op_retenciones WHERE concepto NOT like '%MEM%'; DELETE FROM bmem.op_retenciones WHERE importe < -9999999999;
------------------------------------------------------------
ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones2 RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->2->'cells');


DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%porte%');DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';


DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op_retenciones2'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;
UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'concepto' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'num_certif' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'cod_seg' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'importe' WHERE id = 4 ;

ALTER SEQUENCE  bmem.rowname RESTART;

DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;

insert into stage_d_aplicado4 
select id, content2, 'importe' FROM stage_d_aplicado4 WHERE columna = 'cod_seg'
AND not exists (
    select id from stage_d_aplicado4 where columna = 'importe'
);

UPDATE stage_d_aplicado4 SET content2 = null WHERE columna = 'cod_seg';UPDATE stage_d_aplicado4 SET content2 = ((RIGHT(content2, -5))) WHERE content2 like '____% % %$';

DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) <= 4 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
	cod_seg text,
    concepto text COLLATE pg_catalog."default",
    importe text COLLATE pg_catalog."default",
    num_certif text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	cod_seg text,
	concepto text, 
	importe text,
	num_certif text
	)) ;


DO $$
DECLARE sql TEXT;
BEGIN
    SELECT CASE 
            WHEN (select 1 from stage_d_aplicado5 WHERE importe ~ '^[^0-9]+$' limit 1) = 1
                THEN 'DROP TABLE stage_d_aplicado5;'
            ELSE 'INSERT INTO bmem.op_retenciones(id , concepto , importe , num_certif , doc_id , fecha_emision , cliente , periodo ) (WITH t AS (select x::json->''documents''->0->''fields''->''CustomerName''->>''content'' as cliente,
				x::json->''documents''->0->''fields''->''InvoiceId''->>''content'' as doc_id, 
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') as fecha_emision,
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') - interval ''2 months'' as periodo
from stage_op)
SELECT id, 
		TRANSLATE(concepto, ''_'', '''') AS concepto, 
		((REPLACE(TRANSLATE(importe, ''.-_$ '', ''''), '','', ''.''))::numeric *-1)  as importe,
		TRANSLATE(num_certif, ''_'', '''') AS num_certif,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;'
            END AS qry
    INTO sql
    FROM stage_d_aplicado5 limit 1;
    EXECUTE (sql);
END $$;

--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------

ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

DROP TABLE IF EXISTS stage_op;
DROP TABLE IF EXISTS stage_json_d_aplicado;


CREATE TEMP TABLE stage_json_d_aplicado 
  ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     json text 
  ); 
 
CREATE TEMP TABLE stage_op (x jsonb);
COPY stage_json_d_aplicado(json) FROM 'C:\Users\Administrador\GoesGreen SRL\I4 - AUTO\import\9.json' csv quote e'\x01' delimiter e'\x02';

INSERT INTO stage_op(x)
SELECT   string_agg( json ,e'\n' ORDER BY id)::jsonb 
FROM     stage_json_d_aplicado;


ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->0->'cells');

DELETE FROM  stage_d_aplicado2 WHERE id >= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE 'Total%');
DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%Neto%');
DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';

DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op'::regclass), 
     content2 text,
     columna text	  ); 


INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;

UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'fecha' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'comprobante' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'documento_int' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'importe_bruto' WHERE id = 4 ;
UPDATE stage_d_aplicado3 SET columna = 'importe_retenido' WHERE id = 5 ;
UPDATE stage_d_aplicado3 SET columna = 'importe_neto' WHERE id = 6 ;

ALTER SEQUENCE  bmem.rowname RESTART;


DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;


DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) = 6 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
    comprobante text COLLATE pg_catalog."default",
    documento_int text COLLATE pg_catalog."default",
    fecha text COLLATE pg_catalog."default",
    importe_bruto text COLLATE pg_catalog."default",
    importe_neto text COLLATE pg_catalog."default",
    importe_retenido text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	comprobante text, 
	documento_int text,
	fecha text, 
	importe_bruto text,	
	importe_neto text,
	importe_retenido text
	));


INSERT INTO bmem.op_detalle_de_aplicado (WITH t AS (select x::json->'documents'->0->'fields'->'CustomerName'->>'content' as cliente,
				x::json->'documents'->0->'fields'->'InvoiceId'->>'content' as doc_id, 
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') as fecha_emision,
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') - interval '2 months' as periodo
from stage_op)
SELECT id, REPLACE(comprobante, '_', '') AS comprobante, REPLACE(documento_int, '_', '') AS documento_int, 
						TO_DATE(REPLACE(fecha, '_', ''), 'DD.MM.YYYY') AS fecha, 
						CASE WHEN importe_bruto LIKE '%-%' THEN ((REPLACE(REPLACE(TRANSLATE(importe_bruto, ' ._', ''), ',', '.'), '-', ''))::numeric *-1) ELSE (REPLACE(TRANSLATE(importe_bruto, ' ._', ''), ',', '.'))::numeric END AS importe_bruto, 
						CASE WHEN REPLACE(REPLACE(importe_neto, '$', ''), '_', '') LIKE '%-%' THEN ((REPLACE(REPLACE(TRANSLATE(importe_neto, ' _.$', ''), ',', '.'), '-', ''))::numeric *-1) ELSE (REPLACE(REPLACE(TRANSLATE(importe_neto, ' _.$', ''), ',', '.'), '-', '')::numeric) END AS importe_neto,
						CASE WHEN importe_retenido LIKE '%-%' THEN ((REPLACE(REPLACE(TRANSLATE(importe_retenido, ' .$_', ''), ',', '.'), '-', ''))::numeric *-1) ELSE (REPLACE(TRANSLATE(importe_retenido, ' .$_', ''), ',', '.'))::numeric END AS importe_retenido,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;

--------------------------------------------------
ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_pago RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->1->'cells');


DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%porte%');DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';

DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op_pago'::regclass), 
     content2 text,
     columna text	  ); 


INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;
UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'concepto' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'banco' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'cuenta_banc' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'cheque' WHERE id = 4 ;
UPDATE stage_d_aplicado3 SET columna = 'importe' WHERE id = 5 ;

ALTER SEQUENCE  bmem.rowname RESTART;

DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;



DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;

insert into stage_d_aplicado4 
select id, content2, 'importe' FROM stage_d_aplicado4 WHERE columna = 'cheque'
AND not exists (
    select id from stage_d_aplicado4 where columna = 'importe'
);


UPDATE stage_d_aplicado4 SET content2 = null WHERE columna = 'cheque';

DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) = 5 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
    banco text COLLATE pg_catalog."default",
    cuenta_banc text COLLATE pg_catalog."default",
    concepto text COLLATE pg_catalog."default",
    cheque text COLLATE pg_catalog."default",
    importe text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	concepto text, 
	banco text,
	cuenta_banc text, 
	cheque text,	
	importe text
	));

UPDATE stage_d_aplicado5 SET cheque = null;


INSERT INTO bmem.op_detalle_de_pago (WITH t AS (select x::json->'documents'->0->'fields'->'CustomerName'->>'content' as cliente,
				x::json->'documents'->0->'fields'->'InvoiceId'->>'content' as doc_id, 
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') as fecha_emision,
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') - interval '2 months' as periodo
from stage_op)
SELECT id, 
		TRANSLATE(banco, '_0123456789', '') AS banco, 
		regexp_replace(banco, '\D','','g') as cuenta_banc,
		concepto,
		(REPLACE(TRANSLATE(cheque, '._$ ', ''), ',', '.'))::numeric  as cheque,
		(REPLACE(TRANSLATE(importe, '._$ ', ''), ',', '.'))::numeric  as importe,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;
						
--------------------------------------------------------------------------------------------------------------

ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones2 RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->2->'cells');


DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%porte%');DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';


DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op_retenciones'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;
UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'concepto' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'num_certif' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'cod_seg' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'importe' WHERE id = 4 ;

ALTER SEQUENCE  bmem.rowname RESTART;

DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;

insert into stage_d_aplicado4 
select id, content2, 'importe' FROM stage_d_aplicado4 WHERE columna = 'cod_seg'
AND not exists (
    select id from stage_d_aplicado4 where columna = 'importe'
);

UPDATE stage_d_aplicado4 SET content2 = null WHERE columna = 'cod_seg';UPDATE stage_d_aplicado4 SET content2 = ((RIGHT(content2, -5))) WHERE content2 like '____% % %$';

DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) <= 4 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
	cod_seg text,
    concepto text COLLATE pg_catalog."default",
    importe text COLLATE pg_catalog."default",
    num_certif text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	cod_seg text,
	concepto text, 
	importe text,
	num_certif text
	)) ;


DO $$
DECLARE sql TEXT;
BEGIN
    SELECT CASE 
            WHEN (select 1 from stage_d_aplicado5 WHERE importe ~ '^[^0-9]+$' limit 1) = 1
                THEN 'DROP TABLE stage_d_aplicado5;'
            ELSE 'INSERT INTO bmem.op_retenciones(id , concepto , importe , num_certif , doc_id , fecha_emision , cliente , periodo ) (WITH t AS (select x::json->''documents''->0->''fields''->''CustomerName''->>''content'' as cliente,
				x::json->''documents''->0->''fields''->''InvoiceId''->>''content'' as doc_id, 
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') as fecha_emision,
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') - interval ''2 months'' as periodo
from stage_op)
SELECT id, 
		TRANSLATE(concepto, ''_'', '''') AS concepto, 
		((REPLACE(TRANSLATE(importe, ''.-_$ '', ''''), '','', ''.''))::numeric *-1)  as importe,
		TRANSLATE(num_certif, ''_'', '''') AS num_certif,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;'
            END AS qry
    INTO sql
    FROM stage_d_aplicado5 limit 1;
    EXECUTE (sql);
END $$;
------------------------------------------------------------
DELETE from bmem.op_retenciones WHERE concepto NOT like '%MEM%'; DELETE FROM bmem.op_retenciones WHERE importe < -9999999999;
------------------------------------------------------------
ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones2 RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->2->'cells');


DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%porte%');DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';


DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op_retenciones2'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;
UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'concepto' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'num_certif' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'cod_seg' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'importe' WHERE id = 4 ;

ALTER SEQUENCE  bmem.rowname RESTART;

DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;

insert into stage_d_aplicado4 
select id, content2, 'importe' FROM stage_d_aplicado4 WHERE columna = 'cod_seg'
AND not exists (
    select id from stage_d_aplicado4 where columna = 'importe'
);

UPDATE stage_d_aplicado4 SET content2 = null WHERE columna = 'cod_seg';UPDATE stage_d_aplicado4 SET content2 = ((RIGHT(content2, -5))) WHERE content2 like '____% % %$';

DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) <= 4 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
	cod_seg text,
    concepto text COLLATE pg_catalog."default",
    importe text COLLATE pg_catalog."default",
    num_certif text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	cod_seg text,
	concepto text, 
	importe text,
	num_certif text
	)) ;


DO $$
DECLARE sql TEXT;
BEGIN
    SELECT CASE 
            WHEN (select 1 from stage_d_aplicado5 WHERE importe ~ '^[^0-9]+$' limit 1) = 1
                THEN 'DROP TABLE stage_d_aplicado5;'
            ELSE 'INSERT INTO bmem.op_retenciones(id , concepto , importe , num_certif , doc_id , fecha_emision , cliente , periodo ) (WITH t AS (select x::json->''documents''->0->''fields''->''CustomerName''->>''content'' as cliente,
				x::json->''documents''->0->''fields''->''InvoiceId''->>''content'' as doc_id, 
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') as fecha_emision,
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') - interval ''2 months'' as periodo
from stage_op)
SELECT id, 
		TRANSLATE(concepto, ''_'', '''') AS concepto, 
		((REPLACE(TRANSLATE(importe, ''.-_$ '', ''''), '','', ''.''))::numeric *-1)  as importe,
		TRANSLATE(num_certif, ''_'', '''') AS num_certif,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;'
            END AS qry
    INTO sql
    FROM stage_d_aplicado5 limit 1;
    EXECUTE (sql);
END $$;

--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------

ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

DROP TABLE IF EXISTS stage_op;
DROP TABLE IF EXISTS stage_json_d_aplicado;


CREATE TEMP TABLE stage_json_d_aplicado 
  ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     json text 
  ); 
 
CREATE TEMP TABLE stage_op (x jsonb);
COPY stage_json_d_aplicado(json) FROM 'C:\Users\Administrador\GoesGreen SRL\I4 - AUTO\import\10.json' csv quote e'\x01' delimiter e'\x02';

INSERT INTO stage_op(x)
SELECT   string_agg( json ,e'\n' ORDER BY id)::jsonb 
FROM     stage_json_d_aplicado;


ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->0->'cells');

DELETE FROM  stage_d_aplicado2 WHERE id >= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE 'Total%');
DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%Neto%');
DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';

DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op'::regclass), 
     content2 text,
     columna text	  ); 


INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;

UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'fecha' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'comprobante' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'documento_int' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'importe_bruto' WHERE id = 4 ;
UPDATE stage_d_aplicado3 SET columna = 'importe_retenido' WHERE id = 5 ;
UPDATE stage_d_aplicado3 SET columna = 'importe_neto' WHERE id = 6 ;

ALTER SEQUENCE  bmem.rowname RESTART;


DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;


DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) = 6 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
    comprobante text COLLATE pg_catalog."default",
    documento_int text COLLATE pg_catalog."default",
    fecha text COLLATE pg_catalog."default",
    importe_bruto text COLLATE pg_catalog."default",
    importe_neto text COLLATE pg_catalog."default",
    importe_retenido text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	comprobante text, 
	documento_int text,
	fecha text, 
	importe_bruto text,	
	importe_neto text,
	importe_retenido text
	));


INSERT INTO bmem.op_detalle_de_aplicado (WITH t AS (select x::json->'documents'->0->'fields'->'CustomerName'->>'content' as cliente,
				x::json->'documents'->0->'fields'->'InvoiceId'->>'content' as doc_id, 
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') as fecha_emision,
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') - interval '2 months' as periodo
from stage_op)
SELECT id, REPLACE(comprobante, '_', '') AS comprobante, REPLACE(documento_int, '_', '') AS documento_int, 
						TO_DATE(REPLACE(fecha, '_', ''), 'DD.MM.YYYY') AS fecha, 
						CASE WHEN importe_bruto LIKE '%-%' THEN ((REPLACE(REPLACE(TRANSLATE(importe_bruto, ' ._', ''), ',', '.'), '-', ''))::numeric *-1) ELSE (REPLACE(TRANSLATE(importe_bruto, ' ._', ''), ',', '.'))::numeric END AS importe_bruto, 
						CASE WHEN REPLACE(REPLACE(importe_neto, '$', ''), '_', '') LIKE '%-%' THEN ((REPLACE(REPLACE(TRANSLATE(importe_neto, ' _.$', ''), ',', '.'), '-', ''))::numeric *-1) ELSE (REPLACE(REPLACE(TRANSLATE(importe_neto, ' _.$', ''), ',', '.'), '-', '')::numeric) END AS importe_neto,
						CASE WHEN importe_retenido LIKE '%-%' THEN ((REPLACE(REPLACE(TRANSLATE(importe_retenido, ' .$_', ''), ',', '.'), '-', ''))::numeric *-1) ELSE (REPLACE(TRANSLATE(importe_retenido, ' .$_', ''), ',', '.'))::numeric END AS importe_retenido,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;

--------------------------------------------------
ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_pago RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->1->'cells');


DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%porte%');DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';

DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op_pago'::regclass), 
     content2 text,
     columna text	  ); 


INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;
UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'concepto' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'banco' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'cuenta_banc' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'cheque' WHERE id = 4 ;
UPDATE stage_d_aplicado3 SET columna = 'importe' WHERE id = 5 ;

ALTER SEQUENCE  bmem.rowname RESTART;

DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;



DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;

insert into stage_d_aplicado4 
select id, content2, 'importe' FROM stage_d_aplicado4 WHERE columna = 'cheque'
AND not exists (
    select id from stage_d_aplicado4 where columna = 'importe'
);


UPDATE stage_d_aplicado4 SET content2 = null WHERE columna = 'cheque';

DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) = 5 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
    banco text COLLATE pg_catalog."default",
    cuenta_banc text COLLATE pg_catalog."default",
    concepto text COLLATE pg_catalog."default",
    cheque text COLLATE pg_catalog."default",
    importe text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	concepto text, 
	banco text,
	cuenta_banc text, 
	cheque text,	
	importe text
	));

UPDATE stage_d_aplicado5 SET cheque = null;


INSERT INTO bmem.op_detalle_de_pago (WITH t AS (select x::json->'documents'->0->'fields'->'CustomerName'->>'content' as cliente,
				x::json->'documents'->0->'fields'->'InvoiceId'->>'content' as doc_id, 
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') as fecha_emision,
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') - interval '2 months' as periodo
from stage_op)
SELECT id, 
		TRANSLATE(banco, '_0123456789', '') AS banco, 
		regexp_replace(banco, '\D','','g') as cuenta_banc,
		concepto,
		(REPLACE(TRANSLATE(cheque, '._$ ', ''), ',', '.'))::numeric  as cheque,
		(REPLACE(TRANSLATE(importe, '._$ ', ''), ',', '.'))::numeric  as importe,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;
						
--------------------------------------------------------------------------------------------------------------

ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones2 RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->2->'cells');


DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%porte%');DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';


DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op_retenciones'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;
UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'concepto' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'num_certif' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'cod_seg' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'importe' WHERE id = 4 ;

ALTER SEQUENCE  bmem.rowname RESTART;

DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;

insert into stage_d_aplicado4 
select id, content2, 'importe' FROM stage_d_aplicado4 WHERE columna = 'cod_seg'
AND not exists (
    select id from stage_d_aplicado4 where columna = 'importe'
);

UPDATE stage_d_aplicado4 SET content2 = null WHERE columna = 'cod_seg';UPDATE stage_d_aplicado4 SET content2 = ((RIGHT(content2, -5))) WHERE content2 like '____% % %$';

DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) <= 4 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
	cod_seg text,
    concepto text COLLATE pg_catalog."default",
    importe text COLLATE pg_catalog."default",
    num_certif text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	cod_seg text,
	concepto text, 
	importe text,
	num_certif text
	)) ;


DO $$
DECLARE sql TEXT;
BEGIN
    SELECT CASE 
            WHEN (select 1 from stage_d_aplicado5 WHERE importe ~ '^[^0-9]+$' limit 1) = 1
                THEN 'DROP TABLE stage_d_aplicado5;'
            ELSE 'INSERT INTO bmem.op_retenciones(id , concepto , importe , num_certif , doc_id , fecha_emision , cliente , periodo ) (WITH t AS (select x::json->''documents''->0->''fields''->''CustomerName''->>''content'' as cliente,
				x::json->''documents''->0->''fields''->''InvoiceId''->>''content'' as doc_id, 
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') as fecha_emision,
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') - interval ''2 months'' as periodo
from stage_op)
SELECT id, 
		TRANSLATE(concepto, ''_'', '''') AS concepto, 
		((REPLACE(TRANSLATE(importe, ''.-_$ '', ''''), '','', ''.''))::numeric *-1)  as importe,
		TRANSLATE(num_certif, ''_'', '''') AS num_certif,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;'
            END AS qry
    INTO sql
    FROM stage_d_aplicado5 limit 1;
    EXECUTE (sql);
END $$;
------------------------------------------------------------
DELETE from bmem.op_retenciones WHERE concepto NOT like '%MEM%'; DELETE FROM bmem.op_retenciones WHERE importe < -9999999999;
------------------------------------------------------------
ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones2 RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->2->'cells');


DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%porte%');DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';


DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op_retenciones2'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;
UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'concepto' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'num_certif' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'cod_seg' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'importe' WHERE id = 4 ;

ALTER SEQUENCE  bmem.rowname RESTART;

DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;

insert into stage_d_aplicado4 
select id, content2, 'importe' FROM stage_d_aplicado4 WHERE columna = 'cod_seg'
AND not exists (
    select id from stage_d_aplicado4 where columna = 'importe'
);

UPDATE stage_d_aplicado4 SET content2 = null WHERE columna = 'cod_seg';UPDATE stage_d_aplicado4 SET content2 = ((RIGHT(content2, -5))) WHERE content2 like '____% % %$';

DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) <= 4 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
	cod_seg text,
    concepto text COLLATE pg_catalog."default",
    importe text COLLATE pg_catalog."default",
    num_certif text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	cod_seg text,
	concepto text, 
	importe text,
	num_certif text
	)) ;


DO $$
DECLARE sql TEXT;
BEGIN
    SELECT CASE 
            WHEN (select 1 from stage_d_aplicado5 WHERE importe ~ '^[^0-9]+$' limit 1) = 1
                THEN 'DROP TABLE stage_d_aplicado5;'
            ELSE 'INSERT INTO bmem.op_retenciones(id , concepto , importe , num_certif , doc_id , fecha_emision , cliente , periodo ) (WITH t AS (select x::json->''documents''->0->''fields''->''CustomerName''->>''content'' as cliente,
				x::json->''documents''->0->''fields''->''InvoiceId''->>''content'' as doc_id, 
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') as fecha_emision,
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') - interval ''2 months'' as periodo
from stage_op)
SELECT id, 
		TRANSLATE(concepto, ''_'', '''') AS concepto, 
		((REPLACE(TRANSLATE(importe, ''.-_$ '', ''''), '','', ''.''))::numeric *-1)  as importe,
		TRANSLATE(num_certif, ''_'', '''') AS num_certif,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;'
            END AS qry
    INTO sql
    FROM stage_d_aplicado5 limit 1;
    EXECUTE (sql);
END $$;

--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------

ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

DROP TABLE IF EXISTS stage_op;
DROP TABLE IF EXISTS stage_json_d_aplicado;


CREATE TEMP TABLE stage_json_d_aplicado 
  ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     json text 
  ); 
 
CREATE TEMP TABLE stage_op (x jsonb);
COPY stage_json_d_aplicado(json) FROM 'C:\Users\Administrador\GoesGreen SRL\I4 - AUTO\import\11.json' csv quote e'\x01' delimiter e'\x02';

INSERT INTO stage_op(x)
SELECT   string_agg( json ,e'\n' ORDER BY id)::jsonb 
FROM     stage_json_d_aplicado;


ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->0->'cells');

DELETE FROM  stage_d_aplicado2 WHERE id >= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE 'Total%');
DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%Neto%');
DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';

DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op'::regclass), 
     content2 text,
     columna text	  ); 


INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;

UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'fecha' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'comprobante' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'documento_int' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'importe_bruto' WHERE id = 4 ;
UPDATE stage_d_aplicado3 SET columna = 'importe_retenido' WHERE id = 5 ;
UPDATE stage_d_aplicado3 SET columna = 'importe_neto' WHERE id = 6 ;

ALTER SEQUENCE  bmem.rowname RESTART;


DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;


DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) = 6 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
    comprobante text COLLATE pg_catalog."default",
    documento_int text COLLATE pg_catalog."default",
    fecha text COLLATE pg_catalog."default",
    importe_bruto text COLLATE pg_catalog."default",
    importe_neto text COLLATE pg_catalog."default",
    importe_retenido text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	comprobante text, 
	documento_int text,
	fecha text, 
	importe_bruto text,	
	importe_neto text,
	importe_retenido text
	));


INSERT INTO bmem.op_detalle_de_aplicado (WITH t AS (select x::json->'documents'->0->'fields'->'CustomerName'->>'content' as cliente,
				x::json->'documents'->0->'fields'->'InvoiceId'->>'content' as doc_id, 
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') as fecha_emision,
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') - interval '2 months' as periodo
from stage_op)
SELECT id, REPLACE(comprobante, '_', '') AS comprobante, REPLACE(documento_int, '_', '') AS documento_int, 
						TO_DATE(REPLACE(fecha, '_', ''), 'DD.MM.YYYY') AS fecha, 
						CASE WHEN importe_bruto LIKE '%-%' THEN ((REPLACE(REPLACE(TRANSLATE(importe_bruto, ' ._', ''), ',', '.'), '-', ''))::numeric *-1) ELSE (REPLACE(TRANSLATE(importe_bruto, ' ._', ''), ',', '.'))::numeric END AS importe_bruto, 
						CASE WHEN REPLACE(REPLACE(importe_neto, '$', ''), '_', '') LIKE '%-%' THEN ((REPLACE(REPLACE(TRANSLATE(importe_neto, ' _.$', ''), ',', '.'), '-', ''))::numeric *-1) ELSE (REPLACE(REPLACE(TRANSLATE(importe_neto, ' _.$', ''), ',', '.'), '-', '')::numeric) END AS importe_neto,
						CASE WHEN importe_retenido LIKE '%-%' THEN ((REPLACE(REPLACE(TRANSLATE(importe_retenido, ' .$_', ''), ',', '.'), '-', ''))::numeric *-1) ELSE (REPLACE(TRANSLATE(importe_retenido, ' .$_', ''), ',', '.'))::numeric END AS importe_retenido,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;

--------------------------------------------------
ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_pago RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->1->'cells');


DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%porte%');DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';

DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op_pago'::regclass), 
     content2 text,
     columna text	  ); 


INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;
UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'concepto' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'banco' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'cuenta_banc' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'cheque' WHERE id = 4 ;
UPDATE stage_d_aplicado3 SET columna = 'importe' WHERE id = 5 ;

ALTER SEQUENCE  bmem.rowname RESTART;

DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;



DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;

insert into stage_d_aplicado4 
select id, content2, 'importe' FROM stage_d_aplicado4 WHERE columna = 'cheque'
AND not exists (
    select id from stage_d_aplicado4 where columna = 'importe'
);


UPDATE stage_d_aplicado4 SET content2 = null WHERE columna = 'cheque';

DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) = 5 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
    banco text COLLATE pg_catalog."default",
    cuenta_banc text COLLATE pg_catalog."default",
    concepto text COLLATE pg_catalog."default",
    cheque text COLLATE pg_catalog."default",
    importe text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	concepto text, 
	banco text,
	cuenta_banc text, 
	cheque text,	
	importe text
	));

UPDATE stage_d_aplicado5 SET cheque = null;


INSERT INTO bmem.op_detalle_de_pago (WITH t AS (select x::json->'documents'->0->'fields'->'CustomerName'->>'content' as cliente,
				x::json->'documents'->0->'fields'->'InvoiceId'->>'content' as doc_id, 
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') as fecha_emision,
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') - interval '2 months' as periodo
from stage_op)
SELECT id, 
		TRANSLATE(banco, '_0123456789', '') AS banco, 
		regexp_replace(banco, '\D','','g') as cuenta_banc,
		concepto,
		(REPLACE(TRANSLATE(cheque, '._$ ', ''), ',', '.'))::numeric  as cheque,
		(REPLACE(TRANSLATE(importe, '._$ ', ''), ',', '.'))::numeric  as importe,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;
						
--------------------------------------------------------------------------------------------------------------

ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones2 RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->2->'cells');


DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%porte%');DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';


DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op_retenciones'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;
UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'concepto' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'num_certif' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'cod_seg' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'importe' WHERE id = 4 ;

ALTER SEQUENCE  bmem.rowname RESTART;

DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;

insert into stage_d_aplicado4 
select id, content2, 'importe' FROM stage_d_aplicado4 WHERE columna = 'cod_seg'
AND not exists (
    select id from stage_d_aplicado4 where columna = 'importe'
);

UPDATE stage_d_aplicado4 SET content2 = null WHERE columna = 'cod_seg';UPDATE stage_d_aplicado4 SET content2 = ((RIGHT(content2, -5))) WHERE content2 like '____% % %$';

DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) <= 4 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
	cod_seg text,
    concepto text COLLATE pg_catalog."default",
    importe text COLLATE pg_catalog."default",
    num_certif text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	cod_seg text,
	concepto text, 
	importe text,
	num_certif text
	)) ;


DO $$
DECLARE sql TEXT;
BEGIN
    SELECT CASE 
            WHEN (select 1 from stage_d_aplicado5 WHERE importe ~ '^[^0-9]+$' limit 1) = 1
                THEN 'DROP TABLE stage_d_aplicado5;'
            ELSE 'INSERT INTO bmem.op_retenciones(id , concepto , importe , num_certif , doc_id , fecha_emision , cliente , periodo ) (WITH t AS (select x::json->''documents''->0->''fields''->''CustomerName''->>''content'' as cliente,
				x::json->''documents''->0->''fields''->''InvoiceId''->>''content'' as doc_id, 
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') as fecha_emision,
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') - interval ''2 months'' as periodo
from stage_op)
SELECT id, 
		TRANSLATE(concepto, ''_'', '''') AS concepto, 
		((REPLACE(TRANSLATE(importe, ''.-_$ '', ''''), '','', ''.''))::numeric *-1)  as importe,
		TRANSLATE(num_certif, ''_'', '''') AS num_certif,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;'
            END AS qry
    INTO sql
    FROM stage_d_aplicado5 limit 1;
    EXECUTE (sql);
END $$;
------------------------------------------------------------
DELETE from bmem.op_retenciones WHERE concepto NOT like '%MEM%'; DELETE FROM bmem.op_retenciones WHERE importe < -9999999999;
------------------------------------------------------------
ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones2 RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->2->'cells');


DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%porte%');DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';


DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op_retenciones2'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;
UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'concepto' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'num_certif' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'cod_seg' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'importe' WHERE id = 4 ;

ALTER SEQUENCE  bmem.rowname RESTART;

DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;

insert into stage_d_aplicado4 
select id, content2, 'importe' FROM stage_d_aplicado4 WHERE columna = 'cod_seg'
AND not exists (
    select id from stage_d_aplicado4 where columna = 'importe'
);

UPDATE stage_d_aplicado4 SET content2 = null WHERE columna = 'cod_seg';UPDATE stage_d_aplicado4 SET content2 = ((RIGHT(content2, -5))) WHERE content2 like '____% % %$';

DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) <= 4 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
	cod_seg text,
    concepto text COLLATE pg_catalog."default",
    importe text COLLATE pg_catalog."default",
    num_certif text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	cod_seg text,
	concepto text, 
	importe text,
	num_certif text
	)) ;


DO $$
DECLARE sql TEXT;
BEGIN
    SELECT CASE 
            WHEN (select 1 from stage_d_aplicado5 WHERE importe ~ '^[^0-9]+$' limit 1) = 1
                THEN 'DROP TABLE stage_d_aplicado5;'
            ELSE 'INSERT INTO bmem.op_retenciones(id , concepto , importe , num_certif , doc_id , fecha_emision , cliente , periodo ) (WITH t AS (select x::json->''documents''->0->''fields''->''CustomerName''->>''content'' as cliente,
				x::json->''documents''->0->''fields''->''InvoiceId''->>''content'' as doc_id, 
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') as fecha_emision,
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') - interval ''2 months'' as periodo
from stage_op)
SELECT id, 
		TRANSLATE(concepto, ''_'', '''') AS concepto, 
		((REPLACE(TRANSLATE(importe, ''.-_$ '', ''''), '','', ''.''))::numeric *-1)  as importe,
		TRANSLATE(num_certif, ''_'', '''') AS num_certif,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;'
            END AS qry
    INTO sql
    FROM stage_d_aplicado5 limit 1;
    EXECUTE (sql);
END $$;

--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------

ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

DROP TABLE IF EXISTS stage_op;
DROP TABLE IF EXISTS stage_json_d_aplicado;


CREATE TEMP TABLE stage_json_d_aplicado 
  ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     json text 
  ); 
 
CREATE TEMP TABLE stage_op (x jsonb);
COPY stage_json_d_aplicado(json) FROM 'C:\Users\Administrador\GoesGreen SRL\I4 - AUTO\import\12.json' csv quote e'\x01' delimiter e'\x02';

INSERT INTO stage_op(x)
SELECT   string_agg( json ,e'\n' ORDER BY id)::jsonb 
FROM     stage_json_d_aplicado;


ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->0->'cells');

DELETE FROM  stage_d_aplicado2 WHERE id >= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE 'Total%');
DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%Neto%');
DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';

DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op'::regclass), 
     content2 text,
     columna text	  ); 


INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;

UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'fecha' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'comprobante' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'documento_int' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'importe_bruto' WHERE id = 4 ;
UPDATE stage_d_aplicado3 SET columna = 'importe_retenido' WHERE id = 5 ;
UPDATE stage_d_aplicado3 SET columna = 'importe_neto' WHERE id = 6 ;

ALTER SEQUENCE  bmem.rowname RESTART;


DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;


DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) = 6 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
    comprobante text COLLATE pg_catalog."default",
    documento_int text COLLATE pg_catalog."default",
    fecha text COLLATE pg_catalog."default",
    importe_bruto text COLLATE pg_catalog."default",
    importe_neto text COLLATE pg_catalog."default",
    importe_retenido text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	comprobante text, 
	documento_int text,
	fecha text, 
	importe_bruto text,	
	importe_neto text,
	importe_retenido text
	));


INSERT INTO bmem.op_detalle_de_aplicado (WITH t AS (select x::json->'documents'->0->'fields'->'CustomerName'->>'content' as cliente,
				x::json->'documents'->0->'fields'->'InvoiceId'->>'content' as doc_id, 
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') as fecha_emision,
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') - interval '2 months' as periodo
from stage_op)
SELECT id, REPLACE(comprobante, '_', '') AS comprobante, REPLACE(documento_int, '_', '') AS documento_int, 
						TO_DATE(REPLACE(fecha, '_', ''), 'DD.MM.YYYY') AS fecha, 
						CASE WHEN importe_bruto LIKE '%-%' THEN ((REPLACE(REPLACE(TRANSLATE(importe_bruto, ' ._', ''), ',', '.'), '-', ''))::numeric *-1) ELSE (REPLACE(TRANSLATE(importe_bruto, ' ._', ''), ',', '.'))::numeric END AS importe_bruto, 
						CASE WHEN REPLACE(REPLACE(importe_neto, '$', ''), '_', '') LIKE '%-%' THEN ((REPLACE(REPLACE(TRANSLATE(importe_neto, ' _.$', ''), ',', '.'), '-', ''))::numeric *-1) ELSE (REPLACE(REPLACE(TRANSLATE(importe_neto, ' _.$', ''), ',', '.'), '-', '')::numeric) END AS importe_neto,
						CASE WHEN importe_retenido LIKE '%-%' THEN ((REPLACE(REPLACE(TRANSLATE(importe_retenido, ' .$_', ''), ',', '.'), '-', ''))::numeric *-1) ELSE (REPLACE(TRANSLATE(importe_retenido, ' .$_', ''), ',', '.'))::numeric END AS importe_retenido,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;

--------------------------------------------------
ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_pago RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->1->'cells');


DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%porte%');DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';

DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op_pago'::regclass), 
     content2 text,
     columna text	  ); 


INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;
UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'concepto' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'banco' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'cuenta_banc' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'cheque' WHERE id = 4 ;
UPDATE stage_d_aplicado3 SET columna = 'importe' WHERE id = 5 ;

ALTER SEQUENCE  bmem.rowname RESTART;

DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;



DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;

insert into stage_d_aplicado4 
select id, content2, 'importe' FROM stage_d_aplicado4 WHERE columna = 'cheque'
AND not exists (
    select id from stage_d_aplicado4 where columna = 'importe'
);


UPDATE stage_d_aplicado4 SET content2 = null WHERE columna = 'cheque';

DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) = 5 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
    banco text COLLATE pg_catalog."default",
    cuenta_banc text COLLATE pg_catalog."default",
    concepto text COLLATE pg_catalog."default",
    cheque text COLLATE pg_catalog."default",
    importe text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	concepto text, 
	banco text,
	cuenta_banc text, 
	cheque text,	
	importe text
	));

UPDATE stage_d_aplicado5 SET cheque = null;


INSERT INTO bmem.op_detalle_de_pago (WITH t AS (select x::json->'documents'->0->'fields'->'CustomerName'->>'content' as cliente,
				x::json->'documents'->0->'fields'->'InvoiceId'->>'content' as doc_id, 
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') as fecha_emision,
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') - interval '2 months' as periodo
from stage_op)
SELECT id, 
		TRANSLATE(banco, '_0123456789', '') AS banco, 
		regexp_replace(banco, '\D','','g') as cuenta_banc,
		concepto,
		(REPLACE(TRANSLATE(cheque, '._$ ', ''), ',', '.'))::numeric  as cheque,
		(REPLACE(TRANSLATE(importe, '._$ ', ''), ',', '.'))::numeric  as importe,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;
						
--------------------------------------------------------------------------------------------------------------

ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones2 RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->2->'cells');


DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%porte%');DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';


DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op_retenciones'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;
UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'concepto' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'num_certif' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'cod_seg' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'importe' WHERE id = 4 ;

ALTER SEQUENCE  bmem.rowname RESTART;

DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;

insert into stage_d_aplicado4 
select id, content2, 'importe' FROM stage_d_aplicado4 WHERE columna = 'cod_seg'
AND not exists (
    select id from stage_d_aplicado4 where columna = 'importe'
);

UPDATE stage_d_aplicado4 SET content2 = null WHERE columna = 'cod_seg';UPDATE stage_d_aplicado4 SET content2 = ((RIGHT(content2, -5))) WHERE content2 like '____% % %$';

DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) <= 4 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
	cod_seg text,
    concepto text COLLATE pg_catalog."default",
    importe text COLLATE pg_catalog."default",
    num_certif text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	cod_seg text,
	concepto text, 
	importe text,
	num_certif text
	)) ;


DO $$
DECLARE sql TEXT;
BEGIN
    SELECT CASE 
            WHEN (select 1 from stage_d_aplicado5 WHERE importe ~ '^[^0-9]+$' limit 1) = 1
                THEN 'DROP TABLE stage_d_aplicado5;'
            ELSE 'INSERT INTO bmem.op_retenciones(id , concepto , importe , num_certif , doc_id , fecha_emision , cliente , periodo ) (WITH t AS (select x::json->''documents''->0->''fields''->''CustomerName''->>''content'' as cliente,
				x::json->''documents''->0->''fields''->''InvoiceId''->>''content'' as doc_id, 
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') as fecha_emision,
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') - interval ''2 months'' as periodo
from stage_op)
SELECT id, 
		TRANSLATE(concepto, ''_'', '''') AS concepto, 
		((REPLACE(TRANSLATE(importe, ''.-_$ '', ''''), '','', ''.''))::numeric *-1)  as importe,
		TRANSLATE(num_certif, ''_'', '''') AS num_certif,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;'
            END AS qry
    INTO sql
    FROM stage_d_aplicado5 limit 1;
    EXECUTE (sql);
END $$;
------------------------------------------------------------
DELETE from bmem.op_retenciones WHERE concepto NOT like '%MEM%'; DELETE FROM bmem.op_retenciones WHERE importe < -9999999999;
------------------------------------------------------------
ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones2 RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->2->'cells');


DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%porte%');DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';


DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op_retenciones2'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;
UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'concepto' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'num_certif' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'cod_seg' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'importe' WHERE id = 4 ;

ALTER SEQUENCE  bmem.rowname RESTART;

DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;

insert into stage_d_aplicado4 
select id, content2, 'importe' FROM stage_d_aplicado4 WHERE columna = 'cod_seg'
AND not exists (
    select id from stage_d_aplicado4 where columna = 'importe'
);

UPDATE stage_d_aplicado4 SET content2 = null WHERE columna = 'cod_seg';UPDATE stage_d_aplicado4 SET content2 = ((RIGHT(content2, -5))) WHERE content2 like '____% % %$';

DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) <= 4 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
	cod_seg text,
    concepto text COLLATE pg_catalog."default",
    importe text COLLATE pg_catalog."default",
    num_certif text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	cod_seg text,
	concepto text, 
	importe text,
	num_certif text
	)) ;


DO $$
DECLARE sql TEXT;
BEGIN
    SELECT CASE 
            WHEN (select 1 from stage_d_aplicado5 WHERE importe ~ '^[^0-9]+$' limit 1) = 1
                THEN 'DROP TABLE stage_d_aplicado5;'
            ELSE 'INSERT INTO bmem.op_retenciones(id , concepto , importe , num_certif , doc_id , fecha_emision , cliente , periodo ) (WITH t AS (select x::json->''documents''->0->''fields''->''CustomerName''->>''content'' as cliente,
				x::json->''documents''->0->''fields''->''InvoiceId''->>''content'' as doc_id, 
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') as fecha_emision,
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') - interval ''2 months'' as periodo
from stage_op)
SELECT id, 
		TRANSLATE(concepto, ''_'', '''') AS concepto, 
		((REPLACE(TRANSLATE(importe, ''.-_$ '', ''''), '','', ''.''))::numeric *-1)  as importe,
		TRANSLATE(num_certif, ''_'', '''') AS num_certif,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;'
            END AS qry
    INTO sql
    FROM stage_d_aplicado5 limit 1;
    EXECUTE (sql);
END $$;

--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------

ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

DROP TABLE IF EXISTS stage_op;
DROP TABLE IF EXISTS stage_json_d_aplicado;


CREATE TEMP TABLE stage_json_d_aplicado 
  ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     json text 
  ); 
 
CREATE TEMP TABLE stage_op (x jsonb);
COPY stage_json_d_aplicado(json) FROM 'C:\Users\Administrador\GoesGreen SRL\I4 - AUTO\import\13.json' csv quote e'\x01' delimiter e'\x02';

INSERT INTO stage_op(x)
SELECT   string_agg( json ,e'\n' ORDER BY id)::jsonb 
FROM     stage_json_d_aplicado;


ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->0->'cells');

DELETE FROM  stage_d_aplicado2 WHERE id >= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE 'Total%');
DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%Neto%');
DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';

DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op'::regclass), 
     content2 text,
     columna text	  ); 


INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;

UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'fecha' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'comprobante' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'documento_int' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'importe_bruto' WHERE id = 4 ;
UPDATE stage_d_aplicado3 SET columna = 'importe_retenido' WHERE id = 5 ;
UPDATE stage_d_aplicado3 SET columna = 'importe_neto' WHERE id = 6 ;

ALTER SEQUENCE  bmem.rowname RESTART;


DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;


DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) = 6 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
    comprobante text COLLATE pg_catalog."default",
    documento_int text COLLATE pg_catalog."default",
    fecha text COLLATE pg_catalog."default",
    importe_bruto text COLLATE pg_catalog."default",
    importe_neto text COLLATE pg_catalog."default",
    importe_retenido text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	comprobante text, 
	documento_int text,
	fecha text, 
	importe_bruto text,	
	importe_neto text,
	importe_retenido text
	));


INSERT INTO bmem.op_detalle_de_aplicado (WITH t AS (select x::json->'documents'->0->'fields'->'CustomerName'->>'content' as cliente,
				x::json->'documents'->0->'fields'->'InvoiceId'->>'content' as doc_id, 
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') as fecha_emision,
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') - interval '2 months' as periodo
from stage_op)
SELECT id, REPLACE(comprobante, '_', '') AS comprobante, REPLACE(documento_int, '_', '') AS documento_int, 
						TO_DATE(REPLACE(fecha, '_', ''), 'DD.MM.YYYY') AS fecha, 
						CASE WHEN importe_bruto LIKE '%-%' THEN ((REPLACE(REPLACE(TRANSLATE(importe_bruto, ' ._', ''), ',', '.'), '-', ''))::numeric *-1) ELSE (REPLACE(TRANSLATE(importe_bruto, ' ._', ''), ',', '.'))::numeric END AS importe_bruto, 
						CASE WHEN REPLACE(REPLACE(importe_neto, '$', ''), '_', '') LIKE '%-%' THEN ((REPLACE(REPLACE(TRANSLATE(importe_neto, ' _.$', ''), ',', '.'), '-', ''))::numeric *-1) ELSE (REPLACE(REPLACE(TRANSLATE(importe_neto, ' _.$', ''), ',', '.'), '-', '')::numeric) END AS importe_neto,
						CASE WHEN importe_retenido LIKE '%-%' THEN ((REPLACE(REPLACE(TRANSLATE(importe_retenido, ' .$_', ''), ',', '.'), '-', ''))::numeric *-1) ELSE (REPLACE(TRANSLATE(importe_retenido, ' .$_', ''), ',', '.'))::numeric END AS importe_retenido,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;

--------------------------------------------------
ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_pago RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->1->'cells');


DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%porte%');DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';

DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op_pago'::regclass), 
     content2 text,
     columna text	  ); 


INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;
UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'concepto' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'banco' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'cuenta_banc' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'cheque' WHERE id = 4 ;
UPDATE stage_d_aplicado3 SET columna = 'importe' WHERE id = 5 ;

ALTER SEQUENCE  bmem.rowname RESTART;

DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;



DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;

insert into stage_d_aplicado4 
select id, content2, 'importe' FROM stage_d_aplicado4 WHERE columna = 'cheque'
AND not exists (
    select id from stage_d_aplicado4 where columna = 'importe'
);


UPDATE stage_d_aplicado4 SET content2 = null WHERE columna = 'cheque';

DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) = 5 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
    banco text COLLATE pg_catalog."default",
    cuenta_banc text COLLATE pg_catalog."default",
    concepto text COLLATE pg_catalog."default",
    cheque text COLLATE pg_catalog."default",
    importe text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	concepto text, 
	banco text,
	cuenta_banc text, 
	cheque text,	
	importe text
	));

UPDATE stage_d_aplicado5 SET cheque = null;


INSERT INTO bmem.op_detalle_de_pago (WITH t AS (select x::json->'documents'->0->'fields'->'CustomerName'->>'content' as cliente,
				x::json->'documents'->0->'fields'->'InvoiceId'->>'content' as doc_id, 
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') as fecha_emision,
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') - interval '2 months' as periodo
from stage_op)
SELECT id, 
		TRANSLATE(banco, '_0123456789', '') AS banco, 
		regexp_replace(banco, '\D','','g') as cuenta_banc,
		concepto,
		(REPLACE(TRANSLATE(cheque, '._$ ', ''), ',', '.'))::numeric  as cheque,
		(REPLACE(TRANSLATE(importe, '._$ ', ''), ',', '.'))::numeric  as importe,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;
						
--------------------------------------------------------------------------------------------------------------

ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones2 RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->2->'cells');


DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%porte%');DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';


DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op_retenciones'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;
UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'concepto' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'num_certif' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'cod_seg' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'importe' WHERE id = 4 ;

ALTER SEQUENCE  bmem.rowname RESTART;

DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;

insert into stage_d_aplicado4 
select id, content2, 'importe' FROM stage_d_aplicado4 WHERE columna = 'cod_seg'
AND not exists (
    select id from stage_d_aplicado4 where columna = 'importe'
);

UPDATE stage_d_aplicado4 SET content2 = null WHERE columna = 'cod_seg';UPDATE stage_d_aplicado4 SET content2 = ((RIGHT(content2, -5))) WHERE content2 like '____% % %$';

DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) <= 4 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
	cod_seg text,
    concepto text COLLATE pg_catalog."default",
    importe text COLLATE pg_catalog."default",
    num_certif text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	cod_seg text,
	concepto text, 
	importe text,
	num_certif text
	)) ;


DO $$
DECLARE sql TEXT;
BEGIN
    SELECT CASE 
            WHEN (select 1 from stage_d_aplicado5 WHERE importe ~ '^[^0-9]+$' limit 1) = 1
                THEN 'DROP TABLE stage_d_aplicado5;'
            ELSE 'INSERT INTO bmem.op_retenciones(id , concepto , importe , num_certif , doc_id , fecha_emision , cliente , periodo ) (WITH t AS (select x::json->''documents''->0->''fields''->''CustomerName''->>''content'' as cliente,
				x::json->''documents''->0->''fields''->''InvoiceId''->>''content'' as doc_id, 
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') as fecha_emision,
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') - interval ''2 months'' as periodo
from stage_op)
SELECT id, 
		TRANSLATE(concepto, ''_'', '''') AS concepto, 
		((REPLACE(TRANSLATE(importe, ''.-_$ '', ''''), '','', ''.''))::numeric *-1)  as importe,
		TRANSLATE(num_certif, ''_'', '''') AS num_certif,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;'
            END AS qry
    INTO sql
    FROM stage_d_aplicado5 limit 1;
    EXECUTE (sql);
END $$;
------------------------------------------------------------
DELETE from bmem.op_retenciones WHERE concepto NOT like '%MEM%'; DELETE FROM bmem.op_retenciones WHERE importe < -9999999999;
------------------------------------------------------------
ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones2 RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->2->'cells');


DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%porte%');DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';


DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op_retenciones2'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;
UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'concepto' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'num_certif' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'cod_seg' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'importe' WHERE id = 4 ;

ALTER SEQUENCE  bmem.rowname RESTART;

DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;

insert into stage_d_aplicado4 
select id, content2, 'importe' FROM stage_d_aplicado4 WHERE columna = 'cod_seg'
AND not exists (
    select id from stage_d_aplicado4 where columna = 'importe'
);

UPDATE stage_d_aplicado4 SET content2 = null WHERE columna = 'cod_seg';UPDATE stage_d_aplicado4 SET content2 = ((RIGHT(content2, -5))) WHERE content2 like '____% % %$';

DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) <= 4 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
	cod_seg text,
    concepto text COLLATE pg_catalog."default",
    importe text COLLATE pg_catalog."default",
    num_certif text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	cod_seg text,
	concepto text, 
	importe text,
	num_certif text
	)) ;


DO $$
DECLARE sql TEXT;
BEGIN
    SELECT CASE 
            WHEN (select 1 from stage_d_aplicado5 WHERE importe ~ '^[^0-9]+$' limit 1) = 1
                THEN 'DROP TABLE stage_d_aplicado5;'
            ELSE 'INSERT INTO bmem.op_retenciones(id , concepto , importe , num_certif , doc_id , fecha_emision , cliente , periodo ) (WITH t AS (select x::json->''documents''->0->''fields''->''CustomerName''->>''content'' as cliente,
				x::json->''documents''->0->''fields''->''InvoiceId''->>''content'' as doc_id, 
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') as fecha_emision,
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') - interval ''2 months'' as periodo
from stage_op)
SELECT id, 
		TRANSLATE(concepto, ''_'', '''') AS concepto, 
		((REPLACE(TRANSLATE(importe, ''.-_$ '', ''''), '','', ''.''))::numeric *-1)  as importe,
		TRANSLATE(num_certif, ''_'', '''') AS num_certif,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;'
            END AS qry
    INTO sql
    FROM stage_d_aplicado5 limit 1;
    EXECUTE (sql);
END $$;

--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------

ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

DROP TABLE IF EXISTS stage_op;
DROP TABLE IF EXISTS stage_json_d_aplicado;


CREATE TEMP TABLE stage_json_d_aplicado 
  ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     json text 
  ); 
 
CREATE TEMP TABLE stage_op (x jsonb);
COPY stage_json_d_aplicado(json) FROM 'C:\Users\Administrador\GoesGreen SRL\I4 - AUTO\import\14.json' csv quote e'\x01' delimiter e'\x02';

INSERT INTO stage_op(x)
SELECT   string_agg( json ,e'\n' ORDER BY id)::jsonb 
FROM     stage_json_d_aplicado;


ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->0->'cells');

DELETE FROM  stage_d_aplicado2 WHERE id >= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE 'Total%');
DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%Neto%');
DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';

DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op'::regclass), 
     content2 text,
     columna text	  ); 


INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;

UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'fecha' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'comprobante' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'documento_int' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'importe_bruto' WHERE id = 4 ;
UPDATE stage_d_aplicado3 SET columna = 'importe_retenido' WHERE id = 5 ;
UPDATE stage_d_aplicado3 SET columna = 'importe_neto' WHERE id = 6 ;

ALTER SEQUENCE  bmem.rowname RESTART;


DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;


DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) = 6 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
    comprobante text COLLATE pg_catalog."default",
    documento_int text COLLATE pg_catalog."default",
    fecha text COLLATE pg_catalog."default",
    importe_bruto text COLLATE pg_catalog."default",
    importe_neto text COLLATE pg_catalog."default",
    importe_retenido text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	comprobante text, 
	documento_int text,
	fecha text, 
	importe_bruto text,	
	importe_neto text,
	importe_retenido text
	));


INSERT INTO bmem.op_detalle_de_aplicado (WITH t AS (select x::json->'documents'->0->'fields'->'CustomerName'->>'content' as cliente,
				x::json->'documents'->0->'fields'->'InvoiceId'->>'content' as doc_id, 
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') as fecha_emision,
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') - interval '2 months' as periodo
from stage_op)
SELECT id, REPLACE(comprobante, '_', '') AS comprobante, REPLACE(documento_int, '_', '') AS documento_int, 
						TO_DATE(REPLACE(fecha, '_', ''), 'DD.MM.YYYY') AS fecha, 
						CASE WHEN importe_bruto LIKE '%-%' THEN ((REPLACE(REPLACE(TRANSLATE(importe_bruto, ' ._', ''), ',', '.'), '-', ''))::numeric *-1) ELSE (REPLACE(TRANSLATE(importe_bruto, ' ._', ''), ',', '.'))::numeric END AS importe_bruto, 
						CASE WHEN REPLACE(REPLACE(importe_neto, '$', ''), '_', '') LIKE '%-%' THEN ((REPLACE(REPLACE(TRANSLATE(importe_neto, ' _.$', ''), ',', '.'), '-', ''))::numeric *-1) ELSE (REPLACE(REPLACE(TRANSLATE(importe_neto, ' _.$', ''), ',', '.'), '-', '')::numeric) END AS importe_neto,
						CASE WHEN importe_retenido LIKE '%-%' THEN ((REPLACE(REPLACE(TRANSLATE(importe_retenido, ' .$_', ''), ',', '.'), '-', ''))::numeric *-1) ELSE (REPLACE(TRANSLATE(importe_retenido, ' .$_', ''), ',', '.'))::numeric END AS importe_retenido,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;

--------------------------------------------------
ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_pago RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->1->'cells');


DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%porte%');DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';

DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op_pago'::regclass), 
     content2 text,
     columna text	  ); 


INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;
UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'concepto' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'banco' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'cuenta_banc' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'cheque' WHERE id = 4 ;
UPDATE stage_d_aplicado3 SET columna = 'importe' WHERE id = 5 ;

ALTER SEQUENCE  bmem.rowname RESTART;

DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;



DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;

insert into stage_d_aplicado4 
select id, content2, 'importe' FROM stage_d_aplicado4 WHERE columna = 'cheque'
AND not exists (
    select id from stage_d_aplicado4 where columna = 'importe'
);


UPDATE stage_d_aplicado4 SET content2 = null WHERE columna = 'cheque';

DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) = 5 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
    banco text COLLATE pg_catalog."default",
    cuenta_banc text COLLATE pg_catalog."default",
    concepto text COLLATE pg_catalog."default",
    cheque text COLLATE pg_catalog."default",
    importe text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	concepto text, 
	banco text,
	cuenta_banc text, 
	cheque text,	
	importe text
	));

UPDATE stage_d_aplicado5 SET cheque = null;


INSERT INTO bmem.op_detalle_de_pago (WITH t AS (select x::json->'documents'->0->'fields'->'CustomerName'->>'content' as cliente,
				x::json->'documents'->0->'fields'->'InvoiceId'->>'content' as doc_id, 
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') as fecha_emision,
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') - interval '2 months' as periodo
from stage_op)
SELECT id, 
		TRANSLATE(banco, '_0123456789', '') AS banco, 
		regexp_replace(banco, '\D','','g') as cuenta_banc,
		concepto,
		(REPLACE(TRANSLATE(cheque, '._$ ', ''), ',', '.'))::numeric  as cheque,
		(REPLACE(TRANSLATE(importe, '._$ ', ''), ',', '.'))::numeric  as importe,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;
						
--------------------------------------------------------------------------------------------------------------

ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones2 RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->2->'cells');


DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%porte%');DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';


DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op_retenciones'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;
UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'concepto' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'num_certif' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'cod_seg' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'importe' WHERE id = 4 ;

ALTER SEQUENCE  bmem.rowname RESTART;

DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;

insert into stage_d_aplicado4 
select id, content2, 'importe' FROM stage_d_aplicado4 WHERE columna = 'cod_seg'
AND not exists (
    select id from stage_d_aplicado4 where columna = 'importe'
);

UPDATE stage_d_aplicado4 SET content2 = null WHERE columna = 'cod_seg';UPDATE stage_d_aplicado4 SET content2 = ((RIGHT(content2, -5))) WHERE content2 like '____% % %$';

DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) <= 4 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
	cod_seg text,
    concepto text COLLATE pg_catalog."default",
    importe text COLLATE pg_catalog."default",
    num_certif text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	cod_seg text,
	concepto text, 
	importe text,
	num_certif text
	)) ;


DO $$
DECLARE sql TEXT;
BEGIN
    SELECT CASE 
            WHEN (select 1 from stage_d_aplicado5 WHERE importe ~ '^[^0-9]+$' limit 1) = 1
                THEN 'DROP TABLE stage_d_aplicado5;'
            ELSE 'INSERT INTO bmem.op_retenciones(id , concepto , importe , num_certif , doc_id , fecha_emision , cliente , periodo ) (WITH t AS (select x::json->''documents''->0->''fields''->''CustomerName''->>''content'' as cliente,
				x::json->''documents''->0->''fields''->''InvoiceId''->>''content'' as doc_id, 
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') as fecha_emision,
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') - interval ''2 months'' as periodo
from stage_op)
SELECT id, 
		TRANSLATE(concepto, ''_'', '''') AS concepto, 
		((REPLACE(TRANSLATE(importe, ''.-_$ '', ''''), '','', ''.''))::numeric *-1)  as importe,
		TRANSLATE(num_certif, ''_'', '''') AS num_certif,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;'
            END AS qry
    INTO sql
    FROM stage_d_aplicado5 limit 1;
    EXECUTE (sql);
END $$;
------------------------------------------------------------
DELETE from bmem.op_retenciones WHERE concepto NOT like '%MEM%'; DELETE FROM bmem.op_retenciones WHERE importe < -9999999999;
------------------------------------------------------------
ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones2 RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->2->'cells');


DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%porte%');DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';


DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op_retenciones2'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;
UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'concepto' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'num_certif' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'cod_seg' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'importe' WHERE id = 4 ;

ALTER SEQUENCE  bmem.rowname RESTART;

DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;

insert into stage_d_aplicado4 
select id, content2, 'importe' FROM stage_d_aplicado4 WHERE columna = 'cod_seg'
AND not exists (
    select id from stage_d_aplicado4 where columna = 'importe'
);

UPDATE stage_d_aplicado4 SET content2 = null WHERE columna = 'cod_seg';UPDATE stage_d_aplicado4 SET content2 = ((RIGHT(content2, -5))) WHERE content2 like '____% % %$';

DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) <= 4 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
	cod_seg text,
    concepto text COLLATE pg_catalog."default",
    importe text COLLATE pg_catalog."default",
    num_certif text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	cod_seg text,
	concepto text, 
	importe text,
	num_certif text
	)) ;


DO $$
DECLARE sql TEXT;
BEGIN
    SELECT CASE 
            WHEN (select 1 from stage_d_aplicado5 WHERE importe ~ '^[^0-9]+$' limit 1) = 1
                THEN 'DROP TABLE stage_d_aplicado5;'
            ELSE 'INSERT INTO bmem.op_retenciones(id , concepto , importe , num_certif , doc_id , fecha_emision , cliente , periodo ) (WITH t AS (select x::json->''documents''->0->''fields''->''CustomerName''->>''content'' as cliente,
				x::json->''documents''->0->''fields''->''InvoiceId''->>''content'' as doc_id, 
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') as fecha_emision,
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') - interval ''2 months'' as periodo
from stage_op)
SELECT id, 
		TRANSLATE(concepto, ''_'', '''') AS concepto, 
		((REPLACE(TRANSLATE(importe, ''.-_$ '', ''''), '','', ''.''))::numeric *-1)  as importe,
		TRANSLATE(num_certif, ''_'', '''') AS num_certif,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;'
            END AS qry
    INTO sql
    FROM stage_d_aplicado5 limit 1;
    EXECUTE (sql);
END $$;

--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------

ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

DROP TABLE IF EXISTS stage_op;
DROP TABLE IF EXISTS stage_json_d_aplicado;


CREATE TEMP TABLE stage_json_d_aplicado 
  ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     json text 
  ); 
 
CREATE TEMP TABLE stage_op (x jsonb);
COPY stage_json_d_aplicado(json) FROM 'C:\Users\Administrador\GoesGreen SRL\I4 - AUTO\import\15.json' csv quote e'\x01' delimiter e'\x02';

INSERT INTO stage_op(x)
SELECT   string_agg( json ,e'\n' ORDER BY id)::jsonb 
FROM     stage_json_d_aplicado;


ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->0->'cells');

DELETE FROM  stage_d_aplicado2 WHERE id >= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE 'Total%');
DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%Neto%');
DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';

DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op'::regclass), 
     content2 text,
     columna text	  ); 


INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;

UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'fecha' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'comprobante' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'documento_int' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'importe_bruto' WHERE id = 4 ;
UPDATE stage_d_aplicado3 SET columna = 'importe_retenido' WHERE id = 5 ;
UPDATE stage_d_aplicado3 SET columna = 'importe_neto' WHERE id = 6 ;

ALTER SEQUENCE  bmem.rowname RESTART;


DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;


DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) = 6 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
    comprobante text COLLATE pg_catalog."default",
    documento_int text COLLATE pg_catalog."default",
    fecha text COLLATE pg_catalog."default",
    importe_bruto text COLLATE pg_catalog."default",
    importe_neto text COLLATE pg_catalog."default",
    importe_retenido text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	comprobante text, 
	documento_int text,
	fecha text, 
	importe_bruto text,	
	importe_neto text,
	importe_retenido text
	));


INSERT INTO bmem.op_detalle_de_aplicado (WITH t AS (select x::json->'documents'->0->'fields'->'CustomerName'->>'content' as cliente,
				x::json->'documents'->0->'fields'->'InvoiceId'->>'content' as doc_id, 
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') as fecha_emision,
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') - interval '2 months' as periodo
from stage_op)
SELECT id, REPLACE(comprobante, '_', '') AS comprobante, REPLACE(documento_int, '_', '') AS documento_int, 
						TO_DATE(REPLACE(fecha, '_', ''), 'DD.MM.YYYY') AS fecha, 
						CASE WHEN importe_bruto LIKE '%-%' THEN ((REPLACE(REPLACE(TRANSLATE(importe_bruto, ' ._', ''), ',', '.'), '-', ''))::numeric *-1) ELSE (REPLACE(TRANSLATE(importe_bruto, ' ._', ''), ',', '.'))::numeric END AS importe_bruto, 
						CASE WHEN REPLACE(REPLACE(importe_neto, '$', ''), '_', '') LIKE '%-%' THEN ((REPLACE(REPLACE(TRANSLATE(importe_neto, ' _.$', ''), ',', '.'), '-', ''))::numeric *-1) ELSE (REPLACE(REPLACE(TRANSLATE(importe_neto, ' _.$', ''), ',', '.'), '-', '')::numeric) END AS importe_neto,
						CASE WHEN importe_retenido LIKE '%-%' THEN ((REPLACE(REPLACE(TRANSLATE(importe_retenido, ' .$_', ''), ',', '.'), '-', ''))::numeric *-1) ELSE (REPLACE(TRANSLATE(importe_retenido, ' .$_', ''), ',', '.'))::numeric END AS importe_retenido,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;

--------------------------------------------------
ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_pago RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->1->'cells');


DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%porte%');DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';

DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op_pago'::regclass), 
     content2 text,
     columna text	  ); 


INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;
UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'concepto' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'banco' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'cuenta_banc' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'cheque' WHERE id = 4 ;
UPDATE stage_d_aplicado3 SET columna = 'importe' WHERE id = 5 ;

ALTER SEQUENCE  bmem.rowname RESTART;

DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;



DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;

insert into stage_d_aplicado4 
select id, content2, 'importe' FROM stage_d_aplicado4 WHERE columna = 'cheque'
AND not exists (
    select id from stage_d_aplicado4 where columna = 'importe'
);


UPDATE stage_d_aplicado4 SET content2 = null WHERE columna = 'cheque';

DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) = 5 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
    banco text COLLATE pg_catalog."default",
    cuenta_banc text COLLATE pg_catalog."default",
    concepto text COLLATE pg_catalog."default",
    cheque text COLLATE pg_catalog."default",
    importe text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	concepto text, 
	banco text,
	cuenta_banc text, 
	cheque text,	
	importe text
	));

UPDATE stage_d_aplicado5 SET cheque = null;


INSERT INTO bmem.op_detalle_de_pago (WITH t AS (select x::json->'documents'->0->'fields'->'CustomerName'->>'content' as cliente,
				x::json->'documents'->0->'fields'->'InvoiceId'->>'content' as doc_id, 
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') as fecha_emision,
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') - interval '2 months' as periodo
from stage_op)
SELECT id, 
		TRANSLATE(banco, '_0123456789', '') AS banco, 
		regexp_replace(banco, '\D','','g') as cuenta_banc,
		concepto,
		(REPLACE(TRANSLATE(cheque, '._$ ', ''), ',', '.'))::numeric  as cheque,
		(REPLACE(TRANSLATE(importe, '._$ ', ''), ',', '.'))::numeric  as importe,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;
						
--------------------------------------------------------------------------------------------------------------

ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones2 RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->2->'cells');


DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%porte%');DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';


DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op_retenciones'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;
UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'concepto' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'num_certif' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'cod_seg' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'importe' WHERE id = 4 ;

ALTER SEQUENCE  bmem.rowname RESTART;

DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;

insert into stage_d_aplicado4 
select id, content2, 'importe' FROM stage_d_aplicado4 WHERE columna = 'cod_seg'
AND not exists (
    select id from stage_d_aplicado4 where columna = 'importe'
);

UPDATE stage_d_aplicado4 SET content2 = null WHERE columna = 'cod_seg';UPDATE stage_d_aplicado4 SET content2 = ((RIGHT(content2, -5))) WHERE content2 like '____% % %$';

DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) <= 4 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
	cod_seg text,
    concepto text COLLATE pg_catalog."default",
    importe text COLLATE pg_catalog."default",
    num_certif text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	cod_seg text,
	concepto text, 
	importe text,
	num_certif text
	)) ;


DO $$
DECLARE sql TEXT;
BEGIN
    SELECT CASE 
            WHEN (select 1 from stage_d_aplicado5 WHERE importe ~ '^[^0-9]+$' limit 1) = 1
                THEN 'DROP TABLE stage_d_aplicado5;'
            ELSE 'INSERT INTO bmem.op_retenciones(id , concepto , importe , num_certif , doc_id , fecha_emision , cliente , periodo ) (WITH t AS (select x::json->''documents''->0->''fields''->''CustomerName''->>''content'' as cliente,
				x::json->''documents''->0->''fields''->''InvoiceId''->>''content'' as doc_id, 
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') as fecha_emision,
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') - interval ''2 months'' as periodo
from stage_op)
SELECT id, 
		TRANSLATE(concepto, ''_'', '''') AS concepto, 
		((REPLACE(TRANSLATE(importe, ''.-_$ '', ''''), '','', ''.''))::numeric *-1)  as importe,
		TRANSLATE(num_certif, ''_'', '''') AS num_certif,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;'
            END AS qry
    INTO sql
    FROM stage_d_aplicado5 limit 1;
    EXECUTE (sql);
END $$;
------------------------------------------------------------
DELETE from bmem.op_retenciones WHERE concepto NOT like '%MEM%'; DELETE FROM bmem.op_retenciones WHERE importe < -9999999999;
------------------------------------------------------------
ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones2 RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->2->'cells');


DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%porte%');DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';


DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op_retenciones2'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;
UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'concepto' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'num_certif' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'cod_seg' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'importe' WHERE id = 4 ;

ALTER SEQUENCE  bmem.rowname RESTART;

DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;

insert into stage_d_aplicado4 
select id, content2, 'importe' FROM stage_d_aplicado4 WHERE columna = 'cod_seg'
AND not exists (
    select id from stage_d_aplicado4 where columna = 'importe'
);

UPDATE stage_d_aplicado4 SET content2 = null WHERE columna = 'cod_seg';UPDATE stage_d_aplicado4 SET content2 = ((RIGHT(content2, -5))) WHERE content2 like '____% % %$';

DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) <= 4 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
	cod_seg text,
    concepto text COLLATE pg_catalog."default",
    importe text COLLATE pg_catalog."default",
    num_certif text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	cod_seg text,
	concepto text, 
	importe text,
	num_certif text
	)) ;


DO $$
DECLARE sql TEXT;
BEGIN
    SELECT CASE 
            WHEN (select 1 from stage_d_aplicado5 WHERE importe ~ '^[^0-9]+$' limit 1) = 1
                THEN 'DROP TABLE stage_d_aplicado5;'
            ELSE 'INSERT INTO bmem.op_retenciones(id , concepto , importe , num_certif , doc_id , fecha_emision , cliente , periodo ) (WITH t AS (select x::json->''documents''->0->''fields''->''CustomerName''->>''content'' as cliente,
				x::json->''documents''->0->''fields''->''InvoiceId''->>''content'' as doc_id, 
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') as fecha_emision,
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') - interval ''2 months'' as periodo
from stage_op)
SELECT id, 
		TRANSLATE(concepto, ''_'', '''') AS concepto, 
		((REPLACE(TRANSLATE(importe, ''.-_$ '', ''''), '','', ''.''))::numeric *-1)  as importe,
		TRANSLATE(num_certif, ''_'', '''') AS num_certif,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;'
            END AS qry
    INTO sql
    FROM stage_d_aplicado5 limit 1;
    EXECUTE (sql);
END $$;

--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------

ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

DROP TABLE IF EXISTS stage_op;
DROP TABLE IF EXISTS stage_json_d_aplicado;


CREATE TEMP TABLE stage_json_d_aplicado 
  ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     json text 
  ); 
 
CREATE TEMP TABLE stage_op (x jsonb);
COPY stage_json_d_aplicado(json) FROM 'C:\Users\Administrador\GoesGreen SRL\I4 - AUTO\import\16.json' csv quote e'\x01' delimiter e'\x02';

INSERT INTO stage_op(x)
SELECT   string_agg( json ,e'\n' ORDER BY id)::jsonb 
FROM     stage_json_d_aplicado;


ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->0->'cells');

DELETE FROM  stage_d_aplicado2 WHERE id >= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE 'Total%');
DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%Neto%');
DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';

DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op'::regclass), 
     content2 text,
     columna text	  ); 


INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;

UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'fecha' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'comprobante' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'documento_int' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'importe_bruto' WHERE id = 4 ;
UPDATE stage_d_aplicado3 SET columna = 'importe_retenido' WHERE id = 5 ;
UPDATE stage_d_aplicado3 SET columna = 'importe_neto' WHERE id = 6 ;

ALTER SEQUENCE  bmem.rowname RESTART;


DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;


DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) = 6 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
    comprobante text COLLATE pg_catalog."default",
    documento_int text COLLATE pg_catalog."default",
    fecha text COLLATE pg_catalog."default",
    importe_bruto text COLLATE pg_catalog."default",
    importe_neto text COLLATE pg_catalog."default",
    importe_retenido text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	comprobante text, 
	documento_int text,
	fecha text, 
	importe_bruto text,	
	importe_neto text,
	importe_retenido text
	));


INSERT INTO bmem.op_detalle_de_aplicado (WITH t AS (select x::json->'documents'->0->'fields'->'CustomerName'->>'content' as cliente,
				x::json->'documents'->0->'fields'->'InvoiceId'->>'content' as doc_id, 
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') as fecha_emision,
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') - interval '2 months' as periodo
from stage_op)
SELECT id, REPLACE(comprobante, '_', '') AS comprobante, REPLACE(documento_int, '_', '') AS documento_int, 
						TO_DATE(REPLACE(fecha, '_', ''), 'DD.MM.YYYY') AS fecha, 
						CASE WHEN importe_bruto LIKE '%-%' THEN ((REPLACE(REPLACE(TRANSLATE(importe_bruto, ' ._', ''), ',', '.'), '-', ''))::numeric *-1) ELSE (REPLACE(TRANSLATE(importe_bruto, ' ._', ''), ',', '.'))::numeric END AS importe_bruto, 
						CASE WHEN REPLACE(REPLACE(importe_neto, '$', ''), '_', '') LIKE '%-%' THEN ((REPLACE(REPLACE(TRANSLATE(importe_neto, ' _.$', ''), ',', '.'), '-', ''))::numeric *-1) ELSE (REPLACE(REPLACE(TRANSLATE(importe_neto, ' _.$', ''), ',', '.'), '-', '')::numeric) END AS importe_neto,
						CASE WHEN importe_retenido LIKE '%-%' THEN ((REPLACE(REPLACE(TRANSLATE(importe_retenido, ' .$_', ''), ',', '.'), '-', ''))::numeric *-1) ELSE (REPLACE(TRANSLATE(importe_retenido, ' .$_', ''), ',', '.'))::numeric END AS importe_retenido,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;

--------------------------------------------------
ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_pago RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->1->'cells');


DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%porte%');DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';

DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op_pago'::regclass), 
     content2 text,
     columna text	  ); 


INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;
UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'concepto' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'banco' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'cuenta_banc' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'cheque' WHERE id = 4 ;
UPDATE stage_d_aplicado3 SET columna = 'importe' WHERE id = 5 ;

ALTER SEQUENCE  bmem.rowname RESTART;

DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;



DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;

insert into stage_d_aplicado4 
select id, content2, 'importe' FROM stage_d_aplicado4 WHERE columna = 'cheque'
AND not exists (
    select id from stage_d_aplicado4 where columna = 'importe'
);


UPDATE stage_d_aplicado4 SET content2 = null WHERE columna = 'cheque';

DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) = 5 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
    banco text COLLATE pg_catalog."default",
    cuenta_banc text COLLATE pg_catalog."default",
    concepto text COLLATE pg_catalog."default",
    cheque text COLLATE pg_catalog."default",
    importe text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	concepto text, 
	banco text,
	cuenta_banc text, 
	cheque text,	
	importe text
	));

UPDATE stage_d_aplicado5 SET cheque = null;


INSERT INTO bmem.op_detalle_de_pago (WITH t AS (select x::json->'documents'->0->'fields'->'CustomerName'->>'content' as cliente,
				x::json->'documents'->0->'fields'->'InvoiceId'->>'content' as doc_id, 
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') as fecha_emision,
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') - interval '2 months' as periodo
from stage_op)
SELECT id, 
		TRANSLATE(banco, '_0123456789', '') AS banco, 
		regexp_replace(banco, '\D','','g') as cuenta_banc,
		concepto,
		(REPLACE(TRANSLATE(cheque, '._$ ', ''), ',', '.'))::numeric  as cheque,
		(REPLACE(TRANSLATE(importe, '._$ ', ''), ',', '.'))::numeric  as importe,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;
						
--------------------------------------------------------------------------------------------------------------

ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones2 RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->2->'cells');


DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%porte%');DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';


DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op_retenciones'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;
UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'concepto' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'num_certif' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'cod_seg' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'importe' WHERE id = 4 ;

ALTER SEQUENCE  bmem.rowname RESTART;

DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;

insert into stage_d_aplicado4 
select id, content2, 'importe' FROM stage_d_aplicado4 WHERE columna = 'cod_seg'
AND not exists (
    select id from stage_d_aplicado4 where columna = 'importe'
);

UPDATE stage_d_aplicado4 SET content2 = null WHERE columna = 'cod_seg';UPDATE stage_d_aplicado4 SET content2 = ((RIGHT(content2, -5))) WHERE content2 like '____% % %$';

DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) <= 4 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
	cod_seg text,
    concepto text COLLATE pg_catalog."default",
    importe text COLLATE pg_catalog."default",
    num_certif text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	cod_seg text,
	concepto text, 
	importe text,
	num_certif text
	)) ;


DO $$
DECLARE sql TEXT;
BEGIN
    SELECT CASE 
            WHEN (select 1 from stage_d_aplicado5 WHERE importe ~ '^[^0-9]+$' limit 1) = 1
                THEN 'DROP TABLE stage_d_aplicado5;'
            ELSE 'INSERT INTO bmem.op_retenciones(id , concepto , importe , num_certif , doc_id , fecha_emision , cliente , periodo ) (WITH t AS (select x::json->''documents''->0->''fields''->''CustomerName''->>''content'' as cliente,
				x::json->''documents''->0->''fields''->''InvoiceId''->>''content'' as doc_id, 
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') as fecha_emision,
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') - interval ''2 months'' as periodo
from stage_op)
SELECT id, 
		TRANSLATE(concepto, ''_'', '''') AS concepto, 
		((REPLACE(TRANSLATE(importe, ''.-_$ '', ''''), '','', ''.''))::numeric *-1)  as importe,
		TRANSLATE(num_certif, ''_'', '''') AS num_certif,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;'
            END AS qry
    INTO sql
    FROM stage_d_aplicado5 limit 1;
    EXECUTE (sql);
END $$;
------------------------------------------------------------
DELETE from bmem.op_retenciones WHERE concepto NOT like '%MEM%'; DELETE FROM bmem.op_retenciones WHERE importe < -9999999999;
------------------------------------------------------------
ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones2 RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->2->'cells');


DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%porte%');DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';


DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op_retenciones2'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;
UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'concepto' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'num_certif' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'cod_seg' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'importe' WHERE id = 4 ;

ALTER SEQUENCE  bmem.rowname RESTART;

DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;

insert into stage_d_aplicado4 
select id, content2, 'importe' FROM stage_d_aplicado4 WHERE columna = 'cod_seg'
AND not exists (
    select id from stage_d_aplicado4 where columna = 'importe'
);

UPDATE stage_d_aplicado4 SET content2 = null WHERE columna = 'cod_seg';UPDATE stage_d_aplicado4 SET content2 = ((RIGHT(content2, -5))) WHERE content2 like '____% % %$';

DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) <= 4 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
	cod_seg text,
    concepto text COLLATE pg_catalog."default",
    importe text COLLATE pg_catalog."default",
    num_certif text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	cod_seg text,
	concepto text, 
	importe text,
	num_certif text
	)) ;


DO $$
DECLARE sql TEXT;
BEGIN
    SELECT CASE 
            WHEN (select 1 from stage_d_aplicado5 WHERE importe ~ '^[^0-9]+$' limit 1) = 1
                THEN 'DROP TABLE stage_d_aplicado5;'
            ELSE 'INSERT INTO bmem.op_retenciones(id , concepto , importe , num_certif , doc_id , fecha_emision , cliente , periodo ) (WITH t AS (select x::json->''documents''->0->''fields''->''CustomerName''->>''content'' as cliente,
				x::json->''documents''->0->''fields''->''InvoiceId''->>''content'' as doc_id, 
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') as fecha_emision,
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') - interval ''2 months'' as periodo
from stage_op)
SELECT id, 
		TRANSLATE(concepto, ''_'', '''') AS concepto, 
		((REPLACE(TRANSLATE(importe, ''.-_$ '', ''''), '','', ''.''))::numeric *-1)  as importe,
		TRANSLATE(num_certif, ''_'', '''') AS num_certif,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;'
            END AS qry
    INTO sql
    FROM stage_d_aplicado5 limit 1;
    EXECUTE (sql);
END $$;

--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------

ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

DROP TABLE IF EXISTS stage_op;
DROP TABLE IF EXISTS stage_json_d_aplicado;


CREATE TEMP TABLE stage_json_d_aplicado 
  ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     json text 
  ); 
 
CREATE TEMP TABLE stage_op (x jsonb);
COPY stage_json_d_aplicado(json) FROM 'C:\Users\Administrador\GoesGreen SRL\I4 - AUTO\import\17.json' csv quote e'\x01' delimiter e'\x02';

INSERT INTO stage_op(x)
SELECT   string_agg( json ,e'\n' ORDER BY id)::jsonb 
FROM     stage_json_d_aplicado;


ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->0->'cells');

DELETE FROM  stage_d_aplicado2 WHERE id >= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE 'Total%');
DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%Neto%');
DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';

DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op'::regclass), 
     content2 text,
     columna text	  ); 


INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;

UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'fecha' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'comprobante' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'documento_int' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'importe_bruto' WHERE id = 4 ;
UPDATE stage_d_aplicado3 SET columna = 'importe_retenido' WHERE id = 5 ;
UPDATE stage_d_aplicado3 SET columna = 'importe_neto' WHERE id = 6 ;

ALTER SEQUENCE  bmem.rowname RESTART;


DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;


DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) = 6 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
    comprobante text COLLATE pg_catalog."default",
    documento_int text COLLATE pg_catalog."default",
    fecha text COLLATE pg_catalog."default",
    importe_bruto text COLLATE pg_catalog."default",
    importe_neto text COLLATE pg_catalog."default",
    importe_retenido text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	comprobante text, 
	documento_int text,
	fecha text, 
	importe_bruto text,	
	importe_neto text,
	importe_retenido text
	));


INSERT INTO bmem.op_detalle_de_aplicado (WITH t AS (select x::json->'documents'->0->'fields'->'CustomerName'->>'content' as cliente,
				x::json->'documents'->0->'fields'->'InvoiceId'->>'content' as doc_id, 
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') as fecha_emision,
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') - interval '2 months' as periodo
from stage_op)
SELECT id, REPLACE(comprobante, '_', '') AS comprobante, REPLACE(documento_int, '_', '') AS documento_int, 
						TO_DATE(REPLACE(fecha, '_', ''), 'DD.MM.YYYY') AS fecha, 
						CASE WHEN importe_bruto LIKE '%-%' THEN ((REPLACE(REPLACE(TRANSLATE(importe_bruto, ' ._', ''), ',', '.'), '-', ''))::numeric *-1) ELSE (REPLACE(TRANSLATE(importe_bruto, ' ._', ''), ',', '.'))::numeric END AS importe_bruto, 
						CASE WHEN REPLACE(REPLACE(importe_neto, '$', ''), '_', '') LIKE '%-%' THEN ((REPLACE(REPLACE(TRANSLATE(importe_neto, ' _.$', ''), ',', '.'), '-', ''))::numeric *-1) ELSE (REPLACE(REPLACE(TRANSLATE(importe_neto, ' _.$', ''), ',', '.'), '-', '')::numeric) END AS importe_neto,
						CASE WHEN importe_retenido LIKE '%-%' THEN ((REPLACE(REPLACE(TRANSLATE(importe_retenido, ' .$_', ''), ',', '.'), '-', ''))::numeric *-1) ELSE (REPLACE(TRANSLATE(importe_retenido, ' .$_', ''), ',', '.'))::numeric END AS importe_retenido,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;

--------------------------------------------------
ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_pago RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->1->'cells');


DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%porte%');DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';

DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op_pago'::regclass), 
     content2 text,
     columna text	  ); 


INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;
UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'concepto' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'banco' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'cuenta_banc' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'cheque' WHERE id = 4 ;
UPDATE stage_d_aplicado3 SET columna = 'importe' WHERE id = 5 ;

ALTER SEQUENCE  bmem.rowname RESTART;

DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;



DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;

insert into stage_d_aplicado4 
select id, content2, 'importe' FROM stage_d_aplicado4 WHERE columna = 'cheque'
AND not exists (
    select id from stage_d_aplicado4 where columna = 'importe'
);


UPDATE stage_d_aplicado4 SET content2 = null WHERE columna = 'cheque';

DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) = 5 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
    banco text COLLATE pg_catalog."default",
    cuenta_banc text COLLATE pg_catalog."default",
    concepto text COLLATE pg_catalog."default",
    cheque text COLLATE pg_catalog."default",
    importe text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	concepto text, 
	banco text,
	cuenta_banc text, 
	cheque text,	
	importe text
	));

UPDATE stage_d_aplicado5 SET cheque = null;


INSERT INTO bmem.op_detalle_de_pago (WITH t AS (select x::json->'documents'->0->'fields'->'CustomerName'->>'content' as cliente,
				x::json->'documents'->0->'fields'->'InvoiceId'->>'content' as doc_id, 
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') as fecha_emision,
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') - interval '2 months' as periodo
from stage_op)
SELECT id, 
		TRANSLATE(banco, '_0123456789', '') AS banco, 
		regexp_replace(banco, '\D','','g') as cuenta_banc,
		concepto,
		(REPLACE(TRANSLATE(cheque, '._$ ', ''), ',', '.'))::numeric  as cheque,
		(REPLACE(TRANSLATE(importe, '._$ ', ''), ',', '.'))::numeric  as importe,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;
						
--------------------------------------------------------------------------------------------------------------

ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones2 RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->2->'cells');


DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%porte%');DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';


DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op_retenciones'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;
UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'concepto' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'num_certif' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'cod_seg' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'importe' WHERE id = 4 ;

ALTER SEQUENCE  bmem.rowname RESTART;

DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;

insert into stage_d_aplicado4 
select id, content2, 'importe' FROM stage_d_aplicado4 WHERE columna = 'cod_seg'
AND not exists (
    select id from stage_d_aplicado4 where columna = 'importe'
);

UPDATE stage_d_aplicado4 SET content2 = null WHERE columna = 'cod_seg';UPDATE stage_d_aplicado4 SET content2 = ((RIGHT(content2, -5))) WHERE content2 like '____% % %$';

DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) <= 4 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
	cod_seg text,
    concepto text COLLATE pg_catalog."default",
    importe text COLLATE pg_catalog."default",
    num_certif text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	cod_seg text,
	concepto text, 
	importe text,
	num_certif text
	)) ;


DO $$
DECLARE sql TEXT;
BEGIN
    SELECT CASE 
            WHEN (select 1 from stage_d_aplicado5 WHERE importe ~ '^[^0-9]+$' limit 1) = 1
                THEN 'DROP TABLE stage_d_aplicado5;'
            ELSE 'INSERT INTO bmem.op_retenciones(id , concepto , importe , num_certif , doc_id , fecha_emision , cliente , periodo ) (WITH t AS (select x::json->''documents''->0->''fields''->''CustomerName''->>''content'' as cliente,
				x::json->''documents''->0->''fields''->''InvoiceId''->>''content'' as doc_id, 
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') as fecha_emision,
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') - interval ''2 months'' as periodo
from stage_op)
SELECT id, 
		TRANSLATE(concepto, ''_'', '''') AS concepto, 
		((REPLACE(TRANSLATE(importe, ''.-_$ '', ''''), '','', ''.''))::numeric *-1)  as importe,
		TRANSLATE(num_certif, ''_'', '''') AS num_certif,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;'
            END AS qry
    INTO sql
    FROM stage_d_aplicado5 limit 1;
    EXECUTE (sql);
END $$;
------------------------------------------------------------
DELETE from bmem.op_retenciones WHERE concepto NOT like '%MEM%'; DELETE FROM bmem.op_retenciones WHERE importe < -9999999999;
------------------------------------------------------------
ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones2 RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->2->'cells');


DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%porte%');DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';


DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op_retenciones2'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;
UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'concepto' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'num_certif' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'cod_seg' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'importe' WHERE id = 4 ;

ALTER SEQUENCE  bmem.rowname RESTART;

DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;

insert into stage_d_aplicado4 
select id, content2, 'importe' FROM stage_d_aplicado4 WHERE columna = 'cod_seg'
AND not exists (
    select id from stage_d_aplicado4 where columna = 'importe'
);

UPDATE stage_d_aplicado4 SET content2 = null WHERE columna = 'cod_seg';UPDATE stage_d_aplicado4 SET content2 = ((RIGHT(content2, -5))) WHERE content2 like '____% % %$';

DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) <= 4 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
	cod_seg text,
    concepto text COLLATE pg_catalog."default",
    importe text COLLATE pg_catalog."default",
    num_certif text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	cod_seg text,
	concepto text, 
	importe text,
	num_certif text
	)) ;


DO $$
DECLARE sql TEXT;
BEGIN
    SELECT CASE 
            WHEN (select 1 from stage_d_aplicado5 WHERE importe ~ '^[^0-9]+$' limit 1) = 1
                THEN 'DROP TABLE stage_d_aplicado5;'
            ELSE 'INSERT INTO bmem.op_retenciones(id , concepto , importe , num_certif , doc_id , fecha_emision , cliente , periodo ) (WITH t AS (select x::json->''documents''->0->''fields''->''CustomerName''->>''content'' as cliente,
				x::json->''documents''->0->''fields''->''InvoiceId''->>''content'' as doc_id, 
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') as fecha_emision,
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') - interval ''2 months'' as periodo
from stage_op)
SELECT id, 
		TRANSLATE(concepto, ''_'', '''') AS concepto, 
		((REPLACE(TRANSLATE(importe, ''.-_$ '', ''''), '','', ''.''))::numeric *-1)  as importe,
		TRANSLATE(num_certif, ''_'', '''') AS num_certif,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;'
            END AS qry
    INTO sql
    FROM stage_d_aplicado5 limit 1;
    EXECUTE (sql);
END $$;

--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------

ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

DROP TABLE IF EXISTS stage_op;
DROP TABLE IF EXISTS stage_json_d_aplicado;


CREATE TEMP TABLE stage_json_d_aplicado 
  ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     json text 
  ); 
 
CREATE TEMP TABLE stage_op (x jsonb);
COPY stage_json_d_aplicado(json) FROM 'C:\Users\Administrador\GoesGreen SRL\I4 - AUTO\import\18.json' csv quote e'\x01' delimiter e'\x02';

INSERT INTO stage_op(x)
SELECT   string_agg( json ,e'\n' ORDER BY id)::jsonb 
FROM     stage_json_d_aplicado;


ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->0->'cells');

DELETE FROM  stage_d_aplicado2 WHERE id >= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE 'Total%');
DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%Neto%');
DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';

DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op'::regclass), 
     content2 text,
     columna text	  ); 


INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;

UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'fecha' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'comprobante' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'documento_int' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'importe_bruto' WHERE id = 4 ;
UPDATE stage_d_aplicado3 SET columna = 'importe_retenido' WHERE id = 5 ;
UPDATE stage_d_aplicado3 SET columna = 'importe_neto' WHERE id = 6 ;

ALTER SEQUENCE  bmem.rowname RESTART;


DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;


DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) = 6 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
    comprobante text COLLATE pg_catalog."default",
    documento_int text COLLATE pg_catalog."default",
    fecha text COLLATE pg_catalog."default",
    importe_bruto text COLLATE pg_catalog."default",
    importe_neto text COLLATE pg_catalog."default",
    importe_retenido text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	comprobante text, 
	documento_int text,
	fecha text, 
	importe_bruto text,	
	importe_neto text,
	importe_retenido text
	));


INSERT INTO bmem.op_detalle_de_aplicado (WITH t AS (select x::json->'documents'->0->'fields'->'CustomerName'->>'content' as cliente,
				x::json->'documents'->0->'fields'->'InvoiceId'->>'content' as doc_id, 
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') as fecha_emision,
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') - interval '2 months' as periodo
from stage_op)
SELECT id, REPLACE(comprobante, '_', '') AS comprobante, REPLACE(documento_int, '_', '') AS documento_int, 
						TO_DATE(REPLACE(fecha, '_', ''), 'DD.MM.YYYY') AS fecha, 
						CASE WHEN importe_bruto LIKE '%-%' THEN ((REPLACE(REPLACE(TRANSLATE(importe_bruto, ' ._', ''), ',', '.'), '-', ''))::numeric *-1) ELSE (REPLACE(TRANSLATE(importe_bruto, ' ._', ''), ',', '.'))::numeric END AS importe_bruto, 
						CASE WHEN REPLACE(REPLACE(importe_neto, '$', ''), '_', '') LIKE '%-%' THEN ((REPLACE(REPLACE(TRANSLATE(importe_neto, ' _.$', ''), ',', '.'), '-', ''))::numeric *-1) ELSE (REPLACE(REPLACE(TRANSLATE(importe_neto, ' _.$', ''), ',', '.'), '-', '')::numeric) END AS importe_neto,
						CASE WHEN importe_retenido LIKE '%-%' THEN ((REPLACE(REPLACE(TRANSLATE(importe_retenido, ' .$_', ''), ',', '.'), '-', ''))::numeric *-1) ELSE (REPLACE(TRANSLATE(importe_retenido, ' .$_', ''), ',', '.'))::numeric END AS importe_retenido,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;

--------------------------------------------------
ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_pago RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->1->'cells');


DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%porte%');DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';

DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op_pago'::regclass), 
     content2 text,
     columna text	  ); 


INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;
UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'concepto' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'banco' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'cuenta_banc' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'cheque' WHERE id = 4 ;
UPDATE stage_d_aplicado3 SET columna = 'importe' WHERE id = 5 ;

ALTER SEQUENCE  bmem.rowname RESTART;

DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;



DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;

insert into stage_d_aplicado4 
select id, content2, 'importe' FROM stage_d_aplicado4 WHERE columna = 'cheque'
AND not exists (
    select id from stage_d_aplicado4 where columna = 'importe'
);


UPDATE stage_d_aplicado4 SET content2 = null WHERE columna = 'cheque';

DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) = 5 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
    banco text COLLATE pg_catalog."default",
    cuenta_banc text COLLATE pg_catalog."default",
    concepto text COLLATE pg_catalog."default",
    cheque text COLLATE pg_catalog."default",
    importe text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	concepto text, 
	banco text,
	cuenta_banc text, 
	cheque text,	
	importe text
	));

UPDATE stage_d_aplicado5 SET cheque = null;


INSERT INTO bmem.op_detalle_de_pago (WITH t AS (select x::json->'documents'->0->'fields'->'CustomerName'->>'content' as cliente,
				x::json->'documents'->0->'fields'->'InvoiceId'->>'content' as doc_id, 
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') as fecha_emision,
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') - interval '2 months' as periodo
from stage_op)
SELECT id, 
		TRANSLATE(banco, '_0123456789', '') AS banco, 
		regexp_replace(banco, '\D','','g') as cuenta_banc,
		concepto,
		(REPLACE(TRANSLATE(cheque, '._$ ', ''), ',', '.'))::numeric  as cheque,
		(REPLACE(TRANSLATE(importe, '._$ ', ''), ',', '.'))::numeric  as importe,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;
						
--------------------------------------------------------------------------------------------------------------

ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones2 RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->2->'cells');


DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%porte%');DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';


DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op_retenciones'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;
UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'concepto' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'num_certif' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'cod_seg' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'importe' WHERE id = 4 ;

ALTER SEQUENCE  bmem.rowname RESTART;

DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;

insert into stage_d_aplicado4 
select id, content2, 'importe' FROM stage_d_aplicado4 WHERE columna = 'cod_seg'
AND not exists (
    select id from stage_d_aplicado4 where columna = 'importe'
);

UPDATE stage_d_aplicado4 SET content2 = null WHERE columna = 'cod_seg';UPDATE stage_d_aplicado4 SET content2 = ((RIGHT(content2, -5))) WHERE content2 like '____% % %$';

DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) <= 4 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
	cod_seg text,
    concepto text COLLATE pg_catalog."default",
    importe text COLLATE pg_catalog."default",
    num_certif text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	cod_seg text,
	concepto text, 
	importe text,
	num_certif text
	)) ;


DO $$
DECLARE sql TEXT;
BEGIN
    SELECT CASE 
            WHEN (select 1 from stage_d_aplicado5 WHERE importe ~ '^[^0-9]+$' limit 1) = 1
                THEN 'DROP TABLE stage_d_aplicado5;'
            ELSE 'INSERT INTO bmem.op_retenciones(id , concepto , importe , num_certif , doc_id , fecha_emision , cliente , periodo ) (WITH t AS (select x::json->''documents''->0->''fields''->''CustomerName''->>''content'' as cliente,
				x::json->''documents''->0->''fields''->''InvoiceId''->>''content'' as doc_id, 
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') as fecha_emision,
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') - interval ''2 months'' as periodo
from stage_op)
SELECT id, 
		TRANSLATE(concepto, ''_'', '''') AS concepto, 
		((REPLACE(TRANSLATE(importe, ''.-_$ '', ''''), '','', ''.''))::numeric *-1)  as importe,
		TRANSLATE(num_certif, ''_'', '''') AS num_certif,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;'
            END AS qry
    INTO sql
    FROM stage_d_aplicado5 limit 1;
    EXECUTE (sql);
END $$;
------------------------------------------------------------
DELETE from bmem.op_retenciones WHERE concepto NOT like '%MEM%'; DELETE FROM bmem.op_retenciones WHERE importe < -9999999999;
------------------------------------------------------------
ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones2 RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->2->'cells');


DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%porte%');DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';


DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op_retenciones2'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;
UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'concepto' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'num_certif' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'cod_seg' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'importe' WHERE id = 4 ;

ALTER SEQUENCE  bmem.rowname RESTART;

DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;

insert into stage_d_aplicado4 
select id, content2, 'importe' FROM stage_d_aplicado4 WHERE columna = 'cod_seg'
AND not exists (
    select id from stage_d_aplicado4 where columna = 'importe'
);

UPDATE stage_d_aplicado4 SET content2 = null WHERE columna = 'cod_seg';UPDATE stage_d_aplicado4 SET content2 = ((RIGHT(content2, -5))) WHERE content2 like '____% % %$';

DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) <= 4 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
	cod_seg text,
    concepto text COLLATE pg_catalog."default",
    importe text COLLATE pg_catalog."default",
    num_certif text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	cod_seg text,
	concepto text, 
	importe text,
	num_certif text
	)) ;


DO $$
DECLARE sql TEXT;
BEGIN
    SELECT CASE 
            WHEN (select 1 from stage_d_aplicado5 WHERE importe ~ '^[^0-9]+$' limit 1) = 1
                THEN 'DROP TABLE stage_d_aplicado5;'
            ELSE 'INSERT INTO bmem.op_retenciones(id , concepto , importe , num_certif , doc_id , fecha_emision , cliente , periodo ) (WITH t AS (select x::json->''documents''->0->''fields''->''CustomerName''->>''content'' as cliente,
				x::json->''documents''->0->''fields''->''InvoiceId''->>''content'' as doc_id, 
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') as fecha_emision,
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') - interval ''2 months'' as periodo
from stage_op)
SELECT id, 
		TRANSLATE(concepto, ''_'', '''') AS concepto, 
		((REPLACE(TRANSLATE(importe, ''.-_$ '', ''''), '','', ''.''))::numeric *-1)  as importe,
		TRANSLATE(num_certif, ''_'', '''') AS num_certif,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;'
            END AS qry
    INTO sql
    FROM stage_d_aplicado5 limit 1;
    EXECUTE (sql);
END $$;

--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------

ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

DROP TABLE IF EXISTS stage_op;
DROP TABLE IF EXISTS stage_json_d_aplicado;


CREATE TEMP TABLE stage_json_d_aplicado 
  ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     json text 
  ); 
 
CREATE TEMP TABLE stage_op (x jsonb);
COPY stage_json_d_aplicado(json) FROM 'C:\Users\Administrador\GoesGreen SRL\I4 - AUTO\import\19.json' csv quote e'\x01' delimiter e'\x02';

INSERT INTO stage_op(x)
SELECT   string_agg( json ,e'\n' ORDER BY id)::jsonb 
FROM     stage_json_d_aplicado;


ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->0->'cells');

DELETE FROM  stage_d_aplicado2 WHERE id >= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE 'Total%');
DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%Neto%');
DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';

DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op'::regclass), 
     content2 text,
     columna text	  ); 


INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;

UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'fecha' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'comprobante' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'documento_int' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'importe_bruto' WHERE id = 4 ;
UPDATE stage_d_aplicado3 SET columna = 'importe_retenido' WHERE id = 5 ;
UPDATE stage_d_aplicado3 SET columna = 'importe_neto' WHERE id = 6 ;

ALTER SEQUENCE  bmem.rowname RESTART;


DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;


DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) = 6 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
    comprobante text COLLATE pg_catalog."default",
    documento_int text COLLATE pg_catalog."default",
    fecha text COLLATE pg_catalog."default",
    importe_bruto text COLLATE pg_catalog."default",
    importe_neto text COLLATE pg_catalog."default",
    importe_retenido text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	comprobante text, 
	documento_int text,
	fecha text, 
	importe_bruto text,	
	importe_neto text,
	importe_retenido text
	));


INSERT INTO bmem.op_detalle_de_aplicado (WITH t AS (select x::json->'documents'->0->'fields'->'CustomerName'->>'content' as cliente,
				x::json->'documents'->0->'fields'->'InvoiceId'->>'content' as doc_id, 
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') as fecha_emision,
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') - interval '2 months' as periodo
from stage_op)
SELECT id, REPLACE(comprobante, '_', '') AS comprobante, REPLACE(documento_int, '_', '') AS documento_int, 
						TO_DATE(REPLACE(fecha, '_', ''), 'DD.MM.YYYY') AS fecha, 
						CASE WHEN importe_bruto LIKE '%-%' THEN ((REPLACE(REPLACE(TRANSLATE(importe_bruto, ' ._', ''), ',', '.'), '-', ''))::numeric *-1) ELSE (REPLACE(TRANSLATE(importe_bruto, ' ._', ''), ',', '.'))::numeric END AS importe_bruto, 
						CASE WHEN REPLACE(REPLACE(importe_neto, '$', ''), '_', '') LIKE '%-%' THEN ((REPLACE(REPLACE(TRANSLATE(importe_neto, ' _.$', ''), ',', '.'), '-', ''))::numeric *-1) ELSE (REPLACE(REPLACE(TRANSLATE(importe_neto, ' _.$', ''), ',', '.'), '-', '')::numeric) END AS importe_neto,
						CASE WHEN importe_retenido LIKE '%-%' THEN ((REPLACE(REPLACE(TRANSLATE(importe_retenido, ' .$_', ''), ',', '.'), '-', ''))::numeric *-1) ELSE (REPLACE(TRANSLATE(importe_retenido, ' .$_', ''), ',', '.'))::numeric END AS importe_retenido,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;

--------------------------------------------------
ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_pago RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->1->'cells');


DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%porte%');DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';

DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op_pago'::regclass), 
     content2 text,
     columna text	  ); 


INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;
UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'concepto' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'banco' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'cuenta_banc' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'cheque' WHERE id = 4 ;
UPDATE stage_d_aplicado3 SET columna = 'importe' WHERE id = 5 ;

ALTER SEQUENCE  bmem.rowname RESTART;

DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;



DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;

insert into stage_d_aplicado4 
select id, content2, 'importe' FROM stage_d_aplicado4 WHERE columna = 'cheque'
AND not exists (
    select id from stage_d_aplicado4 where columna = 'importe'
);


UPDATE stage_d_aplicado4 SET content2 = null WHERE columna = 'cheque';

DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) = 5 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
    banco text COLLATE pg_catalog."default",
    cuenta_banc text COLLATE pg_catalog."default",
    concepto text COLLATE pg_catalog."default",
    cheque text COLLATE pg_catalog."default",
    importe text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	concepto text, 
	banco text,
	cuenta_banc text, 
	cheque text,	
	importe text
	));

UPDATE stage_d_aplicado5 SET cheque = null;


INSERT INTO bmem.op_detalle_de_pago (WITH t AS (select x::json->'documents'->0->'fields'->'CustomerName'->>'content' as cliente,
				x::json->'documents'->0->'fields'->'InvoiceId'->>'content' as doc_id, 
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') as fecha_emision,
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') - interval '2 months' as periodo
from stage_op)
SELECT id, 
		TRANSLATE(banco, '_0123456789', '') AS banco, 
		regexp_replace(banco, '\D','','g') as cuenta_banc,
		concepto,
		(REPLACE(TRANSLATE(cheque, '._$ ', ''), ',', '.'))::numeric  as cheque,
		(REPLACE(TRANSLATE(importe, '._$ ', ''), ',', '.'))::numeric  as importe,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;
						
--------------------------------------------------------------------------------------------------------------

ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones2 RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->2->'cells');


DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%porte%');DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';


DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op_retenciones'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;
UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'concepto' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'num_certif' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'cod_seg' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'importe' WHERE id = 4 ;

ALTER SEQUENCE  bmem.rowname RESTART;

DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;

insert into stage_d_aplicado4 
select id, content2, 'importe' FROM stage_d_aplicado4 WHERE columna = 'cod_seg'
AND not exists (
    select id from stage_d_aplicado4 where columna = 'importe'
);

UPDATE stage_d_aplicado4 SET content2 = null WHERE columna = 'cod_seg';UPDATE stage_d_aplicado4 SET content2 = ((RIGHT(content2, -5))) WHERE content2 like '____% % %$';

DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) <= 4 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
	cod_seg text,
    concepto text COLLATE pg_catalog."default",
    importe text COLLATE pg_catalog."default",
    num_certif text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	cod_seg text,
	concepto text, 
	importe text,
	num_certif text
	)) ;


DO $$
DECLARE sql TEXT;
BEGIN
    SELECT CASE 
            WHEN (select 1 from stage_d_aplicado5 WHERE importe ~ '^[^0-9]+$' limit 1) = 1
                THEN 'DROP TABLE stage_d_aplicado5;'
            ELSE 'INSERT INTO bmem.op_retenciones(id , concepto , importe , num_certif , doc_id , fecha_emision , cliente , periodo ) (WITH t AS (select x::json->''documents''->0->''fields''->''CustomerName''->>''content'' as cliente,
				x::json->''documents''->0->''fields''->''InvoiceId''->>''content'' as doc_id, 
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') as fecha_emision,
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') - interval ''2 months'' as periodo
from stage_op)
SELECT id, 
		TRANSLATE(concepto, ''_'', '''') AS concepto, 
		((REPLACE(TRANSLATE(importe, ''.-_$ '', ''''), '','', ''.''))::numeric *-1)  as importe,
		TRANSLATE(num_certif, ''_'', '''') AS num_certif,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;'
            END AS qry
    INTO sql
    FROM stage_d_aplicado5 limit 1;
    EXECUTE (sql);
END $$;
------------------------------------------------------------
DELETE from bmem.op_retenciones WHERE concepto NOT like '%MEM%'; DELETE FROM bmem.op_retenciones WHERE importe < -9999999999;
------------------------------------------------------------
ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones2 RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->2->'cells');


DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%porte%');DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';


DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op_retenciones2'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;
UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'concepto' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'num_certif' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'cod_seg' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'importe' WHERE id = 4 ;

ALTER SEQUENCE  bmem.rowname RESTART;

DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;

insert into stage_d_aplicado4 
select id, content2, 'importe' FROM stage_d_aplicado4 WHERE columna = 'cod_seg'
AND not exists (
    select id from stage_d_aplicado4 where columna = 'importe'
);

UPDATE stage_d_aplicado4 SET content2 = null WHERE columna = 'cod_seg';UPDATE stage_d_aplicado4 SET content2 = ((RIGHT(content2, -5))) WHERE content2 like '____% % %$';

DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) <= 4 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
	cod_seg text,
    concepto text COLLATE pg_catalog."default",
    importe text COLLATE pg_catalog."default",
    num_certif text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	cod_seg text,
	concepto text, 
	importe text,
	num_certif text
	)) ;


DO $$
DECLARE sql TEXT;
BEGIN
    SELECT CASE 
            WHEN (select 1 from stage_d_aplicado5 WHERE importe ~ '^[^0-9]+$' limit 1) = 1
                THEN 'DROP TABLE stage_d_aplicado5;'
            ELSE 'INSERT INTO bmem.op_retenciones(id , concepto , importe , num_certif , doc_id , fecha_emision , cliente , periodo ) (WITH t AS (select x::json->''documents''->0->''fields''->''CustomerName''->>''content'' as cliente,
				x::json->''documents''->0->''fields''->''InvoiceId''->>''content'' as doc_id, 
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') as fecha_emision,
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') - interval ''2 months'' as periodo
from stage_op)
SELECT id, 
		TRANSLATE(concepto, ''_'', '''') AS concepto, 
		((REPLACE(TRANSLATE(importe, ''.-_$ '', ''''), '','', ''.''))::numeric *-1)  as importe,
		TRANSLATE(num_certif, ''_'', '''') AS num_certif,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;'
            END AS qry
    INTO sql
    FROM stage_d_aplicado5 limit 1;
    EXECUTE (sql);
END $$;

--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------

ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

DROP TABLE IF EXISTS stage_op;
DROP TABLE IF EXISTS stage_json_d_aplicado;


CREATE TEMP TABLE stage_json_d_aplicado 
  ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     json text 
  ); 
 
CREATE TEMP TABLE stage_op (x jsonb);
COPY stage_json_d_aplicado(json) FROM 'C:\Users\Administrador\GoesGreen SRL\I4 - AUTO\import\20.json' csv quote e'\x01' delimiter e'\x02';

INSERT INTO stage_op(x)
SELECT   string_agg( json ,e'\n' ORDER BY id)::jsonb 
FROM     stage_json_d_aplicado;


ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->0->'cells');

DELETE FROM  stage_d_aplicado2 WHERE id >= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE 'Total%');
DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%Neto%');
DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';

DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op'::regclass), 
     content2 text,
     columna text	  ); 


INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;

UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'fecha' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'comprobante' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'documento_int' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'importe_bruto' WHERE id = 4 ;
UPDATE stage_d_aplicado3 SET columna = 'importe_retenido' WHERE id = 5 ;
UPDATE stage_d_aplicado3 SET columna = 'importe_neto' WHERE id = 6 ;

ALTER SEQUENCE  bmem.rowname RESTART;


DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;


DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) = 6 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
    comprobante text COLLATE pg_catalog."default",
    documento_int text COLLATE pg_catalog."default",
    fecha text COLLATE pg_catalog."default",
    importe_bruto text COLLATE pg_catalog."default",
    importe_neto text COLLATE pg_catalog."default",
    importe_retenido text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	comprobante text, 
	documento_int text,
	fecha text, 
	importe_bruto text,	
	importe_neto text,
	importe_retenido text
	));


INSERT INTO bmem.op_detalle_de_aplicado (WITH t AS (select x::json->'documents'->0->'fields'->'CustomerName'->>'content' as cliente,
				x::json->'documents'->0->'fields'->'InvoiceId'->>'content' as doc_id, 
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') as fecha_emision,
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') - interval '2 months' as periodo
from stage_op)
SELECT id, REPLACE(comprobante, '_', '') AS comprobante, REPLACE(documento_int, '_', '') AS documento_int, 
						TO_DATE(REPLACE(fecha, '_', ''), 'DD.MM.YYYY') AS fecha, 
						CASE WHEN importe_bruto LIKE '%-%' THEN ((REPLACE(REPLACE(TRANSLATE(importe_bruto, ' ._', ''), ',', '.'), '-', ''))::numeric *-1) ELSE (REPLACE(TRANSLATE(importe_bruto, ' ._', ''), ',', '.'))::numeric END AS importe_bruto, 
						CASE WHEN REPLACE(REPLACE(importe_neto, '$', ''), '_', '') LIKE '%-%' THEN ((REPLACE(REPLACE(TRANSLATE(importe_neto, ' _.$', ''), ',', '.'), '-', ''))::numeric *-1) ELSE (REPLACE(REPLACE(TRANSLATE(importe_neto, ' _.$', ''), ',', '.'), '-', '')::numeric) END AS importe_neto,
						CASE WHEN importe_retenido LIKE '%-%' THEN ((REPLACE(REPLACE(TRANSLATE(importe_retenido, ' .$_', ''), ',', '.'), '-', ''))::numeric *-1) ELSE (REPLACE(TRANSLATE(importe_retenido, ' .$_', ''), ',', '.'))::numeric END AS importe_retenido,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;

--------------------------------------------------
ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_pago RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->1->'cells');


DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%porte%');DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';

DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op_pago'::regclass), 
     content2 text,
     columna text	  ); 


INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;
UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'concepto' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'banco' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'cuenta_banc' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'cheque' WHERE id = 4 ;
UPDATE stage_d_aplicado3 SET columna = 'importe' WHERE id = 5 ;

ALTER SEQUENCE  bmem.rowname RESTART;

DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;



DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;

insert into stage_d_aplicado4 
select id, content2, 'importe' FROM stage_d_aplicado4 WHERE columna = 'cheque'
AND not exists (
    select id from stage_d_aplicado4 where columna = 'importe'
);


UPDATE stage_d_aplicado4 SET content2 = null WHERE columna = 'cheque';

DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) = 5 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
    banco text COLLATE pg_catalog."default",
    cuenta_banc text COLLATE pg_catalog."default",
    concepto text COLLATE pg_catalog."default",
    cheque text COLLATE pg_catalog."default",
    importe text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	concepto text, 
	banco text,
	cuenta_banc text, 
	cheque text,	
	importe text
	));

UPDATE stage_d_aplicado5 SET cheque = null;


INSERT INTO bmem.op_detalle_de_pago (WITH t AS (select x::json->'documents'->0->'fields'->'CustomerName'->>'content' as cliente,
				x::json->'documents'->0->'fields'->'InvoiceId'->>'content' as doc_id, 
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') as fecha_emision,
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') - interval '2 months' as periodo
from stage_op)
SELECT id, 
		TRANSLATE(banco, '_0123456789', '') AS banco, 
		regexp_replace(banco, '\D','','g') as cuenta_banc,
		concepto,
		(REPLACE(TRANSLATE(cheque, '._$ ', ''), ',', '.'))::numeric  as cheque,
		(REPLACE(TRANSLATE(importe, '._$ ', ''), ',', '.'))::numeric  as importe,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;
						
--------------------------------------------------------------------------------------------------------------

ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones2 RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->2->'cells');


DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%porte%');DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';


DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op_retenciones'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;
UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'concepto' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'num_certif' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'cod_seg' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'importe' WHERE id = 4 ;

ALTER SEQUENCE  bmem.rowname RESTART;

DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;

insert into stage_d_aplicado4 
select id, content2, 'importe' FROM stage_d_aplicado4 WHERE columna = 'cod_seg'
AND not exists (
    select id from stage_d_aplicado4 where columna = 'importe'
);

UPDATE stage_d_aplicado4 SET content2 = null WHERE columna = 'cod_seg';UPDATE stage_d_aplicado4 SET content2 = ((RIGHT(content2, -5))) WHERE content2 like '____% % %$';

DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) <= 4 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
	cod_seg text,
    concepto text COLLATE pg_catalog."default",
    importe text COLLATE pg_catalog."default",
    num_certif text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	cod_seg text,
	concepto text, 
	importe text,
	num_certif text
	)) ;


DO $$
DECLARE sql TEXT;
BEGIN
    SELECT CASE 
            WHEN (select 1 from stage_d_aplicado5 WHERE importe ~ '^[^0-9]+$' limit 1) = 1
                THEN 'DROP TABLE stage_d_aplicado5;'
            ELSE 'INSERT INTO bmem.op_retenciones(id , concepto , importe , num_certif , doc_id , fecha_emision , cliente , periodo ) (WITH t AS (select x::json->''documents''->0->''fields''->''CustomerName''->>''content'' as cliente,
				x::json->''documents''->0->''fields''->''InvoiceId''->>''content'' as doc_id, 
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') as fecha_emision,
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') - interval ''2 months'' as periodo
from stage_op)
SELECT id, 
		TRANSLATE(concepto, ''_'', '''') AS concepto, 
		((REPLACE(TRANSLATE(importe, ''.-_$ '', ''''), '','', ''.''))::numeric *-1)  as importe,
		TRANSLATE(num_certif, ''_'', '''') AS num_certif,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;'
            END AS qry
    INTO sql
    FROM stage_d_aplicado5 limit 1;
    EXECUTE (sql);
END $$;
------------------------------------------------------------
DELETE from bmem.op_retenciones WHERE concepto NOT like '%MEM%'; DELETE FROM bmem.op_retenciones WHERE importe < -9999999999;
------------------------------------------------------------
ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones2 RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->2->'cells');


DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%porte%');DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';


DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op_retenciones2'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;
UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'concepto' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'num_certif' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'cod_seg' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'importe' WHERE id = 4 ;

ALTER SEQUENCE  bmem.rowname RESTART;

DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;

insert into stage_d_aplicado4 
select id, content2, 'importe' FROM stage_d_aplicado4 WHERE columna = 'cod_seg'
AND not exists (
    select id from stage_d_aplicado4 where columna = 'importe'
);

UPDATE stage_d_aplicado4 SET content2 = null WHERE columna = 'cod_seg';UPDATE stage_d_aplicado4 SET content2 = ((RIGHT(content2, -5))) WHERE content2 like '____% % %$';

DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) <= 4 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
	cod_seg text,
    concepto text COLLATE pg_catalog."default",
    importe text COLLATE pg_catalog."default",
    num_certif text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	cod_seg text,
	concepto text, 
	importe text,
	num_certif text
	)) ;


DO $$
DECLARE sql TEXT;
BEGIN
    SELECT CASE 
            WHEN (select 1 from stage_d_aplicado5 WHERE importe ~ '^[^0-9]+$' limit 1) = 1
                THEN 'DROP TABLE stage_d_aplicado5;'
            ELSE 'INSERT INTO bmem.op_retenciones(id , concepto , importe , num_certif , doc_id , fecha_emision , cliente , periodo ) (WITH t AS (select x::json->''documents''->0->''fields''->''CustomerName''->>''content'' as cliente,
				x::json->''documents''->0->''fields''->''InvoiceId''->>''content'' as doc_id, 
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') as fecha_emision,
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') - interval ''2 months'' as periodo
from stage_op)
SELECT id, 
		TRANSLATE(concepto, ''_'', '''') AS concepto, 
		((REPLACE(TRANSLATE(importe, ''.-_$ '', ''''), '','', ''.''))::numeric *-1)  as importe,
		TRANSLATE(num_certif, ''_'', '''') AS num_certif,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;'
            END AS qry
    INTO sql
    FROM stage_d_aplicado5 limit 1;
    EXECUTE (sql);
END $$;

--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------

ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

DROP TABLE IF EXISTS stage_op;
DROP TABLE IF EXISTS stage_json_d_aplicado;


CREATE TEMP TABLE stage_json_d_aplicado 
  ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     json text 
  ); 
 
CREATE TEMP TABLE stage_op (x jsonb);
COPY stage_json_d_aplicado(json) FROM 'C:\Users\Administrador\GoesGreen SRL\I4 - AUTO\import\21.json' csv quote e'\x01' delimiter e'\x02';

INSERT INTO stage_op(x)
SELECT   string_agg( json ,e'\n' ORDER BY id)::jsonb 
FROM     stage_json_d_aplicado;


ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->0->'cells');

DELETE FROM  stage_d_aplicado2 WHERE id >= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE 'Total%');
DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%Neto%');
DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';

DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op'::regclass), 
     content2 text,
     columna text	  ); 


INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;

UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'fecha' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'comprobante' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'documento_int' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'importe_bruto' WHERE id = 4 ;
UPDATE stage_d_aplicado3 SET columna = 'importe_retenido' WHERE id = 5 ;
UPDATE stage_d_aplicado3 SET columna = 'importe_neto' WHERE id = 6 ;

ALTER SEQUENCE  bmem.rowname RESTART;


DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;


DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) = 6 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
    comprobante text COLLATE pg_catalog."default",
    documento_int text COLLATE pg_catalog."default",
    fecha text COLLATE pg_catalog."default",
    importe_bruto text COLLATE pg_catalog."default",
    importe_neto text COLLATE pg_catalog."default",
    importe_retenido text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	comprobante text, 
	documento_int text,
	fecha text, 
	importe_bruto text,	
	importe_neto text,
	importe_retenido text
	));


INSERT INTO bmem.op_detalle_de_aplicado (WITH t AS (select x::json->'documents'->0->'fields'->'CustomerName'->>'content' as cliente,
				x::json->'documents'->0->'fields'->'InvoiceId'->>'content' as doc_id, 
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') as fecha_emision,
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') - interval '2 months' as periodo
from stage_op)
SELECT id, REPLACE(comprobante, '_', '') AS comprobante, REPLACE(documento_int, '_', '') AS documento_int, 
						TO_DATE(REPLACE(fecha, '_', ''), 'DD.MM.YYYY') AS fecha, 
						CASE WHEN importe_bruto LIKE '%-%' THEN ((REPLACE(REPLACE(TRANSLATE(importe_bruto, ' ._', ''), ',', '.'), '-', ''))::numeric *-1) ELSE (REPLACE(TRANSLATE(importe_bruto, ' ._', ''), ',', '.'))::numeric END AS importe_bruto, 
						CASE WHEN REPLACE(REPLACE(importe_neto, '$', ''), '_', '') LIKE '%-%' THEN ((REPLACE(REPLACE(TRANSLATE(importe_neto, ' _.$', ''), ',', '.'), '-', ''))::numeric *-1) ELSE (REPLACE(REPLACE(TRANSLATE(importe_neto, ' _.$', ''), ',', '.'), '-', '')::numeric) END AS importe_neto,
						CASE WHEN importe_retenido LIKE '%-%' THEN ((REPLACE(REPLACE(TRANSLATE(importe_retenido, ' .$_', ''), ',', '.'), '-', ''))::numeric *-1) ELSE (REPLACE(TRANSLATE(importe_retenido, ' .$_', ''), ',', '.'))::numeric END AS importe_retenido,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;

--------------------------------------------------
ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_pago RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->1->'cells');


DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%porte%');DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';

DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op_pago'::regclass), 
     content2 text,
     columna text	  ); 


INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;
UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'concepto' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'banco' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'cuenta_banc' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'cheque' WHERE id = 4 ;
UPDATE stage_d_aplicado3 SET columna = 'importe' WHERE id = 5 ;

ALTER SEQUENCE  bmem.rowname RESTART;

DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;



DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;

insert into stage_d_aplicado4 
select id, content2, 'importe' FROM stage_d_aplicado4 WHERE columna = 'cheque'
AND not exists (
    select id from stage_d_aplicado4 where columna = 'importe'
);


UPDATE stage_d_aplicado4 SET content2 = null WHERE columna = 'cheque';

DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) = 5 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
    banco text COLLATE pg_catalog."default",
    cuenta_banc text COLLATE pg_catalog."default",
    concepto text COLLATE pg_catalog."default",
    cheque text COLLATE pg_catalog."default",
    importe text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	concepto text, 
	banco text,
	cuenta_banc text, 
	cheque text,	
	importe text
	));

UPDATE stage_d_aplicado5 SET cheque = null;


INSERT INTO bmem.op_detalle_de_pago (WITH t AS (select x::json->'documents'->0->'fields'->'CustomerName'->>'content' as cliente,
				x::json->'documents'->0->'fields'->'InvoiceId'->>'content' as doc_id, 
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') as fecha_emision,
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') - interval '2 months' as periodo
from stage_op)
SELECT id, 
		TRANSLATE(banco, '_0123456789', '') AS banco, 
		regexp_replace(banco, '\D','','g') as cuenta_banc,
		concepto,
		(REPLACE(TRANSLATE(cheque, '._$ ', ''), ',', '.'))::numeric  as cheque,
		(REPLACE(TRANSLATE(importe, '._$ ', ''), ',', '.'))::numeric  as importe,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;
						
--------------------------------------------------------------------------------------------------------------

ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones2 RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->2->'cells');


DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%porte%');DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';


DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op_retenciones'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;
UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'concepto' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'num_certif' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'cod_seg' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'importe' WHERE id = 4 ;

ALTER SEQUENCE  bmem.rowname RESTART;

DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;

insert into stage_d_aplicado4 
select id, content2, 'importe' FROM stage_d_aplicado4 WHERE columna = 'cod_seg'
AND not exists (
    select id from stage_d_aplicado4 where columna = 'importe'
);

UPDATE stage_d_aplicado4 SET content2 = null WHERE columna = 'cod_seg';UPDATE stage_d_aplicado4 SET content2 = ((RIGHT(content2, -5))) WHERE content2 like '____% % %$';

DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) <= 4 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
	cod_seg text,
    concepto text COLLATE pg_catalog."default",
    importe text COLLATE pg_catalog."default",
    num_certif text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	cod_seg text,
	concepto text, 
	importe text,
	num_certif text
	)) ;


DO $$
DECLARE sql TEXT;
BEGIN
    SELECT CASE 
            WHEN (select 1 from stage_d_aplicado5 WHERE importe ~ '^[^0-9]+$' limit 1) = 1
                THEN 'DROP TABLE stage_d_aplicado5;'
            ELSE 'INSERT INTO bmem.op_retenciones(id , concepto , importe , num_certif , doc_id , fecha_emision , cliente , periodo ) (WITH t AS (select x::json->''documents''->0->''fields''->''CustomerName''->>''content'' as cliente,
				x::json->''documents''->0->''fields''->''InvoiceId''->>''content'' as doc_id, 
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') as fecha_emision,
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') - interval ''2 months'' as periodo
from stage_op)
SELECT id, 
		TRANSLATE(concepto, ''_'', '''') AS concepto, 
		((REPLACE(TRANSLATE(importe, ''.-_$ '', ''''), '','', ''.''))::numeric *-1)  as importe,
		TRANSLATE(num_certif, ''_'', '''') AS num_certif,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;'
            END AS qry
    INTO sql
    FROM stage_d_aplicado5 limit 1;
    EXECUTE (sql);
END $$;
------------------------------------------------------------
DELETE from bmem.op_retenciones WHERE concepto NOT like '%MEM%'; DELETE FROM bmem.op_retenciones WHERE importe < -9999999999;
------------------------------------------------------------
ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones2 RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->2->'cells');


DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%porte%');DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';


DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op_retenciones2'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;
UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'concepto' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'num_certif' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'cod_seg' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'importe' WHERE id = 4 ;

ALTER SEQUENCE  bmem.rowname RESTART;

DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;

insert into stage_d_aplicado4 
select id, content2, 'importe' FROM stage_d_aplicado4 WHERE columna = 'cod_seg'
AND not exists (
    select id from stage_d_aplicado4 where columna = 'importe'
);

UPDATE stage_d_aplicado4 SET content2 = null WHERE columna = 'cod_seg';UPDATE stage_d_aplicado4 SET content2 = ((RIGHT(content2, -5))) WHERE content2 like '____% % %$';

DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) <= 4 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
	cod_seg text,
    concepto text COLLATE pg_catalog."default",
    importe text COLLATE pg_catalog."default",
    num_certif text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	cod_seg text,
	concepto text, 
	importe text,
	num_certif text
	)) ;


DO $$
DECLARE sql TEXT;
BEGIN
    SELECT CASE 
            WHEN (select 1 from stage_d_aplicado5 WHERE importe ~ '^[^0-9]+$' limit 1) = 1
                THEN 'DROP TABLE stage_d_aplicado5;'
            ELSE 'INSERT INTO bmem.op_retenciones(id , concepto , importe , num_certif , doc_id , fecha_emision , cliente , periodo ) (WITH t AS (select x::json->''documents''->0->''fields''->''CustomerName''->>''content'' as cliente,
				x::json->''documents''->0->''fields''->''InvoiceId''->>''content'' as doc_id, 
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') as fecha_emision,
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') - interval ''2 months'' as periodo
from stage_op)
SELECT id, 
		TRANSLATE(concepto, ''_'', '''') AS concepto, 
		((REPLACE(TRANSLATE(importe, ''.-_$ '', ''''), '','', ''.''))::numeric *-1)  as importe,
		TRANSLATE(num_certif, ''_'', '''') AS num_certif,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;'
            END AS qry
    INTO sql
    FROM stage_d_aplicado5 limit 1;
    EXECUTE (sql);
END $$;

--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------

ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

DROP TABLE IF EXISTS stage_op;
DROP TABLE IF EXISTS stage_json_d_aplicado;


CREATE TEMP TABLE stage_json_d_aplicado 
  ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     json text 
  ); 
 
CREATE TEMP TABLE stage_op (x jsonb);
COPY stage_json_d_aplicado(json) FROM 'C:\Users\Administrador\GoesGreen SRL\I4 - AUTO\import\22.json' csv quote e'\x01' delimiter e'\x02';

INSERT INTO stage_op(x)
SELECT   string_agg( json ,e'\n' ORDER BY id)::jsonb 
FROM     stage_json_d_aplicado;


ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->0->'cells');

DELETE FROM  stage_d_aplicado2 WHERE id >= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE 'Total%');
DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%Neto%');
DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';

DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op'::regclass), 
     content2 text,
     columna text	  ); 


INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;

UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'fecha' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'comprobante' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'documento_int' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'importe_bruto' WHERE id = 4 ;
UPDATE stage_d_aplicado3 SET columna = 'importe_retenido' WHERE id = 5 ;
UPDATE stage_d_aplicado3 SET columna = 'importe_neto' WHERE id = 6 ;

ALTER SEQUENCE  bmem.rowname RESTART;


DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;


DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) = 6 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
    comprobante text COLLATE pg_catalog."default",
    documento_int text COLLATE pg_catalog."default",
    fecha text COLLATE pg_catalog."default",
    importe_bruto text COLLATE pg_catalog."default",
    importe_neto text COLLATE pg_catalog."default",
    importe_retenido text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	comprobante text, 
	documento_int text,
	fecha text, 
	importe_bruto text,	
	importe_neto text,
	importe_retenido text
	));


INSERT INTO bmem.op_detalle_de_aplicado (WITH t AS (select x::json->'documents'->0->'fields'->'CustomerName'->>'content' as cliente,
				x::json->'documents'->0->'fields'->'InvoiceId'->>'content' as doc_id, 
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') as fecha_emision,
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') - interval '2 months' as periodo
from stage_op)
SELECT id, REPLACE(comprobante, '_', '') AS comprobante, REPLACE(documento_int, '_', '') AS documento_int, 
						TO_DATE(REPLACE(fecha, '_', ''), 'DD.MM.YYYY') AS fecha, 
						CASE WHEN importe_bruto LIKE '%-%' THEN ((REPLACE(REPLACE(TRANSLATE(importe_bruto, ' ._', ''), ',', '.'), '-', ''))::numeric *-1) ELSE (REPLACE(TRANSLATE(importe_bruto, ' ._', ''), ',', '.'))::numeric END AS importe_bruto, 
						CASE WHEN REPLACE(REPLACE(importe_neto, '$', ''), '_', '') LIKE '%-%' THEN ((REPLACE(REPLACE(TRANSLATE(importe_neto, ' _.$', ''), ',', '.'), '-', ''))::numeric *-1) ELSE (REPLACE(REPLACE(TRANSLATE(importe_neto, ' _.$', ''), ',', '.'), '-', '')::numeric) END AS importe_neto,
						CASE WHEN importe_retenido LIKE '%-%' THEN ((REPLACE(REPLACE(TRANSLATE(importe_retenido, ' .$_', ''), ',', '.'), '-', ''))::numeric *-1) ELSE (REPLACE(TRANSLATE(importe_retenido, ' .$_', ''), ',', '.'))::numeric END AS importe_retenido,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;

--------------------------------------------------
ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_pago RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->1->'cells');


DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%porte%');DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';

DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op_pago'::regclass), 
     content2 text,
     columna text	  ); 


INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;
UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'concepto' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'banco' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'cuenta_banc' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'cheque' WHERE id = 4 ;
UPDATE stage_d_aplicado3 SET columna = 'importe' WHERE id = 5 ;

ALTER SEQUENCE  bmem.rowname RESTART;

DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;



DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;

insert into stage_d_aplicado4 
select id, content2, 'importe' FROM stage_d_aplicado4 WHERE columna = 'cheque'
AND not exists (
    select id from stage_d_aplicado4 where columna = 'importe'
);


UPDATE stage_d_aplicado4 SET content2 = null WHERE columna = 'cheque';

DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) = 5 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
    banco text COLLATE pg_catalog."default",
    cuenta_banc text COLLATE pg_catalog."default",
    concepto text COLLATE pg_catalog."default",
    cheque text COLLATE pg_catalog."default",
    importe text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	concepto text, 
	banco text,
	cuenta_banc text, 
	cheque text,	
	importe text
	));

UPDATE stage_d_aplicado5 SET cheque = null;


INSERT INTO bmem.op_detalle_de_pago (WITH t AS (select x::json->'documents'->0->'fields'->'CustomerName'->>'content' as cliente,
				x::json->'documents'->0->'fields'->'InvoiceId'->>'content' as doc_id, 
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') as fecha_emision,
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') - interval '2 months' as periodo
from stage_op)
SELECT id, 
		TRANSLATE(banco, '_0123456789', '') AS banco, 
		regexp_replace(banco, '\D','','g') as cuenta_banc,
		concepto,
		(REPLACE(TRANSLATE(cheque, '._$ ', ''), ',', '.'))::numeric  as cheque,
		(REPLACE(TRANSLATE(importe, '._$ ', ''), ',', '.'))::numeric  as importe,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;
						
--------------------------------------------------------------------------------------------------------------

ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones2 RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->2->'cells');


DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%porte%');DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';


DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op_retenciones'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;
UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'concepto' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'num_certif' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'cod_seg' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'importe' WHERE id = 4 ;

ALTER SEQUENCE  bmem.rowname RESTART;

DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;

insert into stage_d_aplicado4 
select id, content2, 'importe' FROM stage_d_aplicado4 WHERE columna = 'cod_seg'
AND not exists (
    select id from stage_d_aplicado4 where columna = 'importe'
);

UPDATE stage_d_aplicado4 SET content2 = null WHERE columna = 'cod_seg';UPDATE stage_d_aplicado4 SET content2 = ((RIGHT(content2, -5))) WHERE content2 like '____% % %$';

DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) <= 4 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
	cod_seg text,
    concepto text COLLATE pg_catalog."default",
    importe text COLLATE pg_catalog."default",
    num_certif text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	cod_seg text,
	concepto text, 
	importe text,
	num_certif text
	)) ;


DO $$
DECLARE sql TEXT;
BEGIN
    SELECT CASE 
            WHEN (select 1 from stage_d_aplicado5 WHERE importe ~ '^[^0-9]+$' limit 1) = 1
                THEN 'DROP TABLE stage_d_aplicado5;'
            ELSE 'INSERT INTO bmem.op_retenciones(id , concepto , importe , num_certif , doc_id , fecha_emision , cliente , periodo ) (WITH t AS (select x::json->''documents''->0->''fields''->''CustomerName''->>''content'' as cliente,
				x::json->''documents''->0->''fields''->''InvoiceId''->>''content'' as doc_id, 
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') as fecha_emision,
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') - interval ''2 months'' as periodo
from stage_op)
SELECT id, 
		TRANSLATE(concepto, ''_'', '''') AS concepto, 
		((REPLACE(TRANSLATE(importe, ''.-_$ '', ''''), '','', ''.''))::numeric *-1)  as importe,
		TRANSLATE(num_certif, ''_'', '''') AS num_certif,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;'
            END AS qry
    INTO sql
    FROM stage_d_aplicado5 limit 1;
    EXECUTE (sql);
END $$;
------------------------------------------------------------
DELETE from bmem.op_retenciones WHERE concepto NOT like '%MEM%'; DELETE FROM bmem.op_retenciones WHERE importe < -9999999999;
------------------------------------------------------------
ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones2 RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->2->'cells');


DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%porte%');DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';


DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op_retenciones2'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;
UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'concepto' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'num_certif' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'cod_seg' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'importe' WHERE id = 4 ;

ALTER SEQUENCE  bmem.rowname RESTART;

DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;

insert into stage_d_aplicado4 
select id, content2, 'importe' FROM stage_d_aplicado4 WHERE columna = 'cod_seg'
AND not exists (
    select id from stage_d_aplicado4 where columna = 'importe'
);

UPDATE stage_d_aplicado4 SET content2 = null WHERE columna = 'cod_seg';UPDATE stage_d_aplicado4 SET content2 = ((RIGHT(content2, -5))) WHERE content2 like '____% % %$';

DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) <= 4 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
	cod_seg text,
    concepto text COLLATE pg_catalog."default",
    importe text COLLATE pg_catalog."default",
    num_certif text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	cod_seg text,
	concepto text, 
	importe text,
	num_certif text
	)) ;


DO $$
DECLARE sql TEXT;
BEGIN
    SELECT CASE 
            WHEN (select 1 from stage_d_aplicado5 WHERE importe ~ '^[^0-9]+$' limit 1) = 1
                THEN 'DROP TABLE stage_d_aplicado5;'
            ELSE 'INSERT INTO bmem.op_retenciones(id , concepto , importe , num_certif , doc_id , fecha_emision , cliente , periodo ) (WITH t AS (select x::json->''documents''->0->''fields''->''CustomerName''->>''content'' as cliente,
				x::json->''documents''->0->''fields''->''InvoiceId''->>''content'' as doc_id, 
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') as fecha_emision,
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') - interval ''2 months'' as periodo
from stage_op)
SELECT id, 
		TRANSLATE(concepto, ''_'', '''') AS concepto, 
		((REPLACE(TRANSLATE(importe, ''.-_$ '', ''''), '','', ''.''))::numeric *-1)  as importe,
		TRANSLATE(num_certif, ''_'', '''') AS num_certif,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;'
            END AS qry
    INTO sql
    FROM stage_d_aplicado5 limit 1;
    EXECUTE (sql);
END $$;

--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------

ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

DROP TABLE IF EXISTS stage_op;
DROP TABLE IF EXISTS stage_json_d_aplicado;


CREATE TEMP TABLE stage_json_d_aplicado 
  ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     json text 
  ); 
 
CREATE TEMP TABLE stage_op (x jsonb);
COPY stage_json_d_aplicado(json) FROM 'C:\Users\Administrador\GoesGreen SRL\I4 - AUTO\import\23.json' csv quote e'\x01' delimiter e'\x02';

INSERT INTO stage_op(x)
SELECT   string_agg( json ,e'\n' ORDER BY id)::jsonb 
FROM     stage_json_d_aplicado;


ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->0->'cells');

DELETE FROM  stage_d_aplicado2 WHERE id >= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE 'Total%');
DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%Neto%');
DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';

DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op'::regclass), 
     content2 text,
     columna text	  ); 


INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;

UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'fecha' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'comprobante' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'documento_int' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'importe_bruto' WHERE id = 4 ;
UPDATE stage_d_aplicado3 SET columna = 'importe_retenido' WHERE id = 5 ;
UPDATE stage_d_aplicado3 SET columna = 'importe_neto' WHERE id = 6 ;

ALTER SEQUENCE  bmem.rowname RESTART;


DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;


DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) = 6 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
    comprobante text COLLATE pg_catalog."default",
    documento_int text COLLATE pg_catalog."default",
    fecha text COLLATE pg_catalog."default",
    importe_bruto text COLLATE pg_catalog."default",
    importe_neto text COLLATE pg_catalog."default",
    importe_retenido text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	comprobante text, 
	documento_int text,
	fecha text, 
	importe_bruto text,	
	importe_neto text,
	importe_retenido text
	));


INSERT INTO bmem.op_detalle_de_aplicado (WITH t AS (select x::json->'documents'->0->'fields'->'CustomerName'->>'content' as cliente,
				x::json->'documents'->0->'fields'->'InvoiceId'->>'content' as doc_id, 
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') as fecha_emision,
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') - interval '2 months' as periodo
from stage_op)
SELECT id, REPLACE(comprobante, '_', '') AS comprobante, REPLACE(documento_int, '_', '') AS documento_int, 
						TO_DATE(REPLACE(fecha, '_', ''), 'DD.MM.YYYY') AS fecha, 
						CASE WHEN importe_bruto LIKE '%-%' THEN ((REPLACE(REPLACE(TRANSLATE(importe_bruto, ' ._', ''), ',', '.'), '-', ''))::numeric *-1) ELSE (REPLACE(TRANSLATE(importe_bruto, ' ._', ''), ',', '.'))::numeric END AS importe_bruto, 
						CASE WHEN REPLACE(REPLACE(importe_neto, '$', ''), '_', '') LIKE '%-%' THEN ((REPLACE(REPLACE(TRANSLATE(importe_neto, ' _.$', ''), ',', '.'), '-', ''))::numeric *-1) ELSE (REPLACE(REPLACE(TRANSLATE(importe_neto, ' _.$', ''), ',', '.'), '-', '')::numeric) END AS importe_neto,
						CASE WHEN importe_retenido LIKE '%-%' THEN ((REPLACE(REPLACE(TRANSLATE(importe_retenido, ' .$_', ''), ',', '.'), '-', ''))::numeric *-1) ELSE (REPLACE(TRANSLATE(importe_retenido, ' .$_', ''), ',', '.'))::numeric END AS importe_retenido,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;

--------------------------------------------------
ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_pago RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->1->'cells');


DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%porte%');DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';

DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op_pago'::regclass), 
     content2 text,
     columna text	  ); 


INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;
UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'concepto' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'banco' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'cuenta_banc' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'cheque' WHERE id = 4 ;
UPDATE stage_d_aplicado3 SET columna = 'importe' WHERE id = 5 ;

ALTER SEQUENCE  bmem.rowname RESTART;

DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;



DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;

insert into stage_d_aplicado4 
select id, content2, 'importe' FROM stage_d_aplicado4 WHERE columna = 'cheque'
AND not exists (
    select id from stage_d_aplicado4 where columna = 'importe'
);


UPDATE stage_d_aplicado4 SET content2 = null WHERE columna = 'cheque';

DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) = 5 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
    banco text COLLATE pg_catalog."default",
    cuenta_banc text COLLATE pg_catalog."default",
    concepto text COLLATE pg_catalog."default",
    cheque text COLLATE pg_catalog."default",
    importe text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	concepto text, 
	banco text,
	cuenta_banc text, 
	cheque text,	
	importe text
	));

UPDATE stage_d_aplicado5 SET cheque = null;


INSERT INTO bmem.op_detalle_de_pago (WITH t AS (select x::json->'documents'->0->'fields'->'CustomerName'->>'content' as cliente,
				x::json->'documents'->0->'fields'->'InvoiceId'->>'content' as doc_id, 
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') as fecha_emision,
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') - interval '2 months' as periodo
from stage_op)
SELECT id, 
		TRANSLATE(banco, '_0123456789', '') AS banco, 
		regexp_replace(banco, '\D','','g') as cuenta_banc,
		concepto,
		(REPLACE(TRANSLATE(cheque, '._$ ', ''), ',', '.'))::numeric  as cheque,
		(REPLACE(TRANSLATE(importe, '._$ ', ''), ',', '.'))::numeric  as importe,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;
						
--------------------------------------------------------------------------------------------------------------

ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones2 RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->2->'cells');


DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%porte%');DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';


DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op_retenciones'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;
UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'concepto' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'num_certif' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'cod_seg' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'importe' WHERE id = 4 ;

ALTER SEQUENCE  bmem.rowname RESTART;

DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;

insert into stage_d_aplicado4 
select id, content2, 'importe' FROM stage_d_aplicado4 WHERE columna = 'cod_seg'
AND not exists (
    select id from stage_d_aplicado4 where columna = 'importe'
);

UPDATE stage_d_aplicado4 SET content2 = null WHERE columna = 'cod_seg';UPDATE stage_d_aplicado4 SET content2 = ((RIGHT(content2, -5))) WHERE content2 like '____% % %$';

DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) <= 4 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
	cod_seg text,
    concepto text COLLATE pg_catalog."default",
    importe text COLLATE pg_catalog."default",
    num_certif text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	cod_seg text,
	concepto text, 
	importe text,
	num_certif text
	)) ;


DO $$
DECLARE sql TEXT;
BEGIN
    SELECT CASE 
            WHEN (select 1 from stage_d_aplicado5 WHERE importe ~ '^[^0-9]+$' limit 1) = 1
                THEN 'DROP TABLE stage_d_aplicado5;'
            ELSE 'INSERT INTO bmem.op_retenciones(id , concepto , importe , num_certif , doc_id , fecha_emision , cliente , periodo ) (WITH t AS (select x::json->''documents''->0->''fields''->''CustomerName''->>''content'' as cliente,
				x::json->''documents''->0->''fields''->''InvoiceId''->>''content'' as doc_id, 
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') as fecha_emision,
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') - interval ''2 months'' as periodo
from stage_op)
SELECT id, 
		TRANSLATE(concepto, ''_'', '''') AS concepto, 
		((REPLACE(TRANSLATE(importe, ''.-_$ '', ''''), '','', ''.''))::numeric *-1)  as importe,
		TRANSLATE(num_certif, ''_'', '''') AS num_certif,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;'
            END AS qry
    INTO sql
    FROM stage_d_aplicado5 limit 1;
    EXECUTE (sql);
END $$;
------------------------------------------------------------
DELETE from bmem.op_retenciones WHERE concepto NOT like '%MEM%'; DELETE FROM bmem.op_retenciones WHERE importe < -9999999999;
------------------------------------------------------------
ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones2 RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->2->'cells');


DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%porte%');DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';


DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op_retenciones2'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;
UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'concepto' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'num_certif' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'cod_seg' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'importe' WHERE id = 4 ;

ALTER SEQUENCE  bmem.rowname RESTART;

DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;

insert into stage_d_aplicado4 
select id, content2, 'importe' FROM stage_d_aplicado4 WHERE columna = 'cod_seg'
AND not exists (
    select id from stage_d_aplicado4 where columna = 'importe'
);

UPDATE stage_d_aplicado4 SET content2 = null WHERE columna = 'cod_seg';UPDATE stage_d_aplicado4 SET content2 = ((RIGHT(content2, -5))) WHERE content2 like '____% % %$';

DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) <= 4 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
	cod_seg text,
    concepto text COLLATE pg_catalog."default",
    importe text COLLATE pg_catalog."default",
    num_certif text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	cod_seg text,
	concepto text, 
	importe text,
	num_certif text
	)) ;


DO $$
DECLARE sql TEXT;
BEGIN
    SELECT CASE 
            WHEN (select 1 from stage_d_aplicado5 WHERE importe ~ '^[^0-9]+$' limit 1) = 1
                THEN 'DROP TABLE stage_d_aplicado5;'
            ELSE 'INSERT INTO bmem.op_retenciones(id , concepto , importe , num_certif , doc_id , fecha_emision , cliente , periodo ) (WITH t AS (select x::json->''documents''->0->''fields''->''CustomerName''->>''content'' as cliente,
				x::json->''documents''->0->''fields''->''InvoiceId''->>''content'' as doc_id, 
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') as fecha_emision,
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') - interval ''2 months'' as periodo
from stage_op)
SELECT id, 
		TRANSLATE(concepto, ''_'', '''') AS concepto, 
		((REPLACE(TRANSLATE(importe, ''.-_$ '', ''''), '','', ''.''))::numeric *-1)  as importe,
		TRANSLATE(num_certif, ''_'', '''') AS num_certif,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;'
            END AS qry
    INTO sql
    FROM stage_d_aplicado5 limit 1;
    EXECUTE (sql);
END $$;

--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------

ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

DROP TABLE IF EXISTS stage_op;
DROP TABLE IF EXISTS stage_json_d_aplicado;


CREATE TEMP TABLE stage_json_d_aplicado 
  ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     json text 
  ); 
 
CREATE TEMP TABLE stage_op (x jsonb);
COPY stage_json_d_aplicado(json) FROM 'C:\Users\Administrador\GoesGreen SRL\I4 - AUTO\import\24.json' csv quote e'\x01' delimiter e'\x02';

INSERT INTO stage_op(x)
SELECT   string_agg( json ,e'\n' ORDER BY id)::jsonb 
FROM     stage_json_d_aplicado;


ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->0->'cells');

DELETE FROM  stage_d_aplicado2 WHERE id >= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE 'Total%');
DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%Neto%');
DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';

DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op'::regclass), 
     content2 text,
     columna text	  ); 


INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;

UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'fecha' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'comprobante' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'documento_int' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'importe_bruto' WHERE id = 4 ;
UPDATE stage_d_aplicado3 SET columna = 'importe_retenido' WHERE id = 5 ;
UPDATE stage_d_aplicado3 SET columna = 'importe_neto' WHERE id = 6 ;

ALTER SEQUENCE  bmem.rowname RESTART;


DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;


DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) = 6 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
    comprobante text COLLATE pg_catalog."default",
    documento_int text COLLATE pg_catalog."default",
    fecha text COLLATE pg_catalog."default",
    importe_bruto text COLLATE pg_catalog."default",
    importe_neto text COLLATE pg_catalog."default",
    importe_retenido text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	comprobante text, 
	documento_int text,
	fecha text, 
	importe_bruto text,	
	importe_neto text,
	importe_retenido text
	));


INSERT INTO bmem.op_detalle_de_aplicado (WITH t AS (select x::json->'documents'->0->'fields'->'CustomerName'->>'content' as cliente,
				x::json->'documents'->0->'fields'->'InvoiceId'->>'content' as doc_id, 
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') as fecha_emision,
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') - interval '2 months' as periodo
from stage_op)
SELECT id, REPLACE(comprobante, '_', '') AS comprobante, REPLACE(documento_int, '_', '') AS documento_int, 
						TO_DATE(REPLACE(fecha, '_', ''), 'DD.MM.YYYY') AS fecha, 
						CASE WHEN importe_bruto LIKE '%-%' THEN ((REPLACE(REPLACE(TRANSLATE(importe_bruto, ' ._', ''), ',', '.'), '-', ''))::numeric *-1) ELSE (REPLACE(TRANSLATE(importe_bruto, ' ._', ''), ',', '.'))::numeric END AS importe_bruto, 
						CASE WHEN REPLACE(REPLACE(importe_neto, '$', ''), '_', '') LIKE '%-%' THEN ((REPLACE(REPLACE(TRANSLATE(importe_neto, ' _.$', ''), ',', '.'), '-', ''))::numeric *-1) ELSE (REPLACE(REPLACE(TRANSLATE(importe_neto, ' _.$', ''), ',', '.'), '-', '')::numeric) END AS importe_neto,
						CASE WHEN importe_retenido LIKE '%-%' THEN ((REPLACE(REPLACE(TRANSLATE(importe_retenido, ' .$_', ''), ',', '.'), '-', ''))::numeric *-1) ELSE (REPLACE(TRANSLATE(importe_retenido, ' .$_', ''), ',', '.'))::numeric END AS importe_retenido,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;

--------------------------------------------------
ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_pago RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->1->'cells');


DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%porte%');DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';

DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op_pago'::regclass), 
     content2 text,
     columna text	  ); 


INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;
UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'concepto' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'banco' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'cuenta_banc' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'cheque' WHERE id = 4 ;
UPDATE stage_d_aplicado3 SET columna = 'importe' WHERE id = 5 ;

ALTER SEQUENCE  bmem.rowname RESTART;

DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;



DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;

insert into stage_d_aplicado4 
select id, content2, 'importe' FROM stage_d_aplicado4 WHERE columna = 'cheque'
AND not exists (
    select id from stage_d_aplicado4 where columna = 'importe'
);


UPDATE stage_d_aplicado4 SET content2 = null WHERE columna = 'cheque';

DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) = 5 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
    banco text COLLATE pg_catalog."default",
    cuenta_banc text COLLATE pg_catalog."default",
    concepto text COLLATE pg_catalog."default",
    cheque text COLLATE pg_catalog."default",
    importe text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	concepto text, 
	banco text,
	cuenta_banc text, 
	cheque text,	
	importe text
	));

UPDATE stage_d_aplicado5 SET cheque = null;


INSERT INTO bmem.op_detalle_de_pago (WITH t AS (select x::json->'documents'->0->'fields'->'CustomerName'->>'content' as cliente,
				x::json->'documents'->0->'fields'->'InvoiceId'->>'content' as doc_id, 
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') as fecha_emision,
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') - interval '2 months' as periodo
from stage_op)
SELECT id, 
		TRANSLATE(banco, '_0123456789', '') AS banco, 
		regexp_replace(banco, '\D','','g') as cuenta_banc,
		concepto,
		(REPLACE(TRANSLATE(cheque, '._$ ', ''), ',', '.'))::numeric  as cheque,
		(REPLACE(TRANSLATE(importe, '._$ ', ''), ',', '.'))::numeric  as importe,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;
						
--------------------------------------------------------------------------------------------------------------

ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones2 RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->2->'cells');


DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%porte%');DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';


DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op_retenciones'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;
UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'concepto' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'num_certif' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'cod_seg' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'importe' WHERE id = 4 ;

ALTER SEQUENCE  bmem.rowname RESTART;

DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;

insert into stage_d_aplicado4 
select id, content2, 'importe' FROM stage_d_aplicado4 WHERE columna = 'cod_seg'
AND not exists (
    select id from stage_d_aplicado4 where columna = 'importe'
);

UPDATE stage_d_aplicado4 SET content2 = null WHERE columna = 'cod_seg';UPDATE stage_d_aplicado4 SET content2 = ((RIGHT(content2, -5))) WHERE content2 like '____% % %$';

DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) <= 4 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
	cod_seg text,
    concepto text COLLATE pg_catalog."default",
    importe text COLLATE pg_catalog."default",
    num_certif text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	cod_seg text,
	concepto text, 
	importe text,
	num_certif text
	)) ;


DO $$
DECLARE sql TEXT;
BEGIN
    SELECT CASE 
            WHEN (select 1 from stage_d_aplicado5 WHERE importe ~ '^[^0-9]+$' limit 1) = 1
                THEN 'DROP TABLE stage_d_aplicado5;'
            ELSE 'INSERT INTO bmem.op_retenciones(id , concepto , importe , num_certif , doc_id , fecha_emision , cliente , periodo ) (WITH t AS (select x::json->''documents''->0->''fields''->''CustomerName''->>''content'' as cliente,
				x::json->''documents''->0->''fields''->''InvoiceId''->>''content'' as doc_id, 
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') as fecha_emision,
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') - interval ''2 months'' as periodo
from stage_op)
SELECT id, 
		TRANSLATE(concepto, ''_'', '''') AS concepto, 
		((REPLACE(TRANSLATE(importe, ''.-_$ '', ''''), '','', ''.''))::numeric *-1)  as importe,
		TRANSLATE(num_certif, ''_'', '''') AS num_certif,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;'
            END AS qry
    INTO sql
    FROM stage_d_aplicado5 limit 1;
    EXECUTE (sql);
END $$;
------------------------------------------------------------
DELETE from bmem.op_retenciones WHERE concepto NOT like '%MEM%'; DELETE FROM bmem.op_retenciones WHERE importe < -9999999999;
------------------------------------------------------------
ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones2 RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->2->'cells');


DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%porte%');DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';


DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op_retenciones2'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;
UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'concepto' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'num_certif' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'cod_seg' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'importe' WHERE id = 4 ;

ALTER SEQUENCE  bmem.rowname RESTART;

DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;

insert into stage_d_aplicado4 
select id, content2, 'importe' FROM stage_d_aplicado4 WHERE columna = 'cod_seg'
AND not exists (
    select id from stage_d_aplicado4 where columna = 'importe'
);

UPDATE stage_d_aplicado4 SET content2 = null WHERE columna = 'cod_seg';UPDATE stage_d_aplicado4 SET content2 = ((RIGHT(content2, -5))) WHERE content2 like '____% % %$';

DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) <= 4 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
	cod_seg text,
    concepto text COLLATE pg_catalog."default",
    importe text COLLATE pg_catalog."default",
    num_certif text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	cod_seg text,
	concepto text, 
	importe text,
	num_certif text
	)) ;


DO $$
DECLARE sql TEXT;
BEGIN
    SELECT CASE 
            WHEN (select 1 from stage_d_aplicado5 WHERE importe ~ '^[^0-9]+$' limit 1) = 1
                THEN 'DROP TABLE stage_d_aplicado5;'
            ELSE 'INSERT INTO bmem.op_retenciones(id , concepto , importe , num_certif , doc_id , fecha_emision , cliente , periodo ) (WITH t AS (select x::json->''documents''->0->''fields''->''CustomerName''->>''content'' as cliente,
				x::json->''documents''->0->''fields''->''InvoiceId''->>''content'' as doc_id, 
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') as fecha_emision,
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') - interval ''2 months'' as periodo
from stage_op)
SELECT id, 
		TRANSLATE(concepto, ''_'', '''') AS concepto, 
		((REPLACE(TRANSLATE(importe, ''.-_$ '', ''''), '','', ''.''))::numeric *-1)  as importe,
		TRANSLATE(num_certif, ''_'', '''') AS num_certif,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;'
            END AS qry
    INTO sql
    FROM stage_d_aplicado5 limit 1;
    EXECUTE (sql);
END $$;

--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------

ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

DROP TABLE IF EXISTS stage_op;
DROP TABLE IF EXISTS stage_json_d_aplicado;


CREATE TEMP TABLE stage_json_d_aplicado 
  ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     json text 
  ); 
 
CREATE TEMP TABLE stage_op (x jsonb);
COPY stage_json_d_aplicado(json) FROM 'C:\Users\Administrador\GoesGreen SRL\I4 - AUTO\import\25.json' csv quote e'\x01' delimiter e'\x02';

INSERT INTO stage_op(x)
SELECT   string_agg( json ,e'\n' ORDER BY id)::jsonb 
FROM     stage_json_d_aplicado;


ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->0->'cells');

DELETE FROM  stage_d_aplicado2 WHERE id >= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE 'Total%');
DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%Neto%');
DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';

DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op'::regclass), 
     content2 text,
     columna text	  ); 


INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;

UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'fecha' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'comprobante' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'documento_int' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'importe_bruto' WHERE id = 4 ;
UPDATE stage_d_aplicado3 SET columna = 'importe_retenido' WHERE id = 5 ;
UPDATE stage_d_aplicado3 SET columna = 'importe_neto' WHERE id = 6 ;

ALTER SEQUENCE  bmem.rowname RESTART;


DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;


DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) = 6 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
    comprobante text COLLATE pg_catalog."default",
    documento_int text COLLATE pg_catalog."default",
    fecha text COLLATE pg_catalog."default",
    importe_bruto text COLLATE pg_catalog."default",
    importe_neto text COLLATE pg_catalog."default",
    importe_retenido text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	comprobante text, 
	documento_int text,
	fecha text, 
	importe_bruto text,	
	importe_neto text,
	importe_retenido text
	));


INSERT INTO bmem.op_detalle_de_aplicado (WITH t AS (select x::json->'documents'->0->'fields'->'CustomerName'->>'content' as cliente,
				x::json->'documents'->0->'fields'->'InvoiceId'->>'content' as doc_id, 
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') as fecha_emision,
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') - interval '2 months' as periodo
from stage_op)
SELECT id, REPLACE(comprobante, '_', '') AS comprobante, REPLACE(documento_int, '_', '') AS documento_int, 
						TO_DATE(REPLACE(fecha, '_', ''), 'DD.MM.YYYY') AS fecha, 
						CASE WHEN importe_bruto LIKE '%-%' THEN ((REPLACE(REPLACE(TRANSLATE(importe_bruto, ' ._', ''), ',', '.'), '-', ''))::numeric *-1) ELSE (REPLACE(TRANSLATE(importe_bruto, ' ._', ''), ',', '.'))::numeric END AS importe_bruto, 
						CASE WHEN REPLACE(REPLACE(importe_neto, '$', ''), '_', '') LIKE '%-%' THEN ((REPLACE(REPLACE(TRANSLATE(importe_neto, ' _.$', ''), ',', '.'), '-', ''))::numeric *-1) ELSE (REPLACE(REPLACE(TRANSLATE(importe_neto, ' _.$', ''), ',', '.'), '-', '')::numeric) END AS importe_neto,
						CASE WHEN importe_retenido LIKE '%-%' THEN ((REPLACE(REPLACE(TRANSLATE(importe_retenido, ' .$_', ''), ',', '.'), '-', ''))::numeric *-1) ELSE (REPLACE(TRANSLATE(importe_retenido, ' .$_', ''), ',', '.'))::numeric END AS importe_retenido,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;

--------------------------------------------------
ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_pago RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->1->'cells');


DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%porte%');DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';

DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op_pago'::regclass), 
     content2 text,
     columna text	  ); 


INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;
UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'concepto' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'banco' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'cuenta_banc' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'cheque' WHERE id = 4 ;
UPDATE stage_d_aplicado3 SET columna = 'importe' WHERE id = 5 ;

ALTER SEQUENCE  bmem.rowname RESTART;

DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;



DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;

insert into stage_d_aplicado4 
select id, content2, 'importe' FROM stage_d_aplicado4 WHERE columna = 'cheque'
AND not exists (
    select id from stage_d_aplicado4 where columna = 'importe'
);


UPDATE stage_d_aplicado4 SET content2 = null WHERE columna = 'cheque';

DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) = 5 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
    banco text COLLATE pg_catalog."default",
    cuenta_banc text COLLATE pg_catalog."default",
    concepto text COLLATE pg_catalog."default",
    cheque text COLLATE pg_catalog."default",
    importe text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	concepto text, 
	banco text,
	cuenta_banc text, 
	cheque text,	
	importe text
	));

UPDATE stage_d_aplicado5 SET cheque = null;


INSERT INTO bmem.op_detalle_de_pago (WITH t AS (select x::json->'documents'->0->'fields'->'CustomerName'->>'content' as cliente,
				x::json->'documents'->0->'fields'->'InvoiceId'->>'content' as doc_id, 
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') as fecha_emision,
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') - interval '2 months' as periodo
from stage_op)
SELECT id, 
		TRANSLATE(banco, '_0123456789', '') AS banco, 
		regexp_replace(banco, '\D','','g') as cuenta_banc,
		concepto,
		(REPLACE(TRANSLATE(cheque, '._$ ', ''), ',', '.'))::numeric  as cheque,
		(REPLACE(TRANSLATE(importe, '._$ ', ''), ',', '.'))::numeric  as importe,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;
						
--------------------------------------------------------------------------------------------------------------

ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones2 RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->2->'cells');


DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%porte%');DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';


DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op_retenciones'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;
UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'concepto' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'num_certif' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'cod_seg' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'importe' WHERE id = 4 ;

ALTER SEQUENCE  bmem.rowname RESTART;

DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;

insert into stage_d_aplicado4 
select id, content2, 'importe' FROM stage_d_aplicado4 WHERE columna = 'cod_seg'
AND not exists (
    select id from stage_d_aplicado4 where columna = 'importe'
);

UPDATE stage_d_aplicado4 SET content2 = null WHERE columna = 'cod_seg';UPDATE stage_d_aplicado4 SET content2 = ((RIGHT(content2, -5))) WHERE content2 like '____% % %$';

DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) <= 4 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
	cod_seg text,
    concepto text COLLATE pg_catalog."default",
    importe text COLLATE pg_catalog."default",
    num_certif text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	cod_seg text,
	concepto text, 
	importe text,
	num_certif text
	)) ;


DO $$
DECLARE sql TEXT;
BEGIN
    SELECT CASE 
            WHEN (select 1 from stage_d_aplicado5 WHERE importe ~ '^[^0-9]+$' limit 1) = 1
                THEN 'DROP TABLE stage_d_aplicado5;'
            ELSE 'INSERT INTO bmem.op_retenciones(id , concepto , importe , num_certif , doc_id , fecha_emision , cliente , periodo ) (WITH t AS (select x::json->''documents''->0->''fields''->''CustomerName''->>''content'' as cliente,
				x::json->''documents''->0->''fields''->''InvoiceId''->>''content'' as doc_id, 
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') as fecha_emision,
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') - interval ''2 months'' as periodo
from stage_op)
SELECT id, 
		TRANSLATE(concepto, ''_'', '''') AS concepto, 
		((REPLACE(TRANSLATE(importe, ''.-_$ '', ''''), '','', ''.''))::numeric *-1)  as importe,
		TRANSLATE(num_certif, ''_'', '''') AS num_certif,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;'
            END AS qry
    INTO sql
    FROM stage_d_aplicado5 limit 1;
    EXECUTE (sql);
END $$;
------------------------------------------------------------
DELETE from bmem.op_retenciones WHERE concepto NOT like '%MEM%'; DELETE FROM bmem.op_retenciones WHERE importe < -9999999999;
------------------------------------------------------------
ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones2 RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->2->'cells');


DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%porte%');DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';


DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op_retenciones2'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;
UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'concepto' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'num_certif' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'cod_seg' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'importe' WHERE id = 4 ;

ALTER SEQUENCE  bmem.rowname RESTART;

DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;

insert into stage_d_aplicado4 
select id, content2, 'importe' FROM stage_d_aplicado4 WHERE columna = 'cod_seg'
AND not exists (
    select id from stage_d_aplicado4 where columna = 'importe'
);

UPDATE stage_d_aplicado4 SET content2 = null WHERE columna = 'cod_seg';UPDATE stage_d_aplicado4 SET content2 = ((RIGHT(content2, -5))) WHERE content2 like '____% % %$';

DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) <= 4 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
	cod_seg text,
    concepto text COLLATE pg_catalog."default",
    importe text COLLATE pg_catalog."default",
    num_certif text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	cod_seg text,
	concepto text, 
	importe text,
	num_certif text
	)) ;


DO $$
DECLARE sql TEXT;
BEGIN
    SELECT CASE 
            WHEN (select 1 from stage_d_aplicado5 WHERE importe ~ '^[^0-9]+$' limit 1) = 1
                THEN 'DROP TABLE stage_d_aplicado5;'
            ELSE 'INSERT INTO bmem.op_retenciones(id , concepto , importe , num_certif , doc_id , fecha_emision , cliente , periodo ) (WITH t AS (select x::json->''documents''->0->''fields''->''CustomerName''->>''content'' as cliente,
				x::json->''documents''->0->''fields''->''InvoiceId''->>''content'' as doc_id, 
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') as fecha_emision,
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') - interval ''2 months'' as periodo
from stage_op)
SELECT id, 
		TRANSLATE(concepto, ''_'', '''') AS concepto, 
		((REPLACE(TRANSLATE(importe, ''.-_$ '', ''''), '','', ''.''))::numeric *-1)  as importe,
		TRANSLATE(num_certif, ''_'', '''') AS num_certif,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;'
            END AS qry
    INTO sql
    FROM stage_d_aplicado5 limit 1;
    EXECUTE (sql);
END $$;

--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------

ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

DROP TABLE IF EXISTS stage_op;
DROP TABLE IF EXISTS stage_json_d_aplicado;


CREATE TEMP TABLE stage_json_d_aplicado 
  ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     json text 
  ); 
 
CREATE TEMP TABLE stage_op (x jsonb);
COPY stage_json_d_aplicado(json) FROM 'C:\Users\Administrador\GoesGreen SRL\I4 - AUTO\import\26.json' csv quote e'\x01' delimiter e'\x02';

INSERT INTO stage_op(x)
SELECT   string_agg( json ,e'\n' ORDER BY id)::jsonb 
FROM     stage_json_d_aplicado;


ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->0->'cells');

DELETE FROM  stage_d_aplicado2 WHERE id >= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE 'Total%');
DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%Neto%');
DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';

DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op'::regclass), 
     content2 text,
     columna text	  ); 


INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;

UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'fecha' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'comprobante' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'documento_int' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'importe_bruto' WHERE id = 4 ;
UPDATE stage_d_aplicado3 SET columna = 'importe_retenido' WHERE id = 5 ;
UPDATE stage_d_aplicado3 SET columna = 'importe_neto' WHERE id = 6 ;

ALTER SEQUENCE  bmem.rowname RESTART;


DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;


DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) = 6 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
    comprobante text COLLATE pg_catalog."default",
    documento_int text COLLATE pg_catalog."default",
    fecha text COLLATE pg_catalog."default",
    importe_bruto text COLLATE pg_catalog."default",
    importe_neto text COLLATE pg_catalog."default",
    importe_retenido text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	comprobante text, 
	documento_int text,
	fecha text, 
	importe_bruto text,	
	importe_neto text,
	importe_retenido text
	));


INSERT INTO bmem.op_detalle_de_aplicado (WITH t AS (select x::json->'documents'->0->'fields'->'CustomerName'->>'content' as cliente,
				x::json->'documents'->0->'fields'->'InvoiceId'->>'content' as doc_id, 
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') as fecha_emision,
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') - interval '2 months' as periodo
from stage_op)
SELECT id, REPLACE(comprobante, '_', '') AS comprobante, REPLACE(documento_int, '_', '') AS documento_int, 
						TO_DATE(REPLACE(fecha, '_', ''), 'DD.MM.YYYY') AS fecha, 
						CASE WHEN importe_bruto LIKE '%-%' THEN ((REPLACE(REPLACE(TRANSLATE(importe_bruto, ' ._', ''), ',', '.'), '-', ''))::numeric *-1) ELSE (REPLACE(TRANSLATE(importe_bruto, ' ._', ''), ',', '.'))::numeric END AS importe_bruto, 
						CASE WHEN REPLACE(REPLACE(importe_neto, '$', ''), '_', '') LIKE '%-%' THEN ((REPLACE(REPLACE(TRANSLATE(importe_neto, ' _.$', ''), ',', '.'), '-', ''))::numeric *-1) ELSE (REPLACE(REPLACE(TRANSLATE(importe_neto, ' _.$', ''), ',', '.'), '-', '')::numeric) END AS importe_neto,
						CASE WHEN importe_retenido LIKE '%-%' THEN ((REPLACE(REPLACE(TRANSLATE(importe_retenido, ' .$_', ''), ',', '.'), '-', ''))::numeric *-1) ELSE (REPLACE(TRANSLATE(importe_retenido, ' .$_', ''), ',', '.'))::numeric END AS importe_retenido,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;

--------------------------------------------------
ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_pago RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->1->'cells');


DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%porte%');DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';

DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op_pago'::regclass), 
     content2 text,
     columna text	  ); 


INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;
UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'concepto' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'banco' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'cuenta_banc' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'cheque' WHERE id = 4 ;
UPDATE stage_d_aplicado3 SET columna = 'importe' WHERE id = 5 ;

ALTER SEQUENCE  bmem.rowname RESTART;

DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;



DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;

insert into stage_d_aplicado4 
select id, content2, 'importe' FROM stage_d_aplicado4 WHERE columna = 'cheque'
AND not exists (
    select id from stage_d_aplicado4 where columna = 'importe'
);


UPDATE stage_d_aplicado4 SET content2 = null WHERE columna = 'cheque';

DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) = 5 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
    banco text COLLATE pg_catalog."default",
    cuenta_banc text COLLATE pg_catalog."default",
    concepto text COLLATE pg_catalog."default",
    cheque text COLLATE pg_catalog."default",
    importe text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	concepto text, 
	banco text,
	cuenta_banc text, 
	cheque text,	
	importe text
	));

UPDATE stage_d_aplicado5 SET cheque = null;


INSERT INTO bmem.op_detalle_de_pago (WITH t AS (select x::json->'documents'->0->'fields'->'CustomerName'->>'content' as cliente,
				x::json->'documents'->0->'fields'->'InvoiceId'->>'content' as doc_id, 
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') as fecha_emision,
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') - interval '2 months' as periodo
from stage_op)
SELECT id, 
		TRANSLATE(banco, '_0123456789', '') AS banco, 
		regexp_replace(banco, '\D','','g') as cuenta_banc,
		concepto,
		(REPLACE(TRANSLATE(cheque, '._$ ', ''), ',', '.'))::numeric  as cheque,
		(REPLACE(TRANSLATE(importe, '._$ ', ''), ',', '.'))::numeric  as importe,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;
						
--------------------------------------------------------------------------------------------------------------

ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones2 RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->2->'cells');


DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%porte%');DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';


DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op_retenciones'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;
UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'concepto' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'num_certif' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'cod_seg' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'importe' WHERE id = 4 ;

ALTER SEQUENCE  bmem.rowname RESTART;

DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;

insert into stage_d_aplicado4 
select id, content2, 'importe' FROM stage_d_aplicado4 WHERE columna = 'cod_seg'
AND not exists (
    select id from stage_d_aplicado4 where columna = 'importe'
);

UPDATE stage_d_aplicado4 SET content2 = null WHERE columna = 'cod_seg';UPDATE stage_d_aplicado4 SET content2 = ((RIGHT(content2, -5))) WHERE content2 like '____% % %$';

DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) <= 4 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
	cod_seg text,
    concepto text COLLATE pg_catalog."default",
    importe text COLLATE pg_catalog."default",
    num_certif text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	cod_seg text,
	concepto text, 
	importe text,
	num_certif text
	)) ;


DO $$
DECLARE sql TEXT;
BEGIN
    SELECT CASE 
            WHEN (select 1 from stage_d_aplicado5 WHERE importe ~ '^[^0-9]+$' limit 1) = 1
                THEN 'DROP TABLE stage_d_aplicado5;'
            ELSE 'INSERT INTO bmem.op_retenciones(id , concepto , importe , num_certif , doc_id , fecha_emision , cliente , periodo ) (WITH t AS (select x::json->''documents''->0->''fields''->''CustomerName''->>''content'' as cliente,
				x::json->''documents''->0->''fields''->''InvoiceId''->>''content'' as doc_id, 
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') as fecha_emision,
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') - interval ''2 months'' as periodo
from stage_op)
SELECT id, 
		TRANSLATE(concepto, ''_'', '''') AS concepto, 
		((REPLACE(TRANSLATE(importe, ''.-_$ '', ''''), '','', ''.''))::numeric *-1)  as importe,
		TRANSLATE(num_certif, ''_'', '''') AS num_certif,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;'
            END AS qry
    INTO sql
    FROM stage_d_aplicado5 limit 1;
    EXECUTE (sql);
END $$;
------------------------------------------------------------
DELETE from bmem.op_retenciones WHERE concepto NOT like '%MEM%'; DELETE FROM bmem.op_retenciones WHERE importe < -9999999999;
------------------------------------------------------------
ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones2 RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->2->'cells');


DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%porte%');DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';


DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op_retenciones2'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;
UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'concepto' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'num_certif' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'cod_seg' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'importe' WHERE id = 4 ;

ALTER SEQUENCE  bmem.rowname RESTART;

DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;

insert into stage_d_aplicado4 
select id, content2, 'importe' FROM stage_d_aplicado4 WHERE columna = 'cod_seg'
AND not exists (
    select id from stage_d_aplicado4 where columna = 'importe'
);

UPDATE stage_d_aplicado4 SET content2 = null WHERE columna = 'cod_seg';UPDATE stage_d_aplicado4 SET content2 = ((RIGHT(content2, -5))) WHERE content2 like '____% % %$';

DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) <= 4 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
	cod_seg text,
    concepto text COLLATE pg_catalog."default",
    importe text COLLATE pg_catalog."default",
    num_certif text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	cod_seg text,
	concepto text, 
	importe text,
	num_certif text
	)) ;


DO $$
DECLARE sql TEXT;
BEGIN
    SELECT CASE 
            WHEN (select 1 from stage_d_aplicado5 WHERE importe ~ '^[^0-9]+$' limit 1) = 1
                THEN 'DROP TABLE stage_d_aplicado5;'
            ELSE 'INSERT INTO bmem.op_retenciones(id , concepto , importe , num_certif , doc_id , fecha_emision , cliente , periodo ) (WITH t AS (select x::json->''documents''->0->''fields''->''CustomerName''->>''content'' as cliente,
				x::json->''documents''->0->''fields''->''InvoiceId''->>''content'' as doc_id, 
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') as fecha_emision,
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') - interval ''2 months'' as periodo
from stage_op)
SELECT id, 
		TRANSLATE(concepto, ''_'', '''') AS concepto, 
		((REPLACE(TRANSLATE(importe, ''.-_$ '', ''''), '','', ''.''))::numeric *-1)  as importe,
		TRANSLATE(num_certif, ''_'', '''') AS num_certif,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;'
            END AS qry
    INTO sql
    FROM stage_d_aplicado5 limit 1;
    EXECUTE (sql);
END $$;

--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------

ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

DROP TABLE IF EXISTS stage_op;
DROP TABLE IF EXISTS stage_json_d_aplicado;


CREATE TEMP TABLE stage_json_d_aplicado 
  ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     json text 
  ); 
 
CREATE TEMP TABLE stage_op (x jsonb);
COPY stage_json_d_aplicado(json) FROM 'C:\Users\Administrador\GoesGreen SRL\I4 - AUTO\import\27.json' csv quote e'\x01' delimiter e'\x02';

INSERT INTO stage_op(x)
SELECT   string_agg( json ,e'\n' ORDER BY id)::jsonb 
FROM     stage_json_d_aplicado;


ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->0->'cells');

DELETE FROM  stage_d_aplicado2 WHERE id >= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE 'Total%');
DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%Neto%');
DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';

DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op'::regclass), 
     content2 text,
     columna text	  ); 


INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;

UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'fecha' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'comprobante' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'documento_int' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'importe_bruto' WHERE id = 4 ;
UPDATE stage_d_aplicado3 SET columna = 'importe_retenido' WHERE id = 5 ;
UPDATE stage_d_aplicado3 SET columna = 'importe_neto' WHERE id = 6 ;

ALTER SEQUENCE  bmem.rowname RESTART;


DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;


DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) = 6 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
    comprobante text COLLATE pg_catalog."default",
    documento_int text COLLATE pg_catalog."default",
    fecha text COLLATE pg_catalog."default",
    importe_bruto text COLLATE pg_catalog."default",
    importe_neto text COLLATE pg_catalog."default",
    importe_retenido text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	comprobante text, 
	documento_int text,
	fecha text, 
	importe_bruto text,	
	importe_neto text,
	importe_retenido text
	));


INSERT INTO bmem.op_detalle_de_aplicado (WITH t AS (select x::json->'documents'->0->'fields'->'CustomerName'->>'content' as cliente,
				x::json->'documents'->0->'fields'->'InvoiceId'->>'content' as doc_id, 
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') as fecha_emision,
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') - interval '2 months' as periodo
from stage_op)
SELECT id, REPLACE(comprobante, '_', '') AS comprobante, REPLACE(documento_int, '_', '') AS documento_int, 
						TO_DATE(REPLACE(fecha, '_', ''), 'DD.MM.YYYY') AS fecha, 
						CASE WHEN importe_bruto LIKE '%-%' THEN ((REPLACE(REPLACE(TRANSLATE(importe_bruto, ' ._', ''), ',', '.'), '-', ''))::numeric *-1) ELSE (REPLACE(TRANSLATE(importe_bruto, ' ._', ''), ',', '.'))::numeric END AS importe_bruto, 
						CASE WHEN REPLACE(REPLACE(importe_neto, '$', ''), '_', '') LIKE '%-%' THEN ((REPLACE(REPLACE(TRANSLATE(importe_neto, ' _.$', ''), ',', '.'), '-', ''))::numeric *-1) ELSE (REPLACE(REPLACE(TRANSLATE(importe_neto, ' _.$', ''), ',', '.'), '-', '')::numeric) END AS importe_neto,
						CASE WHEN importe_retenido LIKE '%-%' THEN ((REPLACE(REPLACE(TRANSLATE(importe_retenido, ' .$_', ''), ',', '.'), '-', ''))::numeric *-1) ELSE (REPLACE(TRANSLATE(importe_retenido, ' .$_', ''), ',', '.'))::numeric END AS importe_retenido,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;

--------------------------------------------------
ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_pago RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->1->'cells');


DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%porte%');DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';

DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op_pago'::regclass), 
     content2 text,
     columna text	  ); 


INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;
UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'concepto' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'banco' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'cuenta_banc' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'cheque' WHERE id = 4 ;
UPDATE stage_d_aplicado3 SET columna = 'importe' WHERE id = 5 ;

ALTER SEQUENCE  bmem.rowname RESTART;

DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;



DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;

insert into stage_d_aplicado4 
select id, content2, 'importe' FROM stage_d_aplicado4 WHERE columna = 'cheque'
AND not exists (
    select id from stage_d_aplicado4 where columna = 'importe'
);


UPDATE stage_d_aplicado4 SET content2 = null WHERE columna = 'cheque';

DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) = 5 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
    banco text COLLATE pg_catalog."default",
    cuenta_banc text COLLATE pg_catalog."default",
    concepto text COLLATE pg_catalog."default",
    cheque text COLLATE pg_catalog."default",
    importe text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	concepto text, 
	banco text,
	cuenta_banc text, 
	cheque text,	
	importe text
	));

UPDATE stage_d_aplicado5 SET cheque = null;


INSERT INTO bmem.op_detalle_de_pago (WITH t AS (select x::json->'documents'->0->'fields'->'CustomerName'->>'content' as cliente,
				x::json->'documents'->0->'fields'->'InvoiceId'->>'content' as doc_id, 
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') as fecha_emision,
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') - interval '2 months' as periodo
from stage_op)
SELECT id, 
		TRANSLATE(banco, '_0123456789', '') AS banco, 
		regexp_replace(banco, '\D','','g') as cuenta_banc,
		concepto,
		(REPLACE(TRANSLATE(cheque, '._$ ', ''), ',', '.'))::numeric  as cheque,
		(REPLACE(TRANSLATE(importe, '._$ ', ''), ',', '.'))::numeric  as importe,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;
						
--------------------------------------------------------------------------------------------------------------

ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones2 RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->2->'cells');


DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%porte%');DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';


DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op_retenciones'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;
UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'concepto' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'num_certif' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'cod_seg' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'importe' WHERE id = 4 ;

ALTER SEQUENCE  bmem.rowname RESTART;

DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;

insert into stage_d_aplicado4 
select id, content2, 'importe' FROM stage_d_aplicado4 WHERE columna = 'cod_seg'
AND not exists (
    select id from stage_d_aplicado4 where columna = 'importe'
);

UPDATE stage_d_aplicado4 SET content2 = null WHERE columna = 'cod_seg';UPDATE stage_d_aplicado4 SET content2 = ((RIGHT(content2, -5))) WHERE content2 like '____% % %$';

DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) <= 4 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
	cod_seg text,
    concepto text COLLATE pg_catalog."default",
    importe text COLLATE pg_catalog."default",
    num_certif text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	cod_seg text,
	concepto text, 
	importe text,
	num_certif text
	)) ;


DO $$
DECLARE sql TEXT;
BEGIN
    SELECT CASE 
            WHEN (select 1 from stage_d_aplicado5 WHERE importe ~ '^[^0-9]+$' limit 1) = 1
                THEN 'DROP TABLE stage_d_aplicado5;'
            ELSE 'INSERT INTO bmem.op_retenciones(id , concepto , importe , num_certif , doc_id , fecha_emision , cliente , periodo ) (WITH t AS (select x::json->''documents''->0->''fields''->''CustomerName''->>''content'' as cliente,
				x::json->''documents''->0->''fields''->''InvoiceId''->>''content'' as doc_id, 
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') as fecha_emision,
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') - interval ''2 months'' as periodo
from stage_op)
SELECT id, 
		TRANSLATE(concepto, ''_'', '''') AS concepto, 
		((REPLACE(TRANSLATE(importe, ''.-_$ '', ''''), '','', ''.''))::numeric *-1)  as importe,
		TRANSLATE(num_certif, ''_'', '''') AS num_certif,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;'
            END AS qry
    INTO sql
    FROM stage_d_aplicado5 limit 1;
    EXECUTE (sql);
END $$;
------------------------------------------------------------
DELETE from bmem.op_retenciones WHERE concepto NOT like '%MEM%'; DELETE FROM bmem.op_retenciones WHERE importe < -9999999999;
------------------------------------------------------------
ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones2 RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->2->'cells');


DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%porte%');DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';


DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op_retenciones2'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;
UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'concepto' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'num_certif' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'cod_seg' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'importe' WHERE id = 4 ;

ALTER SEQUENCE  bmem.rowname RESTART;

DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;

insert into stage_d_aplicado4 
select id, content2, 'importe' FROM stage_d_aplicado4 WHERE columna = 'cod_seg'
AND not exists (
    select id from stage_d_aplicado4 where columna = 'importe'
);

UPDATE stage_d_aplicado4 SET content2 = null WHERE columna = 'cod_seg';UPDATE stage_d_aplicado4 SET content2 = ((RIGHT(content2, -5))) WHERE content2 like '____% % %$';

DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) <= 4 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
	cod_seg text,
    concepto text COLLATE pg_catalog."default",
    importe text COLLATE pg_catalog."default",
    num_certif text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	cod_seg text,
	concepto text, 
	importe text,
	num_certif text
	)) ;


DO $$
DECLARE sql TEXT;
BEGIN
    SELECT CASE 
            WHEN (select 1 from stage_d_aplicado5 WHERE importe ~ '^[^0-9]+$' limit 1) = 1
                THEN 'DROP TABLE stage_d_aplicado5;'
            ELSE 'INSERT INTO bmem.op_retenciones(id , concepto , importe , num_certif , doc_id , fecha_emision , cliente , periodo ) (WITH t AS (select x::json->''documents''->0->''fields''->''CustomerName''->>''content'' as cliente,
				x::json->''documents''->0->''fields''->''InvoiceId''->>''content'' as doc_id, 
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') as fecha_emision,
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') - interval ''2 months'' as periodo
from stage_op)
SELECT id, 
		TRANSLATE(concepto, ''_'', '''') AS concepto, 
		((REPLACE(TRANSLATE(importe, ''.-_$ '', ''''), '','', ''.''))::numeric *-1)  as importe,
		TRANSLATE(num_certif, ''_'', '''') AS num_certif,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;'
            END AS qry
    INTO sql
    FROM stage_d_aplicado5 limit 1;
    EXECUTE (sql);
END $$;

--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------

ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

DROP TABLE IF EXISTS stage_op;
DROP TABLE IF EXISTS stage_json_d_aplicado;


CREATE TEMP TABLE stage_json_d_aplicado 
  ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     json text 
  ); 
 
CREATE TEMP TABLE stage_op (x jsonb);
COPY stage_json_d_aplicado(json) FROM 'C:\Users\Administrador\GoesGreen SRL\I4 - AUTO\import\28.json' csv quote e'\x01' delimiter e'\x02';

INSERT INTO stage_op(x)
SELECT   string_agg( json ,e'\n' ORDER BY id)::jsonb 
FROM     stage_json_d_aplicado;


ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->0->'cells');

DELETE FROM  stage_d_aplicado2 WHERE id >= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE 'Total%');
DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%Neto%');
DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';

DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op'::regclass), 
     content2 text,
     columna text	  ); 


INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;

UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'fecha' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'comprobante' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'documento_int' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'importe_bruto' WHERE id = 4 ;
UPDATE stage_d_aplicado3 SET columna = 'importe_retenido' WHERE id = 5 ;
UPDATE stage_d_aplicado3 SET columna = 'importe_neto' WHERE id = 6 ;

ALTER SEQUENCE  bmem.rowname RESTART;


DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;


DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) = 6 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
    comprobante text COLLATE pg_catalog."default",
    documento_int text COLLATE pg_catalog."default",
    fecha text COLLATE pg_catalog."default",
    importe_bruto text COLLATE pg_catalog."default",
    importe_neto text COLLATE pg_catalog."default",
    importe_retenido text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	comprobante text, 
	documento_int text,
	fecha text, 
	importe_bruto text,	
	importe_neto text,
	importe_retenido text
	));


INSERT INTO bmem.op_detalle_de_aplicado (WITH t AS (select x::json->'documents'->0->'fields'->'CustomerName'->>'content' as cliente,
				x::json->'documents'->0->'fields'->'InvoiceId'->>'content' as doc_id, 
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') as fecha_emision,
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') - interval '2 months' as periodo
from stage_op)
SELECT id, REPLACE(comprobante, '_', '') AS comprobante, REPLACE(documento_int, '_', '') AS documento_int, 
						TO_DATE(REPLACE(fecha, '_', ''), 'DD.MM.YYYY') AS fecha, 
						CASE WHEN importe_bruto LIKE '%-%' THEN ((REPLACE(REPLACE(TRANSLATE(importe_bruto, ' ._', ''), ',', '.'), '-', ''))::numeric *-1) ELSE (REPLACE(TRANSLATE(importe_bruto, ' ._', ''), ',', '.'))::numeric END AS importe_bruto, 
						CASE WHEN REPLACE(REPLACE(importe_neto, '$', ''), '_', '') LIKE '%-%' THEN ((REPLACE(REPLACE(TRANSLATE(importe_neto, ' _.$', ''), ',', '.'), '-', ''))::numeric *-1) ELSE (REPLACE(REPLACE(TRANSLATE(importe_neto, ' _.$', ''), ',', '.'), '-', '')::numeric) END AS importe_neto,
						CASE WHEN importe_retenido LIKE '%-%' THEN ((REPLACE(REPLACE(TRANSLATE(importe_retenido, ' .$_', ''), ',', '.'), '-', ''))::numeric *-1) ELSE (REPLACE(TRANSLATE(importe_retenido, ' .$_', ''), ',', '.'))::numeric END AS importe_retenido,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;

--------------------------------------------------
ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_pago RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->1->'cells');


DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%porte%');DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';

DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op_pago'::regclass), 
     content2 text,
     columna text	  ); 


INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;
UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'concepto' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'banco' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'cuenta_banc' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'cheque' WHERE id = 4 ;
UPDATE stage_d_aplicado3 SET columna = 'importe' WHERE id = 5 ;

ALTER SEQUENCE  bmem.rowname RESTART;

DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;



DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;

insert into stage_d_aplicado4 
select id, content2, 'importe' FROM stage_d_aplicado4 WHERE columna = 'cheque'
AND not exists (
    select id from stage_d_aplicado4 where columna = 'importe'
);


UPDATE stage_d_aplicado4 SET content2 = null WHERE columna = 'cheque';

DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) = 5 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
    banco text COLLATE pg_catalog."default",
    cuenta_banc text COLLATE pg_catalog."default",
    concepto text COLLATE pg_catalog."default",
    cheque text COLLATE pg_catalog."default",
    importe text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	concepto text, 
	banco text,
	cuenta_banc text, 
	cheque text,	
	importe text
	));

UPDATE stage_d_aplicado5 SET cheque = null;


INSERT INTO bmem.op_detalle_de_pago (WITH t AS (select x::json->'documents'->0->'fields'->'CustomerName'->>'content' as cliente,
				x::json->'documents'->0->'fields'->'InvoiceId'->>'content' as doc_id, 
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') as fecha_emision,
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') - interval '2 months' as periodo
from stage_op)
SELECT id, 
		TRANSLATE(banco, '_0123456789', '') AS banco, 
		regexp_replace(banco, '\D','','g') as cuenta_banc,
		concepto,
		(REPLACE(TRANSLATE(cheque, '._$ ', ''), ',', '.'))::numeric  as cheque,
		(REPLACE(TRANSLATE(importe, '._$ ', ''), ',', '.'))::numeric  as importe,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;
						
--------------------------------------------------------------------------------------------------------------

ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones2 RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->2->'cells');


DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%porte%');DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';


DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op_retenciones'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;
UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'concepto' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'num_certif' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'cod_seg' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'importe' WHERE id = 4 ;

ALTER SEQUENCE  bmem.rowname RESTART;

DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;

insert into stage_d_aplicado4 
select id, content2, 'importe' FROM stage_d_aplicado4 WHERE columna = 'cod_seg'
AND not exists (
    select id from stage_d_aplicado4 where columna = 'importe'
);

UPDATE stage_d_aplicado4 SET content2 = null WHERE columna = 'cod_seg';UPDATE stage_d_aplicado4 SET content2 = ((RIGHT(content2, -5))) WHERE content2 like '____% % %$';

DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) <= 4 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
	cod_seg text,
    concepto text COLLATE pg_catalog."default",
    importe text COLLATE pg_catalog."default",
    num_certif text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	cod_seg text,
	concepto text, 
	importe text,
	num_certif text
	)) ;


DO $$
DECLARE sql TEXT;
BEGIN
    SELECT CASE 
            WHEN (select 1 from stage_d_aplicado5 WHERE importe ~ '^[^0-9]+$' limit 1) = 1
                THEN 'DROP TABLE stage_d_aplicado5;'
            ELSE 'INSERT INTO bmem.op_retenciones(id , concepto , importe , num_certif , doc_id , fecha_emision , cliente , periodo ) (WITH t AS (select x::json->''documents''->0->''fields''->''CustomerName''->>''content'' as cliente,
				x::json->''documents''->0->''fields''->''InvoiceId''->>''content'' as doc_id, 
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') as fecha_emision,
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') - interval ''2 months'' as periodo
from stage_op)
SELECT id, 
		TRANSLATE(concepto, ''_'', '''') AS concepto, 
		((REPLACE(TRANSLATE(importe, ''.-_$ '', ''''), '','', ''.''))::numeric *-1)  as importe,
		TRANSLATE(num_certif, ''_'', '''') AS num_certif,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;'
            END AS qry
    INTO sql
    FROM stage_d_aplicado5 limit 1;
    EXECUTE (sql);
END $$;
------------------------------------------------------------
DELETE from bmem.op_retenciones WHERE concepto NOT like '%MEM%'; DELETE FROM bmem.op_retenciones WHERE importe < -9999999999;
------------------------------------------------------------
ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones2 RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->2->'cells');


DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%porte%');DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';


DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op_retenciones2'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;
UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'concepto' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'num_certif' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'cod_seg' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'importe' WHERE id = 4 ;

ALTER SEQUENCE  bmem.rowname RESTART;

DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;

insert into stage_d_aplicado4 
select id, content2, 'importe' FROM stage_d_aplicado4 WHERE columna = 'cod_seg'
AND not exists (
    select id from stage_d_aplicado4 where columna = 'importe'
);

UPDATE stage_d_aplicado4 SET content2 = null WHERE columna = 'cod_seg';UPDATE stage_d_aplicado4 SET content2 = ((RIGHT(content2, -5))) WHERE content2 like '____% % %$';

DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) <= 4 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
	cod_seg text,
    concepto text COLLATE pg_catalog."default",
    importe text COLLATE pg_catalog."default",
    num_certif text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	cod_seg text,
	concepto text, 
	importe text,
	num_certif text
	)) ;


DO $$
DECLARE sql TEXT;
BEGIN
    SELECT CASE 
            WHEN (select 1 from stage_d_aplicado5 WHERE importe ~ '^[^0-9]+$' limit 1) = 1
                THEN 'DROP TABLE stage_d_aplicado5;'
            ELSE 'INSERT INTO bmem.op_retenciones(id , concepto , importe , num_certif , doc_id , fecha_emision , cliente , periodo ) (WITH t AS (select x::json->''documents''->0->''fields''->''CustomerName''->>''content'' as cliente,
				x::json->''documents''->0->''fields''->''InvoiceId''->>''content'' as doc_id, 
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') as fecha_emision,
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') - interval ''2 months'' as periodo
from stage_op)
SELECT id, 
		TRANSLATE(concepto, ''_'', '''') AS concepto, 
		((REPLACE(TRANSLATE(importe, ''.-_$ '', ''''), '','', ''.''))::numeric *-1)  as importe,
		TRANSLATE(num_certif, ''_'', '''') AS num_certif,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;'
            END AS qry
    INTO sql
    FROM stage_d_aplicado5 limit 1;
    EXECUTE (sql);
END $$;

--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------

ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

DROP TABLE IF EXISTS stage_op;
DROP TABLE IF EXISTS stage_json_d_aplicado;


CREATE TEMP TABLE stage_json_d_aplicado 
  ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     json text 
  ); 
 
CREATE TEMP TABLE stage_op (x jsonb);
COPY stage_json_d_aplicado(json) FROM 'C:\Users\Administrador\GoesGreen SRL\I4 - AUTO\import\29.json' csv quote e'\x01' delimiter e'\x02';

INSERT INTO stage_op(x)
SELECT   string_agg( json ,e'\n' ORDER BY id)::jsonb 
FROM     stage_json_d_aplicado;


ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->0->'cells');

DELETE FROM  stage_d_aplicado2 WHERE id >= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE 'Total%');
DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%Neto%');
DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';

DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op'::regclass), 
     content2 text,
     columna text	  ); 


INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;

UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'fecha' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'comprobante' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'documento_int' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'importe_bruto' WHERE id = 4 ;
UPDATE stage_d_aplicado3 SET columna = 'importe_retenido' WHERE id = 5 ;
UPDATE stage_d_aplicado3 SET columna = 'importe_neto' WHERE id = 6 ;

ALTER SEQUENCE  bmem.rowname RESTART;


DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;


DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) = 6 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
    comprobante text COLLATE pg_catalog."default",
    documento_int text COLLATE pg_catalog."default",
    fecha text COLLATE pg_catalog."default",
    importe_bruto text COLLATE pg_catalog."default",
    importe_neto text COLLATE pg_catalog."default",
    importe_retenido text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	comprobante text, 
	documento_int text,
	fecha text, 
	importe_bruto text,	
	importe_neto text,
	importe_retenido text
	));


INSERT INTO bmem.op_detalle_de_aplicado (WITH t AS (select x::json->'documents'->0->'fields'->'CustomerName'->>'content' as cliente,
				x::json->'documents'->0->'fields'->'InvoiceId'->>'content' as doc_id, 
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') as fecha_emision,
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') - interval '2 months' as periodo
from stage_op)
SELECT id, REPLACE(comprobante, '_', '') AS comprobante, REPLACE(documento_int, '_', '') AS documento_int, 
						TO_DATE(REPLACE(fecha, '_', ''), 'DD.MM.YYYY') AS fecha, 
						CASE WHEN importe_bruto LIKE '%-%' THEN ((REPLACE(REPLACE(TRANSLATE(importe_bruto, ' ._', ''), ',', '.'), '-', ''))::numeric *-1) ELSE (REPLACE(TRANSLATE(importe_bruto, ' ._', ''), ',', '.'))::numeric END AS importe_bruto, 
						CASE WHEN REPLACE(REPLACE(importe_neto, '$', ''), '_', '') LIKE '%-%' THEN ((REPLACE(REPLACE(TRANSLATE(importe_neto, ' _.$', ''), ',', '.'), '-', ''))::numeric *-1) ELSE (REPLACE(REPLACE(TRANSLATE(importe_neto, ' _.$', ''), ',', '.'), '-', '')::numeric) END AS importe_neto,
						CASE WHEN importe_retenido LIKE '%-%' THEN ((REPLACE(REPLACE(TRANSLATE(importe_retenido, ' .$_', ''), ',', '.'), '-', ''))::numeric *-1) ELSE (REPLACE(TRANSLATE(importe_retenido, ' .$_', ''), ',', '.'))::numeric END AS importe_retenido,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;

--------------------------------------------------
ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_pago RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->1->'cells');


DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%porte%');DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';

DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op_pago'::regclass), 
     content2 text,
     columna text	  ); 


INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;
UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'concepto' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'banco' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'cuenta_banc' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'cheque' WHERE id = 4 ;
UPDATE stage_d_aplicado3 SET columna = 'importe' WHERE id = 5 ;

ALTER SEQUENCE  bmem.rowname RESTART;

DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;



DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;

insert into stage_d_aplicado4 
select id, content2, 'importe' FROM stage_d_aplicado4 WHERE columna = 'cheque'
AND not exists (
    select id from stage_d_aplicado4 where columna = 'importe'
);


UPDATE stage_d_aplicado4 SET content2 = null WHERE columna = 'cheque';

DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) = 5 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
    banco text COLLATE pg_catalog."default",
    cuenta_banc text COLLATE pg_catalog."default",
    concepto text COLLATE pg_catalog."default",
    cheque text COLLATE pg_catalog."default",
    importe text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	concepto text, 
	banco text,
	cuenta_banc text, 
	cheque text,	
	importe text
	));

UPDATE stage_d_aplicado5 SET cheque = null;


INSERT INTO bmem.op_detalle_de_pago (WITH t AS (select x::json->'documents'->0->'fields'->'CustomerName'->>'content' as cliente,
				x::json->'documents'->0->'fields'->'InvoiceId'->>'content' as doc_id, 
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') as fecha_emision,
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') - interval '2 months' as periodo
from stage_op)
SELECT id, 
		TRANSLATE(banco, '_0123456789', '') AS banco, 
		regexp_replace(banco, '\D','','g') as cuenta_banc,
		concepto,
		(REPLACE(TRANSLATE(cheque, '._$ ', ''), ',', '.'))::numeric  as cheque,
		(REPLACE(TRANSLATE(importe, '._$ ', ''), ',', '.'))::numeric  as importe,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;
						
--------------------------------------------------------------------------------------------------------------

ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones2 RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->2->'cells');


DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%porte%');DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';


DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op_retenciones'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;
UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'concepto' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'num_certif' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'cod_seg' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'importe' WHERE id = 4 ;

ALTER SEQUENCE  bmem.rowname RESTART;

DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;

insert into stage_d_aplicado4 
select id, content2, 'importe' FROM stage_d_aplicado4 WHERE columna = 'cod_seg'
AND not exists (
    select id from stage_d_aplicado4 where columna = 'importe'
);

UPDATE stage_d_aplicado4 SET content2 = null WHERE columna = 'cod_seg';UPDATE stage_d_aplicado4 SET content2 = ((RIGHT(content2, -5))) WHERE content2 like '____% % %$';

DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) <= 4 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
	cod_seg text,
    concepto text COLLATE pg_catalog."default",
    importe text COLLATE pg_catalog."default",
    num_certif text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	cod_seg text,
	concepto text, 
	importe text,
	num_certif text
	)) ;


DO $$
DECLARE sql TEXT;
BEGIN
    SELECT CASE 
            WHEN (select 1 from stage_d_aplicado5 WHERE importe ~ '^[^0-9]+$' limit 1) = 1
                THEN 'DROP TABLE stage_d_aplicado5;'
            ELSE 'INSERT INTO bmem.op_retenciones(id , concepto , importe , num_certif , doc_id , fecha_emision , cliente , periodo ) (WITH t AS (select x::json->''documents''->0->''fields''->''CustomerName''->>''content'' as cliente,
				x::json->''documents''->0->''fields''->''InvoiceId''->>''content'' as doc_id, 
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') as fecha_emision,
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') - interval ''2 months'' as periodo
from stage_op)
SELECT id, 
		TRANSLATE(concepto, ''_'', '''') AS concepto, 
		((REPLACE(TRANSLATE(importe, ''.-_$ '', ''''), '','', ''.''))::numeric *-1)  as importe,
		TRANSLATE(num_certif, ''_'', '''') AS num_certif,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;'
            END AS qry
    INTO sql
    FROM stage_d_aplicado5 limit 1;
    EXECUTE (sql);
END $$;
------------------------------------------------------------
DELETE from bmem.op_retenciones WHERE concepto NOT like '%MEM%'; DELETE FROM bmem.op_retenciones WHERE importe < -9999999999;
------------------------------------------------------------
ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones2 RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->2->'cells');


DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%porte%');DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';


DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op_retenciones2'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;
UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'concepto' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'num_certif' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'cod_seg' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'importe' WHERE id = 4 ;

ALTER SEQUENCE  bmem.rowname RESTART;

DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;

insert into stage_d_aplicado4 
select id, content2, 'importe' FROM stage_d_aplicado4 WHERE columna = 'cod_seg'
AND not exists (
    select id from stage_d_aplicado4 where columna = 'importe'
);

UPDATE stage_d_aplicado4 SET content2 = null WHERE columna = 'cod_seg';UPDATE stage_d_aplicado4 SET content2 = ((RIGHT(content2, -5))) WHERE content2 like '____% % %$';

DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) <= 4 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
	cod_seg text,
    concepto text COLLATE pg_catalog."default",
    importe text COLLATE pg_catalog."default",
    num_certif text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	cod_seg text,
	concepto text, 
	importe text,
	num_certif text
	)) ;


DO $$
DECLARE sql TEXT;
BEGIN
    SELECT CASE 
            WHEN (select 1 from stage_d_aplicado5 WHERE importe ~ '^[^0-9]+$' limit 1) = 1
                THEN 'DROP TABLE stage_d_aplicado5;'
            ELSE 'INSERT INTO bmem.op_retenciones(id , concepto , importe , num_certif , doc_id , fecha_emision , cliente , periodo ) (WITH t AS (select x::json->''documents''->0->''fields''->''CustomerName''->>''content'' as cliente,
				x::json->''documents''->0->''fields''->''InvoiceId''->>''content'' as doc_id, 
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') as fecha_emision,
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') - interval ''2 months'' as periodo
from stage_op)
SELECT id, 
		TRANSLATE(concepto, ''_'', '''') AS concepto, 
		((REPLACE(TRANSLATE(importe, ''.-_$ '', ''''), '','', ''.''))::numeric *-1)  as importe,
		TRANSLATE(num_certif, ''_'', '''') AS num_certif,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;'
            END AS qry
    INTO sql
    FROM stage_d_aplicado5 limit 1;
    EXECUTE (sql);
END $$;

--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------

ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

DROP TABLE IF EXISTS stage_op;
DROP TABLE IF EXISTS stage_json_d_aplicado;


CREATE TEMP TABLE stage_json_d_aplicado 
  ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     json text 
  ); 
 
CREATE TEMP TABLE stage_op (x jsonb);
COPY stage_json_d_aplicado(json) FROM 'C:\Users\Administrador\GoesGreen SRL\I4 - AUTO\import\30.json' csv quote e'\x01' delimiter e'\x02';

INSERT INTO stage_op(x)
SELECT   string_agg( json ,e'\n' ORDER BY id)::jsonb 
FROM     stage_json_d_aplicado;


ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->0->'cells');

DELETE FROM  stage_d_aplicado2 WHERE id >= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE 'Total%');
DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%Neto%');
DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';

DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op'::regclass), 
     content2 text,
     columna text	  ); 


INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;

UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'fecha' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'comprobante' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'documento_int' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'importe_bruto' WHERE id = 4 ;
UPDATE stage_d_aplicado3 SET columna = 'importe_retenido' WHERE id = 5 ;
UPDATE stage_d_aplicado3 SET columna = 'importe_neto' WHERE id = 6 ;

ALTER SEQUENCE  bmem.rowname RESTART;


DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;


DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) = 6 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
    comprobante text COLLATE pg_catalog."default",
    documento_int text COLLATE pg_catalog."default",
    fecha text COLLATE pg_catalog."default",
    importe_bruto text COLLATE pg_catalog."default",
    importe_neto text COLLATE pg_catalog."default",
    importe_retenido text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	comprobante text, 
	documento_int text,
	fecha text, 
	importe_bruto text,	
	importe_neto text,
	importe_retenido text
	));


INSERT INTO bmem.op_detalle_de_aplicado (WITH t AS (select x::json->'documents'->0->'fields'->'CustomerName'->>'content' as cliente,
				x::json->'documents'->0->'fields'->'InvoiceId'->>'content' as doc_id, 
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') as fecha_emision,
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') - interval '2 months' as periodo
from stage_op)
SELECT id, REPLACE(comprobante, '_', '') AS comprobante, REPLACE(documento_int, '_', '') AS documento_int, 
						TO_DATE(REPLACE(fecha, '_', ''), 'DD.MM.YYYY') AS fecha, 
						CASE WHEN importe_bruto LIKE '%-%' THEN ((REPLACE(REPLACE(TRANSLATE(importe_bruto, ' ._', ''), ',', '.'), '-', ''))::numeric *-1) ELSE (REPLACE(TRANSLATE(importe_bruto, ' ._', ''), ',', '.'))::numeric END AS importe_bruto, 
						CASE WHEN REPLACE(REPLACE(importe_neto, '$', ''), '_', '') LIKE '%-%' THEN ((REPLACE(REPLACE(TRANSLATE(importe_neto, ' _.$', ''), ',', '.'), '-', ''))::numeric *-1) ELSE (REPLACE(REPLACE(TRANSLATE(importe_neto, ' _.$', ''), ',', '.'), '-', '')::numeric) END AS importe_neto,
						CASE WHEN importe_retenido LIKE '%-%' THEN ((REPLACE(REPLACE(TRANSLATE(importe_retenido, ' .$_', ''), ',', '.'), '-', ''))::numeric *-1) ELSE (REPLACE(TRANSLATE(importe_retenido, ' .$_', ''), ',', '.'))::numeric END AS importe_retenido,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;

--------------------------------------------------
ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_pago RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->1->'cells');


DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%porte%');DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';

DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op_pago'::regclass), 
     content2 text,
     columna text	  ); 


INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;
UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'concepto' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'banco' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'cuenta_banc' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'cheque' WHERE id = 4 ;
UPDATE stage_d_aplicado3 SET columna = 'importe' WHERE id = 5 ;

ALTER SEQUENCE  bmem.rowname RESTART;

DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;



DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;

insert into stage_d_aplicado4 
select id, content2, 'importe' FROM stage_d_aplicado4 WHERE columna = 'cheque'
AND not exists (
    select id from stage_d_aplicado4 where columna = 'importe'
);


UPDATE stage_d_aplicado4 SET content2 = null WHERE columna = 'cheque';

DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) = 5 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
    banco text COLLATE pg_catalog."default",
    cuenta_banc text COLLATE pg_catalog."default",
    concepto text COLLATE pg_catalog."default",
    cheque text COLLATE pg_catalog."default",
    importe text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	concepto text, 
	banco text,
	cuenta_banc text, 
	cheque text,	
	importe text
	));

UPDATE stage_d_aplicado5 SET cheque = null;


INSERT INTO bmem.op_detalle_de_pago (WITH t AS (select x::json->'documents'->0->'fields'->'CustomerName'->>'content' as cliente,
				x::json->'documents'->0->'fields'->'InvoiceId'->>'content' as doc_id, 
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') as fecha_emision,
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') - interval '2 months' as periodo
from stage_op)
SELECT id, 
		TRANSLATE(banco, '_0123456789', '') AS banco, 
		regexp_replace(banco, '\D','','g') as cuenta_banc,
		concepto,
		(REPLACE(TRANSLATE(cheque, '._$ ', ''), ',', '.'))::numeric  as cheque,
		(REPLACE(TRANSLATE(importe, '._$ ', ''), ',', '.'))::numeric  as importe,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;
						
--------------------------------------------------------------------------------------------------------------

ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones2 RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->2->'cells');


DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%porte%');DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';


DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op_retenciones'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;
UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'concepto' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'num_certif' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'cod_seg' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'importe' WHERE id = 4 ;

ALTER SEQUENCE  bmem.rowname RESTART;

DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;

insert into stage_d_aplicado4 
select id, content2, 'importe' FROM stage_d_aplicado4 WHERE columna = 'cod_seg'
AND not exists (
    select id from stage_d_aplicado4 where columna = 'importe'
);

UPDATE stage_d_aplicado4 SET content2 = null WHERE columna = 'cod_seg';UPDATE stage_d_aplicado4 SET content2 = ((RIGHT(content2, -5))) WHERE content2 like '____% % %$';

DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) <= 4 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
	cod_seg text,
    concepto text COLLATE pg_catalog."default",
    importe text COLLATE pg_catalog."default",
    num_certif text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	cod_seg text,
	concepto text, 
	importe text,
	num_certif text
	)) ;


DO $$
DECLARE sql TEXT;
BEGIN
    SELECT CASE 
            WHEN (select 1 from stage_d_aplicado5 WHERE importe ~ '^[^0-9]+$' limit 1) = 1
                THEN 'DROP TABLE stage_d_aplicado5;'
            ELSE 'INSERT INTO bmem.op_retenciones(id , concepto , importe , num_certif , doc_id , fecha_emision , cliente , periodo ) (WITH t AS (select x::json->''documents''->0->''fields''->''CustomerName''->>''content'' as cliente,
				x::json->''documents''->0->''fields''->''InvoiceId''->>''content'' as doc_id, 
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') as fecha_emision,
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') - interval ''2 months'' as periodo
from stage_op)
SELECT id, 
		TRANSLATE(concepto, ''_'', '''') AS concepto, 
		((REPLACE(TRANSLATE(importe, ''.-_$ '', ''''), '','', ''.''))::numeric *-1)  as importe,
		TRANSLATE(num_certif, ''_'', '''') AS num_certif,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;'
            END AS qry
    INTO sql
    FROM stage_d_aplicado5 limit 1;
    EXECUTE (sql);
END $$;
------------------------------------------------------------
DELETE from bmem.op_retenciones WHERE concepto NOT like '%MEM%'; DELETE FROM bmem.op_retenciones WHERE importe < -9999999999;
------------------------------------------------------------
ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones2 RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->2->'cells');


DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%porte%');DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';


DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op_retenciones2'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;
UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'concepto' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'num_certif' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'cod_seg' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'importe' WHERE id = 4 ;

ALTER SEQUENCE  bmem.rowname RESTART;

DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;

insert into stage_d_aplicado4 
select id, content2, 'importe' FROM stage_d_aplicado4 WHERE columna = 'cod_seg'
AND not exists (
    select id from stage_d_aplicado4 where columna = 'importe'
);

UPDATE stage_d_aplicado4 SET content2 = null WHERE columna = 'cod_seg';UPDATE stage_d_aplicado4 SET content2 = ((RIGHT(content2, -5))) WHERE content2 like '____% % %$';

DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) <= 4 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
	cod_seg text,
    concepto text COLLATE pg_catalog."default",
    importe text COLLATE pg_catalog."default",
    num_certif text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	cod_seg text,
	concepto text, 
	importe text,
	num_certif text
	)) ;


DO $$
DECLARE sql TEXT;
BEGIN
    SELECT CASE 
            WHEN (select 1 from stage_d_aplicado5 WHERE importe ~ '^[^0-9]+$' limit 1) = 1
                THEN 'DROP TABLE stage_d_aplicado5;'
            ELSE 'INSERT INTO bmem.op_retenciones(id , concepto , importe , num_certif , doc_id , fecha_emision , cliente , periodo ) (WITH t AS (select x::json->''documents''->0->''fields''->''CustomerName''->>''content'' as cliente,
				x::json->''documents''->0->''fields''->''InvoiceId''->>''content'' as doc_id, 
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') as fecha_emision,
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') - interval ''2 months'' as periodo
from stage_op)
SELECT id, 
		TRANSLATE(concepto, ''_'', '''') AS concepto, 
		((REPLACE(TRANSLATE(importe, ''.-_$ '', ''''), '','', ''.''))::numeric *-1)  as importe,
		TRANSLATE(num_certif, ''_'', '''') AS num_certif,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;'
            END AS qry
    INTO sql
    FROM stage_d_aplicado5 limit 1;
    EXECUTE (sql);
END $$;

--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------

ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

DROP TABLE IF EXISTS stage_op;
DROP TABLE IF EXISTS stage_json_d_aplicado;


CREATE TEMP TABLE stage_json_d_aplicado 
  ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     json text 
  ); 
 
CREATE TEMP TABLE stage_op (x jsonb);
COPY stage_json_d_aplicado(json) FROM 'C:\Users\Administrador\GoesGreen SRL\I4 - AUTO\import\31.json' csv quote e'\x01' delimiter e'\x02';

INSERT INTO stage_op(x)
SELECT   string_agg( json ,e'\n' ORDER BY id)::jsonb 
FROM     stage_json_d_aplicado;


ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->0->'cells');

DELETE FROM  stage_d_aplicado2 WHERE id >= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE 'Total%');
DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%Neto%');
DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';

DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op'::regclass), 
     content2 text,
     columna text	  ); 


INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;

UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'fecha' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'comprobante' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'documento_int' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'importe_bruto' WHERE id = 4 ;
UPDATE stage_d_aplicado3 SET columna = 'importe_retenido' WHERE id = 5 ;
UPDATE stage_d_aplicado3 SET columna = 'importe_neto' WHERE id = 6 ;

ALTER SEQUENCE  bmem.rowname RESTART;


DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;


DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) = 6 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
    comprobante text COLLATE pg_catalog."default",
    documento_int text COLLATE pg_catalog."default",
    fecha text COLLATE pg_catalog."default",
    importe_bruto text COLLATE pg_catalog."default",
    importe_neto text COLLATE pg_catalog."default",
    importe_retenido text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	comprobante text, 
	documento_int text,
	fecha text, 
	importe_bruto text,	
	importe_neto text,
	importe_retenido text
	));


INSERT INTO bmem.op_detalle_de_aplicado (WITH t AS (select x::json->'documents'->0->'fields'->'CustomerName'->>'content' as cliente,
				x::json->'documents'->0->'fields'->'InvoiceId'->>'content' as doc_id, 
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') as fecha_emision,
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') - interval '2 months' as periodo
from stage_op)
SELECT id, REPLACE(comprobante, '_', '') AS comprobante, REPLACE(documento_int, '_', '') AS documento_int, 
						TO_DATE(REPLACE(fecha, '_', ''), 'DD.MM.YYYY') AS fecha, 
						CASE WHEN importe_bruto LIKE '%-%' THEN ((REPLACE(REPLACE(TRANSLATE(importe_bruto, ' ._', ''), ',', '.'), '-', ''))::numeric *-1) ELSE (REPLACE(TRANSLATE(importe_bruto, ' ._', ''), ',', '.'))::numeric END AS importe_bruto, 
						CASE WHEN REPLACE(REPLACE(importe_neto, '$', ''), '_', '') LIKE '%-%' THEN ((REPLACE(REPLACE(TRANSLATE(importe_neto, ' _.$', ''), ',', '.'), '-', ''))::numeric *-1) ELSE (REPLACE(REPLACE(TRANSLATE(importe_neto, ' _.$', ''), ',', '.'), '-', '')::numeric) END AS importe_neto,
						CASE WHEN importe_retenido LIKE '%-%' THEN ((REPLACE(REPLACE(TRANSLATE(importe_retenido, ' .$_', ''), ',', '.'), '-', ''))::numeric *-1) ELSE (REPLACE(TRANSLATE(importe_retenido, ' .$_', ''), ',', '.'))::numeric END AS importe_retenido,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;

--------------------------------------------------
ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_pago RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->1->'cells');


DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%porte%');DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';

DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op_pago'::regclass), 
     content2 text,
     columna text	  ); 


INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;
UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'concepto' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'banco' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'cuenta_banc' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'cheque' WHERE id = 4 ;
UPDATE stage_d_aplicado3 SET columna = 'importe' WHERE id = 5 ;

ALTER SEQUENCE  bmem.rowname RESTART;

DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;



DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;

insert into stage_d_aplicado4 
select id, content2, 'importe' FROM stage_d_aplicado4 WHERE columna = 'cheque'
AND not exists (
    select id from stage_d_aplicado4 where columna = 'importe'
);


UPDATE stage_d_aplicado4 SET content2 = null WHERE columna = 'cheque';

DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) = 5 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
    banco text COLLATE pg_catalog."default",
    cuenta_banc text COLLATE pg_catalog."default",
    concepto text COLLATE pg_catalog."default",
    cheque text COLLATE pg_catalog."default",
    importe text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	concepto text, 
	banco text,
	cuenta_banc text, 
	cheque text,	
	importe text
	));

UPDATE stage_d_aplicado5 SET cheque = null;


INSERT INTO bmem.op_detalle_de_pago (WITH t AS (select x::json->'documents'->0->'fields'->'CustomerName'->>'content' as cliente,
				x::json->'documents'->0->'fields'->'InvoiceId'->>'content' as doc_id, 
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') as fecha_emision,
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') - interval '2 months' as periodo
from stage_op)
SELECT id, 
		TRANSLATE(banco, '_0123456789', '') AS banco, 
		regexp_replace(banco, '\D','','g') as cuenta_banc,
		concepto,
		(REPLACE(TRANSLATE(cheque, '._$ ', ''), ',', '.'))::numeric  as cheque,
		(REPLACE(TRANSLATE(importe, '._$ ', ''), ',', '.'))::numeric  as importe,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;
						
--------------------------------------------------------------------------------------------------------------

ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones2 RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->2->'cells');


DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%porte%');DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';


DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op_retenciones'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;
UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'concepto' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'num_certif' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'cod_seg' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'importe' WHERE id = 4 ;

ALTER SEQUENCE  bmem.rowname RESTART;

DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;

insert into stage_d_aplicado4 
select id, content2, 'importe' FROM stage_d_aplicado4 WHERE columna = 'cod_seg'
AND not exists (
    select id from stage_d_aplicado4 where columna = 'importe'
);

UPDATE stage_d_aplicado4 SET content2 = null WHERE columna = 'cod_seg';UPDATE stage_d_aplicado4 SET content2 = ((RIGHT(content2, -5))) WHERE content2 like '____% % %$';

DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) <= 4 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
	cod_seg text,
    concepto text COLLATE pg_catalog."default",
    importe text COLLATE pg_catalog."default",
    num_certif text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	cod_seg text,
	concepto text, 
	importe text,
	num_certif text
	)) ;


DO $$
DECLARE sql TEXT;
BEGIN
    SELECT CASE 
            WHEN (select 1 from stage_d_aplicado5 WHERE importe ~ '^[^0-9]+$' limit 1) = 1
                THEN 'DROP TABLE stage_d_aplicado5;'
            ELSE 'INSERT INTO bmem.op_retenciones(id , concepto , importe , num_certif , doc_id , fecha_emision , cliente , periodo ) (WITH t AS (select x::json->''documents''->0->''fields''->''CustomerName''->>''content'' as cliente,
				x::json->''documents''->0->''fields''->''InvoiceId''->>''content'' as doc_id, 
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') as fecha_emision,
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') - interval ''2 months'' as periodo
from stage_op)
SELECT id, 
		TRANSLATE(concepto, ''_'', '''') AS concepto, 
		((REPLACE(TRANSLATE(importe, ''.-_$ '', ''''), '','', ''.''))::numeric *-1)  as importe,
		TRANSLATE(num_certif, ''_'', '''') AS num_certif,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;'
            END AS qry
    INTO sql
    FROM stage_d_aplicado5 limit 1;
    EXECUTE (sql);
END $$;
------------------------------------------------------------
DELETE from bmem.op_retenciones WHERE concepto NOT like '%MEM%'; DELETE FROM bmem.op_retenciones WHERE importe < -9999999999;
------------------------------------------------------------
ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones2 RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->2->'cells');


DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%porte%');DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';


DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op_retenciones2'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;
UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'concepto' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'num_certif' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'cod_seg' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'importe' WHERE id = 4 ;

ALTER SEQUENCE  bmem.rowname RESTART;

DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;

insert into stage_d_aplicado4 
select id, content2, 'importe' FROM stage_d_aplicado4 WHERE columna = 'cod_seg'
AND not exists (
    select id from stage_d_aplicado4 where columna = 'importe'
);

UPDATE stage_d_aplicado4 SET content2 = null WHERE columna = 'cod_seg';UPDATE stage_d_aplicado4 SET content2 = ((RIGHT(content2, -5))) WHERE content2 like '____% % %$';

DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) <= 4 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
	cod_seg text,
    concepto text COLLATE pg_catalog."default",
    importe text COLLATE pg_catalog."default",
    num_certif text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	cod_seg text,
	concepto text, 
	importe text,
	num_certif text
	)) ;


DO $$
DECLARE sql TEXT;
BEGIN
    SELECT CASE 
            WHEN (select 1 from stage_d_aplicado5 WHERE importe ~ '^[^0-9]+$' limit 1) = 1
                THEN 'DROP TABLE stage_d_aplicado5;'
            ELSE 'INSERT INTO bmem.op_retenciones(id , concepto , importe , num_certif , doc_id , fecha_emision , cliente , periodo ) (WITH t AS (select x::json->''documents''->0->''fields''->''CustomerName''->>''content'' as cliente,
				x::json->''documents''->0->''fields''->''InvoiceId''->>''content'' as doc_id, 
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') as fecha_emision,
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') - interval ''2 months'' as periodo
from stage_op)
SELECT id, 
		TRANSLATE(concepto, ''_'', '''') AS concepto, 
		((REPLACE(TRANSLATE(importe, ''.-_$ '', ''''), '','', ''.''))::numeric *-1)  as importe,
		TRANSLATE(num_certif, ''_'', '''') AS num_certif,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;'
            END AS qry
    INTO sql
    FROM stage_d_aplicado5 limit 1;
    EXECUTE (sql);
END $$;

--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------

ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

DROP TABLE IF EXISTS stage_op;
DROP TABLE IF EXISTS stage_json_d_aplicado;


CREATE TEMP TABLE stage_json_d_aplicado 
  ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     json text 
  ); 
 
CREATE TEMP TABLE stage_op (x jsonb);
COPY stage_json_d_aplicado(json) FROM 'C:\Users\Administrador\GoesGreen SRL\I4 - AUTO\import\32.json' csv quote e'\x01' delimiter e'\x02';

INSERT INTO stage_op(x)
SELECT   string_agg( json ,e'\n' ORDER BY id)::jsonb 
FROM     stage_json_d_aplicado;


ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->0->'cells');

DELETE FROM  stage_d_aplicado2 WHERE id >= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE 'Total%');
DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%Neto%');
DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';

DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op'::regclass), 
     content2 text,
     columna text	  ); 


INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;

UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'fecha' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'comprobante' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'documento_int' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'importe_bruto' WHERE id = 4 ;
UPDATE stage_d_aplicado3 SET columna = 'importe_retenido' WHERE id = 5 ;
UPDATE stage_d_aplicado3 SET columna = 'importe_neto' WHERE id = 6 ;

ALTER SEQUENCE  bmem.rowname RESTART;


DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;


DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) = 6 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
    comprobante text COLLATE pg_catalog."default",
    documento_int text COLLATE pg_catalog."default",
    fecha text COLLATE pg_catalog."default",
    importe_bruto text COLLATE pg_catalog."default",
    importe_neto text COLLATE pg_catalog."default",
    importe_retenido text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	comprobante text, 
	documento_int text,
	fecha text, 
	importe_bruto text,	
	importe_neto text,
	importe_retenido text
	));


INSERT INTO bmem.op_detalle_de_aplicado (WITH t AS (select x::json->'documents'->0->'fields'->'CustomerName'->>'content' as cliente,
				x::json->'documents'->0->'fields'->'InvoiceId'->>'content' as doc_id, 
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') as fecha_emision,
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') - interval '2 months' as periodo
from stage_op)
SELECT id, REPLACE(comprobante, '_', '') AS comprobante, REPLACE(documento_int, '_', '') AS documento_int, 
						TO_DATE(REPLACE(fecha, '_', ''), 'DD.MM.YYYY') AS fecha, 
						CASE WHEN importe_bruto LIKE '%-%' THEN ((REPLACE(REPLACE(TRANSLATE(importe_bruto, ' ._', ''), ',', '.'), '-', ''))::numeric *-1) ELSE (REPLACE(TRANSLATE(importe_bruto, ' ._', ''), ',', '.'))::numeric END AS importe_bruto, 
						CASE WHEN REPLACE(REPLACE(importe_neto, '$', ''), '_', '') LIKE '%-%' THEN ((REPLACE(REPLACE(TRANSLATE(importe_neto, ' _.$', ''), ',', '.'), '-', ''))::numeric *-1) ELSE (REPLACE(REPLACE(TRANSLATE(importe_neto, ' _.$', ''), ',', '.'), '-', '')::numeric) END AS importe_neto,
						CASE WHEN importe_retenido LIKE '%-%' THEN ((REPLACE(REPLACE(TRANSLATE(importe_retenido, ' .$_', ''), ',', '.'), '-', ''))::numeric *-1) ELSE (REPLACE(TRANSLATE(importe_retenido, ' .$_', ''), ',', '.'))::numeric END AS importe_retenido,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;

--------------------------------------------------
ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_pago RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->1->'cells');


DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%porte%');DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';

DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op_pago'::regclass), 
     content2 text,
     columna text	  ); 


INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;
UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'concepto' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'banco' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'cuenta_banc' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'cheque' WHERE id = 4 ;
UPDATE stage_d_aplicado3 SET columna = 'importe' WHERE id = 5 ;

ALTER SEQUENCE  bmem.rowname RESTART;

DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;



DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;

insert into stage_d_aplicado4 
select id, content2, 'importe' FROM stage_d_aplicado4 WHERE columna = 'cheque'
AND not exists (
    select id from stage_d_aplicado4 where columna = 'importe'
);


UPDATE stage_d_aplicado4 SET content2 = null WHERE columna = 'cheque';

DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) = 5 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
    banco text COLLATE pg_catalog."default",
    cuenta_banc text COLLATE pg_catalog."default",
    concepto text COLLATE pg_catalog."default",
    cheque text COLLATE pg_catalog."default",
    importe text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	concepto text, 
	banco text,
	cuenta_banc text, 
	cheque text,	
	importe text
	));

UPDATE stage_d_aplicado5 SET cheque = null;


INSERT INTO bmem.op_detalle_de_pago (WITH t AS (select x::json->'documents'->0->'fields'->'CustomerName'->>'content' as cliente,
				x::json->'documents'->0->'fields'->'InvoiceId'->>'content' as doc_id, 
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') as fecha_emision,
				TO_DATE(x::json->'documents'->0->'fields'->'InvoiceDate'->>'content', 'DD.MM.YYYY') - interval '2 months' as periodo
from stage_op)
SELECT id, 
		TRANSLATE(banco, '_0123456789', '') AS banco, 
		regexp_replace(banco, '\D','','g') as cuenta_banc,
		concepto,
		(REPLACE(TRANSLATE(cheque, '._$ ', ''), ',', '.'))::numeric  as cheque,
		(REPLACE(TRANSLATE(importe, '._$ ', ''), ',', '.'))::numeric  as importe,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;
						
--------------------------------------------------------------------------------------------------------------

ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones2 RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->2->'cells');


DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%porte%');DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';


DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op_retenciones'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;
UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'concepto' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'num_certif' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'cod_seg' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'importe' WHERE id = 4 ;

ALTER SEQUENCE  bmem.rowname RESTART;

DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;

insert into stage_d_aplicado4 
select id, content2, 'importe' FROM stage_d_aplicado4 WHERE columna = 'cod_seg'
AND not exists (
    select id from stage_d_aplicado4 where columna = 'importe'
);

UPDATE stage_d_aplicado4 SET content2 = null WHERE columna = 'cod_seg';UPDATE stage_d_aplicado4 SET content2 = ((RIGHT(content2, -5))) WHERE content2 like '____% % %$';

DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) <= 4 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
	cod_seg text,
    concepto text COLLATE pg_catalog."default",
    importe text COLLATE pg_catalog."default",
    num_certif text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	cod_seg text,
	concepto text, 
	importe text,
	num_certif text
	)) ;


DO $$
DECLARE sql TEXT;
BEGIN
    SELECT CASE 
            WHEN (select 1 from stage_d_aplicado5 WHERE importe ~ '^[^0-9]+$' limit 1) = 1
                THEN 'DROP TABLE stage_d_aplicado5;'
            ELSE 'INSERT INTO bmem.op_retenciones(id , concepto , importe , num_certif , doc_id , fecha_emision , cliente , periodo ) (WITH t AS (select x::json->''documents''->0->''fields''->''CustomerName''->>''content'' as cliente,
				x::json->''documents''->0->''fields''->''InvoiceId''->>''content'' as doc_id, 
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') as fecha_emision,
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') - interval ''2 months'' as periodo
from stage_op)
SELECT id, 
		TRANSLATE(concepto, ''_'', '''') AS concepto, 
		((REPLACE(TRANSLATE(importe, ''.-_$ '', ''''), '','', ''.''))::numeric *-1)  as importe,
		TRANSLATE(num_certif, ''_'', '''') AS num_certif,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;'
            END AS qry
    INTO sql
    FROM stage_d_aplicado5 limit 1;
    EXECUTE (sql);
END $$;
------------------------------------------------------------
DELETE from bmem.op_retenciones WHERE concepto NOT like '%MEM%'; DELETE FROM bmem.op_retenciones WHERE importe < -9999999999;
------------------------------------------------------------
ALTER SEQUENCE  bmem.seq_d_aplicado RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones RESTART;
ALTER SEQUENCE  bmem.seq_temp_json_op_retenciones2 RESTART;

DROP TABLE IF EXISTS stage_d_aplicado2 ;
CREATE TEMP TABLE stage_d_aplicado2   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_d_aplicado'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado2(content2) select 
	(value->>'content') as "content2"	
from stage_op
cross join jsonb_array_elements(x->'tables'->2->'cells');


DELETE FROM  stage_d_aplicado2 WHERE id <= (SELECT id FROM stage_d_aplicado2 WHERE content2 LIKE '%porte%');DELETE FROM  stage_d_aplicado2 WHERE content2 = '$';


DROP TABLE IF EXISTS stage_d_aplicado3 ;
CREATE TEMP TABLE stage_d_aplicado3   ( 
     id     INT DEFAULT NEXTVAL('bmem.seq_temp_json_op_retenciones2'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado3(content2) SELECT content2 FROM stage_d_aplicado2;
UPDATE stage_d_aplicado3 SET content2 = null WHERE content2 = '';

UPDATE stage_d_aplicado3 SET columna = 'concepto' WHERE id = 1 ;
UPDATE stage_d_aplicado3 SET columna = 'num_certif' WHERE id = 2 ;
UPDATE stage_d_aplicado3 SET columna = 'cod_seg' WHERE id = 3 ;
UPDATE stage_d_aplicado3 SET columna = 'importe' WHERE id = 4 ;

ALTER SEQUENCE  bmem.rowname RESTART;

DO $$
DECLARE rowcount integer := (SELECT CASE WHEN COUNT(id) = 1 THEN 50 ELSE COUNT(id) END FROM stage_d_aplicado3 WHERE id = 1);
Begin 
EXECUTE format(
'ALTER SEQUENCE  bmem.rowname MAXVALUE %s',
           rowcount
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado4 ;
CREATE TEMP TABLE stage_d_aplicado4   ( 
     id     INT DEFAULT NEXTVAL('bmem.rowname'::regclass), 
     content2 text,
     columna text	  ); 

INSERT INTO stage_d_aplicado4(content2, columna) SELECT content2, columna FROM stage_d_aplicado3;

insert into stage_d_aplicado4 
select id, content2, 'importe' FROM stage_d_aplicado4 WHERE columna = 'cod_seg'
AND not exists (
    select id from stage_d_aplicado4 where columna = 'importe'
);

UPDATE stage_d_aplicado4 SET content2 = null WHERE columna = 'cod_seg';UPDATE stage_d_aplicado4 SET content2 = ((RIGHT(content2, -5))) WHERE content2 like '____% % %$';

DO $$
DECLARE id_num text := COALESCE((SELECT CASE WHEN count(id) <= 4 THEN '1' ELSE null END FROM stage_d_aplicado4), 'id');
Begin 
EXECUTE format(
'UPDATE stage_d_aplicado4 SET id = %s',
           id_num
        );
END $$ ;


DROP TABLE IF EXISTS stage_d_aplicado5;
CREATE TABLE IF NOT EXISTS stage_d_aplicado5
(
    id integer,
	cod_seg text,
    concepto text COLLATE pg_catalog."default",
    importe text COLLATE pg_catalog."default",
    num_certif text COLLATE pg_catalog."default"
);


INSERT INTO stage_d_aplicado5 (select *
    from crosstab (
        'select id, columna, content2
        from stage_d_aplicado4
        order by 1, 2')
    AS ct(id integer,
	cod_seg text,
	concepto text, 
	importe text,
	num_certif text
	)) ;


DO $$
DECLARE sql TEXT;
BEGIN
    SELECT CASE 
            WHEN (select 1 from stage_d_aplicado5 WHERE importe ~ '^[^0-9]+$' limit 1) = 1
                THEN 'DROP TABLE stage_d_aplicado5;'
            ELSE 'INSERT INTO bmem.op_retenciones(id , concepto , importe , num_certif , doc_id , fecha_emision , cliente , periodo ) (WITH t AS (select x::json->''documents''->0->''fields''->''CustomerName''->>''content'' as cliente,
				x::json->''documents''->0->''fields''->''InvoiceId''->>''content'' as doc_id, 
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') as fecha_emision,
				TO_DATE(x::json->''documents''->0->''fields''->''InvoiceDate''->>''content'', ''DD.MM.YYYY'') - interval ''2 months'' as periodo
from stage_op)
SELECT id, 
		TRANSLATE(concepto, ''_'', '''') AS concepto, 
		((REPLACE(TRANSLATE(importe, ''.-_$ '', ''''), '','', ''.''))::numeric *-1)  as importe,
		TRANSLATE(num_certif, ''_'', '''') AS num_certif,
				t.doc_id,
				t.fecha_emision,
				t.cliente,
				t.periodo::Date
						from stage_d_aplicado5 CROSS JOIN  t) ON CONFLICT DO NOTHING;'
            END AS qry
    INTO sql
    FROM stage_d_aplicado5 limit 1;
    EXECUTE (sql);
END $$;

--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------

UPDATE bmem.op_detalle_de_aplicado SET doc_name = s.doc_name FROM (select concat('Orden de Pago ',doc_id) as doc_name, doc_id from bmem.op_detalle_de_aplicado ) as s WHERE s.doc_id = op_detalle_de_aplicado.doc_id;
UPDATE bmem.op_retenciones SET doc_name = s.doc_name FROM (select concat('Orden de Pago ',doc_id) as doc_name, doc_id from bmem.op_retenciones ) as s WHERE s.doc_id = op_retenciones.doc_id;
UPDATE bmem.op_detalle_de_pago SET doc_name = s.doc_name FROM (select concat('Orden de Pago ',doc_id) as doc_name, doc_id from bmem.op_detalle_de_pago ) as s WHERE s.doc_id = op_detalle_de_pago.doc_id;

UPDATE bmem.op_retenciones SET cliente = replace(cliente, '.', ''); 
UPDATE bmem.op_detalle_de_pago SET cliente = replace(cliente, '.', ''); 
UPDATE bmem.op_detalle_de_aplicado SET cliente = replace(cliente, '.', ''); 

DELETE from bmem.op_retenciones WHERE concepto NOT like '%MEM%'; DELETE FROM bmem.op_retenciones WHERE importe < -9999999999;
UPDATE bmem.op_retenciones SET importe = ((RIGHT(importe::text, -5))::numeric * -1) WHERE concepto like '%SUSS RG - MEM%' AND importe < -99999999.99;
