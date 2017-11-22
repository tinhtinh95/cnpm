package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import bean.Month;
import library.LibraryConnectDb;

public class ModelMonth {
	private LibraryConnectDb libConect;
	private Connection conn;
	private Statement st;
	private ResultSet rs;
	private PreparedStatement pst;
	private String table;
	
	public ModelMonth(){
		libConect = new LibraryConnectDb();
		this.table = "month";
	}
	
	public ArrayList<Month> getList(){
		conn = libConect.getConnectMySQL();
		ArrayList<Month> listMonth = new ArrayList<>();
		String sql = "SELECT * FROM " + table;
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()){
				Month objMonth = new Month(rs.getInt("id_month"), rs.getInt("value"));
				listMonth.add(objMonth);
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
		return listMonth;
	}
}
