<%@ page language="java" import="java.util.*,bean.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>客户管理</title>
	<script src="bootstrap/js/jquery.min.js" type="text/javascript"></script>
	<script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" type="text/css"></link>
	<style>
		#tbody td {
		 overflow:hidden;
		 word-break:break-all;
		}
		.table th {
		    text-align: center;
		}
		.search-span{
		  	margin-left:10px;
		}
	</style>
  </head>
 <%
	List<Customer> customers = (List<Customer>) request.getAttribute("customers");
	Customer customer2 = new Customer();
	customer2.setName("");
	if(request.getAttribute("customer") != null){
		customer2 = (Customer) request.getAttribute("customer");
	}
 %>
<body>
	<form action="customer" method="post" class="form-inline" role="form">
		<div class="form-group">
			<span class="search-span">客户名称：</span>
			<input type="text" name="customer.name" class="form-control" 
			<%if(!"".equals(customer2.getName())){ %> value="<%=customer2.getName() %>" <% } %> />
		</div>
		<div class="form-group">
			<input type="submit" value="查询"  class="btn btn-primary"  style="margin-left:20px;"/>
		</div>
	</form>
	<div class="btn-group" style="margin:10px;" >
		<button class="btn btn-primary" data-toggle="modal" data-target="#myModal">添加客户</button>
	</div>
  <table class="table table-hover text-center table-bordered">
    <tr>
      <th>ID</th>
      <th>客户</th>
      <th>联系人</th>
      <th>联系方式</th>
      <th>备注</th>
      <th>操作</th>
    </tr>
   <%
    for(int i = 0; i < customers.size(); i++){
    	Customer customer = customers.get(i);
     %>
  <tr data-id="<%=customer.getId() %>">
      <td><%=customer.getId() %></td>     
      <td><%=customer.getName() %></td>     
      <td><%=customer.getContact() %></td>     
      <td><%=customer.getPhone() %></td>     
      <td><%=customer.getNote() %></td>     
      <td>
	      <a href="javascript:void(0)" class="modify" data-toggle="modal" data-target="#myModal">修改 </a>
	      <a href="javascript:void(0)" class="delete" >删除</a>
      </td>
    </tr>
    <% } %>
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
					新增客户
				</h4>
			</div>
			<div class="modal-body">
				<form id="updateForm" class="form-horizontal" role="form">
					<input type="hidden" name="customer.id" id="cusId" value="0" />
					<input type="hidden" name="customer.del" id="cusDel" value="0" />
					<div class="form-group">
						<label class="col-sm-3 control-label">客户名称</label>
						<div class="col-sm-8">
							<input type="text" name="customer.name" class="form-control" id="cusName"/>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">联系人</label>
						<div class="col-sm-8">
							<input type="text" name="customer.contact" class="form-control" id="cusContact" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">联系电话</label>
						<div class="col-sm-8">
							<input type="text" name="customer.phone" class="form-control" id="cusPhone" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">备注</label>
						<div class="col-sm-8">
							<textarea name="customer.note" class="form-control" id="cusNote" ></textarea>
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
			url:"customerById",
			data:"customer.id="+selected,
			dataType:"json",
			success: function(data){
				$.each(data,function(index, element){
					$("#myModalLabel").text("修改客户信息");
					$("#cusId").val(element.id);
					$("#cusName").val(element.name);
					$("#cusContact").val(element.contact);
					$("#cusPhone").val(element.phone);
					$("#cusNote").text(element.note);
				});
			}
		});
	});
	$("#submit").click(function(){
		var cusId = $("#cusId").val();
		var obj = "Add";
		if(cusId > 0){
			obj = "Modify";
		}
		$.ajax({
			type:"post",
			url:"customer" + obj,
			data:$("#updateForm").serialize(),
			dataType:"text",
			success: function(data){
				alert(data);
				if(data == "保存成功！"){
					window.location.href="customer";
				}
			}
		});
	});
	$(".delete").click(function(){
		if(confirm("是否确认删除")){
			var selected = $(this).parents("tr").attr("data-id");
			$.ajax({
				type:"post",
				url:"customerDelete",
				data:"customer.id="+selected,
				dataType:"text",
				success: function(data){
					alert(data);
					if(data == "删除成功！"){
						location.href = "customer";
					}
				}
			});
		}
	});
	$(".closeModal").click(function(){
		location.href = "customer";
	});
});
</script>
</body>
</html>
