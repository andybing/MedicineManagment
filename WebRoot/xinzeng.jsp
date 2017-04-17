<%@page import="java.security.interfaces.RSAKey"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="leader.andy.yes.*" %>
<%@ page import="java.sql.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%!
	int count;
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
	<link rel="stylesheet" type="text/css" href="CSS/yaopinchakan.css">
	<link rel="stylesheet" type="text/css" href="CSS/welcome.css">


  </head>
  <script type="text/javaScript">
  	function checkxinzeng()
  	{
  		var mid=document.getElementById("mid");
  		if(mid.value=="")
  		{
  			alert("请输入药品编号！");
  			mid.focus();
  			return ;
  		}
  		var mname=document.getElementById("mname");
  		if(mname.value=="")
  		{
  			alert("请输入药品名称！");
  			mname.focus();
  			return ;
  		}
  		var mprice=document.getElementById("mprice");
  		if(mprice.value=="")
  		{
  			alert("请输入药品单价！");
  			mprice.focus();
  			return ;
  		}
  		var mmaker=document.getElementById("mmaker");
  		if(mmaker.value=="")
  		{
  			alert("请输入药品产地！");
  			mmaker.focus();
  			return ;
  		}
  		var mdata=document.getElementById("mdata");
  		if(mdata.value=="")
  		{
  			alert("请输入药品生产日期！");
  			mdata.focus();
  			return ;
  		}
  		var mbaozhiqi=document.getElementById("mbaozhiqi");
  		if(mbaozhiqi.value=="")
  		{
  			alert("请输入药品保质期！");
  			mbaozhiqi.focus();
  			return ;
  		}
  		var mclass=document.getElementById("mclass");
  		if(mclass.value=="")
  		{
  			alert("请输入药品种类！");
  			mclass.focus();
  			return ;
  		}
  		var mfunction=document.getElementById("mfunction");
  		if(mfunction.value=="")
  		{
  			alert("请输入药品作用！");
  			mfunction.focus();
  			return ;
  		}
  		var kcount=document.getElementById("kcount");
  		if(kcount.value=="")
  		{
  			alert("请输入药品作用！");
  			kcount.focus();
  			return ;
  		}
  		alert("药品添加成功");
  		xinzeng_submit.submit();
  	}
  </script>
<body>

<div id="header">
	<img src="images/shouye.jpg"></img>
</div>

<div id="nav">
	<ul>
		<li><a href="main.jsp">首页</a></li>
		<li><a href="yaopinjianjie.jsp">药品简介</a></li>
		<li><a href="yaopinchakan.jsp">药品查看</a></li>
		<li><a>新增药品</a></li>
		<li><a href="chuli.jsp">处理药品(过期)</a></li>
		<li><a href="goumai.jsp">药品购买</a></li>
		<li class="end"><a>留言反馈</a></li>
	</ul>	

</div>

<div id="sidebar">
	<ul>
		<li>欢迎您~亲爱的管理员【<%=(String)session.getAttribute("yonghuming")%>】</li>
		
		<li><a href="leader.andy.yes.zhuxiao" onclick="alert('您确定要注销登录嘛？')">注销登录</a></li>
		<li><a href="leader.andy.yes.tuichu" onclick="alert('您确定要退出登录嘛？')">退出系统</a></li>
		
	</ul>
</div>

<div id="new"><br>
<p>新增药品信息</p><br><br>

<form action="tianjia" name="xinzeng_submit" method="post">
<center>
	请输入药品编号:<input type="text" id="mid" name="id"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	请输入药品名称:<input type="text" id="mname" name="name"/><br><br>
	请输入药品单价:<input type="text" id="mprice" name="price"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	请输入药品产地:<input type="text" id="mmaker" name="maker"/><br><br>
	请输入生产日期:<input type="text" id="mdata" name="data"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	请输入的保质期:<input type="text" id="mbaozhiqi" name="baozhiqi"/><br><br>
	请输入药品分类:<input type="text" id="mclass" name="class"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	请输入药品作用:<input type="text" id="mfunction" name="function"/><br><br>
	请输入药品数量:<input type="text" id="kcount" name="kcount"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	这行为了填充哦:<input type="text" /><br><br>
	</center>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="button" value="添加" onclick="checkxinzeng()"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="reset" value="重置" /><br><br>
	<center>
	<h3>添加要求:</h3><br>
	<h3>1.药品编号不大于20字符;</h3><br>
	<h3>2.药品生产日期格式:**-**-**;</h3><br>
	<h3>3.所有项目必须填写完整！</h3>
	</center>
</form>

<%
	Connection conn=null;
	Statement s=null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	//声明JDBC驱动程序
	//String JDriver="com.microsoft.sqlserver.jdbc.SQLServerDriver";
	//定义JDBC的url对象
	String conURL="jdbc:sqlserver://localhost:1433;databaseName=andydata;user=sa;password=123456";
	try
	{
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
	}
	catch(Exception e)
	{
		System.out.println("无法加载JDBC驱动程序"+e.getMessage());
	}
		
	try
	{
		//连接数据库URL
		conn=DriverManager.getConnection(conURL);
		s=conn.createStatement();
		
	}
	catch(SQLException e)
	{
		//System.out.println("SQLException:"+e.getMessage());
	}
	finally
	{
		try
		{
			if(ps!=null)
			{
				ps.close();
				ps=null;
			}
			if(conn!=null)
			{
				conn.close();
				conn=null;
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
	}	
 %>

</div>


<div id="footer">
	<p>COPYRIGHT &copy; 青岛理工大学计算机工程学院计算121于明启</p>
</div>
</body>
</html>