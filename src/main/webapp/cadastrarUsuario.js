	$("#respostaIdade").hide();

	document.getElementById("nascimento").addEventListener('focusout', function() {
    var nascimento = new Date(this.value);
    if(isDate_(this.value)){
    	$("#idade").val(calculateAge(this.value));
        if(($("#idade").val() > 120) || ($("#idade").val() < 5)){       	
        	$("#respostaIdade").show();
        	$('#respostaIdade').html("Sua idade deve ser maior que 5 anos e menor que 120 anos.");       	
    	}else{    		
    		$("#respostaIdade").hide();
    	}
    }
    });
    
  function calculateAge(dobString) {
    var dob = new Date(dobString);
    var currentDate = new Date();
    var currentYear = currentDate.getFullYear();
    var birthdayThisYear = new Date(currentYear, dob.getMonth(), dob.getDate());
    var age = currentYear - dob.getFullYear();
    if(birthdayThisYear > currentDate) {
      age--;
    }  
    return age;
    }

  function calcular(nascimento) {
    var nascimento = document.form.nascimento.value;
    alert(nascimento);
    var partes = nascimento.split("/");
    var junta = partes[2]+"-"+partes[1]+"-"+partes[0];
    document.form.idade.value = (calculateAge(junta));
  }

  var isDate_ = function(input) {
          var status = false;
          if (!input || input.length <= 0) {
            status = false;
          } else {
            var result = new Date(input);
            if (result == 'Invalid Date') {
              status = false;
            } else {
              status = true;
            }
          }
          return status;
  }
  
  
