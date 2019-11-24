package br.unisul.web.projetoweb.controller;

import java.io.IOException;
import java.text.ParseException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.unisul.web.projetoweb.dao.jpa.UsuarioDao;
import br.unisul.web.projetoweb.model.Usuario;

@WebServlet("/UsuarioController")
public class UsuarioController extends HttpServlet {
	private UsuarioDao usuarioDao = new UsuarioDao();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int id = (Integer.parseInt(request.getParameter("id")));
String acao=request.getParameter("acao");
if((request.getParameter("acao").equalsIgnoreCase("pegaidusuario"))){
		Usuario usuario = usuarioDao.findById(id);
		request.setAttribute("usuario", usuario);
		request.setAttribute("contador", 1);
		request.getRequestDispatcher("/menu.jsp").forward(request, response);
} else if((request.getParameter("acao").equalsIgnoreCase("listar"))){
System.out.println("listar");
} else {
System.out.println("nada");

}


	}

}
