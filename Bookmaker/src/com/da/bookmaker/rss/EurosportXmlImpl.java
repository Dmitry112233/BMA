package com.da.bookmaker.rss;

import java.io.BufferedInputStream;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.Arrays;

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
	
	public static void main(String[] args) throws UnknownHostException, IOException, InterruptedException {
		
	// сокетом сложить строки из ксмл
		URL eurosport = new URL("http://www.eurosport.ru/rss.xml");
		try(InputStream socketInStream = new BufferedInputStream(eurosport.openStream());) {
			
			byte[] byteMass = new byte[0];
			
			Thread.sleep(500);
			int count = 0;
			while ((count = socketInStream.available()) > 0){
				byte[] buffer = new byte[count];
				socketInStream.read(buffer);
				byte tmp[] = byteMass;
				byteMass = new byte[byteMass.length + count];
				System.arraycopy(tmp, 0, byteMass, 0, tmp.length);
				System.arraycopy(buffer, 0, byteMass, tmp.length, buffer.length);
			}
			
			Unmarshaller m = JAXBContext.newInstance(Rss.class).createUnmarshaller();
			Rss root = (Rss) m.unmarshal(new ByteArrayInputStream(byteMass));

			ArrayList<NewsBean> buffer = new ArrayList<>();
			if (root.getChannels() != null) {
				for (Channel channel : root.getChannels()) {
					for (Item item : channel.getItems()){
						NewsBean bean = new NewsBean(item);
						buffer.add(bean);
						System.out.println(bean.getTitle());
					}
				}
			} 
			DaoFactory.getNewsDao().addNewsList(buffer);
		} catch (JAXBException | DaoException e) {
		}
	}
	
}
