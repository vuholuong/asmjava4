package Inteface;

import java.util.List;

import Model.Favorite;

public interface FavoriteDAO extends GenericDAO<Favorite, Long> {
	public List<Object[]> getLikesPerMonth();
	public void addFavorite(Favorite favorite);
	public Favorite findByUserAndVideo(Integer userId, String videoId);
	//void deleteById(Integer id);
	
}
