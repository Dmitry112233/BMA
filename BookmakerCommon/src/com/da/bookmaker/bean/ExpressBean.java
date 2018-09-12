package com.da.bookmaker.bean;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class ExpressBean {

	public static final SimpleDateFormat FORMATTER = new SimpleDateFormat("dd.MM.yyyy");

	private long expressID;

	private String name;

	private Date date;

	private String source;

	private ArrayList<IventBean> iventList;

	private String description;
	
	private int like;

	public int getLike() {
		return like;
	}

	public void setLike(int like) {
		this.like = like;
	}

	public Double getResultCoeff() {
		Double resultCoeff = 1.0;
		for (IventBean ivent : iventList) {
			resultCoeff *= ivent.getCoefficient();
		}
		return resultCoeff;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public ArrayList<IventBean> getIventList() {
		return iventList;
	}

	public void setIventList(ArrayList<IventBean> iventList) {
		this.iventList = iventList;
	}

	public Long getExpressID() {
		return expressID;
	}

	public void setExpressID(Long expressID) {
		this.expressID = expressID;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public java.util.Date getDate() {
		return date;
	}

	public void setDate(java.util.Date date) {
		this.date = date;
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
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