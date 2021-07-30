/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.Conexao;
import DAO.UsuarioDAO;
import Model.Usuario;
import View.FormCadastroView;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;
import javax.swing.JTextField;

/**
 *
 * @author User
 */
public class FormCadastroController {

    private FormCadastroView view;

    public FormCadastroController(FormCadastroView view) {
        this.view = view;
    }

    public void salvaUsuario() {

        String usuario = view.getjTextFieldUsuario().getText();
        String senha = view.getjPasswordFieldSenha().getText();

        Usuario usuarionovo = new Usuario(usuario, senha);

        try {
            Connection conexao = new Conexao().getConnection();
            UsuarioDAO usuariodao = new UsuarioDAO(conexao);
            usuariodao.insert(usuarionovo);

            JOptionPane.showMessageDialog(null, "Usuario salvo com sucesso.");
        } catch (SQLException ex) {
            Logger.getLogger(FormCadastroView.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
