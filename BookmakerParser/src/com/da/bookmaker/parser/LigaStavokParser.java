package com.da.bookmaker.parser;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.da.bookmaker.bean.PremierLeagueBean;
import com.da.bookmaker.dao.DaoException;
import com.da.bookmaker.dao.DaoFactory;
import com.gargoylesoftware.htmlunit.BrowserVersion;
import com.gargoylesoftware.htmlunit.WebClient;
import com.gargoylesoftware.htmlunit.html.DomElement;
import com.gargoylesoftware.htmlunit.html.HtmlPage;

public class LigaStavokParser {

	static final private String ENG = "https://www.ligastavok.ru/bets/my-line/soccer/angliia-id-239/apl-id-9758";
	static final private String RUS = "https://www.ligastavok.ru/bets/my-line/soccer/rossiia-id-350/rfpl-id-5271";
	
	static final private String ESP = "https://www.ligastavok.ru/bets/my-line/soccer/ispaniia-id-287/primera-id-11403";
	static final private String ITA = "https://www.ligastavok.ru/bets/my-line/soccer/italiia-id-288/seriiaa-id-11405";
	static final private String GER = "https://www.ligastavok.ru/bets/my-line/soccer/germaniia-id-268/bundesliga-id-8166";
	static final private String CL = "https://www.ligastavok.ru/bets/soccer/liga-chempionov-uefa-final-kiev-id-7211";
	static final private String LE = "https://www.ligastavok.ru/bets/soccer/liga-evropy-uefa-final-lion-id-7212";
	static final private String WC = "https://www.ligastavok.ru/bets/my-line/soccer/mezhdunarodnye-sbornye-id-327/chm-2018-id-10887";

	public static void main(String[] args) throws Exception {
		new LigaStavokParser().parseAllChamp();
	}

	public void parseAllChamp() throws Exception {
		List<String> urls = new ArrayList<>();
		urls.add(ENG);
		urls.add(RUS);
		
		for (String url : urls) {
			parseLigaStavok(url);
		}
	}

	private void parseLigaStavok(String url) throws Exception {
		System.out.println(url);
		WebClient webClient = new WebClient(BrowserVersion.CHROME);
		try {
			webClient.getOptions().setThrowExceptionOnScriptError(false);
			System.setProperty("sun.security.ssl.allowUnsafeRenegotiation", "true");
			webClient.setUseInsecureSSL(true);
			HtmlPage page = (HtmlPage) webClient.getPage(url);
			List<?> tables = page.getByXPath("//*[contains(@class, 'events-9f763d events-proposed__events')]");
			List<PremierLeagueBean> allBeans = new ArrayList<>();
			DomElement table = (DomElement) tables.get(0);
			List<PremierLeagueBean> beans = getAllStat(table, url);
			allBeans.addAll(beans);
			switch (url) {
			case ENG:
				DaoFactory.getPremierLeagueDao().deleteMatchesList("Английская Примьер Лига", 3);
				DaoFactory.getPremierLeagueDao().addMatchesList(allBeans);
				break;
			case RUS:
				DaoFactory.getPremierLeagueDao().deleteMatchesList("Российская Примьер Лига", 3);
				DaoFactory.getPremierLeagueDao().addMatchesList(allBeans);
				break;
			case GER:
				DaoFactory.getPremierLeagueDao().deleteMatchesList("Немецкая Бундеслига", 3);
				DaoFactory.getPremierLeagueDao().addMatchesList(allBeans);
				break;
			case ITA:
				DaoFactory.getPremierLeagueDao().deleteMatchesList("Итальянская серия А", 3);
				DaoFactory.getPremierLeagueDao().addMatchesList(allBeans);
				break;
			case ESP:
				DaoFactory.getPremierLeagueDao().deleteMatchesList("Испанская Ла Лига", 3);
				DaoFactory.getPremierLeagueDao().addMatchesList(allBeans);
				break;
			case CL:
				DaoFactory.getPremierLeagueDao().deleteMatchesList("Лига Чемпионов", 3);
				DaoFactory.getPremierLeagueDao().addMatchesList(allBeans);
				break;
			case LE:
				DaoFactory.getPremierLeagueDao().deleteMatchesList("Лига Европы", 3);
				DaoFactory.getPremierLeagueDao().addMatchesList(allBeans);
				break;
			case WC:
				DaoFactory.getPremierLeagueDao().deleteMatchesList("Чемпионат Мира", 3);
				DaoFactory.getPremierLeagueDao().addMatchesList(allBeans);
				break;
			}
		} finally {
			webClient.closeAllWindows();
		}
	}

	public List<PremierLeagueBean> getAllStat(DomElement table, String url) throws ParseException, DaoException {
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
			switch (url) {
			case ENG:
				bean.setLeague("Английская Примьер Лига");
				break;
			case RUS:
				bean.setLeague("Российская Примьер Лига");
				break;
			case GER:
				bean.setLeague("Немецкая Бундеслига");
				break;
			case ITA:
				bean.setLeague("Итальянская серия А");
				break;
			case ESP:
				bean.setLeague("Испанская Ла Лига");
				break;
			case CL:
				bean.setLeague("Лига Чемпионов");
				break;
			case LE:
				bean.setLeague("Лига Европы");
				break;
			case WC:
				bean.setLeague("Чемпионат Мира");
				 break;
			}
			beans.add(bean);
		}
		return beans;
	}

	public PremierLeagueBean getEventName(DomElement eventNameElem, PremierLeagueBean bean) {
 		Iterator<DomElement> iterator1 = eventNameElem.getChildElements()
				.iterator();
 		iterator1.next();
 		DomElement elementChild = iterator1.next();
		Iterator<DomElement> iterator = elementChild.getFirstElementChild().getChildElements()
				.iterator();
		bean.setTeam1(iterator.next().getTextContent().trim());
		bean.setTeam2(iterator.next().getTextContent().trim());
		
		return bean;
	}

	public PremierLeagueBean getEventCoeff(DomElement eventCoeffElem, PremierLeagueBean bean) throws ParseException {
		Iterator<DomElement> iterator = eventCoeffElem.getFirstElementChild().getLastElementChild().getChildElements().iterator();
		DomElement winElement = iterator.next();
		DomElement totalElement = iterator.next();
		bean = getWinCoeff(winElement, bean);
		bean = getTotalCoeff(totalElement, bean);
		return bean;
	}

	public PremierLeagueBean getWinCoeff(DomElement winElement, PremierLeagueBean bean) throws ParseException {
		Iterator<DomElement> iterator = winElement.getFirstElementChild().getChildElements().iterator();
		bean.setWin1(Double.parseDouble(iterator.next().getFirstElementChild().getTextContent().trim().replace(",", ".")));
		bean.setX(Double.parseDouble(iterator.next().getFirstElementChild().getTextContent().trim().replace(",", ".")));
		bean.setWin2(Double.parseDouble(iterator.next().getFirstElementChild().getTextContent().trim().replace(",", ".")));
		bean.setDateStr("16.04.2018 16:00:00");
		return bean;
	}

	public PremierLeagueBean getTotalCoeff(DomElement totalElement, PremierLeagueBean bean) {
		Iterator<DomElement> iterator = totalElement.getFirstElementChild().getChildElements().iterator();
		bean.setLessTotal(Double.parseDouble(iterator.next().getFirstElementChild().getTextContent().trim().replace(",", ".")));
		bean.setTotal(Double.parseDouble(iterator.next().getTextContent().trim().replace(",", ".")));
		bean.setMoreTotal(Double.parseDouble(iterator.next().getFirstElementChild().getTextContent().trim().replace(",", ".")));
		return bean;
	}
}
