<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <!doctype html>
    <html>
    <head>
    <title>Cadastro</title>
    	<link href="https://getbootstrap.com/docs/4.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

	    <style>
	    #formulario{
	    margin-left: 15px;
	    }
	    
	    body{
	    background-color: #f5f5f5;
	    }

	      .bd-placeholder-img {
	        font-size: 1.000rem;
	        text-anchor: middle;
	        -webkit-user-select: none;
	        -moz-user-select: none;
	        -ms-user-select: none;
	        user-select: none;
	      }
	
	      @media (min-width: 600px) {
	        .bd-placeholder-img-lg {
	          font-size: 3.5rem;
	        }
	      }  
	      
	      .botoes{
	      margin-left: 100%;
	      }
      </style>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
   <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
           
      </head>
      
 <body>
 	<%
	  if(request.getAttribute("erroSenha")!=null){
	%>
	<div class="alert alert-danger" role="alert">
	 <b><%=request.getAttribute("erroSenha") %></b><%} %>
	</div>
	
	<%
	  if(request.getAttribute("erroIdade")!=null){
	%>
	<div class="alert alert-danger" role="alert">
	 <b><%=request.getAttribute("erroIdade") %></b><%} %>
	</div>

	 <%
	  if(request.getAttribute("erro")!=null){
	%>
	<div class="alert alert-danger" role="alert">
	 <b><%=request.getAttribute("erro") %></b><%} %>
	</div>
	
	<b><font size="10"><label>Cadastro de Usuário</label></font></b>
	<hr color="black">
	<br>
	<form id = "formulario" class="needs-validation" novalidate action="cadastroController">
		<div class="col-md-4 mb-3">
		<div class = row>
			<label for="usuario">Usuário *</label> <input type="text"
				class="form-control" id="usuario"
				placeholder="Digite seu usuário" value="" required="required" name = "login" size="99" maxlength="99">
			<div class="invalid-feedback">
          Campo obrigatório.
 			</div>
		</div>
		</div>
		<div class="col-md-4 mb-3">
		<div class = row>
			<label for="senha">Senha *</label> <input type="password"
				name="senha" class="form-control" id="senha"
				placeholder="Digite sua senha" value="" required="required" size="10" maxlength="10">
			<div class="invalid-feedback">Campo obrigatório.</div>
		</div>
		</div>
		<div class="col-md-4 mb-3">
		<div class = row>
			<label for="csenha">Confirmar a senha *</label> <input
				type="password" name="csenha" class="form-control"
				id="csenha" placeholder="Confirme sua senha" value=""
				required="required" size="10" maxlength="10">
			<div class="invalid-feedback">Campo obrigatório</div>
			<div id = "respostaSenha" class="invalid-feedback"></div>					
		</div>
		<br>
		</div>
		
		<label><b>Dados Pessoais</b></label>
		<br>
		<br>
		<div class="col-md-3 mb-3">
		<div class = row>
			<label for="nome">Nome *</label> <input type="text" size="99" maxlength="99"
				class="form-control" name="nome" id="nome"
				placeholder="Digite seu nome" required = "required">
			<div class="invalid-feedback"></div>
		</div>
		</div>
		<div class="form-row">
		<div class="col-md-2 mb-2" >
			<label for="nascimento">Data de nascimento *</label> <input
				type="date" class="form-control" name="nascimento"
				id="nascimento" required = "required">
			<div class="invalid-feedback">Campo obrigatório.</div>
		</div>
		<div class="col-md-1 mb-1">
		<label for = "idade">Idade</label>
		<span class="d-inline-block" tabindex="0" data-toggle="tooltip" title="Sua idade deve ser maior que 5 anos e menor que 120 anos"></span>
		<input type="number" name = "idade" class="form-control" id = "idade" min ="5" max ="120" readonly>	
		<div id = "respostaIdade" class="invalid-feedback">
		</div>
		</div>
		</div>
		<br>			
			<label for="sexo">Sexo *: </label>
			<div class="custom-control custom-radio custom-control-inline">	
			<input type="radio" class="custom-control-input" name="sexo" id="sexo1" value = "Masculino"  required><label class="custom-control-label" for = "sexo1">Masculino</label>			
		</div>	
		<div class="custom-control custom-radio custom-control-inline">
			<input type="radio" class="custom-control-input" name="sexo" id="sexo2" value = "Feminino" required ><label class="custom-control-label" for = "sexo2">Feminino</label>			
			<div class="invalid-feedback"></div>
			</div>
			<br>
			<br>		
		<div class="col-md-3 mb-3">
		<div class = row>
			<label for="cep">CEP *</label> <input type="text"
				class="form-control" name="cep" id="cep" maxlength="9" placeholder="CEP" required = "required">
			<div class="invalid-feedback">Campo obrigatório.</div>
			<div id = "respostaCep" class="invalid-feedback">
		</div>
		</div>
		</div>
		<div class="form-row">
			<div class="col-md-6 mb-3">
				<label for="rua">Logradouro</label> <input
					type="text" class="form-control" name="rua" id="rua" size="99" maxlength="99"
					placeholder="Logradouro">
			</div>
			<div class="col-md-1 mb-1">
				<label for="numero">Número</label> <input type="number"
					class="form-control" name="numero" id="numero"
					placeholder="Número" min="1">				
			</div>
		</div>
		<div class="form-row">
			<div class="col-md-3 mb-3">
				<label for="complemento">Complemento</label> <input
					type="text" class="form-control" name="complemento" size="50" maxlength="50"
					id="complemento" placeholder="Complemento">
			</div>
			<div class="col-md-3 mb-3">
				<label for="uf">Estado</label> <input type="text"
					class="form-control" name="uf" id="uf" size="2" maxlength="2"
					placeholder="Digite seu estado">
			</div>
		</div>
		<div class="form-row">
			<div class="col-md-3 mb-3">
				<label for="cidade">Cidade</label> <input type="text" size="99" maxlength="99"
					class="form-control" name="cidade" id="cidade"
					placeholder="Digite sua cidade">
			</div>
			<div class="col-md-3 mb-3">
				<label for="bairro">Bairro</label> <input type="text" size="99" maxlength="99"
					class="form-control" name="bairro" id="bairro"
					placeholder="Digite seu bairro">
			</div>
		</div>
		<br>
		<span id ="botoes">	
		<button id ="cadastrar" class="btn btn-primary" type="submit">Cadastrar</button>
		<a class="btn btn-primary" id="limpar" href= "#" role="button">Limpar</a>
		<a class="btn btn-primary" href="login.jsp" role="button">Voltar</a>
		</span>
		
	</form>   
    <script type = "text/javascript" src = "procuraCep.js"></script> 
	<script type = "text/javascript" src = "cadastrarUsuario.js"></script>
	<script type="text/javascript">
	document.getElementById("nascimento").addEventListener('focusout', function() {
		if(($("#idade").val() > 120) || ($("#idade").val() < 5)){
			$("#cadastrar").attr("disabled", true);
		}else{
			$("#cadastrar").attr("disabled", false);
		}
	});
	</script>
	  
	<script type = "text/javascript">
		$("#respostaSenha").hide();
		document.getElementById("csenha").addEventListener('focusout', function() {
			if($("#csenha").val() != $("#senha").val() ){
				$("#cadastrar").attr("disabled", true);
				$("#respostaSenha").html("Suas senhas não coincidem. Tente novamente.");
				$("#respostaSenha").show();
			}else{
				$("#cadastrar").attr("disabled", false);
				$("#respostaSenha").hide();
			}
		});
		
	</script>
	
	<script>
		(function() {
		  'use strict';
		  window.addEventListener('load', function() {
		    var forms = document.getElementsByClassName('needs-validation');
		    var validation = Array.prototype.filter.call(forms, function(form) {
		      form.addEventListener('submit', function(event) {
		        if (form.checkValidity() === false) {
		          event.preventDefault();
		          event.stopPropagation();
		        }
		        form.classList.add('was-validated');
		      }, false);
		    });
		  }, false);
		})();
</script>
<script type = "text/javascript" src = "limpaCadastro.js"></script>
</body>
</html>

