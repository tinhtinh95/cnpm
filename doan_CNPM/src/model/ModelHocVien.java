package model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import library.LibraryConnectDb;
import bean.HocVien;

public class ModelHocVien {
	private LibraryConnectDb lcdb;
	private Connection conn;
	private Statement st;
	private PreparedStatement pst;
	private ResultSet rs;
	
	public ModelHocVien(){
		this.lcdb = new LibraryConnectDb();
		this.conn = null;
	}

	public ArrayList<HocVien> getList() {
		conn = lcdb.getConnectMySQL();
		String query = "SELECT * FROM hocvien";
		ArrayList<HocVien> listItem = new ArrayList<HocVien>();
		HocVien item=null;
		try {
			st = conn.createStatement();
			rs = st.executeQuery(query);
			while (rs.next()){
				item = new HocVien(rs.getString("mahv"), rs.getString("tenhv"),rs.getDate("ngaysinh"),rs.getInt("gioitinh"),rs.getString("quequan"),rs.getString("maphong"),rs.getString("magv"),rs.getString("mabs"),rs.getDate("ngayvao"),rs.getDate("ngayra"),rs.getString("mucdo"),rs.getString("lichsu"));
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

	public HocVien checkMahv(String mahv) {
		conn = lcdb.getConnectMySQL();
		HocVien objHV = null;
		String sql = "SELECT * FROM hocvien WHERE mahv = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, mahv);
			rs = pst.executeQuery();
			if(rs.next()){
				objHV = new HocVien(rs.getString("mahv"), rs.getString("tenhv"),rs.getDate("ngaysinh"),rs.getInt("gioitinh"),rs.getString("quequan"),rs.getString("maphong"),rs.getString("magv"),rs.getString("mabs"),rs.getDate("ngayvao"),rs.getDate("ngayra"),rs.getString("mucdo"),rs.getString("lichsu"));
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
		return objHV;
	}
	
	public int addItem(HocVien objHocVien) {
		conn = lcdb.getConnectMySQL();
		String query = "INSERT INTO hocvien VALUE(?,?,?,?,?,?,?,?,?,?,?,?)";
		int result = 0;
		try {
			pst = conn.prepareStatement(query);
			pst.setString(1, objHocVien.getMaHV());
			pst.setString(2, objHocVien.getTenHV());
			pst.setDate(3, (Date) objHocVien.getNgaySinh());
			pst.setInt(4, objHocVien.getGioitinh());
			pst.setString(5, objHocVien.getQueQuan());
			pst.setString(6, objHocVien.getMaPhong());
			pst.setString(7, objHocVien.getMaGV());
			pst.setString(8, objHocVien.getMaBS());
			pst.setDate(9, (Date) objHocVien.getNgayVao());
			pst.setDate(10, (Date) objHocVien.getNgayRa());
			pst.setString(11, objHocVien.getMucDo());
			pst.setString(12, objHocVien.getLichSu());
			pst.executeUpdate();
			result = 1;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				pst.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}

	public HocVien getItemByMa(String mahv) {
		HocVien objItem = null;
		conn = lcdb.getConnectMySQL();
		String query = "SELECT * FROM hocvien WHERE mahv = ? LIMIT 1";
		try {
			pst = conn.prepareStatement(query);
			pst.setString(1, mahv);
			rs = pst.executeQuery();
			while(rs.next()){
				objItem =new HocVien(mahv, rs.getString("tenhv"),rs.getDate("ngaysinh"),rs.getInt("gioitinh"),rs.getString("quequan"),rs.getString("maphong"),rs.getString("magv"),rs.getString("mabs"),rs.getDate("ngayvao"),rs.getDate("ngayra"),rs.getString("mucdo"),rs.getString("lichsu"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pst.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return objItem;
	}
	
	public int editItem(HocVien objHocVien) {
		conn = lcdb.getConnectMySQL();
		int result = 0;
		String query = "UPDATE hocvien SET tenhv = ?, ngaysinh=?, gioitinh=?, quequan=?, maphong=?, magv=?, mabs=?, ngayvao=?, ngayra=?, mucdo=?,lichsu=? WHERE mahv = ? LIMIT 1";
		try {
			pst = conn.prepareStatement(query);
			pst.setString(1, objHocVien.getTenHV());
			pst.setDate(2, (Date) objHocVien.getNgaySinh());
			pst.setInt(3, objHocVien.getGioitinh());
			pst.setString(4, objHocVien.getQueQuan());
			pst.setString(5, objHocVien.getMaPhong());
			pst.setString(6, objHocVien.getMaGV());
			pst.setString(7, objHocVien.getMaBS());
			pst.setDate(8, (Date) objHocVien.getNgayVao());
			pst.setDate(9, (Date) objHocVien.getNgayRa());
			pst.setString(10, objHocVien.getMucDo());
			pst.setString(11, objHocVien.getLichSu());
			pst.setString(12, objHocVien.getMaHV());
			pst.executeUpdate();
			result = 1;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				pst.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}

	public int delItem(String mahv) {
		conn = lcdb.getConnectMySQL();
		String query = "DELETE FROM hocvien WHERE mahv like '" + mahv + "' LIMIT 1";
		int result = 0;
		try {
			pst = conn.prepareStatement(query);
			pst.executeUpdate();
			result = 1;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				pst.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	public int countHv(){
		conn = lcdb.getConnectMySQL();
		int result = 0;
		String sql = "SELECT COUNT(*) as number FROM hocvien" ;
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
