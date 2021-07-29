/* Banco de Dados 1 - Projeto Final: */
/* Hospital - Setor de Internação */
/*________________________________*/
/* Tabelas e Restrições: */
 
CREATE TABLE andar (
    numero_andar INTEGER PRIMARY KEY,
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
    cpf VARCHAR(12) PRIMARY KEY,
    nome VARCHAR(100),
    telefone VARCHAR(12),
    cep VARCHAR(12),
    cidade VARCHAR(100),
    bairro VARCHAR(100),
    rua VARCHAR(100),
    numero VARCHAR(12)
);

CREATE TABLE paciente (
    codigo_paciente SERIAL PRIMARY KEY,
    fk_pessoa_cpf VARCHAR(12) UNIQUE,
    fk_medico_crm VARCHAR(12),
    fk_andar_numero_andar INTEGER,
    fk_quarto_numero_quarto INTEGER,
    numero_leito INTEGER,
    urgencia CHAR,
    data_internacao DATE,
    data_alta DATE
);

CREATE TABLE funcionario (
    codigo_funcionario SERIAL PRIMARY KEY,
    fk_pessoa_cpf VARCHAR(12) UNIQUE,
    profissao VARCHAR(100),
    turno CHAR,
    salario DECIMAL
);

CREATE TABLE medico (
    crm VARCHAR(12) PRIMARY KEY,
    fk_funcionario_codigo_funcionario INTEGER UNIQUE,
    especializacao VARCHAR(100)
);

CREATE TABLE enfermeiro (
    coren VARCHAR(12) PRIMARY KEY,
    fk_funcionario_codigo_funcionario INTEGER UNIQUE,
    chefe CHAR
);

CREATE TABLE nutricionista (
    crn VARCHAR(12) PRIMARY KEY,
    fk_funcionario_codigo_funcionario INTEGER UNIQUE
);

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
    ON DELETE CASCADE;
 
ALTER TABLE paciente ADD CONSTRAINT FK_paciente_2
    FOREIGN KEY (fk_andar_numero_andar)
    REFERENCES andar (numero_andar)
    ON DELETE CASCADE;

ALTER TABLE paciente ADD CONSTRAINT FK_paciente_3
    FOREIGN KEY (fk_quarto_numero_quarto)
    REFERENCES quarto (numero_quarto)
    ON DELETE CASCADE;
 
ALTER TABLE paciente ADD CONSTRAINT FK_paciente_4
    FOREIGN KEY (fk_medico_crm)
    REFERENCES medico (crm)
    ON DELETE CASCADE;
 
ALTER TABLE funcionario ADD CONSTRAINT FK_funcionario_1
    FOREIGN KEY (fk_pessoa_cpf)
    REFERENCES pessoa (cpf)
    ON DELETE CASCADE;

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
 