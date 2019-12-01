 $(document).ready(function() {
	 $("#respostaCep").hide();
            function limpa_formulário_cep() {
                $("#rua").val("");
                $("#bairro").val("");
                $("#cidade").val("");
	                $("#uf").val("");
            }
            
            $("#cep").blur(function() {
                var cep = $(this).val().replace(/\D/g, '');
                if (cep != "") {
                    var validacep = /^[0-9]{8}$/;
                    if(validacep.test(cep)) {
                        $("#rua").val("...");
                        $("#bairro").val("...");
                        $("#cidade").val("...");
                        $("#uf").val("...");
                        $.getJSON("https://viacep.com.br/ws/"+ cep +"/json/?callback=?", function(dados) {
                            if (!("erro" in dados)) {
                                $("#rua").val(dados.logradouro);
                                $("#bairro").val(dados.bairro);
                                $("#cidade").val(dados.localidade);
                                $("#uf").val(dados.uf);
                                $("#respostaCep").hide();
                                $("#cadastrar").attr("disabled", false);
                            } 
                            else {
                                limpa_formulário_cep();
                                $("#respostaCep").show();
                                $("#respostaCep").html("CEP não encontrado.");
                                $("#cadastrar").attr("disabled", true);
                            }
                        });
                    } 
                    else {
                        limpa_formulário_cep();
                        $("#respostaCep").show();
                        $("#respostaCep").html("Formato de CEP inválido.");
                        $("#cadastrar").attr("disabled", true);
                    }
                }
                else {
                    limpa_formulário_cep();
                }
            });
        });
     