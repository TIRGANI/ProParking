package beans;

public class Etage {
	private int id;
	private String code;
	public Etage(int id, String code) {
		super();
		this.id = id;
		this.code = code;
	}
	public Etage(String code) {
		this.code = code;
	}
	public Etage() {}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	@Override
	public String toString() {
		return "Etage [id=" + id + ", code=" + code + "]";
	}
	
	
	
}
