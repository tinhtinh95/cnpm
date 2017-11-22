package bean;

public class Month {
	private int id_month;
	private int value;
	public int getId_month() {
		return id_month;
	}
	public void setId_month(int id_month) {
		this.id_month = id_month;
	}
	public int getValue() {
		return value;
	}
	public void setValue(int value) {
		this.value = value;
	}
	public Month(int id_month, int value) {
		super();
		this.id_month = id_month;
		this.value = value;
	}
	public Month() {
		super();
	}
	
}
