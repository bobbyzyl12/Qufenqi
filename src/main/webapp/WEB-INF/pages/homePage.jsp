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
	
</style>

<script type="text/javascript">

$(function(){
	var temp=$('#msgNum').html();
	if(temp==0)
		$('#msgNum').hide();
});

function showBg() {
    var bh = $("body").height();
    var bw = $("body").width();
    $("#coverbg").css({
        height: bh,
        width: bw,
        display: "block"
    });
    $("#dialog").show();
}

//关闭灰色 jQuery 遮罩
function closeBg() {
    $("#coverbg,#dialog").hide();
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
						<div class="search_box">
							<input class="header_search" id="search" placeholder="输入关键字">
						</div>
						<div class="search_btn_box">
							<button class="search_btn">搜索</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="main_container">
			<div class="center_area">
				<div class="index_area">
					<li style="font-size:16px;color:#000;width:100%;height:39px;font-weight:bold;padding-left:42px;background-color:white;">
						商品分类
					</li>
					<li	class="index_li">
						<a href="#">
							<span class="index_title">手机通讯</span>
						</a>
					</li>
					<li	class="index_li">
						<a href="#">
							<span class="index_title">电脑平板</span>
						</a>
					</li>
					<li	class="index_li">
						<a href="#">
							<span class="index_title">腕表饰品</span>
						</a>
					</li>
					<li	class="index_li">
						<a href="#">
							<span class="index_title">数码家电</span>
						</a>
					</li>
					<li	class="index_li">
						<a href="#">
							<span class="index_title">家具家饰</span>
						</a>
					</li>
					<li	class="index_li">
						<a href="#">
							<span class="index_title">家装建材</span>
						</a>
					</li>
					<li	class="index_li">
						<a href="#">
							<span class="index_title">食品饮料</span>
						</a>
					</li>
					<li	class="index_li">
						<a href="#">
							<span class="index_title">衣装服饰</span>
						</a>
					</li>
					<li	class="index_li">
						<a href="#">
							<span class="index_title">鞋靴箱包</span>
						</a>
					</li>
					<li	class="index_li">
						<a href="#">
							<span class="index_title">图书百货</span>
						</a>
					</li>
				</div>
				<div class="puzzle_area">
					<div class="puzzle_box small_box grid">
						<figure class="effect-ming small">
							<img src="${ctx}/img/watch.jpg" alt="watch"/>
							<figcaption>
								<h2><span></span></h2>
								<p style="padding:3px;font-size:16px;">天梭<br>T0636171603</p>
								<p style="padding:1px;">￥4085.97</p>
								<p style="padding:1px;">3期/6期/12期</p>
							</figcaption>			
						</figure>
					</div>
					<div class="puzzle_box small_box grid" style="left:140px;">
						<figure class="effect-ming small">
							<img src="${ctx}/img/camera.jpg" alt="camera"/>
							<figcaption>
								<h2><span></span></h2>
								<p style="padding:3px;font-size:16px;">佳能<br>EOS 80D</p>
								<p style="padding:1px;font-size:12px;">￥8989.98</p>
								<p style="padding:1px;">6期/12期/24期</p>
							</figcaption>			
						</figure>
					</div>
					<div class="puzzle_box small_box grid" style="left:280px;">
						<figure class="effect-ming small">
							<img src="${ctx}/img/bag.jpg" alt="bag"/>
							<figcaption>
								<h2><span></span></h2>
								<p style="padding:3px;font-size:16px;">TOM TAILOR<br>双肩包</p>
								<p style="padding:1px;">￥498.08</p>
								<p style="padding:1px;">3期</p>
							</figcaption>			
						</figure>
					</div>
					<div class="puzzle_box big_box grid" style="top:140px;">
						<figure class="effect-ming big">
							<img src="${ctx}/img/laptop.jpg" alt="laptop"/>
							<figcaption>
								<h2><span></span></h2>
								<p style="padding:0px;font-size:22px;">Dell X13系列</p>
								<p>9350-3708：￥6988.98<br>
								   9350-4708：￥8999.98
								</p>
								<p>3期/6期/12期/24期</p>
							</figcaption>			
						</figure>
					</div>
					<div class="puzzle_box small_box grid" style="left:280px;top:140px;">
						<figure class="effect-ming small">
							<img src="${ctx}/img/earphone.jpg" alt="earphone"/>
							<figcaption>
								<h2><span></span></h2>
								<p style="padding:3px;font-size:16px;">森海塞尔<br>HD 598</p>
								<p style="padding:1px;">￥1799.98</p>
								<p style="padding:1px;">3期/6期</p>
							</figcaption>			
						</figure>
					</div>
					<div class="puzzle_box small_box grid" style="left:280px;top:280px;">
						<figure class="effect-ming small">
							<img src="${ctx}/img/wallpaper.jpg" alt="wallpaper"/>
							<figcaption>
								<h2><span></span></h2>
								<p style="padding:3px;font-size:16px;">本木壁纸<br>HS210101</p>
								<p style="padding:1px;">￥158.06</p>
								<p style="padding:1px;">3期/6期</p>
							</figcaption>			
						</figure>
					</div>
					<div class="puzzle_box big_box grid" style="left:420px;">
						<figure class="effect-ming big">
							<img src="${ctx}/img/phone.jpg" alt="phone"/>
							<figcaption>
								<h2><span></span></h2>
								<p style="padding:0px;font-size:22px;">iPhone Pro</p>
								<p>32G:￥4088.98<br>
									64G:￥5188.98
								</p>
								<p>3期/6期/12期/24期</p>
							</figcaption>			
						</figure>
					</div>
					<div class="puzzle_box small_box grid" style="left:420px;top:280px;">
						<figure class="effect-ming small">
							<img src="${ctx}/img/biscuit.jpg" alt="biscuit"/>
							<figcaption>
								<h2><span></span></h2>
								<p style="padding:3px;font-size:16px;">白色恋人</p>
								<p style="padding:1px;">￥358.15</p>
								<p style="padding:1px;">3期</p>
							</figcaption>			
						</figure>
					</div>
					<div class="puzzle_box small_box grid" style="left:560px;top:280px;">
						<figure class="effect-ming small">
							<img src="${ctx}/img/sofa.jpg" alt="sofa"/>
							<figcaption>
								<h2><span></span></h2>
								<p style="padding:3px;font-size:16px;">奥古拉<br>折叠沙发床</p>
								<p style="padding:1px;">￥1189.18</p>
								<p style="padding:1px;">3期/6期</p>
							</figcaption>			
						</figure>
					</div>
					<div class="puzzle_box small_box grid" style="left:700px;top:0px;">
						<figure class="effect-ming small">
							<img src="${ctx}/img/books.jpg" alt="books"/>
							<figcaption>
								<h2><span></span></h2>
								<p style="padding:3px;font-size:15px;">东野圭吾精选集</p>
								<p style="padding:1px;">￥106.61</p>
								<p style="padding:1px;">3期</p>
							</figcaption>			
						</figure>
					</div>
					<div class="puzzle_box small_box grid"" style="left:700px;top:140px;">
						<figure class="effect-ming small">
							<img src="${ctx}/img/pen.jpg" alt="pen"/>
							<figcaption>
								<h2><span></span></h2>
								<p style="padding:3px;font-size:15px;">凌美  恒星系列<br>L71笔尖</p>
								<p style="padding:1px;">￥298.00</p>
								<p style="padding:1px;">3期</p>
							</figcaption>			
						</figure>
					</div>
					<div class="puzzle_box small_box grid"" style="left:700px;top:280px;">		
						<figure class="effect-ming small">
							<img src="${ctx}/img/hardDisk.jpg" alt="hardDisk"/>
							<figcaption>
								<h2><span></span></h2>
								<p style="padding:3px;font-size:15px;">希捷 移动硬盘<br>STDR1000103</p>
								<p style="padding:0px;">1TB:￥367.71<br>2TB:￥534.88 </p>
								<p style="padding:1px;">3期</p>
							</figcaption>			
						</figure>
					</div>
					
				</div>
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
	
</body>
</html>