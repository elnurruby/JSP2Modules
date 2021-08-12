<%@ page import="com.company.bean.User" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: elnur
  Date: 8/1/2021
  Time: 2:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<link rel="stylesheet" href="assets/css/style.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
      integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://kit.fontawesome.com/6e7a194243.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>

<head>
    <script src="assets/js/index.js"></script>
    <title>user jsp</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>

    <%
        List<User> users = (List<User>) request.getAttribute("users");
        User userName = (User)session.getAttribute("loggedInUser");
    %>
    <div class="container">
        <a href="login" class="btn btn-info btn-lg log-out-button">
            <span class="glyphicon glyphicon-log-out"></span> Log out
        </a>
        <h2>Welcome, <%=userName.getName()%></h2>
        <div>
            <form action="users" method="GET">
                <div class="form-group">
                    <label for="name">name:</label>
                    <input type="text" name="name" value="" class="form-control">
                </div>
                <div class="form-group">
                    <label for="surname">surname:</label>
                    <input type="text" name="surname" value="" class="form-control">
                </div>
                <input type="submit" name="save" value="save" class="btn btn-primary">
            </form>
            <hr>
        </div>
        <div>
            <table class="table">
                <thead>
                <tr>
                    <th>name</th>
                    <th>surname</th>
                    <th>nationality</th>
                </tr>
                </thead>
                <tbody>
                <% for (User u : users) {
                %>
                <tr>
                    <td><%=u.getName()%>
                    </td>
                    <td><%=u.getSurname()%>
                    </td>
                    <td><%=u.getNationality() == null ? "N/A" : u.getNationality().getName()%>
                    </td>
                    <td>
                        <form action="users" method="post">
                            <input type="hidden" name="id" value="<%=u.getId()%>">
                            <button type="button" class="btn btn-danger" data-toggle="modal" name="action"
                                    value="delete"
                                    data-target="#exampleModal" onclick=setIDinModal('<%=u.getId()%>')>
                                <i class="fas fa-trash-alt"></i>
                            </button>
                        </form>

                        <form action="users" method="post">
                            <input type="hidden" name="id" value="<%=u.getId()%>">
                            <button class="btn btn-secondary" type="submit" value="update" name="action">
                                <i class="fas fa-pen-square"></i>
                            </button>
                        </form>
                        <button class="btn btn-info" type="submit" class="btn btn-outline-info" value="info"
                                name="action">
                            <i class="fas fa-info"></i>
                        </button>
                    </td>
                </tr>
                </tbody>
                <%}%>
            </table>
        </div>
    </div>
    <div>
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        Are you sure about deleting the data?
                    </div>
                    <div class="modal-footer">
                        <form action="users" method="post">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close
                            </button>
                            <input type="hidden" name="id" id="UserModalID" value="">
                            <button type="submit" class="btn btn-outline-danger" name="action" value="delete">Delete
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
