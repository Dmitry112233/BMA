package com.da.bookmaker.bean;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class MatchDetailsBean {

	private long id;

	private String team1;

	private String team2;

	private Date date;
	
	private int goalsTeam1;
	
	private int goalsTeam2;
	
	private int penaltyTeam1;
	
	private int penaltyTeam2;


	public int getGoalsTeam1() {
		return goalsTeam1;
	}

	public void setGoalsTeam1(int goalsTeam1) {
		this.goalsTeam1 = goalsTeam1;
	}

	public int getGoalsTeam2() {
		return goalsTeam2;
	}

	public void setGoalsTeam2(int goalsTeam2) {
		this.goalsTeam2 = goalsTeam2;
	}

	public int getPenaltyTeam1() {
		return penaltyTeam1;
	}

	public void setPenaltyTeam1(int penaltyTeam1) {
		this.penaltyTeam1 = penaltyTeam1;
	}

	public int getPenaltyTeam2() {
		return penaltyTeam2;
	}

	public void setPenaltyTeam2(int penaltyTeam2) {
		this.penaltyTeam2 = penaltyTeam2;
	}

	private String championship;

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

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}
}
