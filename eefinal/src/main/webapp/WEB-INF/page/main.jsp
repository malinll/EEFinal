<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Matt
  Date: 2019/5/14
  Time: 21:44
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
    <title>个人中心</title>
    <link rel="stylesheet" href="https://cdn.bootcss.com/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <style>
        th,td{
            width: 500px;
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
    <script src="js/jquery-3.1.0.js"></script>
    <script>
        /*$(function () {
            $("#addr").click(function () {
                $("#ar").css("display","block");
            })
        })*/
    </script>
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
                    <a href="javascript:void(0)" class="list-group-item active" id="addr" style="background-color:#2C2F33;color: #F3732A">新增简历</a>
                    <a href="toCheckResume?vid=${sessionScope.visitor.id}" class="list-group-item">查看简历</a>
                    <a href="toMyPost?vid=${sessionScope.visitor.id}" class="list-group-item">我的投递</a>
                </div>
                <%--<ul class="nav nav-pills nav-stacked">
                    <li><a href="javascript:void(0)" id="addr">新增简历</a></li>
                    <li><a href="toCheckResume?vid=${sessionScope.visitor.id}" class="list-group-item">查看简历</a></li>
                    <li><a href="toMyPost?vid=${sessionScope.visitor.id}" class="list-group-item">我的投递</a></li>
                </ul>--%>
            </div>
            <div class="col-sm-10">
                <%--新增简历界面--%>
                <%--<form action="addResume" method="post" id="ar" style="display: none">
                    <table>
                        <tr>
                            <th colspan="2">个&emsp;人&emsp;简&emsp;历</th>
                        </tr>
                        <tr></tr>
                        <tr>
                            <td>姓&emsp;名：<input name="name"></td>
                            <td>
                                性&emsp;别：<input type="radio" name="gender" value="男">男/
                                <input type="radio" name="gender" value="女">女
                            </td>
                        </tr>
                        <tr>
                            <td>生&emsp;日：<input type="date" name="birth"/></td>
                            <td>民&emsp;族：<input name="nation"/></td>
                        </tr>
                        <tr>
                            <td>籍&emsp;贯：<input name="nativePlace"/></td>
                            <td>手机号：<input type="number" name="phone"/></td>
                        </tr>
                        <tr>
                            <td>学&emsp;历：<input name="education"/></td>
                            <td>专&emsp;业：<input name="major"/></td>
                        </tr>
                        <tr>
                            <td>地&emsp;址：<input name="address"/></td>
                            <td>邮&emsp;箱：<input name="email"/></td>
                        </tr>
                        <tr>
                            <td colspan="2">技能特长：<textarea name="skills" style="width: 75%;height: 100px;resize: none"></textarea></td>
                        </tr>
                        <tr>
                            <td colspan="2">个人评价：<textarea name="assessment" style="width: 75%;height: 100px;resize: none"></textarea></td>
                        </tr>
                    </table>
                    <input type="hidden" name="vid" value=${sessionScope.visitor.id}>
                    <input type="submit" value="提交简历">
                </form>--%>

                <form action="addResume" method="post">
                    <br/>
                    <%--<div class="form-inline">--%>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label>姓&emsp;名：</label>
                                <input name="name" class="form-control" required maxlength="5">
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label>性&emsp;别：</label>
                                <select class="form-control" name="gender">
                                    <option hidden></option>
                                    <option value="男">男</option>
                                    <option value="女">女</option>
                                </select>
                            </div>
                        </div>
                    <%--</div>--%>
                    <%--<div class="form-inline">--%>
                        <div class="col-sm-6">
                        <div class="form-group">
                            <label>生&emsp;日：</label>
                            <input type="date" class="form-control" name="birth" max="2000-01-01"/>
                        </div>
                        </div>
                        <div class="col-sm-6">
                        <div class="form-group">
                            <label>民&emsp;族：</label>
                            <input class="form-control" name="nation" required maxlength="5"/>
                        </div>
                        </div>
                    <%--</div>--%>
                        <%--<div class="form-inline">--%>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>籍&emsp;贯：</label>
                                    <input class="form-control" name="nativePlace" required maxlength="5"/>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>手机号：</label>
                                    <input class="form-control" type="number" name="phone" min="13100000000" max="18999999999" required/>
                                </div>
                            </div>
                        <%--</div>--%>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label>学&emsp;历：</label>
                            <input class="form-control" name="education" required maxlength="5"/>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label>专&emsp;业：</label>
                            <input class="form-control" name="major" required maxlength="5"/>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label>地&emsp;址：</label>
                            <input class="form-control" name="address" required maxlength="10"/>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label>邮&emsp;箱：</label>
                            <input class="form-control" name="email" required maxlength="20"/>
                        </div>
                    </div>
                    <div class="col-sm-12">
                        <div class="form-group">
                            <label>技能特长：</label>
                            <textarea class="form-control" name="skills" maxlength="100" style="height: 90px;resize: none"></textarea>
                        </div>
                    </div>
                    <div class="col-sm-12">
                        <div class="form-group">
                            <label>个人评价：</label>
                            <textarea class="form-control" name="assessment" maxlength="100" style="height: 90px;resize: none"></textarea>
                        </div>
                    </div>
                    <div class="col-sm-12">
                        <div class="form-group">
                            <input type="hidden" name="vid" value=${sessionScope.visitor.id}>
                            <input type="submit" class="form-control btn btn-primary" value="提交简历">
                        </div>
                    </div>
                </form>
            </div>
        <%--</div>--%>
    </div>
</body>
</html>