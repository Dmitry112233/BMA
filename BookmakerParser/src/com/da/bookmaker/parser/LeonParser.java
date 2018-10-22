package com.da.bookmaker.parser;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.apache.log4j.Level;
import org.apache.log4j.Logger;

import com.da.bookmaker.bean.PremierLeagueBean;
import com.da.bookmaker.dao.DaoFactory;
import com.gargoylesoftware.htmlunit.BrowserVersion;
import com.gargoylesoftware.htmlunit.WebClient;
import com.gargoylesoftware.htmlunit.html.DomElement;
import com.gargoylesoftware.htmlunit.html.HtmlPage;

public class LeonParser {

	static final private String ENG = "https://www.leon.ru/events/prematch/1424967069597697/1424967080530205";
	static final private String RUS = "https://www.leon.ru/betoffer/1/101";
	static final private String ESP = "https://www.leon.ru/betoffer/1/117";
	static final private String ITA = "https://www.leon.ru/betoffer/1/81";
	static final private String GER = "https://www.leon.ru/betoffer/1/59";
	static final private String CL = "https://www.ligastavok.ru/bets/soccer/liga-chempionov-uefa-final-kiev-id-7211";
	static final private String LE = "https://www.leon.ru/events/prematch/1424967069597697/1424967069599701";
	static final private String WC = "https://www.leon.ru/events/prematch/1424967069597697/1424967075212442";

	private static final Logger logger = Logger.getLogger(BetFaqParser.class);

	static {
		Logger.getLogger("com.gargoylesoftware.htmlunit").setLevel(Level.OFF);
		Logger.getLogger("org.apache.http.client.protocol").setLevel(Level.OFF);
	}

	public static void main(String[] args) throws Exception {
		new LeonParser().parseAllChamp();
	}

	public void parseAllChamp() throws Exception {
	List<String> urls = new ArrayList<>();
	/*		urls.add(ENG);
		urls.add(RUS);
		urls.add(ESP);
		urls.add(ITA);
		urls.add(GER);
		// urls.add(CL);
		urls.add(LE);*/
		urls.add(ENG);
		for (String url : urls) {
			parseLeon(url);
		}
	}

	public void parseLeon(String url) throws Exception {
		WebClient webClient = new WebClient(BrowserVersion.CHROME);
		try {
			System.out.println(url);
			webClient.getOptions().setThrowExceptionOnScriptError(false);
			System.setProperty("sun.security.ssl.allowUnsafeRenegotiation", "true");
			webClient.setUseInsecureSSL(true);
			HtmlPage page = (HtmlPage) webClient.getPage(url);
			List<?> tables = page.getByXPath("//*[contains(@betline, 'prematch')]");
			List<PremierLeagueBean> beans = new ArrayList<>();
			System.out.println(tables.size());
			if (tables.size() > 0) {
				DomElement table = (DomElement) tables.get(0);
				System.out.println(table.getFirstElementChild().getAttribute("class"));
				DomElement elem = table.getLastElementChild();
				PremierLeagueBean bean = null;
				for (DomElement element : elem.getChildElements()) {
					if (element.getAttribute("class").equals("st-event-container odd") || element.getAttribute("class").equals("st-event-container even")) {
						bean = new PremierLeagueBean();
						switch (url) {
						case ENG:
							bean.setLeague("Английская Премьер Лига");
							break;
						case RUS:
							bean.setLeague("Российская Премьер Лига");
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
							bean.setLeague("Чемпионат Мира0");
							break;
						}
						bean = getMainStat(bean, element);
						beans.add(bean);
					}
					if (element.hasAttribute("id")) {
						bean = getSecondCahnseStat(bean, element);
					}
				}
			}
			switch (url) {
			case ENG:
				DaoFactory.getPremierLeagueDao().deleteMatchesList("Английская Премьер Лига", 2);
				DaoFactory.getPremierLeagueDao().addMatchesList(beans);
				break;
			case RUS:
				DaoFactory.getPremierLeagueDao().deleteMatchesList("Российская Премьер Лига", 2);
				DaoFactory.getPremierLeagueDao().addMatchesList(beans);
				break;
			case GER:
				DaoFactory.getPremierLeagueDao().deleteMatchesList("Немецкая Бундеслига", 2);
				DaoFactory.getPremierLeagueDao().addMatchesList(beans);
				break;
			case ITA:
				DaoFactory.getPremierLeagueDao().deleteMatchesList("Итальянская серия А", 2);
				DaoFactory.getPremierLeagueDao().addMatchesList(beans);
				break;
			case ESP:
				DaoFactory.getPremierLeagueDao().deleteMatchesList("Испанская Ла Лига", 2);
				DaoFactory.getPremierLeagueDao().addMatchesList(beans);
				break;
			case CL:
				DaoFactory.getPremierLeagueDao().deleteMatchesList("Лига Чемпионов", 2);
				DaoFactory.getPremierLeagueDao().addMatchesList(beans);
				break;
			case LE:
				DaoFactory.getPremierLeagueDao().deleteMatchesList("Лига Европы", 2);
				DaoFactory.getPremierLeagueDao().addMatchesList(beans);
				break;
			case WC:
				DaoFactory.getPremierLeagueDao().deleteMatchesList("Чемпионат Мира", 2);
				DaoFactory.getPremierLeagueDao().addMatchesList(beans);
				break;
			}
		} finally {
			webClient.closeAllWindows();
		}
	}

