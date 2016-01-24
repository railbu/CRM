package crm.model;

public enum Location {
	
	bj("北京"),sc("四川"),sd("山东"),gx("广西"),
	ln("辽宁"),sh("上海"),hb("湖北"),hn("湖南"),
	nmg("内蒙古"),xj("新疆"),qh("青海"),hlj("黑龙江");
	
	private String title;
	
	private Location(String title) {
		this.title = title;
	}

	public String getTitle() {
		return title;
	}
}
