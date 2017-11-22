package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import bean.Day;
import library.LibraryConnectDb;

public class ModelDay {
	private LibraryConnectDb libConect;
	private Connection conn;
	private Statement st;
	private ResultSet rs;
	private PreparedStatement pst;
	private String table;
	
	public ModelDay(){
		libConect = new LibraryConnectDb();
		this.table = "day";
	}
	
	public ArrayList<Day> getList(){
		conn = libConect.getConnectMySQL();
		ArrayList<Day> listDay = new ArrayList<>();
		String sql = "SELECT * FROM " + table;
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()){
				Day objDay = new Day(rs.getInt("id_day"), rs.getInt("value"));
				listDay.add(objDay);
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
		return listDay;
	}
}
