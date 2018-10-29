package com.da.bookmaker.bean;

public class NewsBean {

	private long id;
	
	private String sport;
	
	private String competition;
	
	private String description;
	
	private String image;
	
	private String title;
	
	private String date;
	
	public String getDate() {
		return this.date;
	}

	public void setDate(String date) {
		this.date = date;
	}

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
	
	public String getTime() {
		return date.split(" ")[4].substring(0, 5);
	}
}
