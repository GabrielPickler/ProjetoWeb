<%@ page import="br.unisul.web.projetoweb.dao.jpa.ProdutoDao"%>

<%@ page import="br.unisul.web.projetoweb.model.Produto"%>


<!doctype html>

<html lang="en">
<head>
<meta charset="utf-8">
<meta name="description" content="">
<title>Solicitar</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
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
<script type="text/javascript">
	$(document).ready(function() {
		$('#modalSolicitar').modal("show");
	});
</script>
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
		ProdutoDao produtoDao = new ProdutoDao();
			Produto produto = produtoDao.findById(Integer.parseInt(request.getParameter("id")));
	%>


	<div class="modal fade" id="modalSolicitar" tabindex="-1" role="dialog"
		aria-labelledby="TituloModalCentralizado" aria-hidden="true"
		data-keyboard="false" data-backdrop="static">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="TituloModalCentralizado">
						Solicitar
						<%=produto.getNome()%></h5>
					<a role="button" class="close" href="produtos.jsp"
						aria-label="Fechar"> <span aria-hidden="true">&times;</span>
					</a>
				</div>
				<form action="comprasController">
					<div class="modal-body">
						<b>Preço: </b>R$<span id="preco"><%=produto.getPreco()%></span><br>
						<b>Medida: </b><%=produto.getMedida()%><br> <b>Disponível:
						</b><span id="disponivel"><%=produto.getQuantidade()%></span><br>
						<br>
						<div class="col-md-2 mb-2">
							<input type="hidden" id="id" name="id"
								value="<%=produto.getIdProduto()%>" /> <label>Quantidade:</label>
							<input type="number" min=1 id="quantidade" name="quantidade">
						</div>
						<br>
						<b>Total: R$<span id="total"></span></b>
					</div>
					<div class="modal-footer">
						<button type="submit" id="salvar" type="button"
							class="btn btn-primary">Solicitar</button>
						<a role="button" class="btn btn-secondary" href="produtos.jsp">Voltar</a>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		window.onload = function() {
			document.getElementById("salvar").disabled = true;
		}
		var disponivel = parseInt(document.getElementById('disponivel').innerText);
		document
				.getElementById("quantidade")
				.addEventListener(
						'focusout',
						function() {
							if (document.getElementById("quantidade").value > disponivel) {
								document.getElementById("salvar").disabled = true;
								document.getElementById("total").innerHTML = "";
							} else {
								document.getElementById("salvar").disabled = false;
								var calcula = parseFloat(document
										.getElementById("preco").innerText)
										* document.getElementById("quantidade").value;
								var total = calcula.toFixed(2);
								document.getElementById("total").innerHTML = total;
							}
							if (document.getElementById("quantidade").value <= 0) {
								document.getElementById("salvar").disabled = true;
								document.getElementById("total").innerHTML = "";
							}

						});
	</script>
	<%
		}
	%>
</body>
</html>
