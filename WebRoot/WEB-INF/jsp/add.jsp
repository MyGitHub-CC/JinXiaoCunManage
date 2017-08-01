<%@ page language="java" import="java.util.*,bean.*"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'add.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<body>
	<%
		List<BanJi> list = (List<BanJi>) request.getAttribute("bjs");
	%>
	<form action="doAdd" method="post">
		姓名<input type="text" name="stu.name" /> <br /> <br /> 性别<input
			type="text" name="stu.sex" /><br /> <br /> 年龄<input type="text"
			name="stu.age" /><br /> <br /> <input type="submit" value="保存" />
	</form>
</body>
</html>
