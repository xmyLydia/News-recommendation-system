/**
 * @author XieMingyue
 * test.java
 * 2015-12-15 
 * �ڵ�¼��ʱ����в���ʹ�����Ա����û򱻲�ѯ�õ�
 * *  */
package com.News;

public class UserBean {
 String userName;
 String userPWD;
 boolean logined=false;
 //�޲εĹ��췽��
 public UserBean(){};
 //��ȡuserName����
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
 //����userName����
 public void setUserName(String userName){
	 this.userName=userName;
 }
 //��ȡuserPWD����
 public String getUserPWD( ){
	return userPWD;
 }
 //����userPWD����
 public void setUserPWD(String userPWD){
	 this.userPWD=userPWD;
 }
 //��ȡlogined����
 public boolean isLogined(){
	 return logined;
 }
 //����logined����
 public void setLogined(boolean logined){
	 this.logined=logined;
 }
}
