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
</head>
<body>
<%--查看招聘信息界面--%>
<table>
    <tr>
        <th>工作岗位</th>
        <th>公司名称</th>
        <th>具体薪资</th>
        <th>工作地点</th>
        <th>岗位描述</th>
        <th>岗位要求</th>
    </tr>
    <%
        List<Recruitment> recruitments= (List<Recruitment>) session.getAttribute("recruitments");
        for (Recruitment recruitment : recruitments) {
    %>
    <tr>
        <td><%=recruitment.getJob()%></td>
        <td><%=recruitment.getCompany()%></td>
        <td><%=recruitment.getArea()%></td>
        <td><%=recruitment.getPay()%></td>
        <td><%=recruitment.getDesciption()%></td>
        <td><%=recruitment.getQuality()%></td>
        <td><a href="toPostResume?rid=<%=recruitment.getId()%>&vid=${sessionScope.visitor.id}">投递简历</a></td>
    </tr>
    <%
        }
    %>

</table>
</body>
</html>