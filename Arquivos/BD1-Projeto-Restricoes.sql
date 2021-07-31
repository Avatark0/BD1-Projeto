/* Banco de Dados 1 - Projeto Final: */
/* Hospital - Setor de Internação */
/*________________________________*/
/* Restrições */

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
    FOREIGN KEY (fk_andar_numero_andar)
    REFERENCES andar (numero_andar)
    ON DELETE RESTRICT;

ALTER TABLE paciente ADD CONSTRAINT FK_paciente_2
    FOREIGN KEY (fk_quarto_numero_quarto)
    REFERENCES quarto (numero_quarto)
    ON DELETE RESTRICT;
 
ALTER TABLE paciente ADD CONSTRAINT FK_paciente_3
    FOREIGN KEY (fk_medico_crm)
    REFERENCES medico (crm)
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

-- ALTER TABLE paciente ADD CONSTRAINT FK_paciente_1
--     FOREIGN KEY (fk_pessoa_cpf)
--     REFERENCES pessoa (cpf)
--     ON DELETE CASCADE;

-- ALTER TABLE funcionario ADD CONSTRAINT FK_funcionario_1
--     FOREIGN KEY (fk_pessoa_cpf)
--     REFERENCES pessoa (cpf)
--     ON DELETE CASCADE;