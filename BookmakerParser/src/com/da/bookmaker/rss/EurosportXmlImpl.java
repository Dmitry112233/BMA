package com.da.bookmaker.rss;

import java.awt.Desktop;
import java.io.File;
import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.UnknownHostException;
import java.util.ArrayList;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;

import com.da.bookmaker.bean.NewsBean;
import com.da.bookmaker.dao.DaoException;
import com.da.bookmaker.dao.DaoFactory;
import com.da.bookmaker.rss.eurosport.Channel;
import com.da.bookmaker.rss.eurosport.Item;
import com.da.bookmaker.rss.eurosport.Rss;

public class EurosportXmlImpl {

	public static final String eurosport = "http://www.eurosport.ru/rss.xml";
	
	public static final File file = new File("D://exe/rss.xml");

	public void parseRss() throws UnknownHostException, IOException, InterruptedException, URISyntaxException {

		System.out.println("START");

		try {

			Desktop d = Desktop.getDesktop();
			d.browse(new URI(eurosport));

			Unmarshaller m = JAXBContext.newInstance(Rss.class).createUnmarshaller();

            Thread.sleep(5000);
			Rss root = (Rss) m.unmarshal(file);

			ArrayList<NewsBean> buffer = new ArrayList<>();
			if (root.getChannels() != null) {
				for (Channel channel : root.getChannels()) {
					for (Item item : channel.getItems()) {
						NewsBean bean = new NewsBean();
						if (item.getCategorys().size() > 0) {
							bean.setSport(item.getCategorys().get(0));
						}
						if (item.getCategorys().size() > 1) {
							bean.setCompetition(item.getCategorys().get(1));
						}
						bean.setDescription(item.getDescription());
						bean.setImage(item.getImage().getUrl());
						bean.setTitle(item.getTitle());
						buffer.add(bean);
						System.out.println(bean.getTitle());
					}
				}
			}
			DaoFactory.getNewsDao().deleteAllNews();
			DaoFactory.getNewsDao().addNewsList(buffer);
			file.delete();
			

		} catch (JAXBException | DaoException e) {
			e.printStackTrace();
		}
	}

}
