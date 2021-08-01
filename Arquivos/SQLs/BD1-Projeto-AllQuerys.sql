/* Banco de Dados 1 - Projeto Final: */
/* Hospital - Setor de Internação */
/*________________________________*/
/* Single file with all querys to create the Hospital database */

--Tables
CREATE TABLE andar (
    numero_andar INTEGER UNIQUE PRIMARY KEY,
    setor VARCHAR(12),
    fk_nutricionista_crn VARCHAR(12),
    capacidade INTEGER,
    leitos_livres INTEGER
);

CREATE TABLE quarto (
    numero_quarto INTEGER PRIMARY KEY,
    fk_andar_numero_andar INTEGER,
    fk_enfermeiro_coren VARCHAR(12)
);

CREATE TABLE pessoa (
    cpf VARCHAR(11) PRIMARY KEY,
    nome VARCHAR(100),
    telefone VARCHAR(12),
    cidade VARCHAR(40),
    rua VARCHAR(40),
    numero_rua VARCHAR(12)
);

CREATE TABLE paciente (
    codigo_paciente SERIAL PRIMARY KEY,
    fk_pessoa_cpf VARCHAR(12) UNIQUE,
    fk_medico_crm VARCHAR(12),
    fk_andar_numero_andar INTEGER,
    fk_quarto_numero_quarto INTEGER UNIQUE,
    urgencia CHAR,
    data_internacao DATE
);

CREATE TABLE funcionario (
    codigo_funcionario SERIAL PRIMARY KEY,
    fk_pessoa_cpf VARCHAR(12) UNIQUE,
    profissao VARCHAR(40),
    salario DECIMAL
);

CREATE TABLE medico (
    crm VARCHAR(12) PRIMARY KEY,
    fk_funcionario_codigo_funcionario INTEGER UNIQUE,
    especializacao VARCHAR(40)
);

CREATE TABLE enfermeiro (
    coren VARCHAR(12) PRIMARY KEY,
    fk_funcionario_codigo_funcionario INTEGER UNIQUE
);

CREATE TABLE nutricionista (
    crn VARCHAR(12) PRIMARY KEY,
    fk_funcionario_codigo_funcionario INTEGER UNIQUE
);

--Restrictions
ALTER TABLE andar ADD CONSTRAINT FK_andar_1
    FOREIGN KEY (fk_nutricionista_crn)
    REFERENCES nutricionista (crn)
    ON DELETE RESTRICT;

ALTER TABLE quarto ADD CONSTRAINT FK_quarto_1
    FOREIGN KEY (fk_andar_numero_andar)
    REFERENCES andar (numero_andar)
    ON DELETE RESTRICT;
 
ALTER TABLE quarto ADD CONSTRAINT FK_quarto_2
    FOREIGN KEY (fk_enfermeiro_coren)
    REFERENCES enfermeiro (coren)
    ON DELETE RESTRICT;

ALTER TABLE paciente ADD CONSTRAINT FK_paciente_1
    FOREIGN KEY (fk_pessoa_cpf)
    REFERENCES pessoa (cpf)
    ON DELETE RESTRICT;

ALTER TABLE paciente ADD CONSTRAINT FK_paciente_2
    FOREIGN KEY (fk_andar_numero_andar)
    REFERENCES andar (numero_andar)
    ON DELETE RESTRICT;

ALTER TABLE paciente ADD CONSTRAINT FK_paciente_3
    FOREIGN KEY (fk_quarto_numero_quarto)
    REFERENCES quarto (numero_quarto)
    ON DELETE RESTRICT;
 
ALTER TABLE paciente ADD CONSTRAINT FK_paciente_4
    FOREIGN KEY (fk_medico_crm)
    REFERENCES medico (crm)
    ON DELETE RESTRICT;

ALTER TABLE funcionario ADD CONSTRAINT FK_funcionario_1
    FOREIGN KEY (fk_pessoa_cpf)
    REFERENCES pessoa (cpf)
    ON DELETE RESTRICT;

ALTER TABLE medico ADD CONSTRAINT FK_medico_1
    FOREIGN KEY (fk_funcionario_codigo_funcionario)
    REFERENCES funcionario (codigo_funcionario)
    ON DELETE CASCADE;
 
ALTER TABLE enfermeiro ADD CONSTRAINT FK_enfermeiro_1
    FOREIGN KEY (fk_funcionario_codigo_funcionario)
    REFERENCES funcionario (codigo_funcionario)
    ON DELETE CASCADE;
 
ALTER TABLE nutricionista ADD CONSTRAINT FK_nutricionista_1
    FOREIGN KEY (fk_funcionario_codigo_funcionario)
    REFERENCES funcionario (codigo_funcionario)
    ON DELETE CASCADE;

--Triggers and triggers functions
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

CREATE FUNCTION tr_func_leitos_livres_inc()
RETURNS TRIGGER LANGUAGE 'plpgsql' AS $BODY$
BEGIN
	RAISE NOTICE 'triger "tr_leitos_livres_inc" ativado';
    UPDATE andar
    SET leitos_livres = leitos_livres + 1
    FROM paciente
    WHERE numero_andar = OLD.fk_andar_numero_andar;
    RETURN NEW;
