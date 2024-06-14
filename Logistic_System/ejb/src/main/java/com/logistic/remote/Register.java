package com.logistic.remote;

import jakarta.ejb.Remote;

@Remote
public interface Register {
public boolean register(String username, String email, String password, String userType);
}
