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
<title>商品管理</title>
<jsp:include page="/part/manager.css.jsp"></jsp:include>
</head>
<body>
	<div id="wrapper">
		<!--头部：页面标题栏-->
		<jsp:include page="/part/manager.header.jsp"></jsp:include>
		<!--导航栏：页面菜单栏-->
		<jsp:include page="/part/manager.menu.jsp"></jsp:include>
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
								<font size="4">商品管理</font> 
								<a href="<%=basePath%>showgoods.html"> 
									<span class="glyphicon glyphicon-repeat"></span>
								</a>
								<span style="float: right">
									<button type="button" class="btn btn-default btn-sm" data-toggle="modal" data-target="#myModal" onclick="editInfo(this,0)">
										<span class="glyphicon glyphicon-plane"></span> 商品添加
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
												<th>商品编号</th>
												<th>商品名称</th>
												<th>商品单价</th>
												<th>本月销量</th>												
												<th>简介</th>
												<th>图片</th>
												<th>餐盒费</th>
												<th>商品类型</th>
												<th>编辑</th>
												<th>删除</th>
											</tr>
										</thead>
										<tbody>
											<c:if test="${not empty list }">
												<c:forEach items="${list }" var="goods">
													<tr>
														<td>${goods.gid}</td>
														<td>${goods.gname}</td>
														<td>${goods.gprice}</td>
														<td>${goods.gcount}</td>
														<td>${goods.ginfo}</td>
														<td>${goods.gimage}</td>
														<td>${goods.gbox}</td>
														<td>${goods.gtid}</td>
														<td>
															<a href="#" data-toggle="modal" data-target="#myModal" onclick="editInfo(this,1)">
																<span class="glyphicon glyphicon-edit"></span>
															</a>
														</td>
														<td>
															<a href="#" onclick="doDelete(${goods.gid})" style="color:rgb(212,106,64)">
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
															<th>商品信息：<input type="hidden" id="gid" name="gid"></th>
															<th></th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td><b>商品名称:</b></td>
															<td><input type="text" id="gname" name="gname" class="form-control"/></td>
														</tr>
														<tr>														
															<td><b>商品单价：</b></td>
															<td><input type="number" id="gprice" name="gprice" step="0.01" maxlength="10" class="form-control"/></td>
														    </tr>
														<tr>
														    <td><b>本月销量：</b></td>
															<td><input type="number" id="gprice" name="gprice" step="0.01" maxlength="10" class="form-control"/></td>
														    </tr>															
														<tr>														
															<td><b>商品简介：</b></td>
															<td><input type="text" id="ginfo" name="ginfo" step="0.01" maxlength="10" class="form-control"/></td>
														    </tr>
														<tr>														
															<td><b>商品图片：</b></td>
															<td><input type="text" id="gimage" name="gimage" step="0.01" maxlength="10" class="form-control"/></td>
														    </tr>
														<tr>														
															<td><b>餐盒费：</b></td>
															<td><input type="number" id="gbox" name="gbox" step="0.01" maxlength="10" class="form-control"/></td>
														    </tr>
														<tr>
															<td><b>商品类型：</b></td>
															<td>
																<input type="number" id="gtid" name="gtid" step="0.01" maxlength="10" class="form-control"/>
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
	<jsp:include page="/part/manager.js.jsp"></jsp:include>
	<script type="text/javascript">
		function editInfo(obj,type){
			if(type==0){
				$("#editForm").get(0).reset();
				$("#editForm").attr("action","<%=basePath%>addgoods.html");
			}else{
				$("#editForm").attr("action","<%=basePath%>modifygoods.html");
				var goodsInfo = obj.parentNode.parentNode.childNodes;
				$("#gid").val(goodsInfo[1].innerText);
				$("#gname").val(goodsInfo[3].innerText);
				$("#gprice").val(goodsInfo[5].innerText);
				$("#gcount").val(goodsInfo[7].innerText);
				$("#ginfo").val(goodsInfo[9].innerText);
				$("#gimage").val(goodsInfo[11].innerText);
				$("#gbox").val(goodsInfo[13].innerText);
				$("#gtid").val(goodsInfo[15].innerText);
			}
		}
		
		function doDelete(gid){
			if(confirm("您确定要删除标号为："+gid+" 的商品吗？")){
				location.href="<%=basePath%>removegoods.html?gid="+gid;
			}
		}
	
	</script>
</body>
</html>