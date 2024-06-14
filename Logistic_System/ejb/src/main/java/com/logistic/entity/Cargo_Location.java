package com.logistic.entity;

import com.logistic.enums.UserStatus;
import jakarta.persistence.*;

import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "cargo_location")
public class Cargo_Location  implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    private String location;
    @ManyToOne
    private Country country;
    private Date create_date;
    @ManyToOne
    private User user;
    private String description;
    private String status;

    public Cargo_Location(){}

    public Cargo_Location(String name, String location, Country country, Date create_date, User user) {
        this.name = name;
        this.location = location;
        this.country = country;
        this.create_date = create_date;
        this.user = user;
        if(user.getUserType().equalsIgnoreCase("superadmin") || user.getUserType().equalsIgnoreCase("admin")){
            this.status = UserStatus.ACTIVE.toString();
        }else {
            this.status = UserStatus.INACTIVE.toString();
        }

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

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public Country getCountry() {
        return country;
    }

    public void setCountry(Country country) {
        this.country = country;
    }

    public Date getCreate_date() {
        return create_date;
    }

    public void setCreate_date(Date create_date) {
        this.create_date = create_date;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Cargo_Location{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", location='" + location + '\'' +
                ", country=" + country +
                ", create_date=" + create_date +
                ", user=" + user +
                ", description='" + description + '\'' +
                ", status='" + status + '\'' +
                '}';
    }
}
