package com.logistic.remote;

import com.logistic.entity.Cargo_Location;
import com.logistic.entity.Country;
import com.logistic.entity.User;

import java.util.List;

public interface Cargo_Location_Service {
    public Cargo_Location addLocation(String name, String Location, Country country, User user);
    public Cargo_Location getLocation(String name, Country country);
    public List<Cargo_Location> getAllLocation();
}
