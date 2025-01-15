package controller;

import java.io.IOException;
import java.util.List;

import Model.User;
import Model.Video;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import util.UserDAO;

@WebServlet("/favorite-videos")
public class FavoriteVideosServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        if (user == null) {
            resp.sendRedirect(req.getContextPath() + "/login.jsp");
            return;
        }

        UserDAO userDao = new UserDAO();
        List<Video> favoriteVideos = userDao.getFavoriteVideos(user.getId());

        req.setAttribute("favoriteVideos", favoriteVideos);
        req.getRequestDispatcher("/myfavorite.jsp").forward(req, resp);
    }
    
    
}

