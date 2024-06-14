package com.logistic.entity;

import com.logistic.enums.UserStatus;
import jakarta.persistence.*;

import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "route")
public class Route implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    @OneToOne
    private Cargo_Location start_point;
    @OneToOne
    private Cargo_Location end_point;
    @OneToOne
    private User user;
    private Date create_date;
    private String status;
    private int time_duration;
    private String route_condition;
    private String route_description;

    public Route(){}

    public Route( String name, Cargo_Location start_point, Cargo_Location end_point, User user, Date create_date, int time_duration, String route_description) {
        this.name = name;
        this.start_point = start_point;
        this.end_point = end_point;
        this.user = user;
        this.create_date = create_date;

        if(user.getUserType().equalsIgnoreCase("superadmin") || user.getUserType().equalsIgnoreCase("admin")){
            this.status = UserStatus.ACTIVE.toString();
        }else {
            this.status = UserStatus.INACTIVE.toString();
        }
        this.time_duration = time_duration;
        this.route_description = route_description;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Cargo_Location getStart_point() {
        return start_point;
    }

    public void setStart_point(Cargo_Location start_point) {
        this.start_point = start_point;
    }

    public Cargo_Location getEnd_point() {
        return end_point;
    }

    public void setEnd_point(Cargo_Location end_point) {
        this.end_point = end_point;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Date getCreate_date() {
        return create_date;
    }

    public void setCreate_date(Date create_date) {
        this.create_date = create_date;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getTime_duration() {
        return time_duration;
    }

    public void setTime_duration(int time_duration) {
        this.time_duration = time_duration;
    }

    public String getRoute_condition() {
        return route_condition;
    }

    public void setRoute_condition(String route_condition) {
        this.route_condition = route_condition;
    }

    public String getRoute_description() {
        return route_description;
    }

    public void setRoute_description(String route_description) {
        this.route_description = route_description;
    }

    @Override
    public String toString() {
        return "Route{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", start_point=" + start_point +
                ", end_point=" + end_point +
                ", user=" + user +
                ", create_date=" + create_date +
                ", status='" + status + '\'' +
                ", time_duration=" + time_duration +
                ", route_condition='" + route_condition + '\'' +
                ", route_description='" + route_description + '\'' +
                '}';
    }
}
