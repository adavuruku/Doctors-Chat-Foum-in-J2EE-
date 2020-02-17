/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import DB.DBManager;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author CENTRE ACADEMIC HEAD
 */
@WebServlet(name = "link",loadOnStartup=1, urlPatterns = {"/doclogin","/adminLogin",
    "/step1","/step2","/step3","/step4","/removeAccad","/removeWork",
    "/removeAward","/openProfile","/register","/closeProfile","/home", 
    "/myProfile","/adminHome", "/createPost", "/logout",
    "/viewMyPost","/readPost","/viewAllPost","/viewDocProfile",
    "/readAdminPost","/adminViewAllPost","/deletePost","/adminlogout","/search"})
public class doctorsforum extends HttpServlet {

   String userPath;
   DBManager dboperation = new DBManager();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       userPath = request.getServletPath();
       if(userPath.equals("/home") || userPath==null || userPath.equals("")){
            String url = "/index.jsp";
            List all = dboperation.dbSummary();
            request.setAttribute("alldoctors", all.get(0));
            request.setAttribute("alllogindoctors", all.get(1));
            try{
              request.getRequestDispatcher(url).forward(request, response);
               // emf.close();
            }catch(Exception ex){
                ex.printStackTrace();
            }
        }
       if(userPath.equals("/adminlogout")){
            String url = "/home";
            HttpSession ses = request.getSession(false);
            ses.setAttribute("userid", "");
            ses.setAttribute("docName", "");
            ses.invalidate();
            try{
              request.getRequestDispatcher(url).forward(request, response);
               // emf.close();
            }catch(Exception ex){
                ex.printStackTrace();
            }
        }
        if(userPath.equals("/logout")){
            String url = "/home";
            HttpSession ses = request.getSession(false);
            dboperation.logoutDoctor(ses.getAttribute("userId").toString());
            ses.setAttribute("userid", "");
            ses.setAttribute("docName", "");
            ses.invalidate();
            try{
              request.getRequestDispatcher(url).forward(request, response);
               // emf.close();
            }catch(Exception ex){
                ex.printStackTrace();
            }
        }
        if(userPath.equals("/doclogin")){
            String url = "/doctorLogin.jsp";
            request.setAttribute("txtreg","");
            request.setAttribute("password", "");
             request.setAttribute("error", "");
            try{
              request.getRequestDispatcher(url).forward(request, response);
            }catch(Exception ex){
                ex.printStackTrace();
            }
        }
        if(userPath.equals("/adminLogin")){
            String url = "/adminLogin.jsp";
            request.setAttribute("txtreg","");
            request.setAttribute("password", "");
             request.setAttribute("error", "");
            try{
              request.getRequestDispatcher(url).forward(request, response);
            }catch(Exception ex){
                ex.printStackTrace();
            }
        }
        if(userPath.equals("/adminViewAllPost")){
            String url = "adminHome.jsp";
            request.setAttribute("allmypost", dboperation.loadAllMyPost()); 
            try{
              request.getRequestDispatcher(url).forward(request, response);
            }catch(Exception ex){
                ex.printStackTrace();
            }
       }
        if(userPath.equals("/deletePost")){
            String url = "/adminHome.jsp";
            if(!request.getParameter("postid").equals("") && request.getParameter("postid")!=null){
               dboperation.deletePost(request.getParameter("postid"));
               request.setAttribute("allmypost", dboperation.loadAllMyPost()); 
            }

            try{
              request.getRequestDispatcher(url).forward(request, response);
            }catch(Exception ex){
                ex.printStackTrace();
            }
        }
        if(userPath.equals("/createPost")){
            String url = "/newPost.jsp";
            HttpSession ses = request.getSession(false);
            request.setAttribute("title","");
            request.setAttribute("body","");
            request.setAttribute("error","");
            request.setAttribute("USERID",  ses.getAttribute("userId"));
            try{
              request.getRequestDispatcher(url).forward(request, response);
            }catch(Exception ex){
                ex.printStackTrace();
            }
        }
        
