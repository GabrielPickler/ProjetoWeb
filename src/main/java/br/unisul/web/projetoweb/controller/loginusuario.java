	package br.unisul.web.projetoweb.controller;
import java.io.IOException;
import java.text.ParseException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.unisul.web.projetoweb.dao.jpa.UsuarioDao;
import br.unisul.web.projetoweb.model.Usuario;

@WebServlet("/loginusuario")
public class loginusuario extends HttpServlet {
 private UsuarioDao usuarioDao = new UsuarioDao();
 
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    doPost(request, response);
}

protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	
String login=request.getParameter("login");
String senha=request.getParameter("senha");
if(verificaExisteUsuario(login)==true) {
	if(verificaSenha(senha, login)==false) {
		request.setAttribute("mensagem", "Senha inv�lida");
		
	
	}
	
}else {	
	request.setAttribute("mensagem", "usu�rio n�o existe no sistema");
	
}
	


			
		
	
	
request.getRequestDispatcher("/login.jsp").forward(request, response);

}

private boolean verificaSenha(String senha, String login) {
	
List <Usuario> usuarios=usuarioDao.findAll(); 
	
	for(Usuario u: usuarios) {
		if(u.getLogin().equalsIgnoreCase(login)) {
		
			if(u.getPassword().equals(senha)) {
			return true;
			
			}
			
		}
		
	}
	
	
	
	
	return false;	

}

private boolean verificaExisteUsuario(String login) {
	
	List <Usuario> usuarios=usuarioDao.findAll(); 
	
	for(Usuario u: usuarios) {
		if(u.getLogin().equalsIgnoreCase(login)) {
			return true;
		}
		
	}
	
	
	
	
	return false;	




}


}