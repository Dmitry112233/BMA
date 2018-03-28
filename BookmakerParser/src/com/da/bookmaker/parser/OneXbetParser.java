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
import com.gargoylesoftware.htmlunit.html.HtmlDivision;
import com.gargoylesoftware.htmlunit.html.HtmlPage;

public class OneXbetParser extends AbstractParser {

	static final private String URL = "https://1xvix.top/line/Football/88637-England-Premier-League/";

	private static final Logger logger = Logger.getLogger(BetFaqParser.class);

	static {
		Logger.getLogger("com.gargoylesoftware.htmlunit").setLevel(Level.OFF);
		Logger.getLogger("org.apache.http.client.protocol").setLevel(Level.OFF);
	}

	public static void main(String[] args) throws Exception {
		new OneXbetParser().parseOneXBet();
	}

	public void parseOneXBet() throws Exception {
		WebClient webClient = new WebClient(BrowserVersion.CHROME);

		logger.info("1xBet parser starts...");
		try {
			webClient.getOptions().setThrowExceptionOnScriptError(false);
			System.setProperty("sun.security.ssl.allowUnsafeRenegotiation", "true");
			webClient.setUseInsecureSSL(true);
			HtmlPage page = (HtmlPage) webClient.getPage(URL);
			List<PremierLeagueBean> beans = new ArrayList<>();
			// Засетить Имя Чемпионат + поле в базе
			// 
			List<?> htmlDivisions = page.getByXPath("//*[contains(@class, 'c-events__item c-events__item_col')]");
			// Не могу взять итератором нужный элемент, т.к NoSurchElementException
			long bookmakerId = DaoFactory.getBookmakerDao().getByName("1xBet").getBookMakerId();
			for (Object object : htmlDivisions) {
				HtmlDivision division = (HtmlDivision)object;
				logger.info("Get next element");
				DomElement match = division.getFirstElementChild();
				Iterator<DomElement> matchChildren = match.getChildElements().iterator();
				matchChildren.next();
				matchChildren.next();
				DomElement events_time = matchChildren.next();
				matchChildren.next();
				DomElement events_name = matchChildren.next();
				System.out.println(events_name.getAttribute("class"));
				matchChildren.next();
				matchChildren.next();
				DomElement c_bets = matchChildren.next();
				System.out.println(c_bets.getAttribute("class"));
				PremierLeagueBean bean = new PremierLeagueBean();
				logger.info("Try to get date and time");
				String time = getDate(events_time);
				logger.info("Try to get names");
				ArrayList<String> names = getName(events_name);
				logger.info("Try to get coefficients");
				bean = getCoefficients(c_bets, bean);
				logger.info("Try to set date / names / League / bookmakerID ");
				bean.setDateStr(time);
				bean.setTeam1(names.get(0));
				bean.setTeam2(names.get(1));
				bean.setLeague("Чемпионат Англии");
				bean.setBookmakerId(bookmakerId);
				logger.info("Bean has added");
				beans.add(bean);
				System.out.println(bean.getDateStr() + " " + bean.getTeam1() + " " + bean.getTeam2() + " " + bean.getX()
						+ " " + bean.getX12() + " " + bean.getHand() + " " + bean.getTotal());
			}
			DaoFactory.getPremierLeagueDao().deleteMatchesList();
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
		ArrayList<Double> mass1 = getCoefficientForItem(c_bet_item1);
		ArrayList<Double> mass2 = getCoefficientForItem(c_bet_item2);
		ArrayList<Double> mass3 = getCoefficientForItem(c_bet_item3);
		ArrayList<String> list = getCoefficientForHand(c_bet_item4);
		logger.info("Try to set coefficients to the match");
		System.out.println(mass1.size() + " " + mass2.size() + " " + mass3.size() + " " + list.size());
		bean.setWin1(mass1.get(0));
		bean.setX(mass1.get(1));
		bean.setWin2(mass1.get(2));
		bean.setX1(mass2.get(0));
		bean.setX12(mass2.get(1));
		bean.setX2(mass2.get(2));
		bean.setLessTotal(mass3.get(0));
		bean.setTotal(mass3.get(1));
		bean.setMoreTotal(mass3.get(2));
		bean.setHand1(Double.parseDouble(list.get(0)));
		bean.setHand((String) list.get(1));
		bean.setHand2(Double.parseDouble(list.get(2)));

		return bean;
	}

	private ArrayList<String> getCoefficientForHand(DomElement element) {
		ArrayList<String> list = new ArrayList<>();
		for (DomElement coeff : element.getChildElements()) {
			list.add((coeff.getTextContent().trim()));
		}
		return list;
	}

	private ArrayList<Double> getCoefficientForItem(DomElement element) {
		ArrayList<Double> mass = new ArrayList<>();
		for (DomElement coeff : element.getChildElements()) {
			System.out.println(coeff.getTextContent().trim().replace(",","."));
			mass.add(Double.parseDouble(coeff.getTextContent().trim().replace(",", ".")));
		}
		return mass;
	}

	private String getDate(DomElement element) {
		String date = element.getFirstElementChild().getTextContent();
		String[] subStr;
		String delimeter = " ";
		subStr = date.split(delimeter);
		date = subStr[0] + "." + getCurrentYear() + " " + subStr[1] + ":00";
		return date;
	}

	private int getCurrentYear() {
		Calendar calendar = Calendar.getInstance(TimeZone.getDefault(), Locale.getDefault());
		calendar.setTime(new Date());
		return calendar.get(Calendar.YEAR);
	}

	private ArrayList<String> getName(DomElement element) {
		DomElement events_teams = element.getFirstElementChild();
		ArrayList<String> names = new ArrayList<>();
		for (DomElement el : events_teams.getFirstElementChild().getChildElements()) {
			names.add(el.getTextContent().trim());
		}
		return names;
	}
}
