<%@ page isELIgnored="false" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="${ contextPath }">
    <title>个人用户--创建简历--基本信息</title>
    <link href="${ contextPath }/css/main.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="${ contextPath }/js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="${ contextPath }/js/date_js/WdatePicker.js"></script>
    <script type="text/javascript" src="${ contextPath }/js/region_js/hukou_pro_city.js"></script>
    <script type="text/javascript" src="${ contextPath }/js/region_js/juzhu_pro_city.js"></script>
  </head>
  
  <body>
  <!--头部start-->
	<div class="wrap">
		<jsp:include page="/publicView/header.jsp"></jsp:include>
    </div>
    <!--头部end-->
<div class="baseinfo" style="margin:10px auto 220px">
  <form action="${ contextPath }/user/inputbasicinfo.html" method="post" enctype="multipart/form-data">
    <table align="center" border="1" cellpadding="0" cellspacing="0" width="750">
    	<tr>
    		<td colspan="4" align="center">个人基本信息</td>
    	</tr>
    	<tr>
    		<td>姓名：</td>
    		<td><input type="text" name="userName"></td>
    		<td>性别：</td>
    		<td><input type="radio" name="userSex" value="1" checked="checked"> 男<input type="radio" name="userSex" value="2"> 女 </td>
    	</tr>
    	<tr>
    		<td>出生日期：</td>
    		<td><input type="text" name="birthday" onclick="WdatePicker()" class="Wdate"></td>
    		<td>海外学习/工作经历：</td>
    		<td><input type="radio" name="overseaAssignment" value="1">有 <input type="radio" name="overseaAssignment" checked="checked" value="0">无 </td>
    	</tr>
    	<tr>
    		<td>证件类型：</td>
    		<td><select name="cardType">
    			<option value="1">身份证
    			<option value="2">护照
    			<option value="3">军官证
    			<option value="4">香港身份证
    			<option value="5">澳门身份证
    			<option value="6">港澳通行证
    			<option value="7">台胞证
    			<option value="8">其他
    		</select></td>
    		<td>证件号：</td>
    		<td><input type="text" name="cardNumber">  </td>
    	</tr>
    	<tr>
    		<td>户口所在地：</td>
    		<td><script type="text/javascript">scity("hukouPro","hukouCity","安徽省","阜阳市")</script></td>
    		<td>手机号码：</td>
    		<td><input type="text" name="phone"></td>
    	</tr>
    	<tr>
    		<td>居住地：</td>
    		<td><script type="text/javascript">scity_j("province","city","河北省","石家庄市")</script></td>
    		<td>详细地址：</td>
    		<td><input type="text" name="address">  </td>
    	</tr>
    	<tr>
    		<td>婚姻状况：</td>
    		<td><input type="radio" name="marriage" checked="checked" value="0">未婚<input type="radio" name="marriage" value="1">已婚<input type="radio" name="marriage" value="2">保密 </td>
    		<td>电子邮箱：</td>
    		<td><input type="text" name="email">  </td>
    	</tr>
    	<tr>
    		<td>政治面貌：</td>
    		<td colspan="3"><input type="radio" name="politicsStatu" value="1">党员  <input type="radio" name="politicsStatu" checked="checked" value="2">团员<input type="radio" name="politicsStatu" value="3">群众<input type="radio" name="politicsStatu" value="4">民主党派<input type="radio" name="politicsStatu" value="5">无党派人士<input type="radio" name="politicsStatu" value="6">其他</td>
    	</tr>
    	<tr>
    		<td>工作年限：</td>
    		<td colspan="3"><select name="workYears">
    			<option value="0">没有工作经验
    			<option value="1">一年以上
    			<option value="2">二年以上
    			<option value="3">三年以上
    			<option value="5">五年以上
    			<option value="10">十年以上
    		</select>
    		</td>
    	</tr>
    	<tr>
    		<td>请上传您本人的照片：</td>
    		<td><input type="file" name="userPhoto"> </td>
    	</tr>
    	<tr>
    		<td colspan="4" align="center"><input type="submit" value="保存">  </td>
    	</tr>
    </table>
    </form>
</div>
  	 <!--底部-->
   <div class="wrap">
   		<jsp:include page="/publicView/footer.jsp"></jsp:include>
	</div>
  </body>
</html>
