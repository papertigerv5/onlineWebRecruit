<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="${ contextPath }">
    <title>后台管理-添加职位信息</title>
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
													<td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：[全局数据管理]-[资讯信息]-[添加]</td>
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
								<form action="${ contextPath }/JobOper" method="post">
								<table width="50%" border="0" cellpadding="0" cellspacing="1" bgcolor="b5d6e6">
									<tr>
										<td height="20" bgcolor="#FFFFFF">职位名称 ：　</td>
										<td height="20" bgcolor="#FFFFFF"><input type="text" name="jobName" value="" >  </td>
									</tr>
									<tr>
										<td height="20" bgcolor="#FFFFFF">职位类别 ：　</td>
										<td height="20" bgcolor="#FFFFFF"><input type="text" name="positionId" value="" >  </td>
									</tr>
									<tr>
										<td height="20" bgcolor="#FFFFFF">公司性质 ：　</td>
										<td height="20" bgcolor="#FFFFFF"><input type="text" name="companyType" value="" >  </td>
									</tr>
									
									<tr>
										<td height="20" bgcolor="#FFFFFF">工作经历 ：　</td>
										<td height="20" bgcolor="#FFFFFF"><input type="text" name="workExperience" value="" >  </td>
									</tr>
									<tr>
										<td height="20" bgcolor="#FFFFFF">最低学历 ：　</td>
										<td height="20" bgcolor="#FFFFFF"><input type="text" name="lowestEducation" value="" >  </td>
									</tr>
									<tr>
										<td height="20" bgcolor="#FFFFFF">工作性质 ：　</td>
										<td height="20" bgcolor="#FFFFFF"><input type="text" name="jobType" value="" >  </td>
									</tr>
									<tr>
										<td height="20" bgcolor="#FFFFFF">职位月薪：　</td>
										<td height="20" bgcolor="#FFFFFF"><input type="text" name="salary" value="" >  </td>
									</tr>
									<tr>
										<td height="20" bgcolor="#FFFFFF">工作地点 ：　</td>
										<td height="20" bgcolor="#FFFFFF"><input type="text" name="workPlace" value="" >  </td>
									</tr>
									<tr>
										<td height="20" bgcolor="#FFFFFF">所需人数：　</td>
										<td height="20" bgcolor="#FFFFFF"><input type="text" name="requiredPeople" value="" >  </td>
									</tr>
									
									<tr>
										<td height="20" bgcolor="#FFFFFF">职位描述 ：　</td>
										<td height="20" bgcolor="#FFFFFF"><input type="text" name="jobDesc" value="" >  </td>
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