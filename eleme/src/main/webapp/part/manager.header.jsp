<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<body>
	<div class="row" style="background-image: url(<%=basePath %>images/bg.jpg);">
		<div class="col-lg-3"></div>
		<div class="col-lg-6">
			<div id="shopinfo">
				<img src="https:${shop.simage}" class="img-circle"
					style="float: left; margin: 3%">
				<h2 style="color: white; float: left; margin-top: 6%">欢迎光临
					${shop.sname}</h2>
			</div>
		</div>
		<div class="col-lg-3"></div>
	</div>
	
	<div class="row" style="background-color:white;">
		<div class="col-lg-2"></div>
		<div class="col-lg-6" style="height:30px;font-size:24px">
			<a href="<%=basePath %>shop/${shop.sid}.html">商品</a>
			<a href="<%=basePath %>shop/${shop.sid}/rate.html">评价</a>
		</div>
		<div class="col-lg-3"></div>
	</div>
</body>
</html>
