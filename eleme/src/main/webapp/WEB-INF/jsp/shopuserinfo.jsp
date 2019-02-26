<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta content="" name="description" />
<meta content="webthemez" name="author" />
<title>商家基本信息</title>
<jsp:include page="/part/shopuser.manager.css.jsp"></jsp:include>
</head>
<body>
	<div id="wrapper">
		<!--头部：页面标题栏-->
		<jsp:include page="/part/shopuser.manager.header.jsp"></jsp:include>
		<!--导航栏：页面菜单栏-->
		<jsp:include page="/part/shopuser.manager.menu.jsp"></jsp:include>
		<!--表格-->
		<div id="page-wrapper">
			<div id="page-inner">
				<div class="row">
					<div class="col-md-12">
						<div class="panel panel-primary">
 						 <div class="panel-heading">
						    <h3 class="panel-title">商家基本信息</h3>
						  </div>
							<table class="table table-bordered">
								<tr>
								<td>商家店名：${sushop.sname}</td>
								<td>商家地址：${sushop.saddress}</td>
								<td>商家类型：${sushoptype.stname}</td>
								</tr>
								<tr>
								<td>商家电话：${sushop.stel}</td>
								<td>总订单量：${suorderscount }</td>
								<td>商家状态：${sushop.sstatus }&nbsp;&nbsp;<a href="changestatus.html">点击切换</a></td>
								</tr>	
							</table>
						</div>
						<!-- /.modal -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/part/shopuser.manager.js.jsp"></jsp:include>
</body>
</html>