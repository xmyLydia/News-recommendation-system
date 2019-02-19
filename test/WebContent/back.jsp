<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.InputStream"%>
<%@page import="com.News.*" %> 
 <%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
 
 
 
<%@ page language="java" contentType="text/html; charset=utf-8"
   %>
    <%@ page import="java.sql.*"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>front-end_init</title>
 <link href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
   <script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
   <script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container" >
  
      <div class="navbar-form navbar-right">
       <input type="button" value="登录" class="btn btn-primary btn-lg" onclick="window.location='Login.jsp'"> 
        <input type="button" value="注册" class="btn btn-primary btn-lg" onclick="window.location='register.jsp'"> 
         
      </div>
  <div class="row" style="background-image: url(bg14.jpg)">

  

  
   <%  
            //驱动程序名   
        //    String driverName = "com.mysql.jdbc.Driver";  
            //数据库用户名   
        //    String userName = "1352937";  
            //密码   
        //    String userPasswd = "mk32oyzn";  
            //数据库名   
       //     String dbName = "stu_1352937";  
            //表名   
          String tableName = "interdata";  
            //联结字符串   
      //      Class.forName("com.mysql.jdbc.Driver").newInstance();
      //      String url = "jdbc:mysql://10.60.42.66:3306/"+ dbName + "?user="  
      //              + userName + "&password=" + userPasswd; 
                    
            //Class.forName("com.mysql.jdbc.Driver").newInstance();  
           // Connection connection = DriverManager.getConnection(url);  
            DBBean db = new DBBean();
            Connection  connection = db.getCon();
            Statement statement = connection.createStatement();
            //国际新闻
            String sql = "SELECT  * FROM " + tableName ;  
            ResultSet rsInter = statement.executeQuery(sql);  
            //大陆新闻
          
        %>  
        <br>  
        <br>  
    <div class="col-md-8"> 
    <h1>新闻展示</h1>
  <p>标签式的导航菜单</p>
  <br>
  
      <ul class="nav nav-tabs">
   <li class="active"><a href="http://news.ifeng.com/">首页</a></li>
   <br>
   <br>
   <br>
    <div style="background-image: url(bg4.jpg)">  
           
            <%  
                while (rsInter.next()) {  
            %>  
                  <br>
                 <a href="<%out.print(rsInter.getString(2));%>" target="_blank">
                 <div style="color:black">
                 <h1><% out.print(rsInter.getString(1));%></h1> 
                 </div>
                 </a>
                 
                 <div class=" col-md-offset-6" >
                 <br>
                 <h3>&#8212;&#8212;&#8212;&#8212;&#8212;&#8212;&#8212;<%out.print(rsInter.getString(3)); %></h3>
                  
                 </div>
                 <hr>  
                 
            <%  
                }  
            %>  
            
            <%
            tableName="mainlanddata";
            sql = "SELECT * FROM " + tableName;  
            ResultSet rsMainland = statement.executeQuery(sql);  
            %>
            <%  
                while (rsMainland.next()) {  
            %>  
                  <br>
                 <a href="<%out.print(rsMainland.getString(2));%>" target="_blank">
                 <div style="color:black">
                 <h1><% out.print(rsMainland.getString(1));%></h1> 
                 </div>
                 </a>
                 
                 <div class=" col-md-offset-6" >
                 <br>
                 <h3>&#8212;&#8212;&#8212;&#8212;&#8212;&#8212;&#8212;<%out.print(rsMainland.getString(3)); %></h3>
                  
                 </div>
                 <hr>  
                 
            <%  
                }  
            %>  
            
            <%
             tableName="socidata";
            sql = "SELECT * FROM " + tableName;  
            ResultSet rsSociety = statement.executeQuery(sql);  
            %>
            
             <%  
                while (rsSociety.next()) {  
            %>  
                  <br>
                 <a href="<%out.print(rsSociety.getString(2));%>" target="_blank">
                 <div style="color:black">
                 <h1><% out.print(rsSociety.getString(1));%></h1> 
                 </div>
                 </a>
                 
                 <div class=" col-md-offset-6" >
                 <br>
                 <h3>&#8212;&#8212;&#8212;&#8212;&#8212;&#8212;&#8212;<%out.print(rsSociety.getString(3)); %></h3>
                  
                 </div>
                 <hr>  
                 
            <%  
                }  
            %>  
            
            <%
             tableName="taidata";
            sql = "SELECT * FROM " + tableName;  
            ResultSet rsTai = statement.executeQuery(sql);  
            %>
            
             <%  
                while (rsTai.next()) {  
            %>  
                  <br>
                 <a href="<%out.print(rsTai.getString(2));%>" target="_blank">
                 <div style="color:black">
                 <h1><% out.print(rsTai.getString(1));%></h1> 
                 </div>
                 </a>
                 
                 <div class=" col-md-offset-6" >
                 <br>
                 <h3>&#8212;&#8212;&#8212;&#8212;&#8212;&#8212;&#8212;<%out.print(rsTai.getString(3)); %></h3>
                  
                 </div>
                 <hr>  
                 
            <%  
                }  
            %>  
        </div>  
        </div>
        <div class="col-md-4 ">
        <br>
     
        <br>
        <ul class="nav nav-pills nav-stacked">
   <li class="active"><a href="#">新闻</a></li>
   <li><a href="#">照片</a></li>
   <li><a href="visual.jsp">可视化</a></li>
    
</ul>

        </div>
        </div>
          
        <%  
            rsInter.close();  
            rsMainland.close();
            rsSociety.close();
            rsTai.close();
            statement.close();  
            connection.close();  
        %>  
</ul>
</div>
 
</body>
</html>