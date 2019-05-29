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
    <link rel="stylesheet" href="https://cdn.bootcss.com/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="js/jquery-3.1.0.js"></script>
    <script src="https://cdn.bootcss.com/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="/">管理员界面</a>
        </div>
        <div>
            <ul class="nav navbar-nav">
                <li><a href="toAdminMain">招聘相关</a></li>
                <li><a href="toAdminDep">部门管理</a> </li>
                <li><a href="toAdminSM">员工管理</a></li>
                <li class="active"><a href="toAdminPay">薪资结算</a></li>
                <li><a href="toTrain">培训事宜</a></li>
            </ul>
        </div>
    </div>
</nav>
<div class="container" style="max-width: 1100px;">
    <div class="col-sm-2"></div>
    <div class="col-sm-8" style="margin-top: 20px">
        <fieldset>
            <legend>上月未结算薪资列表</legend>
                <c:forEach items="${requestScope.staffs}" var="staff" varStatus="i">
                    <form action="payoff" method="post">
                        <div class="col-sm-6">
                            员工姓名：<input value="${staff.name}" class="form-control" readonly>
                        </div>
                        <c:if test="${staff.state==0}">
                            <div class="col-sm-6">
                                员工状态：<input value="试用" class="form-control" readonly>
                            </div>
                            <div class="col-sm-6">
                                基础工资：<input name="money" class="form-control" value="${staff.money*0.8}" readonly>
                            </div>
                            <div class="col-sm-6">
                                五险一金：<input name="tax" class="form-control" value="${staff.money*0.8*0.1}" readonly>
                            </div>
                        </c:if>
                        <c:if test="${staff.state==1}">
                            <div class="col-sm-6">
                                员工状态：<input value="在职" class="form-control" readonly>
                            </div>
                            <div class="col-sm-6">
                                基础工资：<input name="money" class="form-control" value="${staff.money*1.0}" readonly>
                            </div>
                            <div class="col-sm-6">
                                五险一金：<input name="tax" class="form-control" value="${staff.money*0.1}" readonly>
                            </div>
                        </c:if>
                        <div class="col-sm-6">
                            加班费总：<input name="overtime" class="form-control" value="${requestScope.ots[i.index]}" readonly>
                        </div>
                        <div class="col-sm-6">
                            奖惩总计：<input name="rp" class="form-control" value="${requestScope.rps[i.index]}" readonly>
                        </div>
                        <div class="col-sm-6">
                            <c:if test="${staff.state==0}">
                                最终工资：<input name="total" class="form-control" value="${staff.money*0.8*0.9+requestScope.rps[i.index]+requestScope.ots[i.index]}" readonly>
                            </c:if>
                            <c:if test="${staff.state==1}">
                                最终工资：<input name="total" class="form-control" value="${staff.money*0.9+requestScope.rps[i.index]+requestScope.ots[i.index]}" readonly>
                            </c:if>
                        </div>
                        <div class="col-sm-6">
                            <input type="hidden" name="sid" value="${staff.id}">
                            &emsp;<input type="submit" value="结算" class="form-control btn btn-primary">
                        </div>
                    </form>
                </c:forEach>
        </fieldset>
        <br/>
        <fieldset>
            <legend>薪资复议</legend>
            <c:forEach items="${sessionScope.reconsider}" var="reconsider" varStatus="i">
                <form action="agreeReconsider" method="post">
                    <div class="col-sm-6">
                        工号：<input name="sid" class="form-control" value="${reconsider.sid}" readonly>
                    </div>
                    <div class="col-sm-6">
                        复议款项：<input name="reason" class="form-control" value="${reconsider.reason}" readonly>
                    </div>
                    <div class="col-sm-6">
                        复议金额：<input name="money" class="form-control" value="${reconsider.money}" readonly>
                    </div>
                        <div class="col-sm-6">
                        复议状态：
                        <c:if test="${reconsider.state==1}">
                            <input class="form-control" value="少算" readonly>
                        </c:if>
                        <c:if test="${reconsider.state==2}">
                            <input class="form-control" value="多算" readonly>
                        </c:if>
                        </div>
                    <div class="col-sm-12">
                        <input type="hidden" name="state" value="${reconsider.state}">
                        <input type="hidden" name="index" value="${i.index}">
                        &emsp;<input type="submit" value="同意" class="form-control btn btn-primary">
                    </div>
                </form>
            </c:forEach>
        </fieldset>
    </div>
    <div class="col-sm-2"></div>
</div>
</body>
</html>