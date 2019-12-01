
<%@ page import="javax.servlet.http.HttpSession"%>
<%@page import="br.unisul.web.projetoweb.dao.jpa.UsuarioDao"%>
<%@ page import="br.unisul.web.projetoweb.model.Usuario"%>
<%@ page import="br.unisul.web.projetoweb.model.Produto"%>
<%@ page import="br.unisul.web.projetoweb.dao.jpa.ProdutoDao"%>

<%@ page import="java.util.List"%>
<%@ page import="br.unisul.web.projetoweb.model.Produto"%>
<!DOCTYPE html>
<html>
<head>
<link href="lightbox.css" rel="stylesheet" />

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
<link
	href="https://getbootstrap.com/docs/4.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<meta charset="UTF-8">
<title>Produtos</title>

<style>
body {
	background-color: #f5f5f5;
}
</style>
    <script type="text/javascript">
    window.history.forward();
    function noBack() { window.history.forward(); }
    </script>
</head>
<body onload="noBack();" onpageshow="if (event.persisted) noBack();">

	<nav class="navbar navbar-dark bg-primary">
		<form class="form-inline">
			<a class="btn btn-primary" role="button" href="menu.jsp"><label>Início</label></a>
			<a class="btn btn-primary" role="button" href="#"><label>Produtos</label></a>
			<a class="btn btn-primary" role="button" href="relatorio.jsp"><label>Relatório</label></a>
			<a class="btn btn-primary" role="button" href="saidaController"><label>Sair</label></a>
		</form>
	</nav>
	<%
		ProdutoDao produtoDao = new ProdutoDao();
	%>

	<%
		if (request.getSession().getAttribute("login") == null) {
	%>
	<b>Tentativa de login inesperada recusada</b>
	<%
		request.getRequestDispatcher("/login.jsp").forward(request, response);
		} else {
	%>
	<h1>Produtos</h1>
	<%
		int idUsuario = (int) request.getSession().getAttribute("id");
	%>


	<%
		List<Produto> produtos = produtoDao.findAll();
	%>


	<table class="table table-hover">
		<thead>
			<tr>
				<th scope="col"><label>#</label></th>
				<th scope="col"><label>Produtos</label></th>
				<th scope="col"><label>Imagem</label></th>
				<th scope="col"><label>Medida</label></th>
				<th scope="col"><label>Quantidade</label></th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<%
				for (Produto produto : produtos) {
						request.setAttribute("id", produto.getIdProduto());
			%>
			<tr>
				<th scope="row"><%=produto.getIdProduto()%></th>
				<td><%=produto.getNome()%></td>
				<td><a data-lightbox="image-1" data-title="Produto"
					class="image-link" href="<%=produto.getImagem()%>"><label>Abrir
							imagem</label></a></td>
				<td><%=produto.getMedida()%></td>
				<td><%=produto.getQuantidade()%></td>
				<td><a id="produto<%=produto.getIdProduto()%>"
					class="btn btn-primary btn-sm" role="button"
					href="solicitarController?id=<%=produto.getIdProduto()%>"><label>Comprar</label></a></td>
			</tr>
			<%
				}
			%>
		</tbody>
	</table>
	<%
		}
	%>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="lightbox.js"></script>
</body>
</html>
