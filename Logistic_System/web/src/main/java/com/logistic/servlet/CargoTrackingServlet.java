package com.logistic.servlet;

import com.logistic.entity.Cargo_Shipment;
import com.logistic.remote.CargoShipmentService;
import com.logistic.remote.CargoTrackingService;
import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/dashboard/cargo_tracking")
public class CargoTrackingServlet extends HttpServlet {
    @EJB(lookup = "java:global/ear-1.0/com.logistic-web-1.0/CargoTrackingServiceBean")
    private CargoTrackingService cargoTrackingService;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/tracking.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String trackingId = req.getParameter("tracking_id");
        Cargo_Shipment shipment = cargoTrackingService.searchShipment(trackingId);
        req.setAttribute("shipment",shipment);
        req.getRequestDispatcher("/tracking.jsp").forward(req,resp);

    }
}
