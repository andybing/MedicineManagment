<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'login.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

    <link rel="stylesheet" type="text/css" href="CSS/index.css">

  </head>
  <script type="text/javaScript">
  	function checklogin()
  	{
  		var uname=document.getElementById("username");
  		if(uname.value=="")
  		{
  			alert("请输入用户名！");
  			uname.focus();
  			return ;
  		}
  		var password=document.getElementById("userpass");
  		if(password.value=="")
  		{
  			alert("请输入密码！");
  			uname.focus();
  			return ;
  		}
  		login_form.submit() ;
  	}
  </script>
  <body>
  <div id="zhongjian">
  
   <form name="login_form" action="login" method="post">
   	<table border="10">
   		
   		<tr>
   			<td>
   				<h5>用户名：</h5>   				
   			</td>
   			<td>
   				<input type="text" name="uname" id="username" />
   			</td>
   		</tr>
   		
   		<tr>
   			<td>
   				<h5>密码:</h5>
   			</td>
   			<td>
   				<input type="password" id="userpass" name="userpass"/>
   			</td>
   		</tr>
   		
   		<tr>
   			<td>
   				<h5>性别:</h5>
   			</td>
   			<td>
   				<input type="radio" name="sex" value="man" checked>男   
   				<input type="radio" name="sex" value="woman">女
   				
   			</td>
   		</tr>
   		<tr>
   			<td>
   				<h5>住址:</h5>
   			</td>
   			<td>
   				<select name="zhuzhi">
   					<option value="北京">北京</option>
   					<option value="北京">上海</option>
   					<option value="北京">广州</option>
   					<option value="北京">青岛</option>
   					<option value="北京" selected>即墨</option>
   				</select>
   			</td>
   		</tr>
   		<tr>
   			<td>
   				<input type="button" name="tijiao" value="登录" onclick="checklogin()">
   			</td>
   		
   		</tr>
   	</table>	
   	</form>
  </div>

  </body>
</html>
