package com.da.bookmaker.bean;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class MatchDetailsBean {

	private long id;

	private String team1;

	private String team2;

	private String score;

	private Date date;

	private String championship;

/*	@Override
	public boolean equals(Object obj) {
		if (obj == this) {
			return true;
		}
		if (obj == null || obj.getClass() != this.getClass()) {
			return false;
		}
		MatchDetailsBean objToCompare = (MatchDetailsBean) obj;
		if (this.team1.equals(objToCompare.getTeam1()) && this.team2.equals(objToCompare.getTeam2())
				&& this.score.equals(objToCompare.getScore()) && this.date.equals(objToCompare.getDate())
				&& this.championship.equals(objToCompare.getChampionship())) {
			return true;
		} else {
			return false;
		}
	}*/

	public String getChampionship() {
		return championship;
	}

	public void setChampionship(String championship) {
		this.championship = championship;
	}

	public static final SimpleDateFormat FORMATTER = new SimpleDateFormat("dd.MM.yyyy");

	public String getDateStr() {
		if (date == null) {
			return "";
		}
		return FORMATTER.format(date);
	}

	public void setDateStr(String date) throws ParseException {
		this.date = FORMATTER.parse(date);
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getTeam1() {
		return team1;
	}

	public void setTeam1(String team1) {
		this.team1 = team1;
	}

	public String getTeam2() {
		return team2;
	}

	public void setTeam2(String team2) {
		this.team2 = team2;
	}

	public String getScore() {
		return score;
	}

	public void setScore(String score) {
		this.score = score;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}
}
