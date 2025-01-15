<%@ page import="java.util.List"%>
<%@ page import="Model.Video"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>viewall</title>
<base href="${pageContext.servletContext.contextPath}/">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<link rel="stylesheet" type="text/css" href="css/vendor.css">
<!-- Link Swiper's CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
<!-- Link Bootstrap's CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link rel="stylesheet" href="style.css">
<!-- Google Fonts ================================================== -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">
	<!-- Thêm CSS và JS của SweetAlert2 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.js"></script>
	
<!-- script ================================================== -->
<script src="js/modernizr.js"></script>
<script type="module"
	src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule
	src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
</head>
<body data-bs-spy="scroll" data-bs-target="#navbar-example2"
	tabindex="0">

	<!-- nav bar start  -->
	<header id="nav"
		class="site-header position-fixed text-white bg-dark w-100">
		<nav class="navbar navbar-expand-lg py-2">
			<div class="container">
				<a class="navbar-brand"
					href="${pageContext.request.contextPath}/top-videos"> <img
					src="images/image.png" alt="image" style="width: 100px;">
				</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarNav"
					aria-controls="navbarNav" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarNav">
					<ul class="navbar-nav ms-auto">
						<li class="nav-item"><a class="nav-link active me-md-4"
							href="${pageContext.request.contextPath}/top-videos">
								<h3>Online Entertainment</h3>
						</a></li>
						<li class="nav-item"><a class="nav-link me-md-4"
							href="${pageContext.request.contextPath}/favorite-videos"> <i
								class="bi bi-star-fill"></i> My Favorite
						</a></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="dropdownMenuLink"
							role="button" data-bs-toggle="dropdown" aria-expanded="false">
								<i class="fas fa-user"></i> Tài Khoản
						</a>
							<ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
								<li><a class="dropdown-item text-dark" href="login.jsp">Đăng
										Nhập</a></li>
								<li><a class="dropdown-item text-dark" href="dangki.jsp">Đăng
										Ký</a></li>
								<li><a class="dropdown-item text-dark"
									href="change-password.jsp">Đổi Mật Khẩu</a></li>
								<li><a class="dropdown-item text-dark"
									href="editprofile.jsp">Edit Profile</a></li>
							</ul></li>
						<li class="nav-item dropdown ms-5"><c:choose>
								<c:when test="${empty sessionScope.user}">
									<a class="btn btn-light" href="login.jsp">Đăng Nhập</a>
								</c:when>
								<c:when test="${not empty sessionScope.user}">
									<div class="d-flex align-items-center">
										<img class="img-thumbnail rounded-circle me-2"
											src="images/9.jpg" alt="User Avatar" style="width: 40px;">
										<span>${sessionScope.user.fullname}</span> <a
											href="/ASM_nhom_java4/account/sign-out"
											class="btn text-light fw-bold"><i
											class="bi bi-box-arrow-left"></i> Đăng Xuất </a>
										<c:if test="${sessionScope.user.admin}">
											<a href="/ASM_nhom_java4/video/crud/index"
												class="btn text-light fw-bold"> <i
												class="fa-solid fa-bars"></i> Quản Lý
											</a>
										</c:if>
									</div>
								</c:when>
							</c:choose></li>
					</ul>
				</div>
			</div>
		</nav>
	</header>

	<!-- tiểu phẩm   -->
	<section id="residence">
		<div class="container mt-5 py-5">
			<h2 class="text-capitalize m-0 py-lg-5">Tất Cả Danh Mục</h2>
			<div class="swiper residence-swiper row">
				<%
				List<Video> allVideo = (List<Video>) request.getAttribute("allVideo");
				%>
				<div class="row">
					<%
					if (allVideo != null && !allVideo.isEmpty()) {
					%>
					<%
					for (Video video : allVideo) {
					%>
					<div class="col-sm-4">
						<div class="card m-3">
							<a href="chitiet.jsp?id=<%=video.getId()%>"> <iframe
									class="card-img-top" width="400" height="400"
									src="<%=video.getPoster()%>" title="<%=video.getTitle()%>"
									frameborder="0"
									allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
									referrerpolicy="strict-origin-when-cross-origin"
									allowfullscreen></iframe>
							</a>
							<div class="card-body p-0">
								<a href="chitiet.jsp?id=<%=video.getId()%>">
									<h5 class="card-title pt-4"><%=video.getTitle()%></h5>
								</a>
								<p class="card-text"><%=video.getDescription()%></p>
								<div class="card-text">
									<ul class="d-flex">
										<li class="residence-list">
											<form action="LikeServlet" method="post" class="btn-info">
												<input type="hidden" name="videoId"
													value="<%=video.getId()%>" />
												<button type="submit" class="btn text-light">
													<i class="bi bi-hand-thumbs-up"></i> LIKE
												</button>
											</form>
										</li>
										<span> <a href="#"
											class="btn btn-link text-decoration-none"
											onclick="openShareModal('<%=video.getId()%>')"> <i
												class="bi bi-share"></i> Share
										</a>
										</span>

										<li class="residence-list"><%=video.getViews()%><i
											class="bi bi-eye"></i></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<%
					}
					%>
					<%
					} else {
					%>
					<p>Không có video nào để hiển thị.</p>
					<%
					}
					%>
				</div>
			</div>

		</div>
	</section>

	<!-- Modal Share -->
	<div class="modal fade mt-5 py-5" id="shareModal" tabindex="-1"
     aria-labelledby="shareModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title text-dark" id="shareModalLabel">Share Video</h5>
                <button type="button" class="btn-close btn-danger" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="shareForm" action="ShareServlet" method="post">
                    <!-- Trường ẩn để gửi videoId -->
                    <input type="hidden" name="videoId" id="videoId">
                    <div class="mb-3">
                        <input type="email" placeholder="Nhập email muốn share"
                               class="form-control" id="email" name="email" required>
                    </div>
                    <div class="mb-3">
                        <label for="message" class="form-label text-dark">Lời Nhắn</label>
                        <textarea class="form-control" id="message" name="message" rows="3"></textarea>
                    </div>
                    <button type="submit" class="btn btn-primary">Send</button>
                </form>
            </div>
        </div>
    </div>
