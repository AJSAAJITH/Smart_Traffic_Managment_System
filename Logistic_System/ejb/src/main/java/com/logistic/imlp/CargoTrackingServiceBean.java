package com.logistic.imlp;

import com.logistic.entity.Cargo_Shipment;
import com.logistic.exceptions.ResultNotFountException;
import com.logistic.remote.CargoTrackingService;
import jakarta.ejb.EJB;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

@Stateless
public class CargoTrackingServiceBean implements CargoTrackingService {
    @PersistenceContext(unitName = "LogisticPU")
    private EntityManager em;
    @Override
    public Cargo_Shipment searchShipment(String shipmentId) {
        try {
            return em.createQuery("SELECT cs FROM Cargo_Shipment cs WHERE cs.shipment_tracking_id=:shipmentId", Cargo_Shipment.class)
                    .setParameter("shipmentId",shipmentId)
                    .getSingleResult();
        }catch (Exception e){
            throw new ResultNotFountException("Can't Find any Shipping Details...");
        }

    }
}
