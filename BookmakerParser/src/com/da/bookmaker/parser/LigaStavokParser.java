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

public class LigaStavokParser {

	static final private String ENG = "https://www.ligastavok.ru/bets/soccer/angliia-premer-liga-id-8016";
	static final private String RUS = "https://www.ligastavok.ru/bets/soccer/rossiia-premer-liga-maksimalnye-vyplaty-id-10581";
	static final private String ESP = "https://www.ligastavok.ru/bets/soccer/ispaniia-primera-id-7296";
	static final private String ITA = "https://www.ligastavok.ru/bets/soccer/italiia-seriia-a-id-10848";
	static final private String GER = "https://www.ligastavok.ru/bets/soccer/germaniia-bundesliga-id-7383";
	static final private String CL = "https://www.ligastavok.ru/bets/soccer/liga-chempionov-uefa-final-kiev-id-7211";
	static final private String LE = "https://www.ligastavok.ru/bets/soccer/liga-evropy-uefa-final-lion-id-7212";

	private static final Logger logger = Logger.getLogger(BetFaqParser.class);

	static {
		Logger.getLogger("com.gargoylesoftware.htmlunit").setLevel(Level.OFF);
		Logger.getLogger("org.apache.http.client.protocol").setLevel(Level.OFF);
	}

	public static void main(String[] args) throws Exception {
		new LigaStavokParser().parseAllChamp();
	}

	public void parseAllChamp() throws Exception {
		List<String> urls = new ArrayList<>();
		urls.add(ENG);
		urls.add(RUS);
		urls.add(ESP);
		urls.add(ITA);
		urls.add(GER);
		urls.add(CL);
		urls.add(LE);
		for (String url : urls) {
			parseLigaStavok(url);
		}
	}

	private void parseLigaStavok(String url) throws Exception {
		System.err.println(url);
		WebClient webClient = new WebClient(BrowserVersion.CHROME);
		try {
			webClient.getOptions().setThrowExceptionOnScriptError(false);
			System.setProperty("sun.security.ssl.allowUnsafeRenegotiation", "true");
			webClient.setUseInsecureSSL(true);
			HtmlPage page = (HtmlPage) webClient.getPage(url);
			List<?> tables = page.getByXPath("//*[contains(@class, 'line topic__table')]");
			List<PremierLeagueBean> allBeans = new ArrayList<>();
			for (Object object : tables) {
				DomElement table = (DomElement) object;
				List<PremierLeagueBean> beans = getAllStat(table, url);
				allBeans.addAll(beans);
			}
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
			}
		} finally {
			webClient.closeAllWindows();
		}
	}

	private List<PremierLeagueBean> getAllStat(DomElement table, String url) throws Exception {
		List<PremierLeagueBean> beans = new ArrayList<>();
		for (DomElement tr : table.getFirstElementChild().getChildElements()) {
			// невидимый элемент!!!
			PremierLeagueBean bean = new PremierLeagueBean();
			if (tr.getFirstElementChild().getFirstElementChild().getAttribute("class").equals("resultPosition")) {
				bean = getMainStat(tr, bean);
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
				}
				beans.add(bean);
			}
		}
		return beans;
	}

	private PremierLeagueBean getMainStat(DomElement tr, PremierLeagueBean bean) throws Exception {
		Iterator<DomElement> iterator = tr.getFirstElementChild().getChildElements().iterator();
		iterator.next();
		iterator.next();
		DomElement tdName = iterator.next();
		String[] names = tdName.getFirstElementChild().getFirstElementChild().getFirstElementChild().getTextContent()
				.split("-");
		String team1 = names[0].trim();
		String team2 = names[1].trim();
		DomElement tdWin1 = iterator.next();
		double win1 = 0.0;
		double x = 0.0;
		double win2 = 0.0;
		if (!tdWin1.getFirstElementChild().getFirstElementChild().getTextContent().trim().replace(",", ".")
				.equals("-")) {
			win1 = Double.parseDouble(
					tdWin1.getFirstElementChild().getFirstElementChild().getTextContent().trim().replace(",", "."));
		}
		DomElement tdDraw = iterator.next();
		if (!tdDraw.getFirstElementChild().getFirstElementChild().getTextContent().trim().replace(",", ".")
				.equals("-")) {
			x = Double.parseDouble(
					tdDraw.getFirstElementChild().getFirstElementChild().getTextContent().trim().replace(",", "."));
		}
		DomElement tdWin2 = iterator.next();
		if (!tdWin2.getFirstElementChild().getFirstElementChild().getTextContent().trim().replace(",", ".")
				.equals("-")) {
			win2 = Double.parseDouble(
					tdWin2.getFirstElementChild().getFirstElementChild().getTextContent().trim().replace(",", "."));
		}
		bean.setBookmakerId(DaoFactory.getBookmakerDao().getByName("Лига Ставок").getBookMakerId());

		bean.setTeam1(team1);
		bean.setTeam2(team2);
		bean.setWin1(win1);
		bean.setWin2(win2);
		bean.setX(x);
		bean.setHand("");
		bean.setDateStr("16.04.2018 16:00:00");
		return bean;
	}
}