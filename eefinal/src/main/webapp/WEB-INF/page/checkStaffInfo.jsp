<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: Matt
  Date: 2019/5/28
  Time: 0:47
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
    <title>查看员工信息</title>
    <link rel="stylesheet" href="https://cdn.bootcss.com/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="js/jquery-3.1.0.js"></script>
    <script src="https://cdn.bootcss.com/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script>
        $(function () {
            $("button:eq(0)").click(function () {
                $.get("queryClockByMonth2",{month:$("#month").val(),id:${requestScope.staff.id}},function (obj) {
                    $(".clockOfMonth").remove();
                    for(var i in obj){
                        $("#clockTable").append("<tr class='clockOfMonth'>" +
                            "<td>"+new Date(obj[i]['time']).toLocaleString()+"</td>" +
                            "</tr>");
                        if(obj[i]['state']==1){
                            $("#clockTable").children().find(".clockOfMonth").eq(i).append("<td>上班</td>");
                            if(obj[i]['loe']==0){
                                $("#clockTable").children().find(".clockOfMonth").eq(i).append("<td>正常</td>");
                            }else if(obj[i]['loe']==1){
                                $("#clockTable").children().find(".clockOfMonth").eq(i).append("<td>迟到</td>");
                            }else{
                                $("#clockTable").children().find(".clockOfMonth").eq(i).append("<td>旷工</td>");
                            }
                        }else{
                            $("#clockTable").children().find(".clockOfMonth").eq(i).append("<td>下班</td>");
                            if(obj[i]['loe']==0){
                                $("#clockTable").children().find(".clockOfMonth").eq(i).append("<td>正常</td>");
                            }else if(obj[i]['loe']==1){
                                $("#clockTable").children().find(".clockOfMonth").eq(i).append("<td>早退</td>");
                            }else{
                                $("#clockTable").children().find(".clockOfMonth").eq(i).append("<td>旷工</td>");
                            }
                        }
                    }
                })
            })
        })
    </script>
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
                <li class="active"><a href="toAdminSM">员工管理</a></li>
                <li><a href="toAdminPay">薪资结算</a></li>
                <li><a href="toTrain">培训事宜</a></li>
            </ul>
        </div>
    </div>
