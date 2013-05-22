<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="${ contextPath }">
    <title>个人用户--创建简历--学习经历/工作经历</title>
     <link href="${ contextPath }/css/css.css" rel="stylesheet" type="text/css">
  </head>
  
  <body>
  <!--头部start-->
	<div class="wrap">
		<jsp:include page="/publicView/header.jsp"></jsp:include>
    </div>
    <!--头部end-->

  <form action="${ contextPath }/user/saveEduAndJobMess.html" method="post">
  	<table align="center" border="1" cellpadding="0" cellspacing="0" width="600">
  		<tr>
  			<td colspan="2" align="center">教育经历-最高学历</td>
  		</tr>
  		<tr>
  			<td width="100">时间：</td>
    		<td colspan="3"><select name="eduStartYear">
	    			<option value="0">年</option>
	    			<c:forEach begin="1980" end="2013" var="edustartyear">
	    				<option value="${edustartyear}">${edustartyear}</option>
	    			</c:forEach>
	    		</select>
	    		<select name="eduStartMonth">
	    			<option value="0">月</option>
	    			<c:forEach begin="1" end="12" var="edustartmonth">
	    				<option value="${edustartmonth}">${ edustartmonth }</option>
	    			</c:forEach>
	    		</select>到
	    		<select name="eduEndYear">
	    			<option value="0">年</option>
	    			<c:forEach begin="1980" end="2013" var="eduendyear">
	    				<option value="${eduendyear}">${ eduendyear }</option>
	    			</c:forEach>
	    		</select>
	    		<select name="eduEndMonth">
	    			<option value="0">月</option>
	    			<c:forEach begin="1" end="12" var="eduendmonth">
	    				<option value="${eduendmonth}">${ eduendmonth }</option>
	    			</c:forEach>
	    		</select>
    		</td>
  		</tr>
  		<tr>
  			<td>学校:</td>
  			<td><input type="text" name="schoolName"></td>
  		</tr>
  		<tr>
  			<td>专业：</td>
  			<td><input type="text" name="specialtyId"><font color="red">(暂时输入专业ID)</font>  </td>
  		</tr>
  		<tr>
  			<td>学历：</td>
  			<td><select name="degree">
  				<option value="1">小学</option>
  				<option value="2">初中</option>
  				<option value="3">中专</option>
  				<option value="4">高中</option>
  				<option value="5">大专</option>
  				<option value="6">本科</option>
  				<option value="7">硕士</option>
  				<option value="8">博士</option>
  			</select>  </td>
  		</tr>
  		<tr>
  			<td>专业描述：</td>
  			<td><textarea name="speDesc" rows="4" cols="35"></textarea>  </td>
  		</tr>
  	</table>
  
    <table align="center" border="1" cellpadding="0" cellspacing="0" width="600">
    	<tr>
    		<td colspan="4" align="center">工作经历-最近一份工作</td>
    	</tr>
    	<tr>
    		<td width="100">时间：</td>
    		<td colspan="3"><select name="jobStartYear">
	    			<option value="0">年</option>
	    			<c:forEach begin="1980" end="2013" var="jobstartyear">
	    				<option value="${jobstartyear}">${jobstartyear}</option>
	    			</c:forEach>
	    		</select>
	    		<select name="jobStartMonth">
	    			<option value="0">月</option>
	    			<c:forEach begin="1" end="12" var="jobstartmonth">
	    				<option value="${jobstartmonth}">${ jobstartmonth }</option>
	    			</c:forEach>
	    		</select>到
	    		<select name="jobEndYear">
	    			<option value="0">年</option>
	    			<c:forEach begin="1980" end="2013" var="jobendyear">
	    				<option value="${jobendyear}">${ jobendyear }</option>
	    			</c:forEach>
	    		</select>
	    		<select name="jobEndMonth">
	    			<option value="0">月</option>
	    			<c:forEach begin="1" end="12" var="jobendmonth">
	    				<option value="${jobendmonth}">${ jobendmonth }</option>
	    			</c:forEach>
	    		</select>
    		</td>
    	</tr>
    	<tr>
    		<td>公司：</td>
    		<td colspan="3"><input type="text" name="companyName"></td>
    	</tr>
    	<tr>
    		<td>行业：</td>
    		<td colspan="3"><input type="text" name="tradeId"><font color="red">(暂时输入行业ID)</font></td>
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
    		<td>部门：</td>
    		<td><input type="text" name="deparName">  </td>
    		<td>职位：</td>
    		<td><input type="text" name="jodId"><font color="red">(暂时输入职位ID)</font></td>  
    	</tr>
    	<tr>
    		<td>工作描述：</td>
    		<td colspan="3">
    			<textarea name="jobDesc" rows="4" cols="35"></textarea>
    		</td>
    	</tr>
    	<tr>
    		<td colspan="4" align="center"><input type="submit" value="保存">  </td>
    	</tr>
    </table>
    </form>
	 <!--底部-->
   <div class="wrap">
   		<jsp:include page="/publicView/footer.jsp"></jsp:include>
	</div>
  </body>
</html>
