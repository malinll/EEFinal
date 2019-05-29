<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: Matt
  Date: 2019/5/20
  Time: 20:03
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
    <title>考勤打卡</title>
    <link rel="stylesheet" href="https://cdn.bootcss.com/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="js/jquery-3.1.0.js"></script>
    <script src="https://cdn.bootcss.com/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body style="background: #F8F8F8">
<nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="/">员工界面</a>
        </div>
        <div>
            <ul class="nav navbar-nav">
                <li><a href="toStaffMain">通讯录</a></li>
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
                <li class="active"><a href="toClock?sid=${sessionScope.staff.id}">考勤打卡</a></li>
            </ul>
        </div>
    </div>
</nav>
<div class="container" style="max-width: 1100px;">
    <div class="col-sm-2"></div>
    <div class="col-sm-8" style="margin-top: 20px">
        <fieldset>
            <legend>
                考勤打卡
                <div id="date" style="float: right;font-size: 16px">
                    <script>
                        document.getElementById('date').innerHTML=new Date().toLocaleString()+' 星期'+'日一二三四五六'.charAt(new Date().getDay());
                        setInterval("document.getElementById('date').innerHTML=new Date().toLocaleString()+' 星期'+'日一二三四五六'.charAt(new Date().getDay());",1000);
                    </script>
                </div>
            </legend>
            <c:choose>
                <c:when test="${requestScope.to==null}">
                    <a href="goToWork?sid=${sessionScope.staff.id}" class="btn btn-primary" style="margin-left: 260px; width: 150px;height: 150px;border-radius:75px;padding-top: 55px;">
                        上班打卡
                        <div id="timen">
                            <script>
                                document.getElementById('timen').innerHTML='当前时间：'+new Date().getHours()+":"+new Date().getMinutes()+":"+new Date().getSeconds();
                                setInterval('document.getElementById("timen").innerHTML="当前时间："+new Date().getHours()+":"+new Date().getMinutes()+":"+new Date().getSeconds()',1000);
                            </script>
                        </div>
                    </a>
                </c:when>
                <c:otherwise>
                    <p style="text-align: center">
                        上班打卡时间：<fmt:formatDate value="${requestScope.to.time}" pattern="HH:mm:ss"/> &emsp;
                        <c:choose>
                            <c:when test="${requestScope.to.loe==0}">
                                正常
                            </c:when>
                            <c:when test="${requestScope.to.loe==1}">
                                迟到
                            </c:when>
                            <c:when test="${requestScope.to.loe==2}">
                                旷工
                            </c:when>
                        </c:choose>
                    </p>

                    <c:choose>
                        <c:when test="${requestScope.off==null}">
                            <a href="offWork?sid=${sessionScope.staff.id}" class="btn btn-primary" style="margin-left: 260px; width: 150px;height: 150px;border-radius:75px;padding-top: 55px;">
                                <div id="time">
                                    <script>
                                        document.getElementById('time').innerHTML='当前时间：'+new Date().getHours()+":"+new Date().getMinutes()+":"+new Date().getSeconds();
                                        setInterval('document.getElementById("time").innerHTML="当前时间："+new Date().getHours()+":"+new Date().getMinutes()+":"+new Date().getSeconds()',1000);
                                    </script>
                                </div>
                                下班打卡
                            </a>
                        </c:when>
                        <c:otherwise>
                            <p style="text-align: center">
                                下班打卡时间：<fmt:formatDate value="${requestScope.off.time}" pattern="HH:mm:ss"/> &emsp;
                                <c:choose>
                                    <c:when test="${requestScope.off.loe==0}">
                                        正常
                                    </c:when>
                                    <c:when test="${requestScope.off.loe==1}">
                                        早退
                                    </c:when>
                                    <c:when test="${requestScope.off.loe==2}">
                                        旷工
                                    </c:when>
                                </c:choose>
                            </p>
                        </c:otherwise>
                    </c:choose>
                </c:otherwise>
            </c:choose>
        </fieldset>
    </div>
    <div class="col-sm-2"></div>
</div>

</body>
</html>