        if(userPath.equals("/readPost")){
            String url = "/newPost.jsp";
            HttpSession ses = request.getSession(false);
            request.setAttribute("body","");
            if(!request.getParameter("postid").equals("") && request.getParameter("postid")!=null){
                request.setAttribute("completePost",dboperation.readPost(request.getParameter("postid")));
                request.setAttribute("allComment",dboperation.readPostComment(request.getParameter("postid")));
                url = "/readPost.jsp";
            }
            request.setAttribute("USERID",  ses.getAttribute("userId"));
            request.setAttribute("POSTID",  request.getParameter("postid"));
            try{
              request.getRequestDispatcher(url).forward(request, response);
            }catch(Exception ex){
                ex.printStackTrace();
            }
        }
        if(userPath.equals("/readAdminPost")){
            String url = "/home";
            HttpSession ses = request.getSession(false);
            request.setAttribute("body","");
            if(!request.getParameter("postid").equals("") && request.getParameter("postid")!=null){
                request.setAttribute("completePost",dboperation.readPost(request.getParameter("postid")));
                request.setAttribute("allComment",dboperation.readPostComment(request.getParameter("postid")));
                url = "/readAdminPost.jsp";
            }
            try{
              request.getRequestDispatcher(url).forward(request, response);
            }catch(Exception ex){
                ex.printStackTrace();
            }
        }
        if(userPath.equals("/viewMyPost")){
            String url = "/myPost.jsp";
            HttpSession ses = request.getSession(false);
            request.setAttribute("title","");
            request.setAttribute("body","");
            request.setAttribute("error","");
            request.setAttribute("USERID",  ses.getAttribute("userId"));
            request.setAttribute("allmypost", dboperation.loadMyPost(ses.getAttribute("userId").toString()));
            try{
              request.getRequestDispatcher(url).forward(request, response);
            }catch(Exception ex){
                ex.printStackTrace();
            }
        }
        if(userPath.equals("/viewAllPost")){
            String url = "/myPost.jsp";
            HttpSession ses = request.getSession(false);
            
            request.setAttribute("USERID",  ses.getAttribute("userId"));
            request.setAttribute("allmypost", dboperation.loadAllMyPost());
            try{
              request.getRequestDispatcher(url).forward(request, response);
            }catch(Exception ex){
                ex.printStackTrace();
            }
        }
        if(userPath.equals("/myProfile")){
            String url = "/myProfile.jsp";
            HttpSession ses = request.getSession(false);
            request.setAttribute("myinfo", dboperation.findAdoctor(ses.getAttribute("userId").toString()));
            try{
              request.getRequestDispatcher(url).forward(request, response);
            }catch(Exception ex){
                ex.printStackTrace();
            }
        }
        
