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

@SuppressWarnings("serial")
public class chuli extends HttpServlet {

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
		String sid=request.getParameter("sid");
		Connection con = null;
		Statement st1 = null;
		Statement st2 = null;
		Statement st3 = null;
		Statement st4 = null;
		ResultSet rs=null;
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			
		} catch (Exception e) {
			// TODO: handle exception
			//out.println(e);
		}
		String url="jdbc:sqlserver://localhost;databaseName=andydata";
		String user="sa";
		String password1="123456";
		try {
			con=DriverManager.getConnection(url,user,password1);
			st1=con.createStatement();
			st2=con.createStatement();
			st3=con.createStatement();
			st4=con.createStatement();
			rs=st4.executeQuery("select mid from Gmedicine where mid='"+sid+"'");
			if(rs.next()){
				st1.executeUpdate("delete from medicine where mid='"+sid+"'");
				st2.executeUpdate("delete from kucun where kid='"+sid+"'");
				st3.executeUpdate("delete from Gmedicine where mid='"+sid+"'");
			}else{
				
				
			}
				request.getRequestDispatcher("chuli.jsp").forward(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				st1.close();
				st2.close();
				st3.close();
				st4.close();
				rs.close();
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}
