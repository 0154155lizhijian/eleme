<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>个人资料</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="../js/jquery.min.js"></script>
<link href="../css/bootstrap.css" rel="stylesheet">
</head>

<body style="background-color: #F7F7F7;">
	<div class="container-fluid">

		<%@ include file="main.nav.jsp"%>
		<div style="width: 70%; margin: 0 auto;">
			<div class="row" style="display: flex; flex-wrap: wrap;">
				<%@ include file="userinfo.part.jsp"%>
				<div class="col-sm-10 modal-content"
					style="display: flex; flex-direction: column;">
					<div style="height: 100%;">

						<h4>个人资料</h4>
						<hr />
						用户名：<span>${user.uname}</span> <br /> <a href="changepwd.html">修改密码</a>
					</div>
				</div>
				<%@ include file="main.footer.jsp"%>

			</div>
		</div>
	</div>
</body>
</html>