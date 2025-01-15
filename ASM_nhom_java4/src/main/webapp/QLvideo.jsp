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
					<div class="container mt-5">
						<!-- Tabs Header -->
						<ul class="nav nav-tabs tab-header" id="tabMenu">
							<li class="nav-item"><a class="nav-link active"
								data-bs-toggle="tab" href="#videoEdition">VIDEO EDITION</a></li>
							<li class="nav-item"><a class="nav-link"
								data-bs-toggle="tab" href="#videoList">VIDEO LIST</a></li>
						</ul>

						<!-- Tab Content -->
						<div class="tab-content tab-content-box">
							<!-- Video Edition Tab -->
							<div class="tab-pane fade show active" id="videoEdition">
								<div class="row mt-3">
									<div class="col-md-4">
										<div class="poster-box">

											<a> <c:choose>
													<c:when test="${not empty video.poster}">
														<iframe width="340" height="250" style="margin-top: 35px;"
															src="${video.poster}" frameborder="0"
															allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
															allowfullscreen></iframe>
													</c:when>
													<c:otherwise>
														<p>Video not available</p>
													</c:otherwise>
												</c:choose>
											</a>
										</div>
									</div>

									<div class="col-md-8">
										<form
											action="${pageContext.request.contextPath}/video/crud/${video != null && video.id != null ? 'update' : 'create'}"
											method="post">
											<div class="mb-3">
												<label for="videoId" class="form-label">ID</label> <input
													type="number" class="form-control" id="Id" name="id"
													value="${video != null ? video.id : ''}"
													placeholder="Enter Video id" readonly>
											</div>
											<!-- Title -->
											<div class="mb-3">
												<label for="videoTitle" class="form-label">Title</label> <input
													type="text" class="form-control" id="videoTitle"
													name="title" value="${video != null ? video.title : ''}"
													placeholder="Enter Video Title">
											</div>

											<!-- View Count -->
											<div class="mb-3">
												<label for="viewCount" class="form-label">View</label> <input
													type="number" class="form-control" id="viewCount"
													name="views" value="${video != null ? video.views : 0}">
											</div>

											<div class="form-group">
												<label for="poster">Poster (YouTube Embed Link):</label> <input
													type="url" class="form-control" name="poster" id="poster"
													value="${video.poster != null ? video.poster : ''}"
													placeholder="Link đến video trên YouTube" required>
											</div>
											<!-- Status -->
											<div class="form-group">
												<label>Trạng Thái:</label><br>
												<div class="form-check form-check-inline">
													<input class="form-check-input" type="radio" name="active"
														id="active" value="true" ${video.active ? 'checked' : ''}>
													<label class="form-check-label" for="active">Kích
														hoạt</label>
												</div>
												<div class="form-check form-check-inline">
													<input class="form-check-input" type="radio" name="active"
														id="inactive" value="false"
														${!video.active ? 'checked' : ''}> <label
														class="form-check-label" for="inactive">Không kích
														hoạt</label>
												</div>
											</div>

											<!-- Description Field -->
											<div class="mb-3">
												<label for="description" class="form-label">Description</label>
												<textarea class="form-control" id="description"
													name="description" rows="3">${video != null ? video.description : ''}</textarea>
											</div>

											<!-- Buttons -->
											<div class="d-flex justify-content-end">
												<button type="submit" class="btn btn-primary m-1">
													${video.id != null ? 'Cập Nhật' : 'Thêm'}</button>
												<a
													href="${pageContext.request.contextPath}/video/crud/delete/${video != null ? video.id : ''}"
													class="btn btn-danger m-1">Delete</a> <a
													href="${pageContext.request.contextPath}/video/crud/reset"
													class="btn btn-secondary m-1">Reset</a>
											</div>
										</form>

									</div>
								</div>
							</div>

							<!-- Video List Tab -->
							<div class="tab-pane fade" id="videoList">
								<table class="table table-striped mt-3 table-light">
									<thead>
										<tr>

											<th>Tiêu Đề</th>
											<th>Mô Tả</th>
											<th>Lượt Xem</th>
											<th>Poster</th>
											<th>Trạng Thái</th>
											<th>Chức Năng</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="video" items="${videos}">
											<tr>


												<td>${video.title}</td>
												<td>${video.description}</td>
												<td>${video.views}</td>
												<td><c:choose>
														<c:when test="${not empty video.poster}">
															<iframe width="150" height="100" src="${video.poster}"
																frameborder="0"
																allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
																allowfullscreen></iframe>
														</c:when>
														<c:otherwise>
															<p>Video not available</p>
														</c:otherwise>
													</c:choose></td>
												<td>${video.active ? 'Kích hoạt' : 'Không kích hoạt'}</td>
												<td><a
													href="${pageContext.request.contextPath}/video/crud/edit/${video.id}"
													class="btn btn-sm btn-info">Sửa</a> <a
													href="${pageContext.request.contextPath}/video/crud/delete/${video.id}"
													class="btn btn-sm btn-danger mt-2"
													onclick="return confirm('Bạn có chắc muốn xóa không?')">Xóa</a>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>


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
