  <%@ page import = "javax.servlet.http.HttpSession" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Página inicial - sistema de pedidos</title>
<link href="https://getbootstrap.com/docs/4.3/dist/css/bootstrap.min.css" rel="stylesheet">
                <style>
                 body{
        background-color: #f5f5f5;
                            }
                </style>
</head>
<body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="menu.jsp">Produtos<span class="sr-only">(current)</span></a>
      </li>

       <li class="nav-item active">
        <a class="nav-link" href="#">Relatórios</a>
      </li>

      <li class="nav-item active">
        <a class="nav-link" href="http://localhost:8080/projetoweb/saidaController">Sair</a>
      </li>

    </ul>
  </div>
</nav>
<%
if(request.getSession().getAttribute("login")==null){
        %>
        <b>Tentativa de login inesperada recusada</b>
<%request.getRequestDispatcher("/login.jsp").forward(request, response); }else{%>
<h1>Menu do usuário</h1>
<p>página em construção</p>
<%int id=request.getAttribute("id");%>
<%=id%>
<a href="http://localhost:8080/projetoweb/saidaController">Sair</a>

</body>
</html>
<%}%>
