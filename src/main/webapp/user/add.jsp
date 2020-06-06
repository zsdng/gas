<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

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
    <title>添加用户</title>

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
        background: url("${pageContext.request.contextPath}/static/img/useradd.jpg") no-repeat;
        background-size: 100%;
    }

    div {
        font-size: 20px;
    }

</style>
<body>
<div class="container" style="width: 500px">
    <center><h2>添加用户页面</h2></center>
    <form action="${pageContext.request.contextPath}/user/addUser" id="addform" method="post">
        <input id="hidd1" type="text" hidden><%--隐藏域用来用户名存是否存在最后提交的时候用--%>
        <div class="form-group">
            <label for="username">用户名：</label>
            <input type="text" class="form-control" id="username" name="username" placeholder="请输入用户名"><span
                id="msg1"></span>
        </div>

        <div class="form-group">
            <label for="password">密码：</label>
            <input type="password" class="form-control" id="password" name="password" placeholder="请输入密码"><span
                id="msg2"></span>
        </div>

        <div class="form-group">
            <label for="password">确认密码：</label>
            <input type="password" class="form-control" id="password2" placeholder="请再次输入密码"><span id="msg3"></span>
        </div>

        <div class="form-group">
            <label>职位：</label>
            <input type="radio" name="position" value="管理员"/>管理员
            <input type="radio" name="position" value="操作员" checked="checked"/>操作员
        </div>


        <div class="form-group" style="text-align: center">
            <a class="btn  btn-primary" href="javascript:submit2()" role="button">提交</a>
            <input class="btn btn-default" type="reset" value="重置"/>
            <input class="btn btn-default" type="button" id="return" value="返回"/>
        </div>
    </form>
</div>
<script>
    $(function () {
            $("#username").blur(function () {
                var val = $(this).val();
                $.get(
                    "${pageContext.request.contextPath}/findUserName",
                    {username: val},
                    function (data) {
                        if (data) {
                            $("#msg1").css("color", "#65ddff");
                            $("#msg1").html("已存在该用户！");
                            $("#hidd1").val("cunzai");
                        } else {
                            if (val != null && val !== "") {
                                $("#msg1").css("color", "white");
                                $("#msg1").html("用户名可用");
                                $("#hidd1").val("bucunzai");
                            }

                        }
                    }
                )
            });
        },

        <!-- 判断两次输入密码是否一致-->
        $("#password2").mouseout(function () {
            var val = $(this).val();
            if (val !== $("#password").val()) {
                $("#msg3").css("color", "red");
                $("#msg3").html("两次输入密码不一致！");
            } else {
                if (val != null && val !== "") {
                    $("#msg3").css("color", "green");
                    $("#msg3").html("两次密码一致");
                }
            }
        })
    );


    function submit2() {
        if ($("#username").val() == null || $("#username").val() === "") {
            $("#msg1").html("请输入用户名！");
        } else {
            if ($("#password").val() == null || $("#password").val() === "") {
                $("#msg2").html("请输入密码！");
            } else {
                if ($("#password2") == null || $("#password2").val() === "") {
                    $("#msg3").html("请再次输入密码！");
                } else {
                    if ("cunzai" !== $("#hidd1").val()) {
                        <!-- 判断两次输入密码是否一致-->
                        if ($("#password2").val() === $("#password").val()) {
                            var flag = confirm("您确定提交吗 ?");
                            if (flag) {
                                $("#addform").submit();
                                alert("添加成功！")
                            }
                        } else {
                            alert("两次输入密码不一致！");
                        }
                    } else {
                        alert("用户名已存在！");
                    }
                }
            }
        }
    }

    document.getElementById("return").onclick = function () {
        location.href = "${pageContext.request.contextPath}/user/findAll"

    }

</script>
</body>
</html>
