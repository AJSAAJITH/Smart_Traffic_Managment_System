<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 5/16/2024
  Time: 1:41 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register</title>
    <link href="css/bootstrap.css" rel="stylesheet"/>
</head>
<body>
<form action="register" method="post">
<div class="container-fluid">
    <div class="row m-5 mt-5">
        <div class="col-6 offset-3 border border-1 border-black rounded">
            <div class="row">
                <div class="col-12 p-5">
                    <div class="row gap-2">
                        <div class="12">
                            <span>Username:</span>
                            <input type="text" class="form-control" name="username"/>
                        </div>

                        <div class="12">
                            <span>Email:</span>
                            <input type="text" class="form-control" name="email"/>
                        </div>

                        <div class="12">
                            <span>Password:</span>
                            <input type="text" class="form-control" name="password"/>
                        </div>

                        <div class="12">
                            <span>UserType:</span>
                            <select class="form-select" aria-label="Default select example" name="role">
                                <option selected>Open this select menu</option>
                                <option value="superadmin">Superadmin</option>
                                <option value="admin">Admin</option>
                                <option value="user">User</option>
                            </select>
                        </div>

                        <div class="12 d-grid">
                                <input class="btn btn-primary" type="submit" value="Register"/>
                        </div>

                        <div class="col-6 offset-3">
                            <a href="index.jsp" class="link-primary link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover">Login in here</a>
                        </div>

                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
</form>
</body>
</html>
