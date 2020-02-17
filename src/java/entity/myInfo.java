/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author CENTRE ACADEMIC HEAD
 */
public class myInfo {
    private String docName, docEmail, docPhone, docGender, 
            docState, docCountry,docLgov,docContact;

    public myInfo(String docName, String docEmail, String docPhone, String docGender, String docState, String docCountry, String docLgov, String docContact) {
        this.docName = docName;
        this.docEmail = docEmail;
        this.docPhone = docPhone;
        this.docGender = docGender;
        this.docState = docState;
        this.docCountry = docCountry;
        this.docLgov = docLgov;
        this.docContact = docContact;
    }

    public String getDocName() {
        return docName;
    }

    public void setDocName(String docName) {
        this.docName = docName;
    }

    public String getDocEmail() {
        return docEmail;
    }

    public void setDocEmail(String docEmail) {
        this.docEmail = docEmail;
    }

    public String getDocPhone() {
        return docPhone;
    }

    public void setDocPhone(String docPhone) {
        this.docPhone = docPhone;
    }

    public String getDocGender() {
        return docGender;
    }

    public void setDocGender(String docGender) {
        this.docGender = docGender;
    }

    public String getDocState() {
        return docState;
    }

    public void setDocState(String docState) {
        this.docState = docState;
    }

    public String getDocCountry() {
        return docCountry;
    }

    public void setDocCountry(String docCountry) {
        this.docCountry = docCountry;
    }

    public String getDocLgov() {
        return docLgov;
    }

    public void setDocLgov(String docLgov) {
        this.docLgov = docLgov;
    }

    public String getDocContact() {
        return docContact;
    }

    public void setDocContact(String docContact) {
        this.docContact = docContact;
    }
    
}
