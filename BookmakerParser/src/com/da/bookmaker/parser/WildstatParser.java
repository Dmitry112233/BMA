package com.da.bookmaker.parser;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.apache.log4j.Level;
import org.apache.log4j.Logger;

import com.da.bookmaker.bean.LeagueTableBean;
import com.da.bookmaker.bean.MatchDetailsBean;
import com.da.bookmaker.dao.DaoFactory;
import com.gargoylesoftware.htmlunit.BrowserVersion;
import com.gargoylesoftware.htmlunit.WebClient;
import com.gargoylesoftware.htmlunit.html.DomElement;
import com.gargoylesoftware.htmlunit.html.HtmlPage;

public class WildstatParser {

	private static final Logger logger = Logger.getLogger(WildstatParser.class);

	// Английская Примьер Лига
	private static final String URL_APL_16_17 = "http://wildstat.ru/p/2301/ch/ENG_1_2016_2017/stg/all/tour/all";
	private static final String URL_APL_17_18 = "http://wildstat.ru/p/2301/ch/ENG_1_2017_2018/stg/all/tour/all";
	// Кубок Английской Лиги:
	private static final String URL_FLC_16_17 = "http://wildstat.ru/p/2305/ch/ENG_FLC_2016_2017/stg/all/tour/all";
	private static final String URL_FLC_17_18 = "http://wildstat.ru/p/2305/ch/ENG_FLC_2017_2018/stg/all/tour/all";
	// Кубок Англии
	private static final String URL_CUP_16_17 = "http://wildstat.ru/p/2302/ch/ENG_CUP_2016_2017/stg/all/tour/all";
	private static final String URL_CUP_17_18 = "http://wildstat.ru/p/2302/ch/ENG_CUP_2017_2018/stg/all/tour/all";
	// Супер Кубок Англии
	private static final String URL_CS_16 = "http://wildstat.ru/p/2303/ch/ENG_CS_2016/stg/all/tour/all";
	private static final String URL_CS_17 = "http://wildstat.ru/p/2303/ch/ENG_CS_2017/stg/all/tour/all";
	// Испанская Ла Лига
	private static final String URL_ESP_16_17 = "http://wildstat.ru/p/2401/ch/ESP_1_2016_2017/stg/all/tour/all";
	private static final String URL_ESP_17_18 = "http://wildstat.ru/p/2401/ch/ESP_1_2017_2018/stg/all/tour/all";
	// Супер Кубок Испании
	private static final String URL_ESP_SC_16 = "http://wildstat.ru/p/2402/ch/ESP_SC_2016/stg/all/tour/all";
	private static final String URL_ESP_SC_17 = "http://wildstat.ru/p/2402/ch/ESP_SC_2017/stg/all/tour/all";

	// Лига Чемпионов:
	private static final String URL_EUR_CL_17_18 = "http://wildstat.ru/p/50/ch/EUR_CL_2017_2018/stg/all/tour/all";
	// Лига Европы
	private static final String URL_EUR_EL_17_18 = "http://wildstat.ru/p/51/ch/EUR_EL_2017_2018/stg/all/tour/all";

	static {
		Logger.getLogger("com.gargoylesoftware.htmlunit").setLevel(Level.OFF);
		Logger.getLogger("org.apache.http.client.protocol").setLevel(Level.OFF);
	}

	public static void main(String[] args) throws Exception {
		new WildstatParser().parseWildstatLeagueTables();
	}

	public void parseLastSeasons() throws Exception {
		List<String> urls = new ArrayList<>();
		urls.add(URL_APL_16_17);
		urls.add(URL_APL_17_18);
		urls.add(URL_CUP_17_18);
		urls.add(URL_FLC_17_18);
		urls.add(URL_ESP_17_18);
		urls.add(URL_EUR_CL_17_18);
		urls.add(URL_EUR_EL_17_18);
		for (String url : urls) {
			WebClient webClient = new WebClient(BrowserVersion.CHROME);
			parseWildstat(url, webClient);
		}
	}

