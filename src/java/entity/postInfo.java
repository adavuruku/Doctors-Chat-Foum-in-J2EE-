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
public class postInfo {
    private String title, content, docname, docid, status, postid, subContent, docProfile;

    public String getDocProfile() {
        return docProfile;
    }

    public void setDocProfile(String docProfile) {
        this.docProfile = docProfile;
    }
    private int noComment;

    public int getNoComment() {
        return noComment;
    }
    public String getSubContent() {
        if(getContent().length()>300){
            subContent = getContent().substring(0, 300) + "... ";
        }else{
            subContent = getContent();
        }
        
        return subContent;
    }

    public void setSubContent(String subContent) {
        this.subContent = subContent;
    }
    Date datePost;

    public postInfo(String title, int noComment, String content, String docname, 
            String docid, String status, String postid, Date datePost, String docProfile) {
        this.title = title;
        this.content = content;
        this.docname = docname;
        this.docid = docid;
        this.status = status;
        this.postid = postid;
        this.noComment = noComment;
        this.docProfile = docProfile;
        this.datePost = datePost;
        
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getDocname() {
        return docname;
    }

    public void setDocname(String docname) {
        this.docname = docname;
    }

    public String getDocid() {
        return docid;
    }

    public void setDocid(String docid) {
        this.docid = docid;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getPostid() {
        return postid;
    }

    public void setPostid(String postid) {
        this.postid = postid;
    }

    public String getDatePost() {
        SimpleDateFormat formatter = new SimpleDateFormat("EEEE, dd MMM yyyy");
        String strDate = formatter.format(datePost);  
        return strDate;
    }

    public void setDatePost(Date datePost) {
        this.datePost = datePost;
    }
    
    
}
