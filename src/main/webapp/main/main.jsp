<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<html lang="zh-CN" >
<script>
    ${pageContext.session.removeAttribute("kind")}
</script>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <title>管理页面</title>

    <meta name="keywords" content="fy">
    <meta name="description" content="fy">

    <!--[if lt IE 8]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->

    <link rel="shortcut icon" href="${pageContext.request.contextPath}/static/img/favicon.ico">
    <link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/animate.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/style.min.css" rel="stylesheet">
</head>

<body class="fixed-sidebar full-height-layout gray-bg" style="overflow:hidden">
<div id="wrapper">
    <!--左侧导航开始-->
    <nav class="navbar-default navbar-static-side" role="navigation">
        <div class="nav-close"><i class="fa fa-times-circle"></i>
        </div>
        <div class="sidebar-collapse">
            <ul class="nav" id="side-menu">
                <li class="nav-header">
                    <div class="dropdown profile-element">
                        <span><img alt="image" class="img-circle" src="http://${pageContext.session.getAttribute("upicture")}" /></span>
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <span class="clear">
                               <span class="block m-t-xs"><strong class="font-bold">${pageContext.session.getAttribute("username")}</strong></span>
                                <span class="text-muted text-xs block">${pageContext.session.getAttribute("position")}<b class="caret"></b></span>
                                </span>
                        </a>
                        <ul class="dropdown-menu animated fadeInRight m-t-xs">
                            <li><a class="J_menuItem" href="${pageContext.request.contextPath}/picture/findAllPicture">修改头像</a>
                            </li>
                            <li><a class="J_menuItem" href="${pageContext.request.contextPath}/user/personalData.jsp">个人资料</a>
                            </li>
                            <li><a class="J_menuItem" href="http://www.baidu.com">访问百度</a>
                            </li>

                            <li class="divider"></li>
                            <li><a href="javascript:logout();">安全退出</a>
                            </li>
                        </ul>
                    </div>
                    <div class="logo-element">gas
                    </div>
                </li>
                <li>
                    <a href="#">
                        <i class="fa fa-home"></i>
                        <span class="nav-label">主页</span>
                        <span class="fa arrow"></span>
                    </a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a class="J_menuItem" href="${pageContext.request.contextPath}/cylinder/GroupByKindAndStateTrue">首页</a>
                        </li>
                       <%-- <li>
                            <a class="J_menuItem" href="${pageContext.request.contextPath}/main/firstPage.jsp" data-index="0">页面</a>
                        </li>--%>
                        <li>
                            <a class="J_menuItem" href="${pageContext.request.contextPath}/main/help.jsp">帮助页面</a>
                        </li>
                    </ul>

                </li>
                <c:if test='${sessionScope.get("position") == "管理员"}'>
                <li>
                    <a href="#">
                        <i class="fa  fa-users J_menuItem" ></i>
                        <span class="nav-label">员工信息管理</span>
                        <span class="fa arrow"></span>
                    </a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a class="J_menuItem" href="${pageContext.request.contextPath}/empControl/findAllEmp">查询员工信息</a>
                        </li>
                        <li>
                            <a class="J_menuItem" href="${pageContext.request.contextPath}/emp/add.jsp">添加新员工</a>
                        </li>
                    </ul>

                </li>
                </c:if>
                <li>
                    <a href="#">
                        <i class="fa fa fa-columns J_menuItem" ></i>
                        <span class="nav-label">气瓶信息管理</span>
                        <span class="fa arrow"></span>
                    </a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a class="J_menuItem" href="${pageContext.request.contextPath}/cylinder/findAllCy">查询存储气瓶信息</a>
                        </li>
                        <li>
                            <a class="J_menuItem" href="${pageContext.request.contextPath}/cylinder/addcyclinder.jsp">气瓶入库登记</a>
                        </li>
                        <li>
                            <a class="J_menuItem" href="${pageContext.request.contextPath}/cylinder/addexcel.jsp">excel批量入库</a>
                        </li>
                        <li>
                            <a class="J_menuItem" href="${pageContext.request.contextPath}/cylinder/findByStateLfalse">待充气气瓶信息</a>
                        </li>
                        <li>
                            <a class="J_menuItem" href="${pageContext.request.contextPath}/cylinder/findByStateLtrue">待送气气瓶信息</a>
                        </li>
                        <li>
                            <a class="J_menuItem" href="${pageContext.request.contextPath}/cylinder/GroupByKindAndStateTrue">图表</a>
                        </li>
                    </ul>

                </li>
                <li>
                    <a ><i class="fa fa-calendar-o"></i> <span class="nav-label">日历 </span><span class="label label-warning pull-right"></span></a>
                    <ul class="nav nav-second-level">
                        <li><a class="J_menuItem" href="${pageContext.request.contextPath}/calendar/findAll">查看日历日程</a>
                        </li>

                    </ul>
                </li>
                <c:if test='${sessionScope.get("position")=="管理员"}'>
                <li>
                    <a href="#">
                        <i class="fa fa-user J_menuItem" ></i>
                        <span class="nav-label">用户信息管理</span>
                        <span class="fa arrow"></span>
                    </a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a class="J_menuItem" href="${pageContext.request.contextPath}/user/findAll">查询用户信息</a>
                        </li>
                        <li>
                            <a class="J_menuItem" href="${pageContext.request.contextPath}/user/add.jsp">添加新用户</a>
                        </li>
                    </ul>

                </li>
                </c:if>

                <li>
                    <a href="#">
                        <i class="fa fa fa-book J_menuItem" ></i>
                        <span class="nav-label">操作记录查看</span>
                        <span class="fa arrow"></span>
                    </a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a class="J_menuItem" href="${pageContext.request.contextPath}/log/findAllLog">日志查看与删除</a>
                        </li>
                    </ul>

                </li>


            </ul>
        </div>
    </nav>
    <!--左侧导航结束-->
    <!--右侧部分开始-->
    <div id="page-wrapper" class="gray-bg dashbard-1">
        <div class="row border-bottom">
            <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
                <div class="navbar-header"><a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#"><i class="fa fa-bars"></i> </a>
                    <form role="search" class="navbar-form-custom" method="post" action="#">
                        <div class="form-group">
                            <input type="text" placeholder="" style="width: 350px" class="form-control" value="" name="top-search" id="top-search" readonly>
                        </div>
                    </form>
                </div>
                <ul class="nav navbar-top-links navbar-right">

                    <%--<ul class="dropdown-menu dropdown-messages">

                        <li class="divider"></li>
                        <li>
                            <div class="dropdown-messages-box">
                                <a href="profile.html" class="pull-left">
                                    <img alt="image" class="img-circle" src="img/a4.jpg">
                                </a>

                            </div>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <div class="text-center link-block">
                                <a class="J_menuItem" href="mailbox.html">
                                    <i class="fa fa-envelope"></i> <strong> 查看所有消息</strong>
                                </a>
                            </div>
                        </li>
                    </ul>--%>
                    </li>
                    <li class="dropdown">
                        <a  class="dropdown-toggle count-info " data-toggle="dropdown" href="#">
                            <i class="fa fa-bell"></i> <span id="spanTotal" class="label label-primary"></span>
                        </a>
                        <ul class="dropdown-menu dropdown-alerts">
                            <li>
                                <a  class="J_menuItem" href="${pageContext.request.contextPath}/cylinder/findByStateLfalse">
                                    <div>
                                        <i class="fa fa-download fa-fw"></i> 有<span id="spanFalse"></span>个气瓶已入库待充气
                                        <span class="pull-right text-muted small">1分钟前</span>
                                    </div>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a class="J_menuItem" href="${pageContext.request.contextPath}/cylinder/findByStateLtrue">
                                    <div>
                                        <i class="fa fa-upload fa-fw"></i> 有<span id="spanTrue"></span>个气瓶已充气待送气
                                        <span class="pull-right text-muted small">1分钟前</span>
                                    </div>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <div class="text-center link-block">
                                    <a class="J_menuItem" href="${pageContext.request.contextPath}/cylinder/findAllCy">
                                        <strong>查看所有 </strong>
                                        <i class="fa fa-angle-right"></i>
                                    </a>
                                </div>
                            </li>
                        </ul>
                    </li>
                    <li class="hidden-xs">
                        <a href="${pageContext.request.contextPath}/main/help.jsp" class="J_menuItem" data-index="0"><i class="fa fa-question-circle"></i>帮助文档</a>
                    </li>
                    <li class="dropdown hidden-xs">
                        <a class="right-sidebar-toggle" aria-expanded="false">
                            <i class="fa fa-tasks"></i> 主题
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
        <div class="row content-tabs">
            <button class="roll-nav roll-left J_tabLeft"><i class="fa fa-backward"></i>
            </button>
            <nav class="page-tabs J_menuTabs">
                <div class="page-tabs-content">
                    <a  href="main.jsp" class="active J_menuTab " data-id="help.jsp">首页</a>
                </div>
            </nav>
            <button class="roll-nav roll-right J_tabRight"><i class="fa fa-forward"></i>
            </button>
            <div class="btn-group roll-nav roll-right">
                <button class="dropdown J_tabClose" data-toggle="dropdown">关闭操作<span class="caret"></span>

                </button>
                <ul role="menu" class="dropdown-menu dropdown-menu-right">
                    <li class="J_tabShowActive"><a>定位当前选项卡</a>
                    </li>
                    <li class="divider"></li>
                    <li class="J_tabCloseAll"><a>关闭全部选项卡</a>
                    </li>
                    <li class="J_tabCloseOther"><a>关闭其他选项卡</a>
                    </li>
                </ul>
            </div>
            <a href="javascript:logout();" class="roll-nav roll-right J_tabExit"><i class="fa fa fa-sign-out"></i> 退出</a>
        </div>
        <div class="row J_mainContent" id="content-main">
            <iframe class="J_iframe" name="iframe0" width="100%" height="100%" src="${pageContext.request.contextPath}/cylinder/GroupByKindAndStateTrue" frameborder="0" data-id="chartstate.jsp" seamless></iframe>
        </div>
        <div class="footer">
            <div class="pull-right">&copy; 2020-2020 <a href="http://39.101.190.80:8080" target="_blank">fy's bishe</a>
            </div>
        </div>
    </div>
    <!--右侧部分结束-->
    <!--右侧边栏开始-->
    <div id="right-sidebar">
        <div class="sidebar-container">

            <ul class="nav nav-tabs navs-3">

                <li class="active">
                    <a data-toggle="tab" href="#tab-1">
                        <i class="fa fa-gear"></i> 主题
                    </a>
                </li>
                <li class=""><a data-toggle="tab" href="#tab-2">
                    主题设置
                </a>
                </li>
                <li><a data-toggle="tab" href="#tab-3">
                    皮肤选择
                </a>
                </li>
            </ul>

            <div class="tab-content">
                <div id="tab-1" class="tab-pane active">
                    <div class="sidebar-title">
                        <h3> <i class="fa fa-comments-o"></i> 主题设置</h3>
                        <small><i class="fa fa-tim"></i> 你可以从这里选择和预览主题的布局和样式，这些设置会被保存在本地，下次打开的时候会直接应用这些设置。</small>
                    </div>

                </div>
                <div id="tab-2" class="tab-pane active skin-setttings ">

                    <div class="title" style=" font-size: 10px">主题设置</div>
                    <div class="setings-item">
                        <span>收起左侧菜单</span>
                        <div class="switch">
                            <div class="onoffswitch">
                                <input type="checkbox" name="collapsemenu" class="onoffswitch-checkbox" id="collapsemenu">
                                <label class="onoffswitch-label" for="collapsemenu">
                                    <span class="onoffswitch-inner"></span>
                                    <span class="onoffswitch-switch"></span>
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="setings-item">
                        <span>固定顶部</span>

                        <div class="switch">
                            <div class="onoffswitch">
                                <input type="checkbox" name="fixednavbar" class="onoffswitch-checkbox" id="fixednavbar">
                                <label class="onoffswitch-label" for="fixednavbar">
                                    <span class="onoffswitch-inner"></span>
                                    <span class="onoffswitch-switch"></span>
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="setings-item">
                                <span>
                        固定宽度
                    </span>

                        <div class="switch">
                            <div class="onoffswitch">
                                <input type="checkbox" name="boxedlayout" class="onoffswitch-checkbox" id="boxedlayout">
                                <label class="onoffswitch-label" for="boxedlayout">
                                    <span class="onoffswitch-inner"></span>
                                    <span class="onoffswitch-switch"></span>
                                </label>
                            </div>
                        </div>
                    </div>


                </div>
                <div id="tab-3" class="tab-pane">
                    <div class="skin-setttings">

                        <div class="title">皮肤选择</div>
                        <div class="setings-item default-skin nb">
                                <span class="skin-name ">
                         <a href="#" class="s-skin-0">
                             默认皮肤

                         </a>
                    </span>
                        </div>
                        <div class="setings-item blue-skin nb">
                                <span class="skin-name ">
                        <a href="#" class="s-skin-1">
                            蓝色主题
                        </a>
                    </span>
                        </div>
                        <div class="setings-item yellow-skin nb">
                                <span class="skin-name ">
                        <a href="#" class="s-skin-3">
                            黄色/紫色主题
                        </a>
                    </span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--右侧边栏结束-->
        <!--mini聊天窗口开始-->

    </div>
