
package DB;


import entity.commentInfo;
import entity.myInfo;
import entity.postInfo;
import entity.qualProf;
import entity.workArchieve;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.NumberFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import static java.time.temporal.ChronoUnit.DAYS;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author CENTRE ACADEMIC HEAD
 */
public class DBManager {
    //CONNECT US TO DB
     public static Connection getConnection(){
        Connection conn = null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/doctors", "root","");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        return conn;
    }
      public static boolean createNewDoctor(String name, String phone,
            String email, String contact,String country, String state,
            String lgov, String password,String gender, String userId){
        boolean status = false;
        try {
            Connection conn =null;
            conn = getConnection();
            String SQL = "INSERT INTO doctorinfo "
                    + " (docName,docPhone,docEmail,docContact,docCountry, docState,docLocalGov,"
                    + "docPassword,docGender,docId)"
                    + " VALUES (?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement pst = conn.prepareStatement(SQL);
            pst.setString(1,name); 
            pst.setString(2,phone);
            pst.setString(3,email);
            pst.setString(4,contact);
            pst.setString(5,country);
            pst.setString(6,state);
            pst.setString(7,lgov);
            pst.setString(8,password);
            pst.setString(9,gender);
            pst.setString(10,userId);
            int re = pst.executeUpdate();
            if(re >=1){
                status = true;
                String sql = "UPDATE doctorinfo set docLogin=? WHERE docId=?";
                pst = conn.prepareStatement(sql);
                pst.setString(1, "1");
                pst.setString(2, userId);
                int result = pst.executeUpdate();
            }
            
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return status;
    }

    public ArrayList loadAllProfAccad(String userId) {
       ArrayList<qualProf> ourflight = new ArrayList<qualProf>();
       try {
            Connection conn =null;
            conn = getConnection();
            PreparedStatement pst = conn.prepareStatement("Select * from  qualprof where docid=? order by id desc");
           pst.setString(1, userId);
            ResultSet rs = pst.executeQuery();
            qualProf ft = null;
            while(rs.next()){
                ft = new qualProf(rs.getString("title"),rs.getString("school"),rs.getString("type"),rs.getString("course"),rs.getInt("id"),rs.getDate("year"));
                ourflight.add(ft);
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return ourflight;
    }
    
    
    public static boolean createNewAccadProff(String title, String school,
            String course, String year,String type, String userId){
        SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd");
        Date utilDatefrom=null;
        boolean status = false;
        try {
            utilDatefrom = format.parse(year);
            java.sql.Date sqltxtdatefrom = new java.sql.Date(utilDatefrom.getTime());
            
            Connection conn =null;
            conn = getConnection();
            String SQL = "INSERT INTO qualprof "
                    + " (title,school,course, year,type,docid)"
                    + " VALUES (?,?,?,?,?,?)";
            PreparedStatement pst = conn.prepareStatement(SQL);
            pst.setString(1,title); 
            pst.setString(2,school);
            pst.setString(3,course);
            pst.setDate(4,sqltxtdatefrom);
            pst.setString(5,type);
            pst.setString(6,userId);
            int re = pst.executeUpdate();
            if(re >=1){
                status = true;
            }
            
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParseException ex) {
             Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
         }
        
        return status;
    }

    public void removeAccadeProf(String userID, String bfid) {
        try {
            Connection conn =null;
            conn = getConnection();
            PreparedStatement pst = conn.prepareStatement("Delete from  qualprof where id  =? and docid=? limit 1");
            pst.setString(1,bfid);
            pst.setString(2,userID); 
            pst.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static ArrayList LoginDoctor(String username, String password){
         ArrayList<String> admin = new ArrayList<String>();
            try {
            
            Connection conn =null;
            conn = getConnection();
            Statement stmt = conn.createStatement();
            String sql1 = " docId ='" + username + "' and docPassword = '" + password + "' limit 1";
           
           String sql = "SELECT * FROM doctorinfo where" +sql1;
            ResultSet rs = stmt.executeQuery(sql);
            while(rs.next()){
                admin.add(0,rs.getString("docName"));
                admin.add(1,rs.getString("docId"));
                
                sql = "UPDATE doctorinfo set docLogin=? WHERE docId=?";
                PreparedStatement pst = conn.prepareStatement(sql);

                 pst.setString(1, "1");
                 pst.setString(2, rs.getString("docId"));
                 int result = pst.executeUpdate();
                
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        }
         return admin;
     }

    public boolean createNewWorkExperience(String userid, String compname, String duty, String year) {
        SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd");
        Date utilDatefrom=null;
        boolean status = false;
        try {
             utilDatefrom = format.parse(year);
            java.sql.Date sqltxtdatefrom = new java.sql.Date(utilDatefrom.getTime());
            Connection conn =null;
            conn = getConnection();
            String SQL = "INSERT INTO  experiencearchieve "
                    + " (title,details, year,type,docid)"
                    + " VALUES (?,?,?,?,?)";
            PreparedStatement pst = conn.prepareStatement(SQL);
            pst.setString(1,compname); 
            pst.setString(2,duty);
            pst.setDate(3,sqltxtdatefrom);
            pst.setString(4,"0");
            pst.setString(5,userid);
            int re = pst.executeUpdate();
            if(re >=1){
                status = true;
            }
            
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParseException ex) {
             Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
         }
        
        return status;
    }

    public ArrayList loadAllWorkExperience(String userId) {
         ArrayList<workArchieve> ourflight = new ArrayList<workArchieve>();
       try {
            Connection conn =null;
            conn = getConnection();
            PreparedStatement pst = conn.prepareStatement("Select * from  experiencearchieve where docid=? and type=? order by id desc");
           pst.setString(1, userId);
           pst.setString(2, "0");
            ResultSet rs = pst.executeQuery();
            workArchieve ft = null;
            while(rs.next()){
                ft = new workArchieve(rs.getString("title"),rs.getString("details"),rs.getString("type"),rs.getInt("id"),rs.getDate("year"));
                ourflight.add(ft);
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return ourflight;
    }
    
    public void removeWorkExperience(String userID, String bfid) {
        try {
            Connection conn =null;
            conn = getConnection();
            PreparedStatement pst = conn.prepareStatement("Delete from  experiencearchieve where id  =? and docid=? limit 1");
            pst.setString(1,bfid);
            pst.setString(2,userID); 
            pst.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
     public boolean createNewAward(String userid, String compname, String duty, String year) {
        SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd");
        Date utilDatefrom=null;
        boolean status = false;
        try {
             utilDatefrom = format.parse(year);
            java.sql.Date sqltxtdatefrom = new java.sql.Date(utilDatefrom.getTime());
            Connection conn =null;
            conn = getConnection();
            String SQL = "INSERT INTO  experiencearchieve "
                    + " (title,details, year,type,docid)"
                    + " VALUES (?,?,?,?,?)";
            PreparedStatement pst = conn.prepareStatement(SQL);
            pst.setString(1,compname); 
            pst.setString(2,duty);
            pst.setDate(3,sqltxtdatefrom);
            pst.setString(4,"1");
            pst.setString(5,userid);
            int re = pst.executeUpdate();
            if(re >=1){
                status = true;
            }
            
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParseException ex) {
             Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
         }
        
        return status;
    }

    public ArrayList loadAllAward(String userId) {
         ArrayList<workArchieve> ourflight = new ArrayList<workArchieve>();
       try {
            Connection conn =null;
            conn = getConnection();
            PreparedStatement pst = conn.prepareStatement("Select * from  experiencearchieve where docid=? and type=? order by id desc");
           pst.setString(1, userId);
           pst.setString(2, "1");
            ResultSet rs = pst.executeQuery();
            workArchieve ft = null;
            while(rs.next()){
                ft = new workArchieve(rs.getString("title"),rs.getString("details"),rs.getString("type"),rs.getInt("id"),rs.getDate("year"));
                ourflight.add(ft);
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return ourflight;
    }
    
    public void removeAward(String userID, String bfid) {
        try {
            Connection conn =null;
            conn = getConnection();
            PreparedStatement pst = conn.prepareStatement("Delete from  experiencearchieve where id  =? and docid=? limit 1");
            pst.setString(1,bfid);
            pst.setString(2,userID); 
            pst.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
    public ArrayList findAdoctor(String userId) {
         ArrayList<myInfo> ourflight = new ArrayList<myInfo>();
       try {
            Connection conn =null;
            conn = getConnection();
            PreparedStatement pst = conn.prepareStatement("Select * from  doctorinfo where docId=?  Limit 1");
           pst.setString(1, userId);
            ResultSet rs = pst.executeQuery();
            myInfo ft = null;
            while(rs.next()){
                
                ft = new myInfo(rs.getString("docName"),rs.getString("docEmail"),
                        rs.getString("docPhone"),rs.getString("docGender"),
                      rs.getString("docState"),rs.getString("docCountry"),
                rs.getString("docLocalgov"),rs.getString("docContact"));
                ourflight.add(ft);
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return ourflight;
    }

    public void openDoctorProfile(String userId) {
        try {
            
            Connection conn =null;
            conn = getConnection();
            Statement stmt = conn.createStatement();
           
                String sql = "UPDATE doctorinfo set docview=? WHERE docId=?";
                PreparedStatement pst = conn.prepareStatement(sql);
                 pst.setString(1, "0");
                 pst.setString(2, userId);
                 int result = pst.executeUpdate();
                 conn.close();
            } catch (SQLException ex) {
             Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
            }
    }

    public void closeDoctorProfile(String userId) {
        try {
            
            Connection conn =null;
            conn = getConnection();
            Statement stmt = conn.createStatement();
           
                String sql = "UPDATE doctorinfo set docview=? WHERE docId=?";
                PreparedStatement pst = conn.prepareStatement(sql);
                pst.setString(1, "1");
                pst.setString(2, userId);
                int result = pst.executeUpdate();
                conn.close();
            } catch (SQLException ex) {
             Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
            }
    }

    public boolean createPost(String body, String title, String userid) {
        boolean status = false;
        try {
            
            
            Random r = new Random();
                Integer ranNum = r.nextInt((20000000 - 10000000) + 1) + 10000000;
                String postid ="POS" + ranNum.toString();
            
            Connection conn =null;
            conn = getConnection();
            String SQL = "INSERT INTO  doctorpost "
                    + " (title,content, postid,status,docid, datePost)"
                    + " VALUES (?,?,?,?,?,now())";
            PreparedStatement pst = conn.prepareStatement(SQL);
            pst.setString(1,title); 
            pst.setString(2,body);
            pst.setString(3,postid);
            pst.setString(4,"0");
            pst.setString(5,userid);
            int re = pst.executeUpdate();
            if(re >=1){
                status = true;
            }
            
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        return status;
    }

    public ArrayList loadMyPost(String userid) {
        ArrayList<postInfo> ourflight = new ArrayList<postInfo>();
        try {
            Connection conn =null;
            conn = getConnection();
            PreparedStatement pst = conn.prepareStatement("Select * from  doctorpost d INNER JOIN doctorinfo p"
                    + " ON d.docid = p.docId where d.docid =? and d.status =? order by d.id desc limit 5");
            pst.setString(1, userid);
            pst.setString(2, "0");
            ResultSet rs = pst.executeQuery();
            postInfo st = null;
            while(rs.next()){
                //get NO OF post comments
                String sql = "select count(*) as noComment from postComments where postid=?";
                pst = conn.prepareStatement(sql);
                pst.setString(1, rs.getString("d.postid"));
                ResultSet rs2 = pst.executeQuery();
                int noComment=0;
                while(rs2.next()){
                    noComment = rs2.getInt("noComment");
                }
                
                
                st = new postInfo(rs.getString("d.title"),noComment,rs.getString("d.content"),
                        rs.getString("p.docName"),rs.getString("d.docid"),
                        rs.getString("d.status"),rs.getString("d.postid"),
                        rs.getDate("d.datePost"),rs.getString("p.docview"));
              ourflight.add(st);
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return ourflight;
    }

    public ArrayList readPost(String postid) {
        ArrayList<postInfo> ourflight = new ArrayList<postInfo>();
        try {
            Connection conn =null;
            conn = getConnection();
            PreparedStatement pst = conn.prepareStatement("Select * from  doctorpost d INNER JOIN doctorinfo p"
                    + " ON d.docid = p.docId where d.postid =? and d.status =? order by d.id desc limit 1");
            pst.setString(1, postid);
            pst.setString(2, "0");
            ResultSet rs = pst.executeQuery();
            postInfo st = null;
            while(rs.next()){
                //get NO OF post comments
                String sql = "select count(*) as noComment from postComments where postid=?";
                pst = conn.prepareStatement(sql);
                pst.setString(1, rs.getString("d.postid"));
                ResultSet rs2 = pst.executeQuery();
                int noComment=0;
                while(rs2.next()){
                    noComment = rs2.getInt("noComment");
                }
                
                
                st = new postInfo(rs.getString("d.title"),noComment,rs.getString("d.content"),
                        rs.getString("p.docName"),rs.getString("d.docid"),
                        rs.getString("d.status"),rs.getString("d.postid"),
                        rs.getDate("d.datePost"),rs.getString("p.docview"));
              ourflight.add(st);
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return ourflight;
    }

    public void saveComment(String postid, String userid, String body) {
        try {
            
            
            Random r = new Random();
            Integer ranNum = r.nextInt((2000000000 - 1000000000) + 1) + 1000000000;
            String commentid ="COM" + ranNum.toString();
            
            Connection conn =null;
            conn = getConnection();
            String SQL = "INSERT INTO  postcomments "
                    + " (postid,commentid, docCommentid,comment, dateComment)"
                    + " VALUES (?,?,?,?,now())";
            PreparedStatement pst = conn.prepareStatement(SQL);
            pst.setString(1,postid); 
            pst.setString(2,commentid);
            pst.setString(3,userid);
            pst.setString(4,body);
            int re = pst.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList readPostComment(String postid) {
         ArrayList<commentInfo> ourflight = new ArrayList<commentInfo>();
        try {
            Connection conn =null;
            conn = getConnection();
            PreparedStatement pst = conn.prepareStatement("Select * from  postcomments p INNER JOIN doctorinfo d"
                    + " ON p.docCommentid = d.docId where p.postid =? order by p.id desc");
            pst.setString(1, postid);
            ResultSet rs = pst.executeQuery();
            commentInfo st = null;
            while(rs.next()){
                st = new commentInfo(rs.getString("d.docName"),rs.getString("p.commentid"),
                        rs.getString("p.docCommentid"),rs.getString("p.postid"),
                        rs.getString("p.comment"),rs.getString("d.docview"),
                        rs.getDate("p.dateComment"));
              ourflight.add(st);
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return ourflight;
    }

    public ArrayList loadAllMyPost() {
        ArrayList<postInfo> ourflight = new ArrayList<postInfo>();
        try {
            Connection conn =null;
            conn = getConnection();
            PreparedStatement pst = conn.prepareStatement("Select * from  doctorpost d INNER JOIN doctorinfo p"
                    + " ON d.docid = p.docId where d.status =? order by d.id desc limit 5");
            pst.setString(1, "0");
            ResultSet rs = pst.executeQuery();
            postInfo st = null;
            while(rs.next()){
                //get NO OF post comments
                String sql = "select count(*) as noComment from postComments where postid=?";
                pst = conn.prepareStatement(sql);
                pst.setString(1, rs.getString("d.postid"));
                ResultSet rs2 = pst.executeQuery();
                int noComment=0;
                while(rs2.next()){
                    noComment = rs2.getInt("noComment");
                }
                
                
                st = new postInfo(rs.getString("d.title"),noComment,rs.getString("d.content"),
                        rs.getString("p.docName"),rs.getString("d.docid"),
                        rs.getString("d.status"),rs.getString("d.postid"),
                        rs.getDate("d.datePost"),rs.getString("p.docview"));
              ourflight.add(st);
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return ourflight;
    }

    public ArrayList LoginAdmin(String txtreg, String password) {
        ArrayList<String> admin = new ArrayList<String>();
            try {
            
            Connection conn =null;
            conn = getConnection();
            Statement stmt = conn.createStatement();
            String sql1 = " adminId ='" + txtreg + "' and adminPword = '" + password + "' limit 1";
           
           String sql = "SELECT * FROM admininfo where" +sql1;
            ResultSet rs = stmt.executeQuery(sql);
            while(rs.next()){
                admin.add(0,rs.getString("adminName"));
                admin.add(1,rs.getString("adminId"));
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        }
         return admin;
    }

    public void deletePost(String postid) {
        try {

           Connection conn =null;
           conn = getConnection();
           Statement stmt = conn.createStatement();

               String sql = "UPDATE doctorpost set status=? WHERE postid=? limit 1";
               PreparedStatement pst = conn.prepareStatement(sql);
               pst.setString(1, "1");
               pst.setString(2, postid);
               int result = pst.executeUpdate();
               conn.close();
           } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
           }
    }

    public ArrayList dbSummary() {
        ArrayList<Integer> admin = new ArrayList<Integer>();
        try {
            Connection conn =null;
            conn = getConnection();
            PreparedStatement pst = null;
            //count of all doctors
            String sql = "select count(*) as noComment from doctorinfo";
            pst = conn.prepareStatement(sql);
            ResultSet rs2 = pst.executeQuery();
            int noComment=0;
            while(rs2.next()){
                noComment = rs2.getInt("noComment");
            }
            admin.add(0,noComment);
            //count of login doctoors
            sql = "select count(*) as noComment from doctorinfo where docLogin=?";
            pst = conn.prepareStatement(sql);
            pst.setString(1,"1");
            rs2 = pst.executeQuery();
            noComment=0;
            while(rs2.next()){
                noComment = rs2.getInt("noComment");
            }
            admin.add(1,noComment);
            
        } catch (SQLException ex) {
             Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
         }
        return admin;
      }

    public void logoutDoctor(String userid) {
        try {

           Connection conn =null;
           conn = getConnection();
           Statement stmt = conn.createStatement();

               String sql = "UPDATE doctorinfo set docLogin=? WHERE docId=? limit 1";
               PreparedStatement pst = conn.prepareStatement(sql);
               pst.setString(1, "0");
               pst.setString(2, userid);
               int result = pst.executeUpdate();
               conn.close();
           } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
           }
    }

    public ArrayList loadSearchPost(String txtreg) {
        ArrayList<postInfo> ourflight = new ArrayList<postInfo>();
        try {
            Connection conn =null;
            conn = getConnection();
            PreparedStatement pst = conn.prepareStatement("Select * from  doctorpost d INNER JOIN doctorinfo p"
                    + " ON d.docid = p.docId where d.status =? and (d.title like ? or p.docName like ? or d.content like ? ) order by d.id desc limit 5");
            pst.setString(1, "0");
            pst.setString(2, "*"+txtreg+"*");
            pst.setString(3, "*"+txtreg+"*");
            pst.setString(4, "*"+txtreg+"*");
            ResultSet rs = pst.executeQuery();
            postInfo st = null;
            while(rs.next()){
                //get NO OF post comments
                String sql = "select count(*) as noComment from postComments where postid=?";
                pst = conn.prepareStatement(sql);
                pst.setString(1, rs.getString("d.postid"));
                ResultSet rs2 = pst.executeQuery();
                int noComment=0;
                while(rs2.next()){
                    noComment = rs2.getInt("noComment");
                }
                
                
                st = new postInfo(rs.getString("d.title"),noComment,rs.getString("d.content"),
                        rs.getString("p.docName"),rs.getString("d.docid"),
                        rs.getString("d.status"),rs.getString("d.postid"),
                        rs.getDate("d.datePost"),rs.getString("p.docview"));
              ourflight.add(st);
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return ourflight;
    }
        
}