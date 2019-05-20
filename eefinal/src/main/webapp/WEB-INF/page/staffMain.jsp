<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Matt
  Date: 2019/5/19
  Time: 21:29
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
    <title>员工主页</title>
    <script src="js/jquery-3.1.0.js"></script>
    <script>
        $(function () {
            $("#dep").change(function () {
                $.get("queryPostsByDep",{"did":$(this).val()},function (obj) {
                    $("#post option").remove();
                    for(var i in obj){
                        $("#post").append("<option value='"+obj[i]['id']+"'>"+obj[i]['name']+"</option>")
                    }
                })
            })
        })
    </script>
</head>
<body>
    <a href="javascript:void(0)">个人信息</a> |
    <a href="#">通讯录</a> |
    <a href="#">查看消息</a> |
    <a href="#">考勤打卡</a>

    <fieldset>
        <legend>通讯录</legend>
        选择部门：
        <select id="dep">
            <c:forEach items="${requestScope.departments}" var="department">
                <option value=${department.id}>${department.name}</option>
            </c:forEach>
        </select>
        选择职位：
        <select id="post">
            <c:forEach items="${requestScope.posts}" var="post">
                <option value=${post.id}>${post.name}</option>
            </c:forEach>
        </select>
        查看员工：
        <select id="staff">
            <c:forEach items="${requestScope.staffs}" var="staff">
                <option value=${staff.id}>${staff.name}</option>
            </c:forEach>
        </select>
    </fieldset>
</body>
</html>