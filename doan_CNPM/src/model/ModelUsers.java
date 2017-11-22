package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;




import java.util.ArrayList;

import bean.Users;
import library.LibStringMd5;
import library.LibraryConnectDb;

public class ModelUsers {
	private LibraryConnectDb libConect;
	private Connection conn;
	private Statement st;
	private ResultSet rs;
	private PreparedStatement pst;
	private String table;
	
	public ModelUsers(){
		libConect = new LibraryConnectDb();
		this.table = "users";
	}
	
	public ArrayList<Users> getList(){
		ArrayList<Users> listUsers = new ArrayList<>();
		conn = libConect.getConnectMySQL();
		String sql = "SELECT * FROM " + table;
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()){
				Users objUser = new Users(rs.getInt("id_user"), rs.getString("username"), rs.getString("password"), rs.getString("fullname"),rs.getString("role"),rs.getString("maNhanSu"));
				listUsers.add(objUser);
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
		return listUsers;
	}

	public int addUser(Users objUser) {
		int result = 0;
		conn = libConect.getConnectMySQL();
		String sql = "INSERT INTO " + table + " (username,password,fullname,role,maNhanSu) VALUES (?,?,?,?,?)";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, objUser.getUsername());
			pst.setString(2, objUser.getPassword());
			pst.setString(3, objUser.getFullname());
			pst.setString(4, objUser.getRole());
			pst.setString(5, objUser.getMaNhanSu());
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

	public Users checkUser(String username) {
		Users objUser = null;
		conn = libConect.getConnectMySQL();
		String sql = "SELECT * FROM " + table + " WHERE username = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, username);
			rs = pst.executeQuery();
			if(rs.next()){
				objUser = new Users(rs.getInt("id_user"), rs.getString("username"), rs.getString("password"), rs.getString("fullname"),rs.getString("role"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				pst.close();
				rs.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return objUser;
	}

	public Users getObjUser(int idUser) {
		Users objUser = null;
		conn = libConect.getConnectMySQL();
		String sql = "SELECT * FROM " + table + " WHERE id_user = ? ";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, idUser);
			rs = pst.executeQuery();
			if(rs.next()){
				objUser = new Users(rs.getInt("id_user"), rs.getString("username"), rs.getString("password"), rs.getString("fullname"),rs.getString("role"),rs.getString("maNhanSu"));	
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				pst.close();
				rs.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return objUser;
	}

	public int editUser(Users objUserEdit) {
		int result = 0;
		conn = libConect.getConnectMySQL();
		String sql = "UPDATE " + table + " SET password = ? , fullname = ?, role = ? WHERE id_user = ? LIMIT 1";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, objUserEdit.getPassword());
			pst.setString(2, objUserEdit.getFullname());
			pst.setInt(4, objUserEdit.getId_user());
			pst.setString(3, objUserEdit.getRole());
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

	public int delUser(int idUser) {
		int result = 0;
		conn = libConect.getConnectMySQL();
		String sql = "DELETE FROM " + table + " WHERE id_user = ? LIMIT 1";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, idUser);
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
	
	public Users getUserByUserName(String username) {
		Users objUser = null;
		conn = libConect.getConnectMySQL();
		String sql = "SELECT * FROM " + table + " WHERE username = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, username);
			rs = pst.executeQuery();
			if(rs.next()){
				objUser = new Users(rs.getInt("id_user"), rs.getString("username"), rs.getString("password"), rs.getString("fullname"),rs.getString("role"));	
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				pst.close();
				rs.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return objUser;
	}
	
	public Users getUserByUserPass(String username, String password) {
		Users objUser = null;
		conn = libConect.getConnectMySQL();
		String sql = "SELECT * FROM " + table + " WHERE username = ? AND password = ? ";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, username);
			pst.setString(2, LibStringMd5.LibMd5(password));
			rs = pst.executeQuery();
			if(rs.next()){
				objUser = new Users(rs.getInt("id_user"), rs.getString("username"), rs.getString("password"), rs.getString("fullname"),rs.getString("role"));	
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				pst.close();
				rs.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return objUser;
	}
	
	public int countUsers(){
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
