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

	static final private String ENG = "https://1xbet.com/by/line/Football/88637-England-Premier-League/";
	static final private String RUS = "https://1xbet.com/by/line/Football/225733-Russia-Premier-League/";
	
	static final private String ESP = "https://1xvix.top/line/Football/127733-Spain-Primera-Division/";
	static final private String ITA = "https://1xvix.top/line/Football/110163-Italy-Serie-A/";
	static final private String GER = "https://1xvix.top/line/Football/96463-Germany-Bundesliga/";
	static final private String CL = "https://1xvix.top/line/Football/118587-UEFA-Champions-League/";
	static final private String LE = "https://1xvix.top/line/Football/118593-UEFA-Europa-League/";
	static final private String WC = "https://1xvix.top/line/Football/1536237-FIFA-World-Cup-2018/";

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
			// Не могу взять итератором нужный элемент, т.к
			// NoSurchElementException
			long bookmakerId = DaoFactory.getBookmakerDao().getByName("1xBet").getBookMakerId();
			for (Object object : htmlDivisions) {
				HtmlDivision division = (HtmlDivision) object;
				DomElement c_events__item = division.getFirstElementChild();
				DomElement c_events__subitem = c_events__item.getFirstElementChild();
				Iterator<DomElement> matchChildren = c_events__subitem.getChildElements().iterator();
				DomElement events_time = matchChildren.next();
				matchChildren.next();
				DomElement events_name = matchChildren.next();
				DomElement c_bets = c_events__item.getLastElementChild();
				PremierLeagueBean bean = new PremierLeagueBean();
				String time = getDate(events_time);
				ArrayList<String> names = getName(events_name);
				bean = getCoefficients(c_bets, bean);
				bean.setDateStr(time);
				if (names.get(0).contains("голы") || names.get(1).contains("голы")) {
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
				case WC:
					bean.setLeague("Чемпионат Мира");
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
			case WC:
				System.out.println("ебашит");
				DaoFactory.getPremierLeagueDao().deleteMatchesList("Чемпионат Мира", 1);
				DaoFactory.getPremierLeagueDao().addMatchesList(beans);
				break;
			}
		} finally {
			webClient.closeAllWindows();
		}
	}

	private PremierLeagueBean getCoefficients(DomElement element, PremierLeagueBean bean) {
		Iterator<DomElement> iterator = element.getChildElements().iterator();
		String win1 = iterator.next().getTextContent().trim().replace(",", ".");
		String x = iterator.next().getTextContent().trim().replace(",", ".");
		String win2 = iterator.next().getTextContent().trim().replace(",", ".");
		String x1 = iterator.next().getTextContent().trim().replace(",", ".");
		String x12 = iterator.next().getTextContent().trim().replace(",", ".");
		String x2 = iterator.next().getTextContent().trim().replace(",", ".");
		String lessTotal = iterator.next().getTextContent().trim().replace(",", ".");
		String total = iterator.next().getTextContent().trim().replace(",", ".");
		String moreTotal = iterator.next().getTextContent().trim().replace(",", ".");
		String hand1 = iterator.next().getTextContent().trim().replace(",", ".");
		String hand = iterator.next().getTextContent().trim().replace(",", ".");
		String hand2 = iterator.next().getTextContent().trim().replace(",", ".");
		if (!win1.equals("-")) {
			bean.setWin1(Double.parseDouble(win1));
		} else {
			bean.setWin1(0.0);
		}
		if (!x.equals("-")) {
			bean.setX(Double.parseDouble(x));
		} else {
			bean.setX(0.0);
		}
		if (!win2.equals("-")) {
			bean.setWin2(Double.parseDouble(win2));
		} else {
			bean.setWin2(0.0);
		}
		if (!x1.equals("-")) {
			bean.setX1(Double.parseDouble(x1));
		} else {
			bean.setX1(0.0);
		}
		if (!x12.equals("-")) {
			bean.setX12(Double.parseDouble(x12));
		} else {
			bean.setX12(0.0);
		}
		if (!x2.equals("-")) {
			bean.setX2(Double.parseDouble(x2));
		} else {
			bean.setX2(0.0);
		}
		if (!lessTotal.equals("-")) {
			bean.setLessTotal(Double.parseDouble(lessTotal));
		} else {
			bean.setLessTotal(0.0);
		}
		if (!total.equals("-")) {
			bean.setTotal(Double.parseDouble(total));
		} else {
			bean.setTotal(0.0);
		}
		if (!moreTotal.equals("-")) {
			bean.setMoreTotal(Double.parseDouble(moreTotal));
		} else {
			bean.setMoreTotal(0.0);
		}
		if (!hand1.equals("-")) {
			bean.setHand1(Double.parseDouble(hand1));
		} else {
			bean.setHand1(0.0);
		}
		if (!hand.equals("-")) {
			bean.setHand(hand);
		} else {
			bean.setHand("0.0");
		}
		if (!hand2.equals("-")) {
			bean.setHand2(Double.parseDouble(hand2));
		} else {
			bean.setHand2(0.0);
		}
		return bean;
	}

	// неактуальный метод
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

	// неактуальный метод
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
		System.out.println(element.getAttribute("class"));
		ArrayList<String> names = new ArrayList<>();
		Iterator<DomElement> iterator = element.getFirstElementChild().getChildElements().iterator();
		String[] teamNames = iterator.next().getAttribute("title").split("—");
		names.add(teamNames[0].trim());
		names.add(teamNames[1].trim());
		return names;
	}
}
