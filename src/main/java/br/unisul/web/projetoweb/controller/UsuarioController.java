package br.unisul.web.projetoweb.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.unisul.web.projetoweb.dao.jpa.ProdutoDao;
import br.unisul.web.projetoweb.dao.jpa.UsuarioDao;
import br.unisul.web.projetoweb.model.Produto;
import br.unisul.web.projetoweb.model.Usuario;

@WebServlet("/UsuarioController")
public class UsuarioController extends HttpServlet {
        private UsuarioDao usuarioDao = new UsuarioDao();
        private ProdutoDao produtoDao = new ProdutoDao();
        protected void doGet(HttpServletRequest request, HttpServletResponse response)
                        throws ServletException, IOException {
                doPost(request, response);

        }

        protected void doPost(HttpServletRequest request, HttpServletResponse response)
                        throws ServletException, IOException {
int id=(int)request.getSession().getAttribute("id");
//int id = (Integer.parseInt(request.getSession().getAttribute("id")));
String acao=request.getParameter("acao");
if((request.getParameter("acao").equalsIgnoreCase("pegaidusuario"))){
                Usuario usuario = usuarioDao.findById(id);

                request.setAttribute("usuario", usuario);
                request.setAttribute("contador", 1);
                request.getRequestDispatcher("/menu.jsp?id="+id).forward(request, response);
} else if((request.getParameter("acao").equalsIgnoreCase("listarprodutos"))){
                List<Produto> produtos = produtoDao.findAll();
request.setAttribute("produtos", produtos);
                request.getRequestDispatcher("/produtos.jsp?id="+id).forward(request, response);
} else {
System.out.println("nada");

}


        }

}
