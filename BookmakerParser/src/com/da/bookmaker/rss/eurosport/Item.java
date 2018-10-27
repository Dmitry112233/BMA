package com.da.bookmaker.rss.eurosport;

import java.util.ArrayList;
import java.util.List;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name="item")
public class Item {

	private List<String> categorys = new ArrayList<>();
	private String title;
	private String description;
	private Image image;
	private String pubDate;
	
	@XmlElement(name = "category")
	public List<String> getCategorys() {
		return categorys;
	}
	public void setCategorys(List<String> categorys) {
		this.categorys = categorys;
	}
	
	@XmlElement(name="title")
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	@XmlElement(name = "description")
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}

	@XmlElement(name = "image")
	public Image getImage() {
		return image;
	}
	
	@XmlElement(name = "pubDate")
	public String getPubDate() {
		return pubDate;
	}
	
	public void setPubDate(String pubDate) {
		this.pubDate = pubDate;
	}
	
	public void setImage(Image image) {
		this.image = image;
	}
	
}
