<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Matt
  Date: 2019/5/22
  Time: 10:07
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
    <title>薪资结算</title>
</head>
<body>
    <fieldset>
        <legend>上月未结算薪资列表</legend>
        <table>
            <tr>
                <th>员工姓名</th>
                <th>基础工资</th>
                <th>五险一金</th>
                <th>加班费总</th>
                <th>奖惩总计</th>
                <th>最终工资</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${requestScope.staffs}" var="staff" varStatus="i">
                <form action="" method="post">
                    <tr>
                        <td><input value="${staff.name}" readonly></td>
                        <td><input name="money" value="${staff.money}" readonly></td>
                        <td><input name="tax" value="${staff.money*0.1}" readonly></td>
                        <td><input name="overtime" value="稍后添加" readonly></td>
                        <td><input name="rp" value="${requestScope.rps[i.index]}" readonly></td>
                        <td><input name="total" value="${staff.money*0.9+requestScope.rps[i.index]}" readonly></td>
                        <td>
                            <input type="hidden" name="sid" value="${staff.id}">
                            <input type="submit" value="结算">
                        </td>
                    </tr>
                </form>
            </c:forEach>
        </table>
    </fieldset>
</body>
</html>