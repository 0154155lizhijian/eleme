<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>用户登录</title>
<!-- Bootstrap -->
<link href="../css/bootstrap.css" rel="stylesheet">
<script src="../js/jquery-1.10.2.js"></script>
<link href="../css/login.css" rel="stylesheet" />
<script type="text/javascript">
    	var msg = '${loginmsg}';
    	if(msg!=""&&msg!=undefined){
    		alert(msg);
    	}
</script>
</head>
<body>
	<%@ include file="main.nav.jsp"%>
	<div id="logo">
		<img src="../images/logo.jpg" width="200px" />
	</div>
	<div class="container">
		<div class="col-md-4 col-md-offset-4">
			<form class='form-login' action="../comment/add.html" method="post">
				<h2 class="text-center" id="welcome">评论订单</h2>

				<div class="form-group">
					<label for="ccontent">评论内容:</label>
					<textarea 
						name="ccontent" id="ccontent" class="form-control"
						required rows="3" cols="20">
					</textarea>
				</div>
				
				<div class="form-group">
					<label for="ccontent">评分:</label> 
					<input type="radio" checked="checked" name="cgrade" value="1" />1
					<input type="radio" checked="checked" name="cgrade" value="2" />2
					<input type="radio" checked="checked" name="cgrade" value="3" />3
					<input type="radio" checked="checked" name="cgrade" value="4" />4
					<input type="radio" checked="checked" name="cgrade" value="5" />5
				</div>
				
				<input type="hidden"
					name="oid" id="oid" maxlength="20"
					class="form-control" value="${commentoid}" />
				<input type="hidden"
					name="uid" id="uid" maxlength="20"
					class="form-control" value="${user.uid}" />
				<button type="reset" class="btn btn-default pull-left">重置</button>
				<button type="submit" class="btn btn-primary pull-right">提交</button>
			</form>
		</div>
	</div>
</body>
</html>