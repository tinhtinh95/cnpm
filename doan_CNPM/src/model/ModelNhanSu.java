package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;


import bean.NhanSu;
import library.LibraryConnectDb;

public class ModelNhanSu {
	private LibraryConnectDb libConect;
	private Connection conn;
	private Statement st;
	private ResultSet rs;
	private PreparedStatement pst;
	
	public ModelNhanSu(){
		libConect = new LibraryConnectDb();
	}
	
	public ArrayList<NhanSu> getList(){
		conn = libConect.getConnectMySQL();
		ArrayList<NhanSu> listNhanSu = new ArrayList<>();
		String sql = "select mabs as ma, tenbs as ten, ngaysinh,quequan,gioitinh from bacsi\r\n" + 
				"UNION\r\n" + 
				"SELECT magv as ma, tengv as ten, ngaysinh,quequan,gioitinh from giangvien" ;
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()){
				NhanSu objNhanSu = new NhanSu(rs.getString("ma"), rs.getString("ten"), rs.getDate("ngaysinh"), rs.getString("quequan"),rs.getInt("gioitinh"));
				listNhanSu.add(objNhanSu);
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
		return listNhanSu;
	}
	public ArrayList<NhanSu> getListNoAccount(){
		conn = libConect.getConnectMySQL();
		ArrayList<NhanSu> listNhanSu = new ArrayList<>();
		String sql = "select mabs as ma,tenbs as ten from bacsi where mabs not in (select users.maNhanSu from bacsi INNER JOIN users on bacsi.mabs=users.maNhanSu)\r\n" + 
				"UNION\r\n" + 
				"select magv as ma,tengv as ten from giangvien where magv not in (select users.maNhanSu from giangvien INNER JOIN users on giangvien.magv=users.maNhanSu)" ;
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()){
				NhanSu objNhanSu = new NhanSu(rs.getString("ma"), rs.getString("ten"));
				listNhanSu.add(objNhanSu);
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
		return listNhanSu;
	}

//	public int addItem(NhanSu objNhanSu) {
//		conn = libConect.getConnectMySQL();
//		int result = 0;
//		String sql = "INSERT INTO " + table + " (mabs,tenbs,ngaysinh,quequan,gioitinh) VALUE(?,?,?,?,?)";
//		try {
//			pst = conn.prepareStatement(sql);
//			pst.setString(1, objNhanSu.getMaBS());
//			pst.setString(2, objNhanSu.getTenBS());
//			pst.setDate(3, (Date) objNhanSu.getNgaySinh());
//			pst.setString(4, objNhanSu.getQuequan());
//			pst.setInt(5, objNhanSu.getGioiTinh());
//			pst.executeUpdate();
//			result = 1;
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}finally{
//			try {
//				pst.close();
//				conn.close();
//			} catch (SQLException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//		}
//		return result;
//	}
//
//	public NhanSu checkMaBS(String mabs) {
//		conn = libConect.getConnectMySQL();
//		NhanSu objNhanSu = null;
//		String sql = "SELECT * FROM " + table + " WHERE mabs = ?";
//		try {
//			pst = conn.prepareStatement(sql);
//			pst.setString(1, mabs);
//			rs = pst.executeQuery();
//			if(rs.next()){
//				objNhanSu = new NhanSu(rs.getString("mabs"), rs.getString("tenbs"), rs.getDate("ngaysinh"), rs.getString("quequan"),rs.getInt("gioitinh"));
//			}
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}finally{
//			try {
//				rs.close();
//				pst.close();
//				conn.close();
//			} catch (SQLException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//		}
//		return objNhanSu;
//	}
//
//	public int delItem(String mbs) {
//		conn = libConect.getConnectMySQL();
//		int result = 0;
//		String sql = "DELETE FROM " + table + " WHERE mabs = ?";
//		try {
//			pst = conn.prepareStatement(sql);
//			pst.setString(1, mbs);
//			pst.executeUpdate();
//			result = 1;
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}finally{
//			try {
//				pst.close();
//				conn.close();
//			} catch (SQLException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//		}
//		return result;
//	}
//
//	public NhanSu getItem(String mbs) {
//		conn = libConect.getConnectMySQL();
//		NhanSu objNhanSu =null;
//		String sql = "SELECT * FROM " + table + " WHERE mabs = ?";
//		try {
//			pst = conn.prepareStatement(sql);
//			pst.setString(1, mbs);
//			rs = pst.executeQuery();
//			if(rs.next()){
//				objNhanSu = new NhanSu(rs.getString("mabs"), rs.getString("tenbs"), rs.getDate("ngaysinh"), rs.getString("quequan"),rs.getInt("gioitinh"));
//			}
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}finally{
//			try {
//				pst.close();
//				conn.close();
//			} catch (SQLException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//		}
//		return objNhanSu;
//	}
//
	public int editItem(String maNS, String nameNS) {
		conn = libConect.getConnectMySQL();
		int result = 0;
		String sql="Update giangvien set tengv=? where magv=?";
		if(maNS.substring(0, 2).equals("BS")){
			sql="Update bacsi set tenbs=? where mabs=?";
		}
		try {
			pst =conn.prepareStatement(sql);
			pst.setString(1, nameNS);
			pst.setString(2, maNS);
			pst.executeUpdate();
			result = 1;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return result;
	}
//	
//	public int countBS(){
//		conn = libConect.getConnectMySQL();
//		int result = 0;
//		String sql = "SELECT COUNT(*) as number FROM " + table;
//		try {
//			st = conn.createStatement();
//			rs = st.executeQuery(sql);
//			if(rs.next()){
//				result = rs.getInt("number");
//			}
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}finally{
//			try {
//				rs.close();
//				st.close();
//				conn.close();
//			} catch (SQLException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//		}
//		return result;
//	}
}
