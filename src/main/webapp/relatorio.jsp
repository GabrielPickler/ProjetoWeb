<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@page import="br.unisul.web.projetoweb.dao.jpa.UsuarioDao"%>
<%@ page import="br.unisul.web.projetoweb.model.Usuario"%>
<%@ page import="br.unisul.web.projetoweb.model.Produto"%>
<%@ page import="br.unisul.web.projetoweb.dao.jpa.ProdutoDao"%>
<%@ page import="br.unisul.web.projetoweb.dao.jpa.PedidoDao"%>
<%@ page import="br.unisul.web.projetoweb.model.Pedido"%>
<%@ page import="java.text.DecimalFormat"%>

<%@ page import="java.util.List"%>
<%@ page import="br.unisul.web.projetoweb.model.Produto"%>
<!DOCTYPE html>
<html>
<head>

<link
	href="https://getbootstrap.com/docs/4.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<meta charset="UTF-8">
<title>Relatório</title>

<style>
body {
	background-color: #f5f5f5;
}

#total {
	margin-left: 80%;
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
			<a class="btn btn-primary" role="button" href="produtos.jsp"><label>Produtos</label></a>
			<a class="btn btn-primary" role="button" href="relatorio.jsp"><label>Relatório</label></a>
			<a class="btn btn-primary" role="button" href="saidaController"><label>Sair</label></a>
		</form>
	</nav>
	<%
		PedidoDao pedidoDao = new PedidoDao();
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
	%>

	<%
		if (request.getSession().getAttribute("login") == null) {
	%>
	<b>Tentativa de login inesperada recusada</b>
	<%
		request.getRequestDispatcher("/login.jsp").forward(request, response);
		} else {
	%>
	<h1>Relatório</h1>
	<%
		int idUsuario = (int) request.getSession().getAttribute("id");
	%>


	<%
		List<Pedido> pedidos = pedidoDao.findAll();
	%>


	<table class="table table-hover">
		<thead>
			<tr>
				<th scope="col"><label>Usuário</label></th>
				<th scope="col"><label>Data da solicitação</label></th>
				<th scope="col"><label>Produto</label></th>
				<th scope="col"><label>Quantidade</label></th>
				<th scope="col"><label>Total</label></th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<%
				for (Pedido pedido : pedidos) {
			%>
			<tr>
				<td><label><%=pedido.getUsuario()%></label></td>
				<td><label><%=sdf.format(pedido.getData())%></label></td>
				<td><label><%=pedido.getProduto()%></label></td>
				<td><label><%=pedido.getQuantidade()%></label></td>
				<td><label>R$<%=pedido.getTotal()%></label></td>
			</tr>
			<%
				}
			%>
		</tbody>
	</table>
	<%
		DecimalFormat df = new DecimalFormat("###,##0.00");
			double total = pedidoDao.total();
	%>
	<div align="center">
		<span id="total"> <b>Valor total:</b> <input type="text"
			name="quantidade" value="R$ <%=df.format(total)%>" disabled>
		</span>
		<%
			}
		%>
	</div>

	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</body>
</html>
