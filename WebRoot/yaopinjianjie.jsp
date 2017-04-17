<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
	<link rel="stylesheet" type="text/css" href="CSS/yaopinjianjie.css">
	<link rel="stylesheet" type="text/css" href="CSS/welcome.css">


  </head>
  
<body>

<div id="header">
	<img src="images/shouye.jpg"></img>
</div>

<div id="nav">
	<ul>
		<li><a href="main.jsp">首页</a></li>
		<li><a>药品简介</a></li>
		<li><a href="yaopinchakan.jsp">药品查看</a></li>
		<li><a href="xinzeng.jsp">新增药品</a></li>
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

<div id="new">
	<img src="images/hongmeisu.jpg"></img>
	<img src="images/yaowufanying.jpg"></img>
	<p class="p1">   根据《中华人民共和国药品管理法》第一百零二条关于药品的定义：
	药品是指用于预防、治疗、诊断人的疾病，有目的地调节人的生理机能并规定有适应症或者功能主治、用法和用量的物质，
	包括中药材、中药饮片、中成药、化学原料药及其制剂、抗生素、生化药品、放射性药品、血清、疫苗、血液制品和诊断药品等。
	2013年1月，国家发展和改革委员会发出通知，决定从2013年2月1日起调整呼吸、
	解热镇痛和专科特殊用药等药品的最高零售限价，共涉及20类药品，400多个品种、
	700多个代表剂型规格，平均降价幅度为15%，其中高价药品平均降幅达到20%。</p>

</div>

<div id="footer">
	<p>COPYRIGHT &copy; 青岛理工大学计算机工程学院计算121于明启</p>
</div>
</body>
</html>