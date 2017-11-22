package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import bean.Year;
import library.LibraryConnectDb;

public class ModelYear {
	private LibraryConnectDb libConect;
	private Connection conn;
	private Statement st;
	private ResultSet rs;
	private PreparedStatement pst;
	private String table;
	
	public ModelYear(){
		libConect = new LibraryConnectDb();
		this.table = "year";
	}
	
	public ArrayList<Year> getList(){
		conn = libConect.getConnectMySQL();
		ArrayList<Year> lisYear = new ArrayList<>();
		String sql = "SELECT * FROM " + table;
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()){
				Year objYear = new Year(rs.getInt("id_year"), rs.getInt("value"));
				lisYear.add(objYear);
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
		return lisYear;
	}
}