        if(userPath.equals("/viewDocProfile")){
            String url = "/docCompleteProfile.jsp";
            HttpSession ses = request.getSession(false);
            if(!request.getParameter("docid").equals("") && request.getParameter("docid")!=null){
                request.setAttribute("myinfo", dboperation.findAdoctor(request.getParameter("docid")));
                request.setAttribute("allreadySaved", dboperation.loadAllProfAccad(request.getParameter("docid")));
                request.setAttribute("allreadyWorkers", dboperation.loadAllWorkExperience(request.getParameter("docid")));  
                request.setAttribute("allreadyAchieve", dboperation.loadAllAward(request.getParameter("docid")));  
            }else{
                url = "/index.jsp";
            }
            try{
              request.getRequestDispatcher(url).forward(request, response);
            }catch(Exception ex){
                ex.printStackTrace();
            }
        }
        if(userPath.equals("/openProfile")){
            String url = "/myProfile.jsp";
            HttpSession ses = request.getSession(false);
            request.setAttribute("myinfo", dboperation.findAdoctor(ses.getAttribute("userId").toString()));
            dboperation.openDoctorProfile(ses.getAttribute("userId").toString());
            try{
              request.getRequestDispatcher(url).forward(request, response);
            }catch(Exception ex){
                ex.printStackTrace();
            }
        }
        if(userPath.equals("/closeProfile")){
            String url = "/myProfile.jsp";
            HttpSession ses = request.getSession(false);
            request.setAttribute("myinfo", dboperation.findAdoctor(ses.getAttribute("userId").toString()));
            dboperation.closeDoctorProfile(ses.getAttribute("userId").toString());
            try{
              request.getRequestDispatcher(url).forward(request, response);
            }catch(Exception ex){
                ex.printStackTrace();
            }
        }
        
        
        if(userPath.equals("/step1") || userPath.equals("/register")){
            String url = "/step1.jsp";
            request.setAttribute("txtPasswordC", "");
            request.setAttribute("txtPassword", "");
            request.setAttribute("contact", "");
            request.setAttribute("lgov", "");
            request.setAttribute("state", "");
            request.setAttribute("country", "");
            request.setAttribute("gender", "");
            request.setAttribute("txtemail", "");
            request.setAttribute("txtphone", "");
            request.setAttribute("txtname", "");
            request.setAttribute("error", "");         
            try{
              request.getRequestDispatcher(url).forward(request, response);
            }catch(Exception ex){
                ex.printStackTrace();
            }
        }
        
        if(userPath.equals("/removeAccad")){
            String url = "/step2.jsp";
            HttpSession ses = request.getSession(false);
            if( !ses.getAttribute("userId").equals("") &&  ses.getAttribute("userId")!=null){
                String bfid = request.getParameter("bfid");
                dboperation.removeAccadeProf(ses.getAttribute("userId").toString(), bfid);
                request.setAttribute("USERID",  ses.getAttribute("userId"));
                request.setAttribute("certname", "");
                request.setAttribute("schoolname", "");
                request.setAttribute("type", "");
                request.setAttribute("coursename", "");
                request.setAttribute("allreadySaved", dboperation.loadAllProfAccad(ses.getAttribute("userId").toString()));  
                request.setAttribute("error", ""); 
            }
            try{
              request.getRequestDispatcher(url).forward(request, response);
            }catch(Exception ex){
                ex.printStackTrace();
            }
        }
        
        if(userPath.equals("/removeWork")){
            String url = "/step3.jsp";
            HttpSession ses = request.getSession(false);
            if( !ses.getAttribute("userId").equals("") &&  ses.getAttribute("userId")!=null){
                String bfid = request.getParameter("bfid");
                dboperation.removeWorkExperience(ses.getAttribute("userId").toString(), bfid);
                request.setAttribute("USERID",  ses.getAttribute("userId"));
                request.setAttribute("compname", "");
                request.setAttribute("duty", "");
                request.setAttribute("year", "");
                request.setAttribute("allreadyWorkers", dboperation.loadAllWorkExperience(ses.getAttribute("userId").toString()));  
                request.setAttribute("error", ""); 
            }
            try{
              request.getRequestDispatcher(url).forward(request, response);
            }catch(Exception ex){
                ex.printStackTrace();
            }
        }
        
