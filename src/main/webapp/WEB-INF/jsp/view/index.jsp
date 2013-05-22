<%@ page isELIgnored="false"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="${ contextPath }">
    <title>在线招聘--首页</title>
    <link href="${ contextPath }/css/main.css" rel="stylesheet" type="text/css">
    <link href="${ contextPath }/css/ui-lightness/jquery-ui-1.10.3.custom.min.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="${ contextPath }/js/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="${ contextPath }/js/jquery-ui-1.10.3.custom.js"></script>
    <script type="text/javascript" src="${ contextPath }/js/index_page.js"></script>

    <script type="text/javascript">
        $(function() {
            var username=$("#name"),
                    email=$("#email"),
                    password=$("#password"),
                    repassword=$("#re-password");

            var allFormFields = $([]).add(username).add(email).add(password).add(repassword);
            var tips = $( ".validateTips" );

            function updateTips( t ) {
                tips
                   .text( t )
                     .addClass( "ui-state-highlight" );
                setTimeout(function() {
                    tips.removeClass( "ui-state-highlight", 1500 );
                }, 500 );
            }

            function checkExistOrNot(url,fieldName,fieldValue){
                var exists = true;
                $.ajax({
                    async:false,
                    url:url,
                    data: fieldName + "=" + fieldValue,
                    success:function(responseBody){
                        if(responseBody != "OK"){
                            exists = false;
                        }
                    }
                });

                return exists;
            }
            function checkLength( o, n, min, max ) {
                if ( o.val().length > max || o.val().length < min ) {
                    o.addClass( "ui-state-error" );
                    updateTips( n + " 的长度必须要在" +
                            min + " 与 " + max + "之间." );
                    return false;
                } else {
                    return true;
                }
            }

            function checkRegexp( o, regexp, n ) {
                if ( !( regexp.test( o.val() ) ) ) {
                    o.addClass( "ui-state-error" );
                    updateTips( n );
                    return false;
                } else {
                    return true;
                }
            }

            function checkIdentical(f,s,n){
                updateTips(n + "字段两次输入不一致");
                return f == s;
            }

            function validateForm(){
                var bValid = true;

                bValid = bValid && checkExistOrNot('/user/checkExist.action','userName',username.val());

                bValid = bValid && checkLength( username, "用户名", 3, 16 );
                bValid = bValid && checkLength( email, "邮箱地址", 6, 80 );
                bValid = bValid && checkLength( password, "密码", 5, 16 );

                bValid = bValid && checkIdentical(password.val(),repassword.val(),'密码');

                bValid = bValid && checkRegexp( username,/^[a-z]([0-9a-z_])+$/i, "用户名只能由字母和数字组成，且首字母必须为数字！");
                bValid = bValid && checkRegexp( password,/^([0-9a-zA-Z])+$/,  "密码只能由字母和数字组成");
                bValid = bValid && checkRegexp( email, /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i, "比如: hello@163.com" );

                return bValid;
            }


            $("#personalUserDialog").dialog({
                autoOpen: false,
                height: 300,
                width: 350,
                modal: true,
                position:{my:"left top",at:"center",of:"#userLogin"},
                buttons:{
                    '注册':function(){
                        var bValid = validateForm();

                        if(bValid){
                            $.ajax({
                                url: 'register.action',
                                data: "userAccount=" + username.val() + "&userPass=" + password.val(),
                                method:'post',
                                success:function(responseBody){

                                }
                            });
                            $(this).dialog("close");
                        }
                    },
                    '取消':function(){
                        allFormFields.val("");
                        $(this).dialog("close");
                    }
                },
                close:function(){
                    allFormFields.val("");
                }
            });
            $("#userRegisterLink").click(function(){
                $( "#personalUserDialog" ).dialog( "open" );
            });
        });
    </script>

