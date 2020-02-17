/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.sql.Date;
import java.text.SimpleDateFormat;

/**
 *
 * @author CENTRE ACADEMIC HEAD
 */
public class workArchieve {
    private String title, duty, type;
    private int id;
    private Date dateStart;

    public workArchieve(String title, String duty, String type, int id, Date dateStart) {
        this.title = title;
        this.duty = duty;
        this.type = type;
        this.id = id;
        this.dateStart = dateStart;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDuty() {
        return duty;
    }

    public void setDuty(String duty) {
        this.duty = duty;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDateStart() {
        SimpleDateFormat formatter = new SimpleDateFormat("EEEE, dd MMM yyyy");
        String strDate = formatter.format(dateStart);  
        return strDate;
    }

    public void setDateStart(Date dateStart) {
        this.dateStart = dateStart;
    }
    
    
}
