<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
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
    <title>待送气列表</title>

    <!-- 1. 导入CSS的全局样式 -->
    <link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet">
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script src="${pageContext.request.contextPath}/static/js/jquery-2.1.0.min.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>
    <style type="text/css">

        td, th {
            text-align: center;
        }

        html, body {
            width: 100%;
            height: 100%;
        }

        body {
            background-size: 100%;
            background: url("${pageContext.request.contextPath}/static/img/325702_meitu_4_meitu_6.jpg") no-repeat;
        }
        td {
            font-weight: 550;
            font-size: 20px;
        }

    </style>
</head>
<body>
<div class="container table-responsive" >
    <h3 style="text-align: center">待送气列表</h3>



    <div style="float: left;">

        <form class="form-inline" action="${pageContext.request.contextPath}/cylinder/findByKindAndStateTrue" method="post">
            <div class="form-group">
                <label for="kind">请选择想要查询的气体种类</label>
                <select name="kind" class="form-control" id="kind">
                    <option value="">全部</option>
                    <option value="液氨" >液氨</option>
                    <option value="液化天然气">液化天然气</option>
                    <option value="压缩天然气">压缩天然气</option>
                    <option value="液氯">液氯</option>
                    <option value="甲烷">甲烷</option>
                    <option value="氢气">氢气</option>
                    <option value="氧气">氧气</option>
                    <option value="液化石油气">液化石油气</option>
                    <option value="氯乙烯">氯乙烯</option>
                    <option value="液氦">液氦</option>
                </select>
            </div>
            <%--一点击查询按钮就把session删了de想法行不通嗷同名的session应该会覆盖所以也不用担心了 --%>

            <button type="submit"  class="btn btn-default">查询</button>
        </form>

    </div>
    <div style="float: right;margin: 5px;">
        <a class="btn btn-primary" href="javascript:deleteSelectedUser();" id="delSelected">批量送气</a>

    </div>
    <form id="form123" action="${pageContext.request.contextPath}/cylinder/sendSelectedCylinder" method="post">
        <input type="text" name="kind" value="${pageContext.session.getAttribute("kind")}" hidden>
        <table border="1" class="table table-bordered table-hover">
            <tr class="success">
                <th><input type="checkbox" id="firstcb"></th>
                <th>编号</th>
                <th>气体种类</th>
<%--                <th>状态</th>--%>
                <th>气瓶制造商</th>
                <th>气瓶产地</th>
                <th>制造时间</th>
                <th>入库时间</th>
                <th>操作人员</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${pageCy.list}" var="c" varStatus="s">
                <tr>
                    <td><input type="checkbox" name="checkid" value="${c.id}"></td>
                    <td>${s.count}</td>
                    <td>${c.kind}</td>
<%--                    <td>${c.state}</td>--%>
                    <td>${c.manufacturer}</td>
                    <td>${c.area}</td>
                    <fmt:formatDate value="${c.createtime}" type="date" pattern="yyyy-MM-dd HH:mm" var="createtime"/>
                    <td>${createtime}</td>
                    <fmt:formatDate value="${c.jointime}" type="date" pattern="yyyy-MM-dd HH:mm" var="jointime"/>
                    <td>${jointime}</td>
                    <td>${c.operator}</td>
                    <td><a class="btn btn-default btn-sm" href="javascript:deleteUser(${c.id});">送气</a></td>
                </tr>
            </c:forEach>

        </table>
    </form>
<%--这个是查询所有的时候使用的分页--%>
<c:if test="${pageContext.session.getAttribute('kind')==null}">

    <div>
        <nav aria-label="Page navigation">
            <ul class="pagination">
                <c:if test="${pageCy.isFirstPage}">
                <li style="pointer-events: none" class="disabled">
                    <a href="${pageContext.request.contextPath}/cylinder/findByStateLtrue?pageIndex=${pageCy.pageNum}&pageSize=6"
                       aria-label="Previous">
                        <span aria-hidden="true">上一页</span>
                        </c:if>
                        <c:if test="${!(pageCy.isFirstPage)}">
                <li>
                    <a href="${pageContext.request.contextPath}/cylinder/findByStateLtrue?pageIndex=${pageCy.prePage}&pageSize=6"
                       aria-label="Previous">
                        <span aria-hidden="true">上一页</span>
                    </a>
                </li>
                </c:if>
                <c:forEach begin="1" end="${pageCy.pages}" var="i">
                    <c:if test="${pageCy.pageNum == i}">
                        <li class="active"><a href="${pageContext.request.contextPath}/cylinder/findByStateLtrue?pageIndex=${i}&pageSize=6">${i}</a>
                        </li>
                    </c:if>
                    <c:if test="${pageCy.pageNum!=i}">
                        <li>
                            <a href="${pageContext.request.contextPath}/cylinder/findByStateLtrue?pageIndex=${i}&pageSize=6">${i}</a>
                        </li>
                    </c:if>
                </c:forEach>


                <c:if test="${pageCy.isLastPage}">
                <li class="disabled" style="pointer-events: none">
                    <a href="${pageContext.request.contextPath}/cylinder/findByStateLtrue?pageIndex=${pageCy.pageNum}&pageSize=6" aria-label="Next">
                        <span aria-hidden="true">下一页</span>
                        </c:if>

                        <c:if test="${!(pageCy.isLastPage)}">
                <li>
                    <a href="${pageContext.request.contextPath}/cylinder/findByStateLtrue?pageIndex=${pageCy.nextPage}&pageSize=6" aria-label="Next">
                        <span aria-hidden="true">下一页</span>
                        </c:if>
                    </a>
                </li>
                <span style="font-size: 23px;margin-left: 6px  "> 共${pageCy.total}条记录，共${pageCy.pages}页 </span>
            </ul>
        </nav>
    </div>
</c:if>
<%--这个是按条件查询的时候使用的分页--%>
    <c:if test="${pageContext.session.getAttribute('kind')!=null}">
        <div>
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <c:if test="${pageCy.isFirstPage}">
                    <li style="pointer-events: none" class="disabled">
                        <a href="${pageContext.request.contextPath}/cylinder/findByKindAndStateTrue?pageIndex=${pageCy.pageNum}&pageSize=3&kind=${pageContext.session.getAttribute("kind")}"
                           aria-label="Previous">
                            <span aria-hidden="true">上一页</span>
                            </c:if>
                            <c:if test="${!(pageCy.isFirstPage)}">
                    <li>
                        <a href="${pageContext.request.contextPath}/cylinder/findByKindAndStateTrue?pageIndex=${pageCy.prePage}&pageSize=3&kind=${pageContext.session.getAttribute("kind")}"
                           aria-label="Previous">
                            <span aria-hidden="true">上一页</span>
                        </a>
                    </li>
                    </c:if>
                    <c:forEach begin="1" end="${pageCy.pages}" var="i">
                        <c:if test="${pageCy.pageNum == i}">
                            <li class="active"><a href="${pageContext.request.contextPath}/cylinder/findByKindAndStateTrue?pageIndex=${i}&pageSize=3&kind=${pageContext.session.getAttribute("kind")}">${i}</a>
                            </li>
                        </c:if>
                        <c:if test="${pageCy.pageNum!=i}">
                            <li>
                                <a href="${pageContext.request.contextPath}/cylinder/findByKindAndStateTrue?pageIndex=${i}&pageSize=3&kind=${pageContext.session.getAttribute("kind")}">${i}</a>
                            </li>
                        </c:if>
                    </c:forEach>


                    <c:if test="${pageCy.isLastPage}">
                    <li class="disabled" style="pointer-events: none">
                        <a href="${pageContext.request.contextPath}/cylinder/findByKindAndStateTrue?pageIndex=${pageCy.pageNum}&pageSize=3&kind=${pageContext.session.getAttribute("kind")}" aria-label="Next">
                            <span aria-hidden="true">下一页</span>
                            </c:if>

                            <c:if test="${!(pageCy.isLastPage)}">
                    <li>
                        <a href="${pageContext.request.contextPath}/cylinder/findByKindAndStateTrue?pageIndex=${pageCy.nextPage}&pageSize=3&kind=${pageContext.session.getAttribute("kind")}" aria-label="Next">
                            <span aria-hidden="true">下一页</span>
                            </c:if>
                        </a>
                    </li>
                    <span style="font-size: 23px;margin-left: 6px  "> 共${pageCy.total}条记录，共${pageCy.pages}页 </span>
                </ul>
            </nav>
        </div>
    </c:if>
</div>
<script>
    function deleteUser(id) {
        var flag = confirm("将要将该气瓶送走，是否确认？");
        if (flag) {
            location.href = "${pageContext.request.contextPath}/cylinder/sendCylinderTrue?id=" + id;
        }
    }

    function deleteSelectedUser() {

        var check = false;
        var cbs = document.getElementsByName("checkid");

        for (var i = 0; i < cbs.length; i++) {
            if (cbs[i].checked) {
                check = true;
                break;
            }
        }
        if (check) {
            var flag = confirm("选中的气瓶将被送走，是否确定？");
            if (flag) {
                document.getElementById("form123").submit();
            }
        } else {
            alert("请选择要送走的气瓶！");
        }
    }

    document.getElementById("firstcb").onclick = function () {
        var cbs = document.getElementsByName("checkid");
        for (var i = 0; i < cbs.length; i++) {
            cbs[i].checked = this.checked;
        }

    }
</script>

</body>
</html>
