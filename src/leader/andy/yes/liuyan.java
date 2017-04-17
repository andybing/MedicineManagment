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

public class liuyan extends HttpServlet {

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
//		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
//		out.println("<HTML>");
//		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
//		out.println("  <BODY>");
//		out.print("    This is ");
//		out.print(this.getClass());
//		out.println(", using the POST method");
//		out.println("  </BODY>");
//		out.println("</HTML>");
//		out.flush();
//		out.close();
		String biaoti=request.getParameter("title");
		String context=request.getParameter("content");
		String name=(String) request.getParameter("yonghuming");
		request.setAttribute ("yonghuming", name);
		request.getRequestDispatcher("seeliuyan").forward(request, response);
		Connection con = null;
		Statement st = null;
		ResultSet rs;
		PreparedStatement ps;
		try
		{
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			//String name1=new String(request.getParameter("uname"));
			
			String url="jdbc:sqlserver://localhost;databaseName=andydata";
			String user="sa";
			String password="123456";
			con=DriverManager.getConnection(url,user,password);
			st=con.createStatement();
			String r="insert into liuyan values('"+name+"','"+context+"')";
			//ps=con.prepareStatement("delete from registers where name=?");
			//ps.setString(1,"于明启");
			//ps.executeUpdate();
			st.executeUpdate(r);
//			out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
//			out.println("<HTML>");
//			out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
//			out.println("  <BODY>");
			out.println("<center>");
//			out.print("    This is ");
//			out.print(this.getClass());
//			out.println(", using the POST method");
			out.println("<h3><br><br><br><br><br><br><br><br><br><br>恭喜,留言成功!<h3>");
			out.println("<h3><br>三秒后自动返回留言查看界面...<h3>");
			//out.println("用户名："+request.getSession().getAttribute("yonghuming"));
			response.setHeader("Refresh","3;URL=seeliuyan");
			//response.sendRedirect("login.html");
			out.println("</center>");
//			out.println("  </BODY>");
//			out.println("</HTML>");
//			out.flush();
//			out.close();
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}
