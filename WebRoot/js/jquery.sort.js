/**
 * jquery.sort.js
 * 商品发布-选择分类
 * author: 锐不可挡
 * date: 2016-07-07
**/
/*定义三级分类数据*/
//一级分类
var province = ["原料", "成品", "物料"];
//二级分类
var city = [
	["黑枸杞", "红枸杞"],
	["黑枸杞", "红枸杞"],
	["瓶子", "袋子", "盒子"],
];
//三级分类
var district = [
	/*教育*/
	[
		["大号", "中号", "小号"],
		["英语综合教程", "英语专项训练", "英语读物"],
		["学历考试", "公职", "财税外贸保险", "建筑工程", "计算机", "医药卫生", "艺术/体育", "考研", "公务员"]
	],
	/*文艺*/
	[
		["青岛", "宁夏", "靖远"],
		["财经人物", "历代帝王", "领袖首脑", "军事人物", "政治人物", "历史人物", "女性人物", "法律人物", "宗教人物", "哲学家"],
		["艺术理论", "世界各国艺术", "绘画"],
		["摄影理论", "摄影入门"]
	],
	/*青春*/
	[
		["100g", "200g", "300g"],
		["50g", "80g", "100g"],
		["高档", "中档", "低档"]
	]
];
var expressP, expressC, expressD, expressArea, areaCont;
var arrow = " <font>&gt;</font> ";

/*初始化一级目录*/
function intProvince() {
	areaCont = "";
	for (var i=0; i<province.length; i++) {
		areaCont += '<li onClick="selectP(' + i + ');"><a href="javascript:void(0)">' + province[i] + '</a></li>';
	}
	$("#sort1").html(areaCont);
}
intProvince();

/*选择一级目录*/
function selectP(p) {
	areaCont = "";
	for (var j=0; j<city[p].length; j++) {
		areaCont += '<li onClick="selectC(' + p + ',' + j + ');"><a href="javascript:void(0)">' + city[p][j] + '</a></li>';
	}
	$("#sort2").html(areaCont).show();
	$("#sort3").hide();
	$("#sort1 li").eq(p).addClass("active").siblings("li").removeClass("active");
	expressP = province[p];
	$("#selectedSort").html(expressP);
	$("#releaseBtn").removeAttr("disabled");
}

/*选择二级目录*/
function selectC(p,c) {
	areaCont = "";
	expressC = "";
	for (var k=0; k<district[p][c].length; k++) {
		areaCont += '<li onClick="selectD(' + p + ',' + c + ',' + k + ');"><a href="javascript:void(0)">' + district[p][c][k] + '</a></li>';
	}
	$("#sort3").html(areaCont).show();
	$("#sort2 li").eq(c).addClass("active").siblings("li").removeClass("active");
	expressC = expressP + arrow + city[p][c];
	$("#selectedSort").html(expressC);
}

/*选择三级目录*/
function selectD(p,c,d) {
	$("#sort3 li").eq(d).addClass("active").siblings("li").removeClass("active");
	expressD = expressC + arrow + district[p][c][d];
	$("#selectedSort").html(expressD);
}

/*点击下一步*/
$("#releaseBtn").click(function() {
	var releaseS = $(this).prop("disabled");
	if (releaseS == false) {//未被禁用
		//location.href = "商品发布-详细信息.html";//跳转到下一页
	}
});