	public void parseWildstatAllChamp() throws Exception {
		List<String> urls = new ArrayList<>();
		urls.add(URL_APL_16_17);
		urls.add(URL_APL_17_18);
		urls.add(URL_CUP_16_17);
		urls.add(URL_CUP_17_18);
		urls.add(URL_FLC_16_17);
		urls.add(URL_FLC_17_18);
		urls.add(URL_CS_16);
		urls.add(URL_CS_17);
		urls.add(URL_ESP_16_17);
		urls.add(URL_ESP_17_18);
		urls.add(URL_ESP_SC_16);
		urls.add(URL_ESP_SC_17);
		urls.add(URL_EUR_CL_17_18);
		urls.add(URL_EUR_EL_17_18);
		for (String url : urls) {
			WebClient webClient = new WebClient(BrowserVersion.CHROME);
			parseWildstat(url, webClient);
		}
	}

	public void parseWildstatLeagueTables() throws Exception {
		List<String> urls = new ArrayList<>();
		urls.add(URL_APL_17_18);
		urls.add(URL_ESP_17_18);
		for (String url : urls) {
			WebClient webClient = new WebClient(BrowserVersion.CHROME);
			parseWildstatLeagueTable(url, webClient);
		}
	}

	public void parseWildstatLeagueTable(String url, WebClient webClient) throws Exception {
		try {
			webClient.getOptions().setThrowExceptionOnScriptError(false);
			System.setProperty("sun.security.ssl.allowUnsafeRenegotiation", "true");
			webClient.setUseInsecureSSL(true);
			HtmlPage page = (HtmlPage) webClient.getPage(url);
			List<?> tables = page.getByXPath("//table[@class='championship' and @cellpadding='2']");
			DomElement table = (DomElement) tables.get(0);
			List<LeagueTableBean> beans = new ArrayList<>();
			int i = 0;
			for (DomElement element : table.getFirstElementChild().getChildElements()) {
				LeagueTableBean bean = new LeagueTableBean();
				switch (url) {
				case URL_APL_17_18:
					bean.setLeague("Английская Примьер Лига");
					break;
				case URL_ESP_17_18:
					bean.setLeague("Испанская Ла Лига");
					break;
				}
				if (element.getFirstElementChild().getAttribute("align").equals("right")
						&& element.getChildElementCount() > 5) {
					if (i < 3) {
						bean = getStatForFirstTeams(element, bean);
						i++;
					} else {
						bean = getStatForOthereTeams(element, bean);
						i++;
					}
					beans.add(bean);
				}
			}
			DaoFactory.getLeaguTableDao().addMatchesDetails(beans);
		} finally {
			webClient.closeAllWindows();
		}
	}

	public LeagueTableBean getStatForFirstTeams(DomElement element, LeagueTableBean bean) throws Exception {
		Iterator<DomElement> iterator = element.getChildElements().iterator();
		String place = iterator.next().getTextContent();
		place = place.substring(0, place.length()-1);
		bean.setPlace(Integer.parseInt(place));
		bean.setTeam(iterator.next().getFirstElementChild().getFirstElementChild().getFirstElementChild().getTextContent());
		bean.setGames(iterator.next().getFirstElementChild().getTextContent());
		bean.setWin(iterator.next().getFirstElementChild().getTextContent());
		bean.setDraw(iterator.next().getFirstElementChild().getTextContent());
		bean.setLose(iterator.next().getFirstElementChild().getTextContent());
		bean.setGoals(iterator.next().getTextContent());
		bean.setPoints(iterator.next().getFirstElementChild().getTextContent());
		System.out.println(bean.getPlace());
		return bean;
	}

	public LeagueTableBean getStatForOthereTeams(DomElement element, LeagueTableBean bean) throws Exception {
		Iterator<DomElement> iterator = element.getChildElements().iterator();
		String place = iterator.next().getTextContent();
		place = place.substring(0, place.length()-1);
		bean.setPlace(Integer.parseInt(place));
		bean.setTeam(iterator.next().getFirstElementChild().getTextContent());
		bean.setGames(iterator.next().getFirstElementChild().getTextContent());
		bean.setWin(iterator.next().getFirstElementChild().getTextContent());
		bean.setDraw(iterator.next().getFirstElementChild().getTextContent());
		bean.setLose(iterator.next().getFirstElementChild().getTextContent());
		bean.setGoals(iterator.next().getTextContent());
		bean.setPoints(iterator.next().getFirstElementChild().getTextContent());
		System.out.println(bean.getPlace());
		return bean;
	}

