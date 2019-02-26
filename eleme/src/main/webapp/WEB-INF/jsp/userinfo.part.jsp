<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<script>


</script>
</head>

				<div class="col-sm-2 modal-content"
					style="display: flex; flex-direction: column; height: 550px;">
					<h3>
						<span class="glyphicon glyphicon-home"></span>&nbsp;个人中心
					</h3>
					<ul class="list-group">
						<a id="a1" href="../orders/showorders.html">
							<li class="list-group-item">订单中心</li>
						</a>
						<h3>
							<span class="glyphicon glyphicon-user"></span>&nbsp;我的资料
						</h3>
						<a id="a2" href="../user/userdetail.html" >
							<li class="list-group-item">个人资料</li>
						</a>
						<a id="a3" href="../user/address.html" >
							<li class="list-group-item">地址管理</li>
						</a>
					</ul>

				</div>

</body>


</html>