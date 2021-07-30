/* Banco de Dados 1 - Projeto Final: */
/* Hospital - Setor de Internação */
/*________________________________*/
/* Outros */

DELETE FROM quarto
    WHERE numero_quarto = 404 OR numero_quarto = 504;

UPDATE funcionario
    SET salario = 4000.00
    WHERE fk_pessoa_cpf = '22233344456';