package com.da.bookmaker.parser;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.apache.log4j.Level;
import org.apache.log4j.Logger;

import com.da.bookmaker.bean.ExpressBean;
import com.da.bookmaker.bean.IventBean;
import com.da.bookmaker.dao.DaoFactory;
import com.gargoylesoftware.htmlunit.BrowserVersion;
import com.gargoylesoftware.htmlunit.WebClient;
import com.gargoylesoftware.htmlunit.html.DomElement;
import com.gargoylesoftware.htmlunit.html.HtmlAnchor;
import com.gargoylesoftware.htmlunit.html.HtmlPage;

public class VprognozeParser {

	private static final Logger logger = Logger.getLogger(VprognozeParser.class);

	private static final String URL = "https://vprognoze.ru";

	static {
		Logger.getLogger("com.gargoylesoftware.htmlunit").setLevel(Level.OFF);
		Logger.getLogger("org.apache.http.client.protocol").setLevel(Level.OFF);
	}

	private HtmlPage page;

	public static void main(String[] args) {
		new VprognozeParser().parseVprognoze();
	}

	public void parseVprognoze() {
		logger.info("Vprognoze parser starts...");

		WebClient webClient = new WebClient(BrowserVersion.CHROME);
		try {
			webClient.getOptions().setThrowExceptionOnScriptError(false);
			List<ExpressBean> beans = new ArrayList<>();
			for (int i = 1; i < 5; i++) {
				String page = (i == 1 ? "/express/" : "/express/page/" + i + "/");
				String url = URL + page;
				// String url = getProxyUrl(URL, i ==
				// 1?"/express/":"/express/page/" + i + "/");
				beans.addAll(parsePage(url, webClient));
			}
			beans = removeAllDuplicates((ArrayList<ExpressBean>) beans);
			DaoFactory.getExpressDao().deleteExpressesList(URL);
			DaoFactory.getIventDao().deleteIventsList(URL);
			DaoFactory.getExpressDao().addExpressesList(beans);
		} catch (Exception ex) {
			logger.warn("Vprognoze failed! ", ex);
		} finally {
			webClient.closeAllWindows();
		}

		logger.info("Vprognoze parser finished.");
	}

	private List<ExpressBean> parsePage(String url, WebClient webClient) throws Exception {

		logger.info("Vprognoze parse : " + url);

		if (url.endsWith("/express/")) {
			page = webClient.getPage(url);
		} else {
			HtmlAnchor anchor = page.getAnchorByHref(url);
			page = anchor.click();

		}
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

			bean.setSource(URL);

			bean.setIventList(createEvents(expressList, bean));
			beans.add(bean);
		}
		return beans;
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
				list.add(bean);
			}
		}
		return list;
	}

	private List<ExpressBean> removeAllDuplicates(ArrayList<ExpressBean> beans) {

		int size = beans.size();
		int duplicates = 0;

		for (int i = 0; i < size - 1; i++) {
			// start from the next item after strings[i]
			// since the ones before are checked
			for (int j = i + 1; j < size; j++) {
				// no need for if ( i == j ) here
				if (!beans.get(j).getDescription().equals(beans.get(i).getDescription())) {
					continue;
				} else {
					duplicates++;
					beans.remove(j);
					// decrease j because the array got re-indexed
					j--;
					// decrease the size of the array
					size--;
				}
			} // for j
		} // for i
		return beans;
	}

}
