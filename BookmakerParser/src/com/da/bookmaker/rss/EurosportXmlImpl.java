package com.da.bookmaker.rss;

import java.io.BufferedInputStream;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.net.URL;
import java.net.URLConnection;
import java.net.UnknownHostException;
import java.util.ArrayList;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;

import org.apache.log4j.Level;
import org.apache.log4j.Logger;

import com.da.bookmaker.bean.NewsBean;
import com.da.bookmaker.dao.DaoException;
import com.da.bookmaker.dao.DaoFactory;
import com.da.bookmaker.rss.eurosport.Channel;
import com.da.bookmaker.rss.eurosport.Item;
import com.da.bookmaker.rss.eurosport.Rss;

public class EurosportXmlImpl {
	
	public static void main(String[] args) throws UnknownHostException, IOException, InterruptedException {
		new EurosportXmlImpl().parseRss();
	}
	
	private static final Logger logger = Logger.getLogger(EurosportXmlImpl.class);

	static {
		Logger.getLogger("com.gargoylesoftware.htmlunit").setLevel(Level.OFF);
		Logger.getLogger("org.apache.http.client.protocol").setLevel(Level.OFF);
	}

	public void parseRss() throws UnknownHostException, IOException, InterruptedException {
		logger.info("Eurosport rss parser starts");
		URL eurosport = new URL("https://www.eurosport.ru/rss.xml");
		URLConnection connection = eurosport.openConnection();
		try (BufferedInputStream socketInStream = new BufferedInputStream (connection.getInputStream())) {

			byte[] byteMass = new byte[0];

			Thread.sleep(500);
			int count = 0;
			byte[] inBuffer = new byte[1024];
			while ((count = socketInStream.read(inBuffer,0,1024)) != -1) {
				byte tmp[] = byteMass;
				byteMass = new byte[byteMass.length + count];
				System.arraycopy(tmp, 0, byteMass, 0, tmp.length);
				System.arraycopy(inBuffer, 0, byteMass, tmp.length, count);
			}
			Unmarshaller m = JAXBContext.newInstance(Rss.class).createUnmarshaller();
			Rss root = (Rss) m.unmarshal(new ByteArrayInputStream(byteMass));
			ArrayList<NewsBean> buffer = new ArrayList<>();
			if (root.getChannels() != null) {
				for (Channel channel : root.getChannels()) {
					for (Item item : channel.getItems()) {
						NewsBean bean = new NewsBean();
						if (item.getCategorys().size() > 0){
							bean.setSport(item.getCategorys().get(0));
						}
						if (item.getCategorys().size() > 1){
							bean.setCompetition(item.getCategorys().get(1));
						}
						bean.setDescription(item.getDescription());
						bean.setImage(item.getImage().getUrl());
						bean.setTitle(item.getTitle());
						bean.setDate(item.getPubDate());
						
						buffer.add(bean);
					}
				}
			}
			DaoFactory.getNewsDao().deleteAllNews();
			DaoFactory.getNewsDao().addNewsList(buffer);
			logger.info("Eurosport rss parser has eded");
		} catch (JAXBException | DaoException e) {
			e.printStackTrace();
			logger.info("Eurosport rss parser failed");
		}
	}

}
