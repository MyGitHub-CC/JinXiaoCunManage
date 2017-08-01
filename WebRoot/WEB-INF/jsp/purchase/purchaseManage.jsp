<%@ page language="java" import="java.util.*,bean.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>进货管理</title>
	<script src="bootstrap/js/jquery.min.js" type="text/javascript"></script>
	<script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" type="text/css"></link>
	<link rel="stylesheet" href="my/myWrite.css" type="text/css"></link>
  </head>
 <%
	List<Purchase> list = (List<Purchase>) request.getAttribute("purchases");
	List<Supplier> suppliers = (List<Supplier>) request.getAttribute("suppliers");
	Purchase purchase = new Purchase();
	Supplier supplier2 = new Supplier();
	purchase.setSupplier(supplier2);
	if(request.getAttribute("purchase") != null){
		purchase = (Purchase) request.getAttribute("purchase");
	}
	int supplierId = 0;
	if(purchase.getSupplier().getId() > 0){
		supplierId = purchase.getSupplier().getId();
	}
	String date = "";
	if(purchase.getDate() != ""){
		date = purchase.getDate();
	}
 %>
<body>
	<form action="purchaseManage" method="post" class="form-inline" role="form">
		<div class="form-group">
			<span class="search-span"> 供应商:</span> 
			<select name="purchase.supplier.id" class="form-control">
	        	<option value="0">请选择：</option>
	        	<%
	        	for(int i = 0; i < suppliers.size(); i++){
	        	%>
	        	<option value="<%=suppliers.get(i).getId()%>" 
	        	<%if(supplierId > 0 && suppliers.get(i).getId() == supplierId){%> selected="selected" <% } %>>
	        		<%=suppliers.get(i).getName() %>
	        	</option>
	        	<% } %>
	        </select> 
		</div>
		<div class="form-group">
			<span class="search-span">进货日期：</span>
			<input type="date" name="purchase.date" class="form-control" 
			<%if(date != ""){%>value="<%=date%>"<% } %> />
		</div>
		<div class="form-group">
			<input type="submit" value="查询"  class="btn btn-primary"  style="margin-left:20px;"/>
		</div>
	</form>
  <table class="table table-hover text-center table-bordered">
    <tr>
      <th>ID</th>
      <th>进货单号</th>
      <th>供应商</th>
      <th>总价</th>
      <th>进货日期</th>
      <th>经办人</th>
      <th>备注</th>
      <th>操作</th>
    </tr>
   <%
    for(int i = 0; i < list.size(); i++){
    	Supplier supplier = list.get(i).getSupplier();
     %>
  <tr>
      <td><%=list.get(i).getId() %></td>     
      <td><%=list.get(i).getReceipt() %></td>  
      <td><%=supplier.getName() %></td>     
      <td class="td-input2"><%=list.get(i).getCount() %></td>     
      <td><%=list.get(i).getDate() %></td>  
      <td><%=list.get(i).getOperator().getName() %></td>  
      <td>
      	 <%
		  	String note = "无";
		 	if(list.get(i).getNote()!= null){
		  		note = list.get(i).getNote();
		  	} 
		  %>
		 <%=note %>
      </td>     
      <td>
	      <a href="purchaseById?purchase.id=<%=list.get(i).getId() %>">详情 </a>
	      <a href="javascript:void(0)" >删除 </a>
      </td>
    </tr>
    <% } %>
  </table>
<script type="text/javascript">
$().ready(function(){
	$(".td-input2").each(function(index,element){
		$(this).text(($(this).text() - 0).toFixed(2));
	});
});
</script>
</body></html>
