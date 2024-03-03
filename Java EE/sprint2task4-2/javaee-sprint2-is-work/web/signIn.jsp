<%@ page import="java.util.List" %>
<%@ page import="kz.bitlab.shop.items.entity.Item" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="bootstrap.jsp"%>
</head>
<body>
    <%@include file="navbar.jsp"%>

    <%
        if (request.getParameter("invalidCredentials") != null) {
    %>
        <div class="alert alert-danger" role="alert">
            Incorrect email or password
        </div>
    <%
        }
    %>

    <form action="/signIn" method="post" class="form-control">
        <h1 class="h3 mb-3 fw-normal">Login Page</h1>

        <div class="form-floating">
            <input type="email" class="form-control" id="floatingInput" placeholder="name@example.com" name="email">
            <label for="floatingInput">Email</label>
        </div>
        <div class="form-floating">
            <input type="password" class="form-control" id="floatingPassword" placeholder="*****" name="password">
            <label for="floatingPassword">Password</label>
        </div>

<%--
        <div class="row mb-3">
            <label for="colFormLabelSm" class="col-sm-2 col-form-label col-form-label-sm">Email</label>
            <div class="col-sm-10">
                <input type="email" class="form-control form-control-sm" id="colFormLabelSm" placeholder="name@example.com">
            </div>
        </div>
        <div class="row mb-3">
            <label for="colFormLabel" class="col-sm-2 col-form-label">Password</label>
            <div class="col-sm-10">
                <input type="password" class="form-control" id="colFormLabel" placeholder="***">
            </div>
        </div>***/

--%>
        <button class="btn btn-success w-100 py-2">Login</button>
    </form>
</body>
</html>