</nav>
<div class="container" style="max-width: 1100px;">
    <div class="col-sm-2"></div>
    <div class="col-sm-8" style="margin-top: 20px">
        <fieldset>
            <legend>
                基本信息
            </legend>
            <div class="col-sm-6">
                部门：<input value="${requestScope.dName}" class="form-control" readonly>
            </div>
            <div class="col-sm-6">
                职位：<input value="${requestScope.pName}" class="form-control" readonly>
            </div>
            <div class="col-sm-6">
                姓名：<input name="name" value="${requestScope.staff.name}" class="form-control" readonly>
            </div>
            <div class="col-sm-6">
                性别：<input name="gender" value="${requestScope.staff.gender}" class="form-control" readonly>
            </div>
            <div class="col-sm-6">
                生日：<input type="date" name="birth" value="${requestScope.staff.birth}" class="form-control" readonly>
            </div>
            <div class="col-sm-6">
                民族：<input name="nation" value="${requestScope.staff.nation}" class="form-control" readonly>
            </div>
            <div class="col-sm-6">
                籍贯：<input name="nativePlace" value="${requestScope.staff.nativePlace}" class="form-control" readonly>
            </div>
            <div class="col-sm-6">
                手机号：<input name="phone" value="${requestScope.staff.phone}" class="form-control" readonly>
            </div>
            <div class="col-sm-6">
                地址：<input name="address" value="${requestScope.staff.address}" class="form-control" readonly>
            </div>
            <div class="col-sm-6">
                邮箱：<input name="email" value="${requestScope.staff.email}" class="form-control" readonly>
            </div>
            <div class="col-sm-6">
                工资：<input name="money" value="${requestScope.staff.money}" class="form-control" readonly>
            </div>
            <div class="col-sm-6">
                状态：
                <c:choose>
                    <c:when test="${requestScope.staff.state==0}">
                        <input value="试用" class="form-control" readonly>
                    </c:when>
                    <c:when test="${requestScope.staff.state==1}">
                        <input value="在职" class="form-control" readonly>
                    </c:when>
                </c:choose>
            </div>
        </fieldset>
        <br/>
        <fieldset>
            <legend>培训信息</legend>
            <table class="table table-striped">
                <tr>
                    <th>培训主题</th>
                    <th>培训内容</th>
                    <th>培训地点</th>
                    <th>培训时间</th>
                </tr>
                <c:forEach items="${requestScope.ts}" var="train">
                    <tr>
                        <td>${train.title}</td>
                        <td>${train.content}</td>
                        <td>${train.site}</td>
                        <td>${train.time}</td>
                    </tr>
                </c:forEach>
            </table>
        </fieldset>
        <br/>
        <fieldset>
            <legend>历史薪资</legend>
            <table class="table table-striped">
                <tr>
                    <th>工资月份</th>
                    <th>基础工资</th>
                    <th>五险一金</th>
                    <th>加班费总</th>
                    <th>奖惩总计</th>
                    <th>最终工资</th>
                </tr>
                <c:forEach items="${requestScope.pay}" var="pay">
                    <tr>
                        <td>${pay.time}</td>
                        <td>${pay.money}</td>
                        <td>${pay.tax}</td>
                        <td>${pay.overtime}</td>
                        <td>${pay.rp}</td>
                        <td>${pay.total}</td>
                    </tr>
                </c:forEach>
            </table>
        </fieldset>
        <br/>
        <fieldset>
            <legend>历史奖惩</legend>
            <table class="table table-striped">
                <tr>
                    <th>奖惩时间</th>
                    <th>奖惩金额</th>
                    <th>奖惩状态</th>
                    <th>奖惩原因</th>
                </tr>
                <c:forEach items="${requestScope.rp}" var="rp">
                    <tr>
                        <td>
                            <fmt:formatDate value="${rp.time}" pattern="yyyy-MM-dd HH:mm:ss"/>
                        </td>
                        <td>${rp.money}</td>
                        <td>
                            <c:if test="${rp.state==1}">
                                奖励
                            </c:if>
                            <c:if test="${rp.state==2}">
                                处罚
                            </c:if>
                        </td>
                        <td>${rp.reason}</td>
                    </tr>
                </c:forEach>
            </table>
        </fieldset>
        <br/>
        <fieldset>
            <legend>考勤打卡</legend>
            <div class="col-sm-6">
                <div class="form-inline">
                    选择查询的月份：
                    <select class="form-control" id="month">
                        <option hidden>请选择</option>
                        <c:forEach begin="1" end="12" step="1" var="i">
                            <option value="${i}">${i}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="col-sm-6">
                <button class="btn btn-primary form-control">查询打卡记录</button>
            </div>
            <br/><br/>
            <table class="table table-striped" id="clockTable">
                <tr>
                    <th>打卡时间</th>
                    <th>打卡状态</th>
                    <th>备注</th>
                </tr>
                <c:forEach items="${requestScope.clock}" var="clock">
                    <tr class="clockOfMonth">
                        <td>
                            <fmt:formatDate value="${clock.time}" pattern="yyyy-MM-dd HH:mm:ss"/>
                        </td>
                        <c:if test="${clock.state==1}">
                            <td>上班</td>
                            <c:if test="${clock.loe==0}">
                                <td>正常</td>
                            </c:if>
                            <c:if test="${clock.loe==1}">
                                <td>迟到</td>
                            </c:if>
                            <c:if test="${clock.loe==2}">
                                <td>旷工</td>
                            </c:if>
                        </c:if>
                        <c:if test="${clock.state==2}">
                            <td>下班</td>
                            <c:if test="${clock.loe==0}">
                                <td>正常</td>
                            </c:if>
                            <c:if test="${clock.loe==1}">
                                <td>早退</td>
                            </c:if>
                            <c:if test="${clock.loe==2}">
                                <td>旷工</td>
                            </c:if>
                        </c:if>
                    </tr>
                </c:forEach>
            </table>
        </fieldset>
    </div>
    <div class="col-sm-2"></div>
</div>

</body>
</html>