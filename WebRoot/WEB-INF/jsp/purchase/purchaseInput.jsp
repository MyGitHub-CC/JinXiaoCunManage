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
				     <td style="width:25px;text-align:center;"><%=i+1 %></td>
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
				    <td class="unit" style="width:50px;"></td>
				    <td class="classify" style="width:60px;"></td>
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
				      <th width="25">ID</th>
				      <th width="120">商品名称</th>
				      <th width="30">单位</th>
					  <th width="30">规格</th>
				      <th width="30">类别</th>
				      <th width="30">库存</th>
				      <th width="50">备注</th>
				    </tr>
				</thead>
				<tbody id="tbody">
					 <%
				    	for(int i = 0; i < products.size(); i++){
				    	Product product = products.get(i);
				     %>
				     <tr data-id="<%=product.getId()%>">
					     <td style="width:80px;"><%=product.getId() %></td>
					     <td class="proId" style="width:100px;">
							 <%=product.getName() %>
					     </td>
						 <td style="width:50px;">
							<%=product.getClassify().getName() %>
						 </td>
						 <td style="width:50px;">
							<%=product.getUnit() %>
						 </td>
						 <td style="width:50px;">
						 	<%=product.getInventory()%>
						 </td>
						 <td style="width:80px;">
							  <%
							  	String note = "无";
							 	if(product.getNote() != null){
							  	note = product.getNote();
							  	} 
							  %>
							 <%=note %>
						 </td>
				     </tr>
				  <% }%>
				</tbody>
			</table>
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
	// 设置进货日期默认为今天
	var mydate = new Date();
	var year = mydate.getFullYear();
	var month = mydate.getMonth()+ 1;
	if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
   	var day = mydate.getDate();
    if (day >= 0 && day <= 9) {
        day = "0" + day;
    }
	var dateStr = year + "-" + month + "-" + day;
	$("#date").val(dateStr);
	// 设置td-input可编辑
	$("#tbody .td-input").attr("contentEditable",true);
	// 点击按钮添加一行
	var tr = "<tr><td class='proId'></td><td class='num td-input'></td>";
	tr += "<td class='price td-input'></td><td></td><td></td><td></td><td></td></tr>";
	$("#add-tr").click(function(){
		$("table").append(tr);
		$(".td-input").attr("contentEditable",true);
	});
	
	$(".proId").dblclick(function(){  
		alert(123);
	});
	// 输入数量和单价，保留两位小数
	$(".td-input2").blur(function(){
		var th = ($(this).text() - 0);
		$(this).text(th.toFixed(2));
		var tr = $(this).parents("tr");
		var num = tr.children(".num").text() - 0;
		var price = tr.children(".price").text() - 0;
		var totalPrice = num * price;
		tr.children(".totalPrice").text(totalPrice.toFixed(2));
		var count = 0;
		$(".totalPrice").each(function(index,element){
			count += $(this).text() - 0;
		});
		$("#count").val(count.toFixed(2));
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
			var proId = $(this).children(".proId").children("[name=proId]").val() - 0;
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
		} else {
			alert("商品不能为空！");
			return;
		}
	});
});
</script>
</body>
</html>