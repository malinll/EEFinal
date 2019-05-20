<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <style>
        th,td{
            width: 250px;
            text-align: center;
        }
        input{
            text-align: center;
        }
    </style>
    <script src="js/jquery-3.1.0.js"></script>
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
    <a href="javascript:void(0)">新增部门</a> |
    <a href="javascript:void(0)">查看部门</a> |
    <a href="javascript:void(0)">新增职位</a> |
    <a href="javascript:void(0)">查看职位</a>
    <fieldset>
        <legend>新增部门</legend>
        <form action="addDep" method="post">
            部门名称：<input name="name" required>
            <input type="submit" value="新增部门">
        </form>
    </fieldset>

    <fieldset>
        <legend>查看部门</legend>
        <table>
            <tr>
                <th>部门编号</th>
                <th>部门名称</th>
                <th>创建时间</th>
            </tr>
            <c:forEach items="${requestScope.departments}" var="department">
                <tr>
                    <form action="updateDep" method="post">
                        <td>${department.id}</td>
                        <td><input name="name" value=${department.name}></td>
                        <td>${department.date}</td>
                        <td>
                            <input type="hidden" name="id" value=${department.id}>
                            <input type="submit" value="修改部门名称">
                        </td>
                        <td><a href="delDep?id=${department.id}">删除部门</a></td>
                    </form>
                </tr>
            </c:forEach>
        </table>
    </fieldset>
    <fieldset>
        <legend>新增职位</legend>
        <form action="addPost" method="post">
            选择部门：
            <select name="did">
                <c:forEach items="${requestScope.departments}" var="department">
                    <option value=${department.id}>${department.name}</option>
                </c:forEach>
            </select>
            请输入职位名：<input name="name">
            <input type="submit" value="新增职务">
        </form>
    </fieldset>
    <fieldset>
        <legend>查看职位</legend>
        <form action="updatePost" method="post" id="checkPost">
            选择部门：
            <select name="did" id="updateDep">
                <c:forEach items="${requestScope.departments}" var="department">
                    <option value=${department.id}>${department.name}</option>
                </c:forEach>
            </select>
            选择职位：
            <select name="id" id="updatePost">
                <c:forEach items="${requestScope.posts}" var="post">
                    <option value=${post.id}>${post.name}</option>
                </c:forEach>
            </select>
            修改后职位名：<input name="name">
            <input type="submit" value="修改职位">
            <input type="submit" formaction="delPost" value="删除职位">
        </form>
    </fieldset>
    <fieldset>
        <legend>更改员工状态</legend>

    </fieldset>
</body>
</html>