</div>

<script src="${pageContext.request.contextPath}/static/js/jquery-2.1.0.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js?v=3.3.5"></script>
<script src="${pageContext.request.contextPath}/static/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="${pageContext.request.contextPath}/static/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/plugins/layer/layer.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/hplus.min.js?v=4.0.0"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/contabs.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/plugins/pace/pace.min.js"></script>


<script>
    $(function () {
        var total=0;
        $.get(
            "${pageContext.request.contextPath}/cylinder/findByStateI",
            {state:true},
            function (i) {
                $("#spanTrue").html(i);
                total=total+i;
            }
        );

        $.get(
            "${pageContext.request.contextPath}/cylinder/findByStateI",
            {state:false},
            function (i) {
                $("#spanFalse").html(i);
                total=total+i;
                setTimeout(function () {
                    $("#spanTotal").html(total);
                },400);

            }
        );
        var name="${pageContext.session.getAttribute("username")}";
        $.get(
            "${pageContext.request.contextPath}/log/findLast",
            {lname:name},
            function (data) {
                $("#top-search").val(name+","+data);
            }
        );

    });
</script>
<script type="text/javascript">
    function logout() {
        var flag = confirm("您确定要退出吗？");
        if (flag){
            location.href='${pageContext.request.contextPath}/login/login.jsp';
        }

    }



</script>
</body>

</html>