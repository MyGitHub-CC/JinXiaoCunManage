<%@ page language="java" import="java.util.*,bean.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
   	<title>客户分类</title>
    <script src="bootstrap/js/jquery.min.js" type="text/javascript"></script>
	<script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" type="text/css"></link>
	<link rel="stylesheet" href="my/myWrite.css" type="text/css"></link>
  </head>
  <%
  	List<ClassifyCustomer> classifyCustomers = (List<ClassifyCustomer>) request.getAttribute("classifyCustomers");
  %>
  <body>
  	<form action="classifyCustomer" method="post" class="form-inline" role="form">
		<div class="form-group">
			<span class="search-span">分类名称：</span>
			<input type="text" name="classifyCustomer.name" class="form-control" />
		</div>
		<div class="form-group">
			<input type="submit" value="查询"  class="btn btn-primary"  style="margin-left:20px;"/>
		</div>
	</form>
	<div class="btn-group" style="margin:10px;" >
			<button class="btn btn-primary" data-toggle="modal" data-target="#myModal">添加分类</button>
	</div>
   	<table class="table table-bordered table-hover table-condensed  table-striped" >
		<thead>
		    <tr style="margin:10px;">
		      <th>ID</th>
		      <th>名称</th>
		      <th>操作</th>
		    </tr>
		</thead>
		<tbody id="tbody">
		<% for(int i = 0; i < classifyCustomers.size(); i++){ %>
		     <tr data-id="<%=classifyCustomers.get(i).getId() %>">
			     <td><%=classifyCustomers.get(i).getId() %></td>
			     <td><%=classifyCustomers.get(i).getName() %></td>
				 <td>
					 <a href="javascript:void(0)" class="modify" data-toggle="modal" data-target="#myModal">修改 </a>
    				 <a href="javascript:void(0)" class="delete" >删除</a>
				 </td>
		     </tr>
		 <% } %>
		</tbody>
	</table>
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close closeModal" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					新增分类
				</h4>
			</div>
			<div class="modal-body">
				<form id="updateForm" class="form-horizontal" role="form">
					<input type="hidden" name="classifyCustomer.id" id="claId" value="0" />
					<input type="hidden" name="classifyCustomer.del" id="claDel" value="0" />
					<div class="form-group">
						<label class="col-sm-3 control-label">分类名称</label>
						<div class="col-sm-8">
							<input type="text" name="classifyCustomer.name" class="form-control" id="claName"/>
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default closeModal" data-dismiss="modal" >关闭</button>
				<button type="button" class="btn btn-primary" id="submit">
					保存
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
<script type="text/javascript">
$().ready(function(){
	$(".modify").click(function(){
		var selected = $(this).parents("tr").attr("data-id");
		$.ajax({
			type:"post",
			url:"classifyCustomerById",
			data:"classifyCustomer.id="+selected,
			dataType:"json",
			success: function(data){
				$.each(data,function(index, element){
					$("#myModalLabel").text("修改分类名称");
					$("#claId").val(element.id);
					$("#claName").val(element.name);
				});
			}
		});
	});
	$("#submit").click(function(){
		var calId = $("#claId").val();
		var obj = "Add";
		if(calId > 0){
			obj = "Modify";
		}
		$.ajax({
			type:"post",
			url:"classifyCustomer" + obj,
			data:$("#updateForm").serialize(),
			dataType:"text",
			success: function(data){
				alert(data);
				if(data == "保存成功！"){
					window.location.href="classifyCustomer";
				}
			}
		});
	});
	$(".delete").click(function(){
		if(confirm("是否确认删除")){
			var selected = $(this).parents("tr").attr("data-id");
			$.ajax({
				type:"post",
				url:"classifyCustomerDelete",
				data:"classifyCustomer.id="+selected,
				dataType:"text",
				success: function(data){
					alert(data);
					if(data == "删除成功！"){
						location.href = "classifyCustomer";
					}
				}
			});
		}
	});
	$(".closeModal").click(function(){
		location.href = "classifyCustomer";
	});
});
</script>
  </body>
