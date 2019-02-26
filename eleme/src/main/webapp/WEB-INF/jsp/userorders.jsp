<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
<title>个人订单中心</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/bootstrap.css" rel="stylesheet">
<script type="text/javascript" src="../js/jquery-1.10.2.js"></script>
<script src="../js/bootstrap.min.js"></script>

<script type="text/javascript">
function detail(oid){
	$.getJSON("../orders/showorders.html?oid="+oid,function(data){
		$(".detail").empty();
		$.each(data,function(){
			$("#detail").append("<tr class='detail'><td>"+this.gid+"</td><td>"+this.gcount+"</td>")
		})
	})
}

function remove(oid){
	var r=confirm("确认要删除订单吗？删除订单的同时也会删除评价哦")
	if(r == true){
		$(function(){
			$.ajax({
				url : "../orders/remove.html",
				type : "POST",
				data : {
					"oid" : oid
				},
				success : function(data) {
					alert("删除成功");
					location.reload();
				}
			})
			})
	}
}
</script>
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


						<table class="table table-hover table-bordered">
							<caption>历史订单记录</caption>
							<thead>
								<tr>
									<th>下单时间</th>
									<th>支付金额（元）</th>
									<th>状态</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="orders" items="${showordersList}">
									<c:set var="gid" value="" />
									<c:set var="num" value="0" />
									<c:forEach var="ordersdetail" items="${showordersdetailList}">
										<c:if test="${orders.oid==ordersdetail.oid}">
											<c:set var="num" value="${num+1}" />
											<c:if test="${empty gid}">
												<c:set var="gid" value="${ordersdetail.gid}" />
												<c:forEach var="goods" items="${goodsList}">
													<c:if test="${goods.gid==gid}">
														<c:set var="name" value="${goods.gname}" />
													</c:if>
												</c:forEach>
											</c:if>
										</c:if>
									</c:forEach>
									<tr>
										<td><fmt:formatDate type="both" value="${orders.otime}" /></td>
										<td>${orders.ototal}元</td>
										<td>${orders.ostatus}</td>
										<td><a href="./showordersdetail.html?oid=${orders.oid }">订单详情</a>&nbsp;
										<c:set var="exist"  value="false" />
										<c:forEach var="comment" items="${showorderscommentList }">
											<c:if test="${comment.oid == orders.oid }">
											 	<c:set var="exist"  value="true" />
											 </c:if>
										 </c:forEach>
										 <c:if test="${exist == 'false' }">
										 	<a href="../orders/comment.html?oid=${orders.oid }">评价</a>
										 </c:if>
										 <c:if test="${exist == 'true' }">
										 	<span>已评价</span>
										 </c:if>
										 
										 &nbsp; <a href="#"><span onclick="remove('${orders.oid}')" class="glyphicon glyphicon-remove"
												style="color: red;"></span></a></td>
									</tr>
								</c:forEach>			
							</tbody>
						</table>
					</div>
				</div>
				<%@ include file="main.footer.jsp"%>

			</div>
		</div>
	</div>
</body>
</html>