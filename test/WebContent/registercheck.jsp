<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<%@ page  import="java.util.*"  %>
 <%@page import="java.sql.*" %>
 <%@page import="com.News.DBBean" %>
 <%@page import="com.News.*" %>
 
 <jsp:useBean id ="userBean" class="com.News.UserBean" scope="request"></jsp:useBean>
  
 <jsp:setProperty name="userBean" property="*"/>
 <jsp:useBean id="regist" class="com.News.UserRegister" scope="request"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
   <script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
   <script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<title>用户注册验证</title>
</head>
<body>
<div class="container">
<h2>用户注册验证</h2>
<hr>
 <%  
  String userid=new String(request.getParameter("registername"));  
  String password=new String(request.getParameter("password"));  
  userBean.setUserId(userid);
  userBean.setPassword(password);
%>  
<% try{  
  regist.setUserBean(userBean);  
  out.println(userid);  
  regist.regist();  
  out.println("注册成功");}  
  catch(Exception e){  
  out.println(e.getMessage());  
  }  
%>  
<br>
<br>
<br>
<br>
<input class="btn btn-primary btn-lg" type="button" value="跳转到登陆" onClick="window.location.href='Login.jsp'">
</div>
</body>
</html>