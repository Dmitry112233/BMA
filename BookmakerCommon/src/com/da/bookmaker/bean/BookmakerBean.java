package com.da.bookmaker.bean;

public class BookmakerBean {

	private long bookMakerId;

	private String name;

	private String link;
	
	private String image;
	
	private String description;
	
	private String pluses;

	private String minuses;
	
	private String currency;
	
	private String payments;
	
	private int reliability;
	
	private int line;
	
	private int usability;
	
	private int result;

	private int weight;
	
	private int counter;
	
	private String bonus;

	public String getBonus() {
		return bonus;
	}

	public void setBonus(String bonus) {
		this.bonus = bonus;
	}

	public int getCounter() {
		return counter;
	}

	public void setCounter(int counter) {
		this.counter = counter;
	}

	public int getWeight() {
		return weight;
	}

	public void setWeight(int weight) {
		this.weight = weight;
	}

	public String getMinuses() {
		return minuses;
	}

	public void setMinuses(String minuses) {
		this.minuses = minuses;
	}
	
	public String getPluses() {
		return pluses;
	}

	public void setPluses(String pluses) {
		this.pluses = pluses;
	}

	public String getCurrency() {
		return currency;
	}

	public void setCurrency(String currency) {
		this.currency = currency;
	}

	public String getPayments() {
		return payments;
	}

	public void setPayments(String payments) {
		this.payments = payments;
	}

	public int getReliability() {
		return reliability;
	}

	public void setReliability(int reliability) {
		this.reliability = reliability;
	}

	public int getLine() {
		return line;
	}

	public void setLine(int line) {
		this.line = line;
	}

	public int getUsability() {
		return usability;
	}

	public void setUsability(int usability) {
		this.usability = usability;
	}

	public int getResult() {
		return result;
	}

	public void setResult(int result) {
		this.result = result;
	}

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
