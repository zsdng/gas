<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>


<html>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<head>
    <title>Title</title>
</head>

<link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>
<body>
<div style="margin-top: 60px" class="container">
<div style="font-size: 20px">下载的excel的填写时注意：1.至少填写一行数据，否则会导致无法上传</div>
<div style="font-size: 20px">2.若填写的数据进行过删除（无论是删除行还是删除数据都算），必须</div>
<div style="font-size: 20px">将该行数据重新补满，或者选择重新下载excel模板，否则会上传失败</div>
<a href="${pageContext.request.contextPath}/cylinder/downloadExcel" class="btn btn-info">点击此处下载excel模板</a>
<form  method="post" enctype="multipart/form-data" id="mytouxiangform">
    <label style="font-size: 20px" >上传excel（大小不能超过10M）</label>
    <input type="file" class="btn btn-default" name="upload"  id="upload"><br>
    <a class="btn btn-primary" onclick="fileUpload();" role="button">批量添加</a>
</form>

</div>
</body>

<script>
    function fileUpload() {
        //点击按钮，不是提交表单
        //模拟一个表单对象
        var formData = new FormData();
        //向表单中新增一个文件上传框
        formData.append("file", document.getElementById("upload").files[0]);
        //异步提交上面模拟的表单
        $.ajax({
            url: "${pageContext.request.contextPath}/cylinder/uploadExcel", //后台准备一个文件上传的控制器
            type: "post", //一定是post请求 文件上传是post
            data: formData, //要提交的数据
            contentType: false, //必须为false，文件上传的时候默认才会有正确 content-Type
            processData: false, //必须为false，异步对象XMLhttpRequest才会对文件上传表单正确处理
            success: function (result) {
                //alert(JSON.stringify(result));
                //页面回显上传成功的图片
                if (result=== 1) {
                    //回显图片
                    alert("添加成功!");
                    top.location="${pageContext.request.contextPath}/main/main.jsp";
                    //alert(result.message)
                } else  if (result=== 1000) {
                    alert("请选择要上传的文件后再上传！");
                } else  if (result=== 9999) {
                    alert("请选择正确的excel文件（以.xlsx结尾）！");
                }else {
                    alert("上传失败，请联系管理员fy")
                }
            }
        });
    }
</script>
</html>
