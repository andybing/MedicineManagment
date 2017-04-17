<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="leader.andy.yes.User"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'main.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="javaScripts/jquery.js"></script>
	<script type="text/javascript" src="javaScripts/main.js"></script>
	
	<link rel="stylesheet" type="text/css" href="CSS/welcome.css">


  </head>
  
<body>
<%
	String uname=(String)session.getAttribute("yonghuming");
	User u=new User();
	u.setUsername(uname);
 %>
<div id="header">
	<img src="images/shouye.jpg"></img>
</div>

<div id="nav">
	<ul>
		<li><a>首页</a></li>
		<li><a href="yaopinjianjie.jsp">药品简介</a></li>
		<li><a href="yaopinchakan.jsp">药品查看</a></li>
		<li><a href="xinzeng.jsp">新增药品</a></li>
		<li><a href="chuli.jsp">处理药品(过期)</a></li>
		<li><a href="goumai.jsp">药品购买</a></li>
		<li class="end"><a>留言反馈</a></li>
	</ul>	

</div>

<div id="sidebar">
	<ul>
		<li>欢迎您~亲爱的管理员【<%=uname%>】</li>
		<li><a href="leader.andy.yes.zhuxiao" onclick="alert('您确定要注销登录嘛？')">注销登录</a></li>
		<li><a href="leader.andy.yes.tuichu" onclick="alert('您确定要退出登录嘛？')">退出系统</a></li>
	</ul>
</div>

<div id="new">
<img src="images/yf3.jpg"></img><img src="images/yaofang1.jpg"></img>
<img src="images/yf2.jpg"></img>
<img src="images/yaofang.jpg"></img>

</div>

<div id="footer">
	<p>COPYRIGHT &copy; 青岛理工大学计算机工程学院计算121于明启</p>
</div>
</body>
</html>