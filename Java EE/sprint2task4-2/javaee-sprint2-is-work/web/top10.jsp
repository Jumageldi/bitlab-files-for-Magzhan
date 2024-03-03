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

    <div class="text-center">
        <h1>Top 10 expensive items in BITLAB SHOP</h1>
        <p>Electronic devices with high quality and service</p>
    </div>

    <div class="row row-cols-1 row-cols-md-3 mb-3 text-center">
        <%
            List<Item> itemList = (List<Item>) request.getAttribute("itemList");
            for (Item item : itemList) {
        %>
        <div class="col">
            <div class="card mb-4 rounded-3 shadow-sm">
                <div class="card-header py-3">
                    <h4 class="my-0 fw-normal"><%=item.getName()%></h4>
                </div>
                <div class="card-body">
                    <h1 class="card-title pricing-card-title">$<%=item.getPrice()%></h1>
                    <p class="card-text"><%=item.getDescription()%></p>
                    <button type="button" class="w-100 btn btn-lg btn-success">Buy Now</button>
                </div>
            </div>
        </div>
        <%
            }
        %>
    </div>
</body>
</html>
