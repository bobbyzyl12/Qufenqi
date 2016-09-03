<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://apps.bdimg.com/libs/bootstrap/3.3.0/css/bootstrap.min.css">  
  
  <script type="text/javascript" src="${ctx}/js/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx}/js/bootstrap.min.js"></script>
<title>qfenqi home page</title>
<style type="text/css">
	html,body,div
	{
		margin: 0;
		padding: 0;
		height: 100%;
		-webkit-box-sizing: border-box;
    	-moz-box-sizing: border-box;
        box-sizing: border-box;
        font-family: "Microsoft YaHei",Arial,Helvetica,sans-serif;
	}
	
	a:hover,a:link,a:visited,a:active{
		color:#000;
		text-decoration:none;
	}
	
	div.wrapper{
		position:relative;
		min-height:100%;
		height:auto !important;
		width:100%;
	}
	
	div.header_container
	{
		width:auto;
		height:150px;
		background-image:url(${ctx}/img/headerBack.jpg);
	}
	
	div.main_container{
		margin-top:30px;
		padding-bottom:50px;
	}
	
	div.footer_container{
		height:30px;
		position:absolute;
		bottom:0px;
		left:0px;		/**IE*/
		width:100%;
		display:block;
		background-color:#fff;
		
		border-top-width:1px;
		border-style:solid;
		border-color:#ccc;
		border-bottom-width:0px;
		border-left-width:0px;
		border-right-width:0px;
		
		text-align:center;
	}
	
	.center_area{
		width:1000px;
		margin-left:auto;
		margin-right:auto;
		position:relative;
	}
	
	.dialog{
		display: none;
		z-index: 5;
		
		background-color: #FFF;
		border: 1px solid #888;
		
		position: fixed !important; /* 浮动对话框 */
		top: 50%;
		left: 50%;
	}
	
	.coverbg{
    	background-color:#333;
    	left: 0px;
    	opacity: 0.5;
		position: absolute;
    	top: 0px;
    	z-index: 3;
    	filter: alpha(opacity=50); /* IE6 */
    	-moz-opacity: 0.5; /* Mozilla */
    	-khtml-opacity: 0.5; /* Safari */
	}
	
	.header_basic{
		background-color:white;
		height:40px;
		overflow: hidden;
		
		position:relative;
		filter:alpha(opacity=95); /*支持 IE 浏览器*/
		-moz-opacity:0.95; /*支持 FireFox 浏览器*/
		opacity:0.95; /*支持 Chrome, Opera, Safari 等浏览器*/
		
		box-shadow: rgba(0,0,0,0.1) 0 1px 2px;
	}
	
	.header_box{
		height:100%;
		width:1200px;
			
		margin-left:auto;
    	margin-right:auto;
    	
	}
	
	.header_botton_box{
		float:right;
	}

	ul{
		height:100%;
		list-style-type:none;
	}
	
	ul,li{
		list-style:none;
	}
	li{
		line-height:40px;
		float:left;
	}
	
	a.header_btn:link,a.header_btn:visited
	{
		display:block;
		width:110px;
		height:100%;
		color:rgb(102, 102, 102);
		font-weight:bold;
		text-align:center;
		padding:4px;
		border:2px solid #ccc; 
		border-width:0 2px 0 0;
		text-decoration:none;
		text-transform:none;
	}
	
	a.header_btn:hover,a.header_btn:active{
		color:#fff !important;
		background-color:#bebebe;
	}
	
	a.header_btn2:link,a.header_btn2:visited
	{
		display:block;
		width:110px;
		height:100%;
		color:rgb(102, 102, 102);
		font-weight:bold;
		text-align:center;
		padding:4px;
		border:2px solid #ccc; 
		border-width:0 2px 0 0;
		text-decoration:none;
		text-transform:none;
		padding:0px;
		margin:0px;
	}
	
	a.header_btn2:hover,a.header_btn2:active{
		color:#fff !important;
		background-color:#bebebe;
	}
	
	.header_icon{
		font-size: 22px;
	}
	
	.header_under_center{
		height:100%;
		width:1200px;
		margin-left:auto;
    	margin-right:auto;
    	vertical-align:middle;
	}
	
	.header_logo_box{
		width:auto;
		padding:10px 0px 0px 0px;
		float:left;
	}
		
	img.header_logo{
		height:80px;
	}
	
	.search_box{
		float:left;
	}
	
	.header_search_box{
		float:left;
		position:relative;
		left:50px;
		padding:25px 50px 0px 0px;
	}
	
	.header_search{
		width:700px;
		height:50px;
		padding:0px 0px 0px 30px;
		margin:0;
		border-width:3px;
		border-style:solid;
		border-color:#3399ff #3399ff; 
		font-size:20px;
		outline:medium;
		background-color:#f2f2f2;
	}
	
	.header_search:hover,.header_search:focus{
		background-color:#ffffff;
	}
	
	
	.search_btn_box{
		float:left;
	}
	
	.search_btn{
		width:120px;
		height:50px;
		font-size:20px;
		color:#fff;
		font-weight:bold;
		padding:0px 0px 0px 0px;
		border:0;
		margin:0;
		background-color:#3399ff;
		letter-spacing:6px;
		text-align:center;
	}
	
	.search_btn:hover{
		background-color:#007fff;
	}
	
	.new_msg{
		min-width: 16px;
    	height: 16px;
    	line-height: 14px;
    	text-align: center;
    	display:inline-block;
    	background: #ff80aa;
    	color: #fff;
    	border-radius: 3px;
    	
    	position: relative;
    	right: 18px;
    	top: -52px;
    	padding:0 2px 0 2px;
    	border: 1px solid #fff;
    	
    	font-style:normal;
		font-size:9px;
	}
	
	.index_area{
		height:420px;
		width:150px;
		position:absolute;
		top:0px;
		left:0px;
	}
	
	li.index_li{
		line-height:38px;
		height:38px;
		padding-left:45px;
		text-align:left;
		width:100%;
		border-bottom: 1px solid #fff;
		background-color:#4f90fb;
	}
	
	li.index_li:hover{
		background-color:#69a1fc;
	}
	
	span.index_title{
		font-size:15px;
		color:#fff;
	}
	
	.puzzle_area{
		position:relative;
		top:0px;
		left:150px;
		height:420px;
		max-width:840px;
		background-color:black;
	}
	
	.puzzle_box{
		position:absolute;
	}
	
	.small_box{
		height:140px;
		width:140px;
		border:1px solid #fff;
	}
	
	.big_box{
		height:280px;
		width:280px;
		border:1px solid #fff;
	}
	
	.grid figure {
		position: relative;
		float: left;
		overflow: hidden;
		width: 48%;
		height: auto;
		background: #3085a3;
		text-align: center;
		cursor: pointer;
	}
	
	.grid figure.big{
		min-width: 280px;
		min-height:280px;
		max-width: 280px;
		max-height: 280px;
	}
	
	.grid figure.small{
		min-width: 140px;
		min-height:140px;
		max-width: 140px;
		max-height: 140px;
	}
	
	.grid figure img {
		position: relative;
		display: block;
		min-height: 100%;
		max-width: 100%;
		opacity: 0.8;
	}
	
	.grid figure figcaption {
		color: #fff;
		font-size: 1.25em;
		-webkit-backface-visibility: hidden;
		backface-visibility: hidden;
	}
	
	.grid figure figcaption::before,
	.grid figure figcaption::after {
		pointer-events: none;
	}
	
	.grid figure figcaption,
	.grid figure figcaption > a {
		position: absolute;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
	}
	
	/* Anchor will cover the whole item by default */
	/* For some effects it will show as a button */
	.grid figure figcaption > a {
		z-index: 1000;
		text-indent: 200%;
		white-space: nowrap;
		font-size: 0;
		opacity: 0;
	}
	
	.grid figure h2 {
		word-spacing: -0.15em;
		font-weight: 300;
	}
	
	.grid figure h2 span {
		font-weight: 800;
	}
	
	.grid figure h2,
	.grid figure p {
		margin: 0;
	}
	.grid figure p {
		letter-spacing: 1px;
		font-size: 80%;
	}
	
	figure.small p{
		font-size: 10px;
	}
	figure.effect-ming {
	background: #030c17;
}

	figure.effect-ming img {
		opacity: 0.9;
		-webkit-transition: opacity 0.35s;
		transition: opacity 0.35s;
	}
	
	
	figure.effect-ming figcaption::before {
		position: absolute;
		
		border: 2px solid #fff;
		box-shadow: 0 0 0 30px rgba(255,255,255,0.2);
		content: '';
		opacity: 0;
		-webkit-transition: opacity 0.35s, -webkit-transform 0.35s;
		transition: opacity 0.35s, transform 0.35s;
		-webkit-transform: scale3d(1.4,1.4,1);
		transform: scale3d(1.4,1.4,1);
	}
	
	figure.big figcaption::before{
		top: 30px;
		right: 30px;
		bottom: 30px;
		left: 30px;
	}
	
	figure.small figcaption::before{
		top: 10px;
		right: 10px;
		bottom: 10px;
		left: 10px;
	}
	
	figure.effect-ming h2 {
		margin: 20% 0 10px 0;
		-webkit-text-stroke: 0.5px #333;
		-webkit-transition: -webkit-transform 0.35s;
		transition: transform 0.35s;
	}
	
	figure.effect-ming p {
		padding: 1em;
		opacity: 0;
		-webkit-transition: opacity 0.35s, -webkit-transform 0.35s;
		transition: opacity 0.35s, transform 0.35s;
		-webkit-transform: scale(1.5);
		transform: scale(1.5);
	}

	figure.effect-ming:hover h2 {
	-webkit-transform: scale(0.9);
	transform: scale(0.9);
	}

	figure.effect-ming:hover figcaption::before,
	figure.effect-ming:hover p {
		opacity: 1;
		-webkit-transform: scale3d(1,1,1);
		transform: scale3d(1,1,1);
	}
	
	figure.effect-ming:hover figcaption {
		background-color: rgba(58,52,42,0);
	}

	figure.effect-ming:hover img {
		opacity: 0.4;
	}
	
	.page_btn{
 		border-radius:4px;
    	border:1px solid #e5e9ef;
    	background:#fff;
    	margin-right:10px;
    	text-align:center;
    	width:38px;
    	height:38px;
    	line-height: 8px;
    	margin-top:6px;
    	outline:0;
 	}
 	
 	.page_btn:hover{
 		border:1px solid #4f90fb;
 		color:#4f90fb;
 	}
 	
 	span.pages_span{
 		margin-right:10px;
 		width:38px;
    	height:38px;
    	position:relative;
    	top:10px;
 	}
 	
 	.page_box{
 	    height: 80px;
	    padding-left: 27px;
	    padding-right: 27px;
	    margin-left: auto;
	    margin-right: auto;
	    border-bottom-left-radius: 4px;
	    border-bottom-right-radius: 4px;
	    background: #fff;
	    padding-top:20px;
	    padding-bottom: 25px;
 	}
	
	.pages{
		text-align: center;
	}
	
	ul.pageul{
		display: inline-block;
	}
