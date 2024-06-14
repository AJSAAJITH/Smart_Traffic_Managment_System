<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 5/16/2024
  Time: 2:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
if(request.getSession().getAttribute("user") != null){
    response.sendRedirect("dashboard.jsp");
}
%>
<html>
<head>
    <title>Logistic Login</title>
    <link href="css/bootstrap.css" rel="stylesheet"/>
</head>
<body>
<form action="login" method="post">
    <div class="container-fluid">
        <div class="row m-5">
            <div class="col-6 offset-3 mt-5">
                <div class="row p-2 border border-1 border-black rounded">
                    <div class="col-12 p-1">
                        <span class="fs-2">Login Your Account</span>
                    </div>
                    <div class="col-12 gap-2">
                        <span>Email:</span>
                        <input type="text" class="form-control" name="email"/>
                        <span>Password</span>
                        <input type="text" class="form-control" name="password"/>

                        <div class="row p-1 mt-2">
                            <div class="col-12 d-grid">
                                <input class="btn btn-primary" type="submit" value="Login"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-6 offset-3">
                        <a href="register.jsp" class="link-primary link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover">Register in here</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>

</body>
</html>
