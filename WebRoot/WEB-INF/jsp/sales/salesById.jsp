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
	<link rel="stylesheet" href="my/myWrite.css" type="text/css"></link>
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
			    	for(SalAndPro salAndPro : salAndPros){
			     %>
			     <tr data-id="<%=salAndPro.getId()%>">
				    <td><%=salAndPro.getId() %></td>
				    <td><%=salAndPro.getProduct().getName() %> </td>
				    <td><%=salAndPro.getProduct().getUnit() %></td>
				    <td><%=salAndPro.getProduct().getClassifyProduct().getName() %></td>
				    <td class="td-input2"><%=salAndPro.getNum() %></td>
				    <td class="td-input2"><%=salAndPro.getPrice() %></td>
				    <td class="td-input2"><%=salAndPro.getTotalPrice() %></td>
				    <td><%=salAndPro.getNote() %></td>
				    <td></td>
			     </tr>
			  <% }%>
			</tbody>
		</table>
	  <button id="add-tr" type="button" class="btn btn-primary">添加一行</button>  
	  <div class="form-group" style="float:right;width:270px;">
		  <label class="search-label col-sm-3" style="line-height:34px;">总价:</label>
		  <div class="col-sm-9"> 
		  	<input id="count" name="count" class="form-control" readonly="readonly"  value="<%=sales.getCount() %>" />
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