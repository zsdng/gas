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

</head>
<style>
    html,body{

        width:100%;
        height: 100%;
    }

    body{
        background: url("${pageContext.request.contextPath}/static/img/304590_meitu_2.jpg")  no-repeat;
        background-size:100%;
    }

</style>

<body>


<div class="container" style="width: 400px;">
    <h3 style="text-align: center;">修改联系人</h3>
    <form action="${pageContext.request.contextPath}/empControl/updateEmp" method="post">
        <input type="hidden" name="eid" value="${emp.eid}">
        <div class="form-group">
            <label for="name">姓名：</label>
            <input type="text" class="form-control" id="name" name="name" value="${emp.name}" readonly="readonly"
                   placeholder="请输入姓名"/>
        </div>

        <div class="form-group">
            <label for="age">年龄：</label>
            <input type="text" class="form-control" id="age" name="age" value="${emp.age}" placeholder="请输入年龄"/>
        </div>

        <div class="form-group">
            <label>性别：</label>
            <c:if test="${emp.sex == '男'}">

                <input type="radio" name="sex" value="男" checked/>男
                <input type="radio" name="sex" value="女"/>女
            </c:if>

            <c:if test="${emp.sex== '女'}">

                <input type="radio" name="sex" value="男"/>男
                <input type="radio" name="sex" value="女" checked/>女
            </c:if>


        </div>



        <div class="form-group">
            <label for="address">地址：</label>
            <select name="address" class="form-control" id="address">
                <c:if test="${emp.address== '河南省洛阳市'}">
                    <option value="河南省洛阳市" selected>河南省洛阳市</option>
                    <option value="广东">广东</option>
                    <option value="广西">广西</option>
                    <option value="北京">北京</option>
                    <option value="湖南">湖南</option>
                </c:if>
                <c:if test="${emp.address== '广东'}">
                    <option value="河南省洛阳市">河南省洛阳市</option>
                    <option value="广东" selected>广东</option>
                    <option value="广西">广西</option>
                    <option value="北京" >北京</option>
                    <option value="湖南">湖南</option>
                </c:if>
                <c:if test="${emp.address== '广西'}">
                    <option value="河南省洛阳市">河南省洛阳市</option>
                    <option value="广东">广东</option>
                    <option value="广西" selected>广西</option>
                    <option value="北京" >北京</option>
                    <option value="湖南">湖南</option>
                </c:if>
                <c:if test="${emp.address== '湖南'}">
                    <option value="河南省洛阳市">河南省洛阳市</option>
                    <option value="广东">广东</option>
                    <option value="广西">广西</option>
                    <option value="北京" >北京</option>
                    <option value="湖南" selected>湖南</option>
                </c:if>
                <c:if test="${emp.address== '北京'}">
                    <option value="河南省洛阳市">河南省洛阳市</option>
                    <option value="广东">广东</option>
                    <option value="广西">广西</option>
                    <option value="北京" selected>北京</option>
                    <option value="湖南">湖南</option>
                </c:if>
            </select>
        </div>

        <div class="form-group">
            <label for="phone">电话</label>
            <input type="text" class="form-control" name="phone" value="${emp.phone}" placeholder="请输入电话号码" id="phone"/>
        </div>

        <%--<div class="form-group">
            <label for="email">Email：</label>
            <input type="text" class="form-control" name="email" value="${emp.email}" placeholder="请输入邮箱地址"
                   id="email"/>
        </div>--%>

        <div class="form-group" style="text-align: center">
            <input class="btn btn-primary" type="submit" value="提交"/>
            <input class="btn btn-default" type="reset" value="恢复默认"/>
            <input class="btn btn-default" type="button" id="btn_return" value="返回">
        </div>
    </form>

</div>
<script>






    var btn_return = document.getElementById("btn_return");
    btn_return.onclick = function () {
        location.href = "${pageContext.request.contextPath}/empControl/findAllEmp";
    }


</script>

</body>
</html>
