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
public class commentInfo {
    private String docName, commentID, docid, postid, Content, docProfile;
    Date dateComment;

    public commentInfo(String docName, String commentID, String docid, 
            String postid, String Content, String docProfile, 
            Date dateComment) {
        this.docName = docName;
        this.commentID = commentID;
        this.docid = docid;
        this.postid = postid;
        this.Content = Content;
        this.docProfile = docProfile;
        this.dateComment = dateComment;
    }

    public String getDocName() {
        return docName;
    }

    public void setDocName(String docName) {
        this.docName = docName;
    }

    public String getCommentID() {
        return commentID;
    }

    public void setCommentID(String commentID) {
        this.commentID = commentID;
    }

    public String getDocid() {
        return docid;
    }

    public void setDocid(String docid) {
        this.docid = docid;
    }

    public String getPostid() {
        return postid;
    }

    public void setPostid(String postid) {
        this.postid = postid;
    }

    public String getContent() {
        return Content;
    }

    public void setContent(String Content) {
        this.Content = Content;
    }

    public String getDocProfile() {
        return docProfile;
    }

    public void setDocProfile(String docProfile) {
        this.docProfile = docProfile;
    }

    public String getDateComment() {
         SimpleDateFormat formatter = new SimpleDateFormat("EEEE, dd MMM yyyy");
        String strDate = formatter.format(dateComment);  
        return strDate;
    }

    public void setDateComment(Date dateComment) {
        this.dateComment = dateComment;
    }
    
    
}
