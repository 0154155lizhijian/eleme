<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<title>搜索店铺 - ${address }</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<script type="text/javascript" src="../js/jquery.min.js"></script>
		<link href="../css/bootstrap.css" rel="stylesheet">

		<style type="text/css">
			* {
				margin: 0;
				padding: 0;
			}
			
			.container {
				width: 70%;
			}
			
			#ad {
				margin-left: 50px;
			}
			
			#sh {
				margin-right: 200px;
			}
			
			.rstblock {
				background-color: #fff;
				border-bottom: 1px #f5f5f5 solid;
				width: 25%;
				height: 140px;
			}
			
			.rstblock,
			.rstblock-logo {
				float: left;
				font-size: 12px;
				position: relative;
			}
			
			a,
			ins {
				text-decoration: none;
			}
			
			a {
				color: #0089dc;
			}
			
			.rstblock-content {
				padding: 20px;
			}
			
			.rstblock-logo-icon {
				display: block;
				width: 80px;
				height: 80px;
				margin-bottom: 10px;
				text-shadow: 0 0 black;
			}
			
			.rstblock-title {
				font-size: 16px;
				margin-bottom: 6px;
				font-weight: 600;
				overflow: hidden;
				white-space: nowrap;
				text-overflow: ellipsis;
				color: #333;
			}
			
			.rstblock-cost {
				color: #999;
				height: 50px;
				overflow: hidden;
				word-break: break-all;
				word-wrap: break-word;
				width: 140px;
				/*text-overflow: ellipsis;*/
				margin-top: 3px;
			}
			
			.rstblock-logo {
				padding: 20px;
				color: #999;
				text-align: center;
			}
			
			.rstblock-activity {
				margin-top: 10px;
			}
			
			.shoptytitle {
				left: 40px;
				color: #999;
			}
			
			.shoplist {
				margin: 5px 6px;
			}
			
			

		</style>

	</head>

	<body style="background-color: #F7F7F7;">
		<div class="container-fluid">
			<%@ include file="main.nav.jsp"%> 
			<div style="width: 70%; margin: 0 auto;">

			<div class="row" style="margin-top: 30px;">
				<div class="col-sm-8">
					<p id="ad">当前地址:${address}&nbsp;&nbsp;<a href="../user/index.html">切换地址</a></p>
				</div>
				<div class="col-sm-4">
					<div class="input-group " style="width:300px;height:35px">
					<form action="../goods/searchgoods.html" method="get"  >
						<input type="text" class="form-control " style="width:245px" placeholder="请输入美食 " name="gname"/>
						<span class="input-group-btn ">
               				<button  id="sh " class="btn btn-info btn-search "style="width:55px">查找</button>            
            			</span>
            			</form>
					</div>
				</div>
			</div>

			<div class="row" style="margin-top: 10px;">
				<div class="shoptytitle  col-sm-1">全部分类:</div>
				<div class=" col-sm-11">
				<c:forEach  var="item" items="${shoptypelist}">
				<a href="search.html?address=${address}&shoptype=${item.stname}" style="shoplist">${item. stname}</a>&nbsp;
				</c:forEach>
					
				</div>
			</div>
			<div style="display:inline-block; border:1px solid red; width: 100%; margin-top: 30px;">
			<c:forEach  var="item" items="${shopList}">
				<a href="${item.sid}.html" class="rstblock">
					<div style="overflow: hidden; width: 100%; height: 100%;">
					<div class="rstblock-logo ">
						<img src="https://${item.simage}" width="80 " height="80 " alt="加载失败" class="rstblock-logo-icon " />
						<p></p>
						<p>${item.sstatus}</p>
						<div class="elemeicon elemeicon-premiumsign rstblock-logo-premiumsign "></div>
					</div>
					<div class="rstblock-content ">
						<div class="rstblock-title ">${item.sname}</div>

						<div class="rstblock-cost ">
							地址:${item.saddress}
						</div>
						<div class="rstblock-activity "> <span>电话：${item.stel}</span></div>
					</div>
					</div>
				</a>
				</c:forEach>
			</div>
			<hr />

			<%@ include file="main.footer.jsp"%> 
		</div>
		</div>

	</body>

</html>