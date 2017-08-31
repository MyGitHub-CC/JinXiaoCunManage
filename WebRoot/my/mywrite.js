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

//设置td-input可编辑
$("#tbody .td-input").attr("contentEditable",true);

// 点击按钮添加一行
var tr = "<tr><td class='proId'></td><td class='num td-input'></td>";
tr += "<td class='price td-input'></td><td></td><td></td><td></td><td></td></tr>";
$("#add-tr").click(function(){
	$("table").append(tr);
	$(".td-input").attr("contentEditable",true);
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