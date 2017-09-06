package com.da.bookmaker.bean;

import java.text.SimpleDateFormat;

public class SportNewsBean {

	private long sportNewsID;

	private String sport;

	private String competition;

	private String description;

	private String image;

	private String date;

	private String title;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public long getSportNewsID() {
		return sportNewsID;
	}

	public void setSportNewsID(long sportNewsID) {
		this.sportNewsID = sportNewsID;
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

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

}
