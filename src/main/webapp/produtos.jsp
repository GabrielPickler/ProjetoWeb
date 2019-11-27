
<%@ page import="javax.servlet.http.HttpSession"%>
<%@page import="br.unisul.web.projetoweb.dao.jpa.UsuarioDao"%>
<%@ page import="br.unisul.web.projetoweb.model.Usuario"%>
<%@ page import="br.unisul.web.projetoweb.model.Produto"%>

<%@ page import="java.util.List"%>
<%@ page import="br.unisul.web.projetoweb.model.Produto"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Produtos</title>
<link
	href="https://getbootstrap.com/docs/4.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	background-color: #f5f5f5;
}
</style>
</head>
<body>
     <nav class="navbar navbar-dark bg-primary">
		<form class="form-inline">
			<a class="btn btn-primary" role="button" href="menu.jsp"><label>Início</label></a>
			<a class="btn btn-primary" role="button" href ="#"><label>Produtos</label></a>
			<a class="btn btn-primary" role="button" href ="#"><label>Relatório</label></a>
			<a class="btn btn-primary" role="button" href ="saidaController"><label>Sair</label></a>
		</form>
	</nav>

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
		if (request.getAttribute("produtos") == null) {
				request.getRequestDispatcher("UsuarioController?id=" + idUsuario + "&acao=listarprodutos")
						.forward(request, response);
			}
	%>

	<%
		List<Produto> produtos = (List) request.getAttribute("produtos");
	%>

	<table class="table table-hover">
		<thead>
			<tr>
				<th scope="col"><label>#</label></th>
				<th scope="col"><label>Produto></label></th>
				<th scope="col"><label>Imagem</label></th>
				<th scope="col"><label>Medida</label></th>
				<th scope="col"><label>Quantidade</label></th>
				<th></th>
			</tr>
		</thead>
		<tbody>
		<%
			for (Produto produto : produtos) {
		%>
		<tr>
			<th scope="row"><%=produto.getIdProduto()%></th>
			<td><%=produto.getNome()%></td>
			<td><a class="image-link" href="<%=produto.getImagem()%>"><label>Abrir imagem</label></a></td>
			<td><%=produto.getMedida()%></td>
			<td><%=produto.getQuantidade()%></td>
			<td><a class="btn btn-primary btn-sm" role="button" href="#"><label>Comprar</label></a></td>
		</tr>
		<%
			}
		%>
		</tbody>
	</table>
	<%
		}
	%>
	<script type="text/javascript"> 
	$(document).ready(function() {
    $('.image-link').magnificPopup({type:'image'});
	});
	</script>
</body>
</html>
