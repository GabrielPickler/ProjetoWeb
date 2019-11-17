<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    <!doctype html>
    <head>
    <title>Cadastro</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <!-- Adicionando JQuery -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
            crossorigin="anonymous"></script>

    <!-- Adicionando Javascript -->
    <script type="text/javascript" >

        $(document).ready(function() {

            function limpa_formul�rio_cep() {
                // Limpa valores do formul�rio de cep.
                $("#rua").val("");
                $("#bairro").val("");
                $("#cidade").val("");
	                $("#uf").val("");
            }
            
            //Quando o campo cep perde o foco.
            $("#cep").blur(function() {

                //Nova vari�vel "cep" somente com d�gitos.
                var cep = $(this).val().replace(/\D/g, '');

                //Verifica se campo cep possui valor informado.
                if (cep != "") {

                    //Express�o regular para validar o CEP.
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
                                //CEP pesquisado n�o foi encontrado.
                                limpa_formul�rio_cep();
                                alert("CEP n�o encontrado.");
                            }
                        });
                    } //end if.
                    else {
                        //cep � inv�lido.
                        limpa_formul�rio_cep();
                        alert("Formato de CEP inv�lido.");
                    }
                } //end if.
                else {
                    //cep sem valor, limpa formul�rio.
                    limpa_formul�rio_cep();
                }
            });
        });

    </script>
    </head>

    <body>
    <!-- Inicio do formulario -->

      <form method="post" action="cadastroController">
      <b><font size="10">Cadastro de Usu�rio</font></b><br><br>
      	<label>Login *:
      	<br><input name="login" type="text" id="login" required="required"/></label><br />
      	<label>Senha *:
      	<br><input name="senha" type="password" id="senha" required="required"/></label><br />
      	<label>Confirme sua senha *:
      	<br><input name="csenha" type="password" id="csenha" required="required"/></label><br />
      	</label>
      	<br><label><b>Dados Pessoais</b></label><br>
      	<br><label>Nome *:
      	<br><input name="nome" type="text" id="nome" required="required"/></label><br />
      	<label>Data de Nascimento *:
      	<br><input name="nascimento" type="date" id="nascimento" required="required"/></label><br />
      	<br><label>Sexo *:
      	<input name="sexo" type="radio" id="sexo" value="Masculino" required="required"/><label>Masculino</label>
     	<input name="sexo" type="radio" id="sexo" value="Feminino" required="required"/><label>Feminino</label><br />
      	</label>
        <br><label>Cep *:
        <br><input name="cep" type="text" id="cep" value="" size="10" maxlength="9" required="required"/></label><br />
        <label>Rua:
        <br><input name="rua" type="text" id="rua" size="60" /></label><br />
        <label>N�mero:
        <br><input name="numero" type="number" id="numero" size="10" /></label><br />
        <label>Complemento:
        <br><input name="complemento" type="text" id="complemento" size="60" /></label><br />
        <label>Bairro:
        <br><input name="bairro" type="text" id="bairro" size="40" /></label><br />
        <label>Cidade:
        <br><input name="cidade" type="text" id="cidade" size="40" /></label><br />
        <label>Estado:
        <br><input name="uf" type="text" id="uf" size="2" /></label><br />
        <br><input type="submit" value = "Cadastrar">
      </form>
    </body>
    </html>

