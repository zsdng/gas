<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
    <title>员工信息管理</title>

    <!-- 1. 导入CSS的全局样式 -->
    <link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet">
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script src="${pageContext.request.contextPath}/static/js/jquery-2.1.0.min.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>
    <style type="text/css">


        html,body{

            width:100%;
            height: 100%;
        }

        body{
            background: url("${pageContext.request.contextPath}/static/img/emp2.jpg")  no-repeat;
            background-size:100%;
        }

        td, th {
            text-align: center;
        }

        #add {
            width: 140px;
            height: 40px;
            background: #65ddff;
        }

        #exampleInputName2, #exampleInputName3 {
            width: 100px;
        }

        #exampleInputEmail2 {
            width: 150px;
        }

    </style>
</head>
<body>
<div class="container table-responsive">
    <h3 style="text-align: center">员工信息列表</h3>


    <div style="float: left; " hidden>

        <form class="form-inline" action="${pageContext.request.contextPath}/#" method="post" hidden>
            <div class="form-group">
                <label for="exampleInputName2">姓名</label>
                <input type="text" name="name" value="${condition.name[0]}" class="form-control" id="exampleInputName2">
            </div>
            <div class="form-group">
                <label for="exampleInputName3">籍贯</label>
                <input type="text" name="address" value="${condition.address[0]}" class="form-control"
                       id="exampleInputName3">
            </div>

            <div class="form-group">
                <label for="exampleInputEmail2">邮箱</label>
                <input type="text" name="email" value="${condition.email[0]}" class="form-control"
                       id="exampleInputEmail2">
            </div>
            <button type="submit" class="btn btn-default">查询</button>
        </form>

    </div>
    <div style="float: right;margin: 5px;">
        <a class="btn btn-primary" href="${pageContext.request.contextPath}/emp/add.jsp">添加联系人</a>
<%--        <a class="btn btn-primary" href="javascript:deleteSelectedUser();" id="delSelected">删除选中</a>--%>

    </div>
    <form id="form" action="${pageContext.request.contextPath}/#" method="post">
        <table border="1" class="table table-bordered table-hover table-responsive ">
            <tr class="success">
<%--                <th><input type="checkbox" id="firstcb"></th>--%>
                <th>编号</th>
                <th>姓名</th>
                <th>年龄</th>
                <th>性别</th>
                <th>电话</th>
                <th>地址</th>
                <th>修改时间</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${PageEmp.list}" var="e" varStatus="s">
                <tr>
<%--                    <td><input type="checkbox" name="eid" value="${e.eid}"></td>--%>
                    <td>${s.count}</td>
                    <td>${e.name}</td>
                    <td>${e.age}</td>
                    <td>${e.sex}</td>
                    <td>${e.phone}</td>
                    <td>${e.address}</td>
                    <fmt:formatDate value="${e.jointime}" type="date" pattern="yyyy-MM-dd HH:mm" var="time"/>
                    <td>${time}</td>
                    <td><a class="btn btn-default btn-sm"
                           href="${pageContext.request.contextPath}/empControl/findEmpByid?eid=${e.eid}">修改</a>&nbsp;
                        <a class="btn btn-default btn-sm" href="javascript:deleteUser(${e.eid});">删除</a></td>
                </tr>
            </c:forEach>
            <%--<h2>${emp}</h2>--%>
        </table>
    </form>
    <div>
        <nav aria-label="Page navigation">
            <ul class="pagination">

                <c:if test="${PageEmp.isFirstPage}">
                <li style="pointer-events: none" class="disabled">
                    <a href="${pageContext.request.contextPath}/empControl/findAllEmp?pageIndex=${PageEmp.pageNum}&pageSize=5"
                       aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                        </c:if>

                        <c:if test="${!(PageEmp.isFirstPage)}">
                <li>

                    <a href="${pageContext.request.contextPath}/empControl/findAllEmp?pageIndex=${PageEmp.prePage}&pageSize=5"
                       aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
                </c:if>


                <c:forEach begin="1" end="${PageEmp.pages}" var="i">

                    <c:if test="${PageEmp.pageNum == i}">
                        <li class="active"><a href="${pageContext.request.contextPath}/empControl/findAllEmp?pageIndex=${i}&pageSize=5">${i}</a>
                        </li>
                    </c:if>

                    <c:if test="${PageEmp.pageNum!=i}">
                        <li>
                            <a href="${pageContext.request.contextPath}/empControl/findAllEmp?pageIndex=${i}&pageSize=5">${i}</a>
                        </li>
                    </c:if>
                </c:forEach>


                <c:if test="${PageEmp.isLastPage}">
                <li class="disabled" style="pointer-events: none">
                    <a href="${pageContext.request.contextPath}/empControl/findAllEmp?pageIndex=${PageEmp.pageNum}&pageSize=5" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                        </c:if>

                        <c:if test="${!(PageEmp.isLastPage)}">
                <li>
                    <a href="${pageContext.request.contextPath}/empControl/findAllEmp?pageIndex=${PageEmp.nextPage}&pageSize=5" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                        </c:if>
                    </a>
                </li>
                <span style="font-size: 23px;margin-left: 6px  "> 共${PageEmp.total}条记录，共${PageEmp.pages}页 </span>
            </ul>
        </nav>
    </div>
</div>
<script>
    function deleteUser(id) {
        var flag = confirm("你确定要删除吗？");
        if (flag) {
            location.href = "${pageContext.request.contextPath}/empControl/delEmpByEid?eid=" + id;
        }
    }

</script>

</body>
</html>
