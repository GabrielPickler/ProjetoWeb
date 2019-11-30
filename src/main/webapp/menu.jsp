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
#imagem {
  position:absolute;
    top:35%;
    left:30%;
    margin-top:-50px;
    margin-left:-50px;
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
			<a class="btn btn-primary" role="button" href="http://localhost:8081/projetoweb/menu.jsp"><label>Início</label></a>
			<a class="btn btn-primary" role="button" href="http://localhost:8081/projetoweb/produtos.jsp?id=<%=usuario.getIdUsuario()%>"><label>Produtos</label></a>
			<a class="btn btn-primary" role="button" href="relatorio.jsp"><label>Relatório</label></a>
			<a class="btn btn-primary" role="button" href="saidaController"><label>Sair</label></a>
		</form>
	</nav>
	<h1>
		Bem vindo,
		<%=usuario.getNome()%></h1>	
	<img id ="imagem" src="https://www.proteste.org.br/-/media/proteste/images/home/supermercados/guia-supermercados.png?rev=109582c2-a645-4989-bfb5-9df64272dc89" class="rounded" >
	<%
		}
	%>
</body>
</html>