</style>

<script type="text/javascript">
$(function(){
	
	var currentPage=Number($("#pageNo").text());
	var pageNum=Number($("#totalPage").text());
	
	$("#page_btn2").text(currentPage-2);
	$("#page_btn3").text(currentPage-1);
	$("#page_btn4").text(currentPage);
	$("#page_btn5").text(currentPage+1);
	$("#page_btn6").text(currentPage+2);
	$("#page_btn7").text(pageNum);
	
	//改变当前页的button样式
	$("#page_btn4").css("background-color","#4f90fb");
	$("#page_btn4").css("border","1px solid #ddd");
	$("#page_btn4").css("color","#fff");
	
	//先处理"上一页"和"下一页"的情况
	if(currentPage==1)	//如果当前页为首页
	{
		$("#prePage").hide();	
	}
	
	if(currentPage==pageNum)	//如果当前页为末页
	{
		$("#sufPage").hide();
	}
	
	//处理当前页小于等于3的特殊情况
	if(currentPage<=3){
		$("#prePoint").hide();
		$("#page_btn1").hide();
	}
	else if(currentPage==4){
		$("#prePoint").hide();
	}
	
	if(currentPage==1)
	{
		$("#page_btn2").hide();
		$("#page_btn3").hide();
	}
	else if(currentPage==2)
	{
		$("#page_btn2").hide();
	}
	
	if(currentPage>=pageNum-2){
		$("#sufPoint").hide();
		$("#page_btn7").hide();
	}
	else if(currentPage==pageNum-3){
		$("#sufPoint").hide();
	}
	
	if(currentPage==pageNum)
	{
		$("#page_btn5").hide();
		$("#page_btn6").hide();
	}
	
	if(currentPage==pageNum-1)
	{
		$("#page_btn6").hide();
	}
});


