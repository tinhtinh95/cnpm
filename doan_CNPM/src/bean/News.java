package bean;

public class News {
	private int id_news;
	private String name_news;
	private String mota;
	private String chitiet;
	private String ngaydang;
	private String hinhanh;
	private int id_cat;
	private String name_cat;
	public int getId_news() {
		return id_news;
	}
	public void setId_news(int id_news) {
		this.id_news = id_news;
	}
	public String getName_news() {
		return name_news;
	}
	public void setName_news(String name_news) {
		this.name_news = name_news;
	}
	public String getMota() {
		return mota;
	}
	public void setMota(String mota) {
		this.mota = mota;
	}
	public String getChitiet() {
		return chitiet;
	}
	public void setChitiet(String chitiet) {
		this.chitiet = chitiet;
	}
	public String getNgaydang() {
		return ngaydang;
	}
	public void setNgaydang(String ngaydang) {
		this.ngaydang = ngaydang;
	}
	public String getHinhanh() {
		return hinhanh;
	}
	public void setHinhanh(String hinhanh) {
		this.hinhanh = hinhanh;
	}
	public int getId_cat() {
		return id_cat;
	}
	public void setId_cat(int id_cat) {
		this.id_cat = id_cat;
	}
	public String getName_cat() {
		return name_cat;
	}
	public void setName_cat(String name_cat) {
		this.name_cat = name_cat;
	}
	public News(int id_news, String name_news, String mota, String chitiet,
			String ngaydang, String hinhanh, int id_cat,String name_cat) {
		super();
		this.id_news = id_news;
		this.name_news = name_news;
		this.mota = mota;
		this.chitiet = chitiet;
		this.ngaydang = ngaydang;
		this.hinhanh = hinhanh;
		this.id_cat = id_cat;
		this.name_cat = name_cat;
	}
	public News() {
		super();
	}
}
