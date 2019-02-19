package com.News;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class InfoInsert {
	 public void testIns(String userName,String type){
		 Connection conn = null;
     	  Statement st = null;
		  //插入数据库
     	  try {
     	
     	   DBBean db = new DBBean();
           conn = db.getCon();
     	   conn.setAutoCommit(false);
     	   st = conn.createStatement();
     	//3条国际新闻插入数据库
     	   String sqlStr = null;
     	 //String sqlSelect="select interNews from test2 where userName="+userName;
    	  // rs=st.executeUpdate(sqlSelect)+1;//把interNews的值取出来，进行加一
     	    
     	   // sqlStr = "INSERT INTO News1208(NewsName,NewsHref,NewsTime) VALUES('" + Title[i] + "','" + "WWW" + "','" + Time[i] + "')";
     	    switch(type){
     	    case "Inter": {
     	    	sqlStr = "INSERT INTO information(userName,interNews,mainNews,sociNews,taiNews) VALUES('" + userName + "',1,0,0,0)";
     	        break;
     	    }
     	    case "Mainland":{
     	    	 sqlStr = "INSERT INTO information(userName,interNews,mainNews,sociNews,taiNews) VALUES('" + userName + "',0,1,0,0)";
     	         break;
     	    }
     	    case "Soci":{
     	    	 sqlStr = "INSERT INTO information(userName,interNews,mainNews,sociNews,taiNews) VALUES('" + userName + "',0,0,1,0)";
     	         break;
     	    }
     	    case "Tai":{
     	    	 sqlStr = "INSERT INTO information(userName,interNews,mainNews,sociNews,taiNews) VALUES('" + userName + "',0,0,0,1)";
     	         break;
     	    }
     	    }
     		
     		 
     	 // sqlStr = "INSERT INTO test2(userName,interNews,mainNews,sociNews,taiNews) VALUES('4', 1 , 0 , 0 , 0 )";
     	    st.executeUpdate(sqlStr); 
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
	 public int[] getInfoJS(String username){
		 Connection conn = null;
    	  Statement st = null;
    	 int[] result = new int[4];
    	  try {
        	   DBBean db = new DBBean();
              conn = db.getCon();
        	   conn.setAutoCommit(false);
        	   st = conn.createStatement();
        	//根据type和username从Informatica表里面查找数据
        	   String sqlStr = null;
        	   sqlStr = "select sum(interNews),sum(mainNews),sum(sociNews),sum(taiNews) from stu_1352937.information where username='" + username + "';";
        	   ResultSet rs = st.executeQuery(sqlStr); 
        	 
        	   while (rs.next()){
        		 int inter =Integer.valueOf(rs.getString(1));
        		 int mainland = Integer.valueOf(rs.getString(2));
        		 int soci = Integer.valueOf(rs.getString(3));
        		 int tai = Integer.valueOf(rs.getString(4));
        		 result[0]=inter;
        		 result[1]=mainland;
        		 result[2]=soci;
        		 result[3]=tai;
        	   }
        	 //  st.executeUpdate(sqlStr); 
         	   conn.commit();
        	  
        	   }catch (Exception e) {
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
		 
		 return result;
	 }
	 public ArrayList<Integer> getInfo(String username){
		 Connection conn = null;
    	  Statement st = null;
    	  ArrayList<Integer> preferlist = new ArrayList<Integer>();
    	  try {
        	   DBBean db = new DBBean();
              conn = db.getCon();
        	   conn.setAutoCommit(false);
        	   st = conn.createStatement();
        	//根据type和username从Informatica表里面查找数据
        	   String sqlStr = null;
        	   sqlStr = "select sum(interNews),sum(mainNews),sum(sociNews),sum(taiNews) from stu_1352937.information where username='" + username + "';";
        	   ResultSet rs = st.executeQuery(sqlStr); 
        	   int inter = 0;
        	   int mainland = 0;
        	   int soci = 0;
        	   int tai = 0;
        	   while (rs.next()){
        		   if(rs.getString(1)!=null){
        		  inter =Integer.valueOf(rs.getString(1));
        		   }
        		   if(rs.getString(2)!=null){
        		 mainland = Integer.valueOf(rs.getString(2));
        		   }
        		   if(rs.getString(3)!=null){
        		 soci = Integer.valueOf(rs.getString(3));
        		   }
        		   if(rs.getString(4)!=null){
        		 tai = Integer.valueOf(rs.getString(4));
        		   }
        		 preferlist.add(inter);
        		 preferlist.add(mainland);
        		 preferlist.add(soci);
        		 preferlist.add(tai);
        	   }
        	 //  st.executeUpdate(sqlStr); 
         	   conn.commit();
        	  
        	   }catch (Exception e) {
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
		 
		 return preferlist;
	 }
	 public int getInter(String username){
		
		  //获取数据库中对应用户的国际新闻点击次数
		  int inter=-1;
		  ArrayList<Integer> list = getInfo(username);
		  inter = list.get(0).intValue();
		  return inter;
	  }
	 public int getMainland(String username){
		  int allNum=12;//总新闻数量
		  int mainland=-1;
		  ArrayList<Integer> list = getInfo(username);
		  mainland = list.get(1).intValue();
		  return mainland;
	  }
	 public int getSoci(String username){
		  int allNum=12;//总新闻数量
		  int society=-1;
		  ArrayList<Integer> list = getInfo(username);
		  society = list.get(2).intValue();
		  return society;
	  }
	 public int getTai(String username){
		  int allNum=12;//总新闻数量
		  int tai=-1;
		  ArrayList<Integer> list = getInfo(username);
		  tai = list.get(3).intValue();
		  return tai;
	  }
	 public String hello(String name)  
	 {  
	  return "呵呵" + name + "，呵呵哒您的第一个DWR！";  
	 } 
	public ArrayList<Integer> Deployed(ArrayList<Integer> list){
		  int allNum=12;//总新闻数量
		  int inter=3;//原始比例
		  int mainland=3;//原始比例
		  int soci=3 ;//原始比例
		  int tai=3;//原始比例
		  if(list.size()!=0&&list!=null){
		   inter = list.get(0).intValue();
		   mainland = list.get(1).intValue();
		   soci = list.get(2).intValue();
		   tai = list.get(3).intValue();
		  }
		  int base = inter+mainland+soci+tai;
		  double prop_inter = (double)inter/(double)base;
		  inter = (int)(allNum*prop_inter);
		  if(inter<=0){
			  inter = 1;
		  }
		  double prop_mainland = (double)mainland/(double)base;
		  mainland = (int)(allNum*prop_mainland);
		  if(mainland<=0){
			  mainland =1;
		  }
		  double prop_soci = (double)soci/(double)base;
		  soci = (int)(allNum*prop_soci);
		  if(soci<=0){
			  soci = 1;
		  }
		 // double prop_tai = (double)tai/(double)base;
		  tai = 12-(inter+mainland+soci);
		  if(tai<=0){
			  tai = 1;
		  }
		//通过比例的形式将各类新闻进行数量上的改变
		ArrayList<Integer> result = new ArrayList<Integer>();//存放结果
		result.add(inter);
		result.add(mainland);
		result.add(soci);
		result.add(tai);
		
		return result;
	}
	 
}
