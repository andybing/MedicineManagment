package leader.andy.yes;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.interfaces.RSAKey;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.text.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class tianjia extends HttpServlet {

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
		String mid2=request.getParameter("id");
		String mname2=request.getParameter("name");
		String mprice1=request.getParameter("price");
		//double mprice2=Double.parseDouble(mprice1);
		String mmaker2=request.getParameter("maker");
		String mdata2=request.getParameter("data");
		String kcount=request.getParameter("kcount");
		int kcount1=Integer.parseInt(kcount);
//		Date mdata=null;
//		SimpleDateFormat date=new SimpleDateFormat("yyyy-xx-zz");
//		try {
//			mdata=date.parse(mdata1);
//		} catch (ParseException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		String mbaozhiqi2=request.getParameter("baozhiqi");
		String mclass2=request.getParameter("class");
		String mfunction2=request.getParameter("function");
		//System.out.println(mid);
		Connection con = null;
		Statement st1 = null;
		Statement st2 = null;
		Statement st3 = null;
		Statement st4 = null;
		Statement st5 = null;
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
		int count = 0,kcount2=0;
		try {
			con=DriverManager.getConnection(url,user,password1);
			st1=con.createStatement();
			st2=con.createStatement();
			st3=con.createStatement();
			st4=con.createStatement();
			st5=con.createStatement();
			String sql1="select mid from medicine where mid='"+mid2+"'";
			String sql2="select kcount from kucun where kid='"+mid2+"'";
			rs1=st1.executeQuery(sql1);
			rs2=st2.executeQuery(sql2);
			if(rs1.next())
			{
				while(rs2.next())
				{
					count=rs2.getInt(1);
				}
				kcount2 = count+kcount1;
				String sql3="update kucun set kcount='"+kcount2+"' where kid='"+mid2+"'";	
				st3.executeUpdate(sql3);
			}else {
				{
					String sql4="insert into medicine values('"+mid2+"','"+mname2+"','"+mprice1+"','"+mmaker2+"','"+mdata2+"','"+mbaozhiqi2+"','"+mclass2+"','"+mfunction2+"')";
					String sql5="insert into kucun values('"+mid2+"','"+mname2+"','"+mprice1+"','"+kcount1+"')";
					st4.executeUpdate(sql4);
					st5.executeUpdate(sql5);
				}
			}
			request.getRequestDispatcher("xinzeng.jsp").forward(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println(e);
		}finally{
			try {
				rs1.close();
				rs2.close();				
				st1.close();
				st2.close();
				st3.close();
				st4.close();
				st5.close();
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		
		
	}

}
