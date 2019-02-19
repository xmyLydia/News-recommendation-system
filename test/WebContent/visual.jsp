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
   <script src="https://d3js.org/d3.v4.min.js"></script>
     <script type='text/javascript' src='/test/dwr/engine.js'></script>
  <script type='text/javascript' src='/test/dwr/interface/Demo.js'></script>
   <script type='text/javascript' src='/test/dwr/util.js'></script>
</head>
<body>
<%
//获取设置的用户名
String userNameOK=((String)session.getAttribute("userid1"));
int countOfInter=0;
InfoInsert info = new InfoInsert();
int[] infoArray=null;
if(userNameOK!=null){
infoArray = info.getInfoJS(userNameOK);
}

//out.print(infoArray[0]+";"+infoArray[1]+";"+infoArray[2]+";"+infoArray[3]);


%>

<script src="http://d3js.org/d3.v3.min.js" charset="utf-8"></script>  
	<script>
	var countBar=0;
    function barGraph(arrayData){
    countBar=countBar+1;
	//画布大小
	var width = 400;
	var height = 400;
	if(countBar%2!=1){//奇数次点击
		 
		 d3.select("#statistics_graph").selectAll("*").remove();
	}
	else{
	 
	//在 body 里添加一个 SVG 画布	
	var svg = d3.select("#statistics_graph")
		.append("svg")
		.attr("width", width)
		.attr("height", height);

	//画布周边的空白
	var padding = {left:30, right:30, top:20, bottom:20};

	//定义一个数组,数据靠dwr里面的InfoInsert获取
	 
	var dataset_inter = <%=infoArray[0]%>;
	var dataset_mainland = <%=infoArray[1]%>;
	var dataset_soci = <%=infoArray[2]%>;
	var dataset_tai = <%=infoArray[3]%>;
	var dataset = new Array();
	dataset[0]=dataset_inter;
	dataset[1] = dataset_mainland;
	dataset[2] = dataset_soci;
	dataset[3] = dataset_tai;
	
	//x轴的比例尺
	var xScale = d3.scale.ordinal()
		.domain(d3.range(dataset.length))
		.rangeRoundBands([0, width - padding.left - padding.right]);

	//y轴的比例尺
	var yScale = d3.scale.linear()
		.domain([0,d3.max(dataset)])
		.range([height - padding.top - padding.bottom, 0]);
	var district = ["国际","大陆","社会", "台湾"];
	//定义x轴
	var xAxis = d3.svg.axis()
		.scale(xScale)
		.orient("bottom")
	    .tickFormat(function(d) { return district[d]; });
	//定义y轴
	var yAxis = d3.svg.axis()
		.scale(yScale)
		.orient("left");

	//矩形之间的空白
	var rectPadding = 4;

	//添加矩形元素
	var rects = svg.selectAll(".MyRect")
		.data(dataset)
		.enter()
		.append("rect")
		.attr("class","MyRect")
		.attr("transform","translate(" + padding.left + "," + padding.top + ")")
		.attr("x", function(d,i){
			return xScale(i) + rectPadding/2;
		} )
		.attr("y",function(d){
			return yScale(d);
		})
		.attr("width", xScale.rangeBand() - rectPadding )
		.attr("height", function(d){
			return height - padding.top - padding.bottom - yScale(d);
		});

	//添加文字元素
	var texts = svg.selectAll(".MyText")
		.data(dataset)
		.enter()
		.append("text")
		.attr("class","MyText")
		.attr("transform","translate(" + padding.left + "," + padding.top + ")")
		.attr("x", function(d,i){
			return xScale(i) + rectPadding/2;
		} )
		.attr("y",function(d){
			return yScale(d);
		})
		.attr("dx",function(){
			return (xScale.rangeBand() - rectPadding)/2;
		})
		.attr("dy",function(d){
			return 20;
		})
		.text(function(d){
			return d;
		});

	//添加x轴
	svg.append("g")
		.attr("class","axis")
		.attr("transform","translate(" + padding.left + "," + (height - padding.bottom) + ")")
		.call(xAxis); 
		
	//添加y轴
	svg.append("g")
		.attr("class","axis")
		.attr("transform","translate(" + padding.left + "," + padding.top + ")")
		.call(yAxis);
    }
   };
   
   var countPai = 0;
   
   function paiGraph(){
	   countPai= countPai+1;
   var width = 400;
	var height = 400;
	var dataset_inter = <%=infoArray[0]%>;
	var dataset_mainland = <%=infoArray[1]%>;
	var dataset_soci = <%=infoArray[2]%>;
	var dataset_tai = <%=infoArray[3]%>;
	var dataset = new Array();
	dataset[0] =["Inter",dataset_inter];
	dataset[1] =["Mainland", dataset_mainland];
	dataset[2] =["Soci",dataset_soci];
	dataset[3] =["tai",dataset_tai];
	
	if(countPai%2!=1){//奇数次点击
		 
		 d3.select("#statistics_graph").selectAll("*").remove();
	}
	else{
	var svg = d3.select("#statistics_graph")
				.append("svg")
				.attr("width", width)
				.attr("height", height);
	
	var pie = d3.layout.pie()
	          .value(function(d){
	        	  return d[1];
	          });

	var piedata = pie(dataset);
	
	var outerRadius = 150;	//外半径
	var innerRadius = 0;	//内半径，为0则中间没有空白

	var arc = d3.svg.arc()	//弧生成器
				.innerRadius(innerRadius)	//设置内半径
				.outerRadius(outerRadius);	//设置外半径
	
	var color = d3.scale.category10();
	
	var arcs = svg.selectAll("g")
				  .data(piedata)
				  .enter()
				  .append("g")
				  .attr("transform","translate("+ (width/2) +","+ (width/2) +")");
				  
	arcs.append("path")
		.attr("fill",function(d,i){
			return color(i);
		})
		.attr("d",function(d){
			return arc(d);
		});
	arcs.append("text")
		.attr("transform",function(d){
			return "translate(" + arc.centroid(d) + ")";
		})
		.attr("text-anchor","middle")
		.text(function(d){ 
			return d.data[0]+":"+d.data[1];
		});
	
	console.log(dataset);
	console.log(piedata);
   }
   };
   var forceCount = 0;
   function forceGraph(){
	   forceCount = forceCount + 1;
   if(forceCount%2!= 1){
	   d3.select("#statistics_graph").selectAll("*").remove();
   }
	   else{  
		   var nodes = [ { name: "国际新闻"    }, { name: "大陆新闻" },
					  { name: "社会新闻"    }, { name: "台湾新闻"},
					];
					 
		var edges = [  { source : 0  , target: 1 } , { source : 0  , target: 2 } ,
					   { source : 1 , target: 3 } , { source : 1  , target: 2 } ,
					   { source : 0 , target: 3 } , { source : 1  , target: 2 } ,
					   { source : 2 , target: 3 }  
					   ];	
		
		var width = 400;
		var height = 400;
		
		
		var svg = d3.select("#statistics_graph")
					.append("svg")
					.attr("width",width)
					.attr("height",height);
		
		var force = d3.layout.force()
				.nodes(nodes)		//指定节点数组
				.links(edges)		//指定连线数组
				.size([width,height])	//指定范围
				.linkDistance(150)	//指定连线长度
				.charge(-400);	//相互之间的作用力

		force.start();	//开始作用

		console.log(nodes);
		console.log(edges);
		
		//添加连线		
		var svg_edges = svg.selectAll("line")
							.data(edges)
							.enter()
							.append("line")
							.style("stroke","#ccc")
							.style("stroke-width",1);
		
		var color = d3.scale.category20();
				
		//添加节点			
		var svg_nodes = svg.selectAll("circle")
							.data(nodes)
							.enter()
							.append("circle")
							.attr("r",20)
							.style("fill",function(d,i){
								return color(i);
							})
							.call(force.drag);	//使得节点能够拖动

		//添加描述节点的文字
		var svg_texts = svg.selectAll("text")
							.data(nodes)
							.enter()
							.append("text")
							.style("fill", "black")
							.attr("dx", 20)
							.attr("dy", 8)
							.text(function(d){
								return d.name;
							});
					

		force.on("tick", function(){	//对于每一个时间间隔
		
			 //更新连线坐标
			 svg_edges.attr("x1",function(d){ return d.source.x; })
			 		.attr("y1",function(d){ return d.source.y; })
			 		.attr("x2",function(d){ return d.target.x; })
			 		.attr("y2",function(d){ return d.target.y; });
			 
			 //更新节点坐标
			 svg_nodes.attr("cx",function(d){ return d.x; })
			 		.attr("cy",function(d){ return d.y; });

			 //更新文字坐标
			 svg_texts.attr("x", function(d){ return d.x; })
			 	.attr("y", function(d){ return d.y; });
		});
   }
   };
