package com.logistic.entity;

import jakarta.persistence.*;

import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "cargo_shipment")
public class Cargo_Shipment implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String shipment_name;
    private String shipment_tracking_id;
    private double weight;
    private int qty;
    private String cargo_shipping_type;
    private String special_note;
    private Date start_date;
    private int shipping_date_duration;
    private String priority_level;
    @ManyToOne
    private Cargo_Location start_location;
    @ManyToOne
    private Cargo_Location end_location;
    @ManyToOne
    private Route route;
    @ManyToOne
    private User user;
    private Date createDate;
    private String shipment_status;
    private String description;

    public Cargo_Shipment(){}

    public Cargo_Shipment(String shipment_name,
                          String shipment_tracking_id,
                          double weight,
                          int qty,
                          String cargo_shipping_type,
                          String special_note,
                          Date start_date,
                          int shipping_date_duration,
                          String priority_level,
                          Cargo_Location start_location,
                          Cargo_Location end_location,
                          User user,
                          String shipment_status) {

        this.shipment_name = shipment_name;
        this.shipment_tracking_id = shipment_tracking_id;
        this.weight = weight;
        this.qty = qty;
        this.cargo_shipping_type = cargo_shipping_type;
        this.special_note = special_note;
        this.start_date = start_date;
        this.shipping_date_duration = shipping_date_duration;
        this.priority_level = priority_level;
        this.start_location = start_location;
        this.end_location = end_location;
        this.user = user;
        this.createDate = new Date();
        this.shipment_status = shipment_status;

    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getShipment_name() {
        return shipment_name;
    }

    public void setShipment_name(String shipment_name) {
        this.shipment_name = shipment_name;
    }

    public String getShipment_tracking_id() {
        return shipment_tracking_id;
    }

    public void setShipment_tracking_id(String shipment_tracking_id) {
        this.shipment_tracking_id = shipment_tracking_id;
    }

    public double getWeight() {
        return weight;
    }

    public void setWeight(double weight) {
        this.weight = weight;
    }

    public int getQty() {
        return qty;
    }

    public void setQty(int qty) {
        this.qty = qty;
    }

    public String getCargo_shipping_type() {
        return cargo_shipping_type;
    }

    public void setCargo_shipping_type(String cargo_shipping_type) {
        this.cargo_shipping_type = cargo_shipping_type;
    }

    public String getSpecial_note() {
        return special_note;
    }

    public void setSpecial_note(String special_note) {
        this.special_note = special_note;
    }

    public Date getStart_date() {
        return start_date;
    }

    public void setStart_date(Date start_date) {
        this.start_date = start_date;
    }

    public int getShipping_date_duration() {
        return shipping_date_duration;
    }

    public void setShipping_date_duration(int shipping_date_duration) {
        this.shipping_date_duration = shipping_date_duration;
    }

    public String getPriority_level() {
        return priority_level;
    }

    public void setPriority_level(String priority_level) {
        this.priority_level = priority_level;
    }

    public Cargo_Location getStart_location() {
        return start_location;
    }

    public void setStart_location(Cargo_Location start_location) {
        this.start_location = start_location;
    }

    public Cargo_Location getEnd_location() {
        return end_location;
    }

    public void setEnd_location(Cargo_Location end_location) {
        this.end_location = end_location;
    }

    public Route getRoute() {
        return route;
    }

    public void setRoute(Route route) {
        this.route = route;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getShipment_status() {
        return shipment_status;
    }

    public void setShipment_status(String shipment_status) {
        this.shipment_status = shipment_status;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "Cargo_Shipment{" +
                "id=" + id +
                ", shipment_name='" + shipment_name + '\'' +
                ", shipment_tracking_id='" + shipment_tracking_id + '\'' +
                ", weight=" + weight +
                ", qty=" + qty +
                ", cargo_shipping_type='" + cargo_shipping_type + '\'' +
                ", special_note='" + special_note + '\'' +
                ", start_date=" + start_date +
                ", shipping_date_duration=" + shipping_date_duration +
                ", priority_level='" + priority_level + '\'' +
                ", start_location=" + start_location +
                ", end_location=" + end_location +
                ", route=" + route +
                ", user=" + user +
                ", shipment_status='" + shipment_status + '\'' +
                '}';
    }
}
