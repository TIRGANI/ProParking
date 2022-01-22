package beans;



public class Section {

    private int id;
    private String code;
    private int etage;
   
    public Section()
    {
    	
    }
    
    public Section(int id, String code) {
       
        this.id = id;
        this.code = code;
       
        
    }
    public Section(String code) {
        
        this.code = code;
        
    }
    public int getEtage() {
		return etage;
	}

	public void setEtage(int etage) {
		this.etage = etage;
	}

	public Section(String code,int etage) {
      
        this.code = code;
        this.etage=etage;
        
    }
    public Section(int id, String code,int etage) {
        
        this.id = id;
        this.code = code;
        this.etage=etage;
       
    }
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
		return "Section [id=" + id + ", code=" + code + ", etage=" + etage + "]";
	}

  

  
}
