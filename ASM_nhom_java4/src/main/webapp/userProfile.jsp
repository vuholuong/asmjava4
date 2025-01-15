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
					src="images/logo.png" alt="image" style="width: 120px;">
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
								<i class="fas fa-user"></i> Account
						</a>
							<ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
								<li><a class="dropdown-item text-dark" href="login.jsp"><i
										class="fas fa-sign-in-alt me-2"></i>Login</a></li>
								<li><a class="dropdown-item text-dark" href="dangki.jsp"><i
										class="fas fa-user-plus me-2"></i>Sign up</a></li>
								<li><a class="dropdown-item text-dark"
									href="change-password.jsp"><i class="fas fa-key me-2"></i>Change
										password</a></li>
								<li><a class="dropdown-item text-dark" href="#"><i
										class="fas fa-user-edit me-2"></i>Edit Profile</a></li>
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
				<aside id="slide-bar" class="col-md-3 sidebar mt-5">
					<div class="row ">
						<h4>Menu</h4>
						<!-- Sidebar -->
						<nav class="sidebar d-flex flex-column align-items-start p-3">
							<ul class="nav flex-column w-100">

								<li class="nav-item mb-3"><a class="nav-link"
									href="${pageContext.request.contextPath}/video/crud/index">
										<i class="fas fa-video"></i> Quản Lý VIDEO
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
									<h4>Cá Nhân</h4>
								</span>
								<li class="nav-item"><a class="nav-link" href="info.jsp">
										<i class="fas fa-cog"></i> Profile
								</a></li>
							</ul>
						</nav>
					</div>
				</aside>
				<article id="content-area" class="col-md-9">
    <div class="container mt-5">
        <!-- Tabs Header -->
        <ul class="nav nav-tabs" id="tabMenu">
            <li class="nav-item">
                <a class="nav-link active" data-bs-toggle="tab" href="#userEdition">USER EDITION</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-bs-toggle="tab" href="#userList">USER LIST</a>
            </li>
        </ul>

        <!-- Tab Content -->
        <div class="tab-content mt-3">
            <!-- User Edition Tab -->
 <div class="tab-pane fade show active" id="userEdition">
    <div class="col-md-8">
        <form action="${url}" method="post">
            <div class="mb-3">
                <label for="userId" class="form-label">ID</label>
                <input type="number" class="form-control" id="Id" name="id" 
                       value="${user != null ? user.id : ''}" readonly>
            </div>
            <div class="mb-3">
                <label for="userFullname" class="form-label">Fullname</label>
                <input type="text" class="form-control" id="userFullname" name="fullname" 
                       value="${user != null ? user.fullname : ''}" placeholder="Enter User Fullname">
            </div>
            <div class="mb-3">
                <label for="userEmail" class="form-label">Email</label>
                <input type="email" class="form-control" id="userEmail" name="email" 
                       value="${user != null ? user.email : ''}" placeholder="Enter User Email">
            </div>
            <div class="mb-3">
                <label for="userPassword" class="form-label">Password</label>
                <input type="text" class="form-control" id="userPassword" name="password" 
                       value="${user != null ? user.password : ''}" placeholder="Enter User Password">
            </div>
            <div class="mb-3">
                <label>Role:</label><br>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="admin" id="admin" value="true" 
                           ${user != null && user.admin ? 'checked' : ''}>
                    <label class="form-check-label" for="admin">Admin</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="admin" id="user" value="false" 
                           ${user != null && !user.admin ? 'checked' : ''}>
                    <label class="form-check-label" for="user">User</label>
                </div>
            </div>
            <div class="mt-3">
    <!-- Đường dẫn cho hành động Update -->
    <button formaction="${pageContext.request.contextPath}/userall/update" class="btn btn-primary">Update</button>
    
    <!-- Đường dẫn cho hành động Delete -->
    <button formaction="${pageContext.request.contextPath}/userall/delete" class="btn btn-danger">Delete</button>
    
    <!-- Đường dẫn cho hành động Reset -->
    <a href="${pageContext.request.contextPath}/userall/reset" class="btn btn-secondary">Reset</a>
</div>

        </form>
    </div>
</div>



            <!-- User List Tab -->
           <div class="tab-pane fade" id="userList">
    <!-- User List Table -->
    <div class="table-responsive mt-3">
        <table class="table table-striped table-bordered table-hover">
            <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>Fullname</th>
                    <th>Email</th>
                    <th>Password</th>
                    <th>Role</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody class="table-dark">
                <!-- Lặp qua tất cả người dùng và hiển thị thông tin -->
                <c:forEach var="user" items="${allUser}">
                    <tr>
                        <td>${user.id}</td>
                        <td>${user.fullname}</td>
                        <td>${user.email}</td>
                        <td>${user.password}</td>
                        <td>${user.admin ? 'Admin' : 'User'}</td>
                        <td>
                            <!-- Thêm nút Edit với kiểu dáng đẹp -->
<a href="${pageContext.request.contextPath}/userall/edit?id=${user.id}" class="btn btn-warning btn-sm">
    <i class="bi bi-pencil-square"></i> Edit
</a>

                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>

        </div>
    </div>
</article>
			</div>
		</div>
	</div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
