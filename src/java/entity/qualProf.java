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
public class qualProf {
    private String title, school, type,course;
    private int id;
    private Date date;

    public qualProf(String title, String school, String type,String course, int id, Date date) {
        this.title = title;
        this.school = school;
        this.type = type;
        this.id = id;
        this.date = date;
        this.course = course;
    }

    public String getCourse() {
        return course;
    }

    public void setCourse(String course) {
        this.course = course;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSchool() {
        return school;
    }

    public void setSchool(String school) {
        this.school = school;
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

    public String getDate() {
        SimpleDateFormat formatter = new SimpleDateFormat("EEEE, dd MMM yyyy");
        String strDate = formatter.format(date);  
        return strDate;
    }

    public void setDate(Date date) {
        this.date = date;
    }
    
}
