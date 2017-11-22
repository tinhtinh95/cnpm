package model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import library.LibraryConnectDb;
import bean.Phong;

public class ModelPhong {
	private LibraryConnectDb lcdb;
	private Connection conn;
	private Statement st;
	private ResultSet rs;
	
	public ModelPhong(){
		this.lcdb = new LibraryConnectDb();
		this.conn = null;
	}

	public ArrayList<Phong> getList() {
		conn = lcdb.getConnectMySQL();
		String query = "SELECT * FROM phong";
		ArrayList<Phong> listItem = new ArrayList<Phong>();
		Phong item=null;
		try {
			st = conn.createStatement();
			rs = st.executeQuery(query);
			while (rs.next()){
				item = new Phong(rs.getString("maphong"),rs.getString("tenphong"));
				listItem.add(item);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				st.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return listItem;
	}
}
