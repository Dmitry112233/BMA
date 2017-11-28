package com.da.bookmaker.rss.eurosport;

import java.util.ArrayList;
import java.util.List;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name="channel")
public class Channel {

	private List<Item> items = new ArrayList<>();
	
	@XmlElement(name="item")
	public List<Item> getItems() {
		return items;
	}
	
	public void setItem(List<Item> items) {
		this.items = items;
	}
}
