package Servlets;

import db.DBManager;
import db.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(value = "/details")
public class DetailServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int taskId = Integer.parseInt(req.getParameter("task_id")) - 1;
        Task task = DBManager.getTask((long) taskId);
        req.setAttribute("task", task);
        req.getRequestDispatcher("/detail.jsp").forward(req, resp);
    }
}
