package leader.andy.yes;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
public class register extends HttpServlet {
	

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String uid=request.getParameter("uid");
		String uname=new String(request.getParameter("uname"));
		String upassword=new String(request.getParameter("userpass1"));
		String sex=request.getParameter("usersex");
		String age=request.getParameter("userage");
		Connection con;
		Statement st;
		try
		{
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			String url="jdbc:sqlserver://localhost;databaseName=andydata";
			String user="sa";
			String password="123456";
			con=DriverManager.getConnection(url,user,password);
			st=con.createStatement();
			String r="insert into register1 values('"+uid+"','"+uname+"','"+upassword+"','"+sex+"','"+age+"')";

			st.executeUpdate(r);

			request.getRequestDispatcher("loginmain.jsp").forward(request, response);
		
		}catch(Exception e)
		{
			request.getSession().setAttribute("zhuce", "用户名已存在~");
			request.getRequestDispatcher("register.jsp").forward(request, response);
			e.printStackTrace();
		}
	}
}
