<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>执行成功</title>
</head>

<!-- 1. 导入CSS的全局样式 -->
<link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet">
<!-- 2. jQuery导入，建议使用1.9以上的版本 -->
<script src="${pageContext.request.contextPath}/static/js/jquery-2.1.0.min.js"></script>
<!-- 3. 导入bootstrap的js文件 -->
<script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>
<style>


   html,body{

        width:100%;
        height: 100%;
    }

   body{
       background: url("${pageContext.request.contextPath}/static/img/first.jpg")  no-repeat;
       background-size:100%;
   }

</style>
<body>

<h2>执行成功！！！</h2>
${user}

${list}<br>

<c:forEach items="${list}" var="account">

    ${account.name}+${account.money}
</c:forEach>

</body>
</html>
