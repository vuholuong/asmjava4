<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Edit Profile</title>
    <base href="${pageContext.servletContext.contextPath}/">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
          crossorigin="anonymous">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">

    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@300;400;500;600;700&display=swap"
          rel="stylesheet">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="style.css">

    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>
</head>

<body data-bs-spy="scroll" data-bs-target="#navbar-example2" tabindex="0">

<!-- Navigation Bar -->
<header id="nav" class="site-header position-fixed text-white bg-dark w-100">
    <nav class="navbar navbar-expand-lg py-2">
        <div class="container">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/top-videos">
                <img src="images/image.png" alt="image" style="width: 100px;">
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false"
                    aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link active me-md-4" href="${pageContext.request.contextPath}/top-videos">
                            <h3>Online Entertainment</h3>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link me-md-4" href="${pageContext.request.contextPath}/favorite-videos">
                            <i class="bi bi-star-fill"></i> My Favorite
                        </a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="dropdownMenuLink" role="button"
                           data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="fas fa-user"></i> Tài Khoản
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                            <li><a class="dropdown-item text-dark" href="login.jsp">Đăng Nhập</a></li>
                            <li><a class="dropdown-item text-dark" href="dangki.jsp">Đăng Ký</a></li>
                            <li><a class="dropdown-item text-dark" href="change-password.jsp">Đổi Mật Khẩu</a></li>
                            <li><a class="dropdown-item text-dark" href="editprofile.jsp">Edit Profile</a></li>
                        </ul>
                    </li>
                    <li class="nav-item dropdown ms-5">
                    <c:choose>
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

<!-- Main Section -->
<section id="edit-profile" class="vh-100 d-flex align-items-center">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card shadow-lg">
                    <div class="card-body">
                        <h2 class="card-title text-center mt-5 mb-4">Chỉnh Sửa Thông Tin</h2>
                        <c:if test="${not empty requestScope.message}">
                            <div class="alert alert-info">${requestScope.message}</div>
                        </c:if>
                        <form method="POST" action="<%= request.getContextPath() %>/account/edit-profile">
                            <div class="mb-3">
                                <label for="fullname" class="form-label">Họ và Tên</label>
                                <input type="text" class="form-control" id="fullname" name="fullname" 
                                       value="${sessionScope.user.fullname}" required>
                            </div>
                            <div class="mb-3">
                                <label for="email" class="form-label">Email</label>
                                <input type="email" class="form-control" id="email" name="email" 
                                       value="${sessionScope.user.email}" required>
                            </div>
                            <div class="mb-3">
                                <label for="password" class="form-label">Mật Khẩu</label>
                                <input type="password" class="form-control" id="password" name="password" 
                                       value="${sessionScope.user.password}" required value="Không thể chỉnh sửa" readonly>
                            </div>
                            <button type="submit" class="btn btn-primary w-100">Lưu Thay Đổi</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Footer -->
<section id="footer">
    <footer class="d-flex flex-wrap justify-content-between align-items-center border-top"></footer>
    <div class="container">
        <footer class="d-flex flex-wrap justify-content-between align-items-center py-2">
            <div class="col-md-8 d-flex align-items-center">
                <p>© 2023 TemplatesJungle, Inc. All rights reserved.</p>
            </div>
            <div class="col-md-4 d-flex align-items-center">
                <p>
                    HTML template by: <a href="https://templatesjungle.com/" class="link-primary"
                                         target="_blank">TemplatesJungle</a> <br>
                    Distributed by: <a href="https://themewagon.com" class="link-primary" target="_blank">ThemeWagon</a>
                </p>
            </div>
        </footer>
    </div>
</section>
</body>
</html>
