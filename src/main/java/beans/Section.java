package beans;



public class Section {

    private int id;
    private String code;
   
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
		return "Section [id=" + id + ", code=" + code + "]";
	}

  

  
}
