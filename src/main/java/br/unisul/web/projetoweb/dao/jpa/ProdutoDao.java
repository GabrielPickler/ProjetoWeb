package br.unisul.web.projetoweb.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;

import br.unisul.web.projetoweb.dao.JPAUtil;
import br.unisul.web.projetoweb.model.Produto;
import br.unisul.web.projetoweb.model.Usuario;

public class ProdutoDao {

	private EntityManager entityManager = JPAUtil.getEntityManager();

	public boolean save(Produto produto) {
		entityManager.getTransaction().begin();
		entityManager.persist(produto);
		entityManager.getTransaction().commit();
		return false;
	}

	public List<Produto> findAll() {
		return entityManager.createQuery("SELECT r from Produto r ORDER BY r.idProduto", Produto.class).getResultList();
	}

	public boolean delete(int idProduto) {
		entityManager.getTransaction().begin();
		entityManager.remove(new Produto(idProduto));
		entityManager.getTransaction().commit();
		return true;
	}

	public void update(Produto produto) {
		entityManager.getTransaction().begin();
		entityManager.merge(produto);
		entityManager.getTransaction().commit();
	}
	
	public Produto findById(int idProduto){
        return entityManager.getReference(Produto.class, idProduto);
    }

}
