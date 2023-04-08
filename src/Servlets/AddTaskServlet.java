package Servlets;

import db.DBManager;
import db.Task;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/add-task")
public class AddTaskServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String taskName = req.getParameter("task_name");
        String taskDesc = req.getParameter("task_description");
        String taskDeadline = req.getParameter("task_deadline");

        Task task = new Task();
        task.setName(taskName);
        task.setDescription(taskDesc);
        task.setDeadlineDate(taskDeadline);
        task.setIsDone("No");

        DBManager.addTask(task);

        resp.sendRedirect("/");

    }
}
