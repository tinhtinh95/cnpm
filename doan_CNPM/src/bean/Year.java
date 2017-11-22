package bean;

public class Year {
	private int id_year;
	private int value;
	public int getId_year() {
		return id_year;
	}
	public void setId_year(int id_year) {
		this.id_year = id_year;
	}
	public int getValue() {
		return value;
	}
	public void setValue(int value) {
		this.value = value;
	}
	public Year(int id_year, int value) {
		super();
		this.id_year = id_year;
		this.value = value;
	}
	public Year() {
		super();
	}
	
}
