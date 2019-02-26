<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
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
<title>子模块页面标题</title>
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
						<!-- start dataTables -->
						<!-- 表格格式：面板中嵌套表格 -->
						<div class="panel panel-default">
							<!-- 面板头放：页面标题，刷新按钮，添加按钮 -->
							<div class="panel-heading">
								<font size="4">商品类别管理</font> 
								<a href="<%=basePath%>shopuser/goodstype.html"> 
									<span class="glyphicon glyphicon-repeat"></span>
								</a>
								<span style="float: right">
									<button onclick="editInfo(this,0)" type="button" class="btn btn-default btn-sm" data-toggle="modal" data-target="#myModal">
										<span class="glyphicon glyphicon-plane"></span> 添加操作
									</button>
								</span>
							</div>
							<!-- 面板体放：表格内容，按照dataTable格式来构造-->
							<div class="panel-body">
								<div class="table-responsive">
									<table class="table table-striped table-bordered table-hover"
										id="dataTables-example">
										<thead>
											<tr>
												<th>商品类别id</th>
												<th>商品类别名</th>
												<th>编辑</th>
												<th>删除</th>
											</tr>
										</thead>
										<tbody>
										<c:forEach items="${sugoodstypeList }" var="goodstype">
											<tr>
												<td>${goodstype.gtid }</td>
												<td>${goodstype.gtname }</td>
												<td>
												<a href="#" data-toggle="modal" data-target="#myModal" onclick="editInfo(this,1)">
													<span class="glyphicon glyphicon-edit"></span>
												</a>
												</td>
												<td>
													<a href="#" onclick="doDelete(${goodstype.gtid})" style="color:rgb(212,106,64)">
														<span class="glyphicon glyphicon-remove"></span>
													</a>
												</td>
											</tr>
										</c:forEach>
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
															<th>商品类型信息：<input type="hidden" id="gtid" name="gtid"></th>
															<th></th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td><b>商品类型名称:</b></td>
															<td><input type="text" id="gtname" name="gtname" class="form-control"/></td>
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
	<script type="text/javascript">
		function editInfo(obj,type){
			if(type==0){
				$("#editForm").get(0).reset();
				$("#editForm").attr("action","<%=basePath%>shopuser/addgoodstype.html");
			}else{
				$("#editForm").attr("action","<%=basePath%>shopuser/updategoodstype.html");
				var goodsInfo = obj.parentNode.parentNode.childNodes;
				console.log(goodsInfo);
				$("#gtid").val(goodsInfo[1].innerText);
				$("#gtname").val(goodsInfo[3].innerText);
			}
		}
		
		function doDelete(gtid){
			if(confirm("您确定要删除标号为："+gtid+" 的商品吗？所有该分类下的商品也会被删除！！！")){
				location.href="<%=basePath%>shopuser/removegoodstype.html?gtid="+gtid;
			}
		}
	</script>
	<jsp:include page="/part/shopuser.manager.js.jsp"></jsp:include>
	
</body>
</html>