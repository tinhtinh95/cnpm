package bean;

import java.util.Date;

public class BacSi {

	private String maBS;
	private String tenBS;
	private Date ngaySinh;
	private String quequan;
	private int gioiTinh;
	
	public String getMaBS() {
		return maBS;
	}
	public void setMaBS(String maBS) {
		this.maBS = maBS;
	}
	public String getTenBS() {
		return tenBS;
	}
	public void setTenBS(String tenBS) {
		this.tenBS = tenBS;
	}
	public Date getNgaySinh() {
		return ngaySinh;
	}
	public void setNgaySinh(Date ngaySinh) {
		this.ngaySinh = ngaySinh;
	}
	public String getQuequan() {
		return quequan;
	}
	public void setQuequan(String quequan) {
		this.quequan = quequan;
	}
	public BacSi(String maBS, String tenBS, Date ngaySinh, String quequan,
			int gioiTinh) {
		super();
		this.maBS = maBS;
		this.tenBS = tenBS;
		this.ngaySinh = ngaySinh;
		this.quequan = quequan;
		this.gioiTinh = gioiTinh;
	}
	public int getGioiTinh() {
		return gioiTinh;
	}
	public void setGioiTinh(int gioiTinh) {
		this.gioiTinh = gioiTinh;
	}
	
	
}
