package servlets;

import db.DBManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Tasks;

import java.io.IOException;
import java.util.List;

@WebServlet("/details")
public class DetailsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

            Long taskId = Long.parseLong(request.getParameter("id"));
            Tasks task = DBManager.getTask(taskId);
            request.setAttribute("taskDetails", task);
            request.getRequestDispatcher("details.jsp").forward(request, response);

    }
}
