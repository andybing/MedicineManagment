package leader.andy.yes;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class goumai extends HttpServlet {

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
		String mid=(String)request.getParameter("id");
		String xbingren=(String)request.getParameter("name");
		String count1=request.getParameter("kcount");
		int count=Integer.parseInt(count1);
		Connection con = null;
		Statement st1 = null;
		Statement st2 = null;
		Statement st3 = null;
		Statement st4 = null;
		ResultSet rs1=null;
		ResultSet rs2=null;
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
			rs1=st1.executeQuery("select kcount from kucun where kid='"+mid+"'");
			if(rs1.next()){
				int count2=rs1.getInt(1);
				int shengyu=count2-count;
				if(shengyu>0)
				{
					String mname = null;
					double mprice = 0;
					request.setAttribute("temp", "1");
					rs2=st2.executeQuery("select mname,mprice from medicine where mid='"+mid+"'");
					while(rs2.next())
					{
						mname=rs2.getString(1);
						mprice=rs2.getDouble(2);
					}
					st3.executeUpdate("insert into xiaoshou values('"+mid+"','"+mname+"','"+mprice+"','"+count+"','"+xbingren+"')");
					st4.executeUpdate("update kucun set kcount='"+shengyu+"' where kid='"+mid+"'");
				}else{
					//System.out.println("12");
				request.setAttribute("temp", "0");
				}
			}
			request.getRequestDispatcher("goumai.jsp").forward(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				st1.close();
				st2.close();
				st3.close();
				st4.close();
				rs1.close();
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}
