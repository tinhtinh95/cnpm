package bean;

public class Question {
	private int id_cauhoi;
	private String tennguoihoi;
	private String noidung;
	private int traloi;
	private String noidungtraloi;
	private String email;
	private String ngaydang;
	public int getId_cauhoi() {
		return id_cauhoi;
	}
	public void setId_cauhoi(int id_cauhoi) {
		this.id_cauhoi = id_cauhoi;
	}
	public String getTennguoihoi() {
		return tennguoihoi;
	}
	public void setTennguoihoi(String tennguoihoi) {
		this.tennguoihoi = tennguoihoi;
	}
	public int getTraloi() {
		return traloi;
	}
	public void setTraloi(int traloi) {
		this.traloi = traloi;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNgaydang() {
		return ngaydang;
	}
	public void setNgaydang(String ngaydang) {
		this.ngaydang = ngaydang;
	}
	public String getNoidung() {
		return noidung;
	}
	public void setNoidung(String noidung) {
		this.noidung = noidung;
	}
	public Question() {
		super();
	}
	public String getNoidungtraloi() {
		return noidungtraloi;
	}
	public void setNoidungtraloi(String noidungtraloi) {
		this.noidungtraloi = noidungtraloi;
	}
	public Question(int id_cauhoi, String tennguoihoi, String noidung,
			int traloi, String noidungtraloi, String email, String ngaydang) {
		super();
		this.id_cauhoi = id_cauhoi;
		this.tennguoihoi = tennguoihoi;
		this.noidung = noidung;
		this.traloi = traloi;
		this.noidungtraloi = noidungtraloi;
		this.email = email;
		this.ngaydang = ngaydang;
	}
	public Question(int id_cauhoi, int traloi, String noidungtraloi) {
		super();
		this.id_cauhoi = id_cauhoi;
		this.traloi = traloi;
		this.noidungtraloi = noidungtraloi;
	}
	
	
}
