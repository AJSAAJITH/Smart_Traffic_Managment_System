package com.logistic.servlet;

import com.logistic.entity.Cargo_Location;
import com.logistic.entity.Cargo_Shipment;
import com.logistic.entity.User;
import com.logistic.remote.CargoShipmentService;
import com.logistic.remote.Cargo_Location_Service;
import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet("/dashboard/new_shipment")
public class CargoShipmentServlet extends HttpServlet {

    @EJB(lookup = "java:global/ear-1.0/com.logistic-web-1.0/Cargo_Location_ServiceBean")
    private Cargo_Location_Service cargoLocationService;

    @EJB(lookup = "java:global/ear-1.0/com.logistic-web-1.0/Cargo_Shipment_ServiceBean")
    private CargoShipmentService cargoShipmentService;

    private List<Cargo_Location> cargoLocations;

SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(cargoLocations == null){
            cargoLocations = cargoLocationService.getAllLocation();
        }
        request.setAttribute("locations",cargoLocations);
        request.getRequestDispatcher("/new_shipment.jsp").forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String shipment_name = request.getParameter("shipment_name");
        double shipment_weight = Double.parseDouble(request.getParameter("shipment_weight"));
        int shipment_qty = Integer.parseInt(request.getParameter("shipment_qty"));
        String shipment_special_note = request.getParameter("shipment_special_note");
        String shipment_start_date = request.getParameter("shipment_start_date");
        String shipment_cargo_type = request.getParameter("shipment_cargo_type");
        int shipment_start_location = Integer.parseInt(request.getParameter("shipment_start_location"));
        int shipment_end_location = Integer.parseInt(request.getParameter("shipment_end_location"));
        int shipment_request_estimated_days = Integer.parseInt(request.getParameter("shipment_request_estimated_days"));
        String shipment_priority_level = request.getParameter("shipment_priority_level");

        List<Cargo_Location> location = cargoLocationService.getAllLocation();
        Cargo_Location start_loc = location.get(shipment_start_location - 1);
        Cargo_Location end_loc = location.get(shipment_end_location - 1);
        Date shipment_date;
        try {
            shipment_date = sdf.parse(shipment_start_date);
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }

        User user = (User) request.getSession().getAttribute("user");

        Cargo_Shipment createShipment = cargoShipmentService.createCargoShipment(shipment_name, shipment_weight, shipment_qty, shipment_cargo_type, shipment_special_note, shipment_date,shipment_request_estimated_days,shipment_priority_level,start_loc,end_loc,user);

        doGet(request, response);

    }
}
