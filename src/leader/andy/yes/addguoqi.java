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

public class addguoqi extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String gidString=request.getParameter("gid");
		//System.out.println(gidString);
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		PreparedStatement ps;
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
			st=con.createStatement();
			rs=st.executeQuery("select * from medicine where mid='"+gidString+"'");
			if(rs.next()){
				//System.out.println(rs.getString(8));
				st.executeUpdate("insert into Gmedicine values('"+rs.getString(1)+"','"+rs.getString(2)+"'," +
						"'"+rs.getDouble(3)+"','"+rs.getString(4)+"','"+rs.getDate(5)+"'," +
								"'"+rs.getString(6)+"','"+rs.getString(7)+"','"+rs.getString(8)+"')");
				request.setAttribute("fanhui", "添加成功");
				request.getRequestDispatcher("chuli.jsp").forward(request, response);
			}else{
				request.setAttribute("fanhui", "添加失败");
				request.getRequestDispatcher("chuli.jsp").forward(request, response);
			}
			
		}catch(Exception e){
			request.setAttribute("fanhui", "添加失败");
			request.getRequestDispatcher("chuli.jsp").forward(request, response);
			e.printStackTrace();
		}finally{
			try {
				rs.close();
				st.close();
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
	}

}
