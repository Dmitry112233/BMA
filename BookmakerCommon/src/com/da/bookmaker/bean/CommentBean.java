package com.da.bookmaker.bean;

public class CommentBean {

	private long id;

	private String name;

	private String email;

	private String comment;

	private String level;
	
	private long bookmakerID;
	
	private int visible;

	public int getVisible() {
		return visible;
	}

	public void setVisible(int visible) {
		this.visible = visible;
	}

	public long getBookmakerID() {
		return bookmakerID;
	}

	public void setBookmakerID(long bookmakerID) {
		this.bookmakerID = bookmakerID;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

}
