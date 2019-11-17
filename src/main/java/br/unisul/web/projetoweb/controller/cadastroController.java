package br.unisul.web.projetoweb.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.Calendar;
import java.util.Date;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.unisul.web.projetoweb.dao.jpa.EnderecoDao;
import br.unisul.web.projetoweb.dao.jpa.UsuarioDao;
import br.unisul.web.projetoweb.model.Endereco;
import br.unisul.web.projetoweb.model.Usuario;

@WebServlet("/cadastroController")
public class cadastroController extends HttpServlet {

	private UsuarioDao usuarioDao = new UsuarioDao();
	private EnderecoDao enderecoDao = new EnderecoDao();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			String login = request.getParameter("login");
			String senha = request.getParameter("senha");
			String confirmaSenha = request.getParameter("csenha");
			if (!confirmaSenha.equals(senha)) {
				RequestDispatcher despachar = request.getRequestDispatcher("cadastro.jsp");
				despachar.forward(request, response);
				System.out.println("erro senha");
			}
			String nome = request.getParameter("nome");
			Date nascimento = sdf.parse(request.getParameter("nascimento"));

			String sexo = request.getParameter("sexo");
			String cep = request.getParameter("cep");
			int numero = Integer.parseInt(request.getParameter("numero"));
			String complemento = request.getParameter("complemento");
			String rua = request.getParameter("rua");
			String bairro = request.getParameter("bairro");
			String cidade = request.getParameter("cidade");
			String uf = request.getParameter("uf");


		Calendar c = Calendar.getInstance();
		c.setTime(nascimento);

		int ano = c.get(Calendar.YEAR);
		int mes = 1 + c.get(Calendar.MONTH);
		int dia = c.get(Calendar.DAY_OF_MONTH);
		LocalDate start = LocalDate.of(ano, mes, dia);
		LocalDate end = LocalDate.now();
		long years = ChronoUnit.YEARS.between(start, end);

		Endereco endereco = new Endereco();
		endereco.setCep(cep);
		endereco.setNumero(numero);
		endereco.setComplemento(complemento);
		endereco.setRua(rua);
		endereco.setBairro(bairro);
		endereco.setCidade(cidade);
		endereco.setEstado(uf);

		Usuario usuario = new Usuario();
		usuario.setIdade(years);
		usuario.setEndereco(endereco);
		usuario.setLogin(login);
		usuario.setNascimento(nascimento);
		usuario.setNome(nome);
		usuario.setPassword(senha);
		usuario.setSexo(sexo);

		salvaUsuario(usuario);

		response.sendRedirect("login.jsp");
		
		} catch (ParseException e) {
			e.printStackTrace();
		}

	}

	private void salvaUsuario(Usuario usuario) {
		usuarioDao.save(usuario);
	}

}