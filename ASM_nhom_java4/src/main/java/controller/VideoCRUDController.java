package controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;


import org.apache.commons.beanutils.BeanUtils;

import Inteface.VideoDAO;
import Model.Video;
import dao.VideoDAOImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet({ "/video/crud/index", "/video/crud/edit/*", "/video/crud/create", "/video/crud/update",
		"/video/crud/delete/*", "/video/crud/reset" })
public class VideoCRUDController extends HttpServlet {

	VideoDAO dao = new VideoDAOImpl();

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Video form = new Video();
		try {
			BeanUtils.populate(form, req.getParameterMap()); // Điền dữ liệu vào form từ request
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}

		String message = "Enter video information";
		String path = req.getServletPath();
		String tab = "videoEdition"; // Tab mặc định là "Video Edition"

		// Xử lý các đường dẫn khác nhau
		if (path.contains("edit")) {
			// Lấy ID và tìm thông tin video cần sửa
			String id = req.getPathInfo() != null ? req.getPathInfo().substring(1) : null;
			if (id != null) {
				form = dao.findById(id); // Lấy video từ cơ sở dữ liệu
				message = "Edit: " + id; // Hiển thị thông báo
			} else {
				message = "Video ID is missing for editing.";
			}
			tab = "videoEdition"; // Giữ lại tab "Video Edition" để chỉnh sửa
		} else if (path.contains("create")) {
			// Xử lý khi tạo video mới
			dao.create(form); // Lưu video mới vào cơ sở dữ liệu
			message = "Created video: " + form.getId();
			form = new Video(); // Reset form sau khi tạo
			tab = "videoList"; // Chuyển sang tab video list
		} else if (path.contains("update")) {
			// Xử lý khi cập nhật video

			dao.update(form); // Cập nhật video trong cơ sở dữ liệu
			message = "Updated video: " + form.getId();

			tab = "videoList"; // Sau khi cập nhật, chuyển sang tab video list
		} else if (path.contains("delete")) {
			// Xử lý khi xóa video
			String id = req.getPathInfo() != null ? req.getPathInfo().substring(1) : null;
			if (id != null) {
				dao.deleteById(id); // Xóa video khỏi cơ sở dữ liệu
				message = "Deleted video.";
			} else {
				message = "Video ID is missing for deletion.";
			}
			form = new Video(); // Reset form sau khi xóa
			tab = "videoList"; // Sau khi xóa, chuyển sang tab video list
		} else if (path.contains("reset")) {
			// Reset form để tạo video mới
			form = new Video();
			tab = "videoEdition"; // Giữ lại tab "Video Edition"
		}

		// Lấy danh sách video để hiển thị trong danh sách
		List<Video> videos = dao.findAll();
		req.setAttribute("videos", videos);
		req.setAttribute("message", message);
		req.setAttribute("video", form); // Đảm bảo đối tượng form được lưu vào request

		req.setAttribute("tab", tab); // Cập nhật tab hiện tại

		// Chuyển hướng đến trang JSP để hiển thị
		req.getRequestDispatcher("/QLvideo.jsp").forward(req, resp);
	}
}