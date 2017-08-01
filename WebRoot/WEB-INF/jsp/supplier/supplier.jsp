<%@ page language="java" import="java.util.*,bean.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>供应商管理</title>
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
	List<Supplier> suppliers = (List<Supplier>) request.getAttribute("suppliers");
	Supplier supplier2 = new Supplier();
	supplier2.setName("");
	if(request.getAttribute("supplier") != null){
		supplier2 = (Supplier) request.getAttribute("supplier");
	}
 %>
<body>
	<form action="supplier" method="post" class="form-inline" role="form">
		<div class="form-group">
			<span class="search-span">供应商名称：</span>
			<input type="text" name="supplier.name" class="form-control" 
			<%if(!"".equals(supplier2.getName())){ %> value="<%=supplier2.getName() %>" <% } %> />
		</div>
		<div class="form-group">
			<input type="submit" value="查询"  class="btn btn-primary"  style="margin-left:20px;"/>
		</div>
	</form>
	<div class="btn-group" style="margin:10px;" >
		<button class="btn btn-primary" data-toggle="modal" data-target="#myModal">添加供应商</button>
	</div>
  <table class="table table-hover text-center table-bordered">
    <tr>
      <th>ID</th>
      <th>供应商</th>
      <th>联系人</th>
      <th>联系方式</th>
      <th>备注</th>
      <th>操作</th>
    </tr>
   <%
    for(int i = 0; i < suppliers.size(); i++){
    	Supplier supplier = suppliers.get(i);
     %>
  <tr data-id="<%=supplier.getId() %>">
      <td><%=supplier.getId() %></td>     
      <td><%=supplier.getName() %></td>     
      <td><%=supplier.getContact() %></td>     
      <td><%=supplier.getPhone() %></td>     
      <td><%=supplier.getNote() %></td>     
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
					新增供货商
				</h4>
			</div>
			<div class="modal-body">
				<form id="updateForm" class="form-horizontal" role="form">
					<input type="hidden" name="supplier.id" id="supId" value="0" />
					<input type="hidden" name="supplier.del" id="supDel" value="0" />
					<div class="form-group">
						<label class="col-sm-3 control-label">供应商名称</label>
						<div class="col-sm-8">
							<input type="text" name="supplier.name" class="form-control" id="supName"/>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">联系人</label>
						<div class="col-sm-8">
							<input type="text" name="supplier.contact" class="form-control" id="supContact" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">联系电话</label>
						<div class="col-sm-8">
							<input type="text" name="supplier.phone" class="form-control" id="supPhone" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">备注</label>
						<div class="col-sm-8">
							<textarea name="supplier.note" class="form-control" id="supNote" ></textarea>
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default closeModal" data-dismiss="modal">关闭</button>
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
			url:"supplierById",
			data:"supplier.id="+selected,
			dataType:"json",
			success: function(data){
				$.each(data,function(index, element){
					$("#myModalLabel").text("修改供应商信息");
					$("#supId").val(element.id);
					$("#supName").val(element.name);
					$("#supContact").val(element.contact);
					$("#supPhone").val(element.phone);
					$("#supNote").text(element.note);
				});
			}
		});
	});
	$("#submit").click(function(){
		var supId = $("#supId").val();
		var obj = "Add";
		if(supId > 0){
			obj = "Modify";
		}
		$.ajax({
			type:"post",
			url:"supplier" + obj,
			data:$("#updateForm").serialize(),
			dataType:"text",
			success: function(data){
				alert(data);
				if(data == "保存成功！"){
					window.location.href="supplier";
				}
			}
		});
	});
	$(".delete").click(function(){
		if(confirm("是否确认删除")){
			var selected = $(this).parents("tr").attr("data-id");
			$.ajax({
				type:"post",
				url:"supplierDelete",
				data:"supplier.id="+selected,
				dataType:"text",
				success: function(data){
					alert(data);
					if(data == "删除成功！"){
						location.href = "supplier";
					}
				}
			});
		}
	});
	$(".closeModal").click(function(){
		location.href = "supplier";
	});
});
</script>
</body>
</html>
