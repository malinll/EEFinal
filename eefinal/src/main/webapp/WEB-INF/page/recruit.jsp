<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="com.project.eefinal.model.Recruitment" %><%--
  Created by IntelliJ IDEA.
  User: Matt
  Date: 2019/5/16
  Time: 8:31
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
    <title>招聘信息</title>
    <style>
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
        tr {
            display: table-row;
            vertical-align: inherit;
            border-color: inherit;
        }
        th{
            height: 30px;
            border-bottom: 1px solid #C9C9C9;
            border-top: 1px solid #F2F2F2;
            text-align: left;
            background: url(https://job.alibaba.com/assets/zhaopin/images/table-head-bg.png) repeat-x left bottom;
        }
        td{
            border-bottom: 1px solid #F2F2F2;
            padding: 8px 0;
            word-break: break-all;
            word-wrap: break-word;
        }
        th span,td span {
            padding-left: 10px;
            font-weight: normal;
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
        .more-icon {
            display: inline-block;
            width: 18px;
            height: 11px;
            background: url(https://job.alibaba.com/assets/zhaopin/images/show-more-icon.png) no-repeat;
        }
        .down-icon {
            display: inline-block;
            width: 18px;
            height: 11px;
            background: url(https://job.alibaba.com/assets/zhaopin/images/show-more-icon.png) no-repeat;
            background-position: left -12px ;
        }
        .detail {
            padding: 0 30px 0 10px;
            color: #333333;
            border-top: 1px dashed #E4E4E4;
            background: #ffffff;
            position: relative;
            top: -10px;
            margin-bottom: -20px;
        }
        .pt-20 {
            padding-top: 20px;
        }
    </style>
    <script src="js/jquery-3.1.0.js"></script>
    <script>
        $(function () {
            $(".more-icon").click(function () {
                $(this).parent().parent().next("tr").css("display","table-row");
                $(this).css("display","none");
                $(this).next(".down-icon").css("display","block");
            })
            $(".down-icon").click(function () {
                $(this).parent().parent().next("tr").css("display","none");
                $(this).css("display","none");
                $(this).prev(".more-icon").css("display","block");
            })
        })
    </script>
</head>
<body>
<div class="head">
    <div class="head-main">
        <div class="head-menu">
            <div class="login" style="opacity: 0.8;">
                <c:choose>
                    <c:when test="${sessionScope.visitor==null}">
                        欢迎来到阿里巴巴集团招聘！

                        <a href="toLogin" target="_top">登录</a>&nbsp;|
                        <a href="toRegister">注册</a>
                    </c:when>
                    <c:otherwise>
                        欢迎 ${sessionScope.visitor.name} 来到阿里巴巴集团招聘！|
                        <a href="logout">退出</a>
                    </c:otherwise>
                </c:choose>

            </div>
            <ul id="menu">
                <li >
                    <a href="/">首&nbsp;&nbsp;页</a>
                </li>
                <li class="current-cat"><a href="toRecruit" class="current-cat">社会招聘</a></li>
                <li><a href="https://job.alibaba.com/zhaopin/about.htm?spm=a2obv.11410903.0.0.5af844f6A10LlV">了解公司</a></li>
                <li><a href="/">联系我们</a></li>
                <c:choose>
                    <c:when test="${sessionScope.visitor==null}">
                        <li><a href="toLogin">个人中心</a></li>
                    </c:when>
                    <c:otherwise>
                        <li><a href="toMain">个人中心</a></li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
        <a href="/" class="logo" style="text-align:right;width: 125px;">
            <img src="https://img.alicdn.com/tfs/TB1Zv8_lxSYBuNjSspjXXX73VXa-390-63.png" height="20"/>
        </a>
        <i style="float:left;color:white;font-style:normal;font-size:20px;line-height:52px;margin: 0 10px;opacity: 0.8;">|</i>
        <i style="float:left;color:white;font-style:normal;font-size:14px;line-height:54px;opacity: 0.8;">招聘官网</i>
    </div>
</div>
<%--查看招聘信息界面--%>
<div style="width: 1000px;margin: 0 auto;position: relative;">
    <div style="width: 760px;">
        <br/>
        <div style="border: 1px solid #E4E4E4;">
            <div style="zoom: 1;">
                <h2 style="font-size: 15px;color: #666;padding: 10px 0;margin-left: 10px">查看职位</h2>
                <table style="border-collapse: collapse;border-spacing: 0;margin-top: 15px;width: 100%;">
                    <thead style="display: table-header-group;vertical-align: middle;border-color: inherit;">
                        <tr>
                            <th width="40%"><span>职位名称</span></th>
                            <th width="17%"><span>职位部门</span></th>
                            <th width="17%"><span>具体薪资</span></th>
                            <th width="17%"><span>工作地点</span></th>
                            <th><span>&nbsp;</span></th>
                        </tr>
                    </thead>
                    <tbody style="display: table-row-group;vertical-align: middle;border-color: inherit;">
                    <%
                        List<Recruitment> recruitments= (List<Recruitment>) session.getAttribute("recruitments");
                        for (Recruitment recruitment : recruitments) {
                    %>
                    <tr>
                        <td>
                            <span>
                                <%=recruitment.getJob()%>
                                <img src="https://job.alibaba.com/assets/zhaopin/images/new-icon.png">
                            </span>
                        </td>
                        <td><span><%=recruitment.getCompany()%></span></td>
                        <td><span><%=recruitment.getPay()%></span></td>
                        <td><span><%=recruitment.getArea()%></span></td>
                        <td>
                            <a href="javascript:void(0)" class="more-icon"></a>
                            <a href="javascript:void(0)" class="down-icon" style="display: none"></a>
                        </td>
                    </tr>
                    <tr style="display: none">
                        <td colspan="5">
                            <div class="detail">
                                <p class="pt-20">
                                    岗位描述：
                                    <br/>
                                    <%=recruitment.getDescription()%>
                                </p>
                                <p class="pt-20">
                                    岗位要求：
                                    <br/>
                                    <%=recruitment.getQuality()%>
                                </p>
                                <div style="padding: 20px 0">
                                    <c:choose>
                                    <c:when test="${sessionScope.visitor==null}">
                                    <a href="toLogin">
                                        </c:when>
                                        <c:otherwise>
                                        <a href="toPostResume?rid=<%=recruitment.getId()%>&vid=${sessionScope.visitor.id}">
                                            </c:otherwise>
                                            </c:choose>
                                        <div style="width: 80px;height: 31px;display: inline-block;color: #fff;padding: 5px 12px;border: 0;border-radius: 3px;font-weight: bold;font-size: 14px;background: #FF6600;text-align:center;line-height: 31px;">
                                            投递简历
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
</body>
</html>