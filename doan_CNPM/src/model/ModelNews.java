package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import bean.News;
import library.LibraryConnectDb;

public class ModelNews {
	private LibraryConnectDb libConect;
	private Connection conn;
	private Statement st;
	private ResultSet rs;
	private PreparedStatement pst;
	private String table;
	
	public ModelNews(){
		libConect = new LibraryConnectDb();
		this.table = "news";
	}
	
	public ArrayList<News> getList(){
		conn = libConect.getConnectMySQL();
		ArrayList<News> listNews = new ArrayList<>();
		String sql = "SELECT *,c.name_cat as namecat FROM news as n INNER JOIN category as c ON n.id_cat=c.id_cat";
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()){
				News objNews = new News(rs.getInt("id_news"), rs.getString("name_news"), rs.getString("mota"), rs.getString("chitiet"), rs.getString("ngaydang"), rs.getString("hinhanh"), rs.getInt("id_cat"),rs.getString("namecat"));
				listNews.add(objNews);
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
		return listNews;
	}
	
	public ArrayList<News> getListByIDCat(int id){
		conn = libConect.getConnectMySQL();
		ArrayList<News> listNews = new ArrayList<>();
		String sql = "SELECT *,c.name_cat as namecat FROM news as n INNER JOIN category as c ON n.id_cat=c.id_cat"
				+ " where c.id_cat="+id;
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()){
				News objNews = new News(rs.getInt("id_news"), rs.getString("name_news"), rs.getString("mota"), rs.getString("chitiet"), rs.getString("ngaydang"), rs.getString("hinhanh"), rs.getInt("id_cat"),rs.getString("namecat"));
				listNews.add(objNews);
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
		return listNews;
	}
	
	public ArrayList<News> getListLimit(){
		conn = libConect.getConnectMySQL();
		ArrayList<News> listNews = new ArrayList<>();
		String sql = "SELECT *,c.name_cat as namecat FROM news as n INNER JOIN category as c ON n.id_cat=c.id_cat ORDER BY id_news DESC LIMIT 5";
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()){
				News objNews = new News(rs.getInt("id_news"), rs.getString("name_news"), rs.getString("mota"), rs.getString("chitiet"), rs.getString("ngaydang"), rs.getString("hinhanh"), rs.getInt("id_cat"),rs.getString("namecat"));
				listNews.add(objNews);
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
		return listNews;
	}
	
	public ArrayList<News> getListLimit2(){
		conn = libConect.getConnectMySQL();
		ArrayList<News> listNews = new ArrayList<>();
		String sql = "SELECT *,c.name_cat as namecat FROM news as n INNER JOIN category as c ON n.id_cat=c.id_cat ORDER BY id_news DESC LIMIT 2";
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()){
				News objNews = new News(rs.getInt("id_news"), rs.getString("name_news"), rs.getString("mota"), rs.getString("chitiet"), rs.getString("ngaydang"), rs.getString("hinhanh"), rs.getInt("id_cat"),rs.getString("namecat"));
				listNews.add(objNews);
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
		return listNews;
	}
	
	public ArrayList<News> getNewsByIDCat(int id_cat){
		conn = libConect.getConnectMySQL();
		ArrayList<News> listNews = new ArrayList<>();
		String sql = "SELECT *,c.name_cat as namecat FROM news as n INNER JOIN category as c ON n.id_cat=c.id_cat where n.id_cat="+id_cat;
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()){
				News objNews = new News(rs.getInt("id_news"), rs.getString("name_news"), rs.getString("mota"), rs.getString("chitiet"), rs.getString("ngaydang"), rs.getString("hinhanh"), rs.getInt("id_cat"),rs.getString("namecat"));
				listNews.add(objNews);
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
		return listNews;
	}
	
	public int addNews(News objNews){
		conn = libConect.getConnectMySQL();
		int result = 0;
		String sql = "INSERT INTO " + table + " (name_news,mota,chitiet,ngaydang,hinhanh,id_cat) VALUES(?,?,?,?,?,?)";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, objNews.getName_news());
			pst.setString(2, objNews.getMota());
			pst.setString(3, objNews.getChitiet());
			pst.setString(4, objNews.getNgaydang());
			pst.setString(5, objNews.getHinhanh());
			pst.setInt(6, objNews.getId_cat());
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
	
	public News getObjNews(int nid){
		conn = libConect.getConnectMySQL();
		News objNews = new News();
		String sql = "SELECT * FROM " + table + " WHERE id_news = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, nid);
			rs = pst.executeQuery();
			if(rs.next()){
				objNews = new News(nid, rs.getString("name_news"), rs.getString("mota"), rs.getString("chitiet"), rs.getString("ngaydang"), rs.getString("hinhanh"), rs.getInt("id_cat"), "");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				rs.close();
				pst.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return objNews;
	}
	
	public int editNews(News objNews){
		conn = libConect.getConnectMySQL();
		int result = 0;
		String sql = "UPDATE " + table + " SET name_news = ?,mota = ?,chitiet = ?,id_cat = ?,hinhanh = ? WHERE id_news = ? LIMIT 1";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, objNews.getName_news());
			pst.setString(2, objNews.getMota());
			pst.setString(3, objNews.getChitiet());
			pst.setInt(4, objNews.getId_cat());
			pst.setString(5, objNews.getHinhanh());
			pst.setInt(6, objNews.getId_news());
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

	public int countNewsByPicture(News objNews) {
		conn = libConect.getConnectMySQL();
		int result = 0;
		String sql = "SELECT COUNT(*) as number FROM " + table + " WHERE hinhanh = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, objNews.getHinhanh());
			rs = pst.executeQuery();
			while(rs.next()){
				result = rs.getInt("number");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				rs.close();
				pst.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return result;
	}
	
	public int delNews(int nid){
		conn = libConect.getConnectMySQL();
		int result = 0;
		String sql = "DELETE FROM " + table + " WHERE id_news = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, nid);
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

	public void delNewsByIDCat(int cid) {
		conn = libConect.getConnectMySQL();
		String sql = "DELETE FROM " + table + " WHERE id_cat = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, cid);
			pst.executeUpdate();
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
	}
	
	public int countNews(){
		conn = libConect.getConnectMySQL();
		int result = 0;
		String sql = "SELECT COUNT(*) as number FROM " + table;
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			if(rs.next()){
				result = rs.getInt("number");
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
		return result;
	}
}
