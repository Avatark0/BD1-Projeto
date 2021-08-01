/* Banco de Dados 1 - Projeto Final: */
/* Hospital - Setor de Internação */
/*________________________________*/
/* Outros */

SELECT * FROM andar
ORDER BY numero_andar ASC

UPDATE funcionario
    SET salario = 4000.00
    WHERE fk_pessoa_cpf = '22233344456';

DELETE FROM quarto
    WHERE numero_quarto = 404 OR numero_quarto = 504;

INSERT INTO nutricionista(crn,fk_funcionario_codigo_funcionario)
    VALUES ('34567892',select codigo_funcionario from funcionario where fk_pessoa_cpf = '44455566679');

INSERT INTO nutricionista(crn,fk_funcionario_codigo_funcionario)
    SELECT '34567892',codigo_funcionario 
    FROM funcionario WHERE fk_pessoa_cpf = '44455566679';


--Setup para teste do trigger de leitos livres
UPDATE andar
	SET leitos_livres = 3;

CREATE TABLE paciente (
    codigo_paciente SERIAL PRIMARY KEY,
    fk_pessoa_cpf VARCHAR(12) UNIQUE,
    fk_medico_crm VARCHAR(12),
    fk_andar_numero_andar INTEGER,
    fk_quarto_numero_quarto INTEGER UNIQUE,
    urgencia CHAR,
    data_internacao DATE
);

CREATE FUNCTION tr_func_leitos_livres_dec()
RETURNS TRIGGER LANGUAGE 'plpgsql' AS $BODY$
BEGIN
	RAISE NOTICE 'triger "tr_leitos_livres_dec" ativado';
    UPDATE andar
	SET leitos_livres = leitos_livres - 1
	FROM paciente
	WHERE numero_andar = fk_andar_numero_andar;
    RETURN null;
END; $BODY$;

CREATE TRIGGER tr_leitos_livres_dec
    AFTER INSERT
    ON paciente
    EXECUTE PROCEDURE tr_func_leitos_livres_dec();

INSERT INTO paciente(fk_pessoa_cpf,fk_medico_crm,fk_andar_numero_andar,fk_quarto_numero_quarto,urgencia,data_internacao)
VALUES  ('11122233344','12345678',4,401,'A','2021-08-01');
INSERT INTO paciente(fk_pessoa_cpf,fk_medico_crm,fk_andar_numero_andar,fk_quarto_numero_quarto,urgencia,data_internacao)
VALUES	('11122233355','12345679',4,402,'C','2021-08-01');
INSERT INTO paciente(fk_pessoa_cpf,fk_medico_crm,fk_andar_numero_andar,fk_quarto_numero_quarto,urgencia,data_internacao)
VALUES  ('11122233366','12345679',4,403,'C','2021-08-01');
INSERT INTO paciente(fk_pessoa_cpf,fk_medico_crm,fk_andar_numero_andar,fk_quarto_numero_quarto,urgencia,data_internacao)
VALUES  ('11122233377','12345678',5,502,'C','2021-08-01');
INSERT INTO paciente(fk_pessoa_cpf,fk_medico_crm,fk_andar_numero_andar,fk_quarto_numero_quarto,urgencia,data_internacao)
VALUES  ('11122233388','12345678',5,503,'E',CURRENT_DATE);
INSERT INTO paciente(fk_pessoa_cpf,fk_medico_crm,fk_andar_numero_andar,fk_quarto_numero_quarto,urgencia,data_internacao)
VALUES	('44455566679','12345678',5,501,'A',CURRENT_DATE);

SELECT * FROM paciente
ORDER BY codigo_paciente ASC

SELECT * FROM andar
ORDER BY numero_andar ASC

SELECT fk_andar_numero_andar 
FROM paciente
ORDER BY fk_andar_numero_andar ASC