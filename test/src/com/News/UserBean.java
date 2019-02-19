/**
 * @author XieMingyue
 * test.java
 * 2015-12-15 
 * 在登录的时候进行操作使得属性被设置或被查询得到
 * *  */
package com.News;

public class UserBean {
 String userName;
 String userPWD;
 boolean logined=false;
 //无参的构造方法
 public UserBean(){};
 //读取userName属性
 private String userid;  
 private String password;  

  public void setUserId(String userid)  
  {  
          this.userid=userid;  
  }  
  public void setPassword(String password)  

  {  
          this.password=password;  
  }  
  public String  getUserId()  
  {  
          return this.userid;  
  }  
  public String getPassword()  
  {  
           return this.password;  
  }  

 public String getUserName(){
	 return userName;
 }
 //设置userName属性
 public void setUserName(String userName){
	 this.userName=userName;
 }
 //读取userPWD属性
 public String getUserPWD( ){
	return userPWD;
 }
 //设置userPWD属性
 public void setUserPWD(String userPWD){
	 this.userPWD=userPWD;
 }
 //读取logined属性
 public boolean isLogined(){
	 return logined;
 }
 //设置logined属性
 public void setLogined(boolean logined){
	 this.logined=logined;
 }
}
