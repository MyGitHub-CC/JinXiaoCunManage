<%@ page language="java" import="java.util.*,bean.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>登录界面</title>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
<script src="bootstrap/js/jquery.min.js" type="text/javascript"></script>
<script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>

</head>

<body>
	<div style="width:600px;margin:10px auto">
		<form action="doLogin" method="post">
			<input type="text" name="user.username" /><br/><br/>
			<input type="text" name="user.password" /><br/><br/>
			<input type="submit" value="登录" />
		</form>
	</div>
</body>
</html>
