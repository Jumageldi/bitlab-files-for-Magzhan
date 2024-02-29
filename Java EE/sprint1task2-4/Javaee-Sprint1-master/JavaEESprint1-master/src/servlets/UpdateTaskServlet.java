package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Tasks;
import db.DBManager;

import java.io.IOException;

@WebServlet("/updateTask")
public class UpdateTaskServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String deadlineDate = request.getParameter("deadlineDate");
        String completed = request.getParameter("completed");
        Tasks task = new Tasks();
        task.setId(Long.valueOf(id));
        task.setName(name);
        task.setDescription(description);
        task.setDeadlineDate(deadlineDate);
        task.setCompleted(Boolean.parseBoolean(completed));
        DBManager.updateTask(task);
        response.sendRedirect("/home");

    }
}
