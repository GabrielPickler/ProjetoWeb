
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
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<link href="https://getbootstrap.com/docs/4.3/dist/css/bootstrap.min.css" rel="stylesheet">
<meta charset="UTF-8">
<title>Produtos</title>

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
	<%ProdutoDao produtoDao = new ProdutoDao(); %>

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
		%>
		<tr>
			<th scope="row"><%=produto.getIdProduto()%></th>
			<td><%=produto.getNome()%></td>
			<td><a class="image-link" href="https://scontent.fbfh1-2.fna.fbcdn.net/v/t1.6435-9/32953086_1693281210707967_551886431199428608_n.jpg?_nc_cat=104&_nc_ohc=VOEMcXmpWQ4AQmMDHSwp2zxs1VPeoYWampapU1XO09ZQCrIfp4F5j8Htw&_nc_ht=scontent.fbfh1-2.fna&oh=4222e9cae46f9d19d429bda03d8d5039&oe=5E7E1D33"><label>Abrir imagem</label></a></td>
			<td><%=produto.getMedida()%></td>
			<td><%=produto.getQuantidade()%></td>
			<td><a id="produto<%=produto.getIdProduto()%>" class="btn btn-primary btn-sm" role="button" href="#" data-toggle="modal" data-target="#comprar"><label>Comprar</label></a></td>		
		</tr>
		<%
			}
		%>
		</tbody>		
	</table>
			<div class="modal fade" id="comprar" tabindex="-1" role="dialog" aria-labelledby="TituloModalCentralizado" aria-hidden="true">
				  <div class="modal-dialog modal-dialog-centered" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="TituloModalCentralizado">Solicitar Produto</h5>				        
				        <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div>
				      <div class="modal-body">
				      <div class="col-md-3 mb-3">
						<label for = "qntd">Quantidade</label>
				      	<input type="number" name = "quantidade" class="form-control">
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-primary">Confirmar</button>
				        <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>				     
				      </div>
				    </div>
				  </div>
				</div>
				</div>
	
	<%
		}
	%>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js">
	$(document).ready(function(){
	    $('.modal').modal('show');
	});
	</script>
</body>
</html>
