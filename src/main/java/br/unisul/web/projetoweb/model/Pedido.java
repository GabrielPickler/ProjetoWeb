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
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "jpa_pedido")
public class Pedido {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "pedido_generator")
	@SequenceGenerator(name="pedido_generator", sequenceName = "pedido_sequence",allocationSize = 1)
	@Column(name = "idPedido")
	private int idPedido;
	@Column(name = "data")
	private Date data;
	@Column(name = "quantidade")
	private int quantidade;
	@Column(name = "total")
	private double total;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "idUsuario", referencedColumnName = "idUsuario")
	private Usuario usuario;
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "idProduto", referencedColumnName = "idProduto")
	private Produto produto;	
	
	public Pedido() {
	}
	
	public Pedido(int idPedido, Date data, int quantidade, double total, Usuario usuario, Produto produto) {
		this.idPedido = idPedido;
		this.data = data;
		this.quantidade = quantidade;
		this.total = total;
		this.usuario = usuario;
		this.produto = produto;
	}
	
	public Pedido(int idPedido) {
		
	}

	public Date getData() {
		return data;
	}
	public void setData(Date data) {
		this.data = data;
	}
	public double getTotal() {
		return total;
	}
	public void setTotal(double total) {
		this.total = total;
	}
	public int getQuantidade() {
		return quantidade;
	}
	public void setQuantidade(int quantidade) {
		this.quantidade = quantidade;
	}
	public Usuario getUsuario() {
		return usuario;
	}
	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}
	public Produto getProduto() {
		return produto;
	}
	public void setProduto(Produto produto) {
		this.produto = produto;
	}
	
	

}
