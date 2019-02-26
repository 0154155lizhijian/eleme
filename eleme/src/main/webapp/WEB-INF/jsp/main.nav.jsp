<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人中心</title>
<style>
* {
	margin: 0;
	padding: 0;
}
.serif {
	font-family: Palatino, Optima, Georgia, serif;
}

.navbar-default {
	background-color: #1e89e0  !important;
}

.navbar-default .navbar-nav>li>a {
	color: #FFFFFF  !important;
}

.navbar-header .navbar-brand {
	color: #FFFFFF  !important;
	font-size: 32px  !important;
	vertical-align: top  !important;
}

.navbar>.container .navbar-brand, .navbar>.container-fluid .navbar-brand
	{
	margin-left: 50px  !important;
} 
</style>
</head>
<body>
	
		<nav class="navbar navbar-default" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand" href="../user/index.html">首页</a>
			</div>
			<div style="margin-left: 80%">
				<ul class="nav navbar-nav ">
					<!-- <li><a href="#">首页</a></li> -->
					<c:if test="${sessionScope.user.uname!=null}">
						<li class=""><a href="../orders/showorders.html">${sessionScope.user.uname}</a></li>
						<li><a href="../user/logout.html">注销</a></li>
					</c:if>
					<c:if test="${sessionScope.user.uname==null}">
						<li><a href="../user/login.html">登录</a></li>
						<li><a href="../user/register.html">注册</a></li>
					</c:if>

				</ul>
			</div>
		</div>
		</nav>
</body>
</html>