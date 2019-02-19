/**
 * @author XieMingyue
 * test.java
 * 2015-12-15 
 * ���ڴӷ��������ҳ��ץȡ���Ų��ҽ��õ������ŷֳ�1.�������� 2.��½���� 3.������� 4.̨������ �������ݿ����
 */
package com.News;
import java.io.IOException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import java.sql.*;
@SuppressWarnings("serial")
public class test1111 extends javax.servlet.http.HttpServlet {
   
        
        // public static void main(String args[]) {  
 	   public void test1(){
 		// System.out.println("okokok");
 		  String tmpTitle=null;
          String tmpHref=null;
          String tmpTime=null;
      	  java.sql.Connection conn = null;
      	  java.sql.Statement st = null;
      	  Document doc;
    		Element column_ele=null;
    		Element td_ele=null;
    		Element time_ele=null;
    		String href=null;
    		//�������Ŵ洢����
    		String[] Title=new String[30];
    		String[] Link=new String[30];
    		String[] Time=new String[20];
    		//��½���Ŵ洢����
    		String[] TitleMainland=new String[50];
    		String[] LinkMainland=new String[50];
    		String[] TimeMainland=new String[50];
    		//������Ŵ洢����
    		String[] TitleSociety=new String[30];
    		String[] LinkSociety=new String[30];
    		String[] TimeSociety=new String[20];
    		//̨�����Ŵ洢����
    		String[] TitleTai=new String[50];
    		String[] LinkTai=new String[50];
    		String[] TimeTai=new  String[50];
    		checkNews check = new checkNews();
    		int length=0;
    		int showLength=6;
    		//ץȡ�������Ų���������
    		try{
    		//	doc = Jsoup.connect("http://news.ifeng.com/world/").get(); 
    			String world_url="http://news.ifeng.com/world/";
    			org.jsoup.Connection con_jsoup = Jsoup.connect(world_url);
    			con_jsoup.timeout(30000);
    			doc = con_jsoup.get();
    			Elements ListDiv = doc.getElementsByClass("juti_list");
    			length=ListDiv.size();
    			for(int i=0;i<ListDiv.size();i++){
    				column_ele = ListDiv.get(i);
    			    td_ele = column_ele.getElementsByTag("a").get(0);
    			     tmpTitle=td_ele.text().trim();
    			     Title[i]=tmpTitle;
    				//  System.out.println("Title:"+td_ele.text().trim());
    			  //System.out.println("Title:"+tmp);
    				// Title[i]=td_ele.text().trim()+".";
    				// System.out.println("Href:"+td_ele.attr("href"));
    				 tmpHref=td_ele.attr("href").trim();
    				 Link[i]=tmpHref ;
    			 	//Link[i]=td_ele.attr("href")+".";
    			    time_ele = column_ele.getElementsByClass("ping03").get(0);
    			   //  System.out.println("PublisTime:"+time_ele.text());
    			     tmpTime=time_ele.text();
    			     if(check.qualified(tmpTime))
    			     {//������ݲ�Ϊ��
    			    	 Time[i]=tmpTime;
    			     }
    				 
    			}
    		}catch(IOException e){
    			e.printStackTrace();
    		}
    		//ץȡ��½���Ų���������
    		try{
    		//	doc = Jsoup.connect("http://news.ifeng.com/mainland/").get();
    			String mainland_url="http://news.ifeng.com/mainland/";
    			org.jsoup.Connection con_jsoup = Jsoup.connect(mainland_url);
    			con_jsoup.timeout(30000);
    			doc = con_jsoup.get();
    			Elements ListDiv = doc.getElementsByClass("juti_list");
    			length=ListDiv.size();
    			for(int i=0;i<ListDiv.size();i++){
    				column_ele = ListDiv.get(i);
    			    td_ele = column_ele.getElementsByTag("a").get(0);
    			     tmpTitle=td_ele.text().trim();
    			     TitleMainland[i]=tmpTitle;
    				  // System.out.println("Title:"+td_ele.text().trim());
    			  //System.out.println("Title:"+tmp);
    				// Title[i]=td_ele.text().trim()+".";
    				 // System.out.println("Href:"+td_ele.attr("href"));
    				 tmpHref=td_ele.attr("href").trim();
    				 LinkMainland[i]=tmpHref ;
    			 	//Link[i]=td_ele.attr("href")+".";
    			    time_ele = column_ele.getElementsByClass("ping03").get(0);
    			    //  System.out.println("PublisTime:"+time_ele.text());
    			     tmpTime=time_ele.text();
    			     if(check.qualified(tmpTime)){
    			     TimeMainland[i]=tmpTime;
    			     }
    				 
    			}
    		}catch(IOException e){
    			e.printStackTrace();
    		}
    		//��ȡ������Ų���������
    		try{
    		//	doc = Jsoup.connect("http://news.ifeng.com/society/").get();
    			String soci_url="http://news.ifeng.com/society/";
    			org.jsoup.Connection con_jsoup = Jsoup.connect(soci_url);
    			con_jsoup.timeout(30000);
    			doc = con_jsoup.get();
    			Elements ListDiv = doc.getElementsByClass("juti_list");
    			length=ListDiv.size();
    			for(int i=0;i<ListDiv.size();i++){
    				column_ele = ListDiv.get(i);
    			    td_ele = column_ele.getElementsByTag("a").get(0);
    			     tmpTitle=td_ele.text().trim();
    			     TitleSociety[i]=tmpTitle;
    				 //  System.out.println("Title:"+td_ele.text().trim());
    			  //System.out.println("Title:"+tmp);
    				// Title[i]=td_ele.text().trim()+".";
    				 // System.out.println("Href:"+td_ele.attr("href"));
    				 tmpHref=td_ele.attr("href").trim();
    				 LinkSociety[i]=tmpHref ;
    			 	//Link[i]=td_ele.attr("href")+".";
    			    time_ele = column_ele.getElementsByClass("ping03").get(0);
    			    //  System.out.println("PublisTime:"+time_ele.text());
    			     tmpTime=time_ele.text();
    			     if(check.qualified(tmpTime)){
    			     TimeSociety[i]=tmpTime;
    			     }
    			}
    		}catch(IOException e){
    			e.printStackTrace();
    		}
    		//ץȡ̨�����Ŵ�������
    		try{
    		//	doc = Jsoup.connect("http://news.ifeng.com/taiwan/").get();
    			String tai_url="http://news.ifeng.com/taiwan/";
    			org.jsoup.Connection con_jsoup = Jsoup.connect(tai_url);
    			con_jsoup.timeout(30000);
    			doc = con_jsoup.get();
    			Elements ListDiv = doc.getElementsByClass("juti_list");
    			length=ListDiv.size();
    			for(int i=0;i<ListDiv.size();i++){
    				column_ele = ListDiv.get(i);
    			    td_ele = column_ele.getElementsByTag("a").get(0);
    			     tmpTitle=td_ele.text().trim();
    			     TitleTai[i]=tmpTitle;
    				 //  System.out.println("Title:"+td_ele.text().trim());
    			   //System.out.println("Title:"+tmp);
    				// Title[i]=td_ele.text().trim()+".";
    				//  System.out.println("Href:"+td_ele.attr("href"));
    				 tmpHref=td_ele.attr("href").trim();
    				 LinkTai[i]=tmpHref ;
    			 	//Link[i]=td_ele.attr("href")+".";
    			    time_ele = column_ele.getElementsByClass("ping03").get(0);
    			   //    System.out.println("PublisTime:"+time_ele.text());
    			     tmpTime=time_ele.text();
    			     if(check.qualified(tmpTime)){
    			     TimeTai[i]=tmpTime;
    			     }
    			}
    		}catch(IOException e){
    			e.printStackTrace();
    		}
      	  //�������ݿ�
      	  try {
      	  // Class.forName("com.mysql.jdbc.Driver");
      	 //  conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/stu_1352937","root", "195820");
      	   DBBean db = new DBBean();
      	   conn = db.getCon();
      	   conn.setAutoCommit(false);
      	   st = conn.createStatement();
      	   // ģ��һ�� str[i] = nd.getNodeValue().trim()
      	  // String[] str = new String[] { td_ele.text().trim(), td_ele.attr("href"), time_ele.text() };
      	//3���������Ų������ݿ�
      	   String sqlStr = null;
      	String sqlDelete="truncate table interdata;";
     	    st.executeUpdate(sqlDelete);
      	   for (int i = 0; i < showLength; i++) {
      	   // sqlStr = "INSERT INTO News1208(NewsName,NewsHref,NewsTime) VALUES('" + Title[i] + "','" + "WWW" + "','" + Time[i] + "')";
      	    
      		sqlStr = "INSERT INTO interdata(NewsName,NewsHref,NewsTime) VALUES('" + Title[i] + "','"   + Link[i]  + "','" + Time[i] + "')";
      	    st.executeUpdate(sqlStr);
      	   }
      	   //��½���Ų������ݿ�
      	   String sqlStrMilitary = null;
         	   String sqlDeleteMilitary="truncate table mainlanddata;";
        	    st.executeUpdate(sqlDeleteMilitary);
         	   for (int i = 0; i < showLength; i++) {
         	   // sqlStr = "INSERT INTO News1208(NewsName,NewsHref,NewsTime) VALUES('" + Title[i] + "','" + "WWW" + "','" + Time[i] + "')";
         	    
         		sqlStrMilitary = "INSERT INTO mainlanddata(NewsName,NewsHref,NewsTime) VALUES('" + TitleMainland[i] + "','"   + LinkMainland[i]  + "','" + TimeMainland[i] + "')";
         	    st.executeUpdate(sqlStrMilitary);
         	    
         	   }
         	   //������Ų������ݿ�
         	 String sqlStrSociety = null;
          	String sqlDeleteSociety="truncate table socidata;";
         	    st.executeUpdate(sqlDeleteSociety);
          	   for (int i = 0; i < showLength; i++) {
          	   // sqlStr = "INSERT INTO News1208(NewsName,NewsHref,NewsTime) VALUES('" + Title[i] + "','" + "WWW" + "','" + Time[i] + "')";
          	    
          		sqlStrSociety = "INSERT INTO socidata(NewsName,NewsHref,NewsTime) VALUES('" + TitleSociety[i] + "','"   + LinkSociety[i]  + "','" + TimeSociety[i] + "')";
          	    st.executeUpdate(sqlStrSociety);
          	    
          	   }
          	   //̨�����Ų������ݿ�
          	   String sqlStrTai = null;
                	String sqlDeleteTai="truncate table taidata;";
               	    st.executeUpdate(sqlDeleteTai);
                	   for (int i = 0; i < showLength; i++) {
                	   // sqlStr = "INSERT INTO News1208(NewsName,NewsHref,NewsTime) VALUES('" + Title[i] + "','" + "WWW" + "','" + Time[i] + "')";
                	    
                		sqlStrTai = "INSERT INTO taidata(NewsName,NewsHref,NewsTime) VALUES('" + TitleTai[i] + "','"   + LinkTai[i]  + "','" + TimeTai[i] + "')";
                	    st.executeUpdate(sqlStrTai);
                	    
                	   }
      	   conn.commit();
      	  } catch (Exception e) {
      	   e.printStackTrace();
      	  } finally {
      	   try {
      	    if (st != null)
      	     st.close();
      	    if(conn != null && !conn.isClosed()){
      	     conn.close();
      	    }
      	   } catch (SQLException e) {
      	    e.printStackTrace();
      	   }
      	  }    
      		 
        }  
 	  public static void main(String[] args){
    	  test1111 test = new test1111();
    	  test.test1();
      }
}
