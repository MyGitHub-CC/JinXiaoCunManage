<%@ page language="java" import="java.util.*,bean.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<base href="<%=basePath%>">
    <title>后台管理中心</title>  
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/jquery.js"></script>  
</head>

<body style="background-color:#f2f9fd;">
<div class="header bg-main">
  <div class="logo margin-big-left fadein-top">
    <h1><img src="images/y.jpg" class="radius-circle rotate-hover" height="50" alt="" />后台管理中心</h1>
  </div>
  <div class="head-l">
  	<a class="button button-little bg-green" href="" target="_blank">
  		<span class="icon-home"></span> 前台首页
  	</a> &nbsp;&nbsp;
  	<a href="##" class="button button-little bg-blue">
  		<span class="icon-wrench"></span> 清除缓存
  	</a> &nbsp;&nbsp;
  	<a class="button button-little bg-red" href="login.html">
  		<span class="icon-power-off"></span> 退出登录
  	</a> 
  </div>
</div>
<div class="leftnav">
  <div class="leftnav-title"><strong><span class="icon-list"></span>菜单列表</strong></div>
  <h2><span class="icon-user"></span>基本设置</h2>
  <ul>
    <li><a href="purchaseInput" target="right"><span class="icon-caret-right"></span>网站设置</a></li>
    <li><a href="pass.html" target="right"><span class="icon-caret-right"></span>修改密码</a></li>
    <li><a href="page.html" target="right"><span class="icon-caret-right"></span>单页管理</a></li>  
    <li><a href="adv.html" target="right"><span class="icon-caret-right"></span>首页轮播</a></li>   
    <li><a href="book.html" target="right"><span class="icon-caret-right"></span>留言管理</a></li>     
    <li><a href="column.html" target="right"><span class="icon-caret-right"></span>栏目管理</a></li>
  </ul> 
  <h2><span class="icon-pencil-square-o"></span>进货管理</h2>
  <ul>
    <li><a href="purchaseInput" target="right"><span class="icon-caret-right"></span>进货录入</a></li>
    <li><a href="purchaseManage" target="right"><span class="icon-caret-right"></span>进货管理</a></li>
    <li><a href="purchaseReturn" target="right"><span class="icon-caret-right"></span>退货录入</a></li>
  </ul> 
  <h2><span class="icon-pencil-square-o"></span>销售管理</h2>
  <ul>
    <li><a href="salesInput" target="right"><span class="icon-caret-right"></span>销售录入</a></li>
    <li><a href="salesManage" target="right"><span class="icon-caret-right"></span>销售管理</a></li>
    <li><a href="salesReturn" target="right"><span class="icon-caret-right"></span>退货录入</a></li>        
  </ul> 
  <h2><span class="icon-pencil-square-o"></span>库存管理</h2>
  <ul>
    <li><a href="productInventory" target="right"><span class="icon-caret-right"></span>当前库存</a></li>
    <li><a href="product" target="right"><span class="icon-caret-right"></span>商品资料</a></li>
    <li><a href="productAssembly" target="right"><span class="icon-caret-right"></span>商品组装</a></li>
    <li><a href="productSplit" target="right"><span class="icon-caret-right"></span>商品拆分</a></li>        
  </ul> 
  <h2><span class="icon-pencil-square-o"></span>分类管理</h2>
  <ul>
    <li><a href="classifyProduct" target="right"><span class="icon-caret-right"></span>商品类别</a></li>
    <li><a href="classifyCustomer" target="right"><span class="icon-caret-right"></span>客户类别</a></li>
    <li><a href="classifySupplier" target="right"><span class="icon-caret-right"></span>供应商类别</a></li>        
  </ul> 
  <h2><span class="icon-pencil-square-o"></span>人员管理</h2>
  <ul>
    <li><a href="supplier" target="right"><span class="icon-caret-right"></span>供应商管理</a></li>
    <li><a href="operator" target="right"><span class="icon-caret-right"></span>员工管理</a></li>        
    <li><a href="customer" target="right"><span class="icon-caret-right"></span>客户管理</a></li>
  </ul>  
</div>
<script type="text/javascript">
$(function(){
  $(".leftnav h2").click(function(){
	  $(".leftnav h2").next().slideUp(200);	
	  $(".leftnav h2").removeClass("on"); 
	  $(this).next().slideToggle(200);	
	  $(this).toggleClass("on"); 
  });
  $(".leftnav ul li a").click(function(){
	    $("#a_leader_txt").text($(this).text());
	 		$(".leftnav ul li a").removeClass("on");
		$(this).addClass("on");
  });
});
</script>
	<ul class="bread">
	  <li><a href="{:U('Index/info')}" target="right" class="icon-home"> 首页</a></li>
	  <li><a href="##" id="a_leader_txt">网站信息</a></li>
	  <li><b>当前语言：</b><span style="color:red;">中文</php></span>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;切换语言：<a href="##">中文</a> &nbsp;&nbsp;<a href="##">英文</a> </li>
	</ul>
	<div class="admin">
	  <iframe scrolling="auto" rameborder="0" src="#" name="right" width="100%" height="100%"></iframe>
	</div>
	<div style="text-align:center;">
		<p>来源:<a href="http://www.mycodes.net/" target="_blank">源码之家</a></p>
	</div>
</body>
</html>
</html>
