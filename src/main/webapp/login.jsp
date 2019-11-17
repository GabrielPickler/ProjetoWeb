<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Login</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.3/examples/sign-in/">

    <!-- Bootstrap core CSS -->
<link href="https://getbootstrap.com/docs/4.3/dist/css/bootstrap.min.css" rel="stylesheet">


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
    <form class="form-signin" action="login.jsp">
  <img class="mb-4" src="/docs/4.3/assets/brand/bootstrap-solid.svg" alt="" width="72" height="72">
  <h1 class="h3 mb-3 font-weight-normal">Login</h1>
  <label for="inputEmail" class="sr-only">Usuário</label>
  <input type="login" id="login" class="form-control" placeholder="Usuário" required autofocus>
  <label for="inputPassword" class="sr-only">Senha</label>
  <input type="password" id="senha" class="form-control" placeholder="Senha" required>
  <div class="checkbox mb-3">
    <label>
    </label>
  
  <button class="btn btn-lg btn-primary btn-block" type="submit">Entrar</button>
</form>
<div class="dropdown-divider"></div>
  <a class="dropdown-item" href="cadastro.jsp">Novo aqui? Cadastre-se!</a>
  </div>
</body>
</html>
