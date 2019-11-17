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
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "jpa_usuario")
public class Usuario {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
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
	@ManyToMany
	@JoinTable(name = "jpa_usuario_produto", joinColumns = @JoinColumn(name = "idUsuario"), inverseJoinColumns = @JoinColumn(name = "idProduto"))
	private List<Produto> produtos = new ArrayList<>();

	public Usuario(int idUsuario) {
		this.idUsuario = idUsuario;
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

	public List<Produto> getProdutos() {
		return produtos;
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

	public void addProduto(Produto produto) {
		produtos.add(produto);
	}

	public void removeProduto(Produto produto) {
		produtos.remove(produto);
	}

}