//关闭灰色 jQuery 遮罩
function closeBg() {
    $("#coverbg").hide();
    $(".dialog").hide();
}
</script>
</head>
<body>
	<!-- 这里是主页面哟！ -->
	<div class="wrapper">
		<div class="header_container">
			<div class="header_basic">
				<div class="header_box">
					<div class="header_botton_box">
						<ul>
							<%if(session.getAttribute("userName") == null){%>
							<li>
								<a href="${ctx}/page/jumpToLogin" class="header_btn2" style="border-width:0 2px 0 2px;">
	  								<p style="font-size:18px;">登陆</p>
								</a>
							</li>
							<li>
								<a href="${ctx}/page/jumpToSignin" class="header_btn2">
	  								<p style="font-size:18px;">注册</p>
								</a>
							</li>
							<%}else{%>	
							<li>
								<a href="${ctx}/page/jumpToMyInfo" class="header_btn" style="border-width:0 2px 0 2px;">
	  								<span class="glyphicon glyphicon-user header_icon"></span>
	  								<p style="display:inline-block;">&nbsp;&nbsp;个人中心</p>
								</a>
							</li>
							<li>
								<a href="${ctx}/page/jumpToMsgInfo" class="header_btn">
	  								<span class="glyphicon glyphicon-envelope header_icon"></span>
	  								<p style="display:inline-block;">&nbsp;&nbsp;我的消息</p>
	  								<em class="new_msg" id="msgNum">${msgNum}</em>
								</a>
							</li>
							<li>
								<a href="${ctx}/page/jumpToMyChart" class="header_btn">
	  								<span class="glyphicon glyphicon-shopping-cart header_icon"></span>
	  								<p style="display:inline-block;">&nbsp;&nbsp;购物车</p>
								</a>
							</li>
							<li>
								<a href="${ctx}/page/jumpToMyOrder" class="header_btn">
	  								<span class="glyphicon glyphicon-list-alt header_icon"></span>
	  								<p style="display:inline-block;">&nbsp;&nbsp;我的订单</p>
								</a>
							</li>
							<%}%>
						</ul>
					</div>
				</div>
			</div>
			<div class="header_under">
				<div class="header_under_center">
					<div class="header_logo_box">
						<a href="">
							<img class="header_logo" src="${ctx}/img/logo.png">
						</a>
					</div>
					<div class="header_search_box">
						<form action="${ctx}/goods/searchAll" method="post">
							<input class="header_search" type="text" name="searchContent" id="searchContent" placeholder="输入关键字">
							<input class="search_btn" type="submit" id="search_btn" value="搜索">
						</form>
					</div>
				</div>
			</div>
		</div>
		<div class="main_container">
			<div class="goods_show_box">
				<div>
				</div>
			</div>
			<div class="page_box">
			<%if((String)session.getAttribute("haveRes") == "no"){%>
			
			<%}else if((String)session.getAttribute("haveRes") == "yes"){%>
				<div class="pages" align="center">
					<ul class="pageul">
					
					<a href="${ctx}/goods/searchAll?pageNo=${pageModel.pageNo-1}&&searchContent=${searchContent}"><button class="page_btn" style="width:100px" id="prePage">上一页</button></a>		
							
					<a href="${ctx}/goods/searchAll"><button class="page_btn" id="page_btn1">1</button></a>
							
					<span class="pages_span" id="prePoint">...</span>
							
					<a href="${ctx}/goods/searchAll?pageNo=${pageModel.pageNo-2}&&searchContent=${searchContent}"><button class="page_btn" id="page_btn2"></button></a>
							
					<a href="${ctx}/goods/searchAll?pageNo=${pageModel.pageNo-1}&&searchContent=${searchContent}"><button class="page_btn" id="page_btn3"></button></a>
							
					<a><button class="page_btn" id="page_btn4"></button></a>
							
					<a href="${ctx}/goods/searchAll?pageNo=${pageModel.pageNo+1}&&searchContent=${searchContent}"><button class="page_btn" id="page_btn5"></button></a>
							
					<a href="${ctx}/goods/searchAll?pageNo=${pageModel.pageNo+2}&&searchContent=${searchContent}"><button class="page_btn" id="page_btn6"></button></a>
							
					<span class="pages_span" id="sufPoint">...</span>
							
					<a href="${ctx}/goods/searchAll?pageNo=${pageModel.totalpage}&&searchContent=${searchContent}"><button class="page_btn" id="page_btn7"></button></a>
							
					<a href="${ctx}/goods/searchAll?pageNo=${pageModel.pageNo+1}&&searchContent=${searchContent}"><button class="page_btn" style="width:100px;" id="sufPage">下一页</button></a>
					</ul>
				</div>
				<%}%>
			</div>
		</div>
		
		<div class="footer_container" id="aaa">
			<div class="center_area">
				copyright(c) 2016
			</div>
		</div>
	</div>
	
	<!-- jQuery 遮罩层 -->
	<div id="coverbg" class="coverbg"></div>
	
	<!-- 这里存放dialogs -->
	<div id="dialog" class="dialog">
	</div>
	
	<!-- 暂存数据用 -->
	<p style="display:none" id="totalPage">${pageModel.totalpage}</p>
	<p style="display:none" id="pageNo">${pageModel.pageNo}</p>
	
</body>
</html>