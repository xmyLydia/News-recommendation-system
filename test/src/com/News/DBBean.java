/**
* @author XieMingyue
 * test.java
 * 2015-12-15 
 * ���ڻ�ȡ���ݿ����Ӳ��ҽ������ݿ�Ĳ�ѯ�����������ز�ѯ�Ľ������Щ���������jspҳ������ŵ�չʾ������main1.jspҳ�汻ʹ��
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
 //��ȡ���ݿ�����
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
 //ִ�����ݿ��ѯ�����ز�ѯ���
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
 //�ر����ݿ�����
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
