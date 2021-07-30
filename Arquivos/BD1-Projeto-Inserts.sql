/* Banco de Dados 1 - Projeto Final: */
/* Hospital - Setor de Internação */
/*________________________________*/
/* Inserts: */

insert into pessoa(cpf,nome,telefone,cidade,rua,numero)
values  ('11122233344','nomePaciente1','998769181','Bauru','rua Batista de Carvalho','10-20'),
        ('22233344455','nomeMedico1','998769271','Bauru','rua Batista de Carvalho','11-21'),
        ('33344455566','nomeEnfermeiro1','998769261','Bauru','rua Batista de Carvalho','12-22'),
        ('44455566677','nomeNutricionista1','998769251','Bauru','rua Batista de Carvalho','13-23');

insert into funcionario(fk_pessoa_cpf,profissao,turno,salario)
values  ('22233344455','Médico','m', 4000.00),
        ('33344455566','Enfermeiro','m', 2000.00),
        ('44455566677','Nutricionista','m', 3000.00);

insert into medico(crm,fk_funcionario_codigo_funcionario,especializacao)
values  ('12345678',1,'urologista');

insert into enfermeiro(coren,fk_funcionario_codigo_funcionario,chefe)
values  ('23456789',2);

insert into nutricionista(crn,fk_funcionario_codigo_funcionario)
values  ('34567890',3);

insert into andar(numero_andar,setor,fk_nutricionista_crn,capacidade)
values  (4,'Internação','34567890',100);

insert into quarto(numero_quarto,fk_andar_numero_andar,fk_enfermeiro_coren)
values  (10,4,'23456789');

insert into paciente(fk_pessoa_cpf,fk_medico_crm,fk_andar_numero_andar,fk_quarto_numero_quarto,numero_leito,urgencia,data_internacao)
values  ('11122233344','12345678',4,10,1,'n','2021-08-02');
