/* Banco de Dados 1 - Projeto Final: */
/* Hospital - Setor de Internação */
/*________________________________*/
/* Gatilhos e Funções */

--Inicialização de leitos livres após inserção de novo andar
CREATE FUNCTION tr_func_leitos_livres_ini()
RETURNS TRIGGER LANGUAGE 'plpgsql' AS $BODY$
BEGIN
	RAISE NOTICE 'triger "tr_leitos_livres_ini" ativado';
    UPDATE andar
    SET leitos_livres = capacidade;
    RETURN NULL;
END; $BODY$;

CREATE TRIGGER tr_leitos_livres_ini
    AFTER INSERT
    ON andar
    FOR EACH ROW
    EXECUTE PROCEDURE tr_func_leitos_livres_ini();

--Decremento de leitos livres após inserção em paciente
CREATE FUNCTION tr_func_leitos_livres_dec()
RETURNS TRIGGER LANGUAGE 'plpgsql' AS $BODY$
BEGIN
	RAISE NOTICE 'triger "tr_leitos_livres_dec" ativado';
    UPDATE andar
	SET leitos_livres = leitos_livres - 1
	FROM paciente
	WHERE numero_andar = NEW.fk_andar_numero_andar;
    RETURN NULL;
END; $BODY$;

CREATE TRIGGER tr_leitos_livres_dec
    AFTER INSERT
    ON paciente
    FOR EACH ROW
    EXECUTE PROCEDURE tr_func_leitos_livres_dec();

--Incremento de leitos livres antes de deleção em paciente
CREATE FUNCTION tr_func_leitos_livres_inc()
RETURNS TRIGGER LANGUAGE 'plpgsql' AS $BODY$
BEGIN
	RAISE NOTICE 'triger "tr_leitos_livres_inc" ativado';
    UPDATE andar
    SET leitos_livres = leitos_livres + 1
    FROM paciente
    WHERE numero_andar = OLD.fk_andar_numero_andar;
    RETURN NULL;
END; $BODY$;

CREATE TRIGGER tr_leitos_livres_inc
    BEFORE DELETE
    ON paciente
    FOR EACH ROW
    EXECUTE PROCEDURE tr_func_leitos_livres_inc();

