<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Matt
  Date: 2019/5/16
  Time: 20:40
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
    <title>我的投递</title>
</head>
<body>
    <fieldset>
        <legend>我的投递</legend>
        <table>
            <tr>
                <th>投递公司</th>
                <th>投递职位</th>
                <th>投递状态/操作</th>
                <th>备注</th>
            </tr>
            <c:forEach items="${requestScope.interviews}" var="interview" varStatus="s">
                <tr>
                    <td>${requestScope.recruitments[s.index].getCompany()}</td>
                    <td>${requestScope.recruitments[s.index].getJob()}</td>
                    <td>
                        <c:choose>
                            <c:when test="${interview.getState()==0}">
                                <c:out value="已投递"/>
                            </c:when>
                            <c:when test="${interview.getState()==1}">
                                <c:out value="被查看"/>
                            </c:when>
                            <c:when test="${interview.getState()==11}">
                                <c:out value="邀面试"/>
                                <a href="confirmInterview?iid=${interview.id}">确认</a>
                                <a href="cancelInterview?iid=${interview.id}">取消</a>
                            </c:when>
                            <c:when test="${interview.getState()==13}">
                                <c:out value="已确认"/>
                            </c:when>
                            <c:when test="${interview.getState()==14}">
                                <c:out value="已取消"/>
                            </c:when>
                            <c:when test="${interview.getState()==15}">
                                <c:out value="已录用"/>
                            </c:when>
                            <c:when test="${interview.getState()==2||interview.getState()==12}">
                                <c:out value="不合适"/>
                            </c:when>
                        </c:choose>
                    </td>
                    <td>
                        <c:choose>
                            <c:when test="${interview.getState()==11}">
                                面试时间：${interview.time}<br/>
                                面试地点：${interview.site}<br/>
                            </c:when>
                            <c:when test="${interview.getState()==13}">
                                面试时间：${interview.time}<br/>
                                面试地点：${interview.site}<br/>
                                请携带身份证原件及复印件、简历等相关文件
                            </c:when>
                            <c:when test="${interview.getState()==15}">
                                员工账号/密码为您的手机号
                            </c:when>
                        </c:choose>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </fieldset>
</body>
</html>