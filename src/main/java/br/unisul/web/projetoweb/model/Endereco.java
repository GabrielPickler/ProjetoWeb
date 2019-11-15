package br.unisul.web.projetoweb.model;

	import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

	@Entity
	@Table(name="jpa_enderecos")
	public class Endereco {
	    
		@Id
	    @GeneratedValue(strategy = GenerationType.SEQUENCE)
	    @Column(name="idEndereco")
private int idEndereco;
		
		@Column(name="cep", length=10, nullable=false)
	private String cep;
	@Column(name="rua", length=60)
	private String rua;
		@Column(name="bairro", length=40)
		private String bairro;
		@Column(name="cidade", length=40)
		private String cidade;
		@Column(name="estado", length=2)
		private String estado;
		//@OneToOne
		
		public Endereco() {
		}
		
		public Endereco (int idEndereco) {
			this.setIdEndereco(idEndereco);
		}

		public int getIdEndereco() {
			return idEndereco;
		}
		public void setIdEndereco(int idEndereco) {
			this.idEndereco = idEndereco;
		}
		public String getCep() {
			return cep;
		}
		public void setCep(String cep) {
			this.cep = cep;
		}
		public String getRua() {
			return rua;
		}
		public void setRua(String rua) {
			this.rua = rua;
		}
		public String getBairro() {
			return bairro;
		}
		public void setBairro(String bairro) {
			this.bairro = bairro;
		}
		public String getCidade() {
			return cidade;
		}
		public void setCidade(String cidade) {
			this.cidade = cidade;
		}
		public String getEstado() {
			return estado;
		}
		public void setEstado(String estado) {
			this.estado = estado;
		}
		
		
}
