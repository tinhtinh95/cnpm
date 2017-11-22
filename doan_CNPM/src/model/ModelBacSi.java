package model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import bean.BacSi;
import library.LibraryConnectDb;

public class ModelBacSi {
	private LibraryConnectDb libConect;
	private Connection conn;
	private Statement st;
	private ResultSet rs;
	private PreparedStatement pst;
	private String table;
	
	public ModelBacSi(){
		libConect = new LibraryConnectDb();
		this.table = "bacsi";
	}
	
	public ArrayList<BacSi> getList(){
		conn = libConect.getConnectMySQL();
		ArrayList<BacSi> listBacSi = new ArrayList<>();
		String sql = "SELECT * FROM " + table;
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()){
				BacSi objBacSi = new BacSi(rs.getString("mabs"), rs.getString("tenbs"), rs.getDate("ngaysinh"), rs.getString("quequan"),rs.getInt("gioitinh"));
				listBacSi.add(objBacSi);
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
		return listBacSi;
	}

	public int addItem(BacSi objBacSi) {
		conn = libConect.getConnectMySQL();
		int result = 0;
		String sql = "INSERT INTO " + table + " (mabs,tenbs,ngaysinh,quequan,gioitinh) VALUE(?,?,?,?,?)";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, objBacSi.getMaBS());
			pst.setString(2, objBacSi.getTenBS());
			pst.setDate(3, (Date) objBacSi.getNgaySinh());
			pst.setString(4, objBacSi.getQuequan());
			pst.setInt(5, objBacSi.getGioiTinh());
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

	public BacSi checkMaBS(String mabs) {
		conn = libConect.getConnectMySQL();
		BacSi objBacSi = null;
		String sql = "SELECT * FROM " + table + " WHERE mabs = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, mabs);
			rs = pst.executeQuery();
			if(rs.next()){
				objBacSi = new BacSi(rs.getString("mabs"), rs.getString("tenbs"), rs.getDate("ngaysinh"), rs.getString("quequan"),rs.getInt("gioitinh"));
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
		return objBacSi;
	}

	public int delItem(String mbs) {
		conn = libConect.getConnectMySQL();
		int result = 0;
		String sql = "DELETE FROM " + table + " WHERE mabs = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, mbs);
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

	public BacSi getItem(String mbs) {
		conn = libConect.getConnectMySQL();
		BacSi objBacSi =null;
		String sql = "SELECT * FROM " + table + " WHERE mabs = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, mbs);
			rs = pst.executeQuery();
			if(rs.next()){
				objBacSi = new BacSi(rs.getString("mabs"), rs.getString("tenbs"), rs.getDate("ngaysinh"), rs.getString("quequan"),rs.getInt("gioitinh"));
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
		return objBacSi;
	}

	public int editItem(BacSi objBacSi) {
		conn = libConect.getConnectMySQL();
		int result = 0;
		String sql = "UPDATE " + table + " SET tenbs = ?,ngaysinh = ?,quequan = ?,gioitinh=? WHERE mabs = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, objBacSi.getTenBS());
			pst.setDate(2, (Date) objBacSi.getNgaySinh());
			pst.setString(3, objBacSi.getQuequan());
			pst.setInt(4, objBacSi.getGioiTinh());
			pst.setString(5, objBacSi.getMaBS());
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
	
	public int countBS(){
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
