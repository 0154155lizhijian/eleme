	<%@ page language="java" pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<!DOCTYPE html>
	<html>
	
	<head>
	<meta charset="UTF-8">
	<title>用户地址</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script type="text/javascript" src="../js/jquery.min.js"></script>
	<link href="../css/bootstrap.css" rel="stylesheet">
	<style type="text/css">
	.desktop-addressblock:hover {
		border: 1px solid #0089dc;
	}
	
	.desktop-addressblock:hover .btn {
		color: #0089dc;
	}
	
	.desktop-addressblock:hover .btn:hover {
		color: red;
	}
	
	.desktop-addressblock {
		margin-top: 15px;
		margin-left: 2%;
		border: 1px solid #ddd;
		float: left;
		width: 30%;
		height: 110px;
		overflow: hidden;
	}
	
	.btn {
		width: 40px;
		font-size: 12px;
		background-color: transparent;
		border: none;
		color: #999;
	}
	</style>
	<script>
			function remove(aid){
				var r=confirm("确认要删除地址吗？")
				if(r == true){
					$(function(){
						$.ajax({
							url : "../address/remove.html",
							type : "POST",
							data : {
								"aid" : aid
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
	
	
							<h3>地址管理</h3>
							<c:if test="${not empty adlist}">
							<c:forEach items="${adlist}" var="address">
								<div class="desktop-addressblock ">
									<div class="" style="margin: 10px 10px; display: inline-block;">${address.linkman} <c:if test="${address.sex eq '男'}">先生</c:if><c:if test="${address.sex eq '女'}">小姐</c:if>
									</div>
									<div class=""
										style="float:right;margin-top: 10px; margin-right: 5%; display: inline-block;">
										<button class="btn" type="button" onclick="remove('${address.aid}')">删除</button>
									</div>
									<div style="overflow: hidden; height: 100%; margin-left: 10px;">
										<div
											style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
											地址：${address.uaddress}</div>
										<div style="margin-top: 5px;">手机号：${address.utel}</div>
									</div>
								</div>
							</c:forEach>
							</c:if>
							<div class="desktop-addressblock "
								style="display: flex; justify-content: center; align-items: center;">
								<a href="../address/add.html" style="position: absolute;"><span
									class="glyphicon glyphicon-plus"> </span>添加新地址</a>
							</div>
						</div>
					</div>
					<%@ include file="main.footer.jsp"%>
				</div>
			</div>
		</div>
	</body>
	</html>