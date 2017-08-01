<%@ page language="java" import="java.util.*,bean.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>库存记录</title>
    <script src="bootstrap/js/jquery.min.js" type="text/javascript"></script>
	<script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" type="text/css"></link>
	<style>
		table tr th{
			text-align:center;
		}
	</style>
  </head>
  <%
  	List<PurAndPro> purAndPros = (List<PurAndPro>) request.getAttribute("purAndPros");
  	List<SalAndPro> salAndPros = (List<SalAndPro>) request.getAttribute("salAndPros");
   %>
  <body>
   	<table class="table table-bordered table-hover table-condensed  table-striped">
		<thead>
		    <tr style="margin:10px;">
		      <th>ID</th>
		      <th>类型</th>
		      <th>商品名称</th>
		      <th>订单号</th>
		      <th>进货日期</th>
		      <th>进货数量</th>
		      <th>进货单价</th>
		      <th>进货总价</th>
		      <th>备注</th>
		      <th>操作</th>
		    </tr>
		</thead>
		<tbody id="tbody">
			 <%
		    	for(int i = 0; i < purAndPros.size(); i++){
		    	PurAndPro purAndPro = purAndPros.get(i);
		     %>
		     <tr data-id="<%=i%>">
			     <td><%=purAndPro.getId() %></td>
			     <td>采购进货</td>
			     <td><%=purAndPro.getProduct().getName() %></td>
			     <td>
					 <%=purAndPro.getPurchase().getReceipt() %>
			     </td>
				 <td>
					<%=purAndPro.getPurchase().getDate() %>
				 </td>
				 <td><%=purAndPro.getNum() %></td>
				 <td><%=purAndPro.getPrice() %></td>
				 <td><%=purAndPro.getTotalPrice() %></td>
				 <td>
				  <%
				  	String note = "无";
				 	if(purAndPro.getNote() != null){
				  	note = purAndPro.getNote();
				  	} 
				  %>
				 <%=note %>
				 </td>
				 <td>详情</td>
		     </tr>
		  <% }%>
	  	<%
	    	for(int i = 0; i < salAndPros.size(); i++){
	    	SalAndPro salAndPro = salAndPros.get(i);
	     %>
		     <tr data-id="<%=i%>">
			     <td><%=salAndPro.getId() %></td>
			     <td>销售出库</td>
			     <td><%=salAndPro.getProduct().getName() %></td>
			     <td>
					 <%=salAndPro.getSales().getReceipt() %>
			     </td>
				 <td>
					<%=salAndPro.getSales().getDate() %>
				 </td>
				 <td><%=salAndPro.getNum() %></td>
				 <td><%=salAndPro.getPrice() %></td>
				 <td><%=salAndPro.getTotalPrice() %></td>
				 <td>
				  <%
				  	String note = "无";
				 	if(salAndPro.getNote() != null){
				  	note = salAndPro.getNote();
				  	} 
				  %>
				 <%=note %>
				 </td>
				 <td>详情</td>
		     </tr>
		 <% }%>
		</tbody>
	</table>
  </body>
</html>
