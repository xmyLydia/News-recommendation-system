/**
 * @author XieMingyue
 * test.java
 * 2015-12-15 
 * ���û�ע���ʱ����к�̨����ʹ����Ϣ���������ݿ��
 *  *  */
package com.News;  
    import com.mysql.jdbc.Driver;  
    import java.sql.*;  
    public class UserRegister  
    {  
            private UserBean userBean;  
            private Connection con;  
            //������ݿ����ӡ�  
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
            //���ô�ע����û���Ϣ��  
            public void setUserBean(UserBean userBean)  
            {  
                    this.userBean=userBean;  
            }  
            //����ע��  
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