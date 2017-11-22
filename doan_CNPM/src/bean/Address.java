package bean;

public class Address {
	private int id_quequan;
	private String name;
	public int getId_quequan() {
		return id_quequan;
	}
	public void setId_quequan(int id_quequan) {
		this.id_quequan = id_quequan;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Address(int id_quequan, String name) {
		super();
		this.id_quequan = id_quequan;
		this.name = name;
	}
	public Address() {
		super();
	}
	
}
