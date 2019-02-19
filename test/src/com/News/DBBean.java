/**
* @author XieMingyue
 * test.java
 * 2015-12-15 
 * 用于获取数据库连接并且进行数据库的查询工作，并返回查询的结果，这些结果是用于jsp页面对新闻的展示，将在main1.jsp页面被使用
 *  */
        
package com.News;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class DBBean {
 Connection con=null;
 Statement stat=null;
 PreparedStatement pstat=null;
 ResultSet rs=null;
 public DBBean(){};
 //获取数据库连接
 public Connection getCon(){
	 try{
		 Class.forName("com.mysql.jdbc.Driver").newInstance();
		 String url="jdbc:mysql://127.0.0.1/stu_1352937?user=root&password=195820";
		 con=DriverManager.getConnection(url);
	 }catch(Exception ex){
		 ex.printStackTrace();
	 }
	return con;
	 
 }
 //执行数据库查询并返回查询结果
 public ResultSet query(String sql){
	 try{
		 con=getCon();
		 stat=con.createStatement();
		 rs=stat.executeQuery(sql);
	 }catch(Exception ex){
		 ex.printStackTrace();
	 }
	 return rs;
 }
 //关闭数据库连接
 public void close(){
	 try{
		 if(rs!=null)rs.close();
		 if(stat!=null)stat.close();
		 if(pstat!=null)pstat.close();
		 if(con!=null)con.close();
	 }catch(Exception ex){
		 ex.printStackTrace();
	 }
 }
}
