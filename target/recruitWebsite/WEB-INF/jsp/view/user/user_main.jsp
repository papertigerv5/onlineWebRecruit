<%@ page isELIgnored="false" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="${ contextPath }">
    <title>个人用户--主页面</title>
    <link href="${ contextPath }/css/css.css" rel="stylesheet" type="text/css">
  </head>
  
  <body>
  <!--头部start-->
	<div class="wrap">
		<jsp:include page="/publicView/header.jsp"></jsp:include>
    </div>
    <!--头部end-->
<div class="resumepre" style="margin:10px auto 400px">
  	<table align="center" border="1" cellpadding="0" cellspacing="0" width="600">
  		<tr>
  			<td><b>简历名称</b></td>
  			<td><b>公开程度</b></td>
  			<td><b>创建时间</b></td>
  			<td><b>完整度</b></td>
  			<td><b>操作</b></td>
  		</tr>
  		<c:forEach items="${ resumeList }" var="resume">
  			<tr>
  				<td><a href="${ contextPath }/user/getResume.html?resumeId=${ resume.id }">${ resume.resumeName }</a></td>
  				<td>
  					<c:if test="${ resume.status eq '0' }">保密</c:if>
  					<c:if test="${ resume.status eq '1' }">公开</c:if>
  				</td>
  				<td>${ resume.createTime }</td>
  				<td>&nbsp;</td>
  				<td>修改/预览/删除</td>
  			</tr>
  		</c:forEach>
  	</table>
 </div>
  	 <!--底部-->
   <div class="wrap">
   		<jsp:include page="/publicView/footer.jsp"></jsp:include>
	</div>
  </body>
</html>
