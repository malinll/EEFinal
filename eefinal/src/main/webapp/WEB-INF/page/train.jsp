<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Matt
  Date: 2019/5/20
  Time: 11:15
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
    <title>培训事宜</title>
</head>
<body>
    <fieldset>
        <legend>发起培训</legend>
        <form action="addTrain" method="post">
            培训主题：<input name="title"/>
            培训内容：<input name="content"/>
            培训时间：<input type="datetime-local" name="time"/>
            培训地点：<input name="site"/>
            选择员工：
            <c:forEach items="${requestScope.staffs}" var="staff">
                <input type="checkbox" name="staff" value="${staff.id}">${staff.name}
            </c:forEach>
            <input type="submit" value="发起培训">
            <input type="submit" formaction="trainDraft" value="保存草稿">
        </form>
    </fieldset>
    <fieldset>
        <legend>查看已发布培训</legend>
        <table>
            <tr>
                <th>培训主题</th>
                <th>培训内容</th>
                <th>培训时间</th>
                <th>培训地点</th>
                <th>培训人员</th>
            </tr>
            <c:forEach items="${requestScope.trains}" var="train" varStatus="i">
                <c:if test="${train.state==1}">
                    <tr>
                        <td>${train.title}</td>
                        <td>${train.content}</td>
                        <td>${train.time}</td>
                        <td>${train.site}</td>
                        <td>
                            <c:forEach items="${requestScope.tt[i.index]}" var="tt" varStatus="j">
                                <c:choose>
                                    <c:when test="${j.index==0}">
                                        ${tt.name}
                                    </c:when>
                                    <c:otherwise>
                                        ,${tt.name}
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </td>
                    </tr>
                </c:if>
            </c:forEach>
        </table>
    </fieldset>
</body>
</html>