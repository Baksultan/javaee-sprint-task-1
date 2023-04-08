<%@ page import="db.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%Task task = (Task) request.getAttribute("task");%>

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

            <form action="/task-change" method="post">

                <input type="hidden" name="task_id" value="<%=task.getId()%>">

                <div class="row">
                    <div class="col-12">
                        <label>Task name: </label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <input type="text" class="form-control" name="task_name" value="<%=task.getName()%>">
                    </div>
                </div>

                <div class="row mt-3">
                    <div class="col-12">
                        <label>Description: </label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <textarea rows="4" cols="50" class="form-control" name="task_description"><%=task.getDescription()%></textarea>
                    </div>
                </div>

                <div class="row mt-3">
                    <div class="col-12">
                        <label>Deadline: </label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <input type="date" class="form-control" name="task_deadline" value="<%=task.getDeadlineDate()%>">
                    </div>
                </div>

                <div class="row mt-3">
                    <div class="col-12">
                        <label>Done: </label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <select class="form-select" name="task_status">
                            <option><%=task.getIsDone()%></option>
                            <option><%if (task.getIsDone().equals("Yes")) {
                                out.print("No");
                            } else {
                                out.print("Yes");
                            }%></option>
                        </select>
                    </div>
                </div>

                <div class="row mt-3">
                    <div class="col-12">
                        <button class="btn btn-success btn-sm" style="width: 100px">Save</button>
                    </div>
                </div>

            </form>

            <!-- Button trigger modal -->
            <button type="button" class="btn btn-danger btn-sm" style="width: 100px" data-bs-toggle="modal" data-bs-target="#deleteTask">
                Delete
            </button>

            <!-- Modal -->
            <div class="modal fade" id="deleteTask" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="/task-delete" method="post">
                            <input type="hidden" name="task_id" value="<%=task.getId()%>">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="staticBackdropLabel">Modal title</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <h3 class="text-center">Are you sure?</h3>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">NO</button>
                                <button type="submit" class="btn btn-danger">YES</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>


        </div>
    </div>

</div>



</body>
</html>