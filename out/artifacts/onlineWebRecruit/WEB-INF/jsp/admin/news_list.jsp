<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="${ contextPath }">
    <title>后台管理——资讯管理</title>
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
													<td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：[全局数据管理]-[资讯列表]</td>
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
																<td class="STYLE1"><div align="center"><a href="${ contextPath }/admin/news/addpage.html">新增</a></div></td>
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
										<td width="12%" height="22" background="${ contextPath }/images/tab/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">标题</span></div></td>
										<td width="14%" height="22" background="${ contextPath }/images/tab/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">资讯类别</span></div></td>
										<td width="14%" background="${ contextPath }/images/tab/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">发布者</span></div></td>
										<td width="18%" background="${ contextPath }/images/tab/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">发布时间</span></div></td>
										<td width="18%" background="${ contextPath }/images/tab/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">权重</span></div></td>
										<td width="15%" height="22" background="${ contextPath }/images/tab/bg.gif" bgcolor="#FFFFFF" class="STYLE1"><div align="center">基本操作</div></td>
									</tr>
									<c:if test="${ not empty newsList }">
    									<c:forEach items="${ newsList.result }" var="news" varStatus="newsStatu">
										<tr>
											<td height="20" bgcolor="#FFFFFF"><div align="center"><input type="checkbox" name="checkbox16" value="checkbox" /></div></td>
											<td height="20" bgcolor="#FFFFFF"><div align="center" class="STYLE1"><div align="center">${ newsStatu.count }</div></div></td>
											<td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">${ news.title }</span></div></td>
											<td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">
												<c:forEach items="${ newsTypeList }" var="newsType">
													<c:if test="${ newsType['id'] eq news.type }">${ newsType['name'] }</c:if>
												</c:forEach></span></div></td>
											<td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">${ news.userAccount }</span></div></td>
											<td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">${ news.addTime }</span></div></td>
											<td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">${ news.orderNum }</span></div></td>
											<td height="20" bgcolor="#FFFFFF">
												<div align="center">
													<span class="STYLE4"><img src="${ contextPath }/images/tab/edt.gif" width="16" height="16" /><a href="${ contextPath }/admin/news/get.html?id=${ news.newsId }">修改</a>&nbsp; &nbsp;<img src="${ contextPath }/images/tab/del.gif" width="16" height="16" /><a href="${ contextPath }/admin/news/delete.html?id=${ news.newsId }">删除</a></span>
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
										<td class="STYLE4">&nbsp;&nbsp;共有 ${ newsList.totalCount } 条记录，当前第 ${ newsList.currentPageNo }/${ newsList.totalPageCount } 页</td>
										<td>
											<table border="0" align="right" cellpadding="0" cellspacing="0">
												<tr>
													<td width="40"><img src="${ contextPath }/images/tab/first.gif" width="37" height="15" /></td>
													<td width="45"><img src="${ contextPath }/images/tab/back.gif" width="43" height="15" /></td>
													<td width="45"><img src="${ contextPath }/images/tab/next.gif" width="43" height="15" /></td>
													<td width="40"><img src="${ contextPath }/images/tab/last.gif" width="37" height="15" /></td>
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
