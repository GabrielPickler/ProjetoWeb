document.getElementById("limpar").addEventListener('click', function() {
	document.getElementById("usuario").value = ""
	document.getElementById("senha").value = ""		
	document.getElementById("csenha").value = ""
	document.getElementById("nome").value = ""	
	document.getElementById("nascimento").value = null
	document.getElementById("idade").value = ""
	document.getElementById("sexo1").checked = false
	document.getElementById("sexo2").checked = false
	document.getElementById("cep").value = ""
	document.getElementById("complemento").value = ""
	document.getElementById("rua").value = ""
	document.getElementById("uf").value = ""
	document.getElementById("cidade").value = ""
	document.getElementById("bairro").value = ""
	document.getElementById("numero").value = ""
	$("#respostaIdade").hide()
	$("#respostaCep").hide()
});