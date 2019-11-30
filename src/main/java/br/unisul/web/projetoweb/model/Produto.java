package br.unisul.web.projetoweb.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "jpa_produtos")
public class Produto {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "idProduto")
	private int idProduto;
	@Column(name = "nome")
	private String nome;
	@Column(name = "imagem")
	private String imagem;
	@Column(name = "medida")
	private String medida;
	@Column(name = "quantidade")
	private int quantidade;
	@Column(name = "preco")
	private double preco;

	@OneToMany(mappedBy = "produto")
	private List<Pedido> pedidos = new ArrayList<Pedido>();
	

	public List<Pedido> getPedidos() {
		return pedidos;
	}

	public void addPedidos(Pedido pedido) {
		pedidos.add(pedido);
	}

	public Produto(int idProduto) {
		this.setIdProduto(idProduto);
	}

	public Produto() {
	}	


	public int getIdProduto() {
		return idProduto;
	}

	public void setIdProduto(int idProduto) {
		this.idProduto = idProduto;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getImagem() {
		return imagem;
	}

	public void setImagem(String imagem) {
		this.imagem = imagem;
	}

	public String getMedida() {
		return medida;
	}

	public void setMedida(String medida) {
		this.medida = medida;
	}

	public int getQuantidade() {
		return quantidade;
	}

	public void setQuantidade(int quantidade) {
		this.quantidade = quantidade;
	}

	public double getPreco() {
		return preco;
	}

	public void setPreco(double preco) {
		this.preco = preco;
	}

}