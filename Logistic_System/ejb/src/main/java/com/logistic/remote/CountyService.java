package com.logistic.remote;

import com.logistic.entity.Country;

import java.util.List;

public interface CountyService {
    public boolean addCountry(String name);
    public Country getCountry(String name);
    public List<Country> getAllCountries();
}
