/* Banco de Dados 1 - Projeto Final: */
/* Hospital - Setor de Internação */
/*________________________________*/
/* Tabelas */
 
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
    cpf VARCHAR(14) PRIMARY KEY,
    nome VARCHAR(100),
    telefone VARCHAR(16),
    cidade VARCHAR(40),
    rua VARCHAR(40),
    numero_rua VARCHAR(12)
);

CREATE TABLE paciente (
    codigo_paciente SERIAL PRIMARY KEY,
    fk_pessoa_cpf VARCHAR(14) UNIQUE,
    fk_medico_crm VARCHAR(12),
    fk_andar_numero_andar INTEGER,
    fk_quarto_numero_quarto INTEGER UNIQUE,
    urgencia CHAR,
    data_internacao DATE
);

CREATE TABLE funcionario (
    codigo_funcionario SERIAL PRIMARY KEY,
    fk_pessoa_cpf VARCHAR(14) UNIQUE,
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
