package com.logistic.servlet;

import com.logistic.entity.Cargo_Location;
import com.logistic.entity.Route;
import com.logistic.entity.User;
import com.logistic.remote.Cargo_Location_Service;
import com.logistic.remote.RouteService;
import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/dashboard/route")
public class RouteServlet extends HttpServlet {

    @EJB(lookup = "java:global/ear-1.0/com.logistic-web-1.0/Cargo_Location_ServiceBean")
    private Cargo_Location_Service cargoLocationService;

    @EJB(lookup = "java:global/ear-1.0/com.logistic-web-1.0/RouteServiceBean")
    private RouteService routeService;

    private List<Cargo_Location>cargoLocationList;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        if(cargoLocationList == null){
            cargoLocationList = cargoLocationService.getAllLocation();
        }
        List<Route> routeList = routeService.getAllRoutes();
        req.setAttribute("cargoLocationList", cargoLocationList);
        req.setAttribute("routeList", routeList);
        req.getRequestDispatcher("/cargo_route.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String route_name = req.getParameter("route_name");
        String start_point = req.getParameter("start_country_name");
        String end_point = req.getParameter("end_country_name");
        String estimate_time = req.getParameter("estimated_time");
        String route_direction = req.getParameter("route_description");

        Cargo_Location start_location = cargoLocationList.get(Integer.parseInt(start_point)-1);
        Cargo_Location end_location = cargoLocationList.get(Integer.parseInt(end_point)-1);
        User user =(User) req.getSession().getAttribute("user");

        routeService.setRoute(route_name, start_location, end_location, user, Integer.parseInt(estimate_time), route_direction);

        doGet(req, resp);
    }
}
