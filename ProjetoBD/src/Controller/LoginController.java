/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.Conexao;
import DAO.UsuarioDAO;
import Model.Usuario;
import View.LoginView;
import View.MenuView;
import java.sql.Connection;
import java.sql.SQLException;
import javax.swing.JOptionPane;

/**
 *
 * @author User
 */
public class LoginController {

    private LoginView view;

    public LoginController(LoginView view) {
        this.view = view;
    }

    public void autenticar() throws SQLException {
        //buscar usuario da view
        String usuario = view.getjTextFieldUsuario().getText();
        String senha = view.getjPasswordFieldSenha().getText();

        Usuario usuarioAutenticar = new Usuario(usuario, senha);

        //verificar se existe no bd
        Connection conexao = new Conexao().getConnection();
        UsuarioDAO usuariodao = new UsuarioDAO(conexao);

        boolean existe = usuariodao.existePorUsuarioESenha(usuarioAutenticar);
        if (existe) {
            MenuView telaDeMenu = new MenuView();
            telaDeMenu.setVisible(true);
        }else{
            JOptionPane.showMessageDialog(view, "Usuario ou senha inválidas.");
        }

    }

}
