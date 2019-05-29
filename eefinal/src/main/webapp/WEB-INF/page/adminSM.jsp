<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Matt
  Date: 2019/5/27
  Time: 22:56
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
    <title>员工管理</title>
    <link rel="stylesheet" href="https://cdn.bootcss.com/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="js/jquery-3.1.0.js"></script>
    <script src="https://cdn.bootcss.com/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script>
        $(function () {
            $("#dep").change(function () {
                $.get("queryPostsByDep",{"did":$(this).val()},function (obj) {
                    $("#post option").remove();
                    for(var i in obj){
                        $("#post").append("<option value='"+obj[i]['id']+"'>"+obj[i]['name']+"</option>")
                    }
                    $.get("queryStaffsByPost",{"pid":obj[0]['id']},function (o) {
                        $("#staff option").remove();
                        $("#state").empty();
                        for(var i in o){
                            $("#staff").append("<option value='"+o[i]['id']+"'>"+o[i]['name']+"</option>")
                        }
                        $("#cSid").val(o[0]['id']);
                        $("#addRP").val(o[0]['id']);
                        $("#cInfo").empty();
                        $("#cInfo").append("&emsp;<a href=\"toCheckStaffInfo?id="+o[0]['id']+"\" class=\"btn btn-primary btn-block\">查看员工信息</a>");
                        if(o[0]['state']==0){
                            $("#state").val("试用");
                            $("#cState").empty();
                            $("#cState").append("<a href='changeState?id="+o[0]['id']+"' class='btn btn-block btn-warning'>转正</a>");
                        }else if(o[0]['state']==1){
                            $("#state").val("在职");
                            $("#cState").empty();
                            $("#cState").append("<a href='fire?id="+o[0]['id']+"' class='btn btn-block btn-warning'>辞退</a>");
                        }else {
                            $("#state").val("离职");
                            $("#cState").empty();
                        }
                    })
                })
            })

            $("#post").change(function () {
                $.get("queryStaffsByPost",{"pid":$(this).val()},function (obj) {
                    $("#staff option").remove();
                    $("#state").empty();
                    for(var i in obj){
                        $("#staff").append("<option value='"+obj[i]['id']+"'>"+obj[i]['name']+"</option>")
                    }
                    $("#cSid").val(obj[0]['id']);
                    $("#addRP").val(obj[0]['id']);
                    $("#cInfo").empty();
                    $("#cInfo").append("&emsp;<a href=\"toCheckStaffInfo?id="+obj[0]['id']+"\" class=\"btn btn-primary btn-block\">查看员工信息</a>");
                    if(obj[0]['state']==0){
                        $("#state").val("试用");
                        $("#cState").empty();
                        $("#cState").append("<a href='changeState?id="+obj[0]['id']+"' class='btn btn-block btn-warning'>转正</a>");
                    }else if(obj[0]['state']==1){
                        $("#state").val("在职");
                        $("#cState").empty();
                        $("#cState").append("<a href='fire?id="+obj[0]['id']+"' class='btn btn-block btn-warning'>辞退</a>");
                    }else {
                        $("#state").val("离职");
                        $("#cState").empty();
                    }
                })
            })

            $("#staff").change(function () {
                $.get("queryStaffById",{"id":$(this).val()},function (obj) {
                    $("#cSid").val(obj[0]['id']);
                    $("#addRP").val(obj[0]['id']);
                    $("#cInfo").empty();
                    $("#cInfo").append("&emsp;<a href=\"toCheckStaffInfo?id="+obj[0]['id']+"\" class=\"btn btn-primary btn-block\">查看员工信息</a>");
                    if(obj['state']==0){
                        $("#state").val("试用");
                        $("#cState").empty();
                        $("#cState").append("<a href='changeState?id="+obj[0]['id']+"' class='btn btn-block btn-warning'>转正</a>");
                    }else if(obj['state']==1){
                        $("#state").val("在职");
                        $("#cState").empty();
                        $("#cState").append("<a href='fire?id="+obj[0]['id']+"' class='btn btn-block btn-warning'>辞退</a>");
                    }else {
                        $("#state").val("离职");
                    }
                })
            })

            $("#cDep").change(function () {
                $.get("queryPostsByDep",{"did":$(this).val()},function (obj) {
                    $("#cPost option").remove();
                    for(var i in obj){
                        $("#cPost").append("<option value='"+obj[i]['id']+"'>"+obj[i]['name']+"</option>")
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
                <li><a href="toAdminDep">部门管理</a> </li>
                <li class="active"><a href="toAdminSM">员工管理</a></li>
                <li><a href="toAdminPay">薪资结算</a></li>
                <li><a href="toTrain">培训事宜</a></li>
            </ul>
        </div>
    </div>
</nav>
<div class="container" style="max-width: 1100px;">
    <div class="col-sm-2"></div>
    <div class="col-sm-8" style="margin-top: 20px">
        <fieldset>
            <legend>选择员工</legend>
            <div class="col-sm-4">
                选择部门：
                <select id="dep" class="form-control">
                    <c:forEach items="${requestScope.departments}" var="department">
                        <option value=${department.id}>${department.name}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="col-sm-4">
                选择职位：
                <select id="post" class="form-control">
                    <c:forEach items="${requestScope.posts}" var="post">
                        <option value=${post.id}>${post.name}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="col-sm-4">
                查看员工：
                <select id="staff" name="id" class="form-control">
                    <c:forEach items="${requestScope.staffs}" var="staff">
                        <option value=${staff.id}>${staff.name}</option>
                    </c:forEach>
                </select>
            </div>
        </fieldset>
        <br/>
        <fieldset>
            <legend>员工换岗</legend>
            <form action="changePost" method="post">
                <div class="col-sm-4">
                    换岗部门：
                    <select id="cDep" class="form-control">
                        <c:forEach items="${requestScope.departments}" var="department">
                            <option value=${department.id}>${department.name}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="col-sm-4">
                    换岗职位：
                    <select id="cPost" name="pid" class="form-control">
                        <c:forEach items="${requestScope.posts}" var="post">
                            <option value=${post.id}>${post.name}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="col-sm-4">
                    <input type="hidden" name="id" id="cSid" value="${requestScope.staffs[0].id}">
                    &emsp;<input type="submit" value="换岗" class="form-control btn btn-warning">
                </div>
            </form>
        </fieldset>
        <br/>
        <fieldset>
            <legend>员工转正离职</legend>
            <div class="col-sm-4">
                <input value="员工状态：" class="form-control" readonly>
            </div>
            <c:choose>
                <c:when test="${requestScope.staffs[0].state==0}">
                    <div class="col-sm-4">
                        <input value="试用" class="form-control" id="state" readonly>
                    </div>
                    <div class="col-sm-4" id="cState">
                        <a href="changeState?id=${requestScope.staffs[0].id}" class="btn btn-block btn-warning">转正</a>
                    </div>
                </c:when>
                <c:when test="${requestScope.staffs[0].state==1}">
                    <div class="col-sm-4">
                        <input value="在职" class="form-control" id="state" readonly>
                    </div>
                    <div class="col-sm-4" id="cState">
                        <a href="fire?id=${requestScope.staffs[0].id}" class="btn btn-block btn-warning">辞退</a>
                    </div>
                </c:when>
                <c:when test="${requestScope.staffs[0].state==2}">
                    <div class="col-sm-4">
                        <input value="离职" class="form-control" id="state" readonly>
                    </div>
                    <div class="col-sm-4" id="cState"></div>
                </c:when>
            </c:choose>
            <div class="col-sm-12" id="cInfo">
                &emsp;<a href="toCheckStaffInfo?id=${requestScope.staffs[0].id}" class="btn btn-primary btn-block">查看员工信息</a>
            </div>
        </fieldset>
        <br/>
        <fieldset>
            <legend>新增奖惩</legend>
            <form action="addRP" method="post">
                <div class="col-sm-6">
                    原因：
                    <input name="reason" class="form-control" required maxlength="10">
                </div>
                <div class="col-sm-6">
                    金额：
                    <input type="number" name="money" class="form-control" required min="1" max="999">
                </div>
                <div class="col-sm-6">
                    状态：
                    <select name="state" class="form-control">
                        <option value="1">奖励</option>
                        <option value="2">惩罚</option>
                    </select>
                </div>
                <div class="col-sm-6">
                    <input type="hidden" id="addRP" name="sid" value="${requestScope.staffs[0].id}">
                    &emsp;<input type="submit" value="新增奖惩" class="form-control btn btn-primary">
                </div>
            </form>
        </fieldset>
    </div>
    <div class="col-sm-2"></div>
</div>
</body>
</html>