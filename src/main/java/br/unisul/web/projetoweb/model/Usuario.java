package br.unisul.web.projetoweb.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "jpa_usuario")
public class Usuario {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "usuario_generator")
	@SequenceGenerator(name = "usuario_generator", sequenceName = "usuario_sequence", allocationSize = 1)
	@Column(name = "idUsuario")
	private int idUsuario;
	@Column(name = "login", length = 100)
	private String login;
	@Column(name = "password", length = 100)
	private String password;
	@Column(name = "nome", length = 200)
	private String nome;
	@Column(name = "datanascimento")
	private Date nascimento;
	@Column(name = "idade", length = 3)
	private long idade;
	@Column(name = "sexo", length = 10)
	private String sexo;

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "idEndereco", referencedColumnName = "idEndereco")
	private Endereco endereco;

	@OneToMany(mappedBy = "usuario")
	private List<Pedido> pedidos = new ArrayList<>();

	public Usuario(int idUsuario) {
		this.idUsuario = idUsuario;
	}

	public List<Pedido> getPedidos() {
		return pedidos;
	}

	public void addPedidos(Pedido pedido) {
		pedidos.add(pedido);
	}

	public Usuario() {
	}

	public Usuario(String login, String password, String nome, Date nascimento, String sexo) {
		this.login = login;
		this.password = password;
		this.nome = nome;
		this.nascimento = nascimento;
		this.sexo = sexo;
	}

	public int getIdUsuario() {
		return idUsuario;
	}

	public void setIdUsuario(int idUsuario) {
		this.idUsuario = idUsuario;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public Date getNascimento() {
		return nascimento;
	}

	public void setNascimento(Date nascimento) {
		this.nascimento = nascimento;
	}

	public long getIdade() {
		return idade;
	}

	public void setIdade(long idade) {
		this.idade = idade;
	}

	public String getSexo() {
		return sexo;
	}

	public void setSexo(String sexo) {
		this.sexo = sexo;
	}

	public Endereco getEndereco() {
		return endereco;
	}

	public void setEndereco(Endereco endereco) {
		this.endereco = endereco;
	}

}