</script>  
<div class="container" >
  
      <div class="navbar-form navbar-right">
      <%
  if (userNameOK== null){ //为空时表示你没有登录，
%>
       <!--  input type="button" value="登录" class="btn btn-primary btn-lg" onclick="window.location='Login.jsp'"--> 
        <!--  input type="button" value="注册" class="btn btn-primary btn-lg" onclick="window.location='register.jsp'"--> 
  <%}else{%>
      <h4><%out.println(userNameOK);%> , 您好！</h4>
       <input type="button" value="退出登陆" class="btn btn-primary btn-lg" onclick="window.location='back.jsp'">
        <%}%>    
       <!--input type="button" value="登录" class="btn btn-primary btn-lg" onclick="window.location='Login.jsp'"> 
        <input type="button" value="注册" class="btn btn-primary btn-lg" onclick="window.location='register.jsp'"--> 
        
      </div>
  <div class="row" style="background-image: url(bg14.jpg)">

   <%  
          String tableName = "interdata";  
    
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
  <br>
  <button class="btn btn btn-primary" onclick="barGraph()">柱状图</button>
   <button class="btn btn btn-primary" onclick="paiGraph()">饼图</button>
   <button class="btn btn btn-primary" onclick="forceGraph()">力导向图</button>
  </div>
   <br>
   <br>
   <br>
        
        <div class="col-md-4 ">
        <br>
        <br>
        <ul class="nav nav-pills nav-stacked">
        <li ><a href="main.jsp">新闻</a></li>
        <li class="active"><a href="#">可视化</a></li>
        </ul>
        </div>
        </div>
        <div id="statistics_graph">
        </div>
        </div>
        <%  
        %>  
        
        
 
</body>
</html>