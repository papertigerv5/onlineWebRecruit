<%@ page isELIgnored="false" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="${ contextPath }">
    <title>个人用户--创建简历--基本信息</title>
    <link href="${ contextPath }/css/main.css" rel="stylesheet" type="text/css" />
    <link href="${ contextPath }/css/redmond/jquery-ui-1.10.3.custom.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="${ contextPath }/js/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="${ contextPath }/js/jquery-ui-1.10.3.custom.js"></script>
    <script type="text/javascript" src="${ contextPath }/js/jquery-datepicker-zh.js"></script>
    <script type="text/javascript" src="${ contextPath }/js/date_js/WdatePicker.js"></script>
    <script type="text/javascript" src="${ contextPath }/js/region_js/hukou_pro_city.js"></script>
    <script type="text/javascript" src="${ contextPath }/js/region_js/juzhu_pro_city.js"></script>

      <script type="text/javascript">

          function checkForm(objForm){

              if($("input[type='file']").val().length == 0){
                  $(objForm).find(".errorMsg").text("请提供头像！");
                  return false;
              }else{
                  $(objForm).find(".errorMsg").text("");
                  return true;
              }

          }
          $(document).ready(function(){
              $("#tabs").tabs();
              $("#datepicker").datepicker({showButtonPanel:true,regional:"zh-TW"});

              var headers = $('#leftMenu .accordion-header');
              var contentAreas = $('#leftMenu .ui-accordion-content ').show();

                // add the accordion functionality
              headers.click(function() {
                  var panel = $(this).next();

                  var imgPanel = $(this).children(":first");
                  var isOpen = panel.is(':visible');

                  // open or close as necessary
                  panel[isOpen? 'slideUp': 'slideDown']()
                      // trigger the correct custom event
                          .trigger(isOpen? 'hide': 'show');
                  if(isOpen){
                      imgPanel.removeClass("ui-icon-circle-minus").addClass("ui-icon-circle-plus");
                  }else{
                      imgPanel.removeClass("ui-icon-circle-plus").addClass("ui-icon-circle-minus");
                  }


                  // stop the link from causing a pagescroll
                  return false;
              });

              $("#expertDialog").dialog({
                  modal:true,
                  autoOpen:false,
                  buttons:{
                      '确定':function(){
                          var checkedExpertTag = [];
                          $(this).find(":checked").each(function(index,item){
                              checkedExpertTag.push($(item).attr("title"));
                          });

                          $("#expertTag").val(checkedExpertTag.join(","));
                          $(this).dialog("close");
                      }
                  }
              });
             //Open expert Dialog
              $("#expertTag").click(function(){
                    $("#expertDialog").dialog("open");
              });

              $("#firstSaveButton").click(function(){
                  alert("Saved!");
              });
          });
      </script>
  </head>
  
  <body>
  <!--头部start-->
	<div class="wrap">
		<jsp:include page="/publicView/header.jsp"></jsp:include>
    </div>
    <!--头部end-->

    <!--Center Part-->

    <div class="wrap">

        <div id="tabs">
            <ul>
                <li><a href="#tab-1">中心首页</a></li>
                <li><a href="#tab-2">简历管理</a></li>
                <li><a href="#tab-3">求职管理</a></li>
                <li><a href="#tab-4">账户管理</a></li>
            </ul>

            <div id="leftMenu"  class="leftFloatItem ui-accordion ui-widget ui-helper-reset">
                <h3 class="accordion-header ui-accordion-header ui-helper-reset ui-state-default ui-accordion-icons ui-corner-all">
                    <span class="ui-accordion-header-icon ui-icon ui-icon-circle-minus"></span>简历管理
                </h3>
                <div class="ui-accordion-content ui-helper-reset ui-widget-content ui-corner-bottom">
                    <ul>
                        <li><a href="#">创建新简历</a> </li>
                        <li><a href="#">简历管理</a> </li>
                        <li><a href="#">升级简历</a> </li>
                    </ul>
                </div>

                <h3 class="accordion-header ui-accordion-header ui-helper-reset ui-state-default ui-accordion-icons ui-corner-all">
                    <span class="ui-accordion-header-icon ui-icon ui-icon-circle-minus"></span>求职管理</h3>
                <div class="ui-accordion-content ui-helper-reset ui-widget-content ui-corner-bottom">
                    <ul>
                        <li><a href="#">搜索简历</a> </li>
                        <li><a href="#">谁下载了我的简历</a> </li>
                        <li><a href="#">我收到的面试邀请</a> </li>
                        <li><a href="#">我申请的职位</a> </li>
                        <li><a href="#">职位收藏夹</a> </li>
                    </ul>
                </div>

                <h3 class="accordion-header ui-accordion-header ui-helper-reset ui-state-default ui-accordion-icons ui-corner-all">
                    <span class="ui-accordion-header-icon ui-icon ui-icon-circle-minus"></span>账户管理</h3>
                <div class="ui-accordion-content ui-helper-reset ui-widget-content ui-corner-bottom">
                    <ul>
                        <li><a href="#">个人资料</a> </li>
                        <li><a href="#">邮箱认证</a></li>
                        <li><a href="#">视频上传</a> </li>
                        <li><a href="#">账号状态</a> </li>
                        <li><a href="#">密码修改</a> </li>
                        <li><a href="#">意见建议</a> </li>
                        <li><a href="#">安全退出</a> </li>
                    </ul>
                </div>
            </div>

            <div id="tab-1" class="leftFloatItem tab">
            <div class="tabTitleDiv">
                <span class="tabTitle">我的简历</span>
            </div>
            <table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
            <tbody><tr>
            <td height="22">
            <form id="Form1" name="Form1" method="post" action="?act=make1_save">
                <table width="100%" border="0" cellspacing="0" cellpadding="4">
                    <tbody><tr>
                        <td height="50" colspan="2" bgcolor="#F5FAFC" style=" border-bottom:1px #CCCCCC dashed; color:#003399">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size:14px;">第一步 - 创建基本信息</span> <span style="color:#999999">(带<strong style="color:#FF0000">*</strong>的为必填)</span></td>
                    </tr>
                    <tr>
                        <td width="100" height="10"></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td width="100" height="23" align="right" valign="top" style="padding-top:10px;"><strong style="color:#FF0000">*</strong>视频名称：</td>

                        <td><input name="title" type="text" class="input_text_200" id="title" maxlength="80" value="74/hello.flv">
                            &nbsp;&nbsp;如：邓利轩.flv
                        </td>
                    </tr>
                    <tr>
                        <td width="100" height="23" align="right"><strong style="color:#FF0000">*</strong>真实姓名：</td>
                        <td><input name="fullname" type="text" class="input_text_200" id="fullname" maxlength="6" value="hello"></td>
                    </tr>
                    <tr>
                        <td height="23" align="right">性别：</td>
                        <td>
                            <label>
                                <input name="sex" type="radio" value="1" checked="checked" title="男">
                                男</label>&nbsp;&nbsp;&nbsp;&nbsp;
                            <label> <input type="radio" name="sex" value="2" title="女">
                                女</label>
                            <input name="sex_cn" id="sex_cn" type="hidden" value="男">
                        </td>
                    </tr>
                    <tr>
                        <td height="23" align="right"><strong style="color:#FF0000">*</strong>出生年份：</td>
                        <td><input name="birthdate" type="text" class="input_text_200" id="birthdate" maxlength="4" style="width:60px;" value="1987">
                            如：1991</td>
                    </tr>
                    <tr>
                        <td height="23" align="right">身高：</td>
                        <td><input name="height" type="text" class="input_text_200" id="height" maxlength="3" style="width:60px;" value="187">
                            CM 如：166</td>
                    </tr>
                    <tr>
                        <td height="23" align="right">婚姻状况：</td>
                        <td>
                            <label><input name="marriage" type="radio" value="1" checked="checked" title="未婚">
                                未婚</label>&nbsp;&nbsp;&nbsp;&nbsp;
                            <label><input type="radio" name="marriage" value="2" title="已婚">
                                已婚</label>&nbsp;&nbsp;&nbsp;&nbsp;
                            <label><input type="radio" name="marriage" value="3" title="保密">
                                保密</label>
                            <input name="marriage_cn" id="marriage_cn" type="hidden" value="未婚">
                        </td>
                    </tr>
                    <tr>
                        <td height="23" align="right"><strong style="color:#FF0000">*</strong>工作经验：</td>
                        <td>
                            <select name="workExperience">
                                <option>无经验</option>
                                <option>1年以下</option>
                                <option>1-3年</option>
                                <option>3-5年</option>
                                <option>5-10年</option>
                                <option>10年以上</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td height="23" align="right"><strong style="color:#FF0000">*</strong>户口所在地：</td>
                        <td><input name="householdaddress" type="text" class="input_text_200" id="householdaddress" maxlength="60" value="江西上饶"></td>
                    </tr>
                    <tr>
                        <td height="23" align="right"><strong style="color:#FF0000">*</strong>学历：</td>
                        <td>
                            <select>
                                <option>初中</option>
                                <option>高中</option>
                                <option>中技</option>
                                <option>中专</option>
                                <option>大专</option>
                                <option>本科</option>
                                <option>硕士</option>
                                <option>博士</option>
                                <option>博后</option>
                            </select>
                        </td>
                    </tr>

                    <tr>
                        <td height="23" align="right">特长标签：</td>
                        <td>
                            <input type="text" name="expertTag" id="expertTag" readonly="true" class="openDialog" />
                            <div id="expertDialog">
                                <input name="tag" id="tag" type="hidden" value="155,形象好|160,有亲和力">
                                <div id="menutag" class="tagmenu shadow">
                                    <div class="tit">精准的选择标签可有效提高求职效果，可多选，最多可以选择5项</div>
                                    <ul>
                                        <li><label style="color: rgb(255, 51, 0);"><input type="checkbox" name="checkbox" value="155,形象好" id="155" title="形象好">形象好</label></li>
                                        <li><label style=""><input type="checkbox" name="checkbox" value="156,气质佳" id="156" title="气质佳">气质佳</label></li>
                                        <li><label style=""><input type="checkbox" name="checkbox" value="157,能出差" id="157" title="能出差">能出差</label></li>
                                        <li><label style=""><input type="checkbox" name="checkbox" value="158,很幽默" id="158" title="很幽默">很幽默</label></li>
                                        <li><label style=""><input type="checkbox" name="checkbox" value="159,技术精悍" id="159" title="技术精悍">技术精悍</label></li>
                                        <li><label style="color: rgb(255, 51, 0);"><input type="checkbox" name="checkbox" value="160,有亲和力" id="160" title="有亲和力">有亲和力</label></li>
                                        <li><label style=""><input type="checkbox" name="checkbox" value="161,身材好" id="161" title="身材好">身材好</label></li>
                                        <li><label style=""><input type="checkbox" name="checkbox" value="162,经验丰富" id="162" title="经验丰富">经验丰富</label></li>
                                        <li><label style=""><input type="checkbox" name="checkbox" value="163,能加班" id="163" title="能加班">能加班</label></li>
                                        <li><label style=""><input type="checkbox" name="checkbox" value="164,海归" id="164" title="海归">海归</label></li>
                                        <li><label style=""><input type="checkbox" name="checkbox" value="165,会开车" id="165" title="会开车">会开车</label></li>
                                        <li><label style=""><input type="checkbox" name="checkbox" value="166,口才好" id="166" title="口才好">口才好</label></li>
                                        <li><label style=""><input type="checkbox" name="checkbox" value="167,声音甜美" id="167" title="声音甜美">声音甜美</label></li>
                                        <li><label style=""><input type="checkbox" name="checkbox" value="168,会应酬" id="168" title="会应酬">会应酬</label></li>
                                        <li><label style=""><input type="checkbox" name="checkbox" value="169,诚实守信" id="169" title="诚实守信">诚实守信</label></li>
                                        <li><label style=""><input type="checkbox" name="checkbox" value="170,外语好" id="170" title="外语好">外语好</label></li>
                                        <li><label style=""><input type="checkbox" name="checkbox" value="171,性格开朗" id="171" title="性格开朗">性格开朗</label></li>
                                        <li><label style=""><input type="checkbox" name="checkbox" value="172,有上进心" id="172" title="有上进心">有上进心</label></li>
                                        <li><label style=""><input type="checkbox" name="checkbox" value="173,人脉广" id="173" title="人脉广">人脉广</label></li>
                                        <li><label style=""><input type="checkbox" name="checkbox" value="174,知识丰富" id="174" title="知识丰富">知识丰富</label></li>
                                        <li><label style=""><input type="checkbox" name="checkbox" value="175,才艺多" id="175" title="才艺多">才艺多</label></li>

                                    </ul>
                                    <div class="clear"></div>
                                </div>
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td height="23" align="right"><strong style="color:#FF0000">*</strong>联系电话：</td>
                        <td><input name="telephone" type="text" class="input_text_200" id="telephone" maxlength="60" value="15810424456">
                            <span style="color:#0066FF">非常重要，招聘方会通过此电话与您联系！</span><br>

                        </td>
                    </tr>


                    <tr>
                        <td height="23" align="right">电子邮箱：</td>
                        <td>
                            wu871205@gmail.com
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <a href="personal_user.php?act=user_email" style="color:#FF3300"> [点击认证]</a>


                        </td>
                    </tr>
                    <tr>
                        <td height="23" align="right"><strong style="color:#FF0000">*</strong>通讯地址：</td>
                        <td><input name="address" type="text" class="input_text_200" id="address" maxlength="60" value="江西"></td>
                    </tr>
                    <tr>
                        <td height="23" align="right">联系 Q Q：</td>
                        <td><input name="qq" type="text" class="input_text_200" id="qq" maxlength="20" value=""></td>
                    </tr>
                    <tr>
                        <td height="23" align="right">个人主页/博客：</td>
                        <td><input name="website" type="text" class="input_text_200" id="website" maxlength="80" value=""></td>
                    </tr>
                    <tr>
                        <td height="23" align="right">邮件接收通知：</td>
                        <td>
                            <label><input name="email_notify" type="radio" value="1">接收</label>
                            &nbsp;&nbsp;&nbsp;
                            <label>
                                <input type="radio" name="email_notify" value="0" checked="checked">不接收</label>
                            <span style="color: #666666"> &nbsp;&nbsp;&nbsp;(当企业对您发起面试邀请，系统会发一份邮件提醒您查看)</span></td>
                    </tr>
                    <tr>
                        <td height="23" align="right">接收邮箱：</td>
                        <td><strong>wu871205@gmail.com</strong>&nbsp;&nbsp;&nbsp;
                            <span style="color:#FF0000"> 您的邮箱未认证，不能接收邮件通知，<a href="personal_user.php?act=user_email" style="color: #009900">[点击认证]</a></span>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" colspan="2">
                            <button id="firstStepSaveButton" type="button" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only" role="button" aria-disabled="false"><span class="ui-button-text">保存并进入下一步</span></button>
                        </td>
                    </tr>
                    </tbody></table>
                <input name="pid" type="hidden" id="pid" value="103">
                <input name="go_resume_show" type="hidden" value="1">
            </form>

            </div>
            </td>
            <td width="150" valign="top" class="resume_right_box">

                <script type="text/javascript" src="/templates/default/js/jquery.vtip-min.js"></script>
                <table width="142" border="0" cellspacing="0" cellpadding="0">
                    <tbody><tr>
                        <td height="35" align="center" style="color: #006600">简历完成状态</td>
                    </tr>
                    </tbody></table>
                <table width="130" border="0" cellpadding="0" cellspacing="5" align="center">
                    <tbody><tr>
                        <td height="25" align="center" background="images/46.gif" class="user_right_box">
                            <table width="100" border="0" cellpadding="0" cellspacing="3" style="cursor:help" class="vtip" title="简历完整指数为：&lt;span style=color:#FF0000&gt;&lt;strong&gt;15&lt;/strong&gt; %&lt;/span&gt;&lt;br /&gt;完整指数小于&lt;strong&gt;60%&lt;/strong&gt;的为无效简历。&lt;br /&gt;简历完整指数越高，排名越靠前">
                                <tbody><tr>
                                    <td width="70" align="left">
                                        <div style="border:1px #006600 solid; width:70px; height:8px;">
                                            <div style="width:15%;background-color:#99CC00; height:8px;">
                                            </div>
                                        </div>
                                    </td>
                                    <td style="color: #009900; font-size:12px; ">15%</td>
                                </tr>
                                </tbody></table>

                        </td>
                    </tr>
                    </tbody></table>
                <table width="130" border="0" align="center" cellpadding="0" cellspacing="5" class="link_bk" style="margin-bottom:10px;">
                    <tbody><tr>
                        <td height="28" align="center" background="images/46.gif" class="user_right_box"><a href="?act=resume_show&amp;pid=103" style="color:#006600">显示简历所有内容</a></td>
                    </tr>
                    </tbody></table>
                <table width="142" border="0" cellspacing="0" cellpadding="0" class="link_bk">
                    <tbody><tr>
                        <td height="32" align="center" class="resume_right_on">
                            <img src="images/50.png" align="absmiddle">&nbsp;&nbsp;基本信息
                        </td>
                    </tr>
                    <tr>
                        <td height="32" align="center">

                            <img src="images/48.png" align="absmiddle">
                            &nbsp;&nbsp;<a href="?act=make2&amp;pid=103">求职意向</a>
                        </td>
                    </tr>
                    <tr>
                        <td height="32" align="center">

                            <img src="images/48.png" align="absmiddle">
                            &nbsp;&nbsp;<a href="?act=make3&amp;pid=103">技能特长</a>
                        </td>
                    </tr>

                    <tr>
                        <td height="32" align="center">

                            <img src="images/48.png" align="absmiddle">
                            &nbsp;&nbsp;<a href="?act=make4&amp;pid=103">教育经历</a>
                        </td>
                    </tr>

                    <tr>
                        <td height="32" align="center">

                            <img src="images/48.png" align="absmiddle">
                            &nbsp;&nbsp;<a href="?act=make5&amp;pid=103">工作经历</a>
                        </td>
                    </tr>

                    <tr>
                        <td height="32" align="center">

                            <img src="images/48.png" align="absmiddle">
                            &nbsp;&nbsp;<a href="?act=make6&amp;pid=103">培训经历</a>
                        </td>
                    </tr>
                    <tr>
                        <td height="32" align="center">

                            <img src="images/49.png" align="absmiddle">
                            &nbsp;&nbsp;<a href="?act=make7&amp;pid=103">形象照片</a>
                        </td>
                    </tr>

                    </tbody></table>
            </td>
            </tr>
            </tbody></table>
            </div>
            <div id="tab-2" class="leftFloatItem tab">
                <p>It's second test</p>
            </div>
            <div id="tab-3" class="leftFloatItem tab">
                <p>It's third test</p>
            </div>

            <div id="tab-4" class="leftFloatItem">
                <p>It's third test</p>
            </div>
        </div>
    </div>



  	 <!--底部-->
   <div class="wrap">
   		<jsp:include page="/publicView/footer.jsp"></jsp:include>
	</div>
  </body>
</html>
