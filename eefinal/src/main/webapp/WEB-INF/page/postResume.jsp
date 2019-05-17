<%@ page import="com.project.eefinal.model.Resume" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Matt
  Date: 2019/5/16
  Time: 8:40
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
    <title>选择投递的简历</title>
    <style>
        form::after{
            content: "";
            display: block;
            clear:both;
        }
    </style>
</head>
<body>
<fieldset>
    <legend>选择投递的简历</legend>
    <form action="pr" method="post">
        <%
        List<Resume> resumes = (List<Resume>) request.getAttribute("resumes");
        for (Resume resume : resumes) {
        %>
        <table style="float: left">
            <tr>
                <th colspan="2">个&emsp;人&emsp;简&emsp;历</th>
            </tr>
            <tr></tr>
            <tr>
                <td>姓&emsp;名：<input name="name" value=<%=resume.getName()%>></td>
                <td>性&emsp;别：<input name="gender" value=<%=resume.getGender()%>></td>
            </tr>
            <tr>
                <td>生&emsp;日：<input type="date" name="birth" value=<%=resume.getBirth()%>></td>
                <td>民&emsp;族：<input name="nation" value=<%=resume.getNation()%>></td>
            </tr>
            <tr>
                <td>籍&emsp;贯：<input name="nativePlace" value=<%=resume.getNativePlace()%>></td>
                <td>手机号：<input type="number" name="phone" value=<%=resume.getPhone()%>></td>
            </tr>
            <tr>
                <td>学&emsp;历：<input name="education" value=<%=resume.getEducation()%>></td>
                <td>专&emsp;业：<input name="major" value=<%=resume.getMajor()%>></td>
            </tr>
            <tr>
                <td>地&emsp;址：<input name="address" value=<%=resume.getAddress()%>></td>
                <td>邮&emsp;箱：<input name="email" value=<%=resume.getEmail()%>></td>
            </tr>
            <tr>
                <td colspan="2">技能特长：<textarea name="skills" style="width: 75%;height: 100px;resize: none"><%=resume.getSkills()%></textarea></td>
            </tr>
            <tr>
                <td colspan="2">个人评价：<textarea name="assessment" style="width: 75%;height: 100px;resize: none"><%=resume.getAssessment()%></textarea></td>
            </tr>
            <tr>
                <td><input type="hidden" name="rid" value=<%=request.getParameter("rid")%>>
                <input type="hidden" name="resid" value=<%=resume.getId()%>>
                <input type="submit" value="投递简历">
                </td>
            </tr>
        </table>
        <%
            }
        %>
    </form>

</fieldset>
</body>
</html>