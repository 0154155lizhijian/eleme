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
<title>商家用户管理</title>
<jsp:include page="/part/shopuser.manager.css.jsp"></jsp:include>
</head>
<body>
	<div id="wrapper">
		<!--头部：页面标题栏-->
		<jsp:include page="/part/admin.manager.header.jsp"></jsp:include>
		<!--导航栏：页面菜单栏-->
		<jsp:include page="/part/adminmanager.menu.jsp"></jsp:include>
		<!--表格-->
		<div id="page-wrapper">
			<div id="page-inner">
				<div class="row">
					<div class="col-md-12">
						<!-- start dataTables -->
						<!-- 表格格式：面板中嵌套表格 -->
						<div class="panel panel-default">
							<!-- 面板头放：页面标题，刷新按钮，添加按钮 -->
							<div class="panel-heading">
								<font size="4">商家用户管理</font> 
								<a href="<%=basePath%>shopuser_list.html"> 
									<span class="glyphicon glyphicon-repeat"></span>
								</a>
								
							</div>
							<!-- 面板体放：表格内容，按照dataTable格式来构造-->
							<div class="panel-body">
								<div class="table-responsive">
									<table class="table table-striped table-bordered table-hover"
										id="dataTables-example">
										<thead>
											<tr>
												<th>用户编号</th>
												<th>店铺编号</th>
												<th>店铺名称</th>
												<th>店铺地址</th>
												<th>店铺状态</th>
												<th>编辑状态</th>
											</tr>
										</thead>
										<tbody>
											<c:if test="${not empty shoplist }">
												<c:forEach items="${shoplist}" var="shop">
													<tr>													
														<c:forEach items="${shopuserlist}" var="shopuser">
															<c:if test="${shop.sid == shopuser.sid}">
																<td>${shopuser.suid} </td>
															</c:if>
														</c:forEach>							
														<td>${shop.sid}</td>
														<td>${shop.sname}</td>
														<td>${shop.saddress}</td>
														<td>${shop.sstatus}</td>
														<td> 
															<a href="#" data-toggle="modal" data-target="#myModal" onclick="editInfo(this)">
																		<span class="glyphicon glyphicon-edit"></span>
															</a>
														 </td>
														
													</tr>
												</c:forEach>
											</c:if>	
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<!--End dataTables -->
						<!-- 按钮触发模态框 -->
						<!-- 模态框（Modal） myModal-->
						<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
							aria-labelledby="myModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-hidden="true">×</button>
										<!-- 表单嵌套表格：规范表单格式 -->
										<form action="" method="post" role="form" id="editForm">
											<div class="form-group">
												<table class="table" style="font: '黑体';">
													<thead>
														<tr>
															<th>商家信息：<input type="hidden" id="sid" name="sid"></th>
															<th></th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td><b>店铺状态:</b></td>
															<td>
																<select id="sstatus" name="sstatus" class="form-control">
																	<option value="营业中">营业中</option>
																	<option value="休息中">休息中</option>
																</select>
															</td>
														</tr>
														
													</tbody>
												</table>
												<div class="modal-footer">
													<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
													<input type="submit" value="提交" class="btn btn-primary">
												</div>
											</div>
										</form>
									</div>
								</div>
							</div>
							<!-- /.modal-dialog -->
						</div>
						<!-- /.modal -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/part/shopuser.manager.js.jsp"></jsp:include>
	<script type="text/javascript">
		function editInfo(obj){	
				$("#editForm").attr("action","<%=basePath%>modifyshop.html");
				var shopuserInfo = obj.parentNode.parentNode.childNodes;
				$("#sid").val(shopuserInfo[3].innerText);
				$("#sstatus").val(shopuserInfo[9].innerText);
			
			}
		
		
	
	</script>
	
	
</body>
</html>