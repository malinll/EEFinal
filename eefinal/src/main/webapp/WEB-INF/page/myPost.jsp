<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Matt
  Date: 2019/5/16
  Time: 20:40
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
    <title>我的投递</title>
    <link rel="stylesheet" href="https://cdn.bootcss.com/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <style>
        th,td{
            text-align: left;
        }
        body{
            margin: 0;
            font: 12px/1.5 '\5FAE\8F6F\96C5\9ED1','\5b8b\4f53',tahoma,arial;
            overflow:auto;
        }
        a{
            text-decoration: none;
        }
        ul,ol{
            list-style: none;
        }
        .head{
            background-color: #2C2F33;
            height: 52px;
            overflow: hidden;
        }
        .head-main{
            width: 1000px;
            height: 52px;
            margin: 0 auto;
            overflow: hidden;
        }
        .head-menu{
            width: 703px;
            height: 52px;
            float: right;
        }
        .login{
            width: 250px;
            float: right;
            line-height: 52px;
            color: #fff;
            text-align: right;
            font-family: PingFangSC-Regular;
        }
        .login a{
            color: #fff;
            font-family: PingFangSC-Regular;
        }
        #menu{
            height: 52px;
            margin: 0;
            padding: 0;
            display: block;
        }
        #menu a{
            text-decoration: none;
        }
        .head-menu li {
            list-style: none;
            display: inline;
            position: relative;
            z-index: 2;
            margin: 0;
            padding: 0;
            text-align: -webkit-match-parent;
        }
        .head .head-menu li a {
            font-size: 14px;
            color: #fff;
            opacity: 0.8;
            line-height: 52px;
            padding: 10px 15px;
            margin-left: 4px;
            font-family: PingFangSC-Regular;
        }
        .head .head-menu li a:hover{
            color: #F37327;
            opacity: 1;
        }
        .head .head-menu .current-cat a {
            color: #F37327;
            opacity: 1;
            font-family: PingFangSC-Regular;
        }
        .logo {
            text-indent: -9999em;
            display: block;
            width: 165px;
            height: 20px;
            margin-top: 16px;
            float: left;
        }
        .side-bar .list-group-item{
            border: 0;
            border-radius: 3px;
            margin-bottom: 5px;
            font-family: PingFangSC-Regular;
            font-size: 16px;
            text-align: center;
        }
    </style>
</head>
<body>
<div class="head">
    <div class="head-main">
        <div class="head-menu">
            <div class="login" style="opacity: 0.8;">
                欢迎 ${sessionScope.visitor.name} 来到阿里巴巴集团招聘！|
                <a href="logout">退出</a>
            </div>
            <ul id="menu">
                <li >
                    <a href="/">首&nbsp;&nbsp;页</a>
                </li>
                <li ><a href="toRecruit" class="current-cat">社会招聘</a></li>
                <li><a href="https://job.alibaba.com/zhaopin/about.htm?spm=a2obv.11410903.0.0.5af844f6A10LlV">了解公司</a></li>
                <li><a href="/">联系我们</a></li>
                <li class="current-cat"><a href="toMain">个人中心</a></li>
            </ul>
        </div>
        <a href="/" class="logo" style="text-align:right;width: 125px;">
            <img src="https://img.alicdn.com/tfs/TB1Zv8_lxSYBuNjSspjXXX73VXa-390-63.png" height="20"/>
        </a>
        <i style="float:left;color:white;font-style:normal;font-size:20px;line-height:52px;margin: 0 10px;opacity: 0.8;">|</i>
        <i style="float:left;color:white;font-style:normal;font-size:14px;line-height:54px;opacity: 0.8;">招聘官网</i>
    </div>
</div>
<div class="container" style="max-width: 1100px;margin-top: 5px;">
    <%--<div class="row">--%>
    <div class="col-sm-2">
        <div class="list-group side-bar">
            <a href="toMain" class="list-group-item" id="addr">新增简历</a>
            <a href="toCheckResume?vid=${sessionScope.visitor.id}" class="list-group-item">查看简历</a>
            <a href="toMyPost?vid=${sessionScope.visitor.id}" class="list-group-item" style="background-color:#2C2F33;color: #F3732A">我的投递</a>
        </div>
    </div>
    <div class="col-sm-10">
    <%--<fieldset>
        <legend>我的投递</legend>--%>
        <table class="table table-striped">
            <tr>
                <th>投递公司</th>
                <th>投递职位</th>
                <th>投递状态</th>
                <th>操作</th>
                <th>备注</th>
            </tr>
            <c:forEach items="${requestScope.interviews}" var="interview" varStatus="s">
                <tr>
                    <td>${requestScope.recruitments[s.index].getCompany()}</td>
                    <td>${requestScope.recruitments[s.index].getJob()}</td>

                    <c:choose>
                        <c:when test="${interview.getState()==0}">
                            <td><c:out value="已投递"/></td>
                            <td></td>
                        </c:when>
                        <c:when test="${interview.getState()==1}">
                            <td><c:out value="被查看"/></td>
                            <td></td>
                        </c:when>
                        <c:when test="${interview.getState()==11}">
                            <td><c:out value="邀面试"/></td>
                            <td>
                                <a class="btn btn-success" href="confirmInterview?iid=${interview.id}">确认</a>
                                <a class="btn btn-danger" href="cancelInterview?iid=${interview.id}">取消</a>
                            </td>
                        </c:when>
                        <c:when test="${interview.getState()==13}">
                            <td><c:out value="已确认"/></td>
                            <td></td>
                        </c:when>
                        <c:when test="${interview.getState()==14}">
                            <td><c:out value="已取消"/></td>
                            <td></td>
                        </c:when>
                        <c:when test="${interview.getState()==15}">
                            <td><c:out value="已录用"/></td>
                            <td></td>
                        </c:when>
                        <c:when test="${interview.getState()==2||interview.getState()==12}">
                            <td><c:out value="不合适"/></td>
                            <td></td>
                        </c:when>
                    </c:choose>
                    <td>
                        <c:choose>
                            <c:when test="${interview.getState()==11}">
                                面试时间：${interview.time}<br/>
                                面试地点：${interview.site}<br/>
                            </c:when>
                            <c:when test="${interview.getState()==13}">
                                面试时间：${interview.time}<br/>
                                面试地点：${interview.site}<br/>
                                请携带身份证原件及复印件、简历等相关文件
                            </c:when>
                            <c:when test="${interview.getState()==15}">
                                员工账号/密码为您的手机号
                            </c:when>
                        </c:choose>
                    </td>
                </tr>
            </c:forEach>
        </table>
    <%--</fieldset>--%>
    </div>
</div>
</body>
</html>