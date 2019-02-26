<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<script type="text/javascript">
	var msg = '${msg}';
	console.log(msg);
	if (msg != "" && msg != undefined) {
		alert(msg);
	}
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>饿了么-网上订餐_外卖_饿了么订餐官网</title>

</head>
<style type="text/css">
* {
	margin: 0px;
	padding: 0px;
}

#content {
	position: absolute;
	width: 100%;
	height: 100%;
	background-color: #f7f7f7;
}

.top {
	top: 0;
	width: 100%;
	height: 500px;
	background-color: #008de1;
}

.footer {
	width: 100%;
	background-color: #f7f7f7;
	margin-top: 40px;
	border-top: 1px solid #eee;
}

.footer-contect, .footer-link, .footer-mobile {
	float: left;
	width: 33%;
	margin-top: 30px;
	text-shadow: 0 0 black;
}

.footer-link-title {
	font-size: 14px;
	line-height: 30px;
}

.footer-link-item {
	width: 50%;
	font-size: 12px;
}

.footer-contect-item, .footer-link-item {
	color: #999;
	display: block;
	line-height: 24px;
}

.footer-copyright {
	font-size: 12px;
	clear: both;
	padding-top: 60px;
	color: #999;
	text-align: center;
}

a {
	text-decoration: none;
	color: white;
}
</style>

<body>

	<div id="content">
		<div class="top">
			<div style="padding: 30px; margin-left: 70%;">
				<c:if test="${sessionScope.user.uname!=null}">
						<a href="orders/showorders.html">欢迎你！${sessionScope.user.uname}</a>
						<a href="user/logout.html" style="padding: 7px 14px; font-size: 12px;">注销</a>
						
				</c:if>	
				<c:if test="${sessionScope.user.uname==null}">
						<a href="user/login.html" style="padding: 7px 14px; font-size: 12px;">请登录</a>
				</c:if>
				<a href="slogin.jsp" style="background-color: #5db423; padding: 7px 14px; font-size: 12px;">我是店家</a>
				<a href="adminlogin.jsp" style="background-color: red;padding: 7px 14px; font-size: 12px;">我是管理员</a>
			</div>
			<div style="text-align: center; margin-top: 140px;">
				<img src="images/logo2.png" />
			</div>
			<div>
				<div style="text-align: center; margin-top: 30px; height:50px;">
					<form action="shop/search.html" method="get" style=" margin:0;padding:0px">
						<input type="text" placeholder="请输入你的收获地址（比如集美）" name="address"
							style="width: 800px; height: 40px; font-size:22px; padding-left:20px;" />
						<button type="submit"
							style="width: 80px; height: 44px; padding: 0;border:0px;font-size:20px;">搜索</button>
					</form>
				</div>
			</div>
		</div>
		<br />
		<div style="width: 70%; margin: 0 auto;">
			<footer class="footer">
				<div class="container ">
					<div class="footer-link">
						<h3 class="footer-link-title">用户帮助</h3>
						<a class="footer-link-item" href="#" target="_blank">我的客服</a>
					</div>
					<div class="footer-link">
						<h3 class="footer-link-title">商务合作</h3>
						<a class="footer-link-item" href="#" target="_blank">我要开店</a> <a
							class="footer-link-item" href="#" target="_blank">加盟指南</a> <a
							class="footer-link-item" href="#" target="_blank">市场合作</a> <a
							class="footer-link-item" href="#" target="_blank">开放平台</a>
					</div>
					<div class="footer-link">
						<h3 class="footer-link-title">关于我们</h3>
						<a class="footer-link-item" href="#" target="_blank">饿了么介绍</a> <a
							class="footer-link-item" href="#" target="_blank">加入我们</a> <a
							class="footer-link-item" href="#" target="_blank">联系我们</a> <a
							class="footer-link-item" href="#" target="_blank" href="#">规则中心</a>
					</div>

					<div class="footer-copyright serif">
						<h5 class="owner">上海拉扎斯信息科技有限公司</h5>
						<p>Copyright ©2008-2018 ele.me, All Rights
							Reserved.互联网药品信息服务资格证书 编号：（沪）-经营性-2016-0011</p>
					</div>

				</div>
			</footer>
		</div>

	</div>

</body>

</html>