<%@ page import="model.Tasks" %>
<%@ page import="db.DBManager" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: Home
  Date: 03.02.2024
  Time: 20:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="head.jsp"%>
</head>
<body>
    <%@include file="header.jsp"%>
    <div class="row" style="width:1200px; margin:0 auto">
    <% Tasks taskDetails = (Tasks) request.getAttribute("taskDetails"); %>

    <div class="mb-3">
        <label for="NameControl" class="form-label">Наименование:</label>
        <input type="text" class="form-control" id="NameControl" placeholder="<%= taskDetails.getName() %>"
               disabled readonly>
    </div>

    <div class="mb-3">
        <label for="DescriprionControl" class="form-label">Описание:</label>
        <textarea class="form-control" id="DescriprionControl" rows="3" disabled readonly><%= taskDetails.getDescription() %></textarea>
    </div>

    <div class="mb-3">
        <label for="StatusControl" class="form-label">Статус выполнения:</label>
        <input type="text" class="form-control" id="StatusControl" placeholder="<%= taskDetails.isCompleted() ? "Да" : "Нет" %>"
               disabled readonly>
    </div>
    <div class="mb-3">
        <label for="DateControl" class="form-label">Дедлайн:</label>
        <input type="text" class="form-control" id="DateControl" placeholder="<%= taskDetails.getDeadlineDate() %>"
               disabled readonly>
    </div>



        <div class="page-wrapper">
            <a class="btn trigger" href="editTask.jsp?id=<%= taskDetails.getId() %>">Edit Task</a>
        </div>

        <div style="display: flex">
            <div>
                <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    DELETE
                </button>
            </div>
            <div style="margin-left: 10px">
                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal1">
                    UPDATE
                </button>
            </div>
        </div>



        <!-- Modal for button DELETE-->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form action="/home" method="post">
                        <div class="modal-body">
                            <input type="hidden" name="id" value="<%=taskDetails.getId()%>">
                            <h1 style="text-align: center">ARE YOU SURE?</h1>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">NO</button>
                            <button type="submit" class="btn btn-primary">YES</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>


        <!-- Modal for button UPDATE-->
        <div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel1" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel1">Modal title</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form action="/updateTask" method="post">
                        <div class="modal-body">
                            <div class="mb-3">
                                <input type="hidden" name="id" value="<%=taskDetails.getId()%>">
                                <label for="TaskName" class="form-label">Название:</label>
                                <input name="name" value="<%=taskDetails.getName()%>" type="text" class="form-control"
                                       id="TaskName" aria-describedby="emailHelp">
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="description" class="form-label">Описание:</label>
                            <input name="description" value="<%=taskDetails.getDescription()%>" type="text" class="form-control"
                                   id="description" aria-describedby="emailHelp">
                        </div>

                        <div class="mb-3">
                            <label for="Status" class="form-label">Статус выполнения:</label>
                            <input name="completed" value="<%= taskDetails.isCompleted() ? "Да" : "Нет" %>" type="text" class="form-control"
                                   id="Status" aria-describedby="emailHelp">
                        </div>

                        <div class="mb-3">
                            <label for="Deadline" class="form-label">Дедлайн:</label>
                            <input name="deadlineDate" value="<%= taskDetails.getDeadlineDate() %>" type="text" class="form-control"
                                   id="Deadline" aria-describedby="emailHelp">
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary">Save changes</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

    </div>
    <%@include file="scripts.jsp"%>
</body>
</html>
