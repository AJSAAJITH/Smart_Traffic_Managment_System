<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.logistic.entity.User"%>
<%@ page import="java.util.List" %>
<%@ page import="com.logistic.entity.Cargo_Shipment" %>
<html>
<head>
    <title>Dashboard</title>
    <link href="css/bootstrap.css" rel="stylesheet"/>
</head>
<body>
<%
    User user = null;
    String userType = "";
    if(request.getSession().getAttribute("user") != null){
        user =(User) request.getSession().getAttribute("user");
        userType = user.getUserType();
    }
    List<Cargo_Shipment> allShipmentCargo = (List<Cargo_Shipment>) request.getAttribute("shipment");
    request.setAttribute("userType", userType);
    request.setAttribute("AllShipmentCargo",allShipmentCargo);
%>
<div class="container border border-start border-end border-1 shadow-lg">
    <div class="row p-2" style="margin-block: 5px">

    <%--        Header --%>
        <div class="col-12 sticky-top mb-3" style="background: #DCDCDC">
            <div class="row">
                <div class="col-12 p-2">
                    <p class="text-uppercase m-0 p-0 fw-bold text-black-50 text-end" style="font-size: 14px;"><%= userType%></p>
                </div>
            </div>
        </div>
    <%--        Header --%>

        <!-- Logged User Details -->
        <div class="col-12">
            <div class="row">
                <div class="col-5 d-grid">

                    <a class="fw-bold text-uppercase m-0 p-0 text-decoration-none text-dark fs-2" href="">Hello <%= user.getEmail()%>,</a>
                    <p class="text-black-50 mt-2" style="font-size: 14px">
                        Our Logistic Management System is a comprehensive solution designed to
                        streamline and optimize logistics operations for businesses of all sizes.
                        This robust system integrates various functionalities to manage shipments,
                        routes, employees, and customers efficiently. Built with a focus on
                        user-friendliness and scalability, it ensures that all logistic activities
                        are handled seamlessly from a single platform.
                    </p>
                </div>
                <div class="col-7 my-auto">
                    <div class="row">
                        <div class="offset-2 col-10">
                            <div class="row">
                                <div class="col-12 p-2">
                                    <div class="row p-2">
                                        <div class="col-12">
                                            <h6 class="text-black p-0 m-0" style="font-size: 18px;">Availability</h6>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-4 ps-5">
                                    <div class="row bg-light p-4" style="border-radius: 10px;">
                                        <div class="col-12 text-end">
                                            <h6 class="text-black-50 p-0 m-0" style="font-size: 14px;">Locations</h6>
                                            <h2 class="fw-bold p-0 m-0">10</h2>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-4 ps-5">
                                    <div class="row bg-light p-4" style="border-radius: 10px;">
                                        <div class="col-12 text-end">
                                            <h6 class="text-black-50 p-0 m-0" style="font-size: 14px;">Users</h6>
                                            <h2 class="fw-bold p-0 m-0">05</h2>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-4 ps-5">
                                    <div class="row bg-light p-4" style="border-radius: 10px;">
                                        <div class="col-12 text-end">
                                            <h6 class="text-black-50 p-0 m-0" style="font-size: 14px;">Shipments</h6>
                                            <h2 class="fw-bold p-0 m-0">10</h2>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Logged User Details -->

        <div class="text-black-50">
            <hr>
        </div>

        <!-- Button Group -->
        <div class="col-12" style="margin-top: 50px;">
            <div class="row">
                <div class="col-12">
                    <!-- All Of Them -->
                    <div class="row">
                        <div class="col-3 pe-5">
                            <div class="row py-3 bg-light px-3 card-background">
                                <a class="col-12 fw-bold text-center text-uppercase text-decoration-none text-dark" href="${pageContext.request.contextPath}/dashboard/cargo_location" style="font-size: 13px; ">New Location</a>
                            </div>
                        </div>
                        <div class="col-3 pe-5">
                            <div class="row py-3 bg-light px-3 card-background">
                                <a class="col-12 fw-bold text-center text-uppercase text-decoration-none text-dark" href="${pageContext.request.contextPath}/dashboard/new_shipment" style="font-size: 13px; ">New Shipment</a>
                            </div>
                        </div>
                        <div class="col-3 pe-5">
                            <div class="row py-3 bg-light px-3 card-background">
                                <div class="col-12 fw-bold text-center text-uppercase" style="font-size: 13px;">Current Shipments</div>
                            </div>
                        </div>
                        <div class="col-3">
                            <div class="row py-3 bg-light px-3 card-background">
                                <div class="col-12 fw-bold text-center text-uppercase" style="font-size: 13px;">Completed Shipments</div>
                            </div>
                        </div>
                        <div class="col-3 pe-5 mt-4">
                            <div class="row py-3 bg-light px-3 card-background">
                                <a class="col-12 fw-bold text-center text-uppercase text-decoration-none text-dark" href="${pageContext.request.contextPath}/dashboard/cargo_tracking" style="font-size: 13px; ">Track Shipment</a>
                            </div>
                        </div>
                    </div>
                    <!-- All Of Them -->

                    <c:if test="${userType == 'superadmin' || userType == 'admin'}">
                        <!-- Super Admin Only  -->
                        <div class="row mt-4">
                            <div class="col-3 pe-5" style="cursor: pointer">
                                <div class="row py-3 bg-light px-3 card-background" style="border-radius: 10px;">
                                    <a href="${pageContext.request.contextPath}/dashboard/route" class="col-12 fw-bold text-center text-uppercase text-decoration-none text-dark" style="font-size: 13px;">New Route</a>
                                </div>
                            </div>
                            <div class="col-3 pe-5">
                                <div class="row py-3 bg-light px-3 card-background" style="border-radius: 10px;">
                                    <div class="col-12 fw-bold text-center text-uppercase" style="font-size: 13px;">Approve Locations</div>
                                </div>
                            </div>
                            <div class="col-3 pe-5">
                                <div class="row py-3 bg-light px-3 card-background" style="border-radius: 10px;">
                                    <div class="col-12 fw-bold text-center text-uppercase" style="font-size: 13px;">Approve Shipments</div>
                                </div>
                            </div>
                        </div>
                        <!-- Super Admin Only  -->
                    </c:if>

                </div>
            </div>
        </div>
        <!-- Button Group -->.

        <div class="text-black-50">
            <hr>
        </div>

        <!-- Current Need Shipment -->
        <div class="col-12" style="margin-top: 100px;">
            <div class="row">
                <div class="col-6">
                    <p class="text-uppercase m-0 p-0 fs-4 fw-bold text-dark">Available Shipments</p>
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
            <div class="row mt-4">
                <div class="col-12 d-grid">
                    <table class="mb-4">
                        <tr>
                            <th>Id</th>
                            <th>Tracking Id</th>
                            <th>Name</th>
                            <th>Start</th>
                            <th>End</th>
                            <th>Start Date</th>
                            <th>ES Days</th>
                            <th>Priority</th>
                            <th>Route</th>
                            <th>Status</th>
                        </tr>
                        <c:forEach var="shipmentCargo" items="${AllShipmentCargo}">
                            <tr>
                                <td>${shipmentCargo.id}</td>
                                <td class="${shipmentCargo.shipment_status == 'CREATED' ? 'alert-primary' : shipmentCargo.shipment_status == 'ONGOING' ? 'alert-warning' : shipmentCargo.shipment_status == 'PAUSED' ? 'alert-danger' : shipmentCargo.shipment_status == 'COMPLETED' ? 'alert-success' : ''}">
                                        ${shipmentCargo.shipment_tracking_id}
                                </td>
                                <td>${shipmentCargo.shipment_name}</td>
                                <td>${shipmentCargo.start_location.name}</td>
                                <td>${shipmentCargo.end_location.name}</td>
                                <td>${shipmentCargo.start_date}</td>
                                <td>${shipmentCargo.shipping_date_duration}</td>
                                <td>${shipmentCargo.priority_level}</td>
                                <td>${shipmentCargo.route.name}</td>
                                <td class="${shipmentCargo.shipment_status == 'CREATED' ? 'alert-primary' : shipmentCargo.shipment_status == 'ONGOING' ? 'alert-warning' : shipmentCargo.shipment_status == 'PAUSED' ? 'alert-danger' : shipmentCargo.shipment_status == 'COMPLETED' ? 'alert-success' : ''}">
                                        ${shipmentCargo.shipment_status}
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
        </div>
        <!-- Current Need Shipment -->


    </div>
</div>

<style>
    .card-background{
        border-radius: 10px;
    }
    .card-background:hover{
        background-color: rgb(230, 230, 230) !important;
    }

    table{
        width: 100%;
        border-collapse: collapse;
    }

    table tr th{
        border: 1px solid rgb(240, 240, 240);
        text-align: center;
        padding: 8px 16px;
        font-size: 13px;
    }
    table tr td{
        border: 1px solid rgb(240, 240, 240);
        text-align: center;
        padding: 8px 16px;
        font-size: 13px;
    }

</style>
</body>
</html>
