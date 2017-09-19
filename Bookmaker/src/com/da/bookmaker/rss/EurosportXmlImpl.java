package com.da.bookmaker.rss;

import java.io.File;
import java.util.ArrayList;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;

import com.da.bookmaker.bean.NewsBean;
import com.da.bookmaker.rss.eurosport.Channel;
import com.da.bookmaker.rss.eurosport.Item;
import com.da.bookmaker.rss.eurosport.Rss;

public class EurosportXmlImpl {
	
	private static final File XML = new File("d:\\exe\\rss.xml");
	
	private static ArrayList<NewsBean> buffer;
	
	public static void main(String[] args) {
	
		try {
			Unmarshaller m = JAXBContext.newInstance(Rss.class).createUnmarshaller();
			@SuppressWarnings("unchecked")
			Rss root = (Rss) m.unmarshal(XML);

			buffer = new ArrayList<>();
			if (root.getChannels() != null) {
				for (Channel channel : root.getChannels()) {
					for (Item item : channel.getItems()){
						NewsBean bean = new NewsBean(item);
						buffer.add(bean);
						System.out.println(bean.getTitle());
					}
				}
			} 
		} catch (JAXBException e) {
			e.printStackTrace();
		}
	}
	
}