        if(userPath.equals("/removeAward")){
            String url = "/step4.jsp";
            HttpSession ses = request.getSession(false);
            if( !ses.getAttribute("userId").equals("") &&  ses.getAttribute("userId")!=null){
                String bfid = request.getParameter("bfid");
                dboperation.removeAward(ses.getAttribute("userId").toString(), bfid);
                request.setAttribute("USERID",  ses.getAttribute("userId"));
                request.setAttribute("compname", "");
                request.setAttribute("duty", "");
                request.setAttribute("year", "");
                request.setAttribute("allreadyAchieve", dboperation.loadAllAward(ses.getAttribute("userId").toString()));  
                request.setAttribute("error", ""); 
            }
            try{
              request.getRequestDispatcher(url).forward(request, response);
            }catch(Exception ex){
                ex.printStackTrace();
            }
        }
        if(userPath.equals("/step2")){
            String url = "/step2.jsp";
             HttpSession ses = request.getSession(false);
            if( ses.getAttribute("userId").equals("") ||  ses.getAttribute("userId")==null){
                url = "/step1.jsp";
                request.setAttribute("txtPasswordC", "");
                request.setAttribute("txtPassword", "");
                request.setAttribute("contact", "");
                request.setAttribute("lgov", "");
                request.setAttribute("state", "");
                request.setAttribute("country", "");
                request.setAttribute("gender", "");
                request.setAttribute("txtemail", "");
                request.setAttribute("txtphone", "");
                request.setAttribute("txtname", "");
                request.setAttribute("error", "");  
            }else{
                request.setAttribute("USERID",  ses.getAttribute("userId"));
                request.setAttribute("certname", "");
                request.setAttribute("schoolname", "");
                request.setAttribute("type", "");
                request.setAttribute("coursename", "");
                request.setAttribute("allreadySaved", dboperation.loadAllProfAccad(ses.getAttribute("userId").toString()));  
                request.setAttribute("error", ""); 
            }
            try{
              request.getRequestDispatcher(url).forward(request, response);
            }catch(Exception ex){
                ex.printStackTrace();
            }
        }
        
        if(userPath.equals("/step3")){
            String url = "/step3.jsp";
             HttpSession ses = request.getSession(false);
            if( ses.getAttribute("userId").equals("") ||  ses.getAttribute("userId")==null){
                url = "/step1.jsp";
                request.setAttribute("txtPasswordC", "");
                request.setAttribute("txtPassword", "");
                request.setAttribute("contact", "");
                request.setAttribute("lgov", "");
                request.setAttribute("state", "");
                request.setAttribute("country", "");
                request.setAttribute("gender", "");
                request.setAttribute("txtemail", "");
                request.setAttribute("txtphone", "");
                request.setAttribute("txtname", "");
                request.setAttribute("error", "");  
            }else{ 
                request.setAttribute("USERID",  ses.getAttribute("userId"));
                request.setAttribute("compname", "");
                request.setAttribute("duty", "");
                request.setAttribute("year", "");
                request.setAttribute("allreadyWorkers", dboperation.loadAllWorkExperience(ses.getAttribute("userId").toString()));  
                request.setAttribute("error", ""); 
            }
            try{
              request.getRequestDispatcher(url).forward(request, response);
            }catch(Exception ex){
                ex.printStackTrace();
            }
        }
        
