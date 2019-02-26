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
<title>统计信息</title>
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
					<div class="col-md-6">
						<!-- start dataTables -->
						<!-- 表格格式：面板中嵌套表格 -->
						<div class="panel panel-default">
							<!-- 面板头放：页面标题，刷新按钮，添加按钮 -->
							<div class="panel-heading">
								品类销量柱状图
							</div>
							<!-- 面板体放：表格内容，按照dataTable格式来构造-->
							<div class="panel-body">
								<div id="quantity-bar-echarts" style="width:95%;height:400px"></div>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<!-- start dataTables -->
						<!-- 表格格式：面板中嵌套表格 -->
						<div class="panel panel-default">
							<!-- 面板头放：页面标题，刷新按钮，添加按钮 -->
							<div class="panel-heading">
								品类销售额柱状图
							</div>
							<!-- 面板体放：表格内容，按照dataTable格式来构造-->
							<div class="panel-body">
								<div id="total-bar-echarts" style="width:95%;height:400px"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/part/manager.js.jsp"></jsp:include>
	<script type="text/javascript">
		var types = new Array();
		var nums = new Array();
		var amounts = new Array();
		
		//初始化报表
		var qbeChart = echarts.init(document.getElementById("quantity-bar-echarts"));
		var tbeChart = echarts.init(document.getElementById("total-bar-echarts"));
		
		$.getJSON("<%=basePath%>showchart.html",function(data){
			$.each(data,function(){
				types.push(this.type);
				nums.push(this.num);
				amounts.push(this.amount);
			})
			//销量报表数据填充
			var qbeOption = {
			    xAxis: {
			        data: types
			    },
			    yAxis: {},
			    series: [{
			        data: nums,
			        type: 'bar'
			    }]
			};
			
			//销售额报表数据填充
			var tbeOption = {
			    xAxis: {
			        data: types
			    },
			    yAxis: {},
			    series: [{
			        data: amounts,
			        type: 'bar'
			    }]
			};
			
			qbeChart.setOption(qbeOption);
			tbeChart.setOption(tbeOption);
		});
		
	</script>
</body>
</html>