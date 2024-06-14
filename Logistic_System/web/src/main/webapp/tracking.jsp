<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Cargo Tracking</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<div class="container">
  <div class="row" style="margin-block: 100px">

    <!-- Cargo Tracking Details Header -->
    <div class="col-12">
      <div class="row">
        <div class="col-6">
          <a class="text-black-50 mb-1 text-decoration-none" href="${pageContext.request.contextPath}/dashboard.jsp" style="font-size: 12px">Back To Admin Console</a>
          <p class="text-uppercase m-0 p-0 fs-3 fw-bold text-dark">Cargo Tracking</p>
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
    <!-- Cargo Tracking Details Header -->

    <!-- Search Tracking Details -->
    <div class="col-12" style="margin-top: 50px;">
      <div class="row">
        <div class="col-12">
          <form action="${pageContext.request.contextPath}/dashboard/cargo_tracking" method="post">
            <div class="row">
              <div class="col-8 d-grid">
                <input type="text" class="input-field" name="tracking_id" placeholder="Tracking ID">
              </div>
              <div class="col-2 d-grid">
                <input type="submit" class="input-field" value="Search">
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
    <!-- Search Tracking Details -->

    <!-- Search Result -->
    <div class="col-12" style="margin-top: 50px;">
      <div class="row">
        <div class="col-12 d-grid">
          <table>
            <tr>
              <th>Id</th>
              <th>Name</th>
              <th>Quantity</th>
              <th>Type</th>
              <th>Status</th>
            </tr>
            <c:choose>
              <c:when test="${shipment != null}">
                <tr>
                  <td>${shipment.id}</td>
                  <td>${shipment.shipment_name}</td>
                  <td>${shipment.qty}</td>
                  <td>${shipment.cargo_shipping_type}</td>
                  <td>${shipment.shipment_status}</td>
                </tr>
              </c:when>
              <c:otherwise>
                <tr>
                  <td colspan="5">No shipment found for the provided tracking ID.</td>
                </tr>
              </c:otherwise>
            </c:choose>


          </table>
        </div>
      </div>
    </div>
    <!-- Search Result -->

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
