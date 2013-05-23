<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="${ contextPath }">
    <title>在线招聘--二级页面</title>
    <link href="${ contextPath }/css/css.css" rel="stylesheet" type="text/css">
  </head> 
<body>
<div class="wrap">
   <!--头部start-->
   <div class="wrap" style="width:990px; margin:0 auto">
        <jsp:include page="/publicView/header.jsp"></jsp:include>
   </div>
   <!--头部end-->
   <!--左侧start-->
   <div class="wrap">
   <div class="sec-left">
   <div class="messagebox">
      <div class="messagebox-tt">
      </div> 
      <div class="messagebox-list">
      </div>
   </div>
   </div>
    <!--左侧end-->
    
    <!--右侧start-->
    <div class="sec-right" style="float: right; width: 320px;">
    <div class="sec">
       <div class="sec-tt">
       </div>
       <div class="sec-list">
       </div>
       <div class="sec-bottom">
       </div>
    </div>
    <div class="hot">
       <div class="hot-tt">
          <div class="more">
             <a href="#">更多&gt;&gt;</a>
          </div>
       </div>
       <div class="hot-list">
       </div>
       <div class="hot-bottom">
       </div>
    </div>   
    <div class="ad">
    <img src="${ contextPath }/images/pd_10.jpg" /> 
    </div>

    <!--右侧end-->
    <div class="clear"></div>
    </div>
    </div>
 
    <!--底部-->
   <div class="wrap">
   		<jsp:include page="/publicView/footer.jsp"></jsp:include>
   </div>
</div>


</body>
</html>



