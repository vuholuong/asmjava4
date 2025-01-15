package controller;

import java.io.IOException;
import java.util.List;

import Inteface.VideoDAO;
import Model.Video;
import dao.VideoDAOImpl;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/top-videos")
public class VideoController extends HttpServlet{

	private VideoDAOImpl videoDAO = new VideoDAOImpl();

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 List<Video> topVideos = videoDAO.findTop6ByViews();
	        req.setAttribute("topVideos", topVideos);
	        req.getRequestDispatcher("index.jsp").forward(req, resp);
	}
	
}
