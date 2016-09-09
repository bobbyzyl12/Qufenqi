<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://apps.bdimg.com/libs/bootstrap/3.3.0/css/bootstrap.min.css">  
  
  <script type="text/javascript" src="${ctx}/js/jquery.min.js"></script>
  <script type="text/javascript" src="${ctx}/js/bootstrap.min.js"></script>
<style type="text/css">
	html,body,div,ul,li
	{
		margin: 0;
		padding: 0;
		height: 100%;
		-webkit-box-sizing: border-box;
    	-moz-box-sizing: border-box;
        box-sizing: border-box;
        font-family: "Microsoft YaHei",Arial,Helvetica,sans-serif;
	}
	
	.header_container
	{
		width:auto;
		height:40px;
	}
	
	div.wrapper{
		position:relative;
		min-height:100%;
		height:auto !important;
		width:100%;
	}
	
	div.main_container{
		padding-bottom:30px;
		overflow:hidden;
		height:600px;
		text-align:center;
	}
	
	div.footer{
		height:30px;
		position:absolute;
		bottom:0px;
		left:0px;
		width:100%;
		text-align:center;
		display:block;
		background-color:#fff;
		border-top-width:1px;
		border-style:solid;
		border-color:#ccc;
		border-bottom-width:0px;
		border-left-width:0px;
		border-right-width:0px;
	}
	
	.header_basic{
		background-color:#2c2c2c;
		height:40px;
		overflow: hidden;
		
		position:relative;
		
		box-shadow: rgba(0,0,0,0.1) 0 1px 2px;
	}
	
	.header_box{
		height:100%;
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
	
	li{
		line-height:40px;
	}
	
	
	a:link,a:visited,a:hover,a:active{
		text-decoration: none;
	}
	
	a.header_btn:link,a.header_btn:visited
	{
		font-size:20px;
		display:block;
		width:120px;
		height:100%;
		color:rgb(255, 255, 255);
		font-weight:bold;
		text-align:center;
		padding:4px;
		border:2px solid #ccc; 
		border-width:0 2px 0 0;
		text-decoration:none;
		text-transform:none;
		margin-left:20px;
		margin-right:20px;
	}
	
	a.header_btn:hover,a.header_btn:active{
		color:#aaa !important;
	}
	
	.header_icon{
		font-size: 22px;
	}
	
	div.index_box{
		float:left;
		height:600px;
		width:300px;
		background-color:#4f90fb;
	}
	
	div.work_area{
		position:relative;
		left:300px;
		width:100%;
		height:600px;
		padding-top:15px;
		padding-bottom:15px;
	}
	
	.index_image_box{
		text-align:center;
		height:200px;
		background-image:url(${ctx}/img/admini.jpg);
		border-bottom: 2px solid #267ED5;
	}
	
	li.index_li{
		line-height:50px;
		height:50px;
		padding-left:30px;
		text-align:left;
		border-bottom: 1px solid #267ED5;
	}
	
	li.index_li:hover{
		background-color:#69a1fc;
	}
	
	li.page_li{
		float: left;
	}
	
	span.index_icon{
		font-size:20px;
		color:#fff;
		margin-right:10px;
	}
	
	span.index_title{
		font-size:20px;
		color:#fff;
		font-weight:bold;
	}
	
/*** Table Styles **/
	.info_table {
	  background: white;
	  border-radius:3px;
	  border-collapse: collapse;
	  height: 320px;
	  margin: auto;
	  max-width:900px;
	  padding:5px;
	  width: 100%;
	  box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
	  animation: float 5s infinite;
	  position:absolute;
	  left:50px;
	}
	
	th.info_title{
		  color:#D5DDE5;;
		  background:#1b1e24;
		  border-bottom:4px solid #9ea7af;
		  border-right: 1px solid #343a45;
		  font-size:23px;
		  font-weight: 100;
		  padding:24px;
		  text-align:left;
		  text-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
		  vertical-align:middle;
	}
	
	div.work_header_box{
		position:relative;
		height:50px;
	}
	
	div.work_table_box{
		position:relative;
		height:450px;
	}
	
	div.work_page_box{
		position:relative;
		height:50px;
	}
	
	div.pages{
		text-align:center;
		margin-left:auto;
		margin-right:auto;
		position: relative;
    	left: -280px;
	}
	
	table.info_table {
	  background: white;
	  border-radius:3px;
	  border-collapse: collapse;
	  height:auto !important;
	  max-height: 450px;
	  margin: auto;
	  max-width: 950px;
	  padding:5px;
	  width: 100%;
	  box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
	  animation: float 5s infinite;
	  
	  table-layout:fixed;
	}
	
	
	th {
 		color:#D5DDE5;;
  		background:#1b1e24;
  		border-bottom:4px solid #9ea7af;
  		border-right: 1px solid #343a45;
  		font-size:15px;
  		font-weight: 100;
  		padding:10px;
 		text-align:left;
  		text-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
  		vertical-align:middle;
	}
	
	th:first-child {
  		border-top-left-radius:3px;
	}
 
	th:last-child {
	  border-top-right-radius:3px;
	  border-right:none;
	}
	
	tr {
	  border-top: 1px solid #C1C3D1;
	  border-bottom-: 1px solid #C1C3D1;
	  color:#666B85;
	  font-size:16px;
	  font-weight:normal;
	  text-shadow: 0 1px 1px rgba(256, 256, 256, 0.1);
	}
	
	tr,td{
		height:20px;
    	line-height:20px;
	}
	
	tr,td{
		overflow-x:hidden;overflow-y:hidden;
		padding-right:5px;
	}
	
	tr:hover td {
  		background:#4E5066;
  		color:#FFFFFF;
  		border-top: 1px solid #22262e;
  		border-bottom: 1px solid #22262e;
	}
	
	tr:first-child {
	  border-top:none;
	}
	
	tr:last-child {
	  border-bottom:none;
	}
	 
	tr:nth-child(odd) td {
	  background:#EBEBEB;
	}
	 
	tr:nth-child(odd):hover td {
	  background:#4E5066;
	}
	
	tr:last-child td:first-child {
	  border-bottom-left-radius:3px;
	}
 
	tr:last-child td:last-child {
	  border-bottom-right-radius:3px;
	}
 
 	td {
  		background:#FFFFFF;
  		padding:5px 10px 5px 10px;
 		text-align:left;
 		vertical-align:middle;
  		font-weight:300;
  		font-size:12px;
 		text-shadow: -1px -1px 1px rgba(0, 0, 0, 0.1);
  		border-right: 1px solid #C1C3D1;
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
 	
 	.add_btn{
 		position:absolute;
 		left:50px;
 		top:0px;
 		background-color:white;
 		
 		height:35px;
 		width:120px;
 		margin:5px 0px 5px 0px;
 		padding:0px;
 		border:1px solid #666;
 		border-radius:5px;
 		outline:none;

 	}
 	
 	.add_btn:hover{
 		border:1px solid #4f90fb;
 		color:#4f90fb;
 	}
 	
 	.add_btn_icon
 	{
 		font-size:14px;
 		color:#4f90fb;
 	}
 	
 	.btn{
		  padding:0;
		  height:25px;
		  width:70px;
		  color:#ffffff;
		  background-color:#4f90fb;
		  font-size:14px;
		  font-weight:normal;
		  border:1px solid #1647e9;
		  -webkit-border-top-left-radius:2px;
		  -moz-border-radius-topleft:2px;
		  border-top-left-radius:2px;
		  -webkit-border-top-right-radius:2px;
		  -moz-border-radius-topright:2px;
		  border-top-right-radius:2px;
		  -webkit-border-bottom-left-radius:2px;
		  -moz-border-radius-bottomleft:2px;
		  border-bottom-left-radius:2px;
		  -webkit-border-bottom-right-radius:2px;
		  -moz-border-radius-bottomright:2px;
		  border-bottom-right-radius:2px;
		  -moz-box-shadow: inset 0px 0px 0px 0px #ffffff;
		  -webkit-box-shadow: inset 0px 0px 0px 0px #ffffff;
		  box-shadow: inset 0px 0px 0px 0px #ffffff;
		  text-align:center;
		  display:inline-block;
		  text-decoration:none;
		  
		  margin-top:3px;
		  margin-bottom:3px;
		}
		
	.btn:hover{
		background-color:#9bc0fd;
		color:#fff;
	}
	
	
 	.btn2{
		  padding:0;
		  height:25px;
		  width:70px;
		  color:#ffffff;
		  background-color:#ff3377;
		  font-size:14px;
		  font-weight:normal;
		  border:1px solid #ff1a66;
		  -webkit-border-top-left-radius:2px;
		  -moz-border-radius-topleft:2px;
		  border-top-left-radius:2px;
		  -webkit-border-top-right-radius:2px;
		  -moz-border-radius-topright:2px;
		  border-top-right-radius:2px;
		  -webkit-border-bottom-left-radius:2px;
		  -moz-border-radius-bottomleft:2px;
		  border-bottom-left-radius:2px;
		  -webkit-border-bottom-right-radius:2px;
		  -moz-border-radius-bottomright:2px;
		  border-bottom-right-radius:2px;
		  -moz-box-shadow: inset 0px 0px 0px 0px #ffffff;
		  -webkit-box-shadow: inset 0px 0px 0px 0px #ffffff;
		  box-shadow: inset 0px 0px 0px 0px #ffffff;
		  text-align:center;
		  display:inline-block;
		  text-decoration:none;
		  
		  margin-top:3px;
		  margin-bottom:3px;
		}
		
	.btn2:hover{
		background-color:#ffccdd;
		color:#fff;
	}
	
	.dialog{
		display: none;
		z-index: 5;
		
		height:150px;
		width:400px;
		background-color: #FFF;
		border: 1px solid #888;
		
		position: fixed !important; /* 浮动对话框 */
		top: 40%;
		left:35%;
		text-align:center;
		margin-left:auto; 
		margin-right:auto;
		
		-moz-border-radius: 10px;
		-webkit-border-radius: 10px;
		border-radius: 10px;
		
		border:2px solid #4f90fb;
	}
	
	.dialog_msg{
		font-size:16px;
		margin-top:30px;
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
	
	div.input_box{
		position:relative;
		top:10px;
		left:20px;
		margin-top:10px;
		height:200px;
		margin-left:auto;
		margin-right:auto;
		text-align:left;
	}
	
	input.signin_input{
		width:350px;
		height:30px;
		font-size:15px;
		margin-bottom:5px;
		padding-left:20px;
		border: 1px solid #ddd;
    	border-radius: 2px;
    	color: #aaa;
    	font-size: 14px;
		outline:none;
		text-align:left;
	}
	
	input.signin_input：hover,input.signin_input:focus{
		border: 1px solid #4f90fb;
	}
	
	input.edit_input{
		width:350px;
		height:30px;
		font-size:15px;
		margin-bottom:5px;
		padding-left:20px;
		border: 1px solid #ddd;
    	border-radius: 2px;
    	color: #aaa;
    	font-size: 14px;
		outline:none;
		text-align:left;
	}
	
	input.edit_input：hover,input.edit_input:focus{
		border: 1px solid #4f90fb;
	}
	
	.alert_msg{
		font-size:10px;
		color:#ff6384;
	}
	
	.signin_title{
		font-size:20px;
		color:#666;
		
		margin:0px;
	}
	
	.title_name{
		font-size:14px;
		font-weight:300;
		font-family:"Microsoft YaHei";
		margin-right:10px;
	}
	
	.btn_cancel{
		  padding:0;
		  margin-left:10px;
		  margin-right:10px;
		  height:40px;
		  width:180px;
		  color:#000;
		  background-color:#fff;
		  font-size:18px;
		  font-weight:normal;
		  border:1px solid #dcdcdc;
		  -webkit-border-top-left-radius:2px;
		  -moz-border-radius-topleft:2px;
		  border-top-left-radius:2px;
		  -webkit-border-top-right-radius:2px;
		  -moz-border-radius-topright:2px;
		  border-top-right-radius:2px;
		  -webkit-border-bottom-left-radius:2px;
		  -moz-border-radius-bottomleft:2px;
		  border-bottom-left-radius:2px;
		  -webkit-border-bottom-right-radius:2px;
		  -moz-border-radius-bottomright:2px;
		  border-bottom-right-radius:2px;
		  -moz-box-shadow: inset 0px 0px 0px 0px #ffffff;
		  -webkit-box-shadow: inset 0px 0px 0px 0px #ffffff;
		  box-shadow: inset 0px 0px 0px 0px #ffffff;
		  text-align:center;
		  display:inline-block;
		  text-decoration:none;
		}
		
	.btn_cancel:hover{
		color:#ff6384;
	}
	
	span.edit_box_show{
		padding-left:8px;
		color:#4f90fb;
		font-size:8px;
	}
	
	.login_title{
		margin-top:5px;
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
	
	$(function(){
		$(".sendBtn").hide();
		$(".money").each(function(){
			var money = $(this).html();
			money = Number(money).toFixed(2);
			$(this).html(money);
		});
		$(".trs").each(function(){
			
			var a = $(this).children(":eq(1)").find(":first").attr("name");
			if(a=="4"){
				$(this).children(":eq(9)").find(".sendBtn").show();
			}
			var b = $(this).children(":eq(8)").html();
			if(b==""){
				$(this).children(":eq(8)").html("无");
			}
		});
		
		$(".editBtn").click(function(){
			var orderID = $(this).attr("title");
			
			var bh = $(".wrapper").height();
		    var bw = $(".wrapper").width();
		    $("#coverbg").css({
		        height: bh,
		        width: bw,
		        display: "block"
		    });
		    
		    $(".alert_msg").hide();
		    $("#editOrderDialog").show();
		    $(".edit_input").hide();
		    $.ajax({ 
				url: '${ctx}/order/findOrder',       //处理测试页面                 
				type: 'POST',                  
				data: {orderID:orderID},                
				success: function (msg){
					$("#receiverInDia").html(msg.reciever);
					$("#editReciever").val(msg.reciever);
					$("#addressInDia").html(msg.address);
					$("#editAddress").val(msg.address);
					if(msg.phone ==""){$("#phoneInDia").html("暂无");}
					else{
						$("#phoneInDia").html(msg.phone);
						$("#editPhone").val(msg.phone);
					}
					
				}
		    });
		    
		    $("#editRecieverBoxShowBtn").click(function(){ $("#editReciever").show();$("#editRecieverBoxShowBtn").hide();});
		    $("#editAddressBoxShowBtn").click(function(){ $("#editAddress").show();$("#editAddressBoxShowBtn").hide();});
		    $("#editPhoneBoxShowBtn").click(function(){ $("#editPhone").show();$("#editPhoneBoxShowBtn").hide();});
		    
		    $("#saveEditButton").click(function(){
		    	var ok = false;
		    	
		    	var person = $("#editReciever").val();
		    	var address = $("#editAddress").val();
		    	var phone = $("#editPhone").val();
		    	
		    	if(phone==""){
		    		ok=true;
		    	}
		    	else{
		    		var regPhone=/^1[3|4|5|7|8]\d{9}$/;
		    		if(regPhone.test(phone)){
		    			ok=true;
		    		}
		    		else{ok=false;$("#phoneError").show();}
		    	}
		    	
		    	if(ok){
		    		 $.ajax({ 
		 				url: '${ctx}/order/updateOrderSendData',       //处理测试页面                 
		 				type: 'POST',                  
		 				data: {'orderID':orderID,'person':person,'address':address,'phone':phone},                
		 				success: function (msg){
		 					var bh = $(".wrapper").height();
		 				    var bw = $(".wrapper").width();
		 				    $("#coverbg").css({
		 				        height: bh,
		 				        width: bw,
		 				        display: "block"
		 				    });
		 				    $("#editOrderDialog").hide();
		 				    $("#editSuccessDialog").show();
		 				}
		 		    });
		    	}
		    });
		})
	});
function closeBg() {
	    $("#coverbg").hide();
	    $(".dialog").hide();
	}
</script>
</head>
<body>
	<div class="wrapper">
		<div class="header_container">
			<div class="header_basic">
				<div class="header_box">
						<div class="header_botton_box">
						<ul>
							<li>
								<a href="${ctx}/user/adminLogout" class="header_btn" style="border-width:0 2px 0 2px;">
	  								<span class="glyphicon glyphicon-log-out header_icon"></span>
	  								<span style="font-size:16px;">&nbsp;退出登陆</span>
								</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="main_container">
			<div class="index_box">
				<div class="index_image_box">
				</div>
				<ul>
					<li	class="index_li">
						<a href="${ctx}/page/jumpToUserAdmin">
							<span class="glyphicon glyphicon-user index_icon"></span>
							<span class="index_title">用户信息管理</span>
						</a>
					</li>
					<li	class="index_li">
						<a href="${ctx}/page/jumpToGoodsAdmin">
							<span class="glyphicon glyphicon-certificate index_icon"></span>
							<span class="index_title">商品信息管理</span>
						</a>
					</li>
					<li	class="index_li">
						<a href="${ctx}/page/jumpToCreditAdmin">
							<span class="glyphicon glyphicon-credit-card index_icon"></span>
							<span class="index_title">信用信息管理</span>
						</a>
					</li>
					<li	class="index_li">
						<a href="${ctx}/page/jumpToOrderAdmin">
							<span class="glyphicon glyphicon-list-alt index_icon"></span>
							<span class="index_title">订单信息管理</span>
						</a>
					</li>
				</ul>
			</div>
			<div class="work_area">
				<div class="work_header_box">
					
				</div>		
				<div class="work_table_box">
					<table class="info_table" style="text-align:center;">
						<thead>
							<tr>
								<th width=50px>编号</th>
  								<th width=100px>状态</th>
  								<th width=100px>生成时间</th>
  								<th width=100px>原始总价</th>
  								<th width=50px>期数</th>
  								<th width=50px>信用<br></th>
  								<th width=150px>收件地址</th>
  								<th width=70px>收件人</th>
  								<th width=90px>联系电话</th>
  								<th width=70px></th>

							</tr>
						</thead>
						<tbody>
							<c:forEach items="${pageModel.datas}" var="order">
				             <tr class="trs">
				          		<td>${order.orderID}</td>
				          		<td class="state">
					          		<c:choose>
    									<c:when test="${order.state == '1'}">
						       				<span name="1" style="color:#00b300;font-weight:700">等待支付</span>
						   				</c:when>
						    			<c:when test="${order.state=='2'}">
						       				<span name="2" style="color:#aaa;font-weight:700">已冻结</span>
						   				</c:when>
						    			<c:when test="${order.state=='3'}">
						       				<span name="3"style="color:#00b386;font-weight:700">等待首次支付</span>
						   				</c:when>
						   				<c:when test="${order.state=='4'}">
						       				<span name="4" style="color:#e5e600;font-weight:700">待发货</span>
						   				</c:when>
						   				<c:when test="${order.state=='5'}">
						       				<span name="5" style="color:#73e600;font-weight:700">已发货</span>
						   				</c:when>
						   				<c:when test="${order.state=='6'}">
						       				<span name="6" style="color:#FF9C9E;font-weight:700">等待人工审核</span>
						   				</c:when>
						   				<c:when test="${order.state=='7'}">
						       				<span name="7" style="color: #4db8ff;font-weight:700">支付完成</span>
						   				</c:when>
						   				<c:when test="${order.state=='8'}">
						       				<span name="8" style="color: #red;font-weight:700">已逾期</span>
						   				</c:when>
   										</c:choose>
									</td>
								<td>
									<fmt:formatDate value="${order.orderCreateTime}" pattern="yyyy-MM-dd"/>
								</td>
								<td>￥<span class="money">${order.orderPrice}</span></td>
								<td>${order.orderStage}</td>
								<td>${order.orderCredit}</td>
								<td>${order.address}</td>
								<td>${order.reciever}</td>
								<td>${order.phone}</td>
				  				<td style="padding:0px 5px 0px 5px">
				  					<a href="#" class="btn editBtn" id="editBtn" title="${order.orderID}">修改</a>
				  					<a href="${ctx}/order/sendOrder?orderID=${order.orderID}" class="btn2 sendBtn" id="sendBtn" title="${order.orderID}">发货</a>
				  				</td>
				         	</tr>
				         </c:forEach>
				         
						</tbody>
					</table>
				</div>
				<div class="work_page_box">
					<div class="pages" align="center">
								<a href="${ctx}/page/jumpToOrderAdmin?pageNo=${pageModel.pageNo-1}"><button class="page_btn" style="width:100px" id="prePage">上一页</button></a>
							
							
								<a href="${ctx}/page/jumpToOrderAdmin"><button class="page_btn" id="page_btn1">1</button></a>
							
								<span class="pages_span" id="prePoint">...</span>
							
								<a href="${ctx}/page/jumpToOrderAdmin?pageNo=${pageModel.pageNo-2}"><button class="page_btn" id="page_btn2"></button></a>
							
								<a href="${ctx}/page/jumpToOrderAdmin?pageNo=${pageModel.pageNo-1}"><button class="page_btn" id="page_btn3"></button></a>
							
								<a><button class="page_btn" id="page_btn4"></button></a>
							
								<a href="${ctx}/page/jumpToOrderAdmin?pageNo=${pageModel.pageNo+1}"><button class="page_btn" id="page_btn5"></button></a>
							
								<a href="${ctx}/page/jumpToOrderAdmin?pageNo=${pageModel.pageNo+2}"><button class="page_btn" id="page_btn6"></button></a>
							
								<span class="pages_span" id="sufPoint">...</span>
							
								<a href="${ctx}/page/jumpToOrderAdmin?pageNo=${pageModel.totalpage}"><button class="page_btn" id="page_btn7"></button></a>
							
								<a href="${ctx}/page/jumpToOrderAdmin?pageNo=${pageModel.pageNo+1}"><button class="page_btn" style="width:100px;" id="sufPage">下一页</button></a>
							
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="footer">
				Copyright (c) 2016	
		</div>
	</div>
	
	<!-- jQuery 遮罩层 -->
	<div id="coverbg" class="coverbg"></div>
	
	<!-- 这里存放dialogs -->
		<div id="editOrderDialog" style="top:20%;height:320px;" class="dialog">
		<div class="input_box">
			<p class="login_title">
				<span class="title_name">收件人名:</span><span class="title_name" id="receiverInDia"></span>
				<a href="#"><span class="edit_box_show" id="editRecieverBoxShowBtn">修改收件人</span></a>
			</p>
			<input type="text" id="editReciever" placeholder="请输入收件人名" class="edit_input">
						
			<p class="login_title">
				<span class="title_name">收件地址:</span><span class="title_name" id="addressInDia"></span>
				<a href="#"><span class="edit_box_show" id="editAddressBoxShowBtn">修改地址</span></a>
			</p>
			<input type="text" id="editAddress" placeholder="请输入收件地址" class="edit_input">
						
			<p class="login_title">
				<span class="title_name">手机号码:</span><span class="title_name" id="phoneInDia"></span>
				<a href="#"><span class="edit_box_show" id="editPhoneBoxShowBtn">修改手机号码</span></a>
				<span class="alert_msg" id="phoneError">*请确认手机正确</span>
			</p>
			<input type="text" id="editPhone" placeholder="请填写联系方式" class="edit_input">
		</div>
		<div style="position:relative;bottom:0px;border-top:1px solid #ccc;margin-top:40px;padding-top:10px;padding-right:20px;text-align:right;">
			<button class="btn" id="saveEditButton" style="width:100px;height:35px;font-size:16px;">保存</button>
	  		<a href="#" onclick="closeBg();"><button class="btn_cancel" style="width:100px;height:35px;font-size:16px;">取消</button></a>
		</div>
	</div>
	
	<div id="editSuccessDialog" class="dialog">
		<p class="dialog_msg">修改成功</p>
  		<a href="${ctx}/page/jumpToOrderAdmin?pageNo=${pageModel.pageNo}" onclick="closeBg();"><button class="btn" style="width:120px;height:40px;font-size:18px;">关闭</button></a>
	</div>
	<!-- 临时存放数据用 -->
	<p style="display:none" id="totalPage">${pageModel.totalpage}</p>
	<p style="display:none" id="pageNo">${pageModel.pageNo}</p>
</body>
</html>
