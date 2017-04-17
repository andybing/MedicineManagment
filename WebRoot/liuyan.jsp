<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'liuyan.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="jquery-easyui/jquery.min.js"></script>
    <script type="text/javascript" src="jquery-easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="javaScripts/index.js"></script>
    <link type="text/css" rel="stylesheet" href="jquery-easyui/themes/default/easyui.css" />
    <link type="text/css" rel="stylesheet" href="jquery-easyui/themes/icon.css" />
	<link rel="stylesheet" type="text/css" href="Css/index.css">
  </head>
  <script type="text/javascript">
  function checkliuyan()
  {
  	var biaoti=document.getElementById("biaoti");
  	if(biaoti.value=="")
  	{
  		alert("请输入标题!");
  		biaoti.focus();
  		return ;
  	}
  	var neirong=document.getElementById("neirong");
  	if(neirong.value=="")
  	{
  		alert("请输入内容!");
  		neirong.focus();
  		return ;
  	}
  	liuyanban.submit();
  }
  </script>
  <body>
  <%String yonghuming=(String)request.getSession().getAttribute("yonghuming"); %>

    <div id="zhongjian">
  	  	<form name="liuyanban" action="liuyan" method="post">
  			<table border="1" cellpadding="1" cellspacing="1">
  			<tr><td style="width: 186px; height: 38px">留言板<td>
  			<tr><td style="height: 43px; width: 186px; ">用户名 </td><td><input type="text" name="yonghuming" value=<%=yonghuming %>></td></tr>
  		    <tr><td style="height: 46px; width: 186px; ">留言标题</td><td><input type="text" id="biaoti" name="title"/></td></tr>	
  			<tr><td style="height: 105px; width: 186px; ">留言内容(限1000字~)</td><td><textarea name="content" id="neirong" rows="5" cols="35"></textarea></td></tr>
  			
  		<tr><td></td><td><input type="button" value="提交" onclick="checkliuyan()"><input type="reset" value="重置"></td></tr>
  		</table>
  	</form>
	</div>
    <div id="box" style="width:400px;height:300px">
        love  Allan!!
    </div>

  </body>
</html>
