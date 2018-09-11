package com.da.bookmaker.parser;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;

import org.apache.log4j.Level;
import org.apache.log4j.Logger;

import com.da.bookmaker.bean.PremierLeagueBean;
import com.da.bookmaker.dao.DaoException;
import com.da.bookmaker.dao.DaoFactory;
import com.gargoylesoftware.htmlunit.BrowserVersion;
import com.gargoylesoftware.htmlunit.FailingHttpStatusCodeException;
import com.gargoylesoftware.htmlunit.WebClient;
import com.gargoylesoftware.htmlunit.html.DomElement;
import com.gargoylesoftware.htmlunit.html.HtmlPage;

public class LigaStavokParser {

	private File file = new File("D://ligaStavokUrl.properties");
	private FileInputStream fis;
	static private Properties property;

	public static void main(String[] args) throws Exception {
		new LigaStavokParser().parseAllChamp();
	}

	private static final Logger logger = Logger.getLogger(BetFaqParser.class);

	static {
		Logger.getLogger("com.gargoylesoftware.htmlunit").setLevel(Level.OFF);
		Logger.getLogger("org.apache.http.client.protocol").setLevel(Level.OFF);
	}

	public void parseAllChamp() throws Exception {
		try {
			if (property == null) {
				property = new Properties();
				fis = new FileInputStream(file);
				property.load(fis);
			}
			List<String> urls = new ArrayList<>();
			urls.add(property.getProperty("ENG"));
			urls.add(property.getProperty("RUS"));
			urls.add(property.getProperty("ESP"));
			urls.add(property.getProperty("ITA"));
			urls.add(property.getProperty("GER"));
			for (String url : urls) {
				parseLigaStavok(url, property);
			}
		} catch (IOException e) {
			System.err.println("Файл ligaStavokUrl не найден");
		} finally {
			if (fis != null) {
				fis.close();
			}
		}
	}

	private void parseLigaStavok(String url, Properties property) throws Exception {
		System.out.println(url);
		WebClient webClient = new WebClient(BrowserVersion.CHROME);
		try {
			logger.info("LigaStavok start for url: " + url);
			webClient.getOptions().setThrowExceptionOnScriptError(false);
			System.setProperty("sun.security.ssl.allowUnsafeRenegotiation", "true");
			webClient.setUseInsecureSSL(true);
			HtmlPage page = (HtmlPage) webClient.getPage(url);
			List<?> tables = page.getByXPath("//*[contains(@class, 'events-9f763d events-proposed__events')]");
			List<PremierLeagueBean> allBeans = new ArrayList<>();
			DomElement table = (DomElement) tables.get(0);
			List<PremierLeagueBean> beans = getAllStat(table, url, property);
			allBeans.addAll(beans);
			if (url.equals(property.getProperty("ENG"))) {
				DaoFactory.getPremierLeagueDao().deleteMatchesList("Английская Примьер Лига", 3);
				DaoFactory.getPremierLeagueDao().addMatchesList(beans);
				logger.info("1xBet saved for url: " + url);
			}
			if (url.equals(property.getProperty("RUS"))) {
				DaoFactory.getPremierLeagueDao().deleteMatchesList("Российская Примьер Лига", 3);
				DaoFactory.getPremierLeagueDao().addMatchesList(beans);
				logger.info("1xBet saved for url: " + url);
			}
			if (url.equals(property.getProperty("GER"))) {
				DaoFactory.getPremierLeagueDao().deleteMatchesList("Немецкая Бундеслига", 3);
				DaoFactory.getPremierLeagueDao().addMatchesList(beans);
				logger.info("1xBet saved for url: " + url);
			}
			if (url.equals(property.getProperty("ITA"))) {
				DaoFactory.getPremierLeagueDao().deleteMatchesList("Итальянская серия А", 3);
				DaoFactory.getPremierLeagueDao().addMatchesList(beans);
				logger.info("1xBet saved for url: " + url);
			}
			if (url.equals(property.getProperty("ESP"))) {
				DaoFactory.getPremierLeagueDao().deleteMatchesList("Испанская Ла Лига", 3);
				DaoFactory.getPremierLeagueDao().addMatchesList(beans);
				logger.info("1xBet saved for url: " + url);
			}
			if (url.equals(property.getProperty("CL"))) {
				DaoFactory.getPremierLeagueDao().deleteMatchesList("Лига Чемпионов", 3);
				DaoFactory.getPremierLeagueDao().addMatchesList(beans);
				logger.info("1xBet saved for url: " + url);
			}
			if (url.equals(property.getProperty("LE"))) {
				DaoFactory.getPremierLeagueDao().deleteMatchesList("Лига Европы", 3);
				DaoFactory.getPremierLeagueDao().addMatchesList(beans);
				logger.info("1xBet saved for url: " + url);
			}
			if (url.equals(property.getProperty("WC"))) {
				DaoFactory.getPremierLeagueDao().deleteMatchesList("Чемпионат Мира", 3);
				DaoFactory.getPremierLeagueDao().addMatchesList(beans);
				logger.info("1xBet saved for url: " + url);
			}
		} catch (FailingHttpStatusCodeException e) {
			System.err.println(url + " IS NOT FOUND");
		} finally {
			webClient.closeAllWindows();
		}
	}

