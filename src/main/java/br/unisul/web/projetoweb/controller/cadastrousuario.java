package br.unisul.web.projetoweb.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.unisul.web.projetoweb.dao.jpa.EnderecoDao;
import br.unisul.web.projetoweb.dao.jpa.UsuarioDao;
import br.unisul.web.projetoweb.model.Endereco;
import br.unisul.web.projetoweb.model.Usuario;



@WebServlet("/cadastrousuario")
public class cadastrousuario extends HttpServlet {
	
private UsuarioDao usuarioDao=new UsuarioDao();	
private EnderecoDao enderecoDao=new EnderecoDao();
	
	
	
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
	
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
String login=request.getParameter("login");
    	String senha=request.getParameter("senha");
    	String nome=request.getParameter("nome");
    	String nascimento=request.getParameter("nascimento");
 String sexo=request.getParameter("sexo");
 String cep=request.getParameter("cep");
 int numero=Integer.parseInt(request.getParameter("numero"));
 String complemento=request.getParameter("complemento");
 String rua=request.getParameter("rua");
 String bairro=request.getParameter("bairro");
 String cidade=request.getParameter("cidade");
 String uf=request.getParameter("uf");
 Endereco endereco=new Endereco();
 endereco.setCep(cep);
 endereco.setNumero(numero);
 endereco.setComplemento(complemento);
 endereco.setRua(rua);
 endereco.setBairro(bairro);
 endereco.setCidade(cidade);
 endereco.setEstado(uf);
 
 

 salvaEndereco(endereco);
// salvaUsuario(usuario);
endereco=null;
 
 response.sendRedirect("cadastro.jsp");

    }

	private void salvaEndereco(Endereco endereco) {
enderecoDao.save(endereco);	
		
	}

	// private void salvaUsuario(Usuario usuario) {
	//	
		//
//	}    
	
}
