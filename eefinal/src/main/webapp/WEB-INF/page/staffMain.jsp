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
    <link rel="stylesheet" href="https://cdn.bootcss.com/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="js/jquery-3.1.0.js"></script>
    <script src="https://cdn.bootcss.com/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
<body style="background: #F8F8F8">
<nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="/">员工界面</a>
        </div>
        <div>
            <ul class="nav navbar-nav">
                <li class="active"><a href="toStaffMain">通讯录</a></li>
                <li class="dropdown">
                    <a href="toStaffInfo" class="dropdown-toggle" data-toggle="dropdown">
                        个人信息
                        <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="toStaffInfo">基本信息</a></li>
                        <li><a href="toStaffInfo">培训信息</a></li>
                        <li class="divider"></li>
                        <li><a href="toStaffInfo">历史薪资</a></li>
                        <li><a href="toStaffInfo">历史奖惩</a></li>
                        <li class="divider"></li>
                        <li><a href="toStaffInfo">打卡记录</a></li>
                    </ul>
                </li>
                <li><a href="toClock?sid=${sessionScope.staff.id}">考勤打卡</a></li>
            </ul>
        </div>
    </div>
</nav>
<%--    <a href="toStaffInfo">个人信息</a> |
    <a href="javascript:void(0)">通讯录</a> |
    <a href="#">查看消息</a> |
    <a href="toClock?sid=${sessionScope.staff.id}">考勤打卡</a>--%>
    <div class="container" style="max-width: 1100px;">
        <div class="col-sm-2"></div>
        <div class="col-sm-8" style="margin-top: 20px">
            <fieldset>
                <legend>
                    通讯录
                    <div id="time" style="float: right;font-size: 16px">
                        当前时间：
                        <script>
                            document.getElementById('time').innerHTML=new Date().toLocaleString()+' 星期'+'日一二三四五六'.charAt(new Date().getDay());
                            setInterval("document.getElementById('time').innerHTML=new Date().toLocaleString()+' 星期'+'日一二三四五六'.charAt(new Date().getDay());",1000);
                        </script>
                    </div>
                </legend>
                选择部门：
                <select id="dep" class="form-control">
                    <c:forEach items="${requestScope.departments}" var="department">
                        <option value=${department.id}>${department.name}</option>
                    </c:forEach>
                </select>
                <br/>
                选择职位：
                <select id="post" class="form-control">
                    <c:forEach items="${requestScope.posts}" var="post">
                        <option value=${post.id}>${post.name}</option>
                    </c:forEach>
                </select>
                <br/>
                查看员工：
                <select id="staff" class="form-control">
                    <c:forEach items="${requestScope.staffs}" var="staff">
                        <option value=${staff.id}>${staff.name}</option>
                    </c:forEach>
                </select>
                <br/>
            </fieldset>
            <br/>
            <fieldset>
                <legend>员工信息</legend>
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th>姓名</th>
                        <th>性别</th>
                        <th>生日</th>
                        <th>地址</th>
                        <th>手机</th>
                        <th>邮箱</th>
                    </tr>
                    </thead>
                    <tbody>
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
                    </tbody>
                </table>
            </fieldset>
        </div>
        <div class="col-sm-2"></div>
    </div>
</body>
</html>