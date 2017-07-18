package com.da.bookmaker.bean;

import java.util.Date;

public class IventBean {

	private long iventID;

	private String name;

	private String description;

	private String bet;
	
	private String competition;

	private Date date;
	
	public String getCompetition() {
		return competition;
	}

	public void setCompetition(String competition) {
		this.competition = competition;
	}

	public Long getIventID() {
		return iventID;
	}

	public void setIventID(Long iventID) {
		this.iventID = iventID;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getBet() {
		return bet;
	}

	public void setBet(String bet) {
		this.bet = bet;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

}
