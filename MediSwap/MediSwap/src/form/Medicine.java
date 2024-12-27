package form;

public class Medicine {

	private int id;
	private String name;
	private String sideeffects;
	private String purpose;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSideeffects() {
		return sideeffects;
	}
	public void setSideeffects(String sideeffects) {
		this.sideeffects = sideeffects;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPurpose() {
        return purpose;
    }

    public void setPurpose(String purpose) {
        this.purpose = purpose;
    }
}
