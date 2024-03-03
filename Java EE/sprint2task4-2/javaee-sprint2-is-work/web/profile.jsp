<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="kz.bitlab.shop.users.entity.User" %>
<html>
<head>
    <title>User Profile</title>
    <%@include file="bootstrap.jsp"%>
</head>
<body>
<%@include file="navbar.jsp"%>
<%
    User currentUser = (User) session.getAttribute("currentUser");
    if (currentUser == null) {
        response.sendRedirect("/signIn.jsp");
        return;
    }
%>
<h1 class="text-center">Hello <%= currentUser.getFullName() %>!</h1>
<p class="text-center">This is your profile page</p>

</body>
</html>
