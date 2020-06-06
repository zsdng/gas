<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta charset="utf-8"/>
    <title>帮助页面</title>
    <meta name="description" content="Restyling jQuery UI Widgets and Elements"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/ace-fonts.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/ace.min.css" id="main-ace-style"/>
    <script src="${pageContext.request.contextPath}/static/js/ace-extra.min.js"></script>
</head>

<body class="no-skin">
<!-- #section:basics/navbar.layout -->
<div id="navbar" class="navbar navbar-default">
</div>
<!-- /section:basics/navbar.layout -->
<div class="main-container" id="main-container">
    <!-- #section:basics/sidebar -->
    <!-- /section:basics/sidebar -->
    <div class="main-content">
        <!-- #section:basics/content.breadcrumbs -->
        <!-- /section:basics/content.breadcrumbs -->
        <div class="page-content">

            <!-- /section:settings.box -->
            <div class="page-content-area">
                <div class="row">
                    <div class="col-xs-12">
                        <!-- PAGE CONTENT BEGINS -->
                        <div class="tabbable">
                            <!-- #section:pages/faq -->
                            <ul class="nav nav-tabs padding-18 tab-size-bigger" id="myTab">
                                <li class="active">
                                    <a data-toggle="tab" href="#faq-tab-1">
                                        <i class="blue ace-icon fa fa-question-circle bigger-120"></i>
                                        首页及登录
                                    </a>
                                </li>

                                <li>
                                    <a data-toggle="tab" href="#faq-tab-2">
                                        <i class="green ace-icon fa fa-user bigger-120"></i>
                                        用户信息
                                    </a>
                                </li>

                                <li>
                                    <a data-toggle="tab" href="#faq-tab-3">
                                        <i class="orange ace-icon fa fa-credit-card bigger-120"></i>
                                        员工信息
                                    </a>
                                </li>

                                <li class="dropdown">
                                    <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                        <i class="purple ace-icon fa fa-magic bigger-120"></i>

                                        更多帮助
                                        <i class="ace-icon fa fa-caret-down"></i>
                                    </a>

                                    <ul class="dropdown-menu dropdown-lighter dropdown-125">
                                        <li>
                                            <a data-toggle="tab" href="#faq-tab-4"> 日历日程 </a>
                                        </li>

                                        <li>
                                            <a data-toggle="tab" href="#faq-tab-5"> 气瓶管理 </a>
                                        </li>
                                    </ul>
                                </li><!-- /.dropdown -->
                            </ul>

                            <!-- /section:pages/faq -->
                            <div class="tab-content no-border padding-24">
                                <div id="faq-tab-1" class="tab-pane fade in active">
                                    <h4 class="blue">
                                        <i class="ace-icon fa fa-check bigger-110"></i>
                                        首页设计
                                    </h4>

                                    <div class="space-8"></div>

                                    <div id="faq-list-1" class="panel-group accordion-style1 accordion-style2">
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <a href="#faq-1-1" data-parent="#faq-list-1" data-toggle="collapse"
                                                   class="accordion-toggle collapsed">
                                                    <i class="ace-icon fa fa-chevron-left pull-right"
                                                       data-icon-hide="ace-icon fa fa-chevron-down"
                                                       data-icon-show="ace-icon fa fa-chevron-left"></i>

                                                    <i class="ace-icon fa fa-user bigger-130"></i>
                                                    &nbsp; 首页饼图
                                                </a>
                                            </div>

                                            <div class="panel-collapse collapse" id="faq-1-1">
                                                <div class="panel-body">
                                                  采用百度的E-chart表格在线生成源码，通过异步查询数据库动态生成数据

                                                </div>
                                            </div>
                                        </div>

                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <a href="#faq-1-2" data-parent="#faq-list-1" data-toggle="collapse"
                                                   class="accordion-toggle collapsed">
                                                    <i class="ace-icon fa fa-chevron-left pull-right"
                                                       data-icon-hide="ace-icon fa fa-chevron-down"
                                                       data-icon-show="ace-icon fa fa-chevron-left"></i>

                                                    <i class="ace-icon fa fa-sort-amount-desc"></i>
                                                    &nbsp; 首页柱状图
                                                </a>
                                            </div>

                                            <div class="panel-collapse collapse" id="faq-1-2">
                                                <div class="panel-body">
                                                    <div id="faq-list-nested-1"
                                                         class="panel-group accordion-style1 accordion-style2">
                                                        <div class="panel panel-default">
                                                            <div class="panel-heading">
                                                                <a href="#faq-list-1-sub-1"
                                                                   data-parent="#faq-list-nested-1"
                                                                   data-toggle="collapse"
                                                                   class="accordion-toggle collapsed">
                                                                    <i class="ace-icon fa fa-plus smaller-80 middle"
                                                                       data-icon-hide="ace-icon fa fa-minus"
                                                                       data-icon-show="ace-icon fa fa-plus"></i>&nbsp;
                                                                    用来动态显示不同种类气体的已充气和未充气气瓶的数量
                                                                </a>
                                                            </div>

                                                            <div class="panel-collapse collapse" id="faq-list-1-sub-1">
                                                                <div class="panel-body">
                                                                    访问findAll将数据转发过来
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <a href="#faq-1-3" data-parent="#faq-list-1" data-toggle="collapse"
                                                   class="accordion-toggle collapsed">
                                                    <i class="ace-icon fa fa-chevron-left pull-right"
                                                       data-icon-hide="ace-icon fa fa-chevron-down"
                                                       data-icon-show="ace-icon fa fa-chevron-left"></i>

                                                    <i class="ace-icon fa fa-credit-card bigger-130"></i>
                                                    &nbsp; 关于登录页面
                                                </a>
                                            </div>

                                            <div class="panel-collapse collapse" id="faq-1-3">
                                                <div class="panel-body">
                                                    登录页面采用AJax异步技术获取数据库中的用户名判断用户是否存在
                                                    注意一旦退出登录将彻底清空浏览器登录的session信息，无法后退，请谨慎退出
                                                </div>
                                            </div>
                                        </div>


                                    </div>
                                </div>

                                <div id="faq-tab-2" class="tab-pane fade">
                                    <h4 class="blue">
                                        <i class="green ace-icon fa fa-user bigger-110"></i>
                                        用户管理相关帮助
                                    </h4>

                                    <div class="space-8"></div>

                                    <div id="faq-list-2" class="panel-group accordion-style1 accordion-style2">
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <a href="#faq-2-1" data-parent="#faq-list-2" data-toggle="collapse"
                                                   class="accordion-toggle collapsed">
                                                    <i class="ace-icon fa fa-chevron-right smaller-80"
                                                       data-icon-hide="ace-icon fa fa-chevron-down align-top"
                                                       data-icon-show="ace-icon fa fa-chevron-right"></i>&nbsp;
                                                    用户注册
                                                </a>
                                            </div>

                                            <div class="panel-collapse collapse" id="faq-2-1">
                                                <div class="panel-body">
                                                    点击添加新用户即可，可以动态判断是否已有此人
                                                </div>
                                            </div>
                                        </div>

                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <a href="#faq-2-2" data-parent="#faq-list-2" data-toggle="collapse"
                                                   class="accordion-toggle collapsed">
                                                    <i class="ace-icon fa fa-chevron-right smaller-80"
                                                       data-icon-hide="ace-icon fa fa-chevron-down align-top"
                                                       data-icon-show="ace-icon fa fa-chevron-right"></i>&nbsp;
                                                    修改头像
                                                </a>
                                            </div>

                                            <div class="panel-collapse collapse" id="faq-2-2">
                                                <div class="panel-body">
                                                    可以选择图片库中已有的头像，也可以自行上传头像，但要求大小为64*64
                                                </div>
                                            </div>
                                        </div>

                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <a href="#faq-2-3" data-parent="#faq-list-2" data-toggle="collapse"
                                                   class="accordion-toggle collapsed">
                                                    <i class="ace-icon fa fa-chevron-right middle smaller-80"
                                                       data-icon-hide="ace-icon fa fa-chevron-down align-top"
                                                       data-icon-show="ace-icon fa fa-chevron-right"></i>&nbsp;
                                                    个人资料
                                                </a>
                                            </div>

                                            <div class="panel-collapse collapse" id="faq-2-3">
                                                <div class="panel-body">
                                                    个人资料页面可以修改自己的密码，如果是管理员还可以修改权限
                                                </div>
                                            </div>
                                        </div>

                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <a href="#faq-2-4" data-parent="#faq-list-2" data-toggle="collapse"
                                                   class="accordion-toggle collapsed">
                                                    <i class="ace-icon fa fa-chevron-right smaller-80"
                                                       data-icon-hide="ace-icon fa fa-chevron-down align-top"
                                                       data-icon-show="ace-icon fa fa-chevron-right"></i>&nbsp;
                                                    修改，删除用户信息
                                                </a>
                                            </div>

                                            <div class="panel-collapse collapse" id="faq-2-4">
                                                <div class="panel-body">
                                                    不能删除自己，不能在所有信息页面中修改自己
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div id="faq-tab-3" class="tab-pane fade">
                                    <h4 class="blue">
                                        <i class="orange ace-icon fa fa-credit-card bigger-110"></i>
                                        员工信息管理
                                    </h4>

                                    <div class="space-8"></div>

                                    <div id="faq-list-3" class="panel-group accordion-style1 accordion-style2">
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <a href="#faq-3-1" data-parent="#faq-list-3" data-toggle="collapse"
                                                   class="accordion-toggle collapsed">
                                                    <i class="ace-icon fa fa-plus smaller-80"
                                                       data-icon-hide="ace-icon fa fa-minus"
                                                       data-icon-show="ace-icon fa fa-plus"></i>&nbsp;
                                                    可做操作
                                                </a>
                                            </div>

                                            <div class="panel-collapse collapse" id="faq-3-1">
                                                <div class="panel-body">
                                                    管理员可以添加删除修改
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div id="faq-tab-4" class="tab-pane fade">
                                    <h4 class="blue">
                                        <i class="purple ace-icon fa fa-magic bigger-110"></i>
                                        日历日程
                                    </h4>

                                    <div class="space-8"></div>

                                    <div id="faq-list-41" class="panel-group accordion-style1 accordion-style2">
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <a href="#faq-4-1" data-parent="#faq-list-41" data-toggle="collapse"
                                                   class="accordion-toggle collapsed">
                                                    <i class="ace-icon fa fa-hand-o-right"
                                                       data-icon-hide="ace-icon fa fa-hand-o-down"
                                                       data-icon-show="ace-icon fa fa-hand-o-right"></i>&nbsp;
                                                    可做操作
                                                </a>
                                            </div>

                                            <div class="panel-collapse collapse" id="faq-4-11">
                                                <div class="panel-body">
                                                    动态显示获取，可以删除添加和修改，添加支持两种方式，删除只支持手动输入
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <div id="faq-tab-5" class="tab-pane fade">
                                    <h4 class="blue">
                                        <i class="purple ace-icon fa fa-magic bigger-110"></i>
                                        气瓶信息管理
                                    </h4>

                                    <div class="space-8"></div>

                                    <div id="faq-list-4" class="panel-group accordion-style1 accordion-style2">
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <a href="#faq-4-1" data-parent="#faq-list-4" data-toggle="collapse"
                                                   class="accordion-toggle collapsed">
                                                    <i class="ace-icon fa fa-hand-o-right"
                                                       data-icon-hide="ace-icon fa fa-hand-o-down"
                                                       data-icon-show="ace-icon fa fa-hand-o-right"></i>&nbsp;
                                                    待充气气瓶充气
                                                </a>
                                            </div>

                                            <div class="panel-collapse collapse" id="faq-4-1">
                                                <div class="panel-body">
                                                    可以批量可以单个
                                                </div>
                                            </div>
                                        </div>

                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <a href="#faq-4-2" data-parent="#faq-list-4" data-toggle="collapse"
                                                   class="accordion-toggle collapsed">
                                                    <i class="ace-icon fa fa-frown-o bigger-120"
                                                       data-icon-hide="ace-icon fa fa-smile-o"
                                                       data-icon-show="ace-icon fa fa-frown-o"></i>&nbsp;
                                                    气瓶入库
                                                </a>
                                            </div>

                                            <div class="panel-collapse collapse" id="faq-4-2">
                                                <div class="panel-body">
                                                   目前设置了单个气瓶入库的，考虑加上excel表格导入
                                                </div>
                                            </div>
                                        </div>

                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <a href="#faq-4-3" data-parent="#faq-list-4" data-toggle="collapse"
                                                   class="accordion-toggle collapsed">
                                                    <i class="ace-icon fa fa-plus smaller-80"
                                                       data-icon-hide="ace-icon fa fa-minus"
                                                       data-icon-show="ace-icon fa fa-plus"></i>&nbsp;
                                                    气瓶送气
                                                </a>
                                            </div>

                                            <div class="panel-collapse collapse" id="faq-4-3">
                                                <div class="panel-body">
                                                    可以批量送气
                                                </div>
                                            </div>
                                        </div>

                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <a href="#faq-4-4" data-parent="#faq-list-4" data-toggle="collapse"
                                                   class="accordion-toggle collapsed">
                                                    <i class="ace-icon fa fa-plus smaller-80"
                                                       data-icon-hide="ace-icon fa fa-minus"
                                                       data-icon-show="ace-icon fa fa-plus"></i>&nbsp;
                                                    存储页面
                                                </a>
                                            </div>

                                            <div class="panel-collapse collapse" id="faq-4-4">
                                                <div class="panel-body">

                                                   存储页面只能查看和修改信息
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- PAGE CONTENT ENDS -->
                    </div><!-- /.col -->
                </div><!-- /.row -->
            </div><!-- /.page-content-area -->
        </div><!-- /.page-content -->
    </div><!-- /.main-content -->


    <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
        <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
    </a>
</div><!-- /.main-container -->

<!-- basic scripts -->

<!--[if !IE]> -->
<script type="text/javascript">
    window.jQuery || document.write("<script src='${pageContext.request.contextPath}/static/js/jquery.min.js'>" + "<" + "/script>");
</script>

<!-- <![endif]-->

<script type="text/javascript">
    if ('ontouchstart' in document.documentElement) document.write("<script src='${pageContext.request.contextPath}/static/js/jquery.mobile.custom.min.js'>" + "<" + "/script>");
</script>
<script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>

<!-- page specific plugin scripts -->

<!-- ace scripts -->
<script src="${pageContext.request.contextPath}/static/js/ace-elements.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/ace.min.js"></script>

</body>
</html>
