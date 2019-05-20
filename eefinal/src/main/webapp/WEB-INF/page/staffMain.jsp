<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
                    $("#staff option").remove();
                    $("#info").empty();
                    for(var i in obj){
                        $("#post").append("<option value='"+obj[i]['id']+"'>"+obj[i]['name']+"</option>")
                    }
                    $.get("queryStaffsByPost",{"pid":obj[0]['id']},function (o) {
                        $("#staff option").remove();
                        for(var i in o){
                            $("#staff").append("<option value='"+o[i]['id']+"'>"+o[i]['name']+"</option>")
                        }
                        $("#info").append("<td>"+o[0]['name']+"</td>" +
                            "<td>"+o[0]['gender']+"</td>" +
                            "<td>"+o[0]['birth']+"</td>" +
                            "<td>"+o[0]['address']+"</td>" +
                            "<td>"+o[0]['phone']+"</td>" +
                            "<td>"+o[0]['email']+"</td>");
                    })
                })
            })
            $("#post").change(function () {
                $.get("queryStaffsByPost",{"pid":$(this).val()},function (obj) {
                    $("#staff option").remove();
                    $("#info").empty();
                    for(var i in obj){
                        $("#staff").append("<option value='"+obj[i]['id']+"'>"+obj[i]['name']+"</option>")
                    }
                    $("#info").append("<td>"+obj[0]['name']+"</td>" +
                        "<td>"+obj[0]['gender']+"</td>" +
                        "<td>"+obj[0]['birth']+"</td>" +
                        "<td>"+obj[0]['address']+"</td>" +
                        "<td>"+obj[0]['phone']+"</td>" +
                        "<td>"+obj[0]['email']+"</td>");
                })
            })
            $("#staff").change(function () {
                $.get("queryStaffById",{"id":$(this).val()},function (obj) {
                    $("#info").empty();
                    $("#info").append("<td>"+obj['name']+"</td>" +
                        "<td>"+obj['gender']+"</td>" +
                        "<td>"+obj['birth']+"</td>" +
                        "<td>"+obj['address']+"</td>" +
                        "<td>"+obj['phone']+"</td>" +
                        "<td>"+obj['email']+"</td>");
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
    <fieldset>
        <legend>员工信息</legend>
        <table>
            <tr>
                <th>姓名</th>
                <th>性别</th>
                <th>生日</th>
                <th>地址</th>
                <th>手机</th>
                <th>邮箱</th>
            </tr>
            <tr id="info">
                <c:if test="${fn:length(requestScope.staffs)!=0}">
                    <td>${requestScope.staffs[0]['name']}</td>
                    <td>${requestScope.staffs[0]['gender']}</td>
                    <td>${requestScope.staffs[0]['birth']}</td>
                    <td>${requestScope.staffs[0]['address']}</td>
                    <td>${requestScope.staffs[0]['phone']}</td>
                    <td>${requestScope.staffs[0]['email']}</td>
                </c:if>
            </tr>
        </table>
    </fieldset>
</body>
</html>