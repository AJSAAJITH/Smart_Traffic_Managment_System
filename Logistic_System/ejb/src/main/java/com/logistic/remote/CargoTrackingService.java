package com.logistic.remote;

import com.logistic.entity.Cargo_Shipment;
import jakarta.ejb.Remote;

@Remote
public interface CargoTrackingService {
    public Cargo_Shipment searchShipment(String shipmentId);
}
