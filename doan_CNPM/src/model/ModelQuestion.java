package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import bean.Question;
import library.LibraryConnectDb;

public class ModelQuestion {
	private LibraryConnectDb libConect;
	private Connection conn;
	private Statement st;
	private ResultSet rs;
	private PreparedStatement pst;
	private String table;
	
	public ModelQuestion(){
		libConect = new LibraryConnectDb();
		this.table = "cauhoi";
	}

	public ArrayList<Question> getList(){
		conn = libConect.getConnectMySQL();
		ArrayList<Question> listQues = new ArrayList<>();
		String sql = "SELECT * FROM " + table;
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()){
				Question objQues = new Question(rs.getInt("id_cauhoi"), rs.getString("tennguoihoi"), rs.getString("noidung"), rs.getInt("traloi"),rs.getString("noidungtraloi"), rs.getString("email"), rs.getString("ngaydang"));
				listQues.add(objQues);
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
		return listQues;
	}


	public int addItem(Question objItem) {
		conn = libConect.getConnectMySQL();
		int result = 0;
		String sql = "INSERT INTO " + table + " (tennguoihoi,noidung,noidungtraloi,email,ngaydang) VALUE(?,?,?,?,?)";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, objItem.getTennguoihoi());
			pst.setString(2, objItem.getNoidung());
			pst.setString(3, objItem.getNoidungtraloi());
			pst.setString(4, objItem.getEmail());
			pst.setString(5, objItem.getNgaydang());
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
	
	public int editItem(Question objItem,String traloi) {
		conn = libConect.getConnectMySQL();
		int result = 0;
		String sql = "update  " + table + " set traloi=?,noidungtraloi=? where id_cauhoi=?";
        	try {
    			pst = conn.prepareStatement(sql);
    			pst.setInt(1, objItem.getTraloi());
    			pst.setString(2, objItem.getNoidungtraloi());
    			pst.setInt(3, objItem.getId_cauhoi());
    			pst.executeUpdate();
    			result = 1;
    		} catch (SQLException e) {
    			e.printStackTrace();
    		}finally{
    			try {
    				pst.close();
    				conn.close();
    			} catch (SQLException e) {
    				e.printStackTrace();
    			}
        }
		return result;
	}
	
	public int delQuestion(int qid) {
		conn = libConect.getConnectMySQL();
		int result = 0;
		String sql = "DELETE FROM " +  table + " WHERE id_cauhoi = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, qid);
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
	
	public Question getObjQues(int qid){
		conn = libConect.getConnectMySQL();
		Question objQues = new Question();
		String sql = "SELECT * FROM " + table + " WHERE id_cauhoi = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, qid);
			rs = pst.executeQuery();
			if(rs.next()){
				objQues = new Question(rs.getInt("id_cauhoi"), rs.getString("tennguoihoi"), rs.getString("noidung"), rs.getInt("traloi"),rs.getString("noidungtraloi"), rs.getString("email"), rs.getString("ngaydang"));
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
		return objQues;
	}
	
	public int countQues(){
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
