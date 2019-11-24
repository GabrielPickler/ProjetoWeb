package br.unisul.web.projetoweb.dao.jpa;

import java.util.List;



import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import br.unisul.web.projetoweb.dao.JPAUtil;
import br.unisul.web.projetoweb.model.Endereco;
import br.unisul.web.projetoweb.model.Usuario;

public class UsuarioDao {
        
         private EntityManager entityManager = JPAUtil.getEntityManager();
            public boolean save(Usuario usuario) {
                entityManager.getTransaction().begin();
                entityManager.persist(usuario);
                entityManager.getTransaction().commit();
                return false;
            }

         public TypedQuery<Integer> findId(String loginUser) {
         return entityManager.createQuery("SELECT p.idUsuario FROM Usuario p WHERE p.login='"+loginUser+"'", Integer.class);
         }
        
         public List<Usuario> findAll() {
         return entityManager.createQuery("SELECT u from Usuario u", Usuario.class).getResultList();
         }

            public boolean delete(int idUsuario) {
                entityManager.getTransaction().begin();
                entityManager.remove(new Usuario(idUsuario));
                entityManager.getTransaction().commit();
                return true;
            }

            public void update(Usuario usuario) {
                entityManager.getTransaction().begin();
                entityManager.merge(usuario);
                entityManager.getTransaction().commit();
            }

    public Usuario findById(int idUsuario){
        return entityManager.getReference(Usuario.class, idUsuario);
    }

    
    public Endereco findByIdEndereco(int idUsuario) {
         return entityManager.getReference(Endereco.class,idUsuario);
    }

}
