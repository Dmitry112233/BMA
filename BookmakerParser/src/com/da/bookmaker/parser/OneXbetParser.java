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

	static final private String ENG = "https://1xvix.top/line/Football/88637-England-Premier-League/";
	static final private String RUS = "https://1xvix.top/line/Football/225733-Russia-Premier-League/";
	static final private String ESP = "https://1xvix.top/line/Football/127733-Spain-Primera-Division/";
	static final private String ITA = "https://1xvix.top/line/Football/110163-Italy-Serie-A/";
	static final private String GER = "https://1xvix.top/line/Football/96463-Germany-Bundesliga/";
	static final private String CL = "https://1xvix.top/line/Football/118587-UEFA-Champions-League/";
	static final private String LE = "https://1xvix.top/line/Football/118593-UEFA-Europa-League/";

	private static final Logger logger = Logger.getLogger(BetFaqParser.class);

	static {
		Logger.getLogger("com.gargoylesoftware.htmlunit").setLevel(Level.OFF);
		Logger.getLogger("org.apache.http.client.protocol").setLevel(Level.OFF);
	}

	public static void main(String[] args) throws Exception {
		new OneXbetParser().paresAllChamp();
	}

	public void paresAllChamp() throws Exception {
		List<String> urls = new ArrayList<>();
		urls.add(ENG);
		urls.add(RUS);
		urls.add(ESP);
		urls.add(ITA);
		urls.add(GER);
		//urls.add(CL);
		//urls.add(LE);
		for (String url : urls) {
			parseOneXBet(url);
		}
	}

	private void parseOneXBet(String url) throws Exception {
		WebClient webClient = new WebClient(BrowserVersion.CHROME);
		try {
			System.out.println("Pars: " + url);
			webClient.getOptions().setThrowExceptionOnScriptError(false);
			System.setProperty("sun.security.ssl.allowUnsafeRenegotiation", "true");
			webClient.setUseInsecureSSL(true);
			HtmlPage page = (HtmlPage) webClient.getPage(url);
			List<PremierLeagueBean> beans = new ArrayList<>();
			// Засетить Имя Чемпионат + поле в базе
			List<?> htmlDivisions = page.getByXPath("//*[contains(@class, 'c-events__item c-events__item_col')]");
			if (htmlDivisions.size() > 22){
				return;
			}
			// Не могу взять итератором нужный элемент, т.к
			// NoSurchElementException
			long bookmakerId = DaoFactory.getBookmakerDao().getByName("1xBet").getBookMakerId();
			for (Object object : htmlDivisions) {
				HtmlDivision division = (HtmlDivision) object;
				DomElement match = division.getFirstElementChild();
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

				String time = getDate(events_time);

				ArrayList<String> names = getName(events_name);

				bean = getCoefficients(c_bets, bean);

				bean.setDateStr(time);
				if (names.get(0).contains("Хозяева") || names.get(1).contains("Гости")) {
					continue;
				} else {
					bean.setTeam1(names.get(0));
					bean.setTeam2(names.get(1));
				}
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
				bean.setBookmakerId(bookmakerId);

				beans.add(bean);
			}
			switch (url) {
			case ENG:
				DaoFactory.getPremierLeagueDao().deleteMatchesList("Английская Примьер Лига", 1);
				DaoFactory.getPremierLeagueDao().addMatchesList(beans);
				break;
			case RUS:
				DaoFactory.getPremierLeagueDao().deleteMatchesList("Российская Примьер Лига", 1);
				DaoFactory.getPremierLeagueDao().addMatchesList(beans);
				break;
			case GER:
				DaoFactory.getPremierLeagueDao().deleteMatchesList("Немецкая Бундеслига", 1);
				DaoFactory.getPremierLeagueDao().addMatchesList(beans);
				break;
			case ITA:
				DaoFactory.getPremierLeagueDao().deleteMatchesList("Итальянская серия А", 1);
				DaoFactory.getPremierLeagueDao().addMatchesList(beans);
				break;
			case ESP:
				DaoFactory.getPremierLeagueDao().deleteMatchesList("Испанская Ла Лига", 1);
				DaoFactory.getPremierLeagueDao().addMatchesList(beans);
				break;
			case CL:
				DaoFactory.getPremierLeagueDao().deleteMatchesList("Лига Чемпионов", 1);
				DaoFactory.getPremierLeagueDao().addMatchesList(beans);
				break;
			case LE:
				DaoFactory.getPremierLeagueDao().deleteMatchesList("Лига Европы", 1);
				DaoFactory.getPremierLeagueDao().addMatchesList(beans);
				break;
			}
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
			if (!coeff.getTextContent().trim().equals("-")) {
				list.add((coeff.getTextContent().trim()));
			} else {
				list.add("0.0");
			}

		}
		return list;
	}

	private ArrayList<Double> getCoefficientForItem(DomElement element) {
		ArrayList<Double> mass = new ArrayList<>();
		for (DomElement coeff : element.getChildElements()) {
			System.out.println(coeff.getTextContent().trim().replace(",", "."));
			if (!coeff.getTextContent().trim().equals("-")) {
				mass.add(Double.parseDouble(coeff.getTextContent().trim().replace(",", ".")));
			} else {
				mass.add(0.0);
			}
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
