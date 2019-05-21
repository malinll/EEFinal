<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: Matt
  Date: 2019/5/20
  Time: 20:03
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
    <title>考勤打卡</title>
    <script src="js/jquery-3.1.0.js"></script>
</head>
<body>
    <div id="date" style="float: right">
        <script>
            document.getElementById('date').innerHTML=new Date().toLocaleString()+' 星期'+'日一二三四五六'.charAt(new Date().getDay());
            setInterval("document.getElementById('date').innerHTML=new Date().toLocaleString()+' 星期'+'日一二三四五六'.charAt(new Date().getDay());",1000);
        </script>
    </div>
    <fieldset style="clear: right">
        <legend>考勤打卡</legend>
        <c:choose>
            <c:when test="${requestScope.to==null}">
                <div id="time">
                    <script>
                        document.getElementById('time').innerHTML='当前时间：'+new Date().getHours()+":"+new Date().getMinutes()+":"+new Date().getSeconds();
                        setInterval('document.getElementById("time").innerHTML="当前时间："+new Date().getHours()+":"+new Date().getMinutes()+":"+new Date().getSeconds()',1000);
                    </script>
                </div>
                <a href="goToWork?sid=${sessionScope.staff.id}">上班打卡</a>
            </c:when>
            <c:otherwise>
                <p>
                    上班打卡时间：<fmt:formatDate value="${requestScope.to.time}" pattern="HH:mm:ss"/> &emsp;
                    <c:choose>
                        <c:when test="${requestScope.to.loe==0}">
                            正常
                        </c:when>
                        <c:when test="${requestScope.to.loe==1}">
                            迟到
                        </c:when>
                        <c:when test="${requestScope.to.loe==2}">
                            旷工
                        </c:when>
                    </c:choose>
                </p>

                <c:choose>
                    <c:when test="${requestScope.off==null}">
                        <div id="time">
                            <script>
                                document.getElementById('time').innerHTML='当前时间：'+new Date().getHours()+":"+new Date().getMinutes()+":"+new Date().getSeconds();
                                setInterval('document.getElementById("time").innerHTML="当前时间："+new Date().getHours()+":"+new Date().getMinutes()+":"+new Date().getSeconds()',1000);
                            </script>
                        </div>
                        <a href="offWork?sid=${sessionScope.staff.id}">下班打卡</a>
                    </c:when>
                    <c:otherwise>
                        <p>
                            下班打卡时间：<fmt:formatDate value="${requestScope.off.time}" pattern="HH:mm:ss"/> &emsp;
                            <c:choose>
                                <c:when test="${requestScope.off.loe==0}">
                                    正常
                                </c:when>
                                <c:when test="${requestScope.off.loe==1}">
                                    早退
                                </c:when>
                                <c:when test="${requestScope.off.loe==2}">
                                    旷工
                                </c:when>
                            </c:choose>
                        </p>
                    </c:otherwise>
                </c:choose>
            </c:otherwise>
        </c:choose>
    </fieldset>
</body>
</html>