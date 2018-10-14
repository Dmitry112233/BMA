package com.da.bookmaker.parser;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Properties;
import java.util.TimeZone;

import org.apache.log4j.Level;
import org.apache.log4j.Logger;

import com.da.bookmaker.bean.PremierLeagueBean;
import com.da.bookmaker.dao.DaoFactory;
import com.gargoylesoftware.htmlunit.BrowserVersion;
import com.gargoylesoftware.htmlunit.FailingHttpStatusCodeException;
import com.gargoylesoftware.htmlunit.WebClient;
import com.gargoylesoftware.htmlunit.html.DomElement;
import com.gargoylesoftware.htmlunit.html.HtmlDivision;
import com.gargoylesoftware.htmlunit.html.HtmlPage;

public class OneXbetParser extends AbstractParser {

	private File file = new File("D://xBetUrl.properties");
	private FileInputStream fis;
	static private Properties property;

	private static final Logger logger = Logger.getLogger(OneXbetParser.class);

	static {
		Logger.getLogger("com.gargoylesoftware.htmlunit").setLevel(Level.OFF);
		Logger.getLogger("org.apache.http.client.protocol").setLevel(Level.OFF);
	}

	public static void main(String[] args) throws Exception {
		new OneXbetParser().paresAllChamp();
	}

	public void paresAllChamp() throws Exception {
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
			urls.add(property.getProperty("GER"));
			urls.add(property.getProperty("ITA"));
			for (String url : urls) {
				parseOneXBet(url, property);
			}
		} catch (IOException e) {
			System.err.println("Файл xBetUrl не найден");
		} finally {
			if (fis != null) {
				fis.close();
			}
		}
	}

	private void parseOneXBet(String url, Properties property) throws Exception {
		WebClient webClient = new WebClient(BrowserVersion.CHROME);
		try {
			logger.info("1xBet start for url: " + url);
			webClient.getOptions().setThrowExceptionOnScriptError(false);
			System.setProperty("sun.security.ssl.allowUnsafeRenegotiation", "true");
			webClient.setUseInsecureSSL(true);
			HtmlPage page = (HtmlPage) webClient.getPage(url);
			List<PremierLeagueBean> beans = new ArrayList<>();
			List<?> htmlDivisions = page.getByXPath("//*[contains(@class, 'c-events__item c-events__item_col')]");

			long bookmakerId = DaoFactory.getBookmakerDao().getByName("1xBet").getBookMakerId();
			for (Object object : htmlDivisions) {

				HtmlDivision division = (HtmlDivision) object;

				DomElement c_events__item_game = division.getLastElementChild();

				Iterator<DomElement> matchChildren = c_events__item_game.getChildElements().iterator();

				DomElement c_events__subitem = matchChildren.next();

				Iterator<DomElement> subitemIterator = c_events__subitem.getChildElements().iterator();

				DomElement events_time = subitemIterator.next();

				subitemIterator.next();
				DomElement events_name = subitemIterator.next();

				DomElement c_bets = c_events__item_game.getLastElementChild();

				PremierLeagueBean bean = new PremierLeagueBean();
				String time = getDate(events_time);
				ArrayList<String> names = getName(events_name);
				bean = getCoefficients(c_bets, bean);
				bean.setDateStr(time);
				if (names.get(0).contains("голы") || names.get(0).contains("Хозяева") || names.get(1).contains("голы")
						|| names.get(1).contains("Гости")) {
					continue;
				} else {
					bean.setTeam1(names.get(0));
					bean.setTeam2(names.get(1));
				}
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
				bean.setBookmakerId(bookmakerId);
				beans.add(bean);
			}
			if (url.equals(property.getProperty("ENG"))) {
				DaoFactory.getPremierLeagueDao().deleteMatchesList("Английская Примьер Лига", 1);
				DaoFactory.getPremierLeagueDao().addMatchesList(beans);
				logger.info("1xBet saved for url: " + url);
			}
			if (url.equals(property.getProperty("RUS"))) {
				DaoFactory.getPremierLeagueDao().deleteMatchesList("Российская Примьер Лига", 1);
				DaoFactory.getPremierLeagueDao().addMatchesList(beans);
				logger.info("1xBet saved for url: " + url);
			}
			if (url.equals(property.getProperty("GER"))) {
				DaoFactory.getPremierLeagueDao().deleteMatchesList("Немецкая Бундеслига", 1);
				DaoFactory.getPremierLeagueDao().addMatchesList(beans);
				logger.info("1xBet saved for url: " + url);
			}
			if (url.equals(property.getProperty("ITA"))) {
				DaoFactory.getPremierLeagueDao().deleteMatchesList("Итальянская серия А", 1);
				DaoFactory.getPremierLeagueDao().addMatchesList(beans);
				logger.info("1xBet saved for url: " + url);
			}
			if (url.equals(property.getProperty("ESP"))) {
				DaoFactory.getPremierLeagueDao().deleteMatchesList("Испанская Ла Лига", 1);
				DaoFactory.getPremierLeagueDao().addMatchesList(beans);
				logger.info("1xBet saved for url: " + url);
			}
			if (url.equals(property.getProperty("CL"))) {
				DaoFactory.getPremierLeagueDao().deleteMatchesList("Лига Чемпионов", 1);
				DaoFactory.getPremierLeagueDao().addMatchesList(beans);
				logger.info("1xBet saved for url: " + url);
			}
			if (url.equals(property.getProperty("LE"))) {
				DaoFactory.getPremierLeagueDao().deleteMatchesList("Лига Европы", 1);
				DaoFactory.getPremierLeagueDao().addMatchesList(beans);
				logger.info("1xBet saved for url: " + url);
			}
			if (url.equals(property.getProperty("WC"))) {
				DaoFactory.getPremierLeagueDao().deleteMatchesList("Чемпионат Мира", 1);
				DaoFactory.getPremierLeagueDao().addMatchesList(beans);
				logger.info("1xBet saved for url: " + url);
			}
		} catch (FailingHttpStatusCodeException e) {
			System.err.println(url + " IS NOT FOUND");
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

	private String getDate(DomElement element) {
		String date = element.getFirstElementChild().getTextContent();
		String[] subStr;
		String delimeter = " ";
		subStr = date.split(delimeter);
		String[] hourAndMinutes = subStr[1].split(":");
		int hour = Integer.parseInt(hourAndMinutes[0]);
		hour += 3;
		date = subStr[0] + "." + getCurrentYear() + " " + hour + ":" + hourAndMinutes[1] + ":00";
		return date;
	}

	private int getCurrentYear() {
		Calendar calendar = Calendar.getInstance(TimeZone.getDefault(), Locale.getDefault());
		calendar.setTime(new Date());
		return calendar.get(Calendar.YEAR);
	}

	private ArrayList<String> getName(DomElement element) {
		ArrayList<String> names = new ArrayList<>();
		Iterator<DomElement> iterator = element.getFirstElementChild().getChildElements().iterator();
		String[] teamNames = iterator.next().getAttribute("title").split("—");
		names.add(teamNames[0].trim());
		names.add(teamNames[1].trim());
		return names;
	}
}