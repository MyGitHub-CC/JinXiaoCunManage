<%@ page language="java" import="java.util.*,bean.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>采购退货</title>
	<script src="bootstrap/js/jquery.min.js" type="text/javascript"></script>
	<script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" type="text/css"></link>
	<style>
		#tbody td {
		 overflow:hidden;
		 word-break:break-all;
		}
	</style>
  </head>
  <%
  	List<Product> products = (List<Product>) request.getAttribute("products");
  	List<Supplier> suppliers = (List<Supplier>) request.getAttribute("suppliers");
  	List<Operator> operators = (List<Operator>) request.getAttribute("operators");
   %>
<body>
  <div class="container" style="width:1100px;">
	<div class="col-md-12 column">
		<form class="navbar-form navbar-left" role="search">
			<div class="form-group">
				<span class="search-span"> 退货日期:</span> 
				<input type="date" name="date" class="form-control" >
			</div>
			<span class="search-span"> 供应商:</span> 
			<select name="supplierId" class="form-control">
	        	<option value="0">请选择：</option>
	        	<%for(int i = 0; i < suppliers.size(); i++){
	        	%>
	        	<option value="<%=suppliers.get(i).getId()%>">
	        		<%=suppliers.get(i).getName() %>
	        	</option>
	        	<%} %>
	        </select> 
	        <span class="search-span"> 经办人:</span> 
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
		<table class="table table-bordered table-hover table-condensed  table-striped" +9+>
			<thead>
			    <tr style="margin:10px;">
			      <th width="25">ID</th>
			      <th width="120">商品名称</th>
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
				     <td style="width:80px;"><%=i+1 %></td>
				     <td class="proId" style="width:100px;">
					     <select name="proId" class="form-control" style="width:100%;height:100%;">
				        	<option value="0">请选择：</option>
				        	<%
				        		for(int j = 0; j < products.size(); j++){
				        	%>
				        	<option value="<%=products.get(j).getId()%>">
				        		<%=products.get(j).getName() %>
				        	</option>
				        	<%} %>
				        </select> 
			        </td>
				    <td class="num td-input" style="width:80px;"></td>
				    <td class="price td-input" style="width:80px;"></td>
				    <td class="totalPrice" style="width:80px;"></td>
				    <td class="note td-input" style="width:80px;"></td>
				    <td style="width:80px;"> </td>
			     </tr>
			  <% }%>
			</tbody>
		</table>
	  <button id="add-tr" type="button" class="btn btn-primary">添加一行</button>  
	  <div class="form-group" style="float:right;width:270px;">
		  <label class="search-label col-sm-3" style="line-height:34px;">总价:</label>
		  <div class="col-sm-9"> 
		  	<input id="count" name="count" class="form-control" />
		  </div>
	  </div>
	</div>
</div>
<script type="text/javascript">
$().ready(function(){
	// td可编辑
	$("#tbody .td-input").attr("contentEditable",true);
	// 点击添加一行
	var tr = "<tr><td  class='proId'></td><td class='num td-input'></td>";
	tr += "<td class='price td-input'></td><td></td><td></td><td></td><td></td></tr>";
	$("#add-tr").click(function(){
		$("table").append(tr);
		$(".td-input").attr("contentEditable",true);
	});
	
	$(".td-input").blur(function(){
		var tr = $(this).parents("tr");
		var num = tr.children(".num").text() - 0;
		var price = tr.children(".price").text() - 0;
		var totalPrice = num * price;
		tr.children(".totalPrice").text(totalPrice);
		var count = 0;
		$(".totalPrice").each(function(index,element){
			count += $(this).text() - 0;
		});
		$("#count").val(count);
	});
	
	$("#submit").click(function(){
		var date = $("[name=date]").val(); 
		var supplierId = $("[name=supplierId]").val(); 
		var operatorId = $("[name=operatorId]").val(); 
		var count = $("[name=count]").val(); 
		var purchaseId = 0;
		$.ajax({
			type:"post",
			url:"purchaseAdd",
			data:"purchase.date=" + date + "&purchase.supplier.id=" + supplierId 
				+ "&purchase.operator.id=" + operatorId +"&purchase.count=" + count ,
			dataType:"text",
			success:function(data){
				purchaseId = data;
				purAndProAdd();
			}
		});
		function purAndProAdd(){
			$("#tbody tr").each(function(index,element){
				var proId = $(this).children(".proId").children("[name=proId]").val();
				var price = $(this).children(".price").text();
				var num = $(this).children(".num").text();
				var totalPrice = $(this).children(".totalPrice").text();
				var note = $(this).children(".note").text();
				if(proId != 0){
					$.ajax({
						type:"post",
						url:"purAndProAdd",
						data:"purAndPro.purchase.id=" + purchaseId +"&purAndPro.num=" + num + "&purAndPro.price=" + price 
						+ "&purAndPro.totalPrice=" + totalPrice + "&purAndPro.note=" + note + "&purAndPro.product.id=" + proId,
						dataType:"text",
						success:function(data){
							alert(data);
						}
					});
				}
			});
		}
	});
});
</script>
</body>
</html>