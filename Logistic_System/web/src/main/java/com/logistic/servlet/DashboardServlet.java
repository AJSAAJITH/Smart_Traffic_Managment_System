package com.logistic.servlet;

import com.logistic.entity.Cargo_Shipment;
import com.logistic.remote.CargoShipmentService;
import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {
    @EJB(lookup = "java:global/ear-1.0/com.logistic-web-1.0/Cargo_Shipment_ServiceBean")
    private CargoShipmentService cargoShipmentService;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        List<Cargo_Shipment> cargoShipments = cargoShipmentService.getAllCargoShipment();
        req.setAttribute("shipment",cargoShipments);
        System.out.println("request accepts");
        req.getRequestDispatcher("/dashboard.jsp").forward(req,resp);
    }
}

