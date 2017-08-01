<%@ page language="java" import="java.util.*,bean.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>经办人管理</title>
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
	List<Operator> operators = (List<Operator>) request.getAttribute("operators");
	Operator operator2 = new Operator();
	operator2.setName("");
	if(request.getAttribute("operator") != null){
		operator2 = (Operator) request.getAttribute("operator");
	}
 %>
<body>
	<form action="operator" method="post" class="form-inline" role="form">
		<div class="form-group">
			<span class="search-span">经办人名称：</span>
			<input type="text" name="operator.name" class="form-control" 
			<%if(!"".equals(operator2.getName())){ %> value="<%=operator2.getName() %>" <% } %> />
		</div>
		<div class="form-group">
			<input type="submit" value="查询"  class="btn btn-primary"  style="margin-left:20px;"/>
		</div>
	</form>
	<div class="btn-group" style="margin:10px;" >
		<button class="btn btn-primary" data-toggle="modal" data-target="#myModal">添加经办人</button>
	</div>
  <table class="table table-hover text-center table-bordered">
    <tr>
      <th>ID</th>
      <th>经办人</th>
      <th>联系方式</th>
      <th>操作</th>
    </tr>
   <%
    for(int i = 0; i < operators.size(); i++){
    	Operator operator = operators.get(i);
     %>
  <tr data-id="<%=operator.getId() %>">
      <td><%=operator.getId() %></td>     
      <td><%=operator.getName() %></td>     
      <td><%=operator.getPhone() %></td>     
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
					新增经办人
				</h4>
			</div>
			<div class="modal-body">
				<form id="updateForm" class="form-horizontal" role="form">
					<input type="hidden" name="operator.id" id="opeId" value="0" />
					<input type="hidden" name="operator.del" id="opeDel" value="0" />
					<div class="form-group">
						<label class="col-sm-3 control-label">经办人姓名：</label>
						<div class="col-sm-8">
							<input type="text" name="operator.name" class="form-control" id="opeName"/>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">联系电话：</label>
						<div class="col-sm-8">
							<input type="text" name="operator.phone" class="form-control" id="opePhone" />
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
			url:"operatorById",
			data:"operator.id="+selected,
			dataType:"json",
			success: function(data){
				$.each(data,function(index, element){
					$("#myModalLabel").text("修改经办人信息");
					$("#opeId").val(element.id);
					$("#opeName").val(element.name);
					$("#opePhone").val(element.phone);
				});
			}
		});
	});
	$("#submit").click(function(){
		var opeId = $("#opeId").val();
		var obj = "Add";
		if(opeId > 0){
			obj = "Modify";
		}
		$.ajax({
			type:"post",
			url:"operator" + obj,
			data:$("#updateForm").serialize(),
			dataType:"text",
			success: function(data){
				alert(data);
				if(data == "保存成功！"){
					window.location.href="operator";
				}
			}
		});
	});
	$(".delete").click(function(){
		if(confirm("是否确认删除")){
			var selected = $(this).parents("tr").attr("data-id");
			$.ajax({
				type:"post",
				url:"operatorDelete",
				data:"operator.id="+selected,
				dataType:"text",
				success: function(data){
					alert(data);
					if(data == "删除成功！"){
						location.href = "operator";
					}
				}
			});
		}
	});
	$(".closeModal").click(function(){
		location.href = "operator";
	});
});
</script>
</body>
</html>
