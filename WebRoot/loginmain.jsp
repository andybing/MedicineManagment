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

    <link rel="stylesheet" type="text/css" href="CSS/loginmain.css">

  </head>
  <script type="text/javaScript">
  	function checklogin()
  	{
  		var uname=document.getElementById("ubianhao");
  		if(uname.value=="")
  		{
  			alert("请输入编号！");
  			uname.focus();
  			return ;
  		}
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
  <div class="zong">
  <h3 class="ziti">医院医药管理系统</h3>
  
  <div class="zuobian">
  	
  </div>
  <div class="zhongjian">
  
   <form name="login_form" action="login" method="post">
   	<table>
   		<tr>
   			<td>
   				<h5>管理员编号：</h5>   				
   			</td>
   			<td>
   				<input type="text" name="ubianhao" id="ubianhao" />
   			</td>
   		</tr>
   		<tr>
   			<td>
   				<h5>管理员姓名：</h5>   				
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
   				<h5>身份:</h5>
   			</td>
   			<td>
   				<select name="shenfen">
   					<option value="管理员">管理员</option>
   					<option value="销售人员">销售人员</option>
   					<option value="库存人员">库存人员</option>
   					
   					
   				</select>
   			</td>
   		</tr>
   		<tr>
   			<td>
   				
   			</td>
   			<td><input type="button" name="tijiao" value="登录" onclick="checklogin()"></td>
   			<td><a href="register.jsp">注册管理员</a>
   		
   		</tr>
   	</table>	
   	<%
   		if(request.getAttribute("fanhui")!=null){
   	%>
   		<font color="red" size="5px"><%=request.getAttribute("fanhui") %></font>
   	<%
   		}
   	
   	%>
   	</form>
  </div>
</div>
  </body>
</html>
