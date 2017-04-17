package leader.andy.yes;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class seeliuyan extends HttpServlet {

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
//		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
//		out.print("    This is ");
//		out.print(this.getClass());
//		out.println(", using the POST method");
//		out.println("  </BODY>");
//		out.println("</HTML>");
//		out.flush();
//		out.close();
		Connection con = null;
		Statement st = null;
		ResultSet rs;
		PreparedStatement ps;
		String name=(String)request.getAttribute("yonghuming");
		out.println(name);
		try
		{
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		try
		{
			String url="jdbc:sqlserver://localhost;databaseName=andydata";
			String user="sa";
			String password1="123456";
			con=DriverManager.getConnection(url,user,password1);
			st=con.createStatement();
			rs=st.executeQuery("select neirong from liuyan where yonghuming='"+name+"'");
			out.println("<center>");
			while(rs.next())
			{
				String neirong=rs.getString(1);
				out.println("用户名:"+name+"                      留言内容:"+neirong);
				out.println("<br><br>");
			}
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
			out.println("连接失败");
		}
	}
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
}
