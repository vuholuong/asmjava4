<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>

<head>
<meta charset="UTF-8">
<title>Quản lý Video</title>
<base href="${pageContext.servletContext.contextPath}/">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/vendor.css">

<!-- Link Swiper's CSS -->
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
								<li><a class="dropdown-item text-dark" href="editprofile.jsp">Edit Profile</a></li>
							</ul></li>
						<li class="nav-item dropdown ms-5"><c:choose>
								<c:when test="${empty sessionScope.user}">
									<a class="btn btn-light" href="login.jsp">Đăng Nhập</a>
								</c:when>
								<c:when test="${not empty sessionScope.user}">
									<div class="d-flex align-items-center">
										<img class="img-thumbnail rounded-circle me-2"
											src="images/9.jpg" alt="User Avatar" style="width: 40px;">
										<span>${sessionScope.user.fullname}</span> 
										<a href="/ASM_nhom_java4/account/sign-out"
										class="btn text-light fw-bold"><i class="bi bi-box-arrow-left"></i> Đăng Xuất 
										</a>
										<c:if test="${sessionScope.user.admin}">
						                    <a href="/ASM_nhom_java4/video/crud/index" class="btn text-light fw-bold">
						                    <i class="fa-solid fa-bars"></i> Quản Lý</a>
						                </c:if>
									</div>
								</c:when>
							</c:choose>
						</li>
					</ul>
				</div>
			</div>
		</nav>
	</header>


	<div class="container mt-5 py-5 ">
		<div class="container-fluid">
			<div class="row">
				<aside id="slide-bar" class="col-md-2 sidebar">
					<div class="row ">
						<!-- Sidebar -->
						<nav class="sidebar d-flex flex-column align-items-start p-3">
							<ul class="nav flex-column w-100">

								<li class="nav-item mb-3"><a class="nav-link"
									href="${pageContext.request.contextPath}/video/crud/index">
										<i class="fas fa-list"></i> Quản Lý VIDEO
								</a></li>

								<li class="nav-item mb-3"><a class="nav-link"
									href="${pageContext.request.contextPath}/userall"> <i class="fas fa-envelope"></i> Quản Lý
										Người Dùng
								</a></li>
								<li class="nav-item mb-3"><a class="nav-link"
									href="Report.jsp"> <i class="fas fa-chart-bar"></i> Báo Cáo
										Và Thống Kê
								</a></li>
								<span class="text-muted">
									<h3>Cá Nhân</h3>
								</span>
								<li class="nav-item"><a class="nav-link" href="info.jsp">
										<i class="fas fa-cog"></i> Profile
								</a></li>
							</ul>
						</nav>
					</div>
				</aside>
				<article id="content-area" class="col-md-10">
					<div class="container my-5">
						<!--  Nav tabs  -->
						<ul class="nav nav-tabs" role="tablist">
							<li class="nav-item"><a class="nav-link active"
								data-bs-toggle="tab" href="#fvr">Views</a></li>
							<li class="nav-item"><a class="nav-link"
								data-bs-toggle="tab" href="#fvrU">Likes</a></li>
							<li class="nav-item"><a class="nav-link"
								data-bs-toggle="tab" href="#ShareFr">Shares</a></li>
						</ul>

						<!-- Tab panes -->
						<div class="tab-content">
							<!-- Views -->
							<div id="fvr" class="container tab-pane fade active show">
								<img src="<%= request.getContextPath() %>/chartvideo" alt="Biểu Đồ">
							</div>
								<!-- like -->
							<div id="fvrU" class="container tab-pane fade">
									<img src="<%= request.getContextPath() %>/chartlike" alt="Biểu Đồ">
								
							</div>
								<!-- share -->
							<div id="ShareFr" class="container tab-pane fade">
									<img src="<%= request.getContextPath() %>/chartshare" alt="Biểu Đồ">
							</div>
						</div>
					</div>

				</article>
			</div>
		</div>
	</div>



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


