package com.logistic.servlet;

import com.logistic.entity.Cargo_Location;
import com.logistic.entity.Country;
import com.logistic.entity.User;
import com.logistic.remote.Cargo_Location_Service;
import com.logistic.remote.CountyService;
import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/dashboard/cargo_location")
public class CargoLocationServlet extends HttpServlet {

    @EJB(lookup = "java:global/ear-1.0/com.logistic-web-1.0/Cargo_Location_ServiceBean")
    private Cargo_Location_Service cargoLocationService;
    @EJB(lookup = "java:global/ear-1.0/com.logistic-web-1.0/Country_ServiceBean")
    private CountyService countyService;

    private List<Country> countriesList;
    private List<Cargo_Location> cargoLocations ;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       if(countriesList == null){
           countriesList = countyService.getAllCountries();
       }
       cargoLocations = cargoLocationService.getAllLocation();
       request.setAttribute("countries", countriesList);
       request.setAttribute("locations",cargoLocations);
        request.getRequestDispatcher("/add_cargo_location.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String location_name = request.getParameter("location_name");
        String country_name = request.getParameter("country_name");
        String location_url = request.getParameter("location_url");
        Country country = countriesList.get(Integer.parseInt(country_name)-1);
        User user =(User) request.getSession().getAttribute("user");
        cargoLocationService.addLocation(location_name,location_url,country,user);
        doGet(request,response);

    }
}
