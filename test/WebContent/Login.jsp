<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
   <script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
   <script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<title>Login</title>
<style type="text/css">
html,body {
	height: 100%;
}
.box {
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#6699FF', endColorstr='#6699FF'); /*  IE */
	background-image:linear-gradient(bottom, #FFE4C4 0%, #FFE4C4 100%);
	background-image:-o-linear-gradient(bottom, #FFE4C4 0%, #FFE4C4 100%);
	background-image:-moz-linear-gradient(bottom, #FFE4C4 0%, #FFE4C4 100%);
	background-image:-webkit-linear-gradient(bottom, #FFE4C4 0%, #FFE4C4 100%);
	background-image:-ms-linear-gradient(bottom, #FFE4C4 0%, #FFE4C4 100%);
	
	margin: 0 auto;
	position: relative;
	width: 100%;
	height: 100%;
}
.login-box {
	width: 100%;
	max-width:500px;
	height: 400px;
	position: absolute;
	top: 50%;

	margin-top: -200px;
	/*设置负值，为要定位子盒子的一半高度*/
	
}
@media screen and (min-width:500px){
	.login-box {
		left: 50%;
		/*设置负值，为要定位子盒子的一半宽度*/
		margin-left: -250px;
	}
}	

.form {
	width: 100%;
	max-width:500px;
	height: 275px;
	margin: 25px auto 0px auto;
	padding-top: 25px;
}	
.login-content {
	height: 300px;
	width: 100%;
	max-width:500px;
	background-color: rgba(255, 250, 2550, .6);
	float: left;
}		
	
	
.input-group {
	margin: 0px 0px 30px 0px !important;
}
.form-control,
.input-group {
	height: 40px;
}

.form-group {
	margin-bottom: 0px !important;
}
.login-title {
	padding: 20px 10px;
	background-color: #EE9572;
}
.login-title h1 {
	margin-top: 10px !important;
}
.login-title small {
	color: #0D0D0D;
}

.link p {
	line-height: 20px;
	margin-top: 30px;
}
.btn-sm {
	padding: 8px 24px !important;
	font-size: 16px !important;
}
</style>
</head>
<body>
<div class="box">
		<div class="login-box">
			<div class="login-title text-center">
				<h1><small>登录</small></h1>
			</div>
			<div class="login-content ">
			<div class="form">
			<form name="form1" action="chkuser.jsp" method="post" onSubmit="return check()">
				<div class="form-group">
					<div class="col-xs-12  ">
						<div class="input-group">
							<span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
							<input type="text" id="userName" name="userName" class="form-control" placeholder="用户名">
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="col-xs-12  ">
						<div class="input-group">
							<span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
							<input type="password" id="userPWD" name="userPWD" class="form-control" placeholder="密码">
						</div>
					</div>
				</div>
				<div class="form-group form-actions">
					<div class="col-xs-4 col-xs-offset-4 ">
						<button type="submit" name="submit" class="btn btn-sm btn-success text-center"><span class="glyphicon glyphicon-off"></span>&nbsp;&nbsp;登&nbsp;录&nbsp;&nbsp;</button>
					</div>
				</div>
				<div class="form-group">
					<div class="col-xs-6 link">
						<p class="text-center remove-margin"><large>忘记密码？</large> <a href="javascript:void(0)" ><large>找回</large></a>
						</p>
					</div>
					<div class="col-xs-4 link">
						<p class="text-center remove-margin"><large>还没注册?</large> <a href="register.jsp" ><large>注册</large></a>
						</p>
					</div>
				</div>
			</form>
			</div>
		</div>
	</div>
</div>

 

</body>
</html>