<%@ page import="model.Tasks" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="head.jsp"%>
</head>
<body>
<%@include file="header.jsp"%>
<% Tasks task = (Tasks) request.getAttribute("task"); %>

<form action="updateTask" method="post">
    <label for="taskId">Task ID:</label>
    <input type="text" id="taskId" name="taskId" value="${task.id}" readonly>
    <p>ID: <%= task.getId() %></p>
    <label for="taskName">Task Name:</label>
    <input type="text" id="taskName" name="taskName" value="${task.name}">

    <label for="taskDescription">Task Description:</label>
    <textarea id="taskDescription" name="taskDescription">${task.description}</textarea>

    <label for="taskDeadline">Task Deadline:</label>
    <input type="text" id="taskDeadline" name="taskDeadline" value="${task.deadlineDate}">

    <label for="taskCompleted">Task Completed:</label>
    <input type="checkbox" id="taskCompleted" name="taskCompleted" ${task.completed ? 'checked' : ''}>

    <button type="submit">Update Task</button>
</form>

</body>
</html>
