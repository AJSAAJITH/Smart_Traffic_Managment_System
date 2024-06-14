<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.logistic.enums.Cargo_Type" %>
<%@ page import="java.util.List" %>
<%@ page import="com.logistic.enums.Priority_Level" %>
<%@ page import="com.logistic.entity.Cargo_Location" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 5/19/2024
  Time: 7:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
List<Cargo_Location> cargoLocationList = (List<Cargo_Location>) request.getAttribute("locations");
    request.setAttribute("shipmentReport",null);
%>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <title>New Shipment</title>
    <title>Cargo Shipment</title>
</head>
<body>
<div class="container">
    <div class="row" style="margin-block: 100px">

        <!-- Shipment Details Header -->
        <div class="col-12">
            <div class="row">
                <div class="col-6">
                    <a class="text-black-50 mb-1 text-decoration-none" href="${pageContext.request.contextPath}/dashboard.jsp" style="font-size: 12px">Back To Admin Console</a>
                    <p class="text-uppercase m-0 p-0 fs-3 fw-bold text-dark">Cargo Shipment</p>
                    <p class="text-black-50 mt-1" style="font-size: 12px">
                        Our Logistic Management System is a comprehensive solution designed to
                        streamline and optimize logistics operations for businesses of all sizes.
                        This robust system integrates various functionalities to manage shipments,
                        routes, employees, and customers efficiently. Built with a focus on
                        user-friendliness and scalability, it ensures that all logistic activities
                        are handled seamlessly from a single platform.
                    </p>
                </div>
            </div>
        </div>
        <!-- Shipment Details Header -->

        <!-- Generate New Shipment -->
        <div class="col-12" style="margin-top: 50px;">
            <div class="row">
                <div class="col-12">
                    <form action="${pageContext.request.contextPath}/dashboard/new_shipment" method="post">
                        <div class="row">
                            <div class="col-6 d-grid">
                                <input type="text" class="input-field" name="shipment_name" placeholder="Shipment Name">
                            </div>
                            <div class="col-3 d-grid">
                                <input type="number" name="shipment_weight" class="input-field" placeholder="Accept Weight ( KG )">
                            </div>
                            <div class="col-3 d-grid">
                                <input type="number" class="input-field" name="shipment_qty" placeholder="Quantity"/>
                            </div>
                            <div class="col-9 d-grid my-4">
                                <input type="text" class="input-field" name="shipment_special_note" placeholder="Special Note">
                            </div>
                            <div class="col-3 d-grid my-4">
                                <input type="date" class="input-field" name="shipment_start_date" placeholder="Start Date">
                            </div>
                            <div class="col-4 d-grid">
                                <select class="input-field custom-select" name="shipment_cargo_type">
                                    <option value="-1">Cargo Type</option>
                                    <%
                                        List<Cargo_Type> cargoTypes = Cargo_Type.getCargoTypes();
                                        if (cargoTypes != null) {
                                            for (Cargo_Type cargoType : cargoTypes) {
                                    %>
                                    <option value="<%= cargoType.name() %>"><%= cargoType.name() %></option>
                                    <%
                                            }
                                        }
                                    %>
                                </select>
                            </div>


                            <div class="col-4 d-grid">
                                <select class="input-field custom-select" name="shipment_start_location">
                                    <option value="-1">Start Location</option>
                                    <% for (Cargo_Location cargoLocation : cargoLocationList) {%>
                                    <option value="<%= cargoLocation.getId() %>"><%= cargoLocation.getName() %>
                                    </option>
                                    <%}%>
                                </select>
                            </div>
                            <div class="col-4 d-grid">
                                <select class="input-field custom-select" name="shipment_end_location">
                                    <option value="-1">End Location</option>
                                    <%
                                        for (Cargo_Location cargoLocation : cargoLocationList) {%>
                                    <option value="<%= cargoLocation.getId() %>"><%= cargoLocation.getName() %>
                                    </option>
                                    <%}%>
                                </select>
                            </div>
                            <div class="col-4 d-grid p-2">
                                <input type="text" class="input-field" name="shipment_request_estimated_days" placeholder="Estimate Days">
                            </div>
                            <div class="col-4 d-grid p-2">
                                <select class="input-field custom-select" name="shipment_priority_level">
                                    <option value="-1">Priority Level</option>
                                    <%
                                        List<Priority_Level> priorityLevels = Priority_Level.getAllPriorityLevel();
                                        if(priorityLevels != null){
                                            for (Priority_Level priorityLevel : priorityLevels) {%>
                                    <option value="<%= priorityLevel.name() %>"><%= priorityLevel.name() %>
                                    </option>
                                    <%}
                                        }
                                    %>
                                </select>
                            </div>
                            <div class="col-4 d-grid p-2">
                                <input type="submit" class="input-field btn btn-secondary" value="Create">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- Generate New Shipment -->

