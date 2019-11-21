<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import = "javax.servlet.http.HttpSession" %>;
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Página inicial - sistema de pedidos</title>
</head>
<body>
<%
if(request.getSession().getAttribute("login")==null){
	%>
	<b>Tentativa de login inesperada recuzada</b>
<%request.getRequestDispatcher("/login.jsp").forward(request, response); }else{%>
<h1>Menu dousuário<</h1>

<p>Essa página ainda está em construção</p
<form action="saidaController" method="post">
<input type="submit" value="Sair">

</form>


</body>
</html>
<%}%>