package com.da.bookmaker.bean;

public class BookmakerBean {

	private long bookMakerId;

	private String name;

	private String link;
	
	private String image;
	
	private String description;

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Long getBookMakerId() {
		return bookMakerId;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public void setBookMakerId(Long bookMakerId) {
		this.bookMakerId = bookMakerId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

}
