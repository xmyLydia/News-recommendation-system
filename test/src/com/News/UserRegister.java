/**
 * @author XieMingyue
 * test.java
 * 2015-12-15 
 * 在用户注册的时候进行后台操作使得信息被放入数据库表
 *  *  */
package com.News;  
    import com.mysql.jdbc.Driver;  
    import java.sql.*;  
    public class UserRegister  
    {  
            private UserBean userBean;  
            private Connection con;  
            //获得数据库连接。  
            public UserRegister()  
            {  
      
               //  String url="jdbc:mysql://10.60.42.66/"+"stu_1352937"+"?user="+"1352937"+"&password="+"mk32oyzn";  
            //	 String url="jdbc:mysql://localhost:3306/"+"stu_1352937"+"?user="+"root"+"&password="+"195820";  
                 
                try  
                {  
      
               //     Class.forName("com.mysql.jdbc.Driver").newInstance();  
                        //    con = DriverManager.getConnection(url);  
                DBBean db = new DBBean();
                con = db.getCon();
                }  
                    catch(Exception e)  
                    {  
                            e.printStackTrace();  
                    }  
      
            }  
            //设置待注册的用户信息。  
            public void setUserBean(UserBean userBean)  
            {  
                    this.userBean=userBean;  
            }  
            //进行注册  
            public void regist() throws Exception  
            {  
                    String reg="insert into user(username,userPWD)  values(?,?)";  
      
                    try  
                    {  
                            PreparedStatement pstmt=con.prepareStatement(reg);  
                            pstmt.setString(1,userBean.getUserId());  
                            pstmt.setString(2,userBean.getPassword());  
                            pstmt.executeUpdate();  
                    }  
                    catch(Exception e)  
                    {  
                            e.printStackTrace();  
                            throw e;  
                    }  
      
      
            }  
    }  