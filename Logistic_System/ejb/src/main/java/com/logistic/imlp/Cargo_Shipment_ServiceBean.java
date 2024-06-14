package com.logistic.imlp;

import com.logistic.entity.Cargo_Location;
import com.logistic.entity.Cargo_Shipment;
import com.logistic.entity.User;
import com.logistic.enums.ShipmentStatus;
import com.logistic.remote.CargoShipmentService;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

import java.util.Date;
import java.util.List;
import java.util.UUID;

@Stateless
public class Cargo_Shipment_ServiceBean implements CargoShipmentService {

    @PersistenceContext(unitName = "LogisticPU")
    private EntityManager em;
    @Override
    public Cargo_Shipment createCargoShipment(String shipment_name, double weight, int quantity, String cargo_type, String special_note, Date start_date, int requested_shipping_duration, String priority_level, Cargo_Location start_location, Cargo_Location end_location, User user) {
        UUID randomUUID = UUID.randomUUID();
        String tracking_id = randomUUID.toString();
        String shipping_status = ShipmentStatus.CREATED.name();
      Cargo_Shipment cargoShipment = new Cargo_Shipment(shipment_name,tracking_id,weight,quantity,cargo_type,special_note,start_date,requested_shipping_duration,priority_level,start_location,end_location,user,shipping_status);
       em.persist(cargoShipment);
        return cargoShipment;
    }

    @Override
    public List<Cargo_Shipment> getAllCargoShipment() {
        List<Cargo_Shipment> cargoShipments = em.createQuery("SELECT cs FROM Cargo_Shipment cs",Cargo_Shipment.class).getResultList();
        return cargoShipments;
    }
}
