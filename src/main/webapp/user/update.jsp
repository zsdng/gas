<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!-- 网页使用的语言 -->
<html lang="zh-CN">
<head>
    <%--    <base href="<%=basePath%>"/>--%>
    <!-- 指定字符集 -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>修改用户</title>

    <link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/static/js/jquery-2.1.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>

        <%--一旦访问update页面就会异步查询并返回一个用户对象--%>
    <script>
    $.get("${pageContext.request.contextPath}/user/findUserById",
        {id:${pageContext.request.getParameter("id")}},function (data) {
            $("#id").val(data.id);
            $("#username").val(data.username);
            $("#password").val(data.password);
            if ("管理员"===data.position){
                $("#admin").attr("checked","checked")
            }else {
                $("#oper").attr("checked","checked") }
        }
    );

    </script>
</head>
<style>
    html, body {
        width: 100%;
        height: 100%;
    }
    body {
        background: url("${pageContext.request.contextPath}/static/img/2011955_meitu_1.jpg") no-repeat;
        background-size: 100%;
    }

</style>


<body>


<div class="container" style="width: 400px;">
    <h3 style="text-align: center;">修改用户</h3>
    <form action="${pageContext.request.contextPath}/user/updateUser" method="post">
        <input type="hidden" id="id" name="id" value="">
        <div class="form-group">
            <label for="username">用户名：</label>
            <input type="text" class="form-control" id="username" name="username" value="" readonly="readonly"
                   placeholder="请输入用户名"/>
        </div>

        <div class="form-group">
            <label for="password">密码：</label>
            <input type="password" class="form-control" id="password" name="password" value="" placeholder="请输入密码"/>
        </div>

        <div class="form-group">
            <label>职位：</label>
                <input id="admin" type="radio" name="position" value="管理员" />管理员
                <input id="oper" type="radio" name="position" value="操作员" />操作员
        </div>

        <div class="form-group" style="text-align: center">
            <input class="btn btn-primary" type="submit" value="提交"/>
            <input class="btn btn-default" type="button" id="btn_return" value="返回">
        </div>
    </form>

</div>
<script>
    var btn_return = document.getElementById("btn_return");
    btn_return.onclick = function () {
        location.href = "${pageContext.request.contextPath}/user/findAll";
    }


</script>

</body>
</html>
