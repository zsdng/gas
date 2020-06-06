<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html lang="zh-CN" class="no-js">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>login</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/normalize.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/demo.css" />
    <!--<link rel="stylesheet" href="../css/bootstrap.min.css" />-->

    <!--必要样式-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/component.css" />
    <script src="${pageContext.request.contextPath}/static/js/jquery-2.1.0.min.js"></script>
    <!--<script src="../js/bootstrap.min.js"></script>-->
    <style>
        #verifycodediv{
        height: 56px;
        padding: 0 5px;
        margin-bottom: 30px;
        border-radius: 50px;
        position: relative;
        border: rgba(255,255,255,0.2) 2px solid !important;

        }
         /*验证码输入框的样式 */
        #verifycode{
            width: 90px;
            margin-left: 1px;
            margin-right: 20px;
            color:#ffffff;
        }
       #login_msg{
           text-align: center;
       }
    </style>

</head>
<body>
<span hidden>${pageContext.session.removeAttribute("username")}</span>
<span hidden>${pageContext.session.removeAttribute("position")}</span>
<span hidden>${pageContext.session.removeAttribute("userId")}</span>
<div class="container demo-1">
    <div class="content">
        <div id="large-header" class="large-header">
            <canvas id="demo-canvas"></canvas>
            <div class="logo_box">
                <h3>欢迎你</h3>
                <form action="${pageContext.request.contextPath}/loginControl" name="f" id="loginForm" method="post">
                    <div class="input_outer">
                        <span class="u_user"></span>
                        <input name="username" id="name" class="text" style="color: #FFFFFF !important" type="text" placeholder="请输入用户名" required> <span id="namespan" style="color: white"></span>
                    </div>

<%--                    <span id="namespan" style="color: white"></span>--%>

                    <div class="input_outer">
                        <span class="us_uer"></span>
                        <input name="password" id="password" class="text" style="color: #FFFFFF !important; position:absolute; z-index:100;" value="" type="password" placeholder="请输入密码" required>
                    </div>
                    <%--验证码--%>
                    <div id="verifycodediv" >
                        <label for="verifycode">验证码:</label>
                        <input type="text" name="verifycode"  class="text" id="verifycode" placeholder="请输入验证码"
                               required     />
                       <a href="javascript:refreshCode()"><img style="margin-left: 40px;  " src="${pageContext.request.contextPath}/checkCodeController"
                                                                title="看不清点击刷新" id="vcode"/></a>
                    </div>
                    <!--							<div>    <input type="submit" id="submit" class="btn btn-primary" value="登录">       </div>-->
                    <div class="mb2"><a id="submit" class="act-but submit" href="javascript:submit();" style="color: #FFFFFF">登录</a></div>
                </form>
                <div id="login_msg">
<%--                    <button type="button" class="close" data-dismiss="alert">--%>
<%--                        <span>&times;</span></button>--%>
                    <strong > ${login_msg} </strong>
                </div>
            </div>
        </div>
    </div>
</div><!-- /container -->
<script src="${pageContext.request.contextPath}/static/js/TweenLite.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/EasePack.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/rAF.js"></script>
<script src="${pageContext.request.contextPath}/static/js/demo-1.js"></script>

<script >
    $(function () {
        $("#name").blur(function () {
            var val =$(this).val();
            $.get(
                "${pageContext.request.contextPath}/findUserName",
                {username:val},
                function (data) {
                    if (data){
                        $("#login_msg").html("存在该用户！");
                    }else {
                        $("#login_msg").html("用户不存在！");
                    }
                }
            )
        });
});






/*验证码刷新*/
    function refreshCode() {
        var vcode = document.getElementById("vcode");
        vcode.src = "${pageContext.request.contextPath}/checkCodeController?time=" + new Date().getTime();
    }


/*登录判空校验*/
    function submit() {
        if ($("#name").val()==null ||$("#name").val()===""){
            $("#login_msg").html("请输入用户名！");
        }else {
            if ($("#password").val()==null ||$("#password").val()===""){
                $("#login_msg").html("请输入密码！");
            }else {
                if ($("#verifycode")==null ||$("#verifycode").val()===""){
                    $("#login_msg").html("请输入验证码！");
                }else {
                    $("#loginForm").submit();
                }
            }
        }
    }
</script>
</body>
</html>
