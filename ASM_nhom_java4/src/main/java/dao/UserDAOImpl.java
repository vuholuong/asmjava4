package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.NoResultException;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;

import Inteface.UserDAO;
import Model.User;

public class UserDAOImpl implements UserDAO {

	private EntityManager entityManager = Persistence.createEntityManagerFactory("PolyOE1").createEntityManager();

	@Override
	public List<User> findAll() {
		 return entityManager.createQuery("SELECT u FROM User u", User.class).getResultList();
    
	}

	@Override
	public User findById(String id) {
		
		 return entityManager.find(User.class, id);
		 
	}

	@Override
	public void create(User user) {
		EntityTransaction transaction = entityManager.getTransaction();
        transaction.begin();
        entityManager.persist(user);
        transaction.commit();
	}

	@Override
	public void update(User user) {
		EntityTransaction transaction = entityManager.getTransaction();
        transaction.begin();
        entityManager.merge(user);
        transaction.commit();
	}

	@Override
	public void deleteById(String id) {
		 EntityTransaction transaction = entityManager.getTransaction();
	        transaction.begin();
	        User user = findById(id);
	        if (user != null) {
	            entityManager.remove(user);
	        }
	        transaction.commit();
	    }

	@Override
	public User login(String email, String password) {
		try {
            TypedQuery<User> query = entityManager.createQuery(
                "SELECT u FROM User u WHERE u.email = :email AND u.password = :password", User.class);
            query.setParameter("email", email);
            query.setParameter("password", password);
            return query.getSingleResult();
        } catch (NoResultException e) {
            return null;
        }
	}
	public User findById(int id) {
		// TODO Auto-generated method stub
		 return entityManager.find(User.class, id);
	}
}


