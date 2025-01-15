package controller;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.List;

import javax.imageio.ImageIO;
import javax.mail.MessagingException;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.category.DefaultCategoryDataset;

import Inteface.FavoriteDAO;
import Inteface.ShareDAO;
import Inteface.VideoDAO;
import Model.Video;
import dao.FavoriteDAOImpl;
import dao.ShareDAOImpl;
import dao.VideoDAOImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet({ "/chartvideo", "/chartlike", "/chartshare" })
public class resportController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();

		if (uri.endsWith("chartvideo")) {
			this.dochartvideo(req, resp);
		} else if (uri.endsWith("chartlike")) {
			this.dochartlike(req, resp);
		} else if (uri.endsWith("chartshare")) {
			this.dochartshare(req, resp);
		}
	}

	private void dochartvideo(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		VideoDAO dao = new VideoDAOImpl();
		List<Video> videos = dao.getAllVideos();
		DefaultCategoryDataset dataset = new DefaultCategoryDataset();
		for (Video video : videos) {
			dataset.addValue(video.getViews(), "Views", video.getTitle());
		}
		JFreeChart barChart = ChartFactory.createBarChart("Số Lượt Xem của Video", "Video", "Số Lượt Xem", dataset,
				PlotOrientation.VERTICAL, true, true, false);
		BufferedImage chartImage = barChart.createBufferedImage(1000, 400);
		resp.setContentType("image/png");
		ImageIO.write(chartImage, "png", resp.getOutputStream());
	}

	private void dochartlike(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		FavoriteDAO dao = new FavoriteDAOImpl();
		List<Object[]> likesPerMonth = dao.getLikesPerMonth();
		DefaultCategoryDataset dataset = new DefaultCategoryDataset();
		for (Object[] record : likesPerMonth) {
			int month = (int) record[0];
			long count = (long) record[1];
			dataset.addValue(count, "Likes", "Tháng " + month);
		}
		JFreeChart lineChart = ChartFactory.createLineChart("Số Lượt Thích Theo Tháng", "Tháng", "Số Lượt Thích",
				dataset, PlotOrientation.VERTICAL, true, true, false);
		BufferedImage chartImage = lineChart.createBufferedImage(1000, 400);
		resp.setContentType("image/png");
		ImageIO.write(chartImage, "png", resp.getOutputStream());
	}

	private void dochartshare(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ShareDAO dao = new ShareDAOImpl();
		List<Object[]> sharesPerMonth = dao.getSharesPerMonth(); 
		DefaultCategoryDataset dataset = new DefaultCategoryDataset(); 
		for (Object[] record : sharesPerMonth) { int month = (int) record[0]; 
		long count = (long) record[1]; 
		dataset.addValue(count, "Shares", "Tháng " + month); 
		} JFreeChart lineChart = ChartFactory.createLineChart( "Số Lượt Chia Sẻ Theo Tháng", "Tháng", "Số Lượt Chia Sẻ",
				dataset, PlotOrientation.VERTICAL, true, true, false); 
		BufferedImage chartImage = lineChart.createBufferedImage(1000, 400); resp.setContentType("image/png"); 
		ImageIO.write(chartImage, "png", resp.getOutputStream());
		}
	}

