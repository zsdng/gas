<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>添加成功</title>
    <style>
        div {
            text-align: center;

        }
        #add{
            font-size: 30px;
            width: 300px;
            height: 100px;
        }

    </style>
</head>
<body>
<h1>添加成功！</h1>

<div><input type="button" value="返回查询页面" href="/userListServlet" id="add">
</div>
<script>
    var add = document.getElementById("add");
    add.onclick = function () {
        location.href = "${pageContext.request.contextPath}/userListServlet";
    }

</script>

</body>
</html>
