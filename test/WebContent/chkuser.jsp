<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<%@ page  import="java.util.*"  %>
 <%@page import="java.sql.*" %>
 <%@page import="com.News.DBBean" %>
 <%@page import="com.News.*" %>
 <jsp:useBean id ="myDBbean" class="com.News.DBBean"></jsp:useBean>
 <jsp:useBean id="user" class="com.News.UserBean" scope="session"></jsp:useBean>
 <jsp:setProperty name="user" property="*"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
   <script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
   <script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<title>用户登录验证</title>
</head>
<body>
<div class="container">
<h2>用户登录验证</h2>
<hr>
 <%  
  String userid1=new String(request.getParameter("userName"));  
  String password1=new String(request.getParameter("userPWD"));  
  
 Class.forName("com.mysql.jdbc.Driver");  
 //Connection con=DriverManager.getConnection("jdbc:mysql://10.60.42.66/stu_1352937","root","195820");  
 //Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/stu_1352937","root","195820");  
 DBBean db = new DBBean();
 Connection con = db.getCon();
 Statement stmt=con.createStatement();  
 String sql="select * from  user where userName='"+userid1+"';";  
 ResultSet rs=stmt.executeQuery(sql);  
  if(rs.next())  
  {
  String password=new String(rs.getString("userPWD"));  
  if(password.equals(password1))  
  {
  session.setAttribute("userid1",userid1);  
  response.sendRedirect("main.jsp");  
  }  
  else  
{
	  
	  response.sendRedirect("Login.jsp");  
}  
}  
else  
{
	response.sendRedirect("Login.jsp");  
}  
%>  
<br>
<br>
<br>
<br>
<input class="btn btn-primary btn-lg" type="button" value="跳转到主页" onClick="window.location.href='main.jsp'">
</div>
</body>
</html>