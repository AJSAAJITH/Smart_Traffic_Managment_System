<%@ page import="com.logistic.entity.Country" %>
<%@ page import="java.util.List" %>
<%@ page import="com.logistic.entity.Cargo_Location" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 5/19/2024
  Time: 6:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Cargo Location</title>
<%--    <link href="css/bootstrap.css" rel="stylesheet"/>--%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<div class="container">
    <div class="row" style="margin-block: 100px">

        <!-- Cargo Location Details Header -->
        <div class="col-12">
            <div class="row">
                <div class="col-6">
                    <a class="text-black-50 mb-1 text-decoration-none" href="${pageContext.request.contextPath}/dashboard.jsp" style="font-size: 12px">Back To Admin Console</a>
                    <p class="text-uppercase m-0 p-0 fs-3 fw-bold text-dark">Cargo Locations</p>
                    <p class="text-black-50 mt-1" style="font-size: 12px">
                        Our Logistic Management System is a comprehensive solution designed to
                        streamline and optimize logistics operations for businesses of all sizes.
                        This robust system integrates various functionalities to manage shipments,
                        routes, employees, and customers efficiently. Built with a focus on
                        user-friendliness and scalability, it ensures that all logistic activities
                        are handled seamlessly from a single platform.
                    </p>
                    <p class="text-danger mt-1 alert alert-danger d-none" style="font-size: 11px">
                        Only SuperAdmins and Admins can activate a Location.
                        Users have no authority; the Location remains INACTIVE until acted upon by a SuperAdmin or
                        Admin.
                    </p>
                </div>
            </div>
        </div>
        <!-- Cargo Location Details Header -->

        <!-- Add New Cargo Location -->
        <div class="col-12" style="margin-top: 50px;">
            <div class="row">
                <div class="col-12">
                    <form action="${pageContext.request.contextPath}/dashboard/cargo_location" method="post">
                        <div class="row">
                            <div class="col-3 d-grid">
                                <input type="text" class="input-field" name="location_name" placeholder="Location Name">
                            </div>
                            <div class="col-2 d-grid">
                                <select class="input-field custom-select" name="country_name">
                                    <option value="0">Select Country</option>
                                    <% for (Country country : (List<Country>) request.getAttribute("countries")) {%>
                                    <option value="<%= country.getId() %>"><%= country.getName() %>
                                    </option>
                                    <%}%>

                                </select>
                            </div>
                            <div class="col-5 d-grid">
                                <input type="text" class="input-field" name="location_url" placeholder="Location URL">
                            </div>
                            <div class="col-2 d-grid">
                                <input type="submit" class="input-field" value="Save">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- Add New Cargo Location -->

        <!-- Created Cargo Locations -->
        <div class="col-12" style="margin-top: 50px;">
            <div class="row">
                <div class="col-12 d-grid">
                    <table>
                        <tr>
                            <th>Id</th>
                            <th>Name</th>
                            <th>Location URL</th>
                            <th>Country</th>
                            <th>A / I</th>
                        </tr>


                            <%for (Cargo_Location cargoLocation:(List<Cargo_Location>)request.getAttribute("locations")){%>
                        <tr>
                            <td><%=cargoLocation.getId()%></td>
                            <td><%=cargoLocation.getName()%></td>
                            <td><%=cargoLocation.getLocation()%></td>
                            <td><%=cargoLocation.getCountry().getName()%></td>
                            <td><%=cargoLocation.getStatus()%></td>
                        </tr>
                            <%}%>

                    </table>
                </div>
            </div>
        </div>
        <!-- Created Cargo Locations -->

    </div>
</div>

<style>
    .input-field {
        width: 100%;
        padding: 8px 14px;
        border: 1px solid rgb(240, 240, 240);
        border-radius: 3px;
        font-size: 14px;
        box-sizing: border-box;
        transition: border-color 0.3s ease;
    }

    .input-field:focus {
        outline: none;
        border-color: darkgray;
    }

    .input-field::placeholder {
        font-size: 13px;
        color: rgb(107, 107, 107);
    }

    .custom-select {
        background-position: right 20px center !important;
        padding-right: 10px;
        cursor: pointer;
        color: darkgray;
        font-size: 13px;
        background-color: white;
    }

    table {
        width: 100%;
        border-collapse: collapse;
    }

    table tr th {
        border: 1px solid rgb(240, 240, 240);
        text-align: center;
        padding: 8px 16px;
        font-size: 13px;
    }

    table tr td {
        border: 1px solid rgb(240, 240, 240);
        text-align: center;
        padding: 8px 16px;
        font-size: 13px;
    }


</style>
</body>
</html>
