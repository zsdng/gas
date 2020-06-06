<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="true" isELIgnored="false" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
${errorMsg}
<h3>如果你是在点击登录的时候看到此页面，请<a href="${pageContext.request.contextPath}/login/login.jsp">点击这里</a>跳转回登录页面即可</h3>
<h3>如果你在其他功能看到此页面，请与管理员fy联系</h3>
</body>
</html>
