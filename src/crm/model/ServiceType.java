package crm.model;

public enum ServiceType {
	
	jy("建议"),zx("咨询"),ts("投诉");
	
	private String title;
	
	private ServiceType(String title) {
		this.title = title;
	}

	public String getTitle() {
		return title;
	}
}
