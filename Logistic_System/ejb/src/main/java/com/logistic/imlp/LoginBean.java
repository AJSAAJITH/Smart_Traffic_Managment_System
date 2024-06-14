package com.logistic.imlp;

import com.logistic.entity.User;
import com.logistic.exceptions.AccountNotFountException;
import com.logistic.remote.Login;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

@Stateless
public class LoginBean implements Login {
    @PersistenceContext
    private EntityManager em;
    @Override
    public User login(String email, String password) {

        User user = em.createQuery("SELECT u FROM  User u WHERE u.email=:email and u.password=:password", User.class)
                .setParameter("email", email)
                .setParameter("password", password)
                .getSingleResult();

       if(user != null){

       }else {
           throw new AccountNotFountException("Account Not Fount");

       }

       return user;
    }
}
