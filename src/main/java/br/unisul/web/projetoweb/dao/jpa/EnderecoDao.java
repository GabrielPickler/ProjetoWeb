package br.unisul.web.projetoweb.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;

import br.unisul.web.projetoweb.dao.JPAUtil;
import br.unisul.web.projetoweb.model.Endereco;

public class EnderecoDao {
    private EntityManager entityManager = JPAUtil.getEntityManager();
    public boolean save(Endereco endereco) {

        entityManager.getTransaction().begin();
        entityManager.persist(endereco);
        entityManager.getTransaction().commit();
        return false;
    }

    public List<Endereco> findAll() {
        return entityManager.createQuery("SELECT e from Endereco e", Endereco.class).getResultList();
    }

    public boolean delete(int idEndereco) {
        entityManager.getTransaction().begin();
        entityManager.remove(new Endereco(idEndereco));
        entityManager.getTransaction().commit();
        return true;
    }

    public void update(Endereco endereco) {
        entityManager.getTransaction().begin();
        entityManager.merge(endereco);
        entityManager.getTransaction().commit();
    }

    public Endereco findById(int idEndereco) {
        return entityManager.getReference(Endereco.class,idEndereco);
    }
}

