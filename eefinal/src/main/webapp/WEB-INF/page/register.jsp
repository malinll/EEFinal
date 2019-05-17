<%--
  Created by IntelliJ IDEA.
  User: Matt
  Date: 2019/5/15
  Time: 19:19
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
    <title>游客注册</title>
    <script src="js/jquery-3.1.0.js"></script>
    <script>
        $(function () {
            $("input[name='name']").blur(function () {
                var name = $("input[name='name']").val();
                $.post("checkVisitorName",{name:name},function (str) {
                    $("span:eq(0)").html(str.split(",")[0]);
                })
            })
        })
    </script>
</head>
<body>
<fieldset>
    <legend>游客注册</legend>
    <br/>
    <form action="register" method="post">
        用户名：<input name="name" required/>&emsp;<span></span><br/><br/>
        密&emsp;码：<input type="password" name="pass" required/><br/><br/>
        &emsp;&emsp;&emsp;&emsp;<input type="submit" value="注册"/>
    </form>
</fieldset>
</body>
</html>