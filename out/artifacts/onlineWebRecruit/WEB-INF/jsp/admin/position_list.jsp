<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.onlinehr.utils.Page"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%
	Page positionPage = (Page)request.getAttribute("positionPage");
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="${ contextPath }">
		<title>后台管理--内容部分</title>
		<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
a{
	text-decoration:none; 
}
img{
	border: none;
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
var  highlightcolor='#c1ebff';
//此处clickcolor只能用win系统颜色代码才能成功,如果用#xxxxxx的代码就不行,还没搞清楚为什么:(
var  clickcolor='#51b2f6';
function  changeto(){
source=event.srcElement;
if  (source.tagName=="TR"||source.tagName=="TABLE")
return;
while(source.tagName!="TD")
source=source.parentElement;
source=source.parentElement;
cs  =  source.children;
//alert(cs.length);
	if  (cs[1].style.backgroundColor!=highlightcolor&&source.id!="nc"&&cs[1].style.backgroundColor!=clickcolor)
	for(i=0;i<cs.length;i++){
		cs[i].style.backgroundColor=highlightcolor;
	}
}

function  changeback(){
if  (event.fromElement.contains(event.toElement)||source.contains(event.toElement)||source.id=="nc")
return
if  (event.toElement!=source&&cs[1].style.backgroundColor!=clickcolor)
//source.style.backgroundColor=originalcolor
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor="";
}
}

function  clickto(){
source=event.srcElement;
if  (source.tagName=="TR"||source.tagName=="TABLE")
return;
while(source.tagName!="TD")
source=source.parentElement;
source=source.parentElement;
cs  =  source.children;
//alert(cs.length);
if  (cs[1].style.backgroundColor!=clickcolor&&source.id!="nc")
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor=clickcolor;
}
else
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor="";
}
}
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
													<td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：[全局数据管理]-[职位列表]</td>
												</tr>
											</table>
										</td>
										<td width="54%">
											<table border="0" align="right" cellpadding="0" cellspacing="0">
												<tr>
													<td width="60">
														<table width="87%" border="0" cellpadding="0" cellspacing="0">
															<tr>
																<td class="STYLE1"><div align="center"><input type="checkbox" name="checkbox62" value="checkbox" /></div></td>
																<td class="STYLE1"><div align="center">全选</div></td>
															</tr>
														</table>
													</td>
													<td width="60">
														<table width="90%" border="0" cellpadding="0" cellspacing="0">
															<tr>
																<td class="STYLE1">
																	<div align="center"><img src="${ contextPath }/images/tab/22.gif" width="14" height="14" /></div>
																</td>
																<td class="STYLE1"><div align="center"><a href="${ contextPath }/admin/position/addpage.html">新增</a></div></td>
															</tr>
														</table>
													</td>
													<td width="60">
														<table width="90%" border="0" cellpadding="0" cellspacing="0">
															<tr>
																<td class="STYLE1">
																	<div align="center"><img src="${ contextPath }/images/tab/33.gif" width="14" height="14" /></div>
																</td>
																<td class="STYLE1"><div align="center">修改</div></td>
															</tr>
														</table>
													</td>
													<td width="52">
														<table width="88%" border="0" cellpadding="0"
															cellspacing="0">
															<tr>
																<td class="STYLE1">
																	<div align="center"><img src="${ contextPath }/images/tab/11.gif"width="14" height="14" /></div>
																</td>
																<td class="STYLE1"><div align="center">删除</div></td>
															</tr>
														</table>
													</td>
												</tr>
											</table>
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
							<td>
								<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="b5d6e6" onmouseover="changeto()" onmouseout="changeback()">
									<tr>
										<td width="3%" height="22" background="${ contextPath }/images/tab/bg.gif" bgcolor="#FFFFFF"><div align="center"><input type="checkbox" name="checkbox" value="checkbox" /></div></td>
										<td width="3%" height="22" background="${ contextPath }/images/tab/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">序号</span></div></td>
										<td width="12%" height="22" background="${ contextPath }/images/tab/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">职位名称</span></div></td>
										<td width="14%" height="22" background="${ contextPath }/images/tab/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">职位描述</span></div></td>
										<td width="18%" background="${ contextPath }/images/tab/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">记录时间</span></div></td>
										<td width="15%" height="22" background="${ contextPath }/images/tab/bg.gif" bgcolor="#FFFFFF" class="STYLE1"><div align="center">基本操作</div></td>
									</tr>
									<c:if test="${ not empty positionPage && not empty positionPage.result }">
    									<c:forEach items="${ positionPage.result }" var="positionType" varStatus="positionStatu">
										<tr>
											<td height="20" bgcolor="#FFFFFF"><div align="center"><input type="checkbox" name="checkbox16" value="checkbox" /></div></td>
											<td height="20" bgcolor="#FFFFFF"><div align="center" class="STYLE1"><div align="center">${ positionStatu.count }</div></div></td>
											<td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">${ positionType.positionName }</span></div></td>
											<td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">${ positionType.positionDesc }</span></div></td>
											<td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">${ positionType.insertTime }</span></div></td>
											<td height="20" bgcolor="#FFFFFF">
												<div align="center">
													<span class="STYLE4"><img src="${ contextPath }/images/tab/edt.gif" width="16" height="16" /><a href="${ contextPath }/admin/position/get.html?id=${ positionType.positionId }">修改</a>&nbsp; &nbsp;<img src="${ contextPath }/images/tab/del.gif" width="16" height="16" /><a href="${ contextPath }/admin/position/delete.html?id=${ positionType.positionId }">删除</a></span>
												</div>
											</td>
										</tr>
										</c:forEach>
    								</c:if>
								</table>
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
										<td class="STYLE4">&nbsp;&nbsp;共有 <%= positionPage.getTotalCount() %> 条记录，当前第 <%= positionPage.getCurrentPageNo() %>/<%= positionPage.getTotalPageCount() %> 页</td>
										<td>
											<table border="0" align="right" cellpadding="0" cellspacing="0">
												<tr>
													<td width="40">
														<a href="${ contextPath }/admin/position/index.html?pageNo=1"><img src="${ contextPath }/images/tab/first.gif" width="37" height="15" /></a>
													</td>
													<td width="45">
														<%
															if(positionPage.isHasPreviousPage()){
														%>
															<a href="${ contextPath }/admin/position/index.html?pageNo=<%= positionPage.getCurrentPageNo()-1 %>"><img src="${ contextPath }/images/tab/back.gif" width="43" height="15" /></a>				
														<%} else {%>
														<img src="${ contextPath }/images/tab/back.gif" width="43" height="15" />
														<%} %>
													</td>
													<td width="45">
														<%
															if(positionPage.isHasNextPage()){
														%>
															<a href="${ contextPath }/admin/position/index.html?pageNo=<%= positionPage.getCurrentPageNo()+1 %>"><img src="${ contextPath }/images/tab/next.gif" width="43" height="15" /></a>
														<%} else{%>
															<img src="${ contextPath }/images/tab/next.gif" width="43" height="15" />	
														<%} %>
													</td>
													<td width="40">
														<a href="${ contextPath }/admin/position/index.html?pageNo=<%= positionPage.getTotalPageCount() %>"><img src="${ contextPath }/images/tab/last.gif" width="37" height="15" /></a>
													</td>
													<td width="100">
														<div align="center">
															<span class="STYLE1">转到第 <input name="textfield" type="text" size="4" style="height: 12px; width: 20px; border: 1px solid #999999;" /> 页 </span>
														</div>
													</td>
													<td width="40"><img src="${ contextPath }/images/tab/go.gif" width="37" height="15" /></td>
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
