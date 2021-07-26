/* BD1-Projeto-Logico-V4: */

CREATE TABLE Andar (
    Numero_Andar INTEGER PRIMARY KEY,
    fk_Setor_Nome VARCHAR2(10 CHAR),
    fk_Nutricionista_CRN INTEGER,
    Capacidade INTEGER,
    Leitos-Livres INTEGER
);

CREATE TABLE Paciente (
    Codigo_Paciente INTEGER,
    fk_Pessoa_CPF INTEGER,
    fk_Medico_CRM INTEGER,
    fk_Quarto_Numero_Quarto INTEGER,
    Numero-Leito INTEGER,
    Urgencia CHAR,
    Data_Internacao DATE,
    Data_Alta DATE,
    PRIMARY KEY (Codigo_Paciente, fk_Pessoa_CPF)
);

CREATE TABLE Medico (
    CRM INTEGER,
    fk_Funcionario_Codigo_Funcionario INTEGER,
    Especializacao VARCHAR2(40 CHAR),
    PRIMARY KEY (CRM, fk_Funcionario_Codigo_Funcionario)
);

CREATE TABLE Enfermeiro (
    Coren INTEGER,
    fk_Funcionario_Codigo_Funcionario INTEGER,
    Chefe CHAR,
    PRIMARY KEY (Coren, fk_Funcionario_Codigo_Funcionario)
);

CREATE TABLE Funcionario (
    Codigo_Funcionario INTEGER,
    fk_Pessoa_CPF INTEGER,
    Profissao VARCHAR2(40 CHAR),
    Turno CHAR,
    Salario FLOAT,
    PRIMARY KEY (Codigo_Funcionario, fk_Pessoa_CPF)
);

CREATE TABLE Pessoa (
    CPF INTEGER PRIMARY KEY,
    Nome VARCHAR2(100 CHAR),
    Telefone INTEGER,
    CEP INTEGER,
    Cidade VARCHAR2(40 CHAR),
    Bairro VARCHAR2(40 CHAR),
    Rua VARCHAR2(40 CHAR),
    Numero INTEGER
);

CREATE TABLE Nutricionista (
    CRN INTEGER,
    fk_Funcionario_Codigo_Funcionario INTEGER,
    PRIMARY KEY (CRN, fk_Funcionario_Codigo_Funcionario)
);

CREATE TABLE Quarto (
    Numero_Quarto INTEGER PRIMARY KEY,
    fk_Andar_Numero_Andar INTEGER,
    fk_Enfermeiro_Coren INTEGER
);

CREATE TABLE Setor (
    Nome VARCHAR2(10 CHAR) PRIMARY KEY
);
 
ALTER TABLE Andar ADD CONSTRAINT FK_Andar_2
    FOREIGN KEY (fk_Nutricionista_CRN, fk_Nutricionista_fk_Funcionario_Codigo-Funcionario, fk_Nutricionista_fk_Funcionario_fk_Pessoa_CPF???)
    REFERENCES Nutricionista (CRN, fk_Funcionario_Codigo_Funcionario, ???)
    ON DELETE RESTRICT;
 
ALTER TABLE Andar ADD CONSTRAINT FK_Andar_3
    FOREIGN KEY (fk_Setor_Nome)
    REFERENCES Setor (Nome)
    ON DELETE RESTRICT;
 
ALTER TABLE Paciente ADD CONSTRAINT FK_Paciente_2
    FOREIGN KEY (fk_Pessoa_CPF)
    REFERENCES Pessoa (CPF)
    ON DELETE CASCADE;
 
ALTER TABLE Paciente ADD CONSTRAINT FK_Paciente_3
    FOREIGN KEY (fk_Quarto_Numero_Quarto)
    REFERENCES Quarto (Numero_Quarto)
    ON DELETE CASCADE;
 
ALTER TABLE Paciente ADD CONSTRAINT FK_Paciente_4
    FOREIGN KEY (fk_Medico_CRM, fk_Medico_fk_Funcionario_Codigo-Funcionario, fk_Medico_fk_Funcionario_fk_Pessoa_CPF???)
    REFERENCES Medico (CRM, fk_Funcionario_Codigo_Funcionario, ???)
    ON DELETE CASCADE;
 
ALTER TABLE Medico ADD CONSTRAINT FK_Medico_2
    FOREIGN KEY (fk_Funcionario_Codigo_Funcionario, fk_Funcionario_fk_Pessoa_CPF)
    REFERENCES Funcionario (Codigo_Funcionario, fk_Pessoa_CPF)
    ON DELETE CASCADE;
 
ALTER TABLE Enfermeiro ADD CONSTRAINT FK_Enfermeiro_2
    FOREIGN KEY (fk_Funcionario_Codigo_Funcionario, fk_Funcionario_fk_Pessoa_CPF)
    REFERENCES Funcionario (Codigo_Funcionario, fk_Pessoa_CPF)
    ON DELETE CASCADE;
 
ALTER TABLE Funcionario ADD CONSTRAINT FK_Funcionario_2
    FOREIGN KEY (fk_Pessoa_CPF)
    REFERENCES Pessoa (CPF)
    ON DELETE CASCADE;
 
ALTER TABLE Nutricionista ADD CONSTRAINT FK_Nutricionista_2
    FOREIGN KEY (fk_Funcionario_Codigo_Funcionario, fk_Funcionario_fk_Pessoa_CPF)
    REFERENCES Funcionario (Codigo_Funcionario, fk_Pessoa_CPF)
    ON DELETE CASCADE;
 
ALTER TABLE Quarto ADD CONSTRAINT FK_Quarto_2
    FOREIGN KEY (fk_Andar_Numero_Andar)
    REFERENCES Andar (Numero_Andar)
    ON DELETE RESTRICT;
 
ALTER TABLE Quarto ADD CONSTRAINT FK_Quarto_3
    FOREIGN KEY (fk_Enfermeiro_Coren, fk_Enfermeiro_fk_Funcionario_Codigo-Funcionario, fk_Enfermeiro_fk_Funcionario_fk_Pessoa_CPF???)
    REFERENCES Enfermeiro (Coren, fk_Funcionario_Codigo_Funcionario, ???)
    ON DELETE RESTRICT;