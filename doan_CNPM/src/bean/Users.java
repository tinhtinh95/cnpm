package bean;

public class Users {
	private int id_user;
	private String username;
	private String password;
	private String fullname;
	private String role;
	private String maNhanSu;
	
	
	
	public String getMaNhanSu() {
		return maNhanSu;
	}
	public void setMaNhanSu(String maNhanSu) {
		this.maNhanSu = maNhanSu;
	}
	public int getId_user() {
		return id_user;
	}
	public void setId_user(int id_user) {
		this.id_user = id_user;
	}
	public String getUsername() {
		return username;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	
	public Users(int id_user, String username, String password, String fullname,String role) {
		this.id_user = id_user;
		this.username = username;
		this.password = password;
		this.fullname = fullname;
		this.role = role;
	}
	
	public Users(int id_user, String username, String password, String fullname, String role, String maNhanSu) {
		super();
		this.id_user = id_user;
		this.username = username;
		this.password = password;
		this.fullname = fullname;
		this.role = role;
		this.maNhanSu = maNhanSu;
	}
}
