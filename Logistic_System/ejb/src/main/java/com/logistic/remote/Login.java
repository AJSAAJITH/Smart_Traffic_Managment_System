package com.logistic.remote;

import com.logistic.entity.User;
import jakarta.ejb.Remote;

@Remote
public interface Login {
    public User login(String email, String password);
}
