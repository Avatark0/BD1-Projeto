/* Banco de Dados 1 - Projeto Final: */
/* Hospital - Setor de Internação */
/*________________________________*/
/* Inserts */

INSERT INTO pessoa(cpf,nome,telefone,cidade,rua,numero_rua)
VALUES  ('111.222.333-44','nomePaciente1','(14) 99876-9181','Bauru','rua Batista de Carvalho','10-20'),
        ('111.222.333-55','nomePaciente2','(14) 99876-9182','Bauru','rua Batista de Carvalho','10-21'),
        ('111.222.333-66','nomePaciente3','(14) 99876-9183','Bauru','rua Batista de Carvalho','10-22'),
        ('111.222.333-77','nomePaciente4','(14) 99876-9184','Bauru','rua Batista de Carvalho','10-23'),
        ('111.222.333-88','nomePaciente5','(14) 99876-9185','Bauru','rua Batista de Carvalho','10-24'),
        ('222.333.444-55','nomeMedico1','(14) 99876-9271','Bauru','rua Batista de Carvalho','11-21'),
        ('222.333.444-56','nomeMedico2','(14) 99876-9272','Bauru','rua Batista de Carvalho','11-22'),
        ('333.444.555-66','nomeEnfermeiro1','(14) 99876-9261','Bauru','rua Batista de Carvalho','12-22'),
        ('333.444.555-67','nomeEnfermeiro2','(14) 99876-9262','Bauru','rua Batista de Carvalho','12-23'),
        ('333.444.555-68','nomeEnfermeiro3','(14) 99876-9263','Bauru','rua Batista de Carvalho','12-24'),
        ('444.555.666-77','nomeNutricionista1','(14) 99876-9251','Bauru','rua Batista de Carvalho','13-23'),
        ('444.555.666-78','nomeNutricionista2','(14) 99876-9252','Bauru','rua Batista de Carvalho','13-24'),
        ('444.555.666-79','nomeNutricionista3','(14) 99876-9253','Bauru','rua Batista de Carvalho','13-25');
        
INSERT INTO funcionario(fk_pessoa_cpf,profissao,salario)
VALUES  ('222.333.444-55','Médico', 4000.00),
        ('222.333.444-56','Médico', 4000.00),
        ('333.444.555-66','Enfermeiro', 2000.00),
        ('333.444.555-67','Enfermeiro', 2000.00),
        ('333.444.555-68','Enfermeiro', 2000.00),
        ('444.555.666-77','Nutricionista', 3000.00),
        ('444.555.666-78','Nutricionista', 3000.00),
        ('444.555.666-79','Nutricionista', 3000.00);

INSERT INTO medico(crm,fk_funcionario_codigo_funcionario,especializacao)
    SELECT '12345678',codigo_funcionario,'urologista'
    FROM funcionario WHERE fk_pessoa_cpf = '222.333.444-55';

INSERT INTO medico(crm,fk_funcionario_codigo_funcionario,especializacao)
    SELECT '12345679',codigo_funcionario,'urologista'
    FROM funcionario WHERE fk_pessoa_cpf = '222.333.444-56';

INSERT INTO enfermeiro(coren,fk_funcionario_codigo_funcionario)
    SELECT '23456789',codigo_funcionario
    FROM funcionario WHERE fk_pessoa_cpf = '333.444.555-66';

INSERT INTO enfermeiro(coren,fk_funcionario_codigo_funcionario)
    SELECT '23456790',codigo_funcionario
    FROM funcionario WHERE fk_pessoa_cpf = '333.444.555-67';
    
INSERT INTO enfermeiro(coren,fk_funcionario_codigo_funcionario)
    SELECT '23456791',codigo_funcionario
    FROM funcionario WHERE fk_pessoa_cpf = '333.444.555-68';

INSERT INTO nutricionista(crn,fk_funcionario_codigo_funcionario)
    SELECT '34567890',codigo_funcionario
    FROM funcionario WHERE fk_pessoa_cpf = '444.555.666-77';

INSERT INTO nutricionista(crn,fk_funcionario_codigo_funcionario)
    SELECT '34567891',codigo_funcionario
    FROM funcionario WHERE fk_pessoa_cpf = '444.555.666-78';

INSERT INTO nutricionista(crn,fk_funcionario_codigo_funcionario)
    SELECT '34567892',codigo_funcionario
    FROM funcionario WHERE fk_pessoa_cpf = '444.555.666-79';

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
VALUES  ('111.222.333-44','12345678',4,401,'A','2021-07-31'),
        ('111.222.333-55','12345679',4,402,'C','2021-08-01'),
        ('111.222.333-66','12345679',4,403,'C','2021-08-01'),
        ('111.222.333-77','12345678',5,502,'C','2021-08-01'),
        ('111.222.333-88','12345678',5,503,'E',CURRENT_DATE);