END; $BODY$;

CREATE TRIGGER tr_leitos_livres_inc
    BEFORE DELETE
    ON paciente
    FOR EACH ROW
    EXECUTE PROCEDURE tr_func_leitos_livres_inc();

--Inserts
INSERT INTO pessoa(cpf,nome,telefone,cidade,rua,numero_rua)
VALUES  ('11122233344','nomePaciente1','998769181','Bauru','rua Batista de Carvalho','10-20'),
        ('11122233355','nomePaciente2','998769182','Bauru','rua Batista de Carvalho','10-21'),
        ('11122233366','nomePaciente3','998769183','Bauru','rua Batista de Carvalho','10-22'),
        ('11122233377','nomePaciente4','998769184','Bauru','rua Batista de Carvalho','10-23'),
        ('11122233388','nomePaciente5','998769185','Bauru','rua Batista de Carvalho','10-24'),
        ('22233344455','nomeMedico1','998769271','Bauru','rua Batista de Carvalho','11-21'),
        ('22233344456','nomeMedico2','998769272','Bauru','rua Batista de Carvalho','11-22'),
        ('33344455566','nomeEnfermeiro1','998769261','Bauru','rua Batista de Carvalho','12-22'),
        ('33344455567','nomeEnfermeiro2','998769262','Bauru','rua Batista de Carvalho','12-23'),
        ('33344455568','nomeEnfermeiro3','998769263','Bauru','rua Batista de Carvalho','12-24'),
        ('44455566677','nomeNutricionista1','998769251','Bauru','rua Batista de Carvalho','13-23'),
        ('44455566678','nomeNutricionista2','998769252','Bauru','rua Batista de Carvalho','13-24'),
        ('44455566679','nomeNutricionista3','998769253','Bauru','rua Batista de Carvalho','13-25');
        
INSERT INTO funcionario(fk_pessoa_cpf,profissao,salario)
VALUES  ('22233344455','Médico', 4000.00),
        ('22233344456','Médico', 4000.00),
        ('33344455566','Enfermeiro', 2000.00),
        ('33344455567','Enfermeiro', 2000.00),
        ('33344455568','Enfermeiro', 2000.00),
        ('44455566677','Nutricionista', 3000.00),
        ('44455566678','Nutricionista', 3000.00),
        ('44455566679','Nutricionista', 3000.00);

INSERT INTO medico(crm,fk_funcionario_codigo_funcionario,especializacao)
    SELECT '12345678',codigo_funcionario,'urologista'
    FROM funcionario WHERE fk_pessoa_cpf = '22233344455';

INSERT INTO medico(crm,fk_funcionario_codigo_funcionario,especializacao)
    SELECT '12345679',codigo_funcionario,'urologista'
    FROM funcionario WHERE fk_pessoa_cpf = '22233344456';

INSERT INTO enfermeiro(coren,fk_funcionario_codigo_funcionario)
    SELECT '23456789',codigo_funcionario
    FROM funcionario WHERE fk_pessoa_cpf = '33344455566';

INSERT INTO enfermeiro(coren,fk_funcionario_codigo_funcionario)
    SELECT '23456790',codigo_funcionario
    FROM funcionario WHERE fk_pessoa_cpf = '33344455567';
    
INSERT INTO enfermeiro(coren,fk_funcionario_codigo_funcionario)
    SELECT '23456791',codigo_funcionario
    FROM funcionario WHERE fk_pessoa_cpf = '33344455568';

INSERT INTO nutricionista(crn,fk_funcionario_codigo_funcionario)
    SELECT '34567890',codigo_funcionario
    FROM funcionario WHERE fk_pessoa_cpf = '44455566677';

INSERT INTO nutricionista(crn,fk_funcionario_codigo_funcionario)
    SELECT '34567891',codigo_funcionario
    FROM funcionario WHERE fk_pessoa_cpf = '44455566678';

INSERT INTO nutricionista(crn,fk_funcionario_codigo_funcionario)
    SELECT '34567892',codigo_funcionario
    FROM funcionario WHERE fk_pessoa_cpf = '44455566679';

INSERT INTO andar(numero_andar,setor,fk_nutricionista_crn,capacidade)
VALUES  (4,'Internação','34567890',3),
        (5,'Internação','34567891',3);

INSERT INTO quarto(numero_quarto,fk_andar_numero_andar,fk_enfermeiro_coren)
VALUES  (401,4,'23456789'),
        (402,4,'23456789'),
        (403,4,'23456790'),
        (501,5,'23456790'),
        (502,5,'23456791'),
        (503,5,'23456791');

INSERT INTO paciente(fk_pessoa_cpf,fk_medico_crm,fk_andar_numero_andar,fk_quarto_numero_quarto,urgencia,data_internacao)
VALUES  ('11122233344','12345678',4,401,'A','2021-07-31'),
        ('11122233355','12345679',4,402,'C','2021-08-01'),
        ('11122233366','12345679',4,403,'C','2021-08-01'),
        ('11122233377','12345678',5,502,'C','2021-08-01'),
        ('11122233388','12345678',5,503,'E',CURRENT_DATE);
