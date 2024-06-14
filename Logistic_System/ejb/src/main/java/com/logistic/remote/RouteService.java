package com.logistic.remote;

import com.logistic.entity.Cargo_Location;
import com.logistic.entity.Route;
import com.logistic.entity.User;
import jakarta.ejb.Remote;

import java.util.List;
@Remote
public interface RouteService {
    public List<Route> getRoutes(Cargo_Location startLoc, Cargo_Location endLoc, int estimatedTime);
    public List<Route> getRoutes(Cargo_Location startLoc,Cargo_Location endLoc);
    public Route setRoute(String routeName, Cargo_Location startLoc, Cargo_Location endLoc, User user, int estimatedTime, String RouteDirection);
    public List<Route> getAllRoutes();
}
