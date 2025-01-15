package controller;

import Model.User;
import dao.UserDAOImpl;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet({"/userall", "/userall/edit", "/userall/delete", "/userall/reset", "/userall/update"})
public class UserCotroller extends HttpServlet {

    private UserDAOImpl userDAO = new UserDAOImpl();

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getServletPath();

        // Handle Edit action
        if (path.contains("edit")) {
            String idStr = req.getParameter("id"); // Lấy id từ tham số truy vấn
            if (idStr != null) {
                try {
                    int id = Integer.parseInt(idStr); // Chuyển đổi id thành kiểu int
                    User user = userDAO.findById(id); // Tìm người dùng theo id
                    req.setAttribute("user", user); // Gửi đối tượng user đến JSP
                    req.setAttribute("message", "Edit: " + id);
                } catch (NumberFormatException e) {
                    req.setAttribute("message", "Invalid ID format.");
                }
            }
            req.setAttribute("tab", "userEdition"); // Giữ lại tab "User Edition"
        }

        // Handle Delete action
        else if (path.contains("delete")) {
            String idStr = req.getParameter("id");
            if (idStr != null) {
                try {
                    int id = Integer.parseInt(idStr);
                    userDAO.deleteById(idStr); // Xóa người dùng
                    req.setAttribute("message", "User with ID " + id + " deleted.");
                } catch (NumberFormatException e) {
                    req.setAttribute("message", "Invalid ID format.");
                }
            }
        }

        // Handle Update action
        else if (path.contains("update")) {
            String idStr = req.getParameter("id");
            String fullname = req.getParameter("fullname");
            String email = req.getParameter("email");
            String password = req.getParameter("password");
            boolean admin = Boolean.parseBoolean(req.getParameter("admin"));

            if (idStr != null) {
                try {
                    int id = Integer.parseInt(idStr);
                    User user = userDAO.findById(id); // Lấy user theo ID

                    if (user != null) {
                        user.setFullname(fullname);
                        user.setEmail(email);
                        user.setPassword(password);
                        user.setAdmin(admin);
                        userDAO.update(user); // Cập nhật người dùng

                        req.setAttribute("message", "User with ID " + id + " updated successfully.");
                    }
                } catch (NumberFormatException e) {
                    req.setAttribute("message", "Invalid ID format.");
                }
            }
        }

        // Handle Reset action
        else if (path.contains("reset")) {
            req.setAttribute("message", "Form reset."); // Thông báo khi reset form
            // Chuyển hướng lại trang danh sách người dùng hoặc trang chỉnh sửa
            resp.sendRedirect(req.getContextPath() + "/userall"); // Chuyển hướng về trang danh sách
            return;
        }
        

        // Lấy danh sách tất cả người dùng từ DAO
        List<User> allUsers = userDAO.findAll();
        req.setAttribute("allUser", allUsers);

        // Chuyển tiếp đến JSP để render dữ liệu
        RequestDispatcher dispatcher = req.getRequestDispatcher("/userProfile.jsp");
        dispatcher.forward(req, resp);
        
        
    }
}
