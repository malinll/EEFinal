<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: Matt
  Date: 2019/5/17
  Time: 13:28
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
    <title>部门管理</title>
    <link rel="stylesheet" href="https://cdn.bootcss.com/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="js/jquery-3.1.0.js"></script>
    <script src="https://cdn.bootcss.com/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script>
        $(function () {
            $("#updateDep").change(function () {
                $.get("queryPostsByDep",{"did":$(this).val()},function (obj) {
                    $("#updatePost option").remove();
                    for(var i in obj){
                        $("#updatePost").append("<option value='"+obj[i]['id']+"'>"+obj[i]['name']+"</option>")
                    }
                })
            })
        })
    </script>
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
                <li class="active"><a href="toAdminDep">部门管理</a> </li>
                <li><a href="toAdminSM">员工管理</a></li>
                <li><a href="toAdminPay">薪资结算</a></li>
                <li><a href="toTrain">培训事宜</a></li>
            </ul>
        </div>
    </div>
</nav>
<%--    <a href="javascript:void(0)">新增部门</a> |
    <a href="javascript:void(0)">查看部门</a> |
    <a href="javascript:void(0)">新增职位</a> |
    <a href="javascript:void(0)">查看职位</a>--%>
<div class="container" style="max-width: 1100px;">
    <div class="col-sm-2"></div>
    <div class="col-sm-8" style="margin-top: 20px">
        <fieldset>
            <legend>新增部门</legend>
            <form action="addDep" method="post">
                <div class="col-sm-6">
                    部门名称：<input name="name" required class="form-control"  maxlength="5">
                </div>
                <div class="col-sm-6">
                    &emsp;<input type="submit" value="新增部门" class="form-control btn btn-primary">
                </div>
            </form>
        </fieldset>
        <br/><br/>
        <fieldset>
            <legend>查看部门</legend>
            <%--<table>
                <tr>
                    <th>部门编号</th>
                    <th>部门名称</th>
                    <th>创建时间</th>
                </tr>--%>
                <c:forEach items="${requestScope.departments}" var="department">
                    <form action="updateDep" method="post">
                            <%--<div class="col-sm-6">
                                部门编号：
                                <input value="${department.id}" class="form-control" readonly>
                            </div>--%>
                        <div class="col-sm-3">
                            部门名称：
                            <input name="name" value=${department.name} class="form-control" required maxlength="5">
                        </div>
                        <div class="col-sm-5">
                            创建时间：
                            <input value="<fmt:formatDate value="${department.date}" pattern="yyyy年MM月dd日 HH:mm:ss"/>" class="form-control" readonly>
                        </div>
                        <div class="col-sm-2">
                            &emsp;<a href="delDep?id=${department.id}" class="btn btn-danger btn-block">删除部门</a>
                        </div>
                        <div class="col-sm-2">
                            <input type="hidden" name="id" value=${department.id}>
                            &emsp;<input type="submit" value="修改部门" class="form-control btn btn-warning"></div>
                    </form>
                </c:forEach>
            <%--</table>--%>
        </fieldset>
        <br/><br/>
        <fieldset>
            <legend>新增职位</legend>
            <form action="addPost" method="post">
                <div class="col-sm-4">
                    选择部门：
                    <select name="did" class="form-control">
                        <c:forEach items="${requestScope.departments}" var="department">
                            <option value=${department.id}>${department.name}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="col-sm-4">
                    请输入职位名：<input name="name" class="form-control" required maxlength="5">
                </div>
                <div class="col-sm-4">
                    &emsp;<input type="submit" value="新增职务" class="form-control btn btn-primary">
                </div>
            </form>
        </fieldset>
        <br/><br/>
        <fieldset>
            <legend>查看职位</legend>
            <form action="updatePost" method="post" id="checkPost">
                <div class="col-sm-4">
                    选择部门：
                    <select name="did" id="updateDep" class="form-control">
                        <c:forEach items="${requestScope.departments}" var="department">
                            <option value=${department.id}>${department.name}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="col-sm-4">
                    选择职位：
                    <select name="id" id="updatePost" class="form-control">
                        <c:forEach items="${requestScope.posts}" var="post">
                            <option value=${post.id}>${post.name}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="col-sm-4">
                    修改后职位名：<input name="name" class="form-control" maxlength="5">
                </div>
                <div class="col-sm-6">
                    &emsp;<input type="submit" formaction="delPost" value="删除职位" class="form-control btn btn-danger">
                </div>
                <div class="col-sm-6">
                    &emsp;<input type="submit" value="修改职位" class="form-control btn btn-warning">
                </div>
            </form>
        </fieldset>
    </div>
    <div class="col-sm-2"></div>
</div>
</body>
</html>