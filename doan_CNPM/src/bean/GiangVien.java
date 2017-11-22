package bean;

import java.util.Date;

public class GiangVien {

	private String maGV;
	private String tenGV;
	private Date ngaySinh;
	private String quequan;
	private int gioiTinh;
	
	public String getMaGV() {
		return maGV;
	}
	public void setMaGV(String maGV) {
		this.maGV = maGV;
	}
	public String getTenGV() {
		return tenGV;
	}
	public void setTenGV(String tenGV) {
		this.tenGV = tenGV;
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
	public GiangVien(String maGV, String tenGV, Date ngaySinh, String quequan,
			int gioiTinh) {
		super();
		this.maGV = maGV;
		this.tenGV = tenGV;
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
