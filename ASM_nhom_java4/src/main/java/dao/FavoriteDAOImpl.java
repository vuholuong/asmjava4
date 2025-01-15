package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.NoResultException;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import Inteface.FavoriteDAO;
import Model.Favorite;
import util.JpaUtils;

public class FavoriteDAOImpl implements FavoriteDAO {

	private EntityManager entityManager = Persistence.createEntityManagerFactory("PolyOE1").createEntityManager();

	@Override
	public List<Favorite> findAll() {
		TypedQuery<Favorite> query = entityManager
				.createQuery("SELECT f FROM Favorite f JOIN FETCH f.user JOIN FETCH f.video", Favorite.class);
		return query.getResultList();
	}

	@Override
	public Favorite findById(Long id) {
		return entityManager.find(Favorite.class, id);
	}

	@Override
	public void create(Favorite favorite) {
		EntityTransaction transaction = entityManager.getTransaction();
		transaction.begin();
		entityManager.persist(favorite);
		transaction.commit();
	}

	@Override
	public void update(Favorite favorite) {
		EntityTransaction transaction = entityManager.getTransaction();
		transaction.begin();
		entityManager.merge(favorite);
		transaction.commit();
	}

	

	@Override
	public List<Object[]> getLikesPerMonth() {
		EntityManager em = JpaUtils.getEntityManager();
		String jpql = "SELECT FUNCTION('MONTH', f.likeDate), COUNT(f) FROM Favorite f GROUP BY FUNCTION('MONTH', f.likeDate)";
		Query query = em.createQuery(jpql);
		return query.getResultList();
	}

	@Override
	public void addFavorite(Favorite favorite) {
		EntityManager em = JpaUtils.getEntityManager();
        EntityTransaction transaction = em.getTransaction();

        try {
            transaction.begin();
            em.persist(favorite);
            transaction.commit();
        } catch (Exception e) {
            if (transaction.isActive()) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            em.close();
        }
	}
	@Override
	public void deleteById(Long id) {
		EntityManager em = JpaUtils.getEntityManager();
	    EntityTransaction transaction = em.getTransaction();
	    try {
	        transaction.begin();
	        Favorite favorite = em.find(Favorite.class, id);
	        if (favorite != null) {
	            em.remove(favorite);
	        }
	        transaction.commit();
	    } catch (Exception e) {
	        if (transaction.isActive()) {
	            transaction.rollback();
	        }
	        e.printStackTrace();
	    } finally {
	        em.close();
	    }
	}
	@Override
	public Favorite findByUserAndVideo(Integer userId, String videoId) {
		EntityManager em = JpaUtils.getEntityManager();
	    try {
	        String jpql = "SELECT f FROM Favorite f WHERE f.user.id = :userId AND f.video.id = :videoId";
	        return em.createQuery(jpql, Favorite.class)
	                 .setParameter("userId", userId)
	                 .setParameter("videoId", videoId)
	                 .getSingleResult();
	    } catch (NoResultException e) {
	        return null; // Không tìm thấy bản ghi
	    } finally {
	        em.close();
	    }
	}

	
	
	
}
