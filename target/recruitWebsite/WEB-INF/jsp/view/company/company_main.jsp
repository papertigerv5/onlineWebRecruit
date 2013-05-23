<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="${ contextPath }">
    <title>企业用户主页</title>
    <script type="text/javascript" src="${ contextPath }/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript">
//email检测
function checkEmailIsUse(obj){
	var account = $(obj).val();
	
	if(account.length == 0){
		$("#emailErrorMess").html("用户名不能为空");
		$("#emailErrorMess").attr("checkRes","false");
		return false;
	}
	
	$.ajax({
		type: 'get',
		url: '${contextPath}/user/checkaccoutisuse.html?account='+account,
		dataType: 'text',
		success: function(data){
			if(data == "true"){
				$("#emailErrorMess").html("该帐号已被占用");
				$("#emailErrorMess").attr("checkRes","false");
			}else{
				$("#emailErrorMess").html("<img src='${ contextPath }/images/true.png'>");
				$("#emailErrorMess").attr("checkRes","true");
			}
		}
	});
}
//密码检测
function checkPassword(obj){
	var password = $(obj).val();
	if(password.length == 0){
		$("#passErrorMess").html("密码不能为空");
		$("#passErrorMess").attr("checkRes","false");
		return ;
	}else if(password.length < 6){
		$("#passErrorMess").html("密码长度不能小于6位");
		$("#passErrorMess").attr("checkRes","false");
		return ;
	}else{
		$("#passErrorMess").html("<img src='${ contextPath }/images/true.png'>");
		$("#passErrorMess").attr("checkRes","true");
	}
}

//重复密码检测
function checkConfirmPass(obj){
	var confirmPass = $(obj).val();	//重复密码
	var password = $("#password").val();
	
	if(confirmPass != password){
		$("#confirmPassErrorMess").html("两次输入密码不一致");
		$("#confirmPassErrorMess").attr("checkRes","false");
		return ;
	}else{
		$("#confirmPassErrorMess").html("<img src='${ contextPath }/images/true.png'>");
		$("#confirmPassErrorMess").attr("checkRes","true");
	}
}

//同意条款处理
function checkIsCause(obj){
	var isCause = $(obj).attr("checked");
	if(isCause == true){
		$("#isClause").html("");
		$("#isClause").attr("checkRes","true");
	}else{
		$("#isClause").html("请同意条款");
		$("#isClause").attr("checkRes","false");
	}
}

function checkSubmit(){
	var account = $("#account").val();
	var password = $("#password").val();
	var confirmpass = $("#confirmpass").val();
	
	if(account.length == 0){
		$("#emailErrorMess").html("用户名不能为空");
		$("#emailErrorMess").attr("checkRes","false");
	}
	if(password.length == 0){
		$("#passErrorMess").html("密码不能为空");
		$("#passErrorMess").attr("checkRes","false");
	}
	if(password != confirmpass){
		$("#confirmPassErrorMess").html("两次输入密码不一致");
		$("#confirmPassErrorMess").attr("checkRes","false");
	}

	var isCause = $("#isAgree").attr("checked");
	if(isCause == false){
		$("#isClause").html("请同意条款!");
		$("#isClause").attr("checkRes","false");
	}else{
		$("#isClause").html("");
		$("#isClause").attr("checkRes","true");
	}

	var objs = $(".errorMess");
	for(var i=0;i<objs.length;i++){
		var checkRes = $(objs[i]).attr("checkRes");
		if(checkRes == "false"){
			return false;
			break;
		}
	}
	
	return true;
}
</script>
<style type="text/css">
.errorMess{
	color: red;
	font-size: 12px;
}
</style>    
<link href="${ contextPath }/css/css.css" rel="stylesheet" type="text/css">     
    
  </head>
  <body>

  企业用户主页面
  </body>
</html>
