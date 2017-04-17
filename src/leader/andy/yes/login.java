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
import javax.servlet.http.HttpSession;

public class login extends HttpServlet {
	
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		
		//验证密码和用户名是否正确
		String ubianhao=request.getParameter("ubianhao");
		String uname=new String(request.getParameter("uname"));
		HttpSession session = request.getSession();		
		session.setAttribute("yonghuming", uname);
		//request.getSession().setAttribute("yonghuming", uname);
		String upassword=new String(request.getParameter("userpass"));
		String shenfen=request.getParameter("shenfen");
		//String register=new String(request.getParameter("zhuce"));
		if(request.getParameter("zhuce")!=null)
		{
			response.sendRedirect("register.jsp");
		}
		Connection con = null;
		Statement st = null;
		ResultSet rs;
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
			rs=st.executeQuery("select gpassword from register1 where gid='"+ubianhao+"'");
		
			if(rs.next())
			{
				//out.print("123");
				//说明有用户存在
				String dbpassword=rs.getString(1);
				if(dbpassword.equals(upassword))
				{
					//out.print("<h3><br><br><br><br><br><br><br><br><br><br>恭喜您，登陆成功!!!<h3>");
					//out.print("<h3><br>三秒之后自动跳转到留言界面！<h3>");
					//System.out.println(request.getSession().getAttribute("yonghuming"));
					if(shenfen.equals("管理员")){
						request.getRequestDispatcher("main.jsp").forward(request, response);
					}
					
				}
				else
				{
					request.setAttribute("fanhui", "输入错误！");
					request.getRequestDispatcher("loginmain.jsp").forward(request, response);
					//out.print("<h3><br><br><br><br><br><br><br><br><br>"+"对不起，您输入的用户名或密码不正确,请重新输入!!<h3>");
				}
			}
			else
			{
				request.setAttribute("fanhui", "输入错误！");
				request.getRequestDispatcher("loginmain.jsp").forward(request, response);
				//out.print("<h3><br><br><br><br><br><br><br><br><br>"+"用户不存在，请先注册~<h3>");
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}

	}

}
