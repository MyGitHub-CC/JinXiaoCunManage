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

<title>My JSP 'stus.jsp' starting page</title>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
<script src="bootstrap/js/jquery.min.js" type="text/javascript"></script>
<script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>

</head>

<body>
	<%
		List<Student> list = (List<Student>) request.getAttribute("list");
	%>
	<div style="width:600px;margin:10px auto">
		<table class="table table-bordered">
			<tr>
				<th>id</th>
				<th>姓名</th>
				<th>性别</th>
				<th>年龄</th>
				<th>班级</th>

			</tr>
			<%
				for (int i = 0; i < list.size(); i++) {
			%>
			<tr>
				<td><%=list.get(i).getId()%></td>
				<td><%=list.get(i).getName()%></td>
				<td><%=list.get(i).getSex()%></td>
				<td><%=list.get(i).getAge()%></td>
				<td>
					<%
						BanJi bj = list.get(i).getBanji();
							if (bj != null) {
								out.print(bj.getName());
							}
					%>
				</td>

			</tr>
			<%
				}
			%>
		</table>
		<a href="showAdd">增加</a>

	</div>
</body>
</html>
