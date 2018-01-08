/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.opensymphony.xwork2.ActionSupport;
import dao.ReaderDAO;
import entity.Reader;
import java.util.ArrayList;
import java.util.Date;
import java.util.concurrent.ThreadLocalRandom;

/**
 *
 * @author oswal
 */
public class ReaderActionSupport extends ActionSupport {

    private int id;
    private String name;
    private String email;
    private String phone;
    private Date dob;
    private boolean gender;
    private String address;
    private boolean status;

    private ArrayList<Reader> items;

    public int getId() {
        boolean isEqual;
        do {
            id = ThreadLocalRandom.current().nextInt(0, 9999999 + 1);
            isEqual = false;
            for (Reader item : items) {
                if (item.getId() == id) {
                    isEqual = true;
                    break;
                }
            }
        } while (isEqual);
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public boolean isStatus() {
        return true;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public ArrayList<Reader> getItems() {
        items = new ReaderDAO().getReader();
        return items;
    }

    public void setItems(ArrayList<Reader> items) {
        this.items = items;
    }

    public String read() {
        return "success";
    }

    public String create() {
        Reader reader = new Reader(id, name, email, phone, dob, gender, address, status);
        if (new ReaderDAO().createReader(reader)) {
            return "success";
        }
        return "fail";
    }

    public ReaderActionSupport() {
    }

    @Override
    public String execute() throws Exception {
        throw new UnsupportedOperationException("Not supported yet.");
    }

}
