/* Banco de Dados 1 - Projeto Final: */
/* Hospital - Setor de Internação */
/*________________________________*/
/* Gatilhos e Views: */

CREATE TRIGGER tr_leitos_livres AFTER INSERT ON paciente
    FOR EACH ROW
    BEGIN
        UPDATE andar SET leitos_livres = leitos_livres - 1
        WHERE andar.numero_andar = paciente.fk_andar_numero_andar
    END;