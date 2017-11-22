package library;

import java.sql.Connection;
import java.sql.DriverManager;

public class LibraryConnectDb {
	private String db = "doan_CNPM";
	private Connection conn;
	private String user = "root";
	private String password =  "";
	private String url = "jdbc:mysql://localhost:3306/"+db+"?useUnicode=true&characterEncoding=UTF-8";
	
	public Connection getConnectMySQL(){
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
	}
	
	public static void main(String[] args) {
		LibraryConnectDb lcdb = new LibraryConnectDb();
		System.out.println(lcdb.getConnectMySQL());
	}
}

