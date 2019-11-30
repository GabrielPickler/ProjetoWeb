<%@ page import="javax.servlet.http.HttpSession"%>
<%@page import="br.unisul.web.projetoweb.dao.jpa.UsuarioDao"%>
<%@ page import="br.unisul.web.projetoweb.model.Usuario"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Página inicial - sistema de pedidos</title>
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
	<%
		if (request.getSession().getAttribute("login") == null) {
	%>
	<b>Tentativa de login inesperada recusada</b>
	<%
		request.getRequestDispatcher("/login.jsp").forward(request, response);
		} else {
	%>
	<%
		int id = (int) request.getSession().getAttribute("id");
	%>
	<%
		Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
	%>
	<nav class="navbar navbar-dark bg-primary">
		<form class="form-inline">
			<a class="btn btn-primary" role="button" href="http://localhost:8081/projetoweb/loginusuario"><label>Início</label></a>
			<a class="btn btn-primary" role="button" href="http://localhost:8081/projetoweb/produtos.jsp?id=<%=usuario.getIdUsuario()%>"><label>Produtos</label></a>
			<a class="btn btn-primary" role="button" href="#"><label>Relatório</label></a>
			<a class="btn btn-primary" role="button" href="saidaController"><label>Sair</label></a>
		</form>
	</nav>
	<h1>
		Bem vindo,
		<%=usuario.getNome()%></h1>
	<p>página em construção</p>
	<%
		String url = "http://localhost:8080/projetoweb/produtos.jsp?id=" + usuario.getIdUsuario();
	%>
	<a href="<%=url%>">Produtos</a>
	<a href="http://localhost:8080/projetoweb/saidaController">Sair</a>
	<%
		}
	%>
</body>
</html>
