<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<!-- Bootstrap -->
<jsp:include page="/part/manager.css.jsp"></jsp:include>
<script src="https://cdn.bootcss.com/simplecartjs/3.0.5/simplecart.min.js"></script>
<style>
table{
	border-collapse:collapse;
}
table,table tr th, table tr td { border:1px solid #0094ff; }
</style>
<title>${shop.sname }-欢迎光临</title>
<script>
	if("${shop.sid}" != "${cherkoutshop.sid}"){
		simpleCart.empty();
	}
</script>
</head>
<body style="background: #f7f7f7">
	<div class="container-fluid">
	<%@ include file="main.nav.jsp"%>
		<jsp:include page="/part/manager.header.jsp"></jsp:include>
		<div class="row">
			<div class="col-lg-2 "></div>
			<div class="col-lg-6">
				<div class="well well-lg">
					<ul class="nav nav-tabs">
						<c:forEach var="goodstype" items="${goodsTypeList}">
							<li role="presentation"><a href="#gt${goodstype.gtid}">
									${goodstype.gtname} </a></li>
						</c:forEach>
					</ul>
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
			</div>
		</div>

		<div class="row">
			<div class="col-lg-2"></div>
			<div class="col-lg-6">
				<c:forEach var="goodstype" items="${goodsTypeList}">
					<div id="gt${goodstype.gtid}" class="goodslist">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3 class="panel-title">${goodstype.gtname}</h3>
							</div>
							<div class="panel-body">
								<c:forEach var="goods" items="${goodsList}">
									<c:if test="${goods.gtid == goodstype.gtid}">
										<div class="goods well simpleCart_shelfItem"
											id="${goods.gid }"
											style="position: relative; float: left; margin-left: 2%; margin-bottom: 2%; margin-right: 2%; padding-right: 10px; width: 46%; height: 174px">
											<span class="item_gid" style="display:none">${goods.gid}</span>
											<div class="row">
												<div class="col-xs-3">
													<img src="https:${goods.gimage}" class="img-rounded"
														width="100px" height="100px">
												</div>
												<div class="col-xs-7 col-xs-offset-1">
													<p class="item_name"
														style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis; font-size: 18px; font-weight: bold">${goods.gname}</p>

													<p
														style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis; font-size: 12px; color: #999">${goods.ginfo}</p>

													<span class="item_price"
														style="color: red; font-weight: bolder">￥${goods.gprice}&nbsp;&nbsp;</span>
													<span style="color: blue">已售出 ${goods.gcount} 份</span>
												</div>
											</div>
											<input
												style="float: right; background-color: #0089dc; color: white; border-radius: 25px;"
												class="btn btn-default item_add" type="submit" value="加入购物车">
										</div>
									</c:if>
								</c:forEach>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="col-lg-2">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title">商家公告</h3>
					</div>
					<div class="panel-body">${shop.sinfo}</div>
				</div>
			</div>
		</div>
		<div class="cartBox" style="position: fixed; right: 0; bottom: 0;">
			<div class="simpleCart_items">
				<!--数据加载前显示的内容 开始-->
				<div style="text-align: center;">购物车数据加载中...请稍待.</div>
				<!--数据加载前显示的内容 结束-->
			</div>

			<div class="simpleCart_total_div">
			<a  href = “javascript：;”  class = “simpleCart_empty” > </a>
				 合计：<span class="simpleCart_total"></span>
				 <c:if test="${user!= null }">
				 <a href="javascript:;" style="float:right" id="cherkout">前去结账</a>
				 </c:if>
			</div>
		</div>
	</div>
	<script>
		simpleCart({
			//Setting the Cart Columns for the sidebar cart display.
			cartColumns : [
			//id of the item
			{
				attr:"gid",
				label:"商品id"
			},
			//Name of the item
			{
				attr : "name",
				label : "商品名称"
			},
			//Quantity displayed as an input
			{
				attr : "quantity",
				label : "数量",
				view : "input"
			},
			//Price of item
			{
				attr : "price",
				label : "单价",
			},
			//Subtotal of that row (quantity of that item * the price)
			{
				attr : "total",
				label : "小计",
				view : "currency"
			},
			//Built in view for a remove link
			{
				view : "remove",
				text : "删除",
				label : false
			}
			],
			cartStyle : "table",
			currency: "JPY",
		});
		$(function(){
			$("#cherkout").click(function () {
                var ids = "";//id编号
                var sid = ${shop.sid}
                var quantitys = "";//数量
                var url = "../orders/cherkout.html";
                simpleCart.each(function (item) {
                    ids += item.get("gid") + ",";
                    quantitys += item.get("quantity") + ",";
                })
                if(ids!=""){ 
                console.log(ids);
                console.log(quantitys)
                $.post(url,{ids: ids, sid: sid, quantitys: quantitys}, function (data) {
                     location.href="../orders/showcherkout.html"
                });
                }
                else{
                	alert("购物车为空！请添加商品...");
                }
            });
		})
	</script>
</body>
</html>