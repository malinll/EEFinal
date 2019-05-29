<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--
  Created by IntelliJ IDEA.
  User: Matt
  Date: 2019/5/20
  Time: 11:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <base href="<%=basePath%>"/>
    <title>培训事宜</title>
    <link rel="stylesheet" href="https://cdn.bootcss.com/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="js/jquery-3.1.0.js"></script>
    <script src="https://cdn.bootcss.com/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="/">管理员界面</a>
        </div>
        <div>
            <ul class="nav navbar-nav">
                <li><a href="toAdminMain">招聘相关</a></li>
                <li><a href="toAdminDep">部门管理</a> </li>
                <li><a href="toAdminSM">员工管理</a></li>
                <li><a href="toAdminPay">薪资结算</a></li>
                <li class="active"><a href="toTrain">培训事宜</a></li>
            </ul>
        </div>
    </div>
</nav>
<div class="container" style="max-width: 1100px;">
    <div class="col-sm-2"></div>
    <div class="col-sm-8" style="margin-top: 20px">
        <fieldset>
            <legend>发起培训</legend>
            <form action="addTrain" method="post">
                <div class="col-sm-6">
                    培训主题：<input name="title" class="form-control"/>
                </div>
                <div class="col-sm-6">
                    培训内容：<input name="content" class="form-control"/>
                </div>
                <div class="col-sm-6">
                    培训时间：<input type="datetime-local" name="datetime" min="2019-05-28T13:00" class="form-control"/>
                </div>
                <div class="col-sm-6">
                    培训地点：<input name="site" class="form-control"/>
                </div>
                <div class="col-sm-6">
                    选择员工：
                    <div class="form-inline">
                        <c:forEach items="${requestScope.staffs}" var="staff">
                            <input type="checkbox" name="staff" value="${staff.id}">${staff.name}
                        </c:forEach>
                    </div>
                </div>
                <div class="col-sm-3">
                    &emsp;<input type="submit" value="发起培训" class="form-control btn btn-primary">
                </div>
                <div class="col-sm-3">
                    &emsp;<input type="submit" formaction="trainDraft" value="保存草稿" class="form-control btn btn-info">
                </div>


            </form>
        </fieldset>
        <fieldset>
            <legend>查看已发布培训</legend>
            <table class="table table-striped">
                <tr>
                    <th>培训主题</th>
                    <th>培训内容</th>
                    <th>培训时间</th>
                    <th>培训地点</th>
                    <th>培训人员</th>
                </tr>
                <c:forEach items="${requestScope.trains}" var="train" varStatus="i">
                    <c:if test="${train.state==1}">
                        <tr>
                            <td>${train.title}</td>
                            <td>${train.content}</td>
                            <td>${train.time}</td>
                            <td>${train.site}</td>
                            <td>
                                <c:forEach items="${requestScope.tt[i.index]}" var="tt" varStatus="j">
                                    <c:choose>
                                        <c:when test="${j.index==0}">
                                            ${tt.name}
                                        </c:when>
                                        <c:otherwise>
                                            ,${tt.name}
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </td>
                        </tr>
                    </c:if>
                </c:forEach>
                <%--<tr>
                    <td colspan="5" style="text-align: center">
                        <c:forEach var="i" begin="1" end="${fn:length(requestScope.trains)}" step="1">
                            <c:if test="${requestScope.trains[i-1].state==1}">
                                <a href="">${i}</a>
                            </c:if>
                        </c:forEach>
                    </td>
                </tr>--%>
            </table>
        </fieldset>

        <fieldset>
            <legend>查看草稿箱</legend>
            <%--<table>
                <tr>
                    <th>培训主题</th>
                    <th>培训内容</th>
                    <th>培训时间</th>
                    <th>培训地点</th>
                    <th>培训人员</th>
                </tr>--%>
            <c:forEach items="${requestScope.trains}" var="train" varStatus="i">
                <c:if test="${train.state==0}">
                    <form action="updateTrain" method="post">
                        <div class="col-sm-6">
                            培训主题：<input name="title" value="${train.title}" class="form-control">
                        </div>
                        <div class="col-sm-6">
                            培训内容：<input name="content" value="${train.content}" class="form-control">
                        </div>
                        <div class="col-sm-6">
                            培训时间：<input type="datetime-local" name="datetime" value="${train.time.replace(" ","T")}" min="2019-05-28T13:00" class="form-control">
                        </div>
                        <div class="col-sm-6">
                            培训地点：<input name="site" value="${train.site}" class="form-control">
                        </div>
                        <div class="col-sm-6">
                            培训人员：
                            <div class="form-inline">
                                <c:forEach items="${requestScope.staffs}" var="staff" varStatus="j">
                                    <%--<c:if test="${requestScope.tt[i.index][j.index].id==staff.id}">
                                        <input type="checkbox" name="staff" value="${staff.id}" checked>${staff.name}
                                    </c:if>--%>
                                    <%--<c:if test="${requestScope.tt[i.index][j.index].id!=staff.id}">
                                        <input type="checkbox" name="staff" value="${staff.id}">${staff.name}
                                    </c:if>--%>
                                    <input type="checkbox" name="staff" value="${staff.id}"
                                    <c:forEach items="${requestScope.tt[i.index]}" var="s">
                                    <c:if test="${s.id==staff.id}">
                                           checked
                                    </c:if>
                                    </c:forEach>
                                    >${staff.name}
                                </c:forEach>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <input type="hidden" name="id" value="${train.id}" >
                            &emsp;<input type="submit" value="正式发布" class="form-control btn btn-primary">
                        </div>
                        <div class="col-sm-3">
                            &emsp;<input type="submit" formaction="delTrain" value="删除草稿" class="form-control btn btn-danger">
                        </div>
                    </form>
                </c:if>
            </c:forEach>
            <%--</table>--%>
        </fieldset>
    </div>
    <div class="col-sm-2"></div>
</div>
</body>
</html>