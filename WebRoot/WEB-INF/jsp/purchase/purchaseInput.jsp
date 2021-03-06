<%@ page language="java" import="java.util.*,bean.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>采购录入</title>
	<script src="bootstrap/js/jquery.min.js" type="text/javascript"></script>
	<script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" type="text/css"></link>
	<link rel="stylesheet" href="my/myWrite.css" type="text/css"></link>
  </head>
  <%
  	List<Product> products = (List<Product>) request.getAttribute("products");
  	List<Supplier> suppliers = (List<Supplier>) request.getAttribute("suppliers");
  	List<Operator> operators = (List<Operator>) request.getAttribute("operators");
   %>
<body>
  <div class="container" style="width:1100px;">
    <nav class="navbar navbar-default" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand">采购进货单</a>
			</div>
		</div>
	</nav>
	<div class="col-md-12 column">
		<form class="navbar-form navbar-left" role="search">
			<div class="form-group">
				<span class="search-span"> 进货日期:</span> 
				<input type="date" name="date" class="form-control" id="date">
			</div>
			<span class="search-span">供应商:</span> 
			<select name="supplierId" class="form-control">
	        	<option value="0">请选择：</option>
	        	<%for(int i = 0; i < suppliers.size(); i++){
	        	%>
	        	<option value="<%=suppliers.get(i).getId()%>">
	        		<%=suppliers.get(i).getName() %>
	        	</option>
	        	<%} %>
	        </select> 
	        <span class="search-span">经办人:</span> 
			<select name="operatorId" class="form-control">
	        	<option value="0">请选择：</option>
	        	<%for(int i = 0; i < operators.size(); i++){
	        	%>
	        	<option value="<%=operators.get(i).getId()%>">
	        		<%=operators.get(i).getName() %>
	        	</option>
	        	<%} %>
	        </select> 
	        <input type="button" id="submit" class="btn btn-primary" value="保存"/>
		</form>
		<table class="table table-bordered table-hover table-condensed  table-striped" >
			<thead>
			    <tr style="margin:10px;">
			      <th width="25">序号</th>
			      <th width="120">商品名称</th>
			      <th width="30">单位</th>
			      <th width="40">规格 / 品牌</th>
			      <th width="30">数量</th>
			      <th width="30">单价</th>
			      <th width="45">金额</th>
			      <th width="50">备注</th>
			      <th width="50">操作</th>
			    </tr>
			</thead>
			<tbody id="tbody">
				 <%
			    	for(int i = 0; i < 5; i++){
			     %>
			     <tr data-id="<%=i+1%>">
				     <input type="hidden" name="proId" class="proId" value="0" />
				     <td style="width:25px;text-align:center;"><%=i+1 %></td>
				     <td class="proName" style="width:100px;" data-toggle="modal" data-target="#myModal"></td>
				     <td class="proUnit" style="width:50px;"></td>
				     <td class="proClassify" style="width:60px;"></td>
				     <td class="num td-input td-input2" style="width:60px;">0.00</td>
				     <td class="price td-input td-input2" style="width:60px;">0.00</td>
				     <td class="totalPrice" style="width:80px;">0.00</td>
				     <td class="note td-input" style="width:80px;"></td>
				     <td style="width:80px;"><a class="delete-tr">删除</a></td>
			     </tr>
			  <% }%>
			</tbody>
	  </table>
	  <button id="add-tr" type="button" class="btn btn-primary">添加一行</button>  
	  <div class="form-group" style="float:right;width:270px;">
		  <label class="search-label col-sm-3" style="line-height:34px;">总价:</label>
		  <div class="col-sm-9"> 
		  	<input id="count" name="count" class="form-control" readonly="readonly"  />
		  </div>
	  </div>
	</div>
