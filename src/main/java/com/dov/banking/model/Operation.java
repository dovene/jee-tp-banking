package com.dov.banking.model;

import javax.persistence.*;
import java.util.Date;

@Entity
public class Operation {

    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private int number;

    private Date date;
    private String type;
    private double amount;

    @ManyToOne
    @JoinColumn(name="accountNumber")
    private Account account;

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }
}
