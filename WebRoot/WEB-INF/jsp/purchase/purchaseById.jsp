<%@ page language="java" import="java.util.*,bean.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>显示采购单详情</title>
	<script src="bootstrap/js/jquery.min.js" type="text/javascript"></script>
	<script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" type="text/css"></link>
	<link rel="stylesheet" href="my/myWrite.css" type="text/css"></link>
  </head>
  <%
  	Purchase purchase = (Purchase) request.getAttribute("purchase");
	Set<PurAndPro> purAndPros = purchase.getPurAndPros();
	String jtFlag = "采购";
	if(purchase.getJtFlag() > 0){
		jtFlag = "退货";
	}
  %>
<body>
  <div class="container" style="width:1100px;">
	<div class="col-md-12 column">
		<form class="navbar-form navbar-left" role="search">
			<div class="form-group">
				<span class="search-span"> <%=jtFlag %>日期:</span> 
				<input type="date" name="date" class="form-control"  value="<%=purchase.getDate() %>" />
			</div>
			<span class="search-span"> 供应商:</span> 
			<select name="supplierId" class="form-control">
	        	<option value="0">
	        		<%=purchase.getSupplier().getName() %>
	        	</option>
	        </select> 
	        <span class="search-span"> 经办人:</span> 
			<select name="operatorId" class="form-control">
	        	<option value="0">
	        		<%=purchase.getOperator().getName() %>
	        	</option>
	        </select> 
			<input type="button"  id="submit" class="btn btn-primary" value="保存" />
		</form>
		<table class="table table-bordered table-hover table-condensed  table-striped" >
			<thead>
			    <tr style="margin:10px;">
			      <th width="25">ID</th>
			      <th width="120">商品名称</th>
			      <th width="30">单位</th>
			      <th width="40">规格 / 品牌</th>
			      <th width="30">数量</th>
			      <th width="30">单价</th>
			      <th width="45">金额</th>
			      <th width="100">备注</th>
			      <th width="50">操作</th>
			    </tr>
			</thead>
			<tbody id="tbody">
				 <%
				  	for(PurAndPro purAndPro : purAndPros){
			     %>
			     <tr data-id="<%=purAndPro.getId()%>">
				    <td><%=purAndPro.getId() %></td>
				    <td><%=purAndPro.getProduct().getName() %></td>
				    <td><%=purAndPro.getProduct().getUnit() %></td>
				    <td><%=purAndPro.getProduct().getClassifyProduct().getName() %></td>
				    <td class="td-input2"><%=purAndPro.getNum() %></td>
				    <td class="td-input2"><%=purAndPro.getPrice() %></td>
				    <td class="td-input2"><%=purAndPro.getTotalPrice() %></td>
				    <td><%=purAndPro.getNote() %></td>
				    <td> </td>
			     </tr>
			  <% } %>
			</tbody>
		</table>
	  <button id="add-tr" type="button" class="btn btn-primary">添加一行</button>  
	  <div class="form-group" style="float:right;width:270px;">
		  <label class="search-label col-sm-3" style="line-height:34px;">总价:</label>
		  <div class="col-sm-9"> 
		  	<input id="count" name="count" class="form-control" readonly="readonly"  value="<%=purchase.getCount() %>" />
		  </div>
	  </div>
	</div>
</div>
<script type="text/javascript">
$().ready(function(){
	$(".td-input2").each(function(index,element){
		$(this).text(($(this).text() - 0).toFixed(2));
	});
	$("#count").val(($("#count").val()-0).toFixed(2));
});
</script>
</body>
</html>