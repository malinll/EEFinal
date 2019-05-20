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
    <style>
        th,td{
            width: 300px;
            text-align: center;
        }
    </style>
    <script src="js/jquery-3.1.0.js"></script>
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
        })
    </script>
</head>
<body>
    <a href="javascript:void(0)">招聘相关</a> |
    <a href="toAdminDep">部门管理</a> |
    <a href="#">薪资结算</a> |
    <a href="#">培训事宜</a> |
    <a href="#">员工奖惩</a> |
    <a href="#">考勤统计</a>
    <hr/>
    <br/>
    <div id="recruit">
        <fieldset>
            <legend>应聘简历</legend>
            <table>
                <tr>
                    <th>招聘公司</th>
                    <th>招聘职位</th>
                    <th>应聘人姓名</th>
                    <th>招聘状态/操作</th>
                </tr>
                <c:forEach items="${requestScope.interviews}" var="interview" varStatus="s">
                    <c:if test="${interview.getState()<10}">
                        <tr>
                            <td>${requestScope.recruitments[s.index].getCompany()}</td>
                            <td>${requestScope.recruitments[s.index].getJob()}</td>
                            <td>${requestScope.resumes[s.index].name}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${interview.getState()==0}">
                                        <c:out value="待查看"/>
                                        <a href="adminCheckResume?iid=${interview.id}&resid=${interview.resid}">查看简历</a>
                                    </c:when>
                                    <c:when test="${interview.getState()==1}">
                                        <c:out value="待邀请"/>
                                        <a href="adminCheckResume?iid=${interview.id}&resid=${interview.resid}">面试与否</a>
                                    </c:when>
                                    <c:when test="${interview.getState()==2}">
                                        <c:out value="不合适"/>
                                    </c:when>
                                </c:choose>
                            </td>
                        </tr>
                    </c:if>
                </c:forEach>
            </table>
        </fieldset >
        <br/><hr/><br/>
        <fieldset>
            <legend>面试情况</legend>
            <table>
                <tr>
                    <th>招聘公司</th>
                    <th>招聘职位</th>
                    <th>应聘人姓名</th>
                    <th>招聘状态/操作</th>
                </tr>
                <c:forEach items="${requestScope.interviews}" var="interview" varStatus="s">
                    <c:if test="${interview.getState()>10}">
                        <tr>
                            <td>${requestScope.recruitments[s.index].getCompany()}</td>
                            <td>${requestScope.recruitments[s.index].getJob()}</td>
                            <td>${requestScope.resumes[s.index].name}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${interview.getState()==11}">
                                        <c:out value="待确认"/>
                                    </c:when>
                                    <c:when test="${interview.getState()==12}">
                                        <c:out value="不合适"/>
                                    </c:when>
                                    <c:when test="${interview.getState()==13}">
                                        <c:out value="已确认"/>
                                        <%--录用时还未创建员工账号--%>
                                        录用与否&emsp;<a href="hire?iid=${interview.id}">是</a>/
                                        <a href="interviewReject?iid=${interview.id}">否</a>
                                    </c:when>
                                    <c:when test="${interview.getState()==14}">
                                        <c:out value="已取消"/>
                                    </c:when>
                                    <c:when test="${interview.getState()==15}">
                                        <c:out value="已录用"/>
                                    </c:when>
                                </c:choose>
                            </td>
                        </tr>
                    </c:if>
                </c:forEach>
            </table>
        </fieldset>
        <br/><hr/><br/>
        <fieldset>
            <legend>发布招聘</legend>
            <form action="addRecruit" method="post">
                选择部门：
                <select name="company" id="dep">
                    <c:forEach items="${requestScope.departments}" var="department">
                        <option value=${department.id}>${department.name}</option>
                    </c:forEach>
                </select>
                选择职位：
                <select name="job" id="post">
                    <c:forEach items="${requestScope.posts}" var="post">
                        <option value=${post.name}>${post.name}</option>
                    </c:forEach>
                </select>
                薪资：<input type="number" name="pay">
                地区：<input type="text" name="area" >
                描述：<input type="text" name="description">
                资质：<input type="text" name="quality">
                <input type="submit" value="发布招聘">
                <input type="submit" formaction="recruitDraft" value="保存草稿">
            </form>
        </fieldset>
    </div>
</body>
</html>