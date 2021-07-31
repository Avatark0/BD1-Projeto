/* Banco de Dados 1 - Projeto Final: */
/* Hospital - Setor de Internação */
/*________________________________*/
/* Inserts */

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
        ('44455566678','nomeNutricionista2','998769252','Bauru','rua Batista de Carvalho','13-24');

INSERT INTO funcionario(fk_pessoa_cpf,profissao,salario)
VALUES  ('22233344455','Médico', 4000.00),
        ('22233344456','Médico', 4000.00),
        ('33344455566','Enfermeiro', 2000.00),
        ('33344455567','Enfermeiro', 2000.00),
        ('33344455568','Enfermeiro', 2000.00),
        ('44455566677','Nutricionista', 3000.00),
        ('44455566678','Nutricionista', 3000.00);

INSERT INTO medico(crm,fk_funcionario_codigo_funcionario,especializacao)
VALUES  ('12345678',1,'urologista'),
        ('12345679',2,'urologista');

INSERT INTO enfermeiro(coren,fk_funcionario_codigo_funcionario)
VALUES  ('23456789',3),
        ('23456790',4),
        ('23456791',5);

INSERT INTO nutricionista(crn,fk_funcionario_codigo_funcionario)
VALUES  ('34567890',6),
        ('34567891',7);

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
        ('11122233366','12345679',4,404,'C','2021-08-01'),
        ('11122233377','12345678',5,502,'C','2021-08-01'),
        ('11122233388','12345678',5,503,'E','2021-08-02');
