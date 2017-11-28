package bean;

import java.util.Date;

public class HocVien {

	private String maHV;
	private String tenHV;
	private Date ngaySinh;
	private int gioitinh;
	private String queQuan;
	private String maPhong;
	private String maGV;
	private String maBS;
	private Date ngayVao;
	private Date ngayRa;
	private String mucDo;
	private String lichSu;
	private String dieutri;
	
	
	
	
	public HocVien(String maHV, String tenHV, Date ngaySinh, int gioitinh, String queQuan, String maPhong, String maGV,
			String maBS, Date ngayVao, Date ngayRa, String mucDo, String lichSu, String dieutri) {
		super();
		this.maHV = maHV;
		this.tenHV = tenHV;
		this.ngaySinh = ngaySinh;
		this.gioitinh = gioitinh;
		this.queQuan = queQuan;
		this.maPhong = maPhong;
		this.maGV = maGV;
		this.maBS = maBS;
		this.ngayVao = ngayVao;
		this.ngayRa = ngayRa;
		this.mucDo = mucDo;
		this.lichSu = lichSu;
		this.dieutri = dieutri;
	}
	public String getDieutri() {
		return dieutri;
	}
	public void setDieutri(String dieutri) {
		this.dieutri = dieutri;
	}
	public String getMaHV() {
		return maHV;
	}
	public void setMaHV(String maHV) {
		this.maHV = maHV;
	}
	public String getTenHV() {
		return tenHV;
	}
	public void setTenHV(String tenHV) {
		this.tenHV = tenHV;
	}
	public Date getNgaySinh() {
		return ngaySinh;
	}
	public void setNgaySinh(Date ngaySinh) {
		this.ngaySinh = ngaySinh;
	}
	public int getGioitinh() {
		return gioitinh;
	}
	public void setGioitinh(int gioitinh) {
		this.gioitinh = gioitinh;
	}
	public String getQueQuan() {
		return queQuan;
	}
	public void setQueQuan(String queQuan) {
		this.queQuan = queQuan;
	}
	public String getMaPhong() {
		return maPhong;
	}
	public void setMaPhong(String maPhong) {
		this.maPhong = maPhong;
	}
	public String getMaGV() {
		return maGV;
	}
	public void setMaGV(String maGV) {
		this.maGV = maGV;
	}
	public String getMaBS() {
		return maBS;
	}
	public void setMaBS(String maBS) {
		this.maBS = maBS;
	}
	public Date getNgayVao() {
		return ngayVao;
	}
	public void setNgayVao(Date ngayVao) {
		this.ngayVao = ngayVao;
	}
	public Date getNgayRa() {
		return ngayRa;
	}
	public void setNgayRa(Date ngayRa) {
		this.ngayRa = ngayRa;
	}
	public String getMucDo() {
		return mucDo;
	}
	public void setMucDo(String mucDo) {
		this.mucDo = mucDo;
	}
	public String getLichSu() {
		return lichSu;
	}
	public void setLichSu(String lichSu) {
		this.lichSu = lichSu;
	}
	public HocVien(String maHV, String tenHV, Date ngaySinh, int gioitinh,
			String queQuan, String maPhong, String maGV, String maBS,
			Date ngayVao, Date ngayRa, String mucDo, String lichSu) {
		super();
		this.maHV = maHV;
		this.tenHV = tenHV;
		this.ngaySinh = ngaySinh;
		this.gioitinh = gioitinh;
		this.queQuan = queQuan;
		this.maPhong = maPhong;
		this.maGV = maGV;
		this.maBS = maBS;
		this.ngayVao = ngayVao;
		this.ngayRa = ngayRa;
		this.mucDo = mucDo;
		this.lichSu = lichSu;
	}
	
	
}
