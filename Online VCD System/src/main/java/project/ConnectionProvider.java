package project;
import java.sql.*;

public class ConnectionProvider {
	

	public static Connection getCon() {
	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","VCDSYSTEM","tiger");
		return con;
	}
	catch(Exception e)
	{
		System.out.println(e);
		return null;
	}
	
	}
}