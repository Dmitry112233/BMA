package com.da.bookmaker.rss.eurosport;

import java.util.ArrayList;
import java.util.List;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name="rss")
public class Rss {

	private List<Channel> channels = new ArrayList<>();
	
	@XmlElement(name = "channel")
	public List<Channel> getChannels() {
		return channels;
	}
	
	public void setChannels(List<Channel> channels) {
		this.channels = channels;
	}
}