<%--        <c:if test="${shipmentReport != null}">--%>

<%--            <!-- Shipment Report & Add Button -->--%>

<%--            <div class="col-12 px-4">--%>
<%--                <div class="row">--%>

<%--                    <!-- Shipment Report -->--%>
<%--                    <div class="col-12" style="margin-top: 100px;">--%>
<%--                        <div class="row custom-background bg-light">--%>
<%--                            <div class="col-12">--%>
<%--                                <div class="row">--%>
<%--                                    <div class="col-7 d-grid">--%>
<%--                                        <p class="text-uppercase m-0 p-0 fs-4 fw-bold text-dark">Shipment Report ---%>
<%--                                            TSFDE2345</p>--%>
<%--                                        <p class="text-black-50 mt-1" style="font-size: 12px">--%>
<%--                                            Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero blanditiis--%>
<%--                                            maxime vero similique accusantium, amet ab tempora aliquam debitis quos--%>
<%--                                            corporis voluptas quas minima nam deserunt nihil perferendis officiis--%>
<%--                                            repellendus.--%>
<%--                                        </p>--%>
<%--                                    </div>--%>
<%--                                    <div class="col-5 d-grid"></div>--%>
<%--                                </div>--%>
<%--                                <div class="row mt-4">--%>
<%--                                    <div class="col-12 d-grid">--%>
<%--                                        <table>--%>
<%--                                            <tr>--%>
<%--                                                <td>Shipment ID</td>--%>
<%--                                                <td>TSFDE2345</td>--%>
<%--                                            </tr>--%>
<%--                                            <tr>--%>
<%--                                                <td>Shipment Name</td>--%>
<%--                                                <td>Nurdle-Red-TSFDE2345</td>--%>
<%--                                            </tr>--%>
<%--                                            <tr>--%>
<%--                                                <td>Weight (Tons)</td>--%>
<%--                                                <td>125</td>--%>
<%--                                            </tr>--%>
<%--                                            <tr>--%>
<%--                                                <td>Quantity</td>--%>
<%--                                                <td>01</td>--%>
<%--                                            </tr>--%>
<%--                                            <tr>--%>
<%--                                                <td>Cargo Type</td>--%>
<%--                                                <td>Special</td>--%>
<%--                                            </tr>--%>
<%--                                            <tr>--%>
<%--                                                <td>Start Date</td>--%>
<%--                                                <td>12 / 02 / 2024</td>--%>
<%--                                            </tr>--%>
<%--                                            <tr>--%>
<%--                                                <td>Shipping Duration ( Requested )</td>--%>
<%--                                                <td>04</td>--%>
<%--                                            </tr>--%>
<%--                                            <tr>--%>
<%--                                                <td>Priority Level</td>--%>
<%--                                                <td>URGENT</td>--%>
<%--                                            </tr>--%>
<%--                                            <tr>--%>
<%--                                                <td class="empty-cell" colspan="2"></td>--%>
<%--                                            </tr>--%>

<%--                                            <!-- Start Location -->--%>
<%--                                            <tr>--%>
<%--                                                <td>Start Location</td>--%>
<%--                                                <td class="p-0 m-0">--%>
<%--                                                    <div style="width: 100%;">--%>
<%--                                                        <table class="inner-table">--%>
<%--                                                            <tr>--%>
<%--                                                                <td>Name</td>--%>
<%--                                                                <td>India-IN-01 - India</td>--%>
<%--                                                            </tr>--%>
<%--                                                            <tr>--%>
<%--                                                                <td>Location</td>--%>
<%--                                                                <td>https://www.google.com/maps?q=20.5937,78.9629</td>--%>
<%--                                                            </tr>--%>
<%--                                                        </table>--%>
<%--                                                    </div>--%>
<%--                                                </td>--%>
<%--                                            </tr>--%>
<%--                                            <!-- Start Location -->--%>

<%--                                            <tr>--%>
<%--                                                <td class="empty-cell" colspan="2"></td>--%>
<%--                                            </tr>--%>

<%--                                            <!-- End Location -->--%>
<%--                                            <tr>--%>
<%--                                                <td>End Location</td>--%>
<%--                                                <td class="p-0 m-0">--%>
<%--                                                    <div style="width: 100%;">--%>
<%--                                                        <table class="inner-table">--%>
<%--                                                            <tr>--%>
<%--                                                                <td>Name</td>--%>
<%--                                                                <td>Pakistan-PK-02 - Pakistan</td>--%>
<%--                                                            </tr>--%>
<%--                                                            <tr>--%>
<%--                                                                <td>Location</td>--%>
<%--                                                                <td>https://www.google.com/maps?q=30.3753,69.3451</td>--%>
<%--                                                            </tr>--%>
<%--                                                        </table>--%>
<%--                                                    </div>--%>
<%--                                                </td>--%>
<%--                                            </tr>--%>
<%--                                            <!-- End Location -->--%>

