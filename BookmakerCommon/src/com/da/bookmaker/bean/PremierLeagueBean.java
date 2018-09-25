package com.da.bookmaker.bean;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.da.bookmaker.util.TranslationUtils;

public class PremierLeagueBean {

	private long id;
	
	private Date date;
	
	public static final SimpleDateFormat FORMATTER = new SimpleDateFormat("dd.MM.yyyy HH:mm:ss");
	
	private String league;
	
	private String team1;
	
	private String team2;
	
	private double win1;
	
	private double win2;
	
	private double x;
	
	private double x1;
	
	private double x2;
	
	private double x12;
	
	private double total;
	
	private double lessTotal;
	
	private double moreTotal;
	
	private String Hand;
	
	private double hand1;
	
	private double hand2;
	
	private BookmakerBean bookmakerBean = new BookmakerBean();
	
	public long getId() {
		return id;
	}

	public void setId(long matchID) {
		this.id = matchID;
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

	public double getWin1() {
		return win1;
	}

	public void setWin1(double win1) {
		this.win1 = win1;
	}

	public double getWin2() {
		return win2;
	}

	public void setWin2(double win2) {
		this.win2 = win2;
	}

	public double getX() {
		return x;
	}

	public void setX(double x) {
		this.x = x;
	}

	public double getX1() {
		return x1;
	}

	public void setX1(double x1) {
		this.x1 = x1;
	}

	public double getX2() {
		return x2;
	}

	public void setX2(double x2) {
		this.x2 = x2;
	}

	public double getX12() {
		return x12;
	}

	public void setX12(double x12) {
		this.x12 = x12;
	}

	public double getTotal() {
		return total;
	}

	public void setTotal(double total) {
		this.total = total;
	}

	public double getLessTotal() {
		return lessTotal;
	}

	public void setLessTotal(double lessTotal) {
		this.lessTotal = lessTotal;
	}

	public double getMoreTotal() {
		return moreTotal;
	}

	public void setMoreTotal(double moreTotal) {
		this.moreTotal = moreTotal;
	}

	public String getHand() {
		return Hand;
	}

	public void setHand(String hand) {
		Hand = hand;
	}

	public double getHand1() {
		return hand1;
	}

	public void setHand1(double hand1) {
		this.hand1 = hand1;
	}

	public double getHand2() {
		return hand2;
	}

	public void setHand2(double hand2) {
		this.hand2 = hand2;
	}
	
	public String getLeague() {
		return league;
	}

	public void setLeague(String league) {
		this.league = league;
	}

	public long getBookmakerId() {
		return bookmakerBean.getBookMakerId();
	}

	public void setBookmakerId(long bookmakerId) {
		bookmakerBean.setBookMakerId(bookmakerId);
	}
	
	public BookmakerBean getBookmakerBean() {
		return bookmakerBean;
	}
	
	public void setBookmakerBean(BookmakerBean bookmakerBean) {
		this.bookmakerBean = bookmakerBean;
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
	
	public String getUrl(){
		return "/"+ (league.toLowerCase()) + "_" + (team1.toLowerCase()) + "_" + (team2.toLowerCase()) + "_детали";
	}

}
