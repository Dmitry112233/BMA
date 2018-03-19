package com.da.bookmaker.parser;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.TimeZone;

import org.apache.log4j.Level;
import org.apache.log4j.Logger;

import com.da.bookmaker.bean.PremierLeagueBean;
import com.da.bookmaker.dao.DaoFactory;
import com.gargoylesoftware.htmlunit.BrowserVersion;
import com.gargoylesoftware.htmlunit.WebClient;
import com.gargoylesoftware.htmlunit.html.DomElement;
import com.gargoylesoftware.htmlunit.html.HtmlPage;

public class OneXbetParser {

	static final private String URL = "https://1xvix.top/line/Football/88637-England-Premier-League/";

	private static final Logger logger = Logger.getLogger(BetFaqParser.class);

	static {
		Logger.getLogger("com.gargoylesoftware.htmlunit").setLevel(Level.OFF);
		Logger.getLogger("org.apache.http.client.protocol").setLevel(Level.OFF);
	}

	public void parseBetFaq() throws Exception {
		WebClient webClient = new WebClient(BrowserVersion.CHROME);

		logger.info("1xBet parser starts...");
		try {
			webClient.getOptions().setThrowExceptionOnScriptError(false);
			HtmlPage page = (HtmlPage) webClient.getPage(URL);
			List<PremierLeagueBean> beans = new ArrayList<>();
			for (DomElement match : page.getElementById("games_content").getChildElements()) {
				logger.info("Get next element");
				if (!match.getAttribute("class").equals("c-events__item")) {
					continue;
				}
				Iterator<DomElement> matchChildren = match.getChildElements().iterator();
				matchChildren.next();
				matchChildren.next();
				DomElement events_time = matchChildren.next();
				matchChildren.next();
				DomElement events_name = matchChildren.next();
				matchChildren.next();
				matchChildren.next();
				DomElement c_bets = matchChildren.next();
				PremierLeagueBean bean = new PremierLeagueBean();
				logger.info("Try to get date and time");
				String time = getDate(events_time);
				logger.info("Try to get names");
				String[] names = getName(events_name);
				logger.info("Try to get coefficients");
				bean = getCoefficients(c_bets, bean);
				logger.info("Try to set date / names / League / bookmakerID ");
				bean.setDateStr(time);
				bean.setTeam1(names[0]);
				bean.setTeam2(names[1]);
				bean.setLeague("Чемпионат Англии");
				bean.setBookmakerId(DaoFactory.getBookmakerDao().getByName("1xBet").getBookMakerId());
				logger.info("Bean has added");
				beans.add(bean);
				System.out.println(bean.getDateStr() + " " + bean.getTeam1() + " " + bean.getTeam2() + " " + bean.getX()
						+ " " + bean.getX12() + " " + bean.getHand() + " " + bean.getTotal());
			}
			DaoFactory.getPremierLeagueDao().addMatchesList(beans);
		} finally {
			webClient.closeAllWindows();
		}
	}

	private PremierLeagueBean getCoefficients(DomElement element, PremierLeagueBean bean) {
		Iterator<DomElement> c_bet_items = element.getChildElements().iterator();
		DomElement c_bet_item1 = c_bet_items.next();
		DomElement c_bet_item2 = c_bet_items.next();
		DomElement c_bet_item3 = c_bet_items.next();
		DomElement c_bet_item4 = c_bet_items.next();
		double[] mass1 = getCoefficientForItem(c_bet_item1);
		double[] mass2 = getCoefficientForItem(c_bet_item2);
		double[] mass3 = getCoefficientForItem(c_bet_item3);
		ArrayList<Object> list = getCoefficientForHand(c_bet_item4);
		logger.info("Try to set coefficients to the match");
		bean.setWin1(mass1[0]);
		bean.setX(mass1[1]);
		bean.setWin2(mass1[2]);
		bean.setX1(mass2[0]);
		bean.setX12(mass2[1]);
		bean.setX2(mass2[2]);
		bean.setLessTotal(mass3[0]);
		bean.setTotal(mass3[1]);
		bean.setMoreTotal(mass3[2]);
		bean.setHand1((double) list.get(0));
		bean.setHand((String) list.get(1));
		bean.setHand2((double) list.get(2));

		return bean;
	}

	private ArrayList<Object> getCoefficientForHand(DomElement element) {
		ArrayList<Object> list = new ArrayList<>();
		for (DomElement coeff : element.getChildElements()) {
			list.add((coeff.getTextContent().trim()));
		}
		return new ArrayList<>();
	}

	private double[] getCoefficientForItem(DomElement element) {
		double[] mass = new double[2];
		for (DomElement coeff : element.getChildElements()) {
			int i = 0;
			mass[i] = Double.parseDouble(coeff.getTextContent().trim());
			i++;
		}
		return mass;
	}

	private String getDate(DomElement element) {
		String date = element.getFirstElementChild().getTextContent();
		String[] subStr;
		String delimeter = " ";
		subStr = date.split(delimeter);
		date = subStr[0] + getCurrentYear() + " " + subStr[1];
		return date;
	}

	private static int getCurrentYear() {
		Calendar calendar = Calendar.getInstance(TimeZone.getDefault(), Locale.getDefault());
		calendar.setTime(new Date());
		return calendar.get(Calendar.YEAR);
	}

	private String[] getName(DomElement element) {
		DomElement events_teams = element.getFirstElementChild();
		String[] mass = new String[2];
		for (DomElement team : events_teams.getChildElements()) {
			mass[0] = team.getTextContent().trim();
			mass[1] = team.getTextContent().trim();
		}

		return mass;
	}
}
