package controller;

import java.io.IOException;
import java.util.List;

import Model.Video;
import dao.VideoDAOImpl;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/videoall")
public class VideoallController extends HttpServlet {
	private VideoDAOImpl videoDAO = new VideoDAOImpl();
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Video> allVideo = videoDAO.findAll();
	      req.setAttribute("allVideo", allVideo);
	      RequestDispatcher dispatcher = req.getRequestDispatcher("viewall.jsp");
	      dispatcher.forward(req, resp);
	}
}
