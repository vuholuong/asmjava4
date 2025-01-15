package Inteface;

import java.util.List;

import Model.Video;

public interface VideoDAO extends GenericDAO<Video, String>{
	public List<Video> findTop6ByViews();
	public List<Video> getAllVideos();
}
