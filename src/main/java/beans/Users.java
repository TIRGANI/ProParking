package beans;

public class Users {
	
	private int id;
	private String login;
	private String email;
	private String password;
	private String role;
	private String etat;
	
	public Users() {
		super();
	}
	public Users(String login, String email, String password, String role,String etat) {
	
		this.login = login;
		this.email = email;
		this.password = password;
		this.role = role;
		this.etat = etat;
	}
	public Users(String login, String email, String password, String role) {
		
		this.login = login;
		this.email = email;
		this.password = password;
		this.role = role;
		
	}
	public Users(int id, String login, String email, String password, String role,String etat) {
		super();
		this.id = id;
		this.login = login;
		this.email = email;
		this.password = password;
		this.role = role;
		this.etat=etat;
	}
	public String getEtat() {
		return etat;
	}
	public void setEtat(String etat) {
		this.etat = etat;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getLogin() {
		return login;
	}
	public void setLogin(String login) {
		this.login = login;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	@Override
	public String toString() {
		return "Users [id=" + id + ", login=" + login + ", email=" + email + ", password=" + password + ", role=" + role
				+ "]";
	}
	
}
