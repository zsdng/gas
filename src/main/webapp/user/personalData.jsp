<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<!-- 1. 导入CSS的全局样式 -->
<link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet">
<!-- 2. jQuery导入，建议使用1.9以上的版本 -->
<script src="${pageContext.request.contextPath}/static/js/jquery-2.1.0.min.js"></script>
<!-- 3. 导入bootstrap的js文件 -->
<script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>

<style>
    body {
        background-image: url("${pageContext.request.contextPath}/static/img/123.jpg");
    }

    #div_back {
        margin: auto;
        width: 450px;
    }

    #top {
        margin-bottom: 100px;
    }

    label {
        color: #5fa6d3;
    }

</style>
<script>
    $(function () {
        var str = "666";
        $.ajax({
            url: "${pageContext.request.contextPath}/user/showNowUser",
            contentType: "application/json;charset=UTF-8",
            data: '{"username":"${pageContext.session.getAttribute("username")}"}',
            dataType: "json",
            type: "post",
            success: function (data) {
                $("#username").val(data.username);
                $("#password").val(data.password);
                str = data;
                if (${pageContext.session.getAttribute('position')  == '操作员'}) {
                    $("#radiodiv").attr("class ", "radio disabled")
                }
            }
        });
    });

</script>


<body>
<div id="top">
</div>
<div id="div_back">
    <form action="${pageContext.request.contextPath}/user/updateSelf" id="selfForm">
        <input type="text" name="username" value="${pageContext.session.getAttribute("username")}" hidden>
        <input type="text" name="id" value="${pageContext.session.getAttribute("userId")}" hidden>
        <div class="form-group">
            <label for="username">用户名</label>
            <input type="text" class="form-control" id="username" placeholder="username" value="" readonly>
        </div>
        <div class="form-group">
            <label for="password">密码</label>
            <input type="password" class="form-control" id="password" placeholder="password" name="password"
                   disabled="disabled">
        </div>

        <div id="radiodiv" class="radio ">
            <c:if test="${pageContext.session.getAttribute('position') == '管理员'}">
                <label class="radio-inline" style=" color: white">
                    <input type="radio" name="position" id="position1" value="管理员" checked> 管理员
                </label>
                <label class="radio-inline" style=" color: white">
                    <input type="radio" name="position" id="position2" value="操作员"> 操作员
                </label>
            </c:if>

            <c:if test="${pageContext.session.getAttribute('position')  == '操作员'}">
                <label class="radio-inline" style=" color: white">
                    <input type="radio" name="position" id="position11" value="管理员" onclick="return false;"> 管理员
                </label>
                <label class="radio-inline" style=" color: white">
                    <input type="radio" name="position" id="position22" value="操作员" onclick="return false;" checked> 操作员
                </label>
            </c:if>
        </div>
        <a class="btn btn-default" href="javascript:enabled()" role="button">修改密码</a>
        <a class="btn btn-default" href="javascript:formSubmit()" role="button">保存修改</a>
        <%--        <button type="submit" class="btn btn-default">保存修改</button>--%>
    </form>


</div>
<script>

    function formSubmit() {
        if ("disabled" === $("#password").attr("disabled")) {
            alert("您未做任何修改！不能提交,请先点击修改密码按钮")
        } else {
            var flag = confirm("您确定修改吗？");
            if (flag) {
                $("#selfForm").submit();
                alert("修改成功，请重新登录！");
                top.location = "${pageContext.request.contextPath}/login/login.jsp";
            }

        }
    }


    function enabled() {
        $("#password").removeAttr("disabled");

    }


</script>


</body>
</html>
