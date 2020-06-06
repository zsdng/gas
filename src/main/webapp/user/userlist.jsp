<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
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
    <title>员工信息管理</title>

    <!-- 1. 导入CSS的全局样式 -->
    <link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet">
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script src="${pageContext.request.contextPath}/static/js/jquery-2.1.0.min.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>
</head>
<style type="text/css">
    td, th {
        text-align: center;
    }

    html, body {

        width: 100%;
        height: 100%;
    }

    body {
        background: url("${pageContext.request.contextPath}/static/img/dlam2.jpg") no-repeat;
        background-size: 100%;
    }
</style>

<body>
<%--<h1> ${pageContext.session.getAttribute('username')}  ${pageContext.session.getAttribute('username') != 'admin' }</h1>--%>
<div class="container table-responsive">
    <h3 style="text-align: center ">用户信息列表</h3>
    <form id="form" action="${pageContext.request.contextPath}/#" method="post">
        <table border="1" class="table table-bordered table-hover  table-striped">
            <tr class="success">
                <%--                <th><input type="checkbox" id="firstcb"></th>--%>
                <th>编号</th>
                <th>用户名</th>
                <th>密码</th>
                <th>职位</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${pageUser.list}" var="u" varStatus="s">
                <tr>
                        <%--                    <td><input type="checkbox" name="eid" value="${e.eid}"></td>--%>
                    <td>${s.count}</td>
                    <td>${u.username}</td>
                    <td>${u.password}</td>
                    <td>${u.position}</td>

                   <%-- <c:if test=" ${pageContext.session.getAttribute('username') == u.username} ">
                        <td><a class="btn btn-default btn-sm"
                               href="javascript:updateSelf()" disabled>修改</a>&nbsp;
                            <a class="btn btn-default btn-sm" href="javascript:delSelf()" disabled>删除</a></td>
                    </c:if>--%>

<%--                        <td><a class="btn btn-default btn-sm" href="${pageContext.request.contextPath}/user/update.jsp?id=${u.id}">修改</a>--%>
                        <td><a class="btn btn-default btn-sm" href="javascript:updateSelf(${u.id});">修改</a>
                            <a class="btn btn-default btn-sm" href="javascript:deleteUser(${u.id});">删除</a></td>

                </tr>
            </c:forEach>
        </table>
    </form>

    <%--分页--%>
    <div>
        <nav aria-label="Page navigation">
            <ul class="pagination">

                <c:if test="${pageUser.isFirstPage}">
                <li style="pointer-events: none" class="disabled">
                    <a href="${pageContext.request.contextPath}/user/findAll?pageIndex=${pageUser.pageNum}&pageSize=3"
                       aria-label="Previous">
                        <span aria-hidden="true">上一页</span>
                        </c:if>

                        <c:if test="${!(pageUser.isFirstPage)}">
                <li>

                    <a href="${pageContext.request.contextPath}/user/findAll?pageIndex=${pageUser.prePage}&pageSize=3"
                       aria-label="Previous">
                        <span aria-hidden="true">上一页</span>
                    </a>
                </li>
                </c:if>


                <c:forEach begin="1" end="${pageUser.pages}" var="i">

                    <c:if test="${pageUser.pageNum == i}">
                        <li class="active"><a
                                href="${pageContext.request.contextPath}/user/findAll?pageIndex=${i}&pageSize=3">${i}</a>
                        </li>
                    </c:if>

                    <c:if test="${pageUser.pageNum!=i}">
                        <li>
                            <a href="${pageContext.request.contextPath}/user/findAll?pageIndex=${i}&pageSize=3">${i}</a>
                        </li>
                    </c:if>
                </c:forEach>


                <c:if test="${pageUser.isLastPage}">
                <li class="disabled" style="pointer-events: none">
                    <a href="${pageContext.request.contextPath}/user/findAll?pageIndex=${pageUser.pageNum}&pageSize=3"
                       aria-label="Next">
                        <span aria-hidden="true">下一页</span>
                        </c:if>

                        <c:if test="${!(pageUser.isLastPage)}">
                <li>
                    <a href="${pageContext.request.contextPath}/user/findAll?pageIndex=${pageUser.nextPage}&pageSize=3"
                       aria-label="Next">
                        <span aria-hidden="true">下一页</span>
                        </c:if>
                    </a>
                </li>
                <span style="font-size: 23px;margin-left: 6px  "> 共${pageUser.total}条记录，共${pageUser.pages}页 </span>
            </ul>
        </nav>
    </div>

    <script>
        function deleteUser(id) {
            if (id===${pageContext.session.getAttribute("userId")}){
                alert("您不能删除自己！");
            }else {
                var flag = confirm("您确定要删除吗？");
                if (flag) {
                    location.href = "${pageContext.request.contextPath}/user/delUserById?id=" + id;
                }

            }
        }
            function updateSelf(id) {
                if (id===${pageContext.session.getAttribute("userId")}){
                    alert("请您在个人资料页面中修改自己的信息!");
                }else {
                    location.href ="${pageContext.request.contextPath}/user/update.jsp?id="+id;
                }
            }

    </script>
</body>
</html>