	public List<PremierLeagueBean> getAllStat(DomElement table, String url, Properties property) throws ParseException, DaoException {
		List<PremierLeagueBean> beans = new ArrayList<>();
		for (DomElement event : table.getChildElements()) {
			PremierLeagueBean bean = new PremierLeagueBean();
			bean.setBookmakerId(DaoFactory.getBookmakerDao().getByName("Лига Ставок").getBookMakerId());
			Iterator<DomElement> iterator = event.getChildElements().iterator();
			iterator.next();
			DomElement eventNameElem = iterator.next();
			iterator.next();
			DomElement eventCoeffElem = iterator.next();
			bean = getEventName(eventNameElem, bean);
			bean = getEventCoeff(eventCoeffElem, bean);
			if (url.equals(property.getProperty("ENG"))) {
				bean.setLeague("Английская Примьер Лига");
			}
			if (url.equals(property.getProperty("RUS"))) {
				bean.setLeague("Российская Примьер Лига");
			}
			if (url.equals(property.getProperty("GER"))) {
				bean.setLeague("Немецкая Бундеслига");
			}
			if (url.equals(property.getProperty("ITA"))) {
				bean.setLeague("Итальянская серия А");
			}
			if (url.equals(property.getProperty("ESP"))) {
				bean.setLeague("Испанская Ла Лига");
			}
			if (url.equals(property.getProperty("CL"))) {
				bean.setLeague("Лига Чемпионов");
			}
			if (url.equals(property.getProperty("LE"))) {
				bean.setLeague("Лига Европы");
			}
			if (url.equals(property.getProperty("WC"))) {
				bean.setLeague("Чемпионат Мира");
			}
			beans.add(bean);
		}
		return beans;
	}

	public PremierLeagueBean getEventName(DomElement eventNameElem, PremierLeagueBean bean) {
		Iterator<DomElement> iterator1 = eventNameElem.getChildElements().iterator();
		iterator1.next();
		DomElement elementChild = iterator1.next();
		Iterator<DomElement> iterator = elementChild.getFirstElementChild().getChildElements().iterator();
		bean.setTeam1(iterator.next().getTextContent().trim());
		bean.setTeam2(iterator.next().getTextContent().trim());

		return bean;
	}

	public PremierLeagueBean getEventCoeff(DomElement eventCoeffElem, PremierLeagueBean bean) throws ParseException {
		Iterator<DomElement> iterator = eventCoeffElem.getFirstElementChild().getLastElementChild().getChildElements()
				.iterator();
		DomElement winElement = iterator.next();
		DomElement totalElement = iterator.next();
		bean = getWinCoeff(winElement, bean);
		bean = getTotalCoeff(totalElement, bean);
		return bean;
	}

	public PremierLeagueBean getWinCoeff(DomElement winElement, PremierLeagueBean bean) throws ParseException {
		Iterator<DomElement> iterator = winElement.getFirstElementChild().getChildElements().iterator();
		bean.setWin1(
				Double.parseDouble(iterator.next().getFirstElementChild().getTextContent().trim().replace(",", ".")));
		bean.setX(Double.parseDouble(iterator.next().getFirstElementChild().getTextContent().trim().replace(",", ".")));
		bean.setWin2(
				Double.parseDouble(iterator.next().getFirstElementChild().getTextContent().trim().replace(",", ".")));
		bean.setDateStr("16.04.2018 16:00:00");
		return bean;
	}

	public PremierLeagueBean getTotalCoeff(DomElement totalElement, PremierLeagueBean bean) {
		Iterator<DomElement> iterator = totalElement.getFirstElementChild().getChildElements().iterator();
		bean.setLessTotal(
				Double.parseDouble(iterator.next().getFirstElementChild().getTextContent().trim().replace(",", ".")));
		bean.setTotal(Double.parseDouble(iterator.next().getTextContent().trim().replace(",", ".")));
		bean.setMoreTotal(
				Double.parseDouble(iterator.next().getFirstElementChild().getTextContent().trim().replace(",", ".")));
		return bean;
	}
}
