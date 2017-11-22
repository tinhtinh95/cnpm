package bean;

public class Day {
	private int id_day;
	private int value;
	public int getId_day() {
		return id_day;
	}
	public void setId_day(int id_day) {
		this.id_day = id_day;
	}
	public int getValue() {
		return value;
	}
	public void setValue(int value) {
		this.value = value;
	}
	public Day(int id_day, int value) {
		super();
		this.id_day = id_day;
		this.value = value;
	}
	public Day() {
		super();
	}
	
}
