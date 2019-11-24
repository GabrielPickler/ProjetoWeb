
<%@ page import="javax.servlet.http.HttpSession"%>
<%@page import="br.unisul.web.projetoweb.dao.jpa.UsuarioDao"%>
<%@ page import="br.unisul.web.projetoweb.model.Usuario"%>
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
        <%
                if (request.getSession().getAttribute("login") == null) {
        %>
        <b>Tentativa de login inesperada recusada</b>
        <%
                request.getRequestDispatcher("/login.jsp").forward(request, response);
                } else {%>
<h1>Produtos</h1>
<%int idUsuario=(int)request.getParameter("id");%>
<%=idUsuario%>
        <%
                }
        %>
</body>
</html>
