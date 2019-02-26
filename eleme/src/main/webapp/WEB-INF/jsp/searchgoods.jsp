<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript" src="../js/jquery.min.js"></script>
<link href="../css/bootstrap.css" rel="stylesheet">

<title></title>
</head>
<body>
	<div class="container-fluid">
		<%@ include file="main.nav.jsp"%>
		<div style="width: 60%; margin: 0 auto;">
			<div class="row">

				<c:forEach var="item" items="${goodsList }">

					<c:forEach var="goodsType" items="${goodsTypeList }">
						<c:if test="${goodsType.gtid eq item.gtid}">
							<c:forEach var="Shop" items="${searchShopList}">
								<c:if test="${goodsType.sid eq Shop.sid}">
									<div class="col-sm-3"
										style="height: 180px; border: 1px solid #1e89e0; margin: 10px 10px;">
										<a href="../shop/${Shop.sid}.html" target="_blank ">
											<p style="overflow: hidden; word-break: break-all; word-wrap: break-word; width: 100%;">
												${Shop.sname}
											</p>
										</a> 
										<img src="https://${item.gimage}" width="110px" height="110px" alt="加载失败" />
										<p>${item.gname}</p>
										</div>
								</c:if>
			
			</c:forEach>

			</c:if>
			</c:forEach>
			</c:forEach>
		</div>
			<%@ include file="main.footer.jsp"%>
		</div>
	</div>
</body>
</html>