        if(userPath.equals("/step4")){
            String url = "/step4.jsp";
             HttpSession ses = request.getSession(false);
            if( ses.getAttribute("userId").equals("") ||  ses.getAttribute("userId")==null){
                url = "/step1.jsp";
                request.setAttribute("txtPasswordC", "");
                request.setAttribute("txtPassword", "");
                request.setAttribute("contact", "");
                request.setAttribute("lgov", "");
                request.setAttribute("state", "");
                request.setAttribute("country", "");
                request.setAttribute("gender", "");
                request.setAttribute("txtemail", "");
                request.setAttribute("txtphone", "");
                request.setAttribute("txtname", "");
                request.setAttribute("error", "");  
            }else{ 
                request.setAttribute("USERID",  ses.getAttribute("userId"));
                request.setAttribute("compname", "");
                request.setAttribute("duty", "");
                request.setAttribute("year", "");
                request.setAttribute("allreadyAchieve", dboperation.loadAllAward(ses.getAttribute("userId").toString()));  
                request.setAttribute("error", ""); 
            }
            try{
              request.getRequestDispatcher(url).forward(request, response);
            }catch(Exception ex){
                ex.printStackTrace();
            }
        }
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        userPath = request.getServletPath();
        String err,url="";
       if(userPath.equals("/step1")){
            
            String txtPasswordC = request.getParameter("txtPasswordC");
            String txtPassword = request.getParameter("txtPassword");
            String contact = request.getParameter("contact");
            String lgov = request.getParameter("lgov");
            String state = request.getParameter("state");
            String country = request.getParameter("country");
            String gender = request.getParameter("gender");
            String txtemail = request.getParameter("txtemail");
            String txtphone = request.getParameter("txtphone");
            String txtname = request.getParameter("txtname");
            if(txtPasswordC.equals(txtPassword) && !txtPasswordC.equals("")
                    && !txtPassword.equals("") && !contact.equals("")
                    && !lgov.equals("") && !state.equals("")
                    && !country.equals("") && !gender.equals("")
                    && !txtemail.equals("") && !txtphone.equals("")
                    && !txtname.equals("")){
                
                Random r = new Random();
                Integer ranNum = r.nextInt((200000 - 100000) + 1) + 100000;
                String userId ="DOC" + ranNum.toString();
                
                boolean status = dboperation.createNewDoctor(txtname, txtphone,
            txtemail, contact, country,  state,lgov, txtPassword, gender,userId);
                if(status){
                    url = "/step2.jsp";
                     HttpSession ses = request.getSession(true);
                    ses.setAttribute("userId", userId);
                    ses.setAttribute("docName",txtname);
                   request.setAttribute("USERID", userId);
                   request.setAttribute("certname", "");
                   request.setAttribute("schoolname", "");
                   request.setAttribute("type", "");
                   request.setAttribute("coursename", "");
                   request.setAttribute("allreadySaved", dboperation.loadAllProfAccad(userId));  
                }else{
                    url = "/step1.jsp";
                    err = "ERROR: Unable To Create ..Verify!!";
                    request.setAttribute("error", err);
                    request.setAttribute("contact", contact);
                    request.setAttribute("lgov", lgov);
                    request.setAttribute("state", state);
                    request.setAttribute("country", country);
                    request.setAttribute("gender", gender);
                    request.setAttribute("txtemail", txtemail);
                    request.setAttribute("txtphone", txtphone);
                    request.setAttribute("txtname", txtname);
                }
            }else{
                url = "/step1.jsp";
                err = "ERROR: Invalid Information Entered ..Verify!!";
                request.setAttribute("error", err);
                request.setAttribute("contact", contact);
                request.setAttribute("lgov", lgov);
                request.setAttribute("state", state);
                request.setAttribute("country", country);
                request.setAttribute("gender", gender);
                request.setAttribute("txtemail", txtemail);
                request.setAttribute("txtphone", txtphone);
                request.setAttribute("txtname", txtname);
            }
                     
            try{
              request.getRequestDispatcher(url).forward(request, response);
            }catch(Exception ex){
                ex.printStackTrace();
            }
        }
       
       if(userPath.equals("/search")){
           url = "/myProfile";
           String txtreg = request.getParameter("txtsearch");
           HttpSession ses = request.getSession(false);
           String userid = ses.getAttribute("userId").toString();
           request.setAttribute("USERID", userid);
           //System.out.println(txtreg);
           if(!txtreg.equals("") && txtreg!=null){
               url = "/searchResult.jsp";
               request.setAttribute("allmypost", dboperation.loadSearchPost(txtreg));
               request.setAttribute("searchQuery", txtreg);
           }
            try{
              request.getRequestDispatcher(url).forward(request, response);
            }catch(Exception ex){
                ex.printStackTrace();
            }
           
       }
       if(userPath.equals("/doclogin")){
           String txtreg = request.getParameter("txtreg");
           String password = request.getParameter("password");
           
           List login = dboperation.LoginDoctor(txtreg,password);
           if(login.size()> 0){
               HttpSession ses = request.getSession(true);
                ses.setAttribute("userId",login.get(1));
                url = "step2.jsp";
                ses.setAttribute("docName",login.get(0));
                request.setAttribute("USERID",login.get(1) );
                request.setAttribute("certname", "");
                request.setAttribute("schoolname", "");
                request.setAttribute("type", "");
                request.setAttribute("coursename", "");
                request.setAttribute("allreadySaved", dboperation.loadAllProfAccad(login.get(1).toString()));  
                request.setAttribute("error", ""); 
           }else{
                url = "doclogin.jsp";
                request.setAttribute("txtreg",login.get(0) );
                request.setAttribute("password", "");
                request.setAttribute("error", "Error: Invalid User Name Or Password !!");
           }
            try{
              request.getRequestDispatcher(url).forward(request, response);
            }catch(Exception ex){
                ex.printStackTrace();
            }
           
       }
       
       if(userPath.equals("/adminLogin")){
           String txtreg = request.getParameter("txtreg");
           String password = request.getParameter("password");
           
           List login = dboperation.LoginAdmin(txtreg,password);
           if(login.size()> 0){
               HttpSession ses = request.getSession(true);
                ses.setAttribute("userId",login.get(1));
                url = "adminHome.jsp";
                ses.setAttribute("docName",login.get(0));
                request.setAttribute("allmypost", dboperation.loadAllMyPost()); 
                 
           }else{
                url = "adminLogin.jsp";
                request.setAttribute("txtreg",login.get(0) );
                request.setAttribute("password", "");
                request.setAttribute("error", "Error: Invalid User Name Or Password !!");
           }
            try{
              request.getRequestDispatcher(url).forward(request, response);
            }catch(Exception ex){
                ex.printStackTrace();
            }
           
       }
       if(userPath.equals("/step2")){
            url = "/step2.jsp";
            HttpSession ses = request.getSession(false);
            String userid = ses.getAttribute("userId").toString();        
            String title = request.getParameter("certname");
            String school = request.getParameter("schoolname");
            String course = request.getParameter("coursename");
            String year = request.getParameter("year");
            String type = request.getParameter("type");
            
            if(!title.equals("") && !school.equals("") && !course.equals("")
                    && !year.equals("") && !type.equals("")
                    && !userid.equals("")){
                
                boolean status = dboperation.createNewAccadProff(title,school,
                       course,year,type,userid );
               
                request.setAttribute("USERID", userid);
                request.setAttribute("certname", "");
                request.setAttribute("schoolname", "");
                request.setAttribute("type", "");
                request.setAttribute("coursename", "");
                request.setAttribute("error", "");
 
            }else{
                err = "ERROR: Invalid Information Entered ..Verify!!";
                request.setAttribute("error", err);
                request.setAttribute("USERID", userid);
                request.setAttribute("certname", "");
                request.setAttribute("schoolname", "");
                request.setAttribute("type", "");
                request.setAttribute("coursename", "");
                  
            }
            request.setAttribute("allreadySaved", dboperation.loadAllProfAccad(userid));         
            try{
              request.getRequestDispatcher(url).forward(request, response);
            }catch(Exception ex){
                ex.printStackTrace();
            }
        }
       