</div>
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close closeModal" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					选择商品
				</h4>
			</div>
			<div class="modal-body">
				<table class="table table-bordered table-hover table-condensed  table-striped" >
				<thead>
				    <tr style="margin:10px;">
				      <th width="70">编号</th>
				      <th width="120">商品名称</th>
				      <th width="40">单位</th>
					  <th width="100">规格 / 品牌</th>
				      <th width="90">当前库存</th>
				      <th width="70">备注</th>
				    </tr>
				</thead>
				<tbody id="tbody">
					 <%
				    	for(int i = 0; i < products.size(); i++){
				    	   Product product = products.get(i);
				     %>
				     <tr data-id="<%=product.getId()%>"  class="selectedPro">
					     <td class="productId"><%=product.getId() %></td>
					     <td class="productName"><%=product.getName() %></td>
						 <td class="productUnit"><%=product.getUnit() %></td>
						 <td class="productClassify"><%=product.getClassifyProduct().getName() %></td>
						 <td class="productInventory"><%=product.getInventory()%></td>
						 <td>
						 	<%String note = "无";if(product.getNote() != null){note = product.getNote();}%>
							<%=note %>
						 </td>
				     </tr>
				  <% }%>
				</tbody>
			</table>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default closeModal" data-dismiss="modal" >关闭</button>
				<button type="button" class="btn btn-primary" id="submit">保存</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
<script src="my/myWrite.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function(){
	var selectedTr = 0;
	$(".proName").click(function(){
		selectedTr = $(this).parents("tr");
	});
	$(".selectedPro").dblclick(function(){ 
		var proId = $(this).children(".productId").text();
		var proName = $(this).children(".productName").text();
		var proUnit = $(this).children(".productUnit").text();
		var proClassify = $(this).children(".productClassify").text();
		selectedTr.children(".proId").val(proId);
		selectedTr.children(".proName").text(proName);
		selectedTr.children(".proUnit").text(proUnit);
		selectedTr.children(".proClassify").text(proClassify);
		$("#myModal").modal("hide");
	});
	// 保存提交
	$("#submit").click(function(){
		var flag = false;
		var supplierId = $("[name=supplierId]").val(); 
		var operatorId = $("[name=operatorId]").val(); 
		if(supplierId > 0 || operatorId > 0){
			flag = true;
		}else{
			alert("供应商或经办人不能为空！");
			return;
		}
		flag = false;
		$("#tbody tr").each(function(index,element){
			var proId = $(this).children(".proId").val();
			if(proId > 0){
				flag = true;
			};
		});
		if(flag){
			var date = $("[name=date]").val(); 
			var supplierId = $("[name=supplierId]").val(); 
			var operatorId = $("[name=operatorId]").val(); 
			var count = $("[name=count]").val(); 
			var purchaseId = 0;
			$.ajax({
				type:"post",
				url:"purchaseAdd",
				data:"purchase.date=" + date + "&purchase.supplier.id=" + supplierId 
					+ "&purchase.operator.id=" + operatorId +"&purchase.count=" + count +"&purchase.jtFlag=0",
				dataType:"text",
				success:function(data){
					purchaseId = data;
					purAndProAdd();
					alert("保存成功！");
					location.href="purchaseManage";
				}
			});
			function purAndProAdd(){
				$("#tbody tr").each(function(index,element){
					var proId = $(this).children(".proId").val();
					var price = $(this).children(".price").text();
					var num = $(this).children(".num").text();
					var totalPrice = $(this).children(".totalPrice").text();
					var note = $(this).children(".note").text();
					if(proId > 0){
						$.ajax({
							type:"post",
							url:"purAndProAdd",
							data:"purAndPro.purchase.id=" + purchaseId +"&purAndPro.num=" + num + "&purAndPro.price=" + price
							+ "&purAndPro.totalPrice=" + totalPrice + "&purAndPro.note=" + note + "&purAndPro.product.id=" + proId,
							dataType:"text",
							success:function(data){
								
							}
						});
					}
				});
			}
		} else {
			alert("商品不能为空！");
			return;
		}
	});
});
</script>
</body>
</html>