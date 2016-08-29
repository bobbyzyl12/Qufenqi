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
		}
		
	.btn:hover{
		background-color:#9bc0fd;
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
		height:400px;
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
		margin-right:5px;
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
		$("#addBtn").click(function(){
			$("#addUserDialog").show();
			$(".alert_msg").hide();
			var bh = $(".wrapper").height();
		    var bw = $(".wrapper").width();
		    $("#coverbg").css({
		        height: bh,
		        width: bw,
		        display: "block"
		    });
			
			$("#signinButton").click(function(){
				//获取输入的用户名和密码以及个人信息并将其赋值给temp进行判断和传值
				var tempUserName = $("#userName").val();
				var tempUserPwd =  $("#userPwd").val();
				var tempUserCheckPwd =  $("#userCheckPwd").val();
				var tempUserPhone =  $("#userPhone").val();
				var tempUserEmail =  $("#userEmail").val();
				var tempUserIdentify =  $("#userIdentify").val();
				
				var tempDefalut = Number(1);
				
				$("#userNameError").hide();
				$("#userPwdError").hide();
				$("#userCheckPwdError").hide();
				$("#userIdentifyError").hide();
				$("#userPhoneError").hide();
				$("#userEmailError").hide();
				
				//用于记录所有的输入是否合法
				var ok1=false;
				var ok2=false;
				var ok3=false;
				var ok4=false;
				var ok5=false;
				var ok6=false;
				
				//验证邮箱和电话正确的正则表达式
				var regPwd=/[a-zA-Z0-9]*/;
				var regPhone=/^1[3|4|5|7|8]\d{9}$/;
				var regEmail=/^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;
				var regIdentify=/^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}([0-9]|X)$/;
				
				//较为简单的判断逻辑
		        if(tempUserName=="" || tempUserName.length < 3 || tempUserName.length > 32){
		        	 $("#userNameError").show();
		            }
		        else{ok1=true;}
		     
		        if(tempUserPwd=="" || tempUserPwd.length < 3 || tempUserPwd.length > 32||(!regPwd.test(tempUserPwd ))){
		        	 $("#userPwdError").show();
		        }
		    	else{ok2=true;}
		        
		        if(regPhone.test(tempUserPhone)){
		        	 ok3=true;
		        }
		        else if(tempUserPhone==""){
		        	tempUserPhone="none";
		        	ok3=true;
		        }
		    	else if(tempUserPhone!=""&&!regPhone.test(tempUserPhone))
		    	{
		    		 $("#userPhoneError").show();
		    	}
		        
		        if(regEmail.test(tempUserEmail)){
		        	ok4=true;
		        }
		        else if(tempUserEmail==""){
		        	tempUserEmail="none";
		        	ok4=true;
		        }
		    	else if(tempUserEmail!=""&&!regEmail.test(tempUserEmail)){
		    		$("#userEmailError").show();
		    	}
		        
		        if(tempUserPwd!=tempUserCheckPwd||tempUserCheckPwd==""){
		        	$("#userCheckPwdError").show();
		        }
		    	else{
		    		ok5=true;
		    	}
		        
		        if(regIdentify.test(tempUserIdentify)){
		        	ok6=true;
		        }
		        else if(tempUserIdentify==""){
		        	tempUserIdentify="none";
		        	ok6=true;
		        }
		    	else{
		    		$("#userIdentifyError").show();
		    	}
		        
		       	//创建一个临时的user变量用于传参,用户信用等级默认设置为1，用户的状态默认设置为正常状态
		        var tempUser={'userName':tempUserName,'userPwd':tempUserPwd,'userEmail':tempUserEmail,'userPhone':tempUserPhone,'userIdentify':tempUserIdentify,'userCredit':tempDefalut,'userState':tempDefalut,'userBadHistory':tempDefalut,'userOwe':tempDefalut};

		        if(ok1&&ok2&&ok3&&ok4&&ok5&&ok6){			//如有一个不合法(即为false)则不提交至后台
		        	$.ajax({ 							//提交                          	  
					url: ' ${ctx}/user/signin',       //处理注册的页面                 
					type: 'POST',
					data: tempUser,                
					success: function (msg) { 
		                if (msg == "success"){
		                	window.location.href='${ctx}/page/jumpToUserAdmin';
		                  }
		                else if(msg == "repeat"){
		                	$("#repeatError").show();
		                }
		                else if(msg == "repeatIdentify"){
		                	$("#repeatIdentifyError").show();
		                }
						else{
							
						}
						}              
					});    
		        }         		  
			});
		  });
	});
	
	$(function(){
		$(".tryDeleteBtn").click(function(){
			var userID = $(this).attr('title');
			var bh = $(".wrapper").height();
		    var bw = $(".wrapper").width();
		    $("#coverbg").css({
		        height: bh,
		        width: bw,
		        display: "block"
		    });
		    $("#deleteConfirmDialog").show();
        	$("#deleteBtn").click(function(){
        		$.ajax({ 
    				url: '${ctx}/user/deleteUser',       //处理测试页面                 
    				type: 'POST',                  
    				data: {userID:userID},                
    				success: function (msg){
    	            if (msg == "success"){
    	            	var bh = $(".wrapper").height();
    				    var bw = $(".wrapper").width();
    				    $("#coverbg").css({
    				        height: bh,
    				        width: bw,
    				        display: "block"
    				    });
                    	$("#deleteSuccessDialog").show();
    	            }
    	            else{}
    				}
    			});
        		
        	});
        	
		});
	});
	
	$(function(){
		$(".editBtn").click(function(){
			var userID = $(this).attr('title');
			var bh = $(".wrapper").height();
		    var bw = $(".wrapper").width();
		    $("#coverbg").css({
		        height: bh,
		        width: bw,
		        display: "block"
		    });
		    $(".alert_msg").hide();
		    $("#editUserDialog").show();
		    $(".radio_text").hide();
		    $.ajax({ 
				url: '${ctx}/user/getUser',       //处理测试页面                 
				type: 'POST',                  
				data: {userID:userID},                
				success: function (msg){
	            	$("#userNameInDia").html(msg.userName);
	            	$("#userPwdInDia").html(msg.userPwd);
	            	$("#userPhoneInDia").html(msg.userPhone);
	            	$("#userEmailInDia").html(msg.userEmail);
	            	$("#userIdentifyInDia").html(msg.userIdentify);
	            	if(msg.userState == "1")
	            		$("#userStateInDia").html("正常");
	            	else if(msg.userState == "2")
	            		$("#userStateInDia").html("申请提高信用额度中");
	            	else if(msg.userState == "3")
	            		$("#userStateInDia").html("已冻结");
				}
			});
		    
		    
		    $(".edit_input").hide();
		    $(".editUserState").hide();
		    $(".edit_box_show").show();
        	$("#editNameBoxShowBtn").click(function(){ $("#editUserName").show();$("#editNameBoxShowBtn").hide();});
        	$("#editPwdBoxShowBtn").click(function(){ $("#editUserPwd").show();$("#editPwdBoxShowBtn").hide();});
        	$("#editIdentifyBoxShowBtn").click(function(){ $("#editUserIdentify").show();$("#editIdentifyBoxShowBtn").hide();});
        	$("#editPhoneBoxShowBtn").click(function(){ $("#editUserPhone").show();$("#editPhoneBoxShowBtn").hide();});
        	$("#editEmailBoxShowBtn").click(function(){ $("#editUserEmail").show();$("#editEmailBoxShowBtn").hide();});
        	$("#editStateBoxShowBtn").click(function(){ $(".editUserState").show();$(".radio_text").show();$("#editStateBoxShowBtn").hide();});
			
    		$("#saveEditButton").click(function(){
    			var tempUserName= $("#editUserName").val();
        		var tempUserPwd= $("#editUserPwd").val();
        		var tempUserPhone= $("#editUserPhone").val();
        		var tempUserEmail= $("#editUserEmail").val();
        		var tempUserIdentify= $("#editUserIdentify").val();
        		var tempUserState= $('.input_box input[name="stateChoice"]:checked').val();
        		var tempDefalut = Number(1);
        		
        		var ok1=false;
        		var ok2=false;
        		var ok3=false;
        		var ok4=false;
        		var ok5=false;
        		var ok6=false;
        		
        		var regPwd=/[a-zA-Z0-9]*/;
        		var regPhone=/^1[3|4|5|7|8]\d{9}$/;
        		var regEmail=/^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;
        		var regIdentify=/^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}([0-9]|X)$/;
        		
        		//较为简单的判断逻辑
    	        if(tempUserName==""){
    	        	tempUserName = $("#userNameInDia").html();
    	        	ok1=true;
    	        }
    	        else{
    	        	if(tempUserName.length < 3 || tempUserName.length > 32){
       	        	 $("#userNameError2").show();
       	        	}
    	        	 else{ok1=true;}
    	        }
    	       
    	     
    	        if(tempUserPwd==""){
    	        	tempUserPwd = $("#userPwdInDia").html();
    	        	ok2=true;
    	        }
    	        else{ 
    	        	if(tempUserPwd.length < 3 || tempUserPwd.length > 32||(!regPwd.test(tempUserPwd))){
    	        		$("#userPwdError2").show();
    	        	}
    	    		else{ok2=true;}
    	        }
    	        if(regPhone.test(tempUserPhone)){
    	        	 ok3=true;
    	        }
    	        else if(tempUserPhone==""){
    	        	tempUserPhone = $("#userPhoneInDia").html();
    	        	ok3=true;
    	        }
    	    	else if(tempUserPhone!=""&&!regPhone.test(tempUserPhone))
    	    	{
    	    		 $("#userPhoneError2").show();
    	    	}
    	        
    	        if(regEmail.test(tempUserEmail)){
    	        	ok4=true;
    	        }
    	        else if(tempUserEmail==""){
    	        	tempUserEmail = $("#userEmailInDia").html();
    	        	ok4=true;
    	        }
    	    	else if(tempUserEmail!=""&&!regEmail.test(tempUserEmail)){
    	    		$("#userEmailError2").show();
    	    	}
    	        
    	        if(tempUserState==""){
    	        	tempUserState = Number(9);
    	        	ok5=true;
    	        }
    	    	else{
    	    		ok5=true;
    	    	}
    	        
    	        if(regIdentify.test(tempUserIdentify)){
    	        	ok6=true;
    	        }
    	        else if(tempUserIdentify==""){
    	        	tempUserIdentify=$("#userIdentifyInDia").html();
    	        	ok6=true;
    	        }
    	    	else{
    	    		$("#userIdentifyError2").show();
    	    	}
    	        
    	        var tempUser={'userID':userID,'userName':tempUserName,'userPwd':tempUserPwd,'userEmail':tempUserEmail,'userPhone':tempUserPhone,'userState':tempUserState,'userIdentify':tempUserIdentify,'userCredit':tempDefalut,'userBadHistory':tempDefalut,'userOwe':tempDefalut};
    	        
    			
	        	if(ok1&&ok2&&ok3&&ok4&&ok5&&ok6){
	        		$.ajax({                           	  
						url: '${ctx}/user/updateUser',       //处理测试页面                 
						type: 'POST',                  
						data: tempUser,                
						success: function (msg){
			                if (msg == "success"){
			                	$("#editUserDialog").hide();
			                	$("#editSuccessDialog").show();
			                  }
			                else if(msg == "repeat"){
			                	$("#repeatError2").show();
			                  }
			                else if(msg == "repeatIdentify"){
			                	$("#repeatIdentifyError2").show();
			                  }
							else{
							}	
						}
					});
	        	}
	        	
	        });
	        
	        
		});
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
					<button id="addBtn" class="add_btn">
						<span class="glyphicon glyphicon-plus add_btn_icon"></span>
						<span>增加用户</span>
					</button>
				</div>		
				<div class="work_table_box">
					<table class="info_table">
						<thead>
							<tr>
								<th width=50px>ID</th>
  								<th width=100px>用户名</th>
					  			<th width=100px>密码</th>
					  			<th width=120px>电话</th>
					  			<th width=150px>邮箱</th>
					  			<th width=70px>状态</th>
					  			<th width=150px>身份证号</th>
					  			<th width=80px></th>
					  			<th width=80px></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${pageModel.datas}" var="user">
				             <tr>
				          		<td>${user.userID}</td>
				  				<td>${user.userName}</td>
				  				<td>${user.userPwd}</td>
				  				<td>${user.userPhone}</td>
				  				<td>${user.userEmail}</td>
				  				<td>
				  					<c:choose>
				    					<c:when test="${user.userState == '1'}">
				       						<span style="color:#00b300;">正常</span>
				   						</c:when>
				    					<c:when test="${user.userState=='3'}">
				       						<span style="color:#888;">已冻结</span>
				   						</c:when>
				   						<c:when test="${user.userState=='2'}">
				       						<span style="color: #4d4dff;">审核中</span>
				   						</c:when>
				   						<c:when test="${user.userState=='4'}">
				       						<span style="color: #000;">已删除</span>
				   						</c:when>
				   						<c:when test="${user.userState=='5'}">
				       						<span style="color: #cc00cc;">特殊</span>
				   						</c:when>
									</c:choose>
				  				</td>
				           		<td>${user.userIdentify}</td>
				           		<td style="padding:0px 5px 0px 5px">
				  					<a href="#" class="btn editBtn" id="editBtn" title="${user.userID}">修改</a>
				  				</td>
				  				<td style="padding:0px 5px 0px 5px">
				  					<a href="#" class="btn tryDeleteBtn" id="tryDeleteBtn" title="${user.userID}">删除</a>
				  				</td>
				         	</tr>
				         </c:forEach>
				         
						</tbody>
					</table>
				</div>
				<div class="work_page_box">
					<div class="pages" align="center">
								<a href="${ctx}/page/jumpToUserAdmin?pageNo=${pageModel.pageNo-1}"><button class="page_btn" style="width:100px" id="prePage">上一页</button></a>
							
							
								<a href="${ctx}/page/jumpToUserAdmin"><button class="page_btn" id="page_btn1">1</button></a>
							
								<span class="pages_span" id="prePoint">...</span>
							
								<a href="${ctx}/page/jumpToUserAdmin?pageNo=${pageModel.pageNo-2}"><button class="page_btn" id="page_btn2"></button></a>
							
								<a href="${ctx}/page/jumpToUserAdmin?pageNo=${pageModel.pageNo-1}"><button class="page_btn" id="page_btn3"></button></a>
							
								<a><button class="page_btn" id="page_btn4"></button></a>
							
								<a href="${ctx}/page/jumpToUserAdmin?pageNo=${pageModel.pageNo+1}"><button class="page_btn" id="page_btn5"></button></a>
							
								<a href="${ctx}/page/jumpToUserAdmin?pageNo=${pageModel.pageNo+2}"><button class="page_btn" id="page_btn6"></button></a>
							
								<span class="pages_span" id="sufPoint">...</span>
							
								<a href="${ctx}/page/jumpToUserAdmin?pageNo=${pageModel.totalpage}"><button class="page_btn" id="page_btn7"></button></a>
							
								<a href="${ctx}/page/jumpToUserAdmin?pageNo=${pageModel.pageNo+1}"><button class="page_btn" style="width:100px;" id="sufPage">下一页</button></a>
							
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
	<div id="addUserDialog" style="top:10%;height:500px;" class="dialog">
		<div class="input_box">
			<p class="login_title">
				<span class="title_name">用户名</span><span class="title_name" style="font-size:10px">（必填）</span>
				<span class="alert_msg" id="userNameError">*账号长度应在3-32字符之间</span>
				<span class="alert_msg" id="repeatError">*该账号已被使用</span>
			</p>
			<input type="text" id="userName" placeholder="请输入账号" class="signin_input">
						
			<p class="login_title">
				<span class="title_name">密码</span><span class="title_name" style="font-size:10px">（必填）</span>
				<span class="alert_msg" id="userPwdError">*密码长度应在3-32字符之间</span>
			</p>
			<input type="password" id="userPwd" placeholder="请输入密码" class="signin_input">
						
			<p class="login_title">
				<span class="title_name">确认密码</span><span class="title_name" style="font-size:10px">（必填）</span>
				<span class="alert_msg" id="userCheckPwdError">*确认密码应与密码一样</span>
			</p>
			<input type="password" id="userCheckPwd" placeholder="请再次输入密码" class="signin_input">	
						
			<p class="login_title">
				<span class="title_name">身份证号码</span>
				<span class="alert_msg" id="userIdentifyError">*请确认身份证格式</span>
				<span class="alert_msg" id="repeatIdentifyError">*该身份证已使用</span>
			</p>
			<input type="text" id="userIdentify" placeholder="请填写身份证" class="signin_input">
			
			<p class="login_title">
				<span class="title_name">邮箱</span>
				<span class="alert_msg" id="userEmailError">*请确认邮箱填写正确</span>
			</p>
			<input type="text" id="userEmail" placeholder="请填写邮箱" class="signin_input">
						
			<p class="login_title">
				<span class="title_name">电话号码</span>
				<span class="alert_msg" id="userPhoneError">*请确认电话号码填写正确</span>
			</p>
			<input type="text" id="userPhone" placeholder="请填写手机" class="signin_input">
			</div>
			<div style="border-top:1px solid #ccc;margin-top:30px;padding-top:10px;padding-right:20px;text-align:right;">
				<button class="btn" id="signinButton" style="width:100px;height:35px;font-size:16px;">保存</button>
	  			<a href="#" onclick="closeBg();"><button class="btn_cancel" style="width:100px;height:35px;font-size:16px;">取消</button></a>
			</div>
					
	</div>
	
	<div id="deleteConfirmDialog" class="dialog">
		<p class="dialog_msg">确认冻结该用户？</p>
  		<a href="#" id="deleteBtn" onclick="closeBg();"><button class="btn" style="width:120px;height:40px;font-size:18px;">确认</button></a>
		<a href="#" onclick="closeBg();"><button class="btn" style="width:120px;height:40px;font-size:18px;background-color:#fff;color:#666;border-color:#666;">取消</button></a>
	</div>
	
	<div id="deleteSuccessDialog" class="dialog">
		<p class="dialog_msg">冻结用户成功</p>
  		<a href="${ctx}/page/jumpToUserAdmin?pageNo=${pageModel.pageNo}" onclick="closeBg();"><button class="btn" style="width:120px;height:40px;font-size:18px;">关闭</button></a>
	</div>
	
	<div id="editSuccessDialog" class="dialog">
		<p class="dialog_msg">修改成功</p>
  		<a href="${ctx}/page/jumpToUserAdmin?pageNo=${pageModel.pageNo}" onclick="closeBg();"><button class="btn" style="width:120px;height:40px;font-size:18px;">关闭</button></a>
	</div>
	
	<div id="editUserDialog" style="top:10%;height:520px;" class="dialog">
		<div class="input_box">
			<p class="login_title">
				<span class="title_name">用户名:&nbsp;&nbsp;</span><span class="title_name" id="userNameInDia"></span>
				<a href="#"><span class="edit_box_show" id="editNameBoxShowBtn">修改用户名</span></a>
				<span class="alert_msg" id="userNameError2">*账号长度应在3-32字符之间</span>
				<span class="alert_msg" id="repeatError2">*该账号已被使用</span>
			</p>
			<input type="text" id="editUserName" placeholder="请输入账号" class="edit_input">
						
			<p class="login_title">
				<span class="title_name">密码:&nbsp;&nbsp;</span><span class="title_name" id="userPwdInDia"></span>
				<a href="#"><span class="edit_box_show" id="editPwdBoxShowBtn">修改密码</span></a>
				<span class="alert_msg" id="userPwdError2">*密码长度应在3-32字符之间</span>
			</p>
			<input type="password" id="editUserPwd" placeholder="请输入密码" class="edit_input">
						
			<p class="login_title">
				<span class="title_name">身份证号码:&nbsp;&nbsp;</span><span class="title_name" id="userIdentifyInDia"></span>
				<a href="#"><span class="edit_box_show" id="editIdentifyBoxShowBtn">修改身份证号码</span></a>
				<span class="alert_msg" id="userIdentifyError2">*请确认身份证格式</span>
				<span class="alert_msg" id="repeatIdentifyError2">*该身份证已使用</span>
			</p>
			<input type="text" id="editUserIdentify" placeholder="请填写身份证" class="edit_input">
			
			<p class="login_title">
				<span class="title_name">邮箱:&nbsp;&nbsp;</span><span class="title_name" id="userEmailInDia"></span>
				<a href="#"><span class="edit_box_show" id="editEmailBoxShowBtn">修改邮箱</span></a>
				<span class="alert_msg" id="userEmailError2">*请确认邮箱填写正确</span>
			</p>
			<input type="text" id="editUserEmail" placeholder="请填写邮箱" class="edit_input">
						
			<p class="login_title">
				<span class="title_name">电话:&nbsp;&nbsp;</span><span class="title_name" id="userPhoneInDia"></span>
				<a href="#"><span class="edit_box_show" id="editPhoneBoxShowBtn">修改电话</span></a>
				<span class="alert_msg" id="userPhoneError2">*请确认电话号码填写正确</span>
			</p>
			<input type="text" id="editUserPhone" placeholder="请填写手机" class="edit_input">
			
			<p class="login_title">
				<span class="title_name">状态:&nbsp;&nbsp;</span>
				<span class="title_name" id="userStateInDia"></span>
				<a href="#"><span class="edit_box_show" id="editStateBoxShowBtn">修改状态</span></a>
			</p>
			<input type="radio" name="stateChoice"  class="editUserState" value="1" /><span style="display:none;" class="radio_text">正常</span>
    		<input type="radio" name="stateChoice" class="editUserState" value="2" /><span style="display:none;" class="radio_text">申请中</span>
    		<input type="radio" name="stateChoice" class="editUserState" value="3" /><span style="display:none;" class="radio_text">已冻结</span>
    		<input type="radio" name="stateChoice" class="" style="display:none;" value="9" /><span style="display:none;">未填写</span>
			<span style="display:none;" id="userStateInDia"></span>
			</div>
			<div style="position:relative;bottom:0px;border-top:1px solid #ccc;margin-top:40px;padding-top:10px;padding-right:20px;text-align:right;">
				<button class="btn" id="saveEditButton" style="width:100px;height:35px;font-size:16px;">保存</button>
	  			<a href="#" onclick="closeBg();"><button class="btn_cancel" style="width:100px;height:35px;font-size:16px;">取消</button></a>
			</div>
	</div>
	<!-- 临时存放数据用 -->
	<p style="display:none" id="totalPage">${pageModel.totalpage}</p>
	<p style="display:none" id="pageNo">${pageModel.pageNo}</p>
</body>
</html>
