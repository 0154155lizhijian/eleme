<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<jsp:include page="/part/manager.css.jsp"></jsp:include>
<style>
.stars-bg{
    position: relative;
    display: inline-block;
    height: 19px;
    width: 157px;
    background: url(<%=basePath %>images/star.jpg) 0 0;
}
.star-active{
    position: absolute;
    left: 0;
    top: 0;
    display: block;
    height: 100%;
    background: url(<%=basePath %>images/star.jpg) 0 -24px;
}
</style>
</head>
<body>
	<div class="container-fluid">
		<jsp:include page="/part/manager.header.jsp"></jsp:include>
		<!--导航栏：页面菜单栏-->

		<div class="row">
			<div class="col-lg-2"></div>
			<div class="col-lg-6">
				<div>
					<c:forEach items="${commnetsList }" var="comment">
						<div class="panel panel-default">
							<div class="panel-heading">
								<c:forEach items="${userList }" var="user">
									<c:if test="${user.uid == comment.uid }">
										<span class="panel-title">用户：${user.uname}</span>
									</c:if>
								</c:forEach>
								<div class="star-eval" style="float:right">
		    						<span class="stars-bg">
		        						<i class="star-active" style="width:${comment.cgrade*20}%"></i>
		    						</span>
								</div>
							</div>
							<div class="panel-body">
								<p>${comment.ccontent}</p>
							</div>
							<div class="panel-footer">
								<c:forEach items="${ordersList}" var="orders">
									<c:if test="${orders.oid == comment.oid }">
										<span>购买商品：
											<c:forEach items="${ordersdetailList }" var="ordersdetail">
												<c:if test="${ordersdetail.oid == orders.oid }">
													<c:forEach items="${goodsList }" var="goods">
														<c:if test="${goods.gid == ordersdetail.gid }">
															<a href="../${shop.sid}.html#${goods.gid}">${goods.gname}</a>
														</c:if>
													</c:forEach>
												</c:if>
											</c:forEach>
										</span>
										<span style="float:right">下单时间：<fmt:formatDate type="both" value="${orders.otime}" /></span>
									</c:if>
								</c:forEach>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			<div class="col-lg-2">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title">商家公告</h3>
					</div>
					<div class="panel-body">
						<p>商家电话：${shop.stel}</p>
						<p>商家地址：${shop.saddress}</p>
					</div>
				</div>

				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title">商家公告</h3>
					</div>
					<div class="panel-body">${shop.sinfo}</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>