/* BD1-Projeto-Logico-V4: */

CREATE TABLE andar (
    numero_andar INTEGER PRIMARY KEY,
    fk_setor_nome VARCHAR2(10 CHAR),
    fk_nutricionista_crn VARCHAR2(12 CHAR),
    capacidade INTEGER,
    leitos-livres INTEGER
);

CREATE TABLE paciente (
    codigo_paciente INTEGER,
    fk_pessoa_cpf VARCHAR2(12 CHAR),
    fk_medico_crm VARCHAR2(12 CHAR),
    fk_quarto_numero_quarto INTEGER,
    numero-leito INTEGER,
    urgencia CHAR,
    data_internacao DATE,
    data_alta DATE,
    PRIMARY KEY (codigo_paciente, fk_pessoa_cpf)
);

CREATE TABLE medico (
    crm VARCHAR2(12 CHAR),
    fk_funcionario_codigo_funcionario INTEGER,
    especializacao VARCHAR2(40 CHAR),
    PRIMARY KEY (crm, fk_funcionario_codigo_funcionario)
);

CREATE TABLE enfermeiro (
    coren VARCHAR2(12 CHAR),
    fk_funcionario_codigo_funcionario INTEGER,
    chefe CHAR,
    PRIMARY KEY (coren, fk_funcionario_codigo_funcionario)
);

CREATE TABLE funcionario (
    codigo_funcionario INTEGER,
    fk_pessoa_cpf VARCHAR2(12 CHAR),
    profissao VARCHAR2(40 CHAR),
    turno CHAR,
    salario FLOAT,
    PRIMARY KEY (codigo_funcionario, fk_pessoa_cpf)
);

CREATE TABLE pessoa (
    cpf VARCHAR2(12 CHAR) PRIMARY KEY,
    nome VARCHAR2(100 CHAR),
    telefone VARCHAR2(11 CHAR),
    cep INTEGER,
    cidade VARCHAR2(40 CHAR),
    bairro VARCHAR2(40 CHAR),
    rua VARCHAR2(40 CHAR),
    numero VARCHAR2(10 CHAR)
);

CREATE TABLE nutricionista (
    crn VARCHAR2(12 CHAR),
    fk_funcionario_codigo_funcionario INTEGER,
    PRIMARY KEY (crn, fk_funcionario_codigo_funcionario)
);

CREATE TABLE quarto (
    numero_quarto INTEGER PRIMARY KEY,
    fk_andar_numero_andar INTEGER,
    fk_enfermeiro_coren VARCHAR2(12 CHAR)
);

CREATE TABLE setor (
    nome VARCHAR2(10 CHAR) PRIMARY KEY
);
 
ALTER TABLE andar ADD CONSTRAINT FK_andar_2
    FOREIGN KEY (fk_nutricionista_crn)
    REFERENCES nutricionista (crn)
    ON DELETE RESTRICT;
 
ALTER TABLE andar ADD CONSTRAINT FK_andar_3
    FOREIGN KEY (fk_setor_nome)
    REFERENCES setor (nome)
    ON DELETE RESTRICT;
 
ALTER TABLE paciente ADD CONSTRAINT FK_paciente_2
    FOREIGN KEY (fk_pessoa_cpf)
    REFERENCES pessoa (cpf)
    ON DELETE CASCADE;
 
ALTER TABLE paciente ADD CONSTRAINT FK_paciente_3
    FOREIGN KEY (fk_quarto_numero_quarto)
    REFERENCES quarto (numero_quarto)
    ON DELETE CASCADE;
 
ALTER TABLE paciente ADD CONSTRAINT FK_paciente_4
    FOREIGN KEY (fk_medico_crm, fk_Medico_fk_Funcionario_Codigo-Funcionario, fk_Medico_fk_Funcionario_fk_Pessoa_CPF???)
    REFERENCES medico (crm, fk_funcionario_codigo_funcionario, ???)
    ON DELETE CASCADE;
 
ALTER TABLE medico ADD CONSTRAINT FK_medico_2
    FOREIGN KEY (fk_funcionario_codigo_funcionario, fk_Funcionario_fk_Pessoa_CPF)
    REFERENCES funcionario (codigo_funcionario, fk_pessoa_cpf)
    ON DELETE CASCADE;
 
ALTER TABLE enfermeiro ADD CONSTRAINT FK_enfermeiro_2
    FOREIGN KEY (fk_funcionario_codigo_funcionario, fk_Funcionario_fk_Pessoa_CPF)
    REFERENCES funcionario (codigo_funcionario, fk_pessoa_cpf)
    ON DELETE CASCADE;
 
ALTER TABLE funcionario ADD CONSTRAINT FK_funcionario_2
    FOREIGN KEY (fk_pessoa_cpf)
    REFERENCES pessoa (cpf)
    ON DELETE CASCADE;
 
ALTER TABLE nutricionista ADD CONSTRAINT FK_nutricionista_2
    FOREIGN KEY (fk_funcionario_codigo_funcionario, fk_Funcionario_fk_Pessoa_CPF)
    REFERENCES funcionario (codigo_funcionario, fk_pessoa_cpf)
    ON DELETE CASCADE;
 
ALTER TABLE quarto ADD CONSTRAINT FK_quarto_2
    FOREIGN KEY (fk_andar_numero_andar)
    REFERENCES andar (numero_andar)
    ON DELETE RESTRICT;
 
ALTER TABLE quarto ADD CONSTRAINT FK_quarto_3
    FOREIGN KEY (fk_enfermeiro_coren, fk_Enfermeiro_fk_Funcionario_Codigo-Funcionario, fk_Enfermeiro_fk_Funcionario_fk_Pessoa_CPF???)
    REFERENCES enfermeiro (coren, fk_funcionario_codigo_funcionario, ???)
    ON DELETE RESTRICT;