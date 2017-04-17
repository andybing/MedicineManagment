package leader.andy.yes;

import java.sql.*;
public class jdbc 
{
	Connection conn=null;
	Statement s=null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	public jdbc()
	{
		//声明JDBC驱动程序
		//String JDriver="com.microsoft.sqlserver.jdbc.SQLServerDriver";
		//定义JDBC的url对象
		String conURL="jdbc:sqlserver://localhost:1433;databaseName=andydata;user=sa;password=123456";
		try
		{
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
		}
		catch(Exception e)
		{
			System.out.println("无法加载JDBC驱动程序"+e.getMessage());
		}
		
		try
		{
			//连接数据库URL
			conn=DriverManager.getConnection(conURL);
			s=conn.createStatement();
			//查询
			String sql=new String("select * from medicine");
			rs=s.executeQuery(sql);
			while(rs.next())
			{
				
			}
			//System.out.println("数据库操作成功!!!");
		}
		catch(SQLException e)
		{
			System.out.println("SQLException:"+e.getMessage());
		}
		finally
		{
			try
			{
				if(ps!=null)
				{
					ps.close();
					ps=null;
				}
				if(conn!=null)
				{
					conn.close();
					conn=null;
				}
			}
			catch(SQLException e)
			{
				e.printStackTrace();
			}
		}
	}
	
}