</div>


	<!-- Footer start -->
	<section id="footer">
		<div class="container footer-container">
			<footer class="row row-cols-1 row-cols-sm-2 row-cols-md-5  ">

				<div class=" col-md-4">
					<h3>
						<img src="images/logo.png" alt="image">
					</h3>
					<p>Neque, vestibulum sed varius magna et at. Eu, adipiscing
						morbi augue.</p>
					<i class="bi-facebook pe-4"></i> <i class="bi-instagram pe-4"></i>
					<i class="bi-twitter pe-4"></i> <i class="bi-youtube pe-4"></i>
				</div>

				<div class="col-md-2 ">
					<h5>Project</h5>
					<ul class="nav flex-column">
						<li class="nav-item mb-2"><a href="#" class="nav-link p-0 ">Houses</a></li>
						<li class="nav-item mb-2"><a href="#" class="nav-link p-0 ">Rooms</a></li>
						<li class="nav-item mb-2"><a href="#" class="nav-link p-0 ">Flats</a></li>
						<li class="nav-item mb-2"><a href="#" class="nav-link p-0 ">Appartments</a></li>
					</ul>
				</div>

				<div class="col-md-2 ">
					<h5>Company</h5>
					<ul class="nav flex-column">
						<li class="nav-item mb-2"><a href="#" class="nav-link p-0 ">How
								we work ?</a></li>
						<li class="nav-item mb-2"><a href="#" class="nav-link p-0 ">Capital
						</a></li>
						<li class="nav-item mb-2"><a href="#" class="nav-link p-0 ">Security
						</a></li>
					</ul>
				</div>

				<div class="col-md-2 ">
					<h5>Movement</h5>
					<ul class="nav flex-column">
						<li class="nav-item mb-2"><a href="#" class="nav-link p-0 ">Movement</a></li>
						<li class="nav-item mb-2"><a href="#" class="nav-link p-0 ">Support
								us</a></li>
						<li class="nav-item mb-2"><a href="#" class="nav-link p-0 ">Pricing</a></li>
					</ul>
				</div>

				<div class="col-md-2 ">
					<h5>Help</h5>
					<ul class="nav flex-column">
						<li class="nav-item mb-2"><a href="#" class="nav-link p-0 ">Privacy
						</a></li>
						<li class="nav-item mb-2"><a href="#" class="nav-link p-0 ">Condition</a></li>
						<li class="nav-item mb-2"><a href="#" class="nav-link p-0 ">Blog</a></li>
						<li class="nav-item mb-2"><a href="#" class="nav-link p-0 ">FAQs</a></li>
					</ul>
				</div>
			</footer>
		</div>

		<footer
			class="d-flex flex-wrap justify-content-between align-items-center border-top"></footer>

		<div class="container">
			<footer
				class="d-flex flex-wrap justify-content-between align-items-center py-2 ">
				<div class="col-md-8 d-flex align-items-center">
					<p>© 2023 TemplatesJungle, Inc. All rights reserved.</p>

				</div>
				<div class="col-md-4 d-flex align-items-center">
					<p>
						HTML template by: <a href="https://templatesjungle.com/"
							class="link-primary" target="_blank">TemplatesJungle</a> <br>
						Distributed by: <a href="https://themewagon.com"
							class="link-primary" target="_blank">ThemeWagon</a>
					</p>

				</div>

			</footer>
		</div>
	</section>

<script>
    <% 
        String alertMessage = (String) session.getAttribute("alertMessage");
        String alertType = (String) session.getAttribute("alertType");
        session.removeAttribute("alertMessage");
        session.removeAttribute("alertType");
    %>
    <% if (alertMessage != null && alertType != null) { %>
        Swal.fire({
            title: '<%= alertType.equals("success") ? "Success!" : "Error!" %>',
            text: '<%= alertMessage %>',
            icon: '<%= alertType %>',
            confirmButtonText: 'OK'
        });
    <% } %>
</script>
	<script>
	function openShareModal(videoId) {
	    // Gán giá trị videoId vào trường ẩn trong form
	    document.getElementById('videoId').value = videoId;

	    // Hiển thị Modal
	    const modal = new bootstrap.Modal(document.getElementById('shareModal'));
	    modal.show();
	}

	</script>
	<script src="js/jquery-1.11.0.min.js"></script>
	<script src="js/script.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>