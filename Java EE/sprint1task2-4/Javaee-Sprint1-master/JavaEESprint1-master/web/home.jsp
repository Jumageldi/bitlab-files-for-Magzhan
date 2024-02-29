
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: Home
  Date: 02.02.2024
  Time: 22:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<%@include file="head.jsp"%>
</head>
<body>

<%@include file="header.jsp"%>
<%@include file="modalIncludeTask.jsp"%>
<table cellpadding="10px">
    <thead style="background-color:gray">
    <th>ID</th>
    <th>Наименование</th>
    <th>Крайний срок</th>
    <th>Описание</th>
    <th>Задача выполнена</th>
    <th>Детали</th>

    </thead>
    <tbody>
        <%@include file="respTable.jsp"%>
    </tbody>
</table>
</body>
<%@include file="scripts.jsp"%>
</html>
