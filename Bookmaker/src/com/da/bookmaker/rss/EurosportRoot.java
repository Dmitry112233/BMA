package com.da.bookmaker.rss;

import java.util.List;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

import com.da.bookmaker.bean.NewsBean;

@XmlRootElement(name = "channel")
public class EurosportRoot {

	private List<NewsBean> beans;

	@XmlElement(name = "item")
	public List<NewsBean> getBeans() {
		return beans;
	}

	public void setBeans(List<NewsBean> beans) {
		this.beans = beans;
	}
	
}


