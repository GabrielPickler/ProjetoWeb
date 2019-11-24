<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="description" content="">
    <title>Login</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.3/examples/sign-in/">

    <!-- Bootstrap core CSS -->
<link href="https://getbootstrap.com/docs/4.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" 
crossorigin="anonymous">


    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>
    <!-- Custom styles for this template -->
    <link href="https://getbootstrap.com/docs/4.3/examples/sign-in/signin.css" rel="stylesheet">
  </head>
  <body class="text-center">
    <form class="form-signin" method="post" action="loginusuario">
  <h1 class="h3 mb-3 font-weight-normal">Login</h1>
  <label for="inputEmail" class="sr-only">Usuário</label>
  <input type="text" id="login" name = "login" class="form-control" placeholder="Digite seu usuário" required autofocus>
  <label for="inputPassword" class="sr-only">Senha</label>
  <input type="password" id="senha" name = "senha" class="form-control" placeholder="Digite sua senha" required>
  <button class="btn btn-lg btn-primary btn-block" type="submit">Entrar</button>
  <%   
  if(request.getAttribute("mensagem")!=null){
%>
<div class="alert alert-danger" role="alert">
<b><%=request.getAttribute("mensagem") %></b><%} %>
</div>

  <div class="dropdown-divider"></div>
  <a class="dropdown-item" href="cadastro.jsp">Novo aqui? Cadastre-se!</a>
</form>
  
</body>
</html>
