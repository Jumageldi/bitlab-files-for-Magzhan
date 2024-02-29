<%--
  Created by IntelliJ IDEA.
  User: Home
  Date: 02.02.2024
  Time: 23:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<button onclick="openModal()" type="button" class="btn btn-primary ">Открыть модальное окно</button>

<div id="myModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeModal()">&times;</span>
        <form method="post" action="/home">
            <div class="row">

                <div class="col">
                    <input type="text" class="form-control" placeholder="Наименование" aria-label="First name" name="name">
                </div>
                <div class="col">
                    <input type="text" class="form-control" placeholder="Описание" aria-label="Last name" name="description">
                </div>
                <div class="col">
                    <input type="date" class="form-control" placeholder="Дата" aria-label="Last name" name="deadlineDate">
                </div>
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
    </div>
</div>
</html>
