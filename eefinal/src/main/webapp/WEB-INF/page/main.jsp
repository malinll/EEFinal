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
    <style>
        th,td{
            width: 500px;
            text-align: left;
        }
    </style>
    <script src="js/jquery-3.1.0.js"></script>
    <script>
        $(function () {
            $("a:eq(2)").click(function () {
                $("#ar").css("display","block");
            })
        })
    </script>
</head>
<body>
    <a href="toRecruit">招聘信息</a> |
    <a href="toCheckResume?vid=${sessionScope.visitor.id}">查看简历</a> |
    <a href="javascript:void(0)">新增简历</a>
    <hr/>
    <br/>
    <%--新增简历界面--%>
    <form action="addResume" method="post" id="ar" style="display: none">
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
    </form>
</body>
</html>