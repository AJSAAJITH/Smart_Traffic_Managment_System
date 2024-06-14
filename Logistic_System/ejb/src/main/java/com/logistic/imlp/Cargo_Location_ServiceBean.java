package com.logistic.imlp;

import com.logistic.entity.Cargo_Location;
import com.logistic.entity.Country;
import com.logistic.entity.User;
import com.logistic.remote.Cargo_Location_Service;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

import java.util.Date;
import java.util.List;
@Stateless
public class Cargo_Location_ServiceBean implements Cargo_Location_Service {

    @PersistenceContext(unitName = "LogisticPU")
    private EntityManager em;


    @Override
    public Cargo_Location addLocation(String name, String Location, Country country, User user) {
        Cargo_Location cargoLocation = new Cargo_Location(name,Location,country,new Date(),user);
        em.persist(cargoLocation);
        return cargoLocation;
    }

    @Override
    public Cargo_Location getLocation(String name, Country country) {
        return null;
    }

    @Override
    public List<Cargo_Location> getAllLocation() {
     List<Cargo_Location> cargoLocationList;
     cargoLocationList = em.createQuery("SELECT cls FROM Cargo_Location cls", Cargo_Location.class).getResultList();
        return cargoLocationList;
    }
}
