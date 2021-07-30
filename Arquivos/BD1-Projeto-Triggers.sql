/* Banco de Dados 1 - Projeto Final: */
/* Hospital - Setor de Internação */
/*________________________________*/
/* Gatilhos e Views */

CREATE TRIGGER tr_1
    BEFORE INSERT
    ON paciente
    FOR EACH ROW
    EXECUTE PROCEDURE tr_func();

CREATE FUNCTION tr_func()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    NOT LEAKPROOF
AS $BODY$
BEGIN
	RAISE NOTICE 'penis da sandy';
END;
$BODY$;

ALTER FUNCTION public.tr_func()
    OWNER TO postgres;


CREATE FUNCTION tr_func()
RETURNS TRIGGER AS $BODY$
BEGIN
	RAISE NOTICE 'penis da sandy';
    RETURN null;
END;
$BODY$ LANGUAGE 'plpgsql';