	public void parseWildstat(String url, WebClient webClient) throws Exception {
		logger.info("parseWildstat starts by url:" + url);
		try {
			webClient.getOptions().setThrowExceptionOnScriptError(false);
			System.setProperty("sun.security.ssl.allowUnsafeRenegotiation", "true");
			webClient.setUseInsecureSSL(true);
			HtmlPage page = (HtmlPage) webClient.getPage(url);
			List<?> tables = page.getByXPath("//table[@class='championship' and @cellpadding='0']");
			List<MatchDetailsBean> beans = new ArrayList<>();
			for (Object table : tables) {
				DomElement element = (DomElement) table;
				DomElement tbody = element.getFirstElementChild();
				for (DomElement tr : tbody.getChildElements()) {
					if (tr.getChildElementCount() > 3) {
						MatchDetailsBean bean = new MatchDetailsBean();
						if (getScore(tr).equals("")) {
							continue;
						} else {
							bean.setDateStr(getDate(tr));
							bean.setTeam1(getTeam1(tr));
							bean.setTeam2(getTeam2(tr));
							bean.setScore(getScore(tr));
							beans.add(bean);
							if (url.equals(URL_APL_16_17) || url.equals(URL_APL_17_18)) {
								bean.setChampionship("Английская Примьер Лига");
							}
							if (url.equals(URL_FLC_16_17) || url.equals(URL_FLC_17_18)) {
								bean.setChampionship("Кубок Английской Лиги");
							}
							if (url.equals(URL_CUP_16_17) || url.equals(URL_CUP_17_18)) {

								bean.setChampionship("Кубок Англии");
							}
							if (url.equals(URL_CS_16) || url.equals(URL_CS_17)) {

								bean.setChampionship("Супер Кубок Англии");
							}
							if (url.equals(URL_ESP_16_17) || url.equals(URL_ESP_17_18)) {

								bean.setChampionship("Испанская Ла Лига");
							}
							if (url.equals(URL_ESP_SC_16) || url.equals(URL_ESP_SC_17)) {

								bean.setChampionship("Супер Кубок Испании");
							}
							if (url.equals(URL_EUR_CL_17_18)) {

								bean.setChampionship("Лига Чемпионов");
							}
							if (url.equals(URL_EUR_EL_17_18)) {

								bean.setChampionship("Лига Европы");
							}
						}
					}
				}
			}
			logger.info("save to Data Base championship: " + url);
			DaoFactory.getMatchDetailsDao().addMatchesDetails(beans);
		} finally {
			webClient.closeAllWindows();
		}
	}

	public String getDate(DomElement tr) {
		Iterator<DomElement> iterator = tr.getChildElements().iterator();
		iterator.next();
		DomElement td = iterator.next();
		return td.getFirstElementChild().getTextContent();
	}

	public String getTeam1(DomElement tr) {
		Iterator<DomElement> iterator = tr.getChildElements().iterator();
		iterator.next();
		iterator.next();
		iterator.next();
		DomElement td = iterator.next();

		return td.getFirstElementChild().getTextContent().trim();
	}

	public String getTeam2(DomElement tr) {
		Iterator<DomElement> iterator = tr.getChildElements().iterator();
		iterator.next();
		iterator.next();
		iterator.next();
		iterator.next();
		iterator.next();
		DomElement td = iterator.next();
		return td.getFirstElementChild().getTextContent().trim();
	}

	public String getScore(DomElement tr) {
		Iterator<DomElement> iterator = tr.getChildElements().iterator();
		iterator.next();
		iterator.next();
		iterator.next();
		iterator.next();
		iterator.next();
		iterator.next();
		iterator.next();
		DomElement td = iterator.next();
		if (td.getFirstElementChild().getChildElementCount() < 1) {
			return "";
		} else {
			return td.getFirstElementChild().getFirstElementChild().getFirstElementChild().getTextContent().trim();
		}
	}
}