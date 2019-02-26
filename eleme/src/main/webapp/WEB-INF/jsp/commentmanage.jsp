<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<title>评论管理</title>
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
								<font size="4">评论管理</font> 
								<a href="<%=basePath%>commentmanage.html"> 
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
												<th>评论编号</th>
												<th>评论内容</th>
												<th>评分</th>
												<th>删除</th>
											</tr>
										</thead>
										<tbody>
											<c:if test="${not empty commentlist }">
												<c:forEach items="${commentlist }" var="comment">
													<tr>
														<td>${comment.uid}</td>
														<td>${comment.cid}</td>
														<td>${comment.ccontent}</td>
														<td>${comment.cgrade}</td>
														<td>
															<a href="#" onclick="doDelete(${comment.cid})" style="color:rgb(212,106,64)">
																<span class="glyphicon glyphicon-remove"></span>
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
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/part/shopuser.manager.js.jsp"></jsp:include>
	<script type="text/javascript">
		
		
		function doDelete(cid){
			if(confirm("您确定要删除标号为："+cid+" 的评论吗？")){
				location.href="<%=basePath%>removemanage.html?cid="+cid;
			}
		}
	
	</script>
</body>
</html>