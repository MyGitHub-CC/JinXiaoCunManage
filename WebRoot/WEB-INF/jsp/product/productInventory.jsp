<%@ page language="java" import="java.util.*,bean.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>当前库存</title>
    <script src="bootstrap/js/jquery.min.js" type="text/javascript"></script>
	<script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" type="text/css"></link>
  </head>
  <%
  	List<Product> products = (List<Product>) request.getAttribute("products");
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
   	<table class="table table-bordered table-hover table-condensed  table-striped" >
			<thead>
			    <tr style="margin:10px;">
			      <th width="25">ID</th>
			      <th width="120">商品名称</th>
			      <th width="30">类别</th>
			      <th width="30">库存</th>
			      <th width="50">备注</th>
			      <th width="50">操作</th>
			    </tr>
			</thead>
			<tbody id="tbody">
				 <%
			    	for(int i = 0; i < products.size(); i++){
			    	Product product = products.get(i);
			     %>
			     <tr data-id="<%=i%>">
				     <td style="width:80px;"><%=product.getId() %></td>
				     <td class="proId" style="width:100px;">
						 <%=product.getName() %>
				     </td>
					 <td class="num td-input" style="width:80px;">
						<%=product.getClassify().getName() %>
					 </td>
					 <td class="price td-input" style="width:80px;">
					 	<%=product.getInventory() %>
					 </td>
					
					 <td class="note td-input" style="width:80px;">
					  <%
					  	String note = "无";
					 	if(product.getNote() != null){
					  	note = product.getNote();
					  	} 
					  %>
					 <%=note %>
					 </td>
					 <td style="width:80px;"><a href="productRecord?product.id=<%=product.getId()%>">进出库记录</a></td>
			     </tr>
			  <% }%>
			</tbody>
		</table>
  </body>
</html>
