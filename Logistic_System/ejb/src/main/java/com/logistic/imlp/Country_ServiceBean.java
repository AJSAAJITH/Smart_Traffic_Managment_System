package com.logistic.imlp;

import com.logistic.entity.Country;
import com.logistic.remote.CountyService;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

import java.util.List;
@Stateless
public class Country_ServiceBean implements CountyService {

    @PersistenceContext(unitName = "LogisticPU")
    private EntityManager em;

    @Override
    public boolean addCountry(String name) {
        return false;
    }

    @Override
    public Country getCountry(String name) {
        return null;
    }

    @Override
    public List<Country> getAllCountries() {
        List<Country> countries;
        countries = em.createQuery("SELECT c FROM Country c", Country.class).getResultList();
        return countries;
    }
}
