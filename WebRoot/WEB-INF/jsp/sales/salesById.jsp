<%@ page language="java" import="java.util.*,bean.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>显示销售单详情</title>
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
  	Sales sales = (Sales) request.getAttribute("sales");
  	Set<SalAndPro> salAndPros = sales.getSalAndPros();
  %>
<body>
  <div class="container" style="width:1100px;">
	<div class="col-md-12 column">
		<form class="navbar-form navbar-left" role="search">
			<div class="form-group">
				<span class="search-span"> 出库日期:</span> 
				<input type="date" name="date" class="form-control"  value="<%=sales.getDate() %>" />
			</div>
			<span class="search-span"> 客户:</span> 
			<select name="supplierId" class="form-control">
	        	<option value="0">
	        		<%=sales.getCustomer().getName() %>
	        	</option>
	        </select> 
	         <span class="search-span"> 经办人:</span> 
			<select name="operatorId" class="form-control">
	        	<option value="0">
	        		<%=sales.getOperator().getName() %>
	        	</option>
	        </select> 
			<input type="button" id="submit" class="btn btn-primary" value="保存" />
		</form>
		<table class="table table-bordered table-hover table-condensed  table-striped" >
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
			    	for(SalAndPro salAndPro : salAndPros){
			     %>
			     <tr data-id="<%=salAndPro.getId()%>">
				     <td style="width:80px;"><%=salAndPro.getId() %></td>
				     <td class="proId" style="width:100px;">
					     <select name="proId" class="form-control" style="width:100%;height:100%;">
				        	<option value="0"><%=salAndPro.getProduct().getName() %></option>
				        </select> 
			        </td>
				    <td class="num td-input" style="width:80px;"><%=salAndPro.getNum() %></td>
				    <td class="price td-input" style="width:80px;"><%=salAndPro.getPrice() %></td>
				    <td class="totalPrice" style="width:80px;"><%=salAndPro.getTotalPrice() %></td>
				    <td class="note td-input" style="width:80px;"><%=salAndPro.getNote() %></td>
				    <td style="width:80px;"> </td>
			     </tr>
			  <% }%>
			</tbody>
		</table>
		<button id="add-tr" type="button" class="btn btn-primary">添加一行</button>  
		<div style="float:right;width:150px;">
			<span class="search-span" > 总价:</span> 
			<input id="count" name="count" class="form-control" value="<%=sales.getCount()%>" />
		</div>
	</div>
</div>
<script type="text/javascript">
$().ready(function(){

});
</script>
</body>
</html>