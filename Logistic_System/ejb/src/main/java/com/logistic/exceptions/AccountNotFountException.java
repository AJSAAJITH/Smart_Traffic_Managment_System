package com.logistic.exceptions;

public class AccountNotFountException extends RuntimeException{
    public AccountNotFountException(String message){
        super(message);
    }
}
