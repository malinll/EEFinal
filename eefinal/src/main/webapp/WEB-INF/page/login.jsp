<%--
  Created by IntelliJ IDEA.
  User: Matt
  Date: 2019/5/15
  Time: 18:52
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
    <title>用户登录</title>
</head>
<body>
    <fieldset>
        <legend>用户登录</legend>
        <br/>
            <form action="login" method="post">
                用户名：<input name="name" required/><br/><br/>
                密&emsp;码：<input type="password" name="pass" required/><br/><br/>
                身&emsp;份：<input type="radio" name="rank" value="visitor" checked/>游客
                <input type="radio" name="rank" value="staff"/>员工
                <input type="radio" name="rank" value="admin"/>管理员<br/><br/>
                &emsp;&emsp;&emsp;&emsp;<input type="submit" value="登录"/>
            </form>
    </fieldset>
</body>
</html>