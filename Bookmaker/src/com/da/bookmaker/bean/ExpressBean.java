package com.da.bookmaker.bean;

import java.util.ArrayList;
import java.util.Date;

public class ExpressBean {

	private long expressID;

	private String name;

	private Date date;

	private String source;
	
	private ArrayList<IventBean> iventList;

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

}