	private PremierLeagueBean getMainStat(PremierLeagueBean bean, DomElement element) throws Exception {
		Iterator<DomElement> iterator = element.getChildElements().iterator();
		iterator.next();
		DomElement tdNames = iterator.next();
		String[] names = tdNames.getFirstElementChild().getFirstElementChild().getTextContent().split(" - ");
		String team1 = names[0].trim();
		String team2 = names[1].trim();
		System.out.println(team1);
		System.out.println(team2);
		
		double win1 = Double
				.parseDouble(iterator.next().getFirstElementChild().getFirstElementChild().getTextContent());
		double x = Double.parseDouble(iterator.next().getFirstElementChild().getFirstElementChild().getTextContent());
		double win2 = Double
				.parseDouble(iterator.next().getFirstElementChild().getFirstElementChild().getTextContent());
		bean.setTeam1(team1);
		bean.setTeam2(team2);
		bean.setWin1(win1);
		bean.setX(x);
		bean.setWin2(win2);
		bean.setDateStr("16.04.2018 16:00:00");
		bean.setHand("");
		bean.setBookmakerId(DaoFactory.getBookmakerDao().getByName("БК ЛЕОН").getBookMakerId());
		return bean;
	}

	private PremierLeagueBean getSecondCahnseStat(PremierLeagueBean bean, DomElement element) {
		Iterator<DomElement> iterator = element.getChildElements().iterator();
		iterator.next();
		DomElement td = iterator.next();
		for (DomElement elem : td.getChildElements()) {
			if (elem.getFirstElementChild().getFirstElementChild().getFirstElementChild().getFirstElementChild()
					.getTextContent().trim().equals("Двойной исход")) {
				DomElement tbody = elem.getFirstElementChild();
				Iterator<DomElement> bodyIterator = tbody.getChildElements().iterator();
				bodyIterator.next();
				DomElement tdX1 = bodyIterator.next();
				DomElement tdX12 = bodyIterator.next();
				DomElement tdX2 = bodyIterator.next();
				String[] mass1 = tdX1.getAttribute("betdata").split(",");
				String[] mass12 = tdX12.getAttribute("betdata").split(",");
				String[] mass2 = tdX2.getAttribute("betdata").split(",");
				double x1 = Double.parseDouble(mass1[3].trim());
				double x12 = Double.parseDouble(mass12[3].trim());
				double x2 = Double.parseDouble(mass2[3].trim());
				bean.setX1(x1);
				bean.setX12(x12);
				bean.setX2(x2);
			}
			if (elem.getFirstElementChild().getFirstElementChild().getFirstElementChild().getFirstElementChild()
					.getTextContent().trim().equals("Тотал")
					&& elem.getFirstElementChild().getLastElementChild().getFirstElementChild().getTextContent().trim()
							.equals("Больше (2.5)")) {
				DomElement tbody = elem.getFirstElementChild();
				Iterator<DomElement> bodyIterator = tbody.getChildElements().iterator();
				bodyIterator.next();
				DomElement tdTotalLess = bodyIterator.next();
				DomElement tdTotalMore = bodyIterator.next();
				String[] massTotalLess = tdTotalLess.getAttribute("betdata").split(",");
				String[] massTotalMore = tdTotalMore.getAttribute("betdata").split(",");
				double totalLess = Double.parseDouble(massTotalLess[3].trim());
				double totalMore = Double.parseDouble(massTotalMore[3].trim());
				bean.setLessTotal(totalLess);
				bean.setTotal(2.5);
				bean.setMoreTotal(totalMore);
			}
		}
		return bean;
	}
}