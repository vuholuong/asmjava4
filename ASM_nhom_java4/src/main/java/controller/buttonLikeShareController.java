package controller;

import java.io.IOException;
import java.util.Date;

import Inteface.FavoriteDAO;
import Inteface.ShareDAO;
import Inteface.VideoDAO;
import Model.Favorite;
import Model.Share;
import Model.User;
import Model.Video;
import dao.FavoriteDAOImpl;
import dao.ShareDAOImpl;
import dao.VideoDAOImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import util.EmailUtil;

@WebServlet({ "/LikeServlet", "/ShareServlet", "/DiskLike" })
public class buttonLikeShareController extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();

		if (uri.endsWith("LikeServlet")) {
			this.doLike(req, resp);
		} else if (uri.endsWith("DiskLike")) {
			this.doDiskLike(req, resp);
		} else if (uri.endsWith("ShareServlet")) {
			this.doShare(req, resp);
		}
	}

	private void doLike(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		// Lấy user từ session
		User user = (User) session.getAttribute("user");
		if (user == null) {
			// Nếu user chưa đăng nhập, chuyển hướng đến trang login
			resp.sendRedirect("login.jsp");
			return;
		}
		// Lấy videoId từ request
		String videoId = req.getParameter("videoId");
		if (videoId == null || videoId.isEmpty()) {
			resp.sendRedirect("viewall.jsp");
			return;
		}

		// Tạo đối tượng Favorite
		Favorite favorite = Favorite.builder()
				.user(user)
				.video(Video.builder()
				.id(videoId).build()) // Tạo đối tượng																						// Video với id
				.likeDate(new java.util.Date()) // Đảm bảo kiểu ngày tháng đúng
				.build();
		// Khởi tạo DAO và lưu Favorite vào database
		FavoriteDAOImpl favoriteDAO = new FavoriteDAOImpl();
		favoriteDAO.addFavorite(favorite);

		// Chuyển hướng lại trang hiện tại
		resp.sendRedirect(req.getContextPath() + "/favorite-videos");
	}

	private void doShare(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 HttpSession session = req.getSession();
		    User user = (User) session.getAttribute("user");

		    if (user == null) {
		        resp.sendRedirect("login.jsp");
		        return;
		    }

		    String email = req.getParameter("email");
		    String messageContent = req.getParameter("message");
		    String videoId = req.getParameter("videoId");

		    try {
		        VideoDAO videoDAO = new VideoDAOImpl();
		        Video video = videoDAO.findById(videoId);

		        if (video == null) {
		            req.setAttribute("error", "Video not found.");
		            req.getRequestDispatcher("videoall.jsp").forward(req, resp);
		            return;
		        }

		        // Gửi email
		        String subject = "Video Shared from " + user.getFullname();
		        String posterLink = req.getRequestURL().toString().replace(req.getServletPath(), "") + "/uploads/" + video.getPoster();
		        String fullMessage = (messageContent != null && !messageContent.isEmpty() ? messageContent + "\n\n" : "") +
		                             "Poster link: " + posterLink;

		        EmailUtil.sendEmail(email, subject, fullMessage);

		        // Lưu vào cơ sở dữ liệu
		        Share share = Share.builder()
		                .user(user)
		                .video(video)
		                .emails(email)
		                .shareDate(new java.util.Date())
		                .build();

		        ShareDAO shareDAO = new ShareDAOImpl();
		        shareDAO.addShare(share);
		        session.setAttribute("alertMessage", "Video shared successfully!");
		        session.setAttribute("alertType", "success");
		        req.setAttribute("message", "Poster shared successfully!");
		    } catch (Exception e) {
		        e.printStackTrace();
		        req.setAttribute("error", "Failed to share the poster.");
		    }

		    resp.sendRedirect(req.getContextPath() + "/videoall");
	}


	
	
	
	private void doDiskLike(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    HttpSession session = req.getSession();

	    // Lấy user từ session
	    User user = (User) session.getAttribute("user");
	    if (user == null) {
	        // Nếu user chưa đăng nhập, chuyển hướng đến trang login
	        resp.sendRedirect("login.jsp");
	        return;
	    }

	    // Lấy videoId từ request
	    String videoId = req.getParameter("videoId");
	    if (videoId == null || videoId.isEmpty()) {
	        resp.sendRedirect(req.getContextPath() + "/favorite-videos");
	        return;
	    }

	    // Khởi tạo DAO và tìm bản ghi Favorite
	    FavoriteDAO favoriteDAO = new FavoriteDAOImpl();
	    Favorite favorite = favoriteDAO.findByUserAndVideo(user.getId(), videoId);

	    if (favorite != null) {
	        // Xóa bản ghi nếu tồn tại
	        favoriteDAO.deleteById(favorite.getId());
	        
	    }

	    // Chuyển hướng lại trang hiện tại
	    resp.sendRedirect(req.getContextPath() + "/favorite-videos");
	    System.out.println("User ID: " + user.getId());
        System.out.println("Video ID: " + videoId);
        System.out.println("Favorite: " + (favorite != null ? "Found" : "Not Found"));

	}






}
