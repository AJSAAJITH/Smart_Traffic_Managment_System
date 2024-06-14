package com.logistic.imlp;

import com.logistic.entity.User;
import com.logistic.remote.Register;
import jakarta.annotation.Resource;
import jakarta.ejb.Stateless;
import jakarta.ejb.TransactionAttribute;
import jakarta.ejb.TransactionAttributeType;
import jakarta.persistence.*;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@Stateless
public class RegisterBean implements Register {
//    @PersistenceContext(unitName = "LogisticPU")
//    EntityManager em;

    @Resource(lookup = "jdbc/logistic_db")
    private DataSource db;

    @Override
    @TransactionAttribute(TransactionAttributeType.NEVER)
    public boolean register(String username, String email, String password, String userType) {


        try {
          Connection c = db.getConnection();
          PreparedStatement ps = c.prepareStatement("INSERT INTO user(USERNAME,EMAIL,PASSWORD,USERTYPE) VALUES (?,?,?,?)");
          ps.setString(1, username);
          ps.setString(2, email);
          ps.setString(3, password);
          ps.setString(4, userType);

         int i = ps.executeUpdate();
         if(i>0){
             return true;
         }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return false;
    }
}
