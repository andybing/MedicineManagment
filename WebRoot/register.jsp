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
  function back()
	{
		window.location.href="loginmain.jsp";
	}
	function checkregister()
	{
		var id=document.getElementById("userid");
		if(id.value=="")
		{
			alert("请输入您要注册的管理员编号！");
			id.focus();
			return ;
		}
		var name=document.getElementById("username");
		if(name.value=="")
		{
			alert("请输入您要注册的管理姓名！");
			name.focus();
			return ;
		}
		var password1=document.getElementById("userpass1");
		if(password1.value=="")
		{
			alert("请输入您的密码!");
			password1.focus();
			return ;
		}
		var password2=document.getElementById("userpass2");
		if(password2.value=="")
		{
			alert("请输入确认密码!");
			password2.focus();
			return ;
		}
		
		var sex=document.getElementById("usersex");
		if(sex.value=="")
		{
			alert("请输入您要注册的管理员性别！");
			sex.focus();
			return ;
		}
		var age=document.getElementById("userage");
		if(age.value=="")
		{
			alert("请输入您要注册的管理员年龄！");
			age.focus();
			return ;
		}
		if(password1.value==password2.value)
		{
			register_haha.submit();
			
		}
		else
		{
			alert("确认密码不正确!");
			password2.focus();
			return ;
		}
		
	}
  </script>
  <body>
  <div class="zong">
  <h3 class="ziti">医院医药管理系统</h3>
  
  <div class="zuobian">
  	
  </div>
  <div class="zhongjian">
  
   <form name="register_haha" action="register" method="post">
   <table>
   		<tr>
   			<td>
   				<h5>管理员编号：</h5>   				
   			</td>
   			<td>
   				<input type="text" name="uid" id="userid" />
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
   				<input type="password" id="userpass1" name="userpass1"/>
   			</td>
   		</tr>
   		<tr>
   			<td>
   				<h5>确认密码:</h5>
   			</td>
   			<td>
   				<input type="password" id="userpass2" name="userpass2"/>
   			</td>
   		</tr>
   		<tr>
   			<td>
   				<h5>性别:</h5>
   			</td>
   			<td>
   				<input type="text" id="usersex" name="usersex"/>
   			</td>
   		</tr>
   		<tr>
   			<td>
   				<h5>年龄:</h5>
   			</td>
   			<td>
   				<input type="text" id="userage" name="userage"/>
   			</td>
   		</tr>
   		<tr>
   			<td>
   				<input type="button" name="tijiao" value="取消" onclick="back()">
   			</td>
   			<td>
   				<input type="button" name="zhuce" value="注册" onclick="checkregister()"/>
   			</td>
   		</tr>
   	</table>
   		<%
   		if(session.getAttribute("zhuce")!=null){
   	%>
   		<font color="red" size="5px"><%=session.getAttribute("zhuce") %></font>
   	<%
   		}
   	
   	%>
   	</form>
  </div>
</div>
  </body>
</html>
