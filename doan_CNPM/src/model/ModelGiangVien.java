package model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import library.LibraryConnectDb;
import bean.GiangVien;

public class ModelGiangVien {
	private LibraryConnectDb libConect;
	private Connection conn;
	private Statement st;
	private ResultSet rs;
	private PreparedStatement pst;
	private String table;
	
	public ModelGiangVien(){
		libConect = new LibraryConnectDb();
		this.table = "giangvien";
	}
	
	public ArrayList<GiangVien> getList(){
		conn = libConect.getConnectMySQL();
		ArrayList<GiangVien> listGiangvien = new ArrayList<>();
		String sql = "SELECT * FROM " + table;
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()){
				GiangVien objGiangvien = new GiangVien(rs.getString("magv"), rs.getString("tengv"), rs.getDate("ngaysinh"), rs.getString("quequan"),rs.getInt("gioitinh"));
				listGiangvien.add(objGiangvien);
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
		return listGiangvien;
	}

	public int addItem(GiangVien objGiangvien) {
		conn = libConect.getConnectMySQL();
		int result = 0;
		String sql = "INSERT INTO " + table + " (magv,tengv,ngaysinh,quequan,gioitinh) VALUE(?,?,?,?,?)";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, objGiangvien.getMaGV());
			pst.setString(2, objGiangvien.getTenGV());
			pst.setDate(3, (Date) objGiangvien.getNgaySinh());
			pst.setString(4, objGiangvien.getQuequan());
			pst.setInt(5, objGiangvien.getGioiTinh());
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

	public GiangVien checkMagv(String magv) {
		conn = libConect.getConnectMySQL();
		GiangVien objGiangvien = null;
		String sql = "SELECT * FROM " + table + " WHERE magv = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, magv);
			rs = pst.executeQuery();
			if(rs.next()){
				objGiangvien = new GiangVien(rs.getString("magv"), rs.getString("tengv"), rs.getDate("ngaysinh"), rs.getString("quequan"),rs.getInt("gioitinh"));
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
		return objGiangvien;
	}

	public int delItem(String mgv) {
		conn = libConect.getConnectMySQL();
		int result = 0;
		String sql = "DELETE FROM " + table + " WHERE magv = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, mgv);
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

	public GiangVien getItem(String mgv) {
		conn = libConect.getConnectMySQL();
		GiangVien objGiangvien =null;
		String sql = "SELECT * FROM " + table + " WHERE magv = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, mgv);
			rs = pst.executeQuery();
			if(rs.next()){
				objGiangvien = new GiangVien(rs.getString("magv"), rs.getString("tengv"), rs.getDate("ngaysinh"), rs.getString("quequan"),rs.getInt("gioitinh"));
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
		return objGiangvien;
	}

	public int editItem(GiangVien objGiangvien) {
		conn = libConect.getConnectMySQL();
		int result = 0;
		String sql = "UPDATE " + table + " SET tengv = ?,ngaysinh = ?,quequan = ?,gioitinh=? WHERE magv = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, objGiangvien.getTenGV());
			pst.setDate(2, (Date) objGiangvien.getNgaySinh());
			pst.setString(3, objGiangvien.getQuequan());
			pst.setInt(4, objGiangvien.getGioiTinh());
			pst.setString(5, objGiangvien.getMaGV());
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
	
	public int countTeacher(){
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
