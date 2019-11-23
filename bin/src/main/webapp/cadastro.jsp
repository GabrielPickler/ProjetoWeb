<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <!doctype html>
    <html>
    <head>
    <title>Cadastro</title>
    	<link href="https://getbootstrap.com/docs/4.3/dist/css/bootstrap.min.css" rel="stylesheet">

	    <style>
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
      </style>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <!-- Adicionando JQuery -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
            crossorigin="anonymous"></script>

    <!-- Adicionando Javascript -->
    <script type="text/javascript" >
        $(document).ready(function() {
            function limpa_formulário_cep() {
                // Limpa valores do formulário de cep.
                $("#rua").val("");
                $("#bairro").val("");
                $("#cidade").val("");
	                $("#uf").val("");
            }
            
            //Quando o campo cep perde o foco.
            $("#cep").blur(function() {
                //Nova variável "cep" somente com dígitos.
                var cep = $(this).val().replace(/\D/g, '');
                //Verifica se campo cep possui valor informado.
                if (cep != "") {
                    //Expressão regular para validar o CEP.
                    var validacep = /^[0-9]{8}$/;
                    //Valida o formato do CEP.
                    if(validacep.test(cep)) {
                        //Preenche os campos com "..." enquanto consulta webservice.
                        $("#rua").val("...");
                        $("#bairro").val("...");
                        $("#cidade").val("...");
                        $("#uf").val("...");
                        //Consulta o webservice viacep.com.br/
                        $.getJSON("https://viacep.com.br/ws/"+ cep +"/json/?callback=?", function(dados) {
                            if (!("erro" in dados)) {
                                //Atualiza os campos com os valores da consulta.
                                $("#rua").val(dados.logradouro);
                                $("#bairro").val(dados.bairro);
                                $("#cidade").val(dados.localidade);
                                $("#uf").val(dados.uf);                
                            } //end if.
                            else {
                                //CEP pesquisado não foi encontrado.
                                limpa_formulário_cep();
                                alert("CEP não encontrado.");
                            }
                        });
                    } //end if.
                    else {
                        //cep é inválido.
                        limpa_formulário_cep();
                        alert("Formato de CEP inválido.");
                    }
                } //end if.
                else {
                    //cep sem valor, limpa formulário.
                    limpa_formulário_cep();
                }
            });
        });
     
     </script>  
     
     <script>
     $(document).ready(function(){
    	 $("#nascimento").blur(function() {
     		if ("#nascimento" != "") {
     			$("#idade").val("<%request.getAttribute("idade");%>");
     		}
     	});
     }
     </script>    
    
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
	
	<b><font size="10">Cadastro de Usuário</font></b>
	<br>
	<br>
	<form class="needs-validation" novalidate action="cadastroController">
		<div class="col-md-4 mb-3">
			<label for="usuario">Usuário *</label> <input type="text"
				class="form-control" id="usuario"
				placeholder="Digite seu usuário" value="" required="required" name = "login">
			<div class="invalid-tooltip">
          Por favor, digite seu usuário.
 			</div>
		</div>
		<div class="col-md-4 mb-3">
			<label for="senha">Senha *</label> <input type="password"
				name="senha" class="form-control" id="senha"
				placeholder="Digite sua senha" value="" required="required">
			<div class="invalid-tooltip">Por favor, digite sua senha.</div>
		</div>
		<div class="col-md-4 mb-3">
			<label for="csenha">Confirmar a senha *</label> <input
				type="password" name="csenha" class="form-control"
				id="csenha" placeholder="Confirme sua senha" value=""
				required="required">
			<div class="invalid-tooltip">Confirme sua senha *</div>
		</div>
		<label><b>Dados Pessoais</b></label>
		<div class="col-md-3 mb-3">
			<label for="nome">Nome *</label> <input type="text"
				class="form-control" name="nome" id="nome"
				placeholder="Digite seu nome" required = "required">
			<div class="invalid-tooltip">Por favor, digite seu nome.</div>
		</div>
		<div class="form-row">
		<div class="col-md-2 mb-2">
			<label for="nascimento">Data de nascimento *</label> <input
				type="date" class="form-control" name="nascimento"
				id="nascimento" required = "required">
			<div class="invalid-tooltip">Por favor, preencha sua data de nascimento.</div>
		</div>
		<div class="col-md-1 mb-1">
		<label for = "idade">Idade</label>
		<input type="text" name = "idade" class="form-control" id = "idade">
		</div>
		</div>
		<br>
		<div class="col-md-3 mb-3">
			<label for="sexo">Sexo *</label> <input type="radio"
				name="sexo" id="sexo" value = "Masculino"
				placeholder="Digite seu nome" required = "required"><label> Masculino</label>
				<input type="radio"
				name="sexo" id="sexo" value = "Feminino"
				placeholder="Digite seu nome" required = "required"><label> Feminino</label>
			<div class="invalid-tooltip">Por favor, selecione seu sexo.</div>
		</div>
		<div class="col-md-3 mb-3">
			<label for="cep">CEP *</label> <input type="text"
				class="form-control" name="cep" id="cep" placeholder="CEP" required = "required">
			<div class="invalid-tooltip">Digite seu CEP.</div>
		</div>
		<div class="form-row">
			<div class="col-md-6 mb-3">
				<label for="rua">Logradouro</label> <input
					type="text" class="form-control" name="rua" id="rua"
					placeholder="Logradouro">
			</div>
			<div class="col-md-3 mb-3">
				<label for="numero">Número</label> <input type="number"
					class="form-control" name="numero" id="numero"
					placeholder="Número">				
			</div>
		</div>
		<div class="form-row">
			<div class="col-md-3 mb-3">
				<label for="complemento">Complemento</label> <input
					type="text" class="form-control" name="complemento"
					id="complemento" placeholder="Complemento">
			</div>
			<div class="col-md-3 mb-3">
				<label for="uf">Estado</label> <input type="text"
					class="form-control" name="uf" id="uf"
					placeholder="Digite seu estado">
			</div>
		</div>
		<div class="form-row">
			<div class="col-md-3 mb-3">
				<label for="cidade">Cidade</label> <input type="text"
					class="form-control" name="cidade" id="cidade"
					placeholder="Digite sua cidade">
			</div>
			<div class="col-md-3 mb-3">
				<label for="bairro">Bairro</label> <input type="text"
					class="form-control" name="bairro" id="bairro"
					placeholder="Digite seu bairro">
			</div>
		</div>
		<button class="btn btn-primary" type="submit">Cadastrar</button>
		<a class="btn btn-primary" href="login.jsp" role="button">Voltar</a>
	</form>
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
})());
</script>
</body>
</html>

