/* Banco de Dados 1 - Projeto Final: */
/* Hospital - Setor de Internação */
/*________________________________*/
/* Outros */

DELETE FROM quarto
    WHERE numero_quarto = 404 OR numero_quarto = 504;

UPDATE funcionario
    SET salario = 4000.00
    WHERE fk_pessoa_cpf = '22233344456';

INSERT INTO nutricionista(crn,fk_funcionario_codigo_funcionario)
    VALUES ('34567892',select codigo_funcionario from funcionario where fk_pessoa_cpf = '44455566679');

INSERT INTO nutricionista(crn,fk_funcionario_codigo_funcionario)
    SELECT '34567892',codigo_funcionario 
    FROM funcionario WHERE fk_pessoa_cpf = '44455566679'

BEGIN TRANSACTION
    DECLARE @DataID int;
    INSERT INTO DataTable (Column1 ...) VALUES (....);
    SELECT @DataID = scope_identity();
    INSERT INTO LinkTable VALUES (@ObjectID, @DataID);
COMMIT




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
