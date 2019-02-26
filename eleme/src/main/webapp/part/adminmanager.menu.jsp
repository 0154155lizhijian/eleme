<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
	<body>
	<!--导航栏class="active-menu-->
	<nav class="navbar-default navbar-side" role="navigation">
	<div class="sidebar-collapse">
	<ul class="nav" id="main-menu">
		<li><a href="<%=basePath %>shopuser_list.html">
		<i class="fa fa-signal"></i>商家用户管理</a></li>
		<li><a href="<%=basePath %>user_list.html">
		<i class="fa fa-align-justify"></i>顾客用户管理</a></li>
		<li><a href="<%=basePath %>commentmanage.html">
		<i class="fa fa-table"></i>顾客评论管理</a></li>
		
	</ul>
	</div>
	</nav>
	</body>
</html>
