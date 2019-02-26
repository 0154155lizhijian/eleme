<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link
	href="https://cdn.bootcss.com/bootstrap-select/1.12.4/css/bootstrap-select.min.css"
	rel="stylesheet">
<jsp:include page="/part/manager.css.jsp"></jsp:include>
<title>Insert title here</title>
<style>

.bootstrap-select:not([class*=col-]):not([class*=form-control]):not(.input-group-btn) {
    width: 500px;
}
</style>
<script>
	if ("${user.uname}" == null) {
		alert("您还未登录 请登录！");
		location.href = "../user/login.html";
	}
</script>
</head>
<body>
	<%@ include file="main.nav.jsp"%>
	<div class="container-fluid">
		<div class="row" style="margin: 0 auto;">
			<div class="col-lg-3"></div>
			<div class="col-lg-6">
				<div class="cherkoutcart well" style="width: 100%;">
					<div class="cart-header">
						<h3>订单详情</h3>
						 <span style="float: right"> <a
							href="../shop/${odshop.sid}.html">${odshop.sname}</a></span>
					</div>
					<div class="cart-body">
						<table class="table table-striped">
							<thead>
								<tr>
									<th>商品</th>
									<th>份数</th>
									<th>小计(元)</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${odordersdetailList }" var="od">
									<tr>
										<c:forEach items="${odgoodsList }" var="goods">
											<c:if test="${od.gid == goods.gid}">
												<td>${goods.gname}</td>
												<td>${od.gcount}</td>
												<td>￥${od.gcount*goods.gprice}</td>
												<c:set var="total" value="${total+od.gcount*goods.gprice}" />
												<c:set var="quantitys" value="${quantitys+od.gcount}" />
												<c:set var="boxs" value="${boxs+od.gcount*goods.gbox }" />
											</c:if>
										</c:forEach>
									</tr>
								</c:forEach>
							</tbody>
							<tfoot>
								<tr>
									<td>餐盒费</td>
									<td></td>
									<td>￥<c:out value="${boxs}" /></td>
								</tr>
							</tfoot>
						</table>
						<div class="cart-footer" style="height: 80px">
							<span
								style="font-size: 24px; color: red; margin-top: 15px; font-weight: bolder; float: right">
								￥<span id="total" style="font-size: 48px"><c:out
										value="${total+boxs}" /> </span>
							</span> <span>&nbsp;&nbsp;共计 <c:out value="${quantitys}" /> 份
							</span>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-3">
			</div>
	</div>
	
	<script>
		$(function(){
			$("#submit").click(function(){
				var ototal = $("#total").text();
				var aid = $('#aid option:selected').val();
				console.log(ototal);
				console.log(aid)
				$.ajax({
	                type:'get',
	                url:'add.html',
	                data:{"ototal":ototal,"aid":aid},
	                success:function(data){
	                	alert("购买成功！");
	                	location.href="../orders/showorders.html";
	                }
				})
			})
		})
	</script>
	
	<script src="https://cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
	<script
		src="https://cdn.bootcss.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<script
		src="https://cdn.bootcss.com/bootstrap-select/1.12.4/js/bootstrap-select.min.js"></script>
	<script
		src="https://cdn.bootcss.com/bootstrap-select/1.12.4/js/i18n/defaults-zh_CN.min.js"></script>
</body>
</html>