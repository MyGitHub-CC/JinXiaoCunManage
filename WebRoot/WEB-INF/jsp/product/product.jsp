<%@ page language="java" import="java.util.*,bean.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>商品资料</title>
    <script src="bootstrap/js/jquery.min.js" type="text/javascript"></script>
	<script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" type="text/css"></link>
	<link rel="stylesheet" href="my/myWrite.css" type="text/css"></link>
  </head>
  <%
  	List<Product> products = (List<Product>) request.getAttribute("products");
    List<ClassifyProduct> classifyProducts = (List<ClassifyProduct>) request.getAttribute("classifyProducts");
   	Product product2 = new Product() ;
      if(request.getAttribute("product") != null){
    		product2 = (Product) request.getAttribute("product");
    	}
  %>
  <body>
  	<form action="product" method="post" class="form-inline" role="form">
		<div class="form-group">
			<span class="search-span">商品名称：</span>
			<input type="text" name="product.name" class="form-control" 
			<%if(product2.getName() != null && product2.getName() != ""){%>value="<%=product2.getName()%>"<% } %> />
		</div>
		<div class="form-group">
			<input type="submit" value="查询"  class="btn btn-primary"  style="margin-left:20px;"/>
		</div>
	</form>
	<div class="btn-group" style="margin:10px;" >
		<button class="btn btn-primary" data-toggle="modal" data-target="#myModal">添加商品</button>
	</div>
   	<table class="table table-bordered table-hover table-condensed  table-striped" >
		<thead>
		    <tr style="margin:10px;">
		      <th>ID</th>
		      <th>商品名称</th>
		      <th>单位</th>
			  <th>规格 / 品牌</th>
		      <th>库存</th>
		      <th>备注</th>
		      <th>操作</th>
		    </tr>
		</thead>
		<tbody id="tbody">
			 <%
		    	for(int i = 0; i < products.size(); i++){
		    	   Product product = products.get(i);
		     %>
		     <tr data-id="<%=product.getId()%>">
			     <td><%=product.getId() %></td>
			     <td><%=product.getName() %></td>
				 <td><%=product.getUnit() %></td>
				 <td><%=product.getClassifyProduct().getName()  %></td>
				 <td><%=product.getInventory()%></td>
				 <td>
					 <%
					  	String note = "无";
					 	if(product.getNote() != null){note = product.getNote();} 
					  %>
					 <%=note %>
				 </td>
				 <td style="width:80px;">
					 <a href="javascript:void(0)" class="modify" data-toggle="modal" data-target="#myModal">修改 </a>
    				 <a href="javascript:void(0)" class="delete" >删除</a>
				 </td>
		     </tr>
		  <% }%>
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
						新增商品
					</h4>
				</div>
				<div class="modal-body">
					<form id="updateForm" class="form-horizontal" role="form">
						<input type="hidden" name="product.id" id="proId" value="0" />
						<input type="hidden" name="product.del" id="proDel" value="0" />
						<div class="form-group">
							<label class="col-sm-3 control-label">商品名称</label>
							<div class="col-sm-8">
								<input type="text" name="product.name" class="form-control" id="proName"/>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">商品类别</label>
							<div class="col-sm-8">
								<select name="product.classifyProduct.id" class="form-control" id="proClassify">
						        	<option value="0">请选择：</option>
						        	<%for(int i = 0; i < classifyProducts.size(); i++){
						        	%>
						        	<option value="<%=classifyProducts.get(i).getId()%>">
						        		<%=classifyProducts.get(i).getName()%>
						        	</option>
						        	<%} %>
						        </select> 
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">库存</label>
							<div class="col-sm-8">
								<input type="text" name="product.Inventory" readonly="readonly"  class="form-control" id="proInventory" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">备注</label>
							<div class="col-sm-8">
								<textarea name="product.note" class="form-control" id="proNote" ></textarea>
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
			url:"productById",
			data:"product.id="+selected,
			dataType:"json",
			success: function(data){
				$.each(data,function(index, element){
					$("#myModalLabel").text("修改商品信息");
					$("#proId").val(element.id);
					$("#proName").val(element.name);
					$("#proClassify").val(element.classify.id);
					$("#proInventory").val(element.inventory);
					$("#proNote").text(element.note);
				});
			}
		});
	});
	$("#submit").click(function(){
		var proId = $("#proId").val();
		var obj = "Add";
		if(proId > 0){
			obj = "Modify";
		}
		$.ajax({
			type:"post",
			url:"product" + obj,
			data:$("#updateForm").serialize(),
			dataType:"text",
			success: function(data){
				alert(data);
				if(data == "保存成功！"){
					window.location.href="product";
				}
			}
		});
	});
	$(".delete").click(function(){
		if(confirm("是否确认删除")){
			var selected = $(this).parents("tr").attr("data-id");
			$.ajax({
				type:"post",
				url:"productDelete",
				data:"product.id="+selected,
				dataType:"text",
				success: function(data){
					alert(data);
					if(data == "删除成功！"){
						location.href = "product";
					}
				}
			});
		}
	});
	$(".closeModal").click(function(){
		location.href = "product";
	});
});
</script>
  </body>
</html>