       if(userPath.equals("/createPost")){
            url = "/newPost.jsp";
            HttpSession ses = request.getSession(false);
            request.setAttribute("USERID",  ses.getAttribute("userId"));
            String title = request.getParameter("title");
            String body = request.getParameter("body");
            request.setAttribute("title",title);
            request.setAttribute("body",body);
            if(!title.equals("") && !body.equals("")){
                if(dboperation.createPost(body,title,ses.getAttribute("userId").toString())){
                    request.setAttribute("error","New Post Created Successfully !!");
                }else{
                    request.setAttribute("error","Unable To Create Post.. Retry !!");
                }
                
            }else{
                request.setAttribute("error","Error: Invalid Information. !!!");
            }
            
            try{
              request.getRequestDispatcher(url).forward(request, response);
            }catch(Exception ex){
                ex.printStackTrace();
            }
        }
       if(userPath.equals("/step3")){
             url = "/step3.jsp";
             HttpSession ses = request.getSession(false);
            
            String userid = ses.getAttribute("userId").toString();        
            String compname = request.getParameter("compname");
            String duty = request.getParameter("duty");
            String year = request.getParameter("year");
             if(!userid.equals("") && !compname.equals("") && !duty.equals("")
                    && !year.equals("")){
                  boolean status = dboperation.createNewWorkExperience(userid,compname,
                       duty,year);
                request.setAttribute("USERID",  ses.getAttribute("userId"));
                request.setAttribute("compname", "");
                request.setAttribute("duty", "");
                request.setAttribute("year", "");
                request.setAttribute("allreadyWorkers", dboperation.loadAllWorkExperience(ses.getAttribute("userId").toString()));  
                request.setAttribute("error", "Error: Invalid Inputs !!!"); 
            }else{ 
                request.setAttribute("USERID",  ses.getAttribute("userId"));
                request.setAttribute("compname", compname);
                request.setAttribute("duty", duty);
                request.setAttribute("year", "");
                request.setAttribute("allreadyWorkers", dboperation.loadAllWorkExperience(ses.getAttribute("userId").toString()));  
                request.setAttribute("error", "Error: Invalid Inputs !!!"); 
            }
            try{
              request.getRequestDispatcher(url).forward(request, response);
            }catch(Exception ex){
                ex.printStackTrace();
            }
        }
       
        if(userPath.equals("/step4")){
             url = "/step4.jsp";
             HttpSession ses = request.getSession(false);
            
            String userid = ses.getAttribute("userId").toString();        
            String compname = request.getParameter("compname");
            String duty = request.getParameter("duty");
            String year = request.getParameter("year");
             if(!userid.equals("") && !compname.equals("") && !duty.equals("")
                    && !year.equals("")){
                  boolean status = dboperation.createNewAward(userid,compname,
                       duty,year);
                request.setAttribute("USERID",  ses.getAttribute("userId"));
                request.setAttribute("compname", "");
                request.setAttribute("duty", "");
                request.setAttribute("year", "");
                request.setAttribute("allreadyAchieve", dboperation.loadAllAward(ses.getAttribute("userId").toString()));  
                request.setAttribute("error", "Error: Invalid Inputs !!!"); 
            }else{ 
                request.setAttribute("USERID",  ses.getAttribute("userId"));
                request.setAttribute("compname", compname);
                request.setAttribute("duty", duty);
                request.setAttribute("year", "");
                request.setAttribute("allreadyAchieve", dboperation.loadAllAward(ses.getAttribute("userId").toString()));  
                request.setAttribute("error", "Error: Invalid Inputs !!!"); 
            }
            try{
              request.getRequestDispatcher(url).forward(request, response);
            }catch(Exception ex){
                ex.printStackTrace();
            }
        }
        
        if(userPath.equals("/readPost")){
            url = "/newPost.jsp";
            HttpSession ses = request.getSession(false);
            String body = request.getParameter("body");
            if(!request.getParameter("postid").equals("") && request.getParameter("postid")!=null){
                
                dboperation.saveComment(request.getParameter("postid"),request.getParameter("userid"),body);
                request.setAttribute("completePost",dboperation.readPost(request.getParameter("postid")));
                request.setAttribute("allComment",dboperation.readPostComment(request.getParameter("postid")));
                url = "/readPost.jsp";
            }
            request.setAttribute("body",  "");
            request.setAttribute("USERID",  ses.getAttribute("userId"));
            request.setAttribute("POSTID",  request.getParameter("POSTID"));
            try{
              request.getRequestDispatcher(url).forward(request, response);
            }catch(Exception ex){
                ex.printStackTrace();
            }
        }
       
    }
}
