package util;

import java.util.Collections;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;

import Model.User;
import Model.Video;

public class UserDAO {
	EntityManager em = JpaUtils.getEntityManager();

	public User create(User entity) {
		EntityTransaction transaction = em.getTransaction();
		try {
			transaction.begin();

			// Kiểm tra email trùng lặp
			if (findByEmail(entity.getEmail()) != null) {
				throw new RuntimeException("Email đã tồn tại.");
			}

			em.persist(entity);
			transaction.commit();
			return entity;
		} catch (Exception e) {
			if (transaction.isActive()) {
				transaction.rollback();
			}
			throw new RuntimeException("Lỗi khi tạo User: " + e.getMessage(), e);
		} finally {
			em.close();
		}
	}

	public User update(User entity) {

		try {
			em.getTransaction().begin();
			em.merge(entity);
			em.getTransaction().commit();
			return entity;
		} catch (Exception e) {
			em.getTransaction().rollback();
			throw new RuntimeException("Lỗi khi cập nhật User: " + e.getMessage(), e);
		} finally {
			em.close();
		}
	}

	public User remove(String id) {

		try {
			em.getTransaction().begin();
			User entity = em.find(User.class, id);
			if (entity != null) {
				em.remove(entity);
			}
			em.getTransaction().commit();
			return entity;
		} catch (Exception e) {
			em.getTransaction().rollback();
			throw new RuntimeException("Lỗi khi xóa User: " + e.getMessage(), e);
		} finally {
			em.close();
		}
	}

	public User findById(String id) {

		try {
			String jpql = "SELECT u FROM User u WHERE u.email = :username"; // Thay đổi cột theo tên trong database
			TypedQuery<User> query = em.createQuery(jpql, User.class);
			query.setParameter("username", id);
			return query.getSingleResult(); // Hoặc xử lý trường hợp không có kết quả
		} catch (Exception e) {
			return null; // Trả về null nếu không tìm thấy user
		} finally {
			em.close();
		}
	}

	public List<User> findAll() {

		try {
			String jpql = "SELECT o FROM User o";
			TypedQuery<User> query = em.createQuery(jpql, User.class);
			return query.getResultList();
		} finally {
			em.close();
		}
	}

	public User findByEmail(String email) {
		try {

			return em.createQuery("SELECT u FROM User u WHERE u.email = :email", User.class)
					.setParameter("email", email).getSingleResult();
		} catch (NoResultException e) {
			return null;
		}
	}

	public List<Video> getFavoriteVideos(Integer userId) {
	    EntityManager em = JpaUtils.getEntityManager();
	    try {
	        String jpql = "SELECT f.video FROM Favorite f WHERE f.user.id = :userId";
	        TypedQuery<Video> query = em.createQuery(jpql, Video.class);
	        query.setParameter("userId", userId);
	        return query.getResultList();
	    } catch (Exception e) {
	        e.printStackTrace();
	        return Collections.emptyList(); // Trả về danh sách rỗng nếu có lỗi
	    } finally {
	        em.close();
	    }
	}
	
	
	
	

}
