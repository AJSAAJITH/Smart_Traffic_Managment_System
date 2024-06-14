package com.logistic.imlp;

import com.logistic.Interceptors.RouteInterceptor;
import com.logistic.entity.Cargo_Location;
import com.logistic.entity.Route;
import com.logistic.entity.User;
import com.logistic.remote.RouteService;
import jakarta.ejb.Stateless;
import jakarta.interceptor.Interceptors;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

import java.util.Date;
import java.util.List;
@Stateless
@Interceptors(RouteInterceptor.class)
public class RouteServiceBean implements RouteService {

    @PersistenceContext(unitName = "LogisticPU")
    private EntityManager em;


    @Override
    public List<Route> getRoutes(Cargo_Location startLoc, Cargo_Location endLoc, int estimatedTime) {
        return em.createQuery("SELECT r FROM Route r WHERE r.start_point=:startLoc AND r.end_point=:endLoc AND r.time_duration=:estimatedTime", Route.class)
                .setParameter("start_point",startLoc)
                .setParameter("end_point",endLoc)
                .setParameter("time_duration",estimatedTime)
                .getResultList();
    }

    @Override
    public List<Route> getRoutes(Cargo_Location startLoc, Cargo_Location endLoc) {
        return em.createQuery("SELECT r FROM Route r WHERE r.start_point=:startLoc AND r.end_point=:endLoc", Route.class)
                .setParameter("start_point",startLoc)
                .setParameter("end_point",endLoc)
                .getResultList();
    }

    @Override
    public Route setRoute(String routeName, Cargo_Location startLoc, Cargo_Location endLoc, User user, int estimatedTime, String RouteDirection) {
        Route route = new Route(routeName, startLoc, endLoc,user, new Date(), estimatedTime, RouteDirection);
        em.persist(route);
        return route;
    }

    @Override
    public List<Route> getAllRoutes() {
        List<Route> routes;
        routes = em.createQuery("SELECT r FROM Route r", Route.class).getResultList();
        return routes;
    }
}
