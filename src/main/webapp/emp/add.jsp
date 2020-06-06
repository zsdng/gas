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
    <title>添加员工</title>

    <!-- 1. 导入CSS的全局样式 -->
    <link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet">
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script src="${pageContext.request.contextPath}/static/js/jquery-2.1.0.min.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>
</head>
<style>
    html,body{

        width:100%;
        height: 100%;
    }

    body{
        background: url("${pageContext.request.contextPath}/static/img/empadd.jpg")  no-repeat;
        background-size:100%;
    }
</style>
<body>
<div class="container" style="width: 500px">
    <center><h3>添加员工页面</h3></center>
    <form action="${pageContext.request.contextPath}/empControl/addEmp" method="post">
        <div class="form-group">
            <label for="name">姓名：</label>
            <input type="text" class="form-control" id="name" name="name" placeholder="请输入姓名">
        </div>

        <div class="form-group">
            <label for="age">年龄：</label>
            <input type="text" class="form-control" id="age" name="age" placeholder="请输入年龄">
        </div>

        <div class="form-group">
            <label>性别：</label>
            <input type="radio" name="sex" value="男" checked="checked"/>男
            <input type="radio" name="sex" value="女"/>女
        </div>



        <div class="form-group">
            <label for="address">地址：</label>
            <select name="address" class="form-control" id="address">
                <option value="河南省洛阳市">河南省洛阳市</option>
                <option value="广东" >广东</option>
                <option value="广西">广西</option>
                <option value="北京">北京</option>
                <option value="湖南">湖南</option>
            </select>
        </div>

        <div class="form-group">
            <label for="phone">电话：</label>
            <input type="text" class="form-control" id="phone" name="phone" placeholder="请输入电话号码"/>
        </div>

       <%-- <div class="form-group">
            <label for="email">Email：</label>
            <input type="text" class="form-control" id="email" name="email" placeholder="请输入邮箱地址"/>
        </div>--%>

        <div class="form-group" style="text-align: center">
            <input class="btn btn-primary" type="submit" value="提交" />
            <input class="btn btn-default" type="reset" value="重置" />
            <input class="btn btn-default" type="button" id="return" value="返回" />
        </div>
    </form>
</div>
<script>


    document.getElementById("return").onclick=function () {
        location.href="${pageContext.request.contextPath}/empControl/findAllEmp"

    }

</script>
</body>
</html>
