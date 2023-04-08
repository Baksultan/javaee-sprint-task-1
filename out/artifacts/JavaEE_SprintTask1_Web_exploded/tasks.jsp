<%@ page import="db.Task" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/css/bootstrap.css">
    <script type="text/javascript" src="/js/bootstrap.bundle.js"></script>
</head>



<body>

    <%@include file="navbar.jsp"%>

    <div class="container">



        <div class="row mt-3">
            <div class="col-12">
                <!-- Button trigger modal -->
                <button type="button" class="btn btn-primary btn-sm" style="background-color: #1F1A62" data-bs-toggle="modal" data-bs-target="#addTask">
                    + Add Task
                </button>

                <!-- Modal -->
                <div class="modal fade" id="addTask" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                        <form action="add-task" method="post">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="staticBackdropLabel">Modal title</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-12">
                                        <label>Task name: </label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-12">
                                        <input type="text" class="form-control" name="task_name">
                                    </div>
                                </div>

                                <div class="row mt-3">
                                    <div class="col-12">
                                        <label>Description: </label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-12">
                                        <input type="text" class="form-control" name="task_description">
                                    </div>
                                </div>

                                <div class="row mt-3">
                                    <div class="col-12">
                                        <label>Deadline: </label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-12">
                                        <input type="date" class="form-control" name="task_deadline">
                                    </div>
                                </div>

                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                <button type="submit" class="btn btn-primary">ADD</button>
                            </div>
                        </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <div class="row mt-5">
            <hr style="margin-top: -28px;">
            <div class="col-12">
                <table class="table table-hover" style="margin-top: -12px">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Task name</th>
                        <th>Deadline</th>
                        <th>Done</th>
                        <th>Details</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        ArrayList<Task> tasks = (ArrayList<Task>) request.getAttribute("tasks");
                        if (tasks!=null) {
                            for (Task task: tasks) {
                    %>
                    <form action="details" method="post">
                    <tr>
                        <td><%=task.getId()%></td>
                        <td><%=task.getName()%></td>
                        <td><%=task.getDeadlineDate()%></td>
                        <td><%=task.getIsDone()%></td>
                        <input type="hidden" name="task_id" value="<%=task.getId()%>">
                        <td><button class="btn btn-primary btn-sm" style="background-color: #1F1A62">Details</button></td>
                    </tr>
                    </form>

                    <%
                            }
                        }
                    %>

                    </tbody>
                </table>
            </div>
        </div>



    </div>


</body>
</html>
