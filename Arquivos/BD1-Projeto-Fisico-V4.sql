/* BD1-Projeto-Logico-V4: */

CREATE TABLE Andar (
    Numero-Andar INTEGER PRIMARY KEY,
    fk_Setor_Nome VARCHAR,
    fk_Nutricionista_CRN INTEGER,
    Capacidade INTEGER,
    Leitos-Livres INTEGER
);

CREATE TABLE Paciente (
    Codigo-Paciente INTEGER,
    fk_Pessoa_CPF INTEGER,
    fk_Medico_CRM INTEGER,
    fk_Quarto_Numero-Quarto INTEGER,
    Numero-Leito INTEGER,
    Urgencia CHAR,
    Data-Internacao TIMESTAMP,
    Data-Alta TIMESTAMP,
    PRIMARY KEY (Codigo-Paciente, fk_Pessoa_CPF)
);

CREATE TABLE Medico (
    CRM INTEGER,
    fk_Funcionario_Codigo-Funcionario INTEGER,
    Especializacao VARCHAR,
    PRIMARY KEY (CRM, fk_Funcionario_Codigo-Funcionario)
);

CREATE TABLE Enfermeiro (
    Coren INTEGER,
    fk_Funcionario_Codigo-Funcionario INTEGER,
    Chefe BOOLEAN,
    PRIMARY KEY (Coren, fk_Funcionario_Codigo-Funcionario)
);

CREATE TABLE Funcionario (
    Codigo-Funcionario INTEGER,
    fk_Pessoa_CPF INTEGER,
    Profissao VARCHAR,
    Turno CHAR,
    Salario FLOAT,
    PRIMARY KEY (Codigo-Funcionario, fk_Pessoa_CPF)
);

CREATE TABLE Pessoa (
    CPF INTEGER PRIMARY KEY,
    Nome VARCHAR,
    Telefone INTEGER,
    CEP INTEGER,
    Cidade VARCHAR,
    Bairro VARCHAR,
    Rua VARCHAR,
    Numero INTEGER
);

CREATE TABLE Nutricionista (
    CRN INTEGER,
    fk_Funcionario_Codigo-Funcionario INTEGER,
    PRIMARY KEY (CRN, fk_Funcionario_Codigo-Funcionario)
);

CREATE TABLE Quarto (
    Numero-Quarto INTEGER PRIMARY KEY,
    fk_Andar_Numero-Andar INTEGER,
    fk_Enfermeiro_Coren INTEGER
);

CREATE TABLE Setor (
    Nome VARCHAR PRIMARY KEY
);
 
ALTER TABLE Andar ADD CONSTRAINT FK_Andar_2
    FOREIGN KEY (fk_Nutricionista_CRN, fk_Nutricionista_fk_Funcionario_Codigo-Funcionario, fk_Nutricionista_fk_Funcionario_fk_Pessoa_CPF???)
    REFERENCES Nutricionista (CRN, fk_Funcionario_Codigo-Funcionario, ???)
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
    FOREIGN KEY (fk_Quarto_Numero-Quarto)
    REFERENCES Quarto (Numero-Quarto)
    ON DELETE CASCADE;
 
ALTER TABLE Paciente ADD CONSTRAINT FK_Paciente_4
    FOREIGN KEY (fk_Medico_CRM, fk_Medico_fk_Funcionario_Codigo-Funcionario, fk_Medico_fk_Funcionario_fk_Pessoa_CPF???)
    REFERENCES Medico (CRM, fk_Funcionario_Codigo-Funcionario, ???)
    ON DELETE CASCADE;
 
ALTER TABLE Medico ADD CONSTRAINT FK_Medico_2
    FOREIGN KEY (fk_Funcionario_Codigo-Funcionario, fk_Funcionario_fk_Pessoa_CPF)
    REFERENCES Funcionario (Codigo-Funcionario, fk_Pessoa_CPF)
    ON DELETE CASCADE;
 
ALTER TABLE Enfermeiro ADD CONSTRAINT FK_Enfermeiro_2
    FOREIGN KEY (fk_Funcionario_Codigo-Funcionario, fk_Funcionario_fk_Pessoa_CPF)
    REFERENCES Funcionario (Codigo-Funcionario, fk_Pessoa_CPF)
    ON DELETE CASCADE;
 
ALTER TABLE Funcionario ADD CONSTRAINT FK_Funcionario_2
    FOREIGN KEY (fk_Pessoa_CPF)
    REFERENCES Pessoa (CPF)
    ON DELETE CASCADE;
 
ALTER TABLE Nutricionista ADD CONSTRAINT FK_Nutricionista_2
    FOREIGN KEY (fk_Funcionario_Codigo-Funcionario, fk_Funcionario_fk_Pessoa_CPF)
    REFERENCES Funcionario (Codigo-Funcionario, fk_Pessoa_CPF)
    ON DELETE CASCADE;
 
ALTER TABLE Quarto ADD CONSTRAINT FK_Quarto_2
    FOREIGN KEY (fk_Andar_Numero-Andar)
    REFERENCES Andar (Numero-Andar)
    ON DELETE RESTRICT;
 
ALTER TABLE Quarto ADD CONSTRAINT FK_Quarto_3
    FOREIGN KEY (fk_Enfermeiro_Coren, fk_Enfermeiro_fk_Funcionario_Codigo-Funcionario, fk_Enfermeiro_fk_Funcionario_fk_Pessoa_CPF???)
    REFERENCES Enfermeiro (Coren, fk_Funcionario_Codigo-Funcionario, ???)
    ON DELETE RESTRICT;