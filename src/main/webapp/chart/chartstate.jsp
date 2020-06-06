<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>百度ECHarts</title>
    <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
    <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

    <link rel="shortcut icon" href="../static/img/favicon.ico">
    <link href="../static/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="../static/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">

    <link href="../static/css/animate.min.css" rel="stylesheet">
    <link href="../static/css/style.min.css?v=4.0.0" rel="stylesheet">

</head>

<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>饼状图</h5>
                    <div class="ibox-tools">
                        <a class="collapse-link">
                            <i class="fa fa-chevron-up"></i>
                        </a>
                        <a class="dropdown-toggle" data-toggle="dropdown" href="graph_flot.html#">
                            <i class="fa fa-wrench"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-user">
                            <li><a href="${pageContext.request.contextPath}/cylinder/findByStateLtrue">查看已充气气瓶信息</a>
                            </li>
                            <li><a href="${pageContext.request.contextPath}/cylinder/findByStateLfalse">查看未充气气瓶信息</a>
                            </li>
                        </ul>
                        <a class="close-link">
                            <i class="fa fa-times"></i>
                        </a>
                    </div>
                </div>
                <div class="ibox-content">
                    <div class="echarts" id="piechart1"></div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>柱状图</h5>
                    <div class="ibox-tools">
                        <a class="collapse-link">
                            <i class="fa fa-chevron-up"></i>
                        </a>
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            <i class="fa fa-wrench"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-user">
                            <li><a href="${pageContext.request.contextPath}/cylinder/findAllCy">查询所有</a>
                            </li>
                        </ul>
                        <a class="close-link">
                            <i class="fa fa-times"></i>
                        </a>
                    </div>
                </div>
                <div class="ibox-content">

                    <div class="echarts" id="echarts-bar-chart"></div>
                </div>
            </div>
        </div>
    </div>
</div>

<%--<c:forEach items="${zf}" var="z" varStatus="s">
    <c:if test="${z.kind=='液氨'}">   这个部分的代码当时为下面写那个提供了思路和可行性
        ya=${z.c};
    </c:if>
    <c:if test="${z.kind=='液化天然气'}">
        yhtrq=${z.c};
    </c:if>
    <c:if test="${z.kind=='压缩天然气'}">
        ystrq=${z.c};
    </c:if>
    <c:if test="${z.kind=='液氯'}">
        yl=${z.c};
    </c:if>
    <c:if test="${z.kind=='甲烷'}">
        jw=${z.c};
    </c:if>
    <c:if test="${z.kind=='氢气'}">
        qq=${z.c};
    </c:if>
    <c:if test="${z.kind=='氧气'}">
        yq=${z.c};
    </c:if>
    <c:if test="${z.kind=='液化石油气'}">
        yhsyq=${z.c};
    </c:if>
    <c:if test="${z.kind=='氯乙烯'}">
        lyx=${z.c};
    </c:if>
    <c:if test="${z.kind=='液氦'}">
        yh=${z.c};
    </c:if>


</c:forEach>--%>




<script src="../static/js/jquery.min.js?v=2.1.4"></script>

<script src="../static/js/bootstrap.min.js?v=3.3.5"></script>
<script src="../static/js/plugins/echarts/echarts-all.js"></script>
<script src="../static/js/content.min.js?v=1.0.0"></script>
<script type="text/javascript">
    $(function () {
        $(".gohome").html("");
        var total = 0;
        var itrue = 0;
        var ifalse = 0;
        var zf;
        <!-- 第一个异步请求获取state为true的数据-->
        $.get(
            "${pageContext.request.contextPath}/cylinder/findByStateI",
            {state: true},
            function (i) {
                $("#spanTrue").html(i);
                total = total + i;
                itrue = i + itrue;
            }
        );
        <!-- 第二个异步请求获取state为false的数据-->
        $.get(
            "${pageContext.request.contextPath}/cylinder/findByStateI",
            {state: false},
            function (i) {
                $("#spanFalse").html(i);
                total = total + i;
                ifalse = i + ifalse;
            }
        );
        <!-- 第三个同步请求获取柱状图中kind和state为false对应的数量的集合-->

        <!--  这里开始是已充气的不同种类的气瓶的的数据的赋值分开显示数据 -->
        var yat=0;
        var yhtrqt=0;
        var ystrqt=0;
        var ylt=0;
        var jwt=0;
        var qqt=0;
        var yqt=0;
        var yhsyqt=0;
        var lyxt=0;
        var yht=0;

        <c:forEach items="${fyt}" var="z" varStatus="s">
        <c:if test="${z.kind=='液氨'}">
        yat=${z.c};
        </c:if>
        <c:if test="${z.kind=='液化天然气'}">
        yhtrqt=${z.c};
        </c:if>
        <c:if test="${z.kind=='压缩天然气'}">
        ystrqt=${z.c};
        </c:if>
        <c:if test="${z.kind=='液氯'}">
        ylt=${z.c};
        </c:if>
        <c:if test="${z.kind=='甲烷'}">
        jwt=${z.c};
        </c:if>
        <c:if test="${z.kind=='氢气'}">
        qqt=${z.c};
        </c:if>
        <c:if test="${z.kind=='氧气'}">
        yqt=${z.c};
        </c:if>
        <c:if test="${z.kind=='液化石油气'}">
        yhsyqt=${z.c};
        </c:if>
        <c:if test="${z.kind=='氯乙烯'}">
        lyxt=${z.c};
        </c:if>
        <c:if test="${z.kind=='液氦'}">
        yht=${z.c};
        </c:if>

        </c:forEach>
        <!--  这里开始是未充气的不同种类的气瓶的数据的赋值的分开显示数据 -->
        var yaf=0;
        var yhtrqf=0;
        var ystrqf=0;
        var ylf=0;
        var jwf=0;
        var qqf=0;
        var yqf=0;
        var yhsyqf=0;
        var lyxf=0;
        var yhf=0;

        <c:forEach items="${fyf}" var="z" varStatus="s">
        <c:if test="${z.kind=='液氨'}">
        yaf=${z.c};
        </c:if>
        <c:if test="${z.kind=='液化天然气'}">
        yhtrqf=${z.c};
        </c:if>
        <c:if test="${z.kind=='压缩天然气'}">
        ystrqf=${z.c};
        </c:if>
        <c:if test="${z.kind=='液氯'}">
        ylf=${z.c};
        </c:if>
        <c:if test="${z.kind=='甲烷'}">
        jwf=${z.c};
        </c:if>
        <c:if test="${z.kind=='氢气'}">
        qqf=${z.c};
        </c:if>
        <c:if test="${z.kind=='氧气'}">
        yqf=${z.c};
        </c:if>
        <c:if test="${z.kind=='液化石油气'}">
        yhsyqf=${z.c};
        </c:if>
        <c:if test="${z.kind=='氯乙烯'}">
        lyxf=${z.c};
        </c:if>
        <c:if test="${z.kind=='液氦'}">
        yhf=${z.c};
        </c:if>

        </c:forEach>







        // alert(str);
        <!-- 一定要延时执行为了让异步请求获取消息并赋值后在生成圆饼表-->
        setTimeout(function () {

            var l = echarts.init(document.getElementById("piechart1")), u = {
                title: {text: "气瓶未充气与已充气数量", subtext: "", x: "center"},
                tooltip: {trigger: "item", formatter: "{a} <br/>{b} : {c} ({d}%)"},
                legend: {orient: "vertical", x: "left", data: ["已充气", "未充气"]},
                calculable: !0,
                series: [{
                    name: "气瓶状态",
                    type: "pie",
                    radius: "60%",
                    center: ["50%", "60%"],
                    data: [{value: itrue, name: "已充气"}, {value: ifalse, name: "未充气"}, {value: 0, name: "分割线"}]
                }]
            };
            l.setOption(u);
            $(window).resize(l.resize);}, 700);
            <!--++++++++++++++++++++++此处是柱状图和饼图的分割线++++++++++++++++++++++++++++++++++++++++++++++++-->


            var t = echarts.init(document.getElementById("echarts-bar-chart")), n = {
                title: {text: "不同种类气体的已充气和未充气数量"},
                tooltip: {trigger: "axis"},
                legend: {data: [ "已充气","未充气"]},
                grid: {x: 30, x2: 40, y2: 24},
                calculable: !0,
                xAxis: [{
                    type: "category",
                    data: ["液氨", "液化天然气", "压缩天然气", "液氯", "甲烷", "氢气", "氧气", "液化石油气", "氯乙烯", "液氦"]
                }],
                yAxis: [{type: "value"}],
                series: [{
                    name: "已充气",
                    type: "bar",
                    data: [yat, yhtrqt, ystrqt, ylt,jwt, qqt, yqt, yhsyqt, lyxt, yht,],
                    markPoint: {data: [{type: "max", name: "最大值"}, {type: "min", name: "最小值"}]},
                    markLine: {data: [{type: "average", name: "平均值"}]}

                }, {
                    name: "未充气",
                    type: "bar",

                    data:[yaf,yhtrqf,ystrqf,ylf,jwf,qqf,yqf,yhsyqf,lyxf,yhf],
                    markPoint: {data: [{type: "max", name: "最大值"}, {type: "min", name: "最小值"}]},
                    markLine: {data: [{type: "average", name: "平均值"}]}
                }]
            };
            t.setOption(n);
            window.onresize = t.resize;



    });
</script>

</body>

</html>
