package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;

import Inteface.VideoDAO;
import Model.Video;
import util.JpaUtils;

public class VideoDAOImpl implements VideoDAO {

	private EntityManager entityManager = Persistence.createEntityManagerFactory("PolyOE1").createEntityManager();
	EntityManager em = util.XJPA.getEntityManager();

	@Override
	public List<Video> findAll() {
		return entityManager.createQuery("SELECT v FROM Video v", Video.class).getResultList();
	}

	@Override
	public Video findById(String id) {
		return entityManager.find(Video.class, id);
	}

	@Override
	public void create(Video video) {
		EntityTransaction transaction = entityManager.getTransaction();
		try {
			transaction.begin();
			entityManager.merge(video); // Thay vì persist
			transaction.commit();
		} catch (Exception e) {
			if (transaction.isActive()) {
				transaction.rollback();
			}
			throw e;
		}
	}

	@Override
	public void update(Video video) {
		EntityTransaction transaction = entityManager.getTransaction();
		transaction.begin();
		entityManager.merge(video);
		transaction.commit();
	}

	@Override
	public void deleteById(String id) {
		EntityTransaction transaction = entityManager.getTransaction();
		transaction.begin();
		Video video = findById(id);
		if (video != null) {
			entityManager.remove(video);
		}
		transaction.commit();
	}

	@Override
	public List<Video> findTop6ByViews() {
		return entityManager.createQuery("SELECT v FROM Video v ORDER BY v.views DESC", Video.class)
				.setMaxResults(6)
				.getResultList();
	}

	@Override
	public List<Video> getAllVideos() {
		EntityManager em = JpaUtils.getEntityManager();
		String jpql = "SELECT v FROM Video v";
		TypedQuery<Video> query = em.createQuery(jpql, Video.class);
		return query.getResultList();
	}
	
	// Phương thức để tăng lượt xem
    public void incrementViews(String videoId) {
    	EntityManager em = JpaUtils.getEntityManager();
        EntityTransaction transaction = em.getTransaction();
        try {
            transaction.begin();
            Video video = em.find(Video.class, videoId);
            if (video != null) {
                video.setViews(video.getViews() + 1); // Tăng views
                em.merge(video); // Cập nhật lại trong cơ sở dữ liệu
            }
            transaction.commit();
        } catch (Exception e) {
            if (transaction.isActive()) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }
}
