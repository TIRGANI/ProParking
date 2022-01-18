package beans;

public class Place {
	//id`, `numero`, `etat`, `type`, `idsection
	private int id;
	private String numero;
	private String etat;
	private String type;
	private int idsection;
	public Place(int id, String numero, String etat, String type, int idsection) {
		this.id = id;
		this.numero = numero;
		this.etat = etat;
		this.type = type;
		this.idsection = idsection;
	}
	public Place(String numero, String type, int idsection) {
		this.numero = numero;
		this.etat="Vide";
		this.type = type;
		this.idsection = idsection;
	}
	public Place()
	{
		
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
	public int getIdsection() {
		return idsection;
	}
	public void setIdsection(int idsection) {
		this.idsection = idsection;
	}
	@Override
	public String toString() {
		return "Place [id=" + id + ", numero=" + numero + ", etat=" + etat + ", type=" + type + ", idsection="
				+ idsection + "]";
	}
	
}
