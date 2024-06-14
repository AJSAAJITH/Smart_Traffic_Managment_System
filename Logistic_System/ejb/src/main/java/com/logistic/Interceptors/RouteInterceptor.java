package com.logistic.Interceptors;

import com.logistic.entity.Route;
import jakarta.annotation.PostConstruct;
import jakarta.annotation.PreDestroy;
import jakarta.interceptor.AroundInvoke;
import jakarta.interceptor.InvocationContext;

public class RouteInterceptor {
    @PostConstruct
    public void init(InvocationContext ic){
        System.out.println("Route Interceptor init...");
    }

    @AroundInvoke
    public Object intercept(InvocationContext ic) throws Exception {

        System.out.println("Route Interceptor around invoke...");

        // Proceed with the original method call
        Object result = ic.proceed();

        System.out.println("Route Interceptor after invoke...");
          // Applying the route optimization logic if the target method is 'setRoute'
        if(ic.getMethod().getName().equals("setRoute")&& result instanceof Route){
            Route route = (Route) result;
            optimizeRoute(route);
        }

        return result;
    }

    private void optimizeRoute(Route route) {
        // data for traffic condition
        String trafficCondition = "Heavy";

        if ("Heavy".equals(trafficCondition)) {
            route.setTime_duration(route.getTime_duration() + 2); // Adds 2 extra days
        } else if ("Moderate".equals(trafficCondition)) {
            route.setTime_duration(route.getTime_duration() + 1); // Adds 1 extra day
        }else{
            // else, no any change for light traffic...
        }

    }

    @PreDestroy
    public void destroy(InvocationContext ic){
        System.out.println("Route Interceptor destroy...");
    }
}
