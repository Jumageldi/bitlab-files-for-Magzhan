<%@ page import="model.Tasks" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: Home
  Date: 02.02.2024
  Time: 23:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%
    ArrayList<Tasks> tasksList = (ArrayList<Tasks>) request.getAttribute("tasksList");
    for (Tasks task : tasksList) {
%>
<tr>
    <td><%= task.getId() %></td>
    <td><%= task.getName() %></td>
    <td><%= task.getDeadlineDate() %></td>
    <td><%= task.getDescription() %></td>
    <td><%= task.isCompleted() ? "Да" : "Нет" %></td>
    <td>
        <div class="page-wrapper">
            <a class="btn trigger" href="details?id=<%= task.getId() %>">click me</a>
        </div>
    </td>


</tr>
<%
    }
%>
</html>
