<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="${ contextPath }">
    <title>企业用户--基本信息</title>
    <script type="text/javascript" src="${ contextPath }/js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="${ contextPath }/js/region_js/hukou_pro_city.js"></script>
    <link href="${ contextPath }/css/css.css" rel="stylesheet" type="text/css"> 
  </head>
  
  <body>
  <!--头部start-->
	<div class="wrap">
		<jsp:include page="/publicView/header.jsp"></jsp:include>
    </div>
    <!--头部end-->
 <div class="baseinfo" style="margin:50px auto 200px">
  <form action="${ contextPath }/company/inputbasicinfo.html" method="post">
  	<input type="hidden" name="companyAccount" value="${ companyAccount }">
    <table align="center" border="1" cellpadding="0" cellspacing="0" width="600">
    	<tr>
    		<td colspan="2" align="center">公司基本信息</td>
    	</tr>
    	<tr>
    		<td>企业名称：</td>
    		<td><input type="text" name="companyName"></td>
    	</tr>
    	<tr>
    		<td>所在地：</td>
    		<td><script type="text/javascript">scity("province","city","河北省","石家庄市")</script></td>
    	</tr>
    	<tr>
    		<td>详细地址：</td>
    		<td><input type="text" name="address">  </td>
    	</tr>
    	<tr>
    		<td>联系人：</td>
    		<td><input type="text" name="companyHr">  </td>
    	</tr>
    	<tr>
    		<td>联系电话：</td>
    		<td><input type="text" name="companyPhone">  </td>
    	</tr>
    	<tr>
    		<td>Email：</td>
    		<td><input type="text" name="companyMail">  </td>
    	</tr>
    	<tr>
    		<td>行业领域况：</td>
    		<td><input type="text" name="tradeId"><font color="red">(*暂时输入行业编号)</font>  </td>
    	</tr>
    	<tr>
    		<td>公司性质：</td>
    		<td><select name="companyNature">
    			<option value="0">--请选择--</option>
    			<option value="1">国营企业</option>
    			<option value="2">外资企业</option>
    			<option value="3">私营企业</option>
    		</select>
    		</td>
    	</tr>
    	<tr>
    		<td>公司规模：</td>
    		<td><select name="companyScale">
    			<option value="0">--请选择--</option>
    			<option value="1">50人以下</option>
    			<option value="2">50~100人</option>
    			<option value="3">100~500人</option>
    			<option value="4">500~1000人</option>
    			<option value="5">1000人以上</option>
    		</select></td>
    	</tr>
    	
    	<tr>
    		<td>公司介绍：</td>
    		<td><input type="text" name="companyDesc">  </td>
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
