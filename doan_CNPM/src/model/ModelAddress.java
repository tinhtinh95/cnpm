package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import bean.Address;
import library.LibraryConnectDb;

public class ModelAddress {
	private LibraryConnectDb libConect;
	private Connection conn;
	private Statement st;
	private ResultSet rs;
	private PreparedStatement pst;
	private String table;
	
	public ModelAddress(){
		libConect = new LibraryConnectDb();
		this.table = "provinces";
	}
	
	public ArrayList<Address> getList(){
		conn = libConect.getConnectMySQL();
		ArrayList<Address> lisAddress = new ArrayList<>();
		String sql = "SELECT * FROM " + table;
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()){
				Address objAddress = new Address(rs.getInt("id"), rs.getString("title"));
				lisAddress.add(objAddress);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				rs.close();
				st.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return lisAddress;
	}
}
