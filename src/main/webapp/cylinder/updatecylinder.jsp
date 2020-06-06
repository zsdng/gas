<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html lang="zh-CN">
<head>
    <!-- 指定字符集 -->
    <meta charset="utf-8">
    <!-- 使用Edge最新的浏览器的渲染方式 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- viewport视口：网页可以根据设置的宽度自动进行适配，在浏览器的内部虚拟一个容器，容器的宽度与设备的宽度相同。
    width: 默认宽度与设备的宽度相同
    initial-scale: 初始的缩放比，为1:1 -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>修改存储气瓶信息</title>
    <link href="${pageContext.request.contextPath}/static/css/bootstrap-datetimepicker.min.css" rel="stylesheet"
          media="screen">
    <!-- 1. 导入CSS的全局样式 -->
    <link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet">
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script src="${pageContext.request.contextPath}/static/js/jquery-2.1.0.min.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>

</head>
<style>
    html, body {

        width: 100%;
        height: 100%;
    }

    body {
        background: url("${pageContext.request.contextPath}/static/img/updatecy.jpg") no-repeat;
        background-size: 100%;
    }
</style>

<body>
<div class="container" style="width: 500px">
    <center><h3>修改存储气瓶信息</h3></center>
    <form action="${pageContext.request.contextPath}/cylinder/updateCylinder" method="post">
        <input type="hidden" name="id" value="${cylinder.id}">
        <div class="form-group">
            <label for="kind">所装气体</label>
            <c:if test="${cylinder.kind =='液氨'}">
                <select name="kind" class="form-control" id="kind">
                    <option value="请选择">--请选择--</option>
                    <option value="液氨" selected>液氨</option>
                    <option value="液化天然气">液化天然气</option>
                    <option value="压缩天然气">压缩天然气</option>
                    <option value="液氯">液氯</option>
                    <option value="甲烷">甲烷</option>
                    <option value="氢气">氢气</option>
                    <option value="氧气">氧气</option>
                    <option value="液化石油气">液化石油气</option>
                    <option value="氯乙烯">氯乙烯</option>
                    <option value="液氦">液氦</option>
                </select>
            </c:if>
            <c:if test="${cylinder.kind =='液化天然气'}">
                <select name="kind" class="form-control" id="kind">
                    <option value="请选择">--请选择--</option>
                    <option value="液氨" >液氨</option>
                    <option value="液化天然气" selected>液化天然气</option>
                    <option value="压缩天然气">压缩天然气</option>
                    <option value="液氯">液氯</option>
                    <option value="甲烷">甲烷</option>
                    <option value="氢气">氢气</option>
                    <option value="氧气">氧气</option>
                    <option value="液化石油气">液化石油气</option>
                    <option value="氯乙烯">氯乙烯</option>
                    <option value="液氦">液氦</option>
                </select>
            </c:if>
            <c:if test="${cylinder.kind =='压缩天然气'}">
                <select name="kind" class="form-control" id="kind">
                    <option value="请选择">--请选择--</option>
                    <option value="液氨" >液氨</option>
                    <option value="液化天然气" >液化天然气</option>
                    <option value="压缩天然气" selected>压缩天然气</option>
                    <option value="液氯">液氯</option>
                    <option value="甲烷">甲烷</option>
                    <option value="氢气">氢气</option>
                    <option value="氧气">氧气</option>
                    <option value="液化石油气">液化石油气</option>
                    <option value="氯乙烯">氯乙烯</option>
                    <option value="液氦">液氦</option>
                </select>
            </c:if>
            <c:if test="${cylinder.kind =='液氯'}">
                <select name="kind" class="form-control" id="kind">
                    <option value="请选择">--请选择--</option>
                    <option value="液氨" >液氨</option>
                    <option value="液化天然气" >液化天然气</option>
                    <option value="压缩天然气" >压缩天然气</option>
                    <option value="液氯" selected>液氯</option>
                    <option value="甲烷">甲烷</option>
                    <option value="氢气">氢气</option>
                    <option value="氧气">氧气</option>
                    <option value="液化石油气">液化石油气</option>
                    <option value="氯乙烯">氯乙烯</option>
                    <option value="液氦">液氦</option>
                </select>
            </c:if>
            <c:if test="${cylinder.kind =='甲烷'}">
                <select name="kind" class="form-control" id="kind">
                    <option value="请选择">--请选择--</option>
                    <option value="液氨" >液氨</option>
                    <option value="液化天然气" >液化天然气</option>
                    <option value="压缩天然气" >压缩天然气</option>
                    <option value="液氯" >液氯</option>
                    <option value="甲烷" selected>甲烷</option>
                    <option value="氢气">氢气</option>
                    <option value="氧气">氧气</option>
                    <option value="液化石油气">液化石油气</option>
                    <option value="氯乙烯">氯乙烯</option>
                    <option value="液氦">液氦</option>
                </select>
            </c:if>
            <c:if test="${cylinder.kind =='氢气'}">
                <select name="kind" class="form-control" id="kind">
                    <option value="请选择">--请选择--</option>
                    <option value="液氨" >液氨</option>
                    <option value="液化天然气" >液化天然气</option>
                    <option value="压缩天然气" >压缩天然气</option>
                    <option value="液氯" >液氯</option>
                    <option value="甲烷">甲烷</option>
                    <option value="氢气" selected>氢气</option>
                    <option value="氧气">氧气</option>
                    <option value="液化石油气">液化石油气</option>
                    <option value="氯乙烯">氯乙烯</option>
                    <option value="液氦">液氦</option>
                </select>
            </c:if>
            <c:if test="${cylinder.kind =='氧气'}">
                <select name="kind" class="form-control" id="kind">
                    <option value="请选择">--请选择--</option>
                    <option value="液氨" >液氨</option>
                    <option value="液化天然气" >液化天然气</option>
                    <option value="压缩天然气" >压缩天然气</option>
                    <option value="液氯" >液氯</option>
                    <option value="甲烷">甲烷</option>
                    <option value="氢气" >氢气</option>
                    <option value="氧气" selected>氧气</option>
                    <option value="液化石油气">液化石油气</option>
                    <option value="氯乙烯">氯乙烯</option>
                    <option value="液氦">液氦</option>
                </select>
            </c:if>
            <c:if test="${cylinder.kind =='液化石油气'}">
                <select name="kind" class="form-control" id="kind">
                    <option value="请选择">--请选择--</option>
                    <option value="液氨" >液氨</option>
                    <option value="液化天然气" >液化天然气</option>
                    <option value="压缩天然气" >压缩天然气</option>
                    <option value="液氯" >液氯</option>
                    <option value="甲烷">甲烷</option>
                    <option value="氢气" >氢气</option>
                    <option value="氧气" >氧气</option>
                    <option value="液化石油气" selected>液化石油气</option>
                    <option value="氯乙烯">氯乙烯</option>
                    <option value="液氦">液氦</option>
                </select>
            </c:if>
            <c:if test="${cylinder.kind =='氯乙烯'}">
                <select name="kind" class="form-control" id="kind">
                    <option value="请选择">--请选择--</option>
                    <option value="液氨" >液氨</option>
                    <option value="液化天然气" >液化天然气</option>
                    <option value="压缩天然气" >压缩天然气</option>
                    <option value="液氯" >液氯</option>
                    <option value="甲烷">甲烷</option>
                    <option value="氢气" >氢气</option>
                    <option value="氧气" >氧气</option>
                    <option value="液化石油气" >液化石油气</option>
                    <option value="氯乙烯" selected>氯乙烯</option>
                    <option value="液氦">液氦</option>
                </select>
            </c:if>
            <c:if test="${cylinder.kind =='液氦'}">
                <select name="kind" class="form-control" id="kind">
                    <option value="请选择">--请选择--</option>
                    <option value="液氨" >液氨</option>
                    <option value="液化天然气" >液化天然气</option>
                    <option value="压缩天然气" >压缩天然气</option>
                    <option value="液氯" >液氯</option>
                    <option value="甲烷">甲烷</option>
                    <option value="氢气" >氢气</option>
                    <option value="氧气" >氧气</option>
                    <option value="液化石油气" >液化石油气</option>
                    <option value="氯乙烯" >氯乙烯</option>
                    <option value="液氦" selected>液氦</option>
                </select>
            </c:if>
        </div>

        <c:if test="${cylinder.state}">
            <div class="form-group" >
                <label>气瓶状态</label>
                <input type="radio" name="state" value="false"  />需要充气
                <input type="radio" name="state" value="true"   checked="checked" />不需要充气
            </div>
        </c:if>
        <c:if test="${!cylinder.state}">
            <div class="form-group " >
                <label>气瓶状态</label>
                <input type="radio" name="state" value="false"  checked="checked" />需要充气
                <input type="radio" name="state" value="true"  />不需要充气
            </div>

        </c:if>

        <div class="form-group">
            <label for="manufacturer">气瓶制造商：</label>
            <input type="text" class="form-control" id="manufacturer" name="manufacturer" value="${cylinder.manufacturer}" placeholder="请输入制造商">
        </div>

        <div class="form-group">
            <label for="area">气瓶制造地：</label>
            <input type="text" class="form-control" id="area" name="area" value="${cylinder.area}" placeholder="请输入制造地">
        </div>

        <div class="form-group disabled">
            <label for="createtime">气瓶制造时间</label>
            <fmt:formatDate value="${cylinder.createtime}" type="date" pattern="yyyy/MM/dd HH:mm:ss" var="time"/>
            <input type="text" class="form-control" id="createtime" name="createtime" value="${time}" readonly>
        </div>



        <div class="form-group">
            <label for="dtp_input1">入库时间：</label><br>
            <div class="input-group date form_datetime col-md-12"
                 data-date-format="yyyy/mm/dd hh:ii:ss " data-link-field="dtp_input1">
                <fmt:formatDate value="${cylinder.jointime}" type="date" pattern="yyyy/MM/dd HH:mm:ss" var="jointime"/>
                <input class="form-control" size="100" name="createtime" type="text" value="${jointime}" readonly>
                <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
            </div>
            <input type="hidden" id="dtp_input1" value=""/><br/>
        </div>


        <div class="form-group">
            <label for="operator">修改人员</label>
            <input type="text" class="form-control" id="operator" name="operator"
                   value="${pageContext.session.getAttribute("username")}" readonly/>
        </div>


        <div class="form-group" style="text-align: center">
            <input class="btn btn-primary" type="submit" value="提交"/>
            <input class="btn btn-default" type="reset" value="重置"/>
            <input class="btn btn-default" type="button" id="return" value="返回"/>
        </div>
    </form>
</div>

<%--<script type="text/javascript" src="${pageContext.request.contextPath}/static/bootstrap/jquery/jquery-1.8.3.min.js" charset="UTF-8"></script>--%>
<%--<script type="text/javascript" src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.min.js"></script>--%>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap-datetimepicker.js"
        charset="UTF-8"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/static/bootstrap/js/locales/bootstrap-datetimepicker.zh-CN.js"
        charset="UTF-8"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/static/bootstrap/js/locales/bootstrap-datetimepicker.zh-TW.js"
        charset="UTF-8"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/static/bootstrap/js/locales/bootstrap-datetimepicker.fr.js"
        charset="UTF-8"></script>


<script>
    $('.form_datetime').datetimepicker({
        language: 'zh-CN',
        weekStart: 1,
        // format:"yyyy-mm-dd hh:ii:ss",
        todayBtn: 1,
        autoclose: true,
        todayHighlight: 1,
        startView: 2,
        forceParse: 0,
        showMeridian: 1,
        initialDate:"2020/04/01 04:20",
        endDate:new Date(),
    });


    document.getElementById("return").onclick = function () {
        location.href = "${pageContext.request.contextPath}/cylinder/findAllCy"

    };


</script>
</body>
</html>
