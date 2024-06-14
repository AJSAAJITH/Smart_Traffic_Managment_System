package com.logistic.remote;

import com.logistic.entity.Cargo_Location;
import com.logistic.entity.Cargo_Shipment;
import com.logistic.entity.User;
import jakarta.ejb.Remote;

import java.util.Date;
import java.util.List;
@Remote
public interface CargoShipmentService {
public Cargo_Shipment createCargoShipment(
        String shipment_name,
        double weight,
        int quantity,
        String cargo_type,
        String special_note,
        Date start_date,
        int requested_shipping_duration,
        String priority_level,
        Cargo_Location start_location,
        Cargo_Location end_location,
        User user
);

public List<Cargo_Shipment> getAllCargoShipment();

}
