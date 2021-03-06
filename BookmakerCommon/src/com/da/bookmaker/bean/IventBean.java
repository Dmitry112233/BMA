package com.da.bookmaker.bean;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class IventBean {

	private long iventID;

	private String name;

	private String description;

	private String bet;

	private String competition;

	private Date date;

	private Double coefficient;

	private String source;

	private String sport;
	
	private String time;
	
	private String result;
	
	private String image;

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getSport() {
		return sport;
	}

	public void setSport(String sport) {
		this.sport = sport;
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public static final SimpleDateFormat FORMATTER = new SimpleDateFormat("dd.MM.yyyy");

	public Double getCoefficient() {
		return coefficient;
	}

	public void setCoefficient(Double coefficient) {
		this.coefficient = coefficient;
	}

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

	public String getDateStr() {
		if (date == null) {
			return "";
		}
		return FORMATTER.format(date);
	}

	public void setDateStr(String date) throws ParseException {
		this.date = FORMATTER.parse(date);
	}

	public String getSportIcon() {

		if (this.competition.contains("Футбол")) {
			return "/Static/bootstrap/img/sportsIcons/football.png";
		}
		if (this.competition.contains("Теннис")) {
			return "/Static/bootstrap/img/sportsIcons/tennis.png";
		}
		if (this.competition.contains("Хоккей")) {
			return "/Static/bootstrap/img/sportsIcons/icehockey.png";
		}
		if (this.competition.contains("Баскетбол")) {
			return "/Static/bootstrap/img/sportsIcons/bascketball.png";
		}
		if (this.competition.contains("Волейбол")) {
			return "/Static/bootstrap/img/sportsIcons/voleyball.png";
		}
		if (this.competition.contains("Бейсбол")) {
			return "/Static/bootstrap/img/sportsIcons/baseball.png";
		}
		if (this.competition.contains("Настольный теннис")) {
			return "/Static/bootstrap/img/sportsIcons/pinpong.png";
		}
		if (this.competition.contains("Киберспорт")) {
			return "/Static/bootstrap/img/sportsIcons/cybersport.png";
		}
		if (this.competition.contains("Бильярд")) {
			return "/Static/bootstrap/img/sportsIcons/pool.png";
		}
		if (this.competition.contains("Бадминтон")) {
			return "/Static/bootstrap/img/sportsIcons/racket.png";
		} else {
			return "/Static/bootstrap/img/sportsIcons/podium.png";
		}
	}

	public String getIcon() {

		if (this.sport.contains("футбол")) {
			return "/Static/bootstrap/img/sportsIcons/football.png";
		}
		if (this.sport.contains("теннис")) {
			return "/Static/bootstrap/img/sportsIcons/tennis.png";
		}
		if (this.sport.contains("хоккей")) {
			return "/Static/bootstrap/img/sportsIcons/icehockey.png";
		}
		if (this.sport.contains("баскетбол")) {
			return "/Static/bootstrap/img/sportsIcons/bascketball.png";
		} else {
			return null;
		}
	}

}
