package bean;

import java.util.Date;

public class NhanSu {

	private String ma;
	private String ten;
	private Date ngaySinh;
	private String queqQuan;
	private int gioiTinh;
	public String getMa() {
		return ma;
	}
	public void setMa(String ma) {
		this.ma = ma;
	}
	public String getTen() {
		return ten;
	}
	public void setTen(String ten) {
		this.ten = ten;
	}
	public Date getNgaySinh() {
		return ngaySinh;
	}
	public void setNgaySinh(Date ngaySinh) {
		this.ngaySinh = ngaySinh;
	}
	public String getQueqQuan() {
		return queqQuan;
	}
	public void setQueqQuan(String queqQuan) {
		this.queqQuan = queqQuan;
	}
	public int getGioiTinh() {
		return gioiTinh;
	}
	public void setGioiTinh(int gioiTinh) {
		this.gioiTinh = gioiTinh;
	}
	public NhanSu(String ma, String ten, Date ngaySinh, String queqQuan, int gioiTinh) {
		super();
		this.ma = ma;
		this.ten = ten;
		this.ngaySinh = ngaySinh;
		this.queqQuan = queqQuan;
		this.gioiTinh = gioiTinh;
	}
	public NhanSu(String ma, String ten) {
		super();
		this.ma = ma;
		this.ten = ten;
	}
	
	
}
