<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<base href="${pageContext.servletContext.contextPath}/">
</head>
<body>
<div class="row ">
		<!-- Sidebar -->
		<nav class="sidebar d-flex flex-column align-items-start p-3">
			<ul class="nav flex-column w-100">
				
				<li class="nav-item mb-3"><a class="nav-link"
					href="${pageContext.request.contextPath}/video/crud/index"> <i class="fas fa-list"></i>
						Quản Lý VIDEO
				</a></li>

				<li class="nav-item mb-3"><a class="nav-link"
					href="QLuser.jsp"> <i class="fas fa-envelope"></i>
						Quản Lý Người Dùng
				</a></li>
				<li class="nav-item mb-3"><a class="nav-link"
					href="Report.jsp"> <i class="fas fa-chart-bar"></i>
						Báo Cáo Và Thống Kê
				</a></li>
				<span class="text-muted"> <h3>Cá Nhân</h3> </span>
				<li class="nav-item"><a class="nav-link" href="info.jsp"> <i
						class="fas fa-cog"></i> Profile
				</a></li>
			</ul>
		</nav>
	</div>
</body>
</html>