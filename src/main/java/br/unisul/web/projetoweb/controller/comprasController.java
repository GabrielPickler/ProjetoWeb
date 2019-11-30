package br.unisul.web.projetoweb.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.unisul.web.projetoweb.dao.jpa.ProdutoDao;
import br.unisul.web.projetoweb.model.Produto;

@WebServlet("/comprasController")
public class comprasController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private ProdutoDao produtoDao = new ProdutoDao();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int quantidade = Integer.parseInt(request.getParameter("quantidade"));
		int id = Integer.parseInt(request.getParameter("id"));
		
		Produto produto = produtoDao.findById(id);
		
		produto.setQuantidade(produto.getQuantidade() - quantidade);
		produtoDao.update(produto);
		
		request.getRequestDispatcher("produtos.jsp").forward(request, response);

	}

}
