package Servlets;

import db.DBManager;
import db.Task;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(value = "/task-change")
public class ChangeTaskServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Long tId = Long.valueOf(req.getParameter("task_id"));
        String tName = req.getParameter("task_name");
        String tDescription = req.getParameter("task_description");
        String tDeadline = req.getParameter("task_deadline");
        String tStatus = req.getParameter("task_status");

        ArrayList<Task> tasks = DBManager.getAllTasks();
        Task task = new Task(tId, tName, tDescription, tDeadline, tStatus);
        tasks.set(Math.toIntExact(tId-1), task);

        resp.sendRedirect("/");
    }
}
