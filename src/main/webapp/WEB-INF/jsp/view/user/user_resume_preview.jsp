<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="${ contextPath }">
    <title>简历预览</title>
    <script type="text/javascript" src="${ contextPath }/js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="${ contextPath }/js/date_js/WdatePicker.js"></script>
    <script type="text/javascript" src="${ contextPath }/js/region_js/hukou_pro_city.js"></script>
    <link href="${ contextPath }/css/css.css" rel="stylesheet" type="text/css">
  </head>
  
  <body>
  <!--头部start-->
	<div class="wrap">
		<jsp:include page="/publicView/header.jsp"></jsp:include>
    </div>
    <!--头部end-->
  	<div align="center">
  		<div style="width: 600px;">简历预览-默认简历</div>
  		<div style="width: 600px;">个人信息&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:$('#userBasicShow').hide();$('#userBasicEdit').show();">修改</a></div>
  		<div id="userBasicShow"><%-- 个人信息展示区 --%>
  			<table width="600" border="1" cellpadding="0" cellspacing="0">
		    	<tr>
		    		<td>姓名</td>
		    		<td>${ personalUser.userName }</td>
		    		<td>性别</td>
		    		<td><c:if test="${ personalUser.userSex eq '1' }">男</c:if><c:if test="${ personalUser.userSex eq '2' }">女</c:if>  </td>
		    		<td rowspan="5" align="center">
		    			<img src="${contextPath }${ personalUser.userPhotoPath }" style="width: 140px; height: 140px;" border="0">
		    		</td>
		    	</tr>
		    	<tr>
		    		<td>出生日期</td>
		    		<td>${ personalUser.birthday }</td>
		    		<td>工作年限</td>
		    		<td>
		    			<c:if test="${ personalUser.workYears eq '0' }">没有工作经验</c:if>
		    			<c:if test="${ personalUser.workYears eq '1' }">一年以上</c:if>
		    			<c:if test="${ personalUser.workYears eq '2' }">二年以上</c:if>
		    			<c:if test="${ personalUser.workYears eq '3' }">三年以上</c:if>
		    			<c:if test="${ personalUser.workYears eq '5' }">五年以上</c:if>
		    			<c:if test="${ personalUser.workYears eq '10' }">十年以上</c:if>
		    		</td>
		    	</tr>
		    	<tr>
		    		<td>证件类型</td>
		    		<td>
		    			<c:if test="${ personalUser.cardType eq '1' }">身份证</c:if>
		    			<c:if test="${ personalUser.cardType eq '2' }">护照</c:if>
		    			<c:if test="${ personalUser.cardType eq '3' }">军官证</c:if>
		    			<c:if test="${ personalUser.cardType eq '4' }">香港身份证</c:if>
		    			<c:if test="${ personalUser.cardType eq '5' }">澳门身份证</c:if>
		    			<c:if test="${ personalUser.cardType eq '6' }">港澳通行证</c:if>
		    			<c:if test="${ personalUser.cardType eq '7' }">台胞证</c:if>
		    			<c:if test="${ personalUser.cardType eq '8' }">其他</c:if>
		    		</td>
		    		<td>证件号</td>
		    		<td>${ personalUser.cardNumber }</td>
		    	</tr>
		    	<tr>
		    		<td>居住地</td>
		    		<td>${ personalUser.province }${ personalUser.city }${ personalUser.address }</td>
		    		<td>Email</td>
		    		<td>${ personalUser.email }</td>
		    	</tr>
		    	<tr>
		    		<td>手机号</td>
		    		<td>${ personalUser.phone }</td>
		    		<td>海外工作经历</td>
		    		<td><input type="radio" <c:if test="${ personalUser.overseaAssignment eq '1' }">checked="checked"</c:if> >有 <input type="radio" <c:if test="${ personalUser.overseaAssignment eq '0' }">checked="checked"</c:if>>无  </td>
		    	</tr>
		    </table>
  		</div>
  		<div id="userBasicEdit" style="display: none;"><%-- 个人信息编辑区 --%>
  			<form action="${ contextPath }/user/updateuserbasicinfo.html" method="post">
  			<input type="hidden" name="userAccount" value="${ personalUser.userAccount }">
  			<table width="600" border="1" cellpadding="0" cellspacing="0">
		    	<tr>
		    		<td>姓名</td>
		    		<td><input type="text" name="userName" value="${ personalUser.userName }"></td>
		    		<td>性别</td>
		    		<td>
		    			<input type="radio" name="userSex" value="1" <c:if test="${ personalUser.userSex eq '1' }"> checked="checked" </c:if>>男
		    			<input type="radio" name="userSex" value="2" <c:if test="${ personalUser.userSex eq '2' }"> checked="checked" </c:if>>女
		    		</td>
		    	</tr>
		    	<tr>
		    		<td>出生日期</td>
		    		<td><input type="text" name="birthday" value="${ personalUser.birthday }" onclick="WdatePicker()" class="Wdate"></td>
		    		<td>工作年限</td>
		    		<td>
		    			<select name="workYears">
		    				<option value="0" <c:if test="${ personalUser.workYears eq '0' }"> selected="selected" </c:if> >没有工作经验</option>
		    				<option value="1" <c:if test="${ personalUser.workYears eq '1' }"> selected="selected" </c:if> >一年以上</option>
		    				<option value="2" <c:if test="${ personalUser.workYears eq '2' }"> selected="selected" </c:if> >二年以上</option>
		    				<option value="3" <c:if test="${ personalUser.workYears eq '3' }"> selected="selected" </c:if> >三年以上</option>
		    				<option value="5" <c:if test="${ personalUser.workYears eq '5' }"> selected="selected" </c:if> >五年以上</option>
		    				<option value="10" <c:if test="${ personalUser.workYears eq '10' }"> selected="selected" </c:if> >十年以上</option>
		    			</select>
		    		</td>
		    	</tr>
		    	<tr>
		    		<td>证件类型</td>
		    		<td>
		    			<select name="cardType">
			    			<option value="1" <c:if test="${ personalUser.cardType eq '1' }"> selected="selected" </c:if> >身份证</option>
			    			<option value="2" <c:if test="${ personalUser.cardType eq '2' }"> selected="selected" </c:if> >护照</option>
			    			<option value="3" <c:if test="${ personalUser.cardType eq '3' }"> selected="selected" </c:if> >军官证</option>
			    			<option value="4" <c:if test="${ personalUser.cardType eq '4' }"> selected="selected" </c:if> >香港身份证</option>
			    			<option value="5" <c:if test="${ personalUser.cardType eq '5' }"> selected="selected" </c:if> >澳门身份证</option>
			    			<option value="6" <c:if test="${ personalUser.cardType eq '6' }"> selected="selected" </c:if> >港澳通行证</option>
			    			<option value="7" <c:if test="${ personalUser.cardType eq '7' }"> selected="selected" </c:if> >台胞证</option>
			    			<option value="8" <c:if test="${ personalUser.cardType eq '8' }"> selected="selected" </c:if> >其他</option>
			    		</select>
		    		</td>
		    		<td>证件号</td>
		    		<td><input type="text" name="cardNumber" value="${ personalUser.cardNumber }">  </td>
		    	</tr>
		    	<tr>
		    		<td>居住地</td>
		    		<td>
		    			<script type="text/javascript">scity("province","city","${ personalUser.province }","${ personalUser.city }")</script>
		    		</td>
		    		<td>Email</td>
		    		<td><input type="text" name="email" value="${ personalUser.email }">  </td>
		    	</tr>
		    	<tr>
		    		<td>手机号</td>
		    		<td><input type="text" name="phone" value="${ personalUser.phone }">  </td>
		    		<td>海外工作经历</td>
		    		<td><input type="radio" name="overseaAssignment" value="1" <c:if test="${ personalUser.overseaAssignment eq '1' }">checked="checked"</c:if> >有 <input type="radio" name="overseaAssignment" value="0" <c:if test="${ personalUser.overseaAssignment eq '0' }">checked="checked"</c:if>>无  </td>
		    	</tr>
		    	<tr>
		    		<td colspan="4" align="center"><input type="submit" value="提交">  </td>
		    	</tr>
		    </table>
		    </form>
  		</div>
  		<div style="width： 600px;">教育经历&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:alert('完善中');">修改</a></div>
  		<div>
  			<c:forEach items="${ educations }" var="education">
	  			<table width="600" border="1" cellpadding="0" cellspacing="0">
			    	<tr>
			    		<td>时间</td>
			    		<td>${ education.startYear }年${ education.startMonth }月到${ education.endYear }年${ education.endMonth }月</td>
			    	</tr>
			    	<tr>
			    		<td>学校</td>
			    		<td>${ education.schoolName }</td>
			    	</tr>
			    	<tr>
			    		<td>专业</td>
			    		<td>${ education.specialtyId }<font color="red">(*暂为专业ID)</font></td>
			    	</tr>
			    	<tr>
			    		<td>学历</td>
			    		<td>
			    			<c:if test="${ education.degree eq '1' }">小学</c:if>
			    			<c:if test="${ education.degree eq '2' }">初中</c:if>
			    			<c:if test="${ education.degree eq '3' }">中专</c:if>
			    			<c:if test="${ education.degree eq '4' }">高中</c:if>
			    			<c:if test="${ education.degree eq '5' }">大专</c:if>
			    			<c:if test="${ education.degree eq '6' }">本科</c:if>
			    			<c:if test="${ education.degree eq '7' }">硕士</c:if>
			    			<c:if test="${ education.degree eq '8' }">博士</c:if>
			    		</td>
			    	</tr>
			    	<tr>
			    		<td>专业描述</td>
			    		<td>${ education.speDesc }</td>
			    	</tr>
			    </table>
		    </c:forEach>
		    <div><input type="submit" value="继续添加" onclick="alert('完善中');">  </div>
  		</div>
  		<div style="width： 600px;">工作经验&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:alert('完善中');">修改</a></div>
  		<div>
  			<c:forEach items="${ jobExperiences }" var="jobExperience">
	  			<table width="600" border="1" cellpadding="0" cellspacing="0">
			    	<tr>
			    		<td>时间</td>
			    		<td>${ jobExperience.startYear }年${ jobExperience.startMonth }月到${ jobExperience.endYear }年${ jobExperience.endMonth }月</td>
			    	</tr>
			    	<tr>
			    		<td>公司</td>
			    		<td>${ jobExperience.companyName }</td>
			    	</tr>
			    	<tr>
			    		<td>公司性质</td>
			    		<td>
			    			<c:if test="${ jobExperience.companyNature eq '0' }">未填</c:if>
			    			<c:if test="${ jobExperience.companyNature eq '1' }">国营企业</c:if>
			    			<c:if test="${ jobExperience.companyNature eq '2' }">外资企业</c:if>
			    			<c:if test="${ jobExperience.companyNature eq '3' }">私营企业</c:if>
			    		</td>
			    	</tr>
			    	<tr>
			    		<td>公司规模</td>
			    		<td>
			    			<c:if test="${ jobExperience.companyScale eq '0' }">未填</c:if>
			    			<c:if test="${ jobExperience.companyScale eq '1' }">50人以下</c:if>
			    			<c:if test="${ jobExperience.companyScale eq '2' }">50~100人</c:if>
			    			<c:if test="${ jobExperience.companyScale eq '3' }">100~500人</c:if>
			    			<c:if test="${ jobExperience.companyScale eq '4' }">500~1000人</c:if>
			    			<c:if test="${ jobExperience.companyScale eq '5' }">1000人以上</c:if>
			    		</td>
			    	</tr>
			    	<tr>
			    		<td>行业</td>
			    		<td>${ jobExperience.tradeId }<font color="red">(*暂为行业ID)</font></td>
			    	</tr>
			    	<tr>
			    		<td>部门</td>
			    		<td>${ jobExperience.deparName }</td>
			    	</tr>
			    	<tr>
			    		<td>职位</td>
			    		<td>${ jobExperience.jodId }<font color="red">(*暂为职位ID)</font></td>
			    	</tr>
			    	<tr>
			    		<td>工作描述</td>
			    		<td>${ jobExperience.jobDesc }</td>
			    	</tr>
			    </table>
		    </c:forEach>
		    <div><input type="submit" value="继续添加" onclick="alert('完善中');">  </div>
  		</div>
  		<div style="width： 600px;">求职意向&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:alert('完善中');">修改</a></div>
  		<div>
  			<table width="600" border="1" cellpadding="0" cellspacing="0">
		    	<tr>
		    		<td>工作类型</td>
		    		<td></td>
		    	</tr>
		    	<tr>
		    		<td>地点</td>
		    		<td>行业</td>
		    	</tr>
		    	<tr>
		    		<td>职能</td>
		    		<td></td>
		    	</tr>
		    	<tr>
		    		<td>期望薪水</td>
		    		<td>面议/月</td>
		    	</tr>
		    	<tr>
		    		<td>到岗时间</td>
		    		<td>待定</td>
		    	</tr>
		    	<tr>
		    		<td>自我评份</td>
		    		<td></td>
		    	</tr>
		    </table>
  		</div>
  	</div>
  	<!--底部-->
   <div class="wrap">
   		<jsp:include page="/publicView/footer.jsp"></jsp:include>
	</div>
  </body>
</html>
