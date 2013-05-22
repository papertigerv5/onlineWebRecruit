<%@ page isELIgnored="false" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="${ contextPath }">
    <title>个人用户注册</title>
    <script type="text/javascript" src="${ contextPath }/js/jquery-1.9.1.js"></script>
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
		url: '${contextPath}/user/checkAccountIssue.html?account='+account,
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
	if($(obj).is(":checked")){
		$("#isClause").html("");
		$("#isClause").attr("checkRes","true");
        return true;
	}else{
		$("#isClause").html("请同意条款");
		$("#isClause").attr("checkRes","false");
        return false;
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

    if(!checkIsCause($("#isAgree"))){
        $("#isCause").html("请同意条款");
        $("#isCause").attr("checkRes",false);
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
  <link href="${ contextPath }/css/main.css" rel="stylesheet" type="text/css">
  </head>
  <body>
  <form action="${ contextPath }/user/register.html" method="post" onsubmit="return checkSubmit()">
<div class="wrap" >
	<!--头部start-->
	<div class="wrap">
		<jsp:include page="/publicView/header.jsp"></jsp:include>
    </div>
    <!--头部end-->
<div class="registertable" style="margin:0 auto 360px">
<!-- 注册表格 -->
    <table align="center" border="1" cellpadding="0" cellspacing="0">
    	<tr>
    		<td>用户名: </td>
    		<td><input type="text" name="account" id="account" onblur="checkEmailIsUse(this)"><span id="emailErrorMess" class="errorMess" checkRes="false"></span></td>
    	</tr>
    	<tr>
    		<td>密码: </td>
    		<td><input type="password" name="password" id="password" onblur="checkPassword(this)"><span id="passErrorMess" class="errorMess" checkRes="false"></span>  </td>
    	</tr>
    	<tr>
    		<td>重复密码: </td>
    		<td><input type="password" name="confirmpass" id="confirmpass" onblur="checkConfirmPass(this)"  ><span id="confirmPassErrorMess" class="errorMess" checkRes="false"></span>  </td>
    	</tr>
    	<tr>
    		<td colspan="2" align="center"><input type="checkbox" id="isAgree" onclick="checkIsCause(this);"><label for="isAgree">确认同意<a href="#">[以下条款]</a></label><span id="isClause" class="errorMess" checkRes="false"></span>  </td>
    	</tr>
    	<tr>
    		<td colspan="2" align="center"><input type="submit" value="注册"></td>
    	</tr>
    </table>
</div>

  <!--底部-->
   <div class="wrap">
   		<jsp:include page="/publicView/footer.jsp"></jsp:include>
	</div>
</div>
   </form>
  </body>
</html>
