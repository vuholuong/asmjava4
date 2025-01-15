package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;

import Inteface.ShareDAO;
import Model.Share;
import util.JpaUtils;

public class ShareDAOImpl implements ShareDAO {

	private EntityManager entityManager = Persistence.createEntityManagerFactory("PolyOE1").createEntityManager();

	@Override
	public List<Share> findAll() {
		return entityManager.createQuery("SELECT s FROM Share s", Share.class).getResultList();
	}

	@Override
	public Share findById(Long id) {
		return entityManager.find(Share.class, id);
	}

	@Override
	public void create(Share share) {
		EntityTransaction transaction = entityManager.getTransaction();
		transaction.begin();
		entityManager.persist(share);
		transaction.commit();
	}

	@Override
	public void update(Share share) {
		EntityTransaction transaction = entityManager.getTransaction();
		transaction.begin();
		entityManager.merge(share);
		transaction.commit();
	}

	@Override
	public void deleteById(Long id) {
		EntityTransaction transaction = entityManager.getTransaction();
		transaction.begin();
		Share share = findById(id);
		if (share != null) {
			entityManager.remove(share);
		}
		transaction.commit();
	}

	@Override
	public List<Object[]> getSharesPerMonth() {
		EntityManager em = JpaUtils.getEntityManager();
		String jpql = "SELECT FUNCTION('MONTH', s.shareDate), COUNT(s) FROM Share s GROUP BY FUNCTION('MONTH', s.shareDate)";
		Query query = em.createQuery(jpql);
		return query.getResultList();
	}

	@Override
	public void addShare(Share share) {
	    EntityManager em = JpaUtils.getEntityManager();
	    EntityTransaction transaction = em.getTransaction();

	    try {
	        transaction.begin();
	        System.out.println("Saving Share: " + share);
	        em.persist(share);
	        transaction.commit();
	    } catch (Exception e) {
	        if (transaction.isActive()) {
	            transaction.rollback();
	        }
	        e.printStackTrace();
	        throw new RuntimeException("Failed to save Share object: " + e.getMessage());
	    } finally {
	        em.close();
	    }
	}


}
