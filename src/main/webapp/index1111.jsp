<%@ page import="cn.fy.utils.GetIp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="account/findAll">findAll</a>
<h3>测试add</h3>
<form action="account/addAccount" method="post">

   姓名 <input type="text" name="name"><br>
    钱<input type="text" name="money"><br>
    <input type="submit" value="提交">
</form>
${pageContext.request.getSession("aaa")}

<h2>SpringMVC</h2>


<form action="${pageContext.request.contextPath}/picture/fileupload2" method="post" enctype="multipart/form-data">
    <input type="file" name="upload"><br>
    <input type="submit" value="文件上传">
</form>

</body>
</html>
