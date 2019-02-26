<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<link href="<%=basePath %>css/bootstrap.css" rel="stylesheet">
<script src="<%=basePath %>js/jquery-1.10.2.js"></script>
<link href="<%=basePath %>css/login.css" rel="stylesheet" />