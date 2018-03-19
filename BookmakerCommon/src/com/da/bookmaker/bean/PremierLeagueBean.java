package com.da.bookmaker.bean;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class PremierLeagueBean {

	private long matchID;
	
	private Date date;
	
	public static final SimpleDateFormat FORMATTER = new SimpleDateFormat("dd.MM.yyyy HH:mm");
	
	private String team1;
	
	private String team2;
	
	private long win1;
	
	private long win2;
	
	private long x;
	
	private long x1;
	
	private long x2;
	
	private long x12;
	
	private long total;
	
	private long lessTotal;
	
	private long moreTotal;
	
	private String Hand;
	
	private long hand1;
	
	private long hand2;
	
	public long getMatchID() {
		return matchID;
	}

	public void setMatchID(long matchID) {
		this.matchID = matchID;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
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

	public long getWin1() {
		return win1;
	}

	public void setWin1(long win1) {
		this.win1 = win1;
	}

	public long getWin2() {
		return win2;
	}

	public void setWin2(long win2) {
		this.win2 = win2;
	}

	public long getX() {
		return x;
	}

	public void setX(long x) {
		this.x = x;
	}

	public long getX1() {
		return x1;
	}

	public void setX1(long x1) {
		this.x1 = x1;
	}

	public long getX2() {
		return x2;
	}

	public void setX2(long x2) {
		this.x2 = x2;
	}

	public long getX12() {
		return x12;
	}

	public void setX12(long x12) {
		this.x12 = x12;
	}

	public long getTotal() {
		return total;
	}

	public void setTotal(long total) {
		this.total = total;
	}

	public long getLessTotal() {
		return lessTotal;
	}

	public void setLessTotal(long lessTotal) {
		this.lessTotal = lessTotal;
	}

	public long getMoreTotal() {
		return moreTotal;
	}

	public void setMoreTotal(long moreTotal) {
		this.moreTotal = moreTotal;
	}

	public String getHand() {
		return Hand;
	}

	public void setHand(String hand) {
		Hand = hand;
	}

	public long getHand1() {
		return hand1;
	}

	public void setHand1(long hand1) {
		this.hand1 = hand1;
	}

	public long getHand2() {
		return hand2;
	}

	public void setHand2(long hand2) {
		this.hand2 = hand2;
	}
	
	public String getDateStr() {
		if (date == null) {
			return "";
		}
		return FORMATTER.format(date);
	}

	public void setDateStr(String date) throws ParseException {
		this.date = FORMATTER.parse(date);
	}

}
