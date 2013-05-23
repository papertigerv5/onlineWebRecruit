<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.onlinehr.domain.News"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%
News news =(News)request.getAttribute("news");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="${ contextPath }">
    <title>后台管理——修改资讯</title>
    <script type="text/javascript" src="${ contextPath }/xheditor-1.1.7/jquery/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="${ contextPath }/xheditor-1.1.7/xheditor-1.1.7-zh-cn.min.js"></script>
    <style type="text/css">
    <!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}

.STYLE1 {
	font-size: 12px
}

.STYLE3 {
	font-size: 12px;
	font-weight: bold;
}

.STYLE4 {
	color: #03515d;
	font-size: 12px;
}
-->
</style>
<script>
$(function(){
	$("#content").xheditor({
		width: 750,
		height: 400
	});
});
</script>

  </head>
  
  <body>
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td height="30" background="${ contextPath }/images/tab/tab_05.gif">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="12" height="30"><img src="${ contextPath }/images/tab/tab_03.gif" width="12" height="30" /></td>
							<td>
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td width="46%" valign="middle">
											<table width="100%" border="0" cellspacing="0" cellpadding="0">
												<tr>
													<td width="5%"><div align="center"><img src="${ contextPath }/images/tab/tb.gif" width="16" height="16" /></div></td>
													<td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：[全局数据管理]-[资讯信息]-[修改]</td>
												</tr>
											</table>
										</td>
										<td width="54%">
											
										</td>
									</tr>
								</table>
							</td>
							<td width="16"><img src="${ contextPath }/images/tab/tab_07.gif" width="16" height="30" /></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="8" background="${ contextPath }/images/tab/tab_12.gif">&nbsp;</td>
							<td align="center">
								<form action="${ contextPath }/admin/news/update.html" method="post">
								<input type="hidden" name="newsId" value="${ news.newsId }">
								<table border="0" cellpadding="0" cellspacing="1" bgcolor="b5d6e6">
									<tr>
										<td height="20" bgcolor="#FFFFFF">资讯标题：　</td>
										<td height="20" bgcolor="#FFFFFF"><input type="text" name="title" value="${ news.title }" >  </td>
									</tr>
									<tr>
										<td height="20" bgcolor="#FFFFFF">资讯类别：　</td>
										<td bgcolor="#FFFFFF">
										<select name="type">
											<c:forEach items="${ newsTypeList }" var="newsType">
												<option value="${ newsType['id'] }" 
													<c:if test="${ newsType['id'] eq news.type }"> selected="true" </c:if>
												>${ newsType['name'] }</option>
											</c:forEach>
										</select>										
										</td>
									</tr>
									<tr>
										<td height="20" bgcolor="#FFFFFF" valign="top">资讯内容 ：　</td>
										<td height="20" bgcolor="#FFFFFF"><textarea id="content" name="content">${ news.content }</textarea>  </td>
									</tr>
									<tr>
										<td height="20" bgcolor="#FFFFFF" valign="top">权重值：　</td>
										<td bgcolor="#FFFFFF">
										<input type="text" name="weight" value="${ news.weight }" />						
										</td>
									</tr>
									<tr>
										<td colspan="2" bgcolor="#FFFFFF"><input type="submit" value="提交">&nbsp;&nbsp;<input type="reset" value="重置">  </td>
									</tr>
								</table>
								</form>
							</td>
							<td width="8" background="${ contextPath }/images/tab/tab_15.gif">&nbsp;</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td height="35" background="${ contextPath }/images/tab/tab_19.gif">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="12" height="35"><img src="${ contextPath }/images/tab/tab_18.gif" width="12" height="35" /></td>
							<td>
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td class="STYLE4">&nbsp;&nbsp;</td>
										<td>
											<table border="0" align="right" cellpadding="0" cellspacing="0">
												<tr>
													
												</tr>
											</table>
										</td>
									</tr>
								</table>
							</td>
							<td width="16">
								<img src="${ contextPath }/images/tab/tab_20.gif" width="16" height="35" />
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</body>
</html>