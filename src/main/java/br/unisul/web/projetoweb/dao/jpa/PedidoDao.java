package br.unisul.web.projetoweb.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import br.unisul.web.projetoweb.dao.JPAUtil;
import br.unisul.web.projetoweb.model.Pedido;

public class PedidoDao {

	private EntityManager entityManager = JPAUtil.getEntityManager();

	public boolean save(Pedido pedido) {
		entityManager.getTransaction().begin();
		entityManager.persist(pedido);
		entityManager.getTransaction().commit();
		return false;
	}

	public List<Pedido> findAll() {
		return entityManager.createQuery("SELECT o from Pedido o", Pedido.class).getResultList();
	}

	public Double total() {
		return entityManager.createQuery("SELECT sum(total) from Pedido o", Double.class).getSingleResult();
	}

	public boolean delete(int idPedido) {
		entityManager.getTransaction().begin();
		entityManager.remove(new Pedido(idPedido));
		entityManager.getTransaction().commit();
		return true;
	}

	public void update(Pedido pedido) {
		entityManager.getTransaction().begin();
		entityManager.merge(pedido);
		entityManager.getTransaction().commit();
	}

	public Pedido findById(int idPedido) {
		return entityManager.getReference(Pedido.class, idPedido);
	}

}