<%--                                            <tr>--%>
<%--                                                <td class="empty-cell" colspan="2"></td>--%>
<%--                                            </tr>--%>

<%--                                            <!-- Route Details -->--%>
<%--                                            <tr>--%>
<%--                                                <td>Route</td>--%>
<%--                                                <!-- If there is a route -->--%>
<%--                                                <td class="p-0 m-0">--%>
<%--                                                    <div style="width: 100%;">--%>
<%--                                                        <table class="inner-table">--%>
<%--                                                            <tr>--%>
<%--                                                                <td>Name</td>--%>
<%--                                                                <td>US-NZ-URGENT-D7</td>--%>
<%--                                                            </tr>--%>
<%--                                                            <tr>--%>
<%--                                                                <td>Description</td>--%>
<%--                                                                <td>Starting from: United States-US-01 , USA. Ending at: New--%>
<%--                                                                    Zealand -NZ-01, New Zealand.--%>
<%--                                                                    Estimated Time - Duration: 7. Created by:--%>
<%--                                                                    testadmin@gmail.com (admin)--%>
<%--                                                                </td>--%>
<%--                                                            </tr>--%>
<%--                                                            <tr>--%>
<%--                                                                <td>Estimated Days</td>--%>
<%--                                                                <td>03</td>--%>
<%--                                                            </tr>--%>
<%--                                                        </table>--%>
<%--                                                    </div>--%>
<%--                                                </td>--%>
<%--                                                <!-- If there is a route -->--%>

<%--                                                <!-- No route found -->--%>
<%--                                                <td class="light-red-bg d-none">No route could be determined for the--%>
<%--                                                    shipment--%>
<%--                                                </td>--%>
<%--                                                <!-- No route found -->--%>
<%--                                            </tr>--%>
<%--                                            <!-- Route Details -->--%>

<%--                                            <tr>--%>
<%--                                                <td class="empty-cell" colspan="2"></td>--%>
<%--                                            </tr>--%>

<%--                                            <!-- Created User -->--%>
<%--                                            <tr>--%>
<%--                                                <td>Created By</td>--%>
<%--                                                <td>testadmin@gmail.com ( SuperAdmin )</td>--%>
<%--                                            </tr>--%>
<%--                                            <!-- Created User -->--%>

<%--                                        </table>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <!-- Shipment Report -->--%>

<%--                    <!-- Create Shipment Button -->--%>
<%--                    <div class="col-12 mt-5">--%>
<%--                        <div class="row">--%>
<%--                            <div class="offset-10 col-2 d-grid g-0">--%>
<%--                                <input type="submit" class="input-field" value="Add New Shipment">--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <!-- Create Shipment Button -->--%>

<%--                </div>--%>
<%--            </div>--%>

<%--            <!-- Shipment Report & Add Button -->--%>

<%--        </c:if>--%>


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

    .input-field[type="date"] {
        color: gray;
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

    table tr td:nth-child(1) {
        width: 30%;
    }

    table tr td:nth-child(2) {
        width: 70%;
    }

    table tr td {
        border: 1px solid rgb(245, 245, 245);
        text-align: start;
        padding: 8px 16px;
        font-size: 13px;
    }

    /* Inner Table */

    .inner-table {
        width: 100%;
        border-collapse: collapse;
    }


    .inner-table tr td:nth-child(2) {
        width: 75%;
    }

    .inner-table tr td {
        text-align: start;
        padding: 8px 16px;
        font-size: 13px;
        border-top: 1px solid rgb(245, 245, 245) !important;

    }

    .inner-table tr:nth-child(1) td {
        border: none !important;
    }

    .inner-table tr td:nth-child(1) {
        width: 25%;
        border-right: 1px solid rgb(245, 245, 245) !important;
    }

    /* Inner Table */


    .custom-background {
        background: url("./assets/base-bg.png") no-repeat center center;
        background-size: cover;
        padding: 60px 60px 70px 60px;
    }

    .custom-tabel-cell {
        margin: 0 !important;
        padding: 8px 16px;
    }

    .empty-cell {
        height: 40px;
        border: none !important;
    }

    .border-btm-1 {
        border-bottom: 1px solid rgb(245, 245, 245);
    }

    .light-red-bg {
        background-color: rgb(255, 215, 215);
        color: rgb(153, 15, 15);
        padding: 18px;
    }

</style>

</body>
</html>
