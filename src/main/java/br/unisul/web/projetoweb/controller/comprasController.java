package br.unisul.web.projetoweb.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.unisul.web.projetoweb.dao.jpa.PedidoDao;
import br.unisul.web.projetoweb.dao.jpa.ProdutoDao;
import br.unisul.web.projetoweb.model.Pedido;
import br.unisul.web.projetoweb.model.Produto;
import br.unisul.web.projetoweb.model.Usuario;

@WebServlet("/comprasController")
public class comprasController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private ProdutoDao produtoDao = new ProdutoDao();
	private PedidoDao pedidoDao = new PedidoDao();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int quantidade = Integer.parseInt(request.getParameter("quantidade"));
		int id = Integer.parseInt(request.getParameter("id"));
		
		Produto produto = produtoDao.findById(id);
		
		produto.setQuantidade(produto.getQuantidade() - quantidade);
		produtoDao.update(produto);
		
		Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
		
		DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss"); 
		Date date = new Date();
		dateFormat.format(date);
		
		DecimalFormat df = new DecimalFormat("###,##0.00");
		
		double total = produto.getPreco() * quantidade;
		df.format(total);
		
		Pedido pedido = new Pedido(date,quantidade,total,usuario, produto);
		
		pedidoDao.save(pedido);
		
		request.getRequestDispatcher("produtos.jsp").forward(request, response);
		
		

	}

}