</head>
<body>
<div class="wrap" >
    <!--头部start-->
    <div class="wrap">
        <jsp:include page="/publicView/header.jsp"></jsp:include>
    </div>
    <!--头部end-->

    <!--左侧start-->
    <div class="wrap">
        <div class="col-side">
            <div class="login-box">
                <ul>
                    <li id="userLoginObj" onclick="showUserOrComLogin(1)" style="text-decoration: underline; cursor: pointer;">个人登录</li>
                    <li id="companyLoginObj" onclick="showUserOrComLogin(2)" style="cursor: pointer;">企业登录</li>
                </ul>
                <div class="clear"></div>
                <div id="companyLogin" style="display: none;">
                    <form action="${ contextPath }/company/userlogin.html" method="post">
                        <p>用户名：<input type="text" name="userAccount" class="input-text" /></p>
                        <p>密&nbsp;&nbsp;码：<input type="password" name="usrePass" class="input-text" /></p>
                        <input type="hidden" name="userRole.roleId" value="2">
                        <div style="margin:20px 0 0 35px">
                            <input type="image" src="${ contextPath }/images/dl.jpg" onclick="this.form.submit()">
                            <a href="${ contextPath }/company/registerpage.html"><img src="${ contextPath }/images/zc.jpg"></a>
                        </div>
                    </form>
                </div>
                <div id="userLogin">
                    <form action="${ contextPath }/user/userlogin.html" method="post">
                        <p>用户名：<input type="text" name="userAccount" class="input-text" /></p>
                        <p>密&nbsp;&nbsp;码：<input type="password" name="usrePass" class="input-text" /></p>
                        <input type="hidden" name="userRole.roleId" value="1">
                        <div style="margin:20px 0 0 35px">
                            <input type="image" src="${ contextPath }/images/dl.jpg" onclick="this.form.submit()">
                            <a href="${ contextPath }/user/registerpage.html" id="userRegisterLink"><img src="${ contextPath }/images/zc.jpg"></a>
                        </div>
                    </form>
                </div>
            </div>
            <div class="col-sub">
                <div class="tt-zczx">求职者简历</div>

                <div class="zczx">
                    <div style=" width: 100%; height: 100%;">
                        <ul type="disc" style="margin: 2px 4px;">
                            <c:if test="${ not empty newsList }">
                                <c:forEach items="${ newsList }" var="news">
                                    <li>${ news.title }</li>
                                </c:forEach>
                            </c:if>
                        </ul>
                    </div>
                    <div class="more"><a href="#">查看更多&gt;&gt;</a></div>
                </div>

                <div class="tt-zczx">求职者视频</div>
                <div class="zczx">
                    <div style=" width: 100%; height: 100%;">
                        <ul type="disc" style="margin: 2px 4px;">
                            <c:if test="${ not empty newsList }">
                                <c:forEach items="${ newsList }" var="news">
                                    <li>${ news.title }</li>
                                </c:forEach>
                            </c:if>
                        </ul>
                    </div>
                    <div class="more"><a href="#">查看更多&gt;&gt;</a></div>
                </div>

                <div class="tt-zczx">职场资讯</div>
                <div class="zczx">
                    <div style=" width: 100%; height: 100%;">
                        <ul type="disc" style="margin: 2px 4px;">
                            <c:if test="${ not empty newsList }">
                                <c:forEach items="${ newsList }" var="news">
                                    <li>${ news.title }</li>
                                </c:forEach>
                            </c:if>
                        </ul>
                    </div>
                    <div class="more"><a href="#">查看更多&gt;&gt;</a></div>
                </div>
            </div>
        </div>

        <!--左侧end-->

        <!--中部start-->

        <div class="col-main">

            <script type="text/javascript" src="${ contextPath }/js/imgsroll.js"></script>
            <!--热门招聘 end-->

            <div class="clear"></div>

            <!--热门职位 start-->
            <div class="hot-post">
                <div class="hot-post-tt">
                    <div class="more"><a href="#">更多&gt;&gt;</a></div>
                </div>
                <div class="hot-post-list">

                </div>
            </div>

            <div class="hot-post">
                <div class="hot-post-tt">
                    <div class="more"><a href="#">更多&gt;&gt;</a></div>
                </div>
                <div class="hot-post-list">

                </div>
            </div>

            <div>
                <div class="friendlink"><p>
                    <img src="images/yqlj.png"></p>
                </div>
                <table style="margin-left:auto; margin-right:auto; text-align:center;">
                    <tbody><tr><td><a href="http://www.ecpmi.org.cn/"><img src="images/zg.png" border="0"></a></td><td><a href="http://www.bpma.org.cn/"><img src="images/bj.jpg" border="0"></a></td><td><a href="http://www.shwy.org.cn/"><img src="images/sh.jpg" border="0"></a></td></tr>
                    <tr><td><a href="http://www.szpma.org/"><img src="images/shenzhen.jpg" border="0"></a></td><td><a href="http://www.gzpma.com/"><img src="images/guangzhou.jpg" border="0"></a></td><td><a href="http://www.zhpm.org/"><img src="images/zhuhai.jpg" border="0"></a></td></tr>
                    <tr style="text-align:right"><td></td><td></td><td><a href="member/member.aspx">更多&gt;&gt;</a></td></tr>
                    <tr><td></td><td></td><td></td></tr>
                    <tr><td></td><td></td><td></td></tr>
                    <tr><td></td><td></td><td></td></tr>
                    </tbody></table>
            </div>
            <!--热门职位 end-->
            <div class="clear"></div>
        </div>
        <!--中部end-->


        <div class="clear"></div>

    </div>

    <!--右部-->
    <div class="col-right-side">

        <div class="hot">
            <div class="hot-tt">
                <div class="more"><a href="#">更多&gt;&gt;</a></div>
            </div>
            <div class="hot-list"> </div>
            <div class="hot-bottom"></div>

        </div>

        <div>
            <div class="tt-zczx">企业名称</div>
            <div class="container"></div>
        </div>

        <!--企业视频 start-->
        <div>
            <div class="tt-zczx">企业视频</div>
            <div class="container"></div>
        </div>
        <!--企业视频 end-->
    </div>

    <div id="personalUserDialog" title="用户注册">
        <p class="validateTips">所有选项必填</p>

        <form>
            <fieldset>
                <table>
                    <tr>
                        <td><label for="name">用户名:</label></td>
                        <td><input type="text" name="name" id="name" class="text ui-widget-content ui-corner-all" /></td>
                    </tr>
                    <tr>
                        <td><label for="email">常用电子邮箱:</label></td>
                        <td><input type="text" name="email" id="email" value="" class="text ui-widget-content ui-corner-all" /></td>
                    </tr>
                    <tr>
                        <td><label for="password">设置登陆密码:</label></td>
                        <td><input type="password" name="password" id="password" value="" class="text ui-widget-content ui-corner-all" /></td>
                    </tr>
                    <tr>
                        <td><label for="password">确定登陆密码:</label></td>
                        <td><input type="password" name="password" id="re-password" value="" class="text ui-widget-content ui-corner-all" /></td>
                    </tr>
                    <tr>
                        <td colspan="2"><input type="checkbox" id="agreement"/> <label for="agreement">我已阅读<a href="#">[注册协议]</a></label></td>
                    </tr>
                </table>
            </fieldset>
        </form>
    </div>

    <!--底部页面-->
    <div class="wrap">
        <jsp:include page="/publicView/footer.jsp"></jsp:include>
    </div>
</div>
</body>
</html>