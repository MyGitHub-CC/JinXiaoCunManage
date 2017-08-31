<%@ page language="java" import="java.util.*,bean.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>销售管理</title>
	<script src="bootstrap/js/jquery.min.js" type="text/javascript"></script>
	<script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" type="text/css"></link>
	<link rel="stylesheet" href="my/myWrite.css" type="text/css"></link>
  </head>
 <%
	List<Sales> salesList = (List<Sales>) request.getAttribute("salesList");
	List<Customer> customers = (List<Customer>) request.getAttribute("customers");
	Sales sales = (Sales) request.getAttribute("sales");
	int customerId = 0;
	if(sales.getCustomer() != null && sales.getCustomer().getId() > 0){
		customerId = sales.getCustomer().getId();
	}
	String date = "";
	if(sales.getDate() != null && sales.getDate() != ""){
		date = sales.getDate();
	}
	String xtFlag = "销售";
	if(sales.getXtFlag() > 0){
		xtFlag = "退货";
	}
 %>
<body>
	<form action="salesManage" method="post" class="form-inline" role="form">
		<input type="hidden" name="sales.xtFlag" value="<%=sales.getXtFlag()%>" />
		<div class="form-group">
			<span class="search-span"> 客户:</span> 
			<select name="sales.customer.id" class="form-control">
	        	<option value="0">请选择：</option>
	        	<%
	        	for(int i = 0; i < customers.size(); i++){
	        	%>
	        	<option value="<%=customers.get(i).getId()%>" 
	        	<%if(customerId > 0 && customers.get(i).getId() == customerId){%> selected="selected" <% } %>>
	        		<%=customers.get(i).getName() %>
	        	</option>
	        	<% } %>
	        </select> 
		</div>
		<div class="form-group">
			<span class="search-span"><%=xtFlag %>日期：</span>
			<input type="date" name="sales.date" class="form-control" 
			<%if(date != ""){%>value="<%=date%>"<% } %> />
		</div>
		<div class="form-group">
			<input type="submit" value="查询"  class="btn btn-primary"  style="margin-left:20px;"/>
		</div>
 	</form>
  <table class="table table-hover text-center table-bordered">
    <tr>
      <th>ID</th>
      <th><%=xtFlag %>单号</th>
      <th>客户</th>
      <th>总价</th>
      <th><%=xtFlag %>日期</th>
      <th>经办人</th>
      <th>备注</th>
      <th>操作</th>
    </tr>
   <%
    for(int i = 0; i < salesList.size(); i++){
    	Customer customer = salesList.get(i).getCustomer();
     %>
  <tr>
      <td><%=salesList.get(i).getId() %></td>     
      <td><%=salesList.get(i).getReceipt() %></td>  
      <td><%=customer.getName() %></td>     
      <td><%=salesList.get(i).getCount() %></td>     
      <td><%=salesList.get(i).getDate() %></td>  
      <td><%=salesList.get(i).getOperator().getName() %></td>  
      <td>
  		 <%
		  	String note = "无";
		 	if(salesList.get(i).getNote()!= null){
		  		note = salesList.get(i).getNote();
		  	} 
		  %>
		 <%=note %>
      </td>     
      <td>
	      <div class="button-group">
	      <a class="button border-main" href="salesById?sales.id=<%=salesList.get(i).getId() %>" >
	      	<span class="icon-edit"></span> 详情
	      </a>
	      <a class="button border-red" href="javascript:void(0)">
	      	<span class="icon-trash-o"></span> 删除
	      </a>
	      </div>
      </td>
    </tr>
    <%} %>
  </table>
<script type="text/javascript">
$().ready(function(){
	$(".td-input2").each(function(index,element){
		$(this).text(($(this).text() - 0).toFixed(2));
	});
});
</script>
</body></html>
