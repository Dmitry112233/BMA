package com.da.bookmaker.bean;

public class NewsBean {

	private long id;
	
	private String sport;
	
	private String competition;
	
	private String description;
	
	private String image;
	
	private String title;

//	public NewsBean(Item item) {
//		if (item.getCategorys().size() > 0){
//			this.sport = item.getCategorys().get(0);
//		}
//		if (item.getCategorys().size() > 1){
//			this.competition = item.getCategorys().get(1);
//		}
//		this.description = item.getDescription();
//		this.image = item.getImage().getUrl();
//		this.title = item.getTitle();
//	}
	
	public long getId() {
		return id;
	}
	
	public void setId(long id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getSport() {
		return sport;
	}

	public void setSport(String sport) {
		this.sport = sport;
	}

	public String getCompetition() {
		return competition;
	}

	public void setCompetition(String competition) {
		this.competition = competition;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	
	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}
	
}
