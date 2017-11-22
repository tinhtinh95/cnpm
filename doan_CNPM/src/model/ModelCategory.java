package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import bean.Category;
import library.LibraryConnectDb;

public class ModelCategory {
	private LibraryConnectDb libConect;
	private Connection conn;
	private Statement st;
	private ResultSet rs;
	private PreparedStatement pst;
	private String table;
	
	public ModelCategory(){
		libConect = new LibraryConnectDb();
		this.table = "category";
	}
	
	public ArrayList<Category> getList(){
		conn = libConect.getConnectMySQL();
		ArrayList<Category> listCat = new ArrayList<>();
		String sql = "SELECT * FROM " + table;
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()){
				Category objCat = new Category(rs.getInt("id_cat"), rs.getString("name_cat"));
				listCat.add(objCat);
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
		return listCat;
	}
	
	public Category checkCat(String namecat){
		conn = libConect.getConnectMySQL();
		Category objCat = null;
		String sql = "SELECT * FROM " + table + " WHERE name_cat = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, namecat);
			rs = pst.executeQuery();
			if(rs.next()){
				objCat = new Category(rs.getInt("id_cat"), rs.getString("name_cat"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				pst.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return objCat;
	}
	
	public int addCategory(Category objCat){
		conn = libConect.getConnectMySQL();
		int result = 0;
		String sql = "INSERT INTO " + table + " (name_cat) VALUES(?)";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, objCat.getName_cat());
			pst.executeUpdate();
			result = 1;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				pst.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return result;
	}
	
	public Category getObjCatByID(int cid){
		conn = libConect.getConnectMySQL();
		Category objCat = new Category();
		String sql ="SELECT * FROM " + table + " WHERE id_cat = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, cid);
			rs = pst.executeQuery();
			if(rs.next()){
				objCat = new Category(rs.getInt("id_cat"), rs.getString("name_cat"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				pst.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return objCat;
	}
	
	public int editCategory(Category objCat){
		conn = libConect.getConnectMySQL();
		int result = 0;
		String sql = "UPDATE " + table + " SET name_cat = ? WHERE id_cat = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, objCat.getName_cat());
			pst.setInt(2, objCat.getId_cat());
			pst.executeUpdate();
			result = 1;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				pst.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return result;
	}
	
	public int delCategory(int cid){
		conn = libConect.getConnectMySQL();
		int result = 0;
		String sql = "DELETE FROM " + table + " WHERE id_cat = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, cid);
			pst.executeUpdate();
			result = 1;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				pst.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return result;
	}
	
}
