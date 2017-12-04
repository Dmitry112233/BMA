package com.da.bookmaker.parser;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.apache.log4j.Level;
import org.apache.log4j.Logger;

import com.da.bookmaker.bean.ExpressBean;
import com.da.bookmaker.bean.IventBean;
import com.da.bookmaker.dao.DaoFactory;
import com.gargoylesoftware.htmlunit.BrowserVersion;
import com.gargoylesoftware.htmlunit.WebClient;
import com.gargoylesoftware.htmlunit.html.DomElement;
import com.gargoylesoftware.htmlunit.html.HtmlPage;


public class VprognozeParser extends AbstractParser{

	private static final Logger logger = Logger.getLogger(VprognozeParser.class);
	
	private static final String URL =  "vprognoze.ru";
	
	static{
		Logger.getLogger("com.gargoylesoftware.htmlunit").setLevel(Level.OFF);
		Logger.getLogger("org.apache.http.client.protocol").setLevel(Level.OFF);
	}
	
	public void parseVprognoze() {
		logger.info("Vprognoze parser starts...");
		
		
		try {
			List<ExpressBean> beans = new ArrayList<>();
			for (int i = 1; i < 5; i++) {
				String url = getProxyUrl(URL, i == 1?"/express/":"/express/page/" + i + "/");
				beans.addAll(parsePage(url));
			}
			
			DaoFactory.getExpressDao().deleteExpressesList(URL);
			DaoFactory.getIventDao().deleteIventsList(URL);
			DaoFactory.getExpressDao().addExpressesList(beans);
		} catch (Exception ex) {
			logger.warn("Vprognoze failed! ", ex);
		}
		
		logger.info("Vprognoze parser finished.");
	}
	
	private List<ExpressBean> parsePage( String url) throws Exception{
		WebClient webClient = new WebClient(BrowserVersion.CHROME);
		try{
		logger.info("Vprognoze parse : " + url);
	
			webClient.getOptions().setThrowExceptionOnScriptError(false);
			HtmlPage page = webClient.getPage(url);
			List<ExpressBean> beans = new ArrayList<>();
			
			for (DomElement newsBox : page.getElementById("dle-content").getChildElements()) {
				if (!newsBox.getAttribute("class").equals("news_boxing")) {
					continue;
				}
				Iterator<DomElement> newsBoxChildren = newsBox.getChildElements().iterator();
				newsBoxChildren.next(); // title_news
				DomElement news = newsBoxChildren.next(); // news
		
				Iterator<DomElement> newsChildren = news.getFirstElementChild().getChildElements().iterator();
				newsChildren.next();
				newsChildren.next();
				DomElement expressList = newsChildren.next();
				newsChildren.next();
				DomElement blockMatch = newsChildren.next();
				newsChildren.next();
				DomElement description = newsChildren.next();
		
				ExpressBean bean = new ExpressBean();
				bean.setDate(getDate(blockMatch));
				bean.setDescription(description.getTextContent());
				
				bean.setSource("https://vprognoze.ru");
				
				bean.setIventList(createEvents(expressList, bean));
		
				logger.debug( "bean was created: " + bean);
				beans.add(bean);
			}
			return beans;
		}finally{
			webClient.closeAllWindows();
		}
	}

	private Date getDate(DomElement blockMatch) throws ParseException {
		String str = blockMatch.getTextContent();
		str = str.substring(str.indexOf("(") + 1);
		str = str.substring(0, str.indexOf(")"));
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");

		return format.parse(str);
	}

	private ArrayList<IventBean> createEvents(DomElement expressList, ExpressBean express) {
		ArrayList<IventBean> list = new ArrayList<>();

		String competition = null;

		for (DomElement row : expressList.getFirstElementChild().getFirstElementChild().getChildElements()) {
			if (row.getChildElementCount() == 1) {
				competition = row.getTextContent();
				continue;
			} else {
				IventBean bean = new IventBean();

				String data = row.getTextContent();
				String[] datas = data.split("\n");

				bean.setName(datas[2].trim());
				bean.setBet(datas[3].trim());
				bean.setCoefficient(Double.parseDouble(datas[6].trim()));
				bean.setCompetition(competition);
				bean.setDate(express.getDate());
				bean.setSource(URL);

				logger.debug("Event was created : " + bean);
				
				list.add(bean);
			}
		}
		return list;
	}
}