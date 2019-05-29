<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Matt
  Date: 2019/5/16
  Time: 19:28
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
    <title>管理员主页</title>
    <link rel="stylesheet" href="https://cdn.bootcss.com/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="js/jquery-3.1.0.js"></script>
    <script src="https://cdn.bootcss.com/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script>
        $(function () {
            $("#dep").change(function () {
                $.get("queryPostsByDep",{"did":$(this).val()},function (obj) {
                    $("#post option").remove();
                    for(var i in obj){
                        $("#post").append("<option value='"+obj[i]['id']+"'>"+obj[i]['name']+"</option>")
                    }
                })
            })

            $(".updateRDep").change(function () {
                var p = $(this).parent().next().find(".updateRPost");
                $.get("queryPostsByDep",{"did":$(this).val()},function (obj) {
                    p.empty();
                    for(var i in obj){
                        p.append("<option value='"+obj[i]['id']+"'>"+obj[i]['name']+"</option>")
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
                <li class="active"><a href="toAdminMain">招聘相关</a></li>
                <li><a href="toAdminDep">部门管理</a> </li>
                <li><a href="toAdminSM">员工管理</a></li>
                <li><a href="toAdminPay">薪资结算</a></li>
                <li><a href="toTrain">培训事宜</a></li>
            </ul>
        </div>
    </div>
</nav>
    <%--<a href="javascript:void(0)">招聘相关</a> |
    <a href="toAdminDep">部门管理</a> |
    <a href="toAdminPay">薪资结算</a> |
    <a href="toTrain">培训事宜</a> |
    <a href="#">员工奖惩</a> |
    <a href="#">考勤统计</a>
    <hr/>
    <br/>--%>
<div class="container" style="max-width: 1100px;">
    <div class="col-sm-2"></div>
    <div class="col-sm-8" style="margin-top: 20px">
        <fieldset>
            <legend>应聘简历</legend>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>招聘公司</th>
                        <th>招聘职位</th>
                        <th>应聘人姓名</th>
                        <th>招聘状态</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${requestScope.interviews}" var="interview" varStatus="s">
                        <c:if test="${interview.getState()<10}">
                            <tr>
                                <td>${requestScope.recruitments[s.index].getCompany()}</td>
                                <td>${requestScope.recruitments[s.index].getJob()}</td>
                                <td>${requestScope.resumes[s.index].name}</td>

                                <c:choose>
                                    <c:when test="${interview.getState()==0}">
                                        <td><c:out value="待查看"/></td>
                                        <td><a href="adminCheckResume?iid=${interview.id}&resid=${interview.resid}">查看简历</a></td>
                                    </c:when>
                                    <c:when test="${interview.getState()==1}">
                                        <td><c:out value="待邀请"/></td>
                                        <td><a href="adminCheckResume?iid=${interview.id}&resid=${interview.resid}">面试与否</a></td>
                                    </c:when>
                                    <c:when test="${interview.getState()==2}">
                                        <td><c:out value="不合适"/></td>
                                        <td></td>
                                    </c:when>
                                </c:choose>

                            </tr>
                        </c:if>
                    </c:forEach>
                </tbody>
            </table>
        </fieldset>
        <br/><br/>
        <fieldset>
            <legend>面试情况</legend>
            <table class="table table-striped">
                <tr>
                    <th>招聘公司</th>
                    <th>招聘职位</th>
                    <th>应聘人姓名</th>
                    <th>招聘状态</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${requestScope.interviews}" var="interview" varStatus="s">
                    <c:if test="${interview.getState()>10}">
                        <tr>
                            <td>${requestScope.recruitments[s.index].getCompany()}</td>
                            <td>${requestScope.recruitments[s.index].getJob()}</td>
                            <td>${requestScope.resumes[s.index].name}</td>

                            <c:choose>
                                <c:when test="${interview.getState()==11}">
                                    <td><c:out value="待确认"/></td>
                                    <td></td>
                                </c:when>
                                <c:when test="${interview.getState()==12}">
                                    <td><c:out value="不合适"/></td>
                                    <td></td>
                                </c:when>
                                <c:when test="${interview.getState()==13}">
                                    <td> <c:out value="已确认"/></td>
                                    <td>
                                        <a class="btn btn-success" href="hire?iid=${interview.id}&resid=${interview.resid}&rid=${interview.rid}">录用</a>
                                        <a class="btn btn-danger" href="interviewReject?iid=${interview.id}">拒绝</a>
                                    </td>
                                </c:when>
                                <c:when test="${interview.getState()==14}">
                                    <td><c:out value="已取消"/></td>
                                    <td></td>
                                </c:when>
                                <c:when test="${interview.getState()==15}">
                                    <td><c:out value="已录用"/></td>
                                    <td></td>
                                </c:when>
                            </c:choose>
                        </tr>
                    </c:if>
                </c:forEach>
            </table>
        </fieldset>
        <br/><br/>
        <fieldset>
            <legend>发布招聘</legend>
            <form action="addRecruit" method="post">
                <div class="col-sm-6">
                    选择部门：
                    <select name="did" id="dep" class="form-control">
                        <c:forEach items="${requestScope.departments}" var="department">
                            <option value=${department.id}>${department.name}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="col-sm-6">
                    选择职位：
                    <select name="pid" id="post" class="form-control">
                        <c:forEach items="${requestScope.posts}" var="post">
                            <c:if test="${post.did==requestScope.departments[0].id}">
                                <option value=${post.id}>${post.name}</option>
                            </c:if>
                        </c:forEach>
                    </select>
                </div>
                <div class="col-sm-6">
                    薪资：<input type="number" name="pay" class="form-control" required min="1" max="99999">
                </div>
                <div class="col-sm-6">
                    地区：<input type="text" name="area" class="form-control" required maxlength="5">
                </div>
                <div class="col-sm-6">
                    描述：<input type="text" name="description" class="form-control" required maxlength="100">
                </div>
                <div class="col-sm-6">
                    要求：<input type="text" name="quality" class="form-control" required maxlength="100">
                </div>
                <div class="col-sm-6">
                    &emsp;
                    <input type="submit" class="form-control btn btn-primary" value="发布招聘">
                </div>
                <div class="col-sm-6">
                    &emsp;
                    <input type="submit" class="form-control btn btn-info" formaction="recruitDraft" value="保存草稿">
                </div>
            </form>
        </fieldset>
        <br/><br/>
        <fieldset>
            <legend>已发布招聘</legend>
            <table class="table table-striped">
                <tr>
                    <th>部门</th>
                    <th>职位</th>
                    <th>薪资</th>
                    <th>地区</th>
                    <th>描述</th>
                    <th>要求</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${requestScope.rList}" var="r">
                    <c:if test="${r.state==1}">
                        <tr>
                            <td>${r.company}</td>
                            <td>${r.job}</td>
                            <td>${r.pay}</td>
                            <td>${r.area}</td>
                            <td>${r.description}</td>
                            <td>${r.quality}</td>
                            <td><a href="repealRec?id=${r.id}" class="btn btn-warning">撤回</a></td>
                        </tr>
                    </c:if>
                </c:forEach>
            </table>
        </fieldset>
        <br/><br/>
        <fieldset>
            <legend>招聘草稿箱</legend>
            <%--<table class="table table-striped">
                <tr>
                    <th>部门</th>
                    <th>职位</th>
                    <th>薪资</th>
                    <th>地区</th>
                    <th>描述</th>
                    <th>要求</th>
                    <th>操作</th>
                </tr>--%>
            <c:forEach items="${requestScope.rList}" var="r">
                <c:if test="${r.state==0}">
                    <form action="delRec" method="post" >
                        <div class="col-sm-6">
                            部门：
                            <select name="did" class="updateRDep form-control">
                                <c:forEach items="${requestScope.departments}" var="department">
                                    <option value=${department.id}
                                            <c:if test="${department.name.equals(r.company)}">
                                                    selected
                                    </c:if>
                                    >${department.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="col-sm-6">
                            职位：
                            <select name="pid" class="updateRPost form-control">
                                <c:forEach items="${requestScope.posts}" var="post">
                                    <c:if test="${r.did==post.did}">
                                        <option value=${post.id}
                                                <c:if test="${post.id==r.pid}">
                                                        selected
                                        </c:if>
                                        >${post.name}</option>
                                    </c:if>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="col-sm-6">
                            薪资：<input type="number" name="pay" value="${r.pay}" class="form-control" min="1" max="99999">
                        </div>
                        <div class="col-sm-6">
                            地区：<input name="area" value="${r.area}" class="form-control" maxlength="5">
                        </div>
                        <div class="col-sm-6">
                            描述：<input name="description" value="${r.description}" class="form-control" maxlength="100">
                        </div>
                        <div class="col-sm-6">
                            要求：<input name="quality" value="${r.quality}" class="form-control" maxlength="100">
                        </div>
                        <div class="col-sm-6">
                            <input type="hidden" name="id" value="${r.id}">
                            &emsp;<input type="submit" value="删除" class="form-control btn btn-danger">
                        </div>
                        <div class="col-sm-6">
                            &emsp;<input type="submit" formaction="updateRec" value="发布" class="form-control btn btn-primary">
                        </div>
                    </form>
                </c:if>
            </c:forEach>
            <%--</table>--%>
        </fieldset>
    </div>
    <div class="col-sm-2"></div>
</div>
</body>
</html>