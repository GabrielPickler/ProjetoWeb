
    <%@ page import = "javax.servlet.http.HttpSession" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>P�gina inicial - sistema de pedidos</title>
</head>
<body>
<%
if(request.getSession().getAttribute("login")==null){
        %>
        <b>Tentativa de login inesperada recuzada</b>
<%request.getRequestDispatcher("/login.jsp").forward(request, response); }else{%>
<h1>Menu dousu�rio<</h1>
<p>p�gina em constru��o</p>p>

        <form class="needs-validation" novalidate action="saidaController">

  <button class="btn btn-lg btn-primary btn-block" type="submit">Sair</button>


</form>


</body>
</html>
<%}%>
