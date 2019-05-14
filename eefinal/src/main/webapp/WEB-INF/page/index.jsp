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
</head>
<body>
    <fieldset>
        <legend>用户登录</legend>
        <br/>
            <form action="login" method="post">
                用户名：<input name="name" required/><br/><br/>
                密&emsp;码：<input type="password" name="pass" required/><br/><br/>
                <input type="submit" value="登录"/>
            </form>
    </fieldset>
</body>
</html>