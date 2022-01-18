package beans;

public class AfficherPlace {
	private int id;
	private String numero;
	private String etat;
	private String type;
	private String idsection;

	public AfficherPlace()
	{
		
	}
	public AfficherPlace(int id, String numero, String etat, String type, String idsection) {
		this.id = id;
		this.numero = numero;
		this.etat = etat;
		this.type = type;
		this.idsection = idsection;
	
	}
	public AfficherPlace(String numero, String etat, String type, String idsection) {
		
		this.numero = numero;
		this.etat = etat;
		this.type = type;
		this.idsection = idsection;
	
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNumero() {
		return numero;
	}
	public void setNumero(String numero) {
		this.numero = numero;
	}
	public String getEtat() {
		return etat;
	}
	public void setEtat(String etat) {
		this.etat = etat;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getIdsection() {
		return idsection;
	}
	public void setIdsection(String idsection) {
		this.idsection = idsection;
	}
	@Override
	public String toString() {
		return "AfficherPlace [id=" + id + ", numero=" + numero + ", etat=" + etat + ", type=" + type + ", idsection="
				+ idsection + "]";
	}
	
	
}
