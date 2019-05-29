<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: Matt
  Date: 2019/5/26
  Time: 22:06
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
    <title>个人信息</title>
    <link rel="stylesheet" href="https://cdn.bootcss.com/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="js/jquery-3.1.0.js"></script>
    <script src="https://cdn.bootcss.com/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script>
        $(function () {
            $("#checkClock").click(function () {
                $.get("queryClockByMonth",{month:$("#month").val()},function (obj) {
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
<body style="background: #F8F8F8">
<nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="/">员工界面</a>
        </div>
        <div>
            <ul class="nav navbar-nav">
                <li><a href="toStaffMain">通讯录</a></li>
                <li class="dropdown active">
                    <a href="toStaffInfo" class="dropdown-toggle" data-toggle="dropdown">
                        个人信息
                        <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="toStaffInfo">基本信息</a></li>
                        <li><a href="toStaffInfo">培训信息</a></li>
                        <li class="divider"></li>
                        <li><a href="toStaffInfo">历史薪资</a></li>
                        <li><a href="toStaffInfo">历史奖惩</a></li>
                        <li class="divider"></li>
                        <li><a href="toStaffInfo">打卡记录</a></li>
                    </ul>
                </li>
                <li><a href="toClock?sid=${sessionScope.staff.id}">考勤打卡</a></li>
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
            <div id="time" style="float: right;font-size: 16px">
                当前时间：
                <script>
                    document.getElementById('time').innerHTML=new Date().toLocaleString()+' 星期'+'日一二三四五六'.charAt(new Date().getDay());
                    setInterval("document.getElementById('time').innerHTML=new Date().toLocaleString()+' 星期'+'日一二三四五六'.charAt(new Date().getDay());",1000);
                </script>
            </div>
        </legend>
        <form action="updateStaff" method="post">
            <div class="col-sm-6">
                部门：<input value="${requestScope.dName}" class="form-control" readonly>
            </div>
            <div class="col-sm-6">
                职位：<input value="${requestScope.pName}" class="form-control" readonly>
            </div>
            <div class="col-sm-6">
                姓名：<input name="name" value="${sessionScope.staff.name}" class="form-control" readonly>
            </div>
            <div class="col-sm-6">
                密码：<input name="pass" value="${sessionScope.staff.pass}" class="form-control" required maxlength="11">
            </div>
            <div class="col-sm-6">
                性别：<input name="gender" value="${sessionScope.staff.gender}" class="form-control" readonly>
            </div>
            <div class="col-sm-6">
                生日：<input type="date" name="birth" value="${sessionScope.staff.birth}" class="form-control" readonly>
            </div>
            <div class="col-sm-6">
                民族：<input name="nation" value="${sessionScope.staff.nation}" class="form-control" readonly>
            </div>
            <div class="col-sm-6">
                籍贯：<input name="nativePlace" value="${sessionScope.staff.nativePlace}" class="form-control" readonly>
            </div>
            <div class="col-sm-6">
                手机号：<input type="number" name="phone" value="${sessionScope.staff.phone}" class="form-control" required min="13100000000" max="18999999999">
            </div>
            <div class="col-sm-6">
                地址：<input name="address" value="${sessionScope.staff.address}" class="form-control" required maxlength="10">
            </div>
            <div class="col-sm-6">
                邮箱：<input name="email" value="${sessionScope.staff.email}" class="form-control" required maxlength="20">
            </div>
            <div class="col-sm-6">
                工资：<input name="money" value="${sessionScope.staff.money}" class="form-control" readonly>
            </div>
            <div class="col-sm-6">
                状态：
                <c:choose>
                    <c:when test="${sessionScope.staff.state==0}">
                        <input value="试用" class="form-control" readonly>
                    </c:when>
                    <c:when test="${sessionScope.staff.state==1}">
                        <input value="在职" class="form-control" readonly>
                    </c:when>
                </c:choose>
            </div>
            <div class="col-sm-6">
                &emsp;
                <input type="hidden" name="id" value="${sessionScope.staff.id}">
                <input type="submit" value="提交修改" class="form-control btn btn-warning">
            </div>
        </form>
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
                <th>操作</th>
            </tr>
            <c:forEach items="${requestScope.pay}" var="pay">
                <tr>
                    <td>${pay.time}</td>
                    <td>${pay.money}</td>
                    <td>${pay.tax}</td>
                    <td>${pay.overtime}</td>
                    <td>${pay.rp}</td>
                    <td>${pay.total}</td>
                    <td>
                        <button class="btn btn-primary" data-toggle="modal" data-target="#myModal">复议</button>
                        <!-- 模态框（Modal） -->
                        <div class="modal fade" id="myModal" role="dialog" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                        <h3 class="modal-title" id="myModalLabel">复议详情</h3>
                                    </div>
                                    <form action="reconsider" method="post">
                                        <div class="modal-body">
                                            复议款项：
                                            <input name="reason" class="form-control" required maxlength="5">
                                            复议金额：
                                            <input type="number" name="money" class="form-control" required min="1" max="9999">
                                            复议状态：
                                            <select name="state" class="form-control">
                                                <option value="1">少算</option>
                                                <option value="2">多算</option>
                                            </select>
                                            <input type="hidden" name="sid" value="${sessionScope.staff.id}">
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                            <input type="submit" class="btn btn-primary" value="提交复议"></input>
                                        </div>
                                    </form>
                                </div><!-- /.modal-content -->
                            </div><!-- /.modal -->
                        </div>
                    </td>
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
                    <c:forEach begin="1" end="12" step="1" var="i">
                        <option value="${i}">${i}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="col-sm-6">
            <button id="checkClock" class="btn btn-primary form-control">查询打卡记录</button>
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