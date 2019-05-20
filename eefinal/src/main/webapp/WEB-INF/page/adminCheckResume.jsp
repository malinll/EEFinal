<%--
  Created by IntelliJ IDEA.
  User: Matt
  Date: 2019/5/17
  Time: 9:35
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
    <title>查看应聘简历</title>
</head>
<body>
    <table>
        <tr>
            <th colspan="2">个&emsp;人&emsp;简&emsp;历</th>
        </tr>
        <tr></tr>
        <tr>
            <td>姓&emsp;名：<input name="name" value=${requestScope.resume.name} readonly></td>
            <td>
                性&emsp;别：<input name="gender" value=${requestScope.resume.gender} readonly>
            </td>
        </tr>
        <tr>
            <td>生&emsp;日：<input type="date" name="birth" value=${requestScope.resume.birth} readonly></td>
            <td>民&emsp;族：<input name="nation" value=${requestScope.resume.nation} readonly></td>
        </tr>
        <tr>
            <td>籍&emsp;贯：<input name="nativePlace" value=${requestScope.resume.nativePlace} readonly></td>
            <td>手机号：<input type="number" name="phone" value=${requestScope.resume.phone} readonly></td>
        </tr>
        <tr>
            <td>学&emsp;历：<input name="education" value=${requestScope.resume.education} readonly></td>
            <td>专&emsp;业：<input name="major" value=${requestScope.resume.major} readonly></td>
        </tr>
        <tr>
            <td>地&emsp;址：<input name="address" value=${requestScope.resume.address} readonly></td>
            <td>邮&emsp;箱：<input name="email" value=${requestScope.resume.email} readonly></td>
        </tr>
        <tr>
            <td colspan="2">技能特长：<textarea name="skills" style="width: 75%;height: 100px;resize: none">${requestScope.resume.skills}</textarea></td>
        </tr>
        <tr>
            <td colspan="2">个人评价：<textarea name="assessment" style="width: 75%;height: 100px;resize: none">${requestScope.resume.assessment}</textarea></td>
        </tr>
    </table>
    <a href="inviteToInterview?iid=${requestScope.iid}">邀请面试</a>
    <a href="resumeReject?iid=${requestScope.iid}">不予面试</a>
</body>
</html>