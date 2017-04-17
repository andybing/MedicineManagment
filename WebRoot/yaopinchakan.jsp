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
  <script type="text/javascript">
  	function chakan1()
  	{
  		var mid=document.getElementById("mid");
  		if(mid.value=="")
  		{
  			alert("请输入药品编号！");
  			mid.focus();
  			return ;
  		}
  		chakan_submit.submit();
  	}
  	function chakan2()
  	{
  		var mname=document.getElementById("mname");
  		if(mname.value=="")
  		{
  			alert("请输入药品名称");
  			mname.focus();
  			return ;
  		}
  		chakan_submit.submit();
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
		<li><a>药品查看</a></li>
		<li><a href="xinzeng.jsp">新增药品</a></li>
		<li><a href="chuli.jsp">处理药品(过期)</a></li>
		<li><a href="goumai.jsp">药品购买</a></li>
		<li class="end"><a>留言反馈</a></li>
	</ul>	

</div>

<div id="sidebar">
	<ul>
		<li>欢迎您~亲爱的管理员【<%=(String)session.getAttribute("yonghuming")%>】</li>
		
		<li><a>全部药品</a></li>
		<li><a href="guoqi.jsp">过期药品</a></li>
		<li><a href="xiaoshou.jsp">药品销售情况</a></li>
		<li><a href="kucun.jsp">药品库存情况</a></li>
		<li><a href="tuichu.jsp"></a></li>
		
		
		<li><a href="leader.andy.yes.zhuxiao" onclick="alert('您确定要注销登录嘛？')">注销登录</a></li>
		<li><a href="leader.andy.yes.tuichu" onclick="alert('您确定要退出登录嘛？')">退出系统</a></li>
		
	</ul>
</div>

<div id="new"><br>
<p>全部药品信息</p>
<form action="yaopinchakan1.jsp" name="chakan_submit">
	<center>
	请输入需要查找的药品名称：<input type="text" name="mname" id="mname"/><input type="button" value="查看" onclick="chakan2()"/><br><br>
	</center>
</form>
<table border="1">
	<tr>
		<td>药品编号</td>
		<td>药品名</td>
		<td>药品单价</td>
		<td>制造厂</td>
		<td>生产日期</td>
		<td>保质期</td>
		<td>分类</td>
		<td>作用</td>
	</tr>

<%
	Connection conn=null;
	Statement s=null;
	Statement s1=null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	ResultSet rs1=null;
	int pageNow=1;
	int pageSize=10;
	int pageCount,pageCount1;
	int i=1;
	
	String apage=request.getParameter("pageNow");
	if(apage!=null)
	{
		pageNow=Integer.parseInt(apage);
	}
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
		s1=conn.createStatement();
		//查询
		
		String sql="select top 10 * from medicine where mid not in(select top "+10*(pageNow-1)+" mid from medicine order by mid)order by mid";
		rs=s.executeQuery(sql);
		
		
		while(rs.next())
		{
%>
	<tr>
		<td><%=rs.getString("mid")%></td>
		<td><%=rs.getString("mname")%></td>
		<td><%=rs.getDouble("mprice")%></td>
		<td><%=rs.getString("mmaker")%></td>
		<td><%=rs.getDate("mdata")%></td>
		<td><%=rs.getString("mbaozhiqi")%></td>
		<td><%=rs.getString("mclass")%></td>
		<td><%=rs.getString("mfunction")%></td>
	</tr>

<%
		}
		rs1=s1.executeQuery("select count(*) from medicine");
		while(rs1.next()){
			count=rs1.getInt(1);
		}
		pageCount=count/10;
		pageCount1=count%10;
		if(pageCount1!=0 && pageCount1<10)
		{
			pageCount=pageCount+1;
		}
		//out.println("<h2>"+pageCount+"</h2>");
		out.println("<center>");
		if(pageNow<=1)
		{
			out.println("<a href=yaopinchakan.jsp?pageNow="+(pageNow+1)+">"+"下一页"+"</a>");
		}else if(pageNow>=pageCount)
		{
			out.println("<a href=yaopinchakan.jsp?pageNow="+(pageNow-1)+">"+"上一页"+"</a>");
			//out.println("<a href=yaopinchakan.jsp?pageNow="+(pageNow+1)+">"+"下一页"+"</a>");
		}else
		{
			out.println("<a href=yaopinchakan.jsp?pageNow="+(pageNow-1)+">"+"上一页"+"</a>");
			out.println("<a href=yaopinchakan.jsp?pageNow="+(pageNow+1)+">"+"下一页"+"</a>");
		}
		out.println("</center>");
		//System.out.println("数据库操作成功!!!");
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
</table>
</div>


<div id="footer">
	<p>COPYRIGHT &copy; 青岛理工大学计算机工程学院计算121于明启</p>
</div>
</body>
</html>