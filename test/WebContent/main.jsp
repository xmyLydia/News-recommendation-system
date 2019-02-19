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
<title>front-end</title>
 <link href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
   <script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
   <script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
    <script type='text/javascript' src='/test/dwr/engine.js'></script>
  <script type='text/javascript' src='/test/dwr/interface/Demo.js'></script>
   <script type='text/javascript' src='/test/dwr/util.js'></script>
</head>
<body>
<%
  com.News.test1111 testnow=new com.News.test1111();
  testnow.test1();
  InfoInsert info = new InfoInsert();
  %>
<div class="container" >
  
      <div class="navbar-form navbar-right">
<%
//获取设置的用户名
  String userNameOK=((String)session.getAttribute("userid1"));
  int countOfInter=0;
 %>
 <%
  if (userNameOK== null){ //为空时表示你没有登录，
%>
       <!--  input type="button" value="登录" class="btn btn-primary btn-lg" onclick="window.location='Login.jsp'"--> 
        <!--  input type="button" value="注册" class="btn btn-primary btn-lg" onclick="window.location='register.jsp'"--> 
  <%}else{%>
      <h4><%out.println(userNameOK);%> , 您好！</h4>
       <input type="button" value="退出登陆" class="btn btn-primary btn-lg" onclick="window.location='back.jsp'">
        <%}%>    
      </div>
  <div class="row" style="background-image: url(bg14.jpg)">

  
<script type="text/javascript">

var sayHelloit = function(){
    return Demo.hello("Rongbo_J",callBack);
}
function InsertUserInfo(username,type) {
	Demo.testIns(username,type);
	return false;
}
var callBack = function(data)
{
    alert(data);
}

function refresh(){
	window.naviagte("main1.jsp");
}
</script>
  
   <%  
            //驱动程序名   
         //   String driverName = "com.mysql.jdbc.Driver";  
            //数据库用户名   
        //    String userName = "root";  
            //密码   
        //    String userPasswd = "195820";  
            //数据库名   
         //   String dbName = "stu_1352937";  
            //表名   
            String tableName = "interdata";  
            //联结字符串   
        //    Class.forName("com.mysql.jdbc.Driver").newInstance();
        //    String url = "jdbc:mysql://localhost:3306/"+ dbName + "?user="  
         //           + userName + "&password=" + userPasswd; 
                    
            //Class.forName("com.mysql.jdbc.Driver").newInstance();  
          //  Connection connection = DriverManager.getConnection(url);  
            DBBean db = new DBBean();
            Connection connection = db.getCon();
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
  <hr>
  <br>
  
      <ul class="nav nav-tabs">
   <li class="active"><a href="http://news.ifeng.com/">首页</a></li>
   <br>
   <br>
   <br>
 
    <div style="background-image: url(bg4.jpg)">  
           
            <%  
            int interValue=info.Deployed(info.getInfo(userNameOK)).get(0).intValue();
              int intercount=0;
                while (rsInter.next()&&(intercount<interValue)) {  
                	intercount++;
            %>  
                  <br>
                 <a href="<%out.print(rsInter.getString(2));%>" target="_blank"  onclick="InsertUserInfo(<%=userNameOK %>,'Inter')"<%//if(userNameOK!=null){info.testIns(userNameOK, "Inter");}%>;
                 javascript:window.location.href='main.jsp'" >
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
                intercount=0;
            %>  
            
            <%
            tableName="mainlanddata";
            sql = "SELECT * FROM " + tableName;  
            ResultSet rsMainland = statement.executeQuery(sql);  
            %>
            <%  
            int mainlandValue=info.Deployed(info.getInfo(userNameOK)).get(1).intValue();
                int maincount=0;
                while (rsMainland.next()&&(maincount<mainlandValue)) {  
                	maincount++;
            %>  
                  <br>
                 <a href="<%out.print(rsMainland.getString(2));%>" target="_blank"   onclick="InsertUserInfo(<%=userNameOK %>,'Mainland')">
                 
                 <div style="color:black">
            <h1><% out.print(rsMainland.getString(1));%></h1> 
                 </div>
                 </a>
                 
                 <div class="col-md-offset-6" >
                 <br>
                 <h3>&#8212;&#8212;&#8212;&#8212;&#8212;&#8212;&#8212;<%out.print(rsMainland.getString(3)); %></h3>
                  
                 </div>
                 <hr>  
                 
            <%  
                }  
                maincount=0;
            %>  
            
            <%
           
             tableName="socidata";
            sql = "SELECT * FROM " + tableName;  
            ResultSet rsSociety = statement.executeQuery(sql);  
            %>
            
             <% 
             int sociValue=info.Deployed(info.getInfo(userNameOK)).get(2).intValue();
                int socicount=0;
                while (rsSociety.next()&&(socicount<sociValue)) {  
                	socicount++;
            %>  
                  <br>
                 <a href="<%out.print(rsSociety.getString(2));%>" target="_blank" onclick="InsertUserInfo(<%=userNameOK %>,'Soci')">
                 
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
                socicount=0;
            %>  
            
            <%
             tableName="taidata";
            sql = "SELECT * FROM " + tableName;  
            ResultSet rsTai = statement.executeQuery(sql);  
            %>
            
             <%    int taiValue=info.Deployed(info.getInfo(userNameOK)).get(3).intValue();
                int taicount=0;
                while (rsTai.next()&&(taicount<taiValue)) {  
                	taicount++;
            %>  
                  <br>
                 <a href="<%out.print(rsTai.getString(2));%>" target="_blank" onclick="InsertUserInfo(<%=userNameOK %>,'Tai')">
                 
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
                taicount=0;
            %>  
        </div>  
        </div>
        <div class="col-md-4 ">
        <br>
     
        <br>
        <ul class="nav nav-pills nav-stacked">
   <li class="active"><a href="#">新闻</a></li>
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