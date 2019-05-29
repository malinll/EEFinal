<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Matt
  Date: 2019/5/14
  Time: 21:19
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
    <title>主页</title>
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
            /*margin-block-start: 1em;
            margin-block-end: 1em;
            margin-inline-start: 0px;
            margin-inline-end: 0px;
            padding-inline-start: 40px;*/
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
        .index-footer{
            width: 100%;
            height: 44px;
            background: #2C2F33;
        }
        .footer-content{
            font-family: PingFangSC-Regular;
            width: 1000px;
            margin: 0 auto;
            line-height: 44px;
            color: #fff;
            opacity: 0.4;
        }
        .pic-1 {
            margin-bottom: 20px;
        }
        .show-pic {
            display: block;
            cursor: pointer;
            height: 140px;
            background: #FFFFFF;
            box-shadow: 0 0 15px 0 rgba(31,56,88,0.08);
            border-radius: 3px;
        }
        .newPosition-list{
            background: #ffffff;
            box-shadow: 0 0 15px 0 rgba(31,56,88,0.08);
            border-radius:3px;
            float:left;
            overflow: hidden;
            position: relative;
        }
        .more-position{
            height: 49px;
            border-bottom: 1px solid rgba(31,56,88,0.06);
            line-height: 49px;
            padding: 0 14px;
            background: white;
            font-size: 14px;
            color: #000000;
            position: relative;
            z-index: 2;
        }
        .more-position a{
            float: right;
            font-size: 14px;
            color: rgba(31,56,88,0.6);
            cursor: pointer;
            text-decoration: none;
            font-family: PingFangSC-Regular;
        }
        .position-list li{
            overflow: hidden;
            padding: 0 14px;
            line-height: 50px;
        }
        .position-list li .position{
            float: left;
            color: #3C99D8;
            cursor: pointer;
            font-size: 14px;
            width: 400px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
            font-family: PingFangSC-Regular;
        }
        .area{
            font-style: normal;
            float: right;
            width: 70px;
            text-align: right;
            font-size: 14px;
            color: rgba(31,56,88,0.60);
        }
        .money{
            float: right;
            font-style: normal;
            font-size: 14px;
            color: rgba(0,0,0,0.60);
            margin-right: 70px;
            width: 202px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }
    </style>
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
                    <li class="current-cat" value="1">
                        <a href="/">首&nbsp;&nbsp;页</a>
                    </li>
                    <li><a href="toRecruit">社会招聘</a></li>
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
    <div class="index-main" style="position:relative;height:478px;width: 100%;overflow: hidden;">
        <%--<img class="index-image" src="https://img.alicdn.com/tfs/TB14TEEm7CWBuNjy0FaXXXUlXXa-1440-478.png" style="vertical-align: middle; width: 1440px; height: 478px;">--%>
        <div style="position: absolute;top:0;left:0;width: 100%;height: 100%;background: rgba(31,56,88,0.40);z-index: 1"></div>
        <div style="position: absolute;top:0;left:0;width: 100%;height: 100%;background: url('https://img.alicdn.com/tfs/TB14TEEm7CWBuNjy0FaXXXUlXXa-1440-478.png') no-repeat;background-size: cover;"></div>
        <div class="index-mid-box" style="height:100%;width: 1000px;position: absolute;margin-left: -500px;top: 0;left: 50%;z-index: 2">
            <div class="float-mid" style="top: 50%;margin-left: -305px;margin-top: -145px;position: absolute;left: 50%;">
                <p style="font-size: 78px;color: #fff;line-height: 80px;font-family: Georgia;margin: 0;padding: 0;" class="en-world">If not now, when?</p>
                <p style="font-size: 78px;color: #fff;line-height: 80px;font-family: Georgia;margin: 0;padding: 0;" class="en-world">If not me, who?</p>
                <p style="font-size: 54px;color: #fff;margin-bottom:58px;line-height: 48px;">此时此刻，非我莫属！</p>
            </div>
        </div>
    </div>
    <div style="height:364px;width:100%; overflow: hidden;">
        <div style="width:1180px;height:300px;margin:32px auto;">
            <div class="newPosition-list" style="width:850px;height:300px;">
                <div class="more-position">
                    查看职位
                    <a href="toRecruit" class="clickMorePosition">更多</a>
                </div>
                <ul class="position-list" style="position:absolute;z-index: 1;top: 50px;width: 100%;margin: 0;padding: 0;">
                    <c:forEach items="${requestScope.recruitments}" var="recruitment">
                        <li>
                            <a href="toRecruit" class="position">${recruitment.job}-${recruitment.company}</a>
                            <em class="area">地区：${recruitment.area}</em>
                            <em class="money">薪资：${recruitment.pay}</em>
                        </li>
                    </c:forEach>
                </ul>
            </div>

            <div style="width:310px;float:right">
                <a class="show-pic pic-1" href="https://www.aliyun.com/careers" style="text-align:center;line-height:140px;"><img style="width:179px;vertical-align: middle; margin-top: 35px" src="https://img.alicdn.com/tfs/TB1Z7JvoxGYBuNjy0FnXXX5lpXa-358-136.png"></a>
                <a class="show-pic pic-2" href="https://job.alibaba.com/zhaopin/informationPlatformBu.htm?" style="text-align:center;line-height:140px;"><img style="width:260px;vertical-align: middle;margin-top: 51px" src="https://img.alicdn.com/tfs/TB18tFCCH2pK1RjSZFsXXaNlXXa-240-34.svg"></a>
            </div>
        </div>
    </div>
    <div class="index-footer">
        <div class="footer-content" style="text-align: center">
            阿里巴巴集团 Copyright ©1999-2019 版权所有
        </div>
    </div>
</body>
</html>