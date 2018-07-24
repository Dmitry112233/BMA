package com.da.bookmaker.parser;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;

import org.apache.log4j.Level;
import org.apache.log4j.Logger;

import com.da.bookmaker.bean.GroupBean;
import com.da.bookmaker.bean.LeagueTableBean;
import com.da.bookmaker.bean.MatchDetailsBean;
import com.da.bookmaker.dao.DaoFactory;
import com.gargoylesoftware.htmlunit.BrowserVersion;
import com.gargoylesoftware.htmlunit.WebClient;
import com.gargoylesoftware.htmlunit.html.DomElement;
import com.gargoylesoftware.htmlunit.html.HtmlPage;

public class WildstatParser {

	private static final Logger logger = Logger.getLogger(WildstatParser.class);

	private File file = new File("D://url.properties");
	private FileInputStream fis;
	static private Properties property;

	static {
		Logger.getLogger("com.gargoylesoftware.htmlunit").setLevel(Level.OFF);
		Logger.getLogger("org.apache.http.client.protocol").setLevel(Level.OFF);
	}

	public static void main(String[] args) throws Exception {

		new WildstatParser().parseLastSeasons();
	}

	public void parseWildstatAllChamp() throws Exception {
		try {
			if (property == null) {
				property = new Properties();
				fis = new FileInputStream(file);
				property.load(fis);
			}
			List<String> urls = new ArrayList<>();
		/*	urls.add(property.getProperty("APL_CURRENT"));
			urls.add(property.getProperty("CUP_16_17"));
			urls.add(property.getProperty("CUP_CURRENT"));
			urls.add(property.getProperty("FLC_16_17"));
			urls.add(property.getProperty("FLC_CURRENT"));
			urls.add(property.getProperty("CS_16"));
			urls.add(property.getProperty("CS_17"));
			urls.add(property.getProperty("ESP_16_17"));
			urls.add(property.getProperty("ESP_CURRENT"));
			urls.add(property.getProperty("ESP_SC_16"));
			urls.add(property.getProperty("ESP_SC_17"));
			urls.add(property.getProperty("EUR_CL_CURRENT"));
			urls.add(property.getProperty("EUR_EL_CURRENT"));
			urls.add(property.getProperty("EUR_CL_15_16"));
			urls.add(property.getProperty("RUS_CURRENT"));
			urls.add(property.getProperty("RUS_16_17"));
			urls.add(property.getProperty("RUS_CUP_CURRENT"));
			urls.add(property.getProperty("RUS_CUP_16_17"));
			urls.add(property.getProperty("RUS_SC_16"));
			urls.add(property.getProperty("RUS_SC_17"));
			urls.add(property.getProperty("GER_CURRENT"));
			urls.add(property.getProperty("GER_16_17"));
			urls.add(property.getProperty("GER_SC_16"));
			urls.add(property.getProperty("GER_SC_17"));
			urls.add(property.getProperty("ITA_CURRENT"));
			urls.add(property.getProperty("ITA_16_17"));
			urls.add(property.getProperty("ITA_SC_17"));
			urls.add(property.getProperty("ITA_SC_16"));*/
			
			urls.add(property.getProperty("WORLD_CHAMPIONSHIP_CURRENT"));
			urls.add(property.getProperty("WORLD_CHAMPIONSHIP_2014"));
			urls.add(property.getProperty("AFRIC_CHAMOIONSHIP"));
			urls.add(property.getProperty("AMERICAN_CHAMPIONSHIP"));
			urls.add(property.getProperty("EUROPE_CHAMPIONSHIP"));
			urls.add(property.getProperty("WORLD_CC"));
			urls.add(property.getProperty("WORLD_PO_QULIFY"));
			urls.add(property.getProperty("WORLD_OCE_QULIFY"));
			urls.add(property.getProperty("WORLD_ASI_QULIFY"));
			urls.add(property.getProperty("WORLD_AMC_QULIFY"));
			urls.add(property.getProperty("WORLD_AFR_QULIFY"));
			urls.add(property.getProperty("WORLD_AMS_QULIFY"));
			urls.add(property.getProperty("WORLD_EUR_QULIFY"));
			for (String url : urls) {
				WebClient webClient = new WebClient(BrowserVersion.CHROME);
				parseWildstat(url, webClient, property);
			}
		} catch (IOException e) {
			System.err.println("Файл свойств отсутствует!");
		}
	}

	public void parseLastSeasons() throws Exception {
		if (property == null) {
			property = new Properties();
			fis = new FileInputStream(file);
			property.load(fis);
		}
		try {
			List<String> urls = new ArrayList<>();
			urls.add(property.getProperty("APL_CURRENT"));
			// urls.add(property.getProperty("FLC_CURRENT"));
			// urls.add(property.getProperty("CUP_CURRENT"));
			// urls.add(property.getProperty("ESP_CURRENT"));
			//urls.add(property.getProperty("EUR_CL_CURRENT"));
			//urls.add(property.getProperty("EUR_EL_CURRENT"));
			//urls.add(property.getProperty("WORLD_CHAMPIONSHIP_CURRENT"));
			// urls.add(property.getProperty("RUS_CURRENT"));
			// urls.add(property.getProperty("RUS_CUP_CURRENT"));
			// urls.add(property.getProperty("GER_CURRENT"));
			// urls.add(property.getProperty("ITA_CURRENT"));
			for (String url : urls) {
				WebClient webClient = new WebClient(BrowserVersion.CHROME);
				parseWildstat(url, webClient, property);
			}
		} catch (IOException e) {
			System.err.println("Файл свойств отсуствует!");
		} finally {
			fis.close();
		}
	}

	public void parseWildstatLeagueTables() throws Exception {
		if (property == null) {
			property = new Properties();
			fis = new FileInputStream(file);
			property.load(fis);
		}
		try {
			List<String> urls = new ArrayList<>();
			urls.add(property.getProperty("APL_CURRENT"));
			urls.add(property.getProperty("ESP_CURRENT"));
			urls.add(property.getProperty("RUS_CURRENT"));
			urls.add(property.getProperty("GER_CURRENT"));
			urls.add(property.getProperty("ITA_CURRENT"));
			for (String url : urls) {
				WebClient webClient = new WebClient(BrowserVersion.CHROME);
				parseWildstatLeagueTable(url, webClient, property);
			}
		} catch (IOException e) {
			System.err.println("Файл свойств отсутствует!");
		} finally {
			fis.close();
		}
	}

	public void parseWildstatLeagueTable(String url, WebClient webClient, Properties property) throws Exception {
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
				if (url.equals(property.getProperty("APL_CURRENT"))) {
					bean.setLeague("Английская Примьер Лига");
					DaoFactory.getLeaguTableDao().deleteLeagueTables("Английская Примьер Лига");
				}
				if (url.equals(property.getProperty("ESP_CURRENT"))) {
					bean.setLeague("Испанская Ла Лига");
					DaoFactory.getLeaguTableDao().deleteLeagueTables("Испанская Ла Лига");
				}
				if (url.equals(property.getProperty("RUS_CURRENT"))) {
					bean.setLeague("Российская Примьер Лига");
					DaoFactory.getLeaguTableDao().deleteLeagueTables("Российская Примьер Лига");
				}
				if (url.equals(property.getProperty("GER_CURRENT"))) {
					bean.setLeague("Немецкая Бундеслига");
					DaoFactory.getLeaguTableDao().deleteLeagueTables("Немецкая Бундеслига");
				}
				if (url.equals(property.getProperty("ITA_CURRENT"))) {
					bean.setLeague("Итальянская серия А");
					DaoFactory.getLeaguTableDao().deleteLeagueTables("Итальянская серия А");
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
		place = place.substring(0, place.length() - 1);
		bean.setPlace(Integer.parseInt(place));
		bean.setTeam(
				iterator.next().getFirstElementChild().getFirstElementChild().getFirstElementChild().getTextContent());
		bean.setGames(iterator.next().getFirstElementChild().getTextContent());
		bean.setWin(iterator.next().getFirstElementChild().getTextContent());
		bean.setDraw(iterator.next().getFirstElementChild().getTextContent());
		bean.setLose(iterator.next().getFirstElementChild().getTextContent());
		bean.setGoals(iterator.next().getTextContent());
		bean.setPoints(iterator.next().getFirstElementChild().getTextContent());
		return bean;
	}

	public LeagueTableBean getStatForOthereTeams(DomElement element, LeagueTableBean bean) throws Exception {
		Iterator<DomElement> iterator = element.getChildElements().iterator();
		String place = iterator.next().getTextContent();
		place = place.substring(0, place.length() - 1);
		bean.setPlace(Integer.parseInt(place));
		bean.setTeam(iterator.next().getFirstElementChild().getTextContent());
		bean.setGames(iterator.next().getFirstElementChild().getTextContent());
		bean.setWin(iterator.next().getFirstElementChild().getTextContent());
		bean.setDraw(iterator.next().getFirstElementChild().getTextContent());
		bean.setLose(iterator.next().getFirstElementChild().getTextContent());
		bean.setGoals(iterator.next().getTextContent());
		bean.setPoints(iterator.next().getFirstElementChild().getTextContent());
		return bean;
	}

	public void parseGroups(String url, Properties property, HtmlPage page) throws Exception {
		List<?> tables = page.getByXPath("//table[@class='championship' and @cellpadding='3']");
		List<GroupBean> beans = new ArrayList<>();
		for (int i = 0; i < tables.size(); i++) {
			DomElement table = (DomElement) tables.get(i);
			for (DomElement tr : table.getFirstElementChild().getChildElements()) {
				if (tr.getFirstElementChild().getAttribute("align").equals("right")) {
					Iterator<DomElement> iterator = tr.getChildElements().iterator();
					DomElement tdPlace = iterator.next();
					iterator.next();
					DomElement tdTeam = iterator.next();
					DomElement tdGames = iterator.next();
					DomElement tdWin = iterator.next();
					DomElement tdDraw = iterator.next();
					DomElement tdLose = iterator.next();
					DomElement tdGoals = iterator.next();
					DomElement tdPoints = iterator.next();
					String alphabet = "ABCDEFGHIJKLMNOP";
					String groupName = Character.toString(alphabet.charAt(i));
					int place = Integer.parseInt(tdPlace.getTextContent().substring(0, 1));
					String team;
					if (place < 2) {
						team = tdTeam.getFirstElementChild().getFirstElementChild().getFirstElementChild()
								.getTextContent();
					} else {
						team = tdTeam.getFirstElementChild().getTextContent();
					}
					String games = tdGames.getFirstElementChild().getTextContent().trim();
					String wins = tdWin.getFirstElementChild().getTextContent().trim();
					String draw = tdDraw.getFirstElementChild().getTextContent().trim();
					String lose = tdLose.getFirstElementChild().getTextContent().trim();
					String goals = tdGoals.getTextContent().trim();
					String points = tdPoints.getFirstElementChild().getTextContent().trim();
					GroupBean bean = new GroupBean();
					bean.setDraw(draw);
					bean.setGames(games);
					bean.setGoal(goals);
					bean.setTeam(team);
					bean.setGroup(groupName);
					bean.setPlace(place);
					bean.setWins(wins);
					bean.setLose(lose);
					bean.setPoints(points);
					if (url.equals(property.getProperty("EUR_CL_CURRENT"))) {
						bean.setLeague("Лига Чемпионов");
					}
					if (url.equals(property.getProperty("WORLD_CHAMPIONSHIP_CURRENT"))){
						bean.setLeague("Чемпионат мира");
					} 
					beans.add(bean);
				}
			}
		}
		if (url.equals(property.getProperty("EUR_CL_CURRENT"))) {
			DaoFactory.getGroupDao().deleteGroups("Лига Чемпионов");
		}
		if (url.equals(property.getProperty("WORLD_CHAMPIONSHIP_CURRENT"))){
			DaoFactory.getGroupDao().deleteGroups("Чемпионат мира");
		} 
		DaoFactory.getGroupDao().addGroups(beans);
	}

	public void parseWildstat(String url, WebClient webClient, Properties property) throws Exception {

		logger.info("parseWildstat starts by url:" + url);
		try {
			webClient.getOptions().setThrowExceptionOnScriptError(false);
			System.setProperty("sun.security.ssl.allowUnsafeRenegotiation", "true");
			webClient.setUseInsecureSSL(true);
			HtmlPage page = (HtmlPage) webClient.getPage(url);
			if (url.equals(property.getProperty("EUR_CL_CURRENT"))) {
				parseGroups(url, property, page);
			}
			if (url.equals(property.getProperty("WORLD_CHAMPIONSHIP_CURRENT"))) {
				parseGroups(url, property, page);
			}
			List<?> tables = page.getByXPath("//table[@class='championship' and @cellpadding='0']");
			List<MatchDetailsBean> beans = new ArrayList<>();
			for (Object table : tables) {
				DomElement element = (DomElement) table;
				DomElement tbody = element.getFirstElementChild();
				for (DomElement tr : tbody.getChildElements()) {
					if (tr.getChildElementCount() > 3) {
						MatchDetailsBean bean = new MatchDetailsBean();
						List<Integer> resultList = getScore(tr);
						if (resultList == null) {
							continue;
						} else {
							bean.setDateStr(getDate(tr));
							bean.setTeam1(getTeam1(tr));
							bean.setTeam2(getTeam2(tr));
							if (resultList.size() > 0) {
								bean.setGoalsTeam1(resultList.get(0));
								bean.setGoalsTeam2(resultList.get(1));
							}
							if (resultList.size() > 2) {
								bean.setPenaltyTeam1(resultList.get(2));
								bean.setPenaltyTeam2(resultList.get(3));
							}
							beans.add(bean);
							if (url.equals(property.getProperty("APL_16_17"))
									|| url.equals(property.getProperty("APL_CURRENT"))) {
								bean.setChampionship("Английская Примьер Лига");
							}
							if (url.equals(property.getProperty("FLC_16_17"))
									|| url.equals(property.getProperty("FLC_CURRENT"))) {
								bean.setChampionship("Кубок Английской Лиги");
							}
							if (url.equals(property.getProperty("CUP_16_17"))
									|| url.equals(property.getProperty("CUP_CURRENT"))) {

								bean.setChampionship("Кубок Англии");
							}
							if (url.equals(property.getProperty("CS_16"))
									|| url.equals(property.getProperty("CS_17"))) {

								bean.setChampionship("Супер Кубок Англии");
							}
							if (url.equals(property.getProperty("ESP_16_17"))
									|| url.equals(property.getProperty("ESP_CURRENT"))) {

								bean.setChampionship("Испанская Ла Лига");
							}
							if (url.equals(property.getProperty("ESP_SC_16"))
									|| url.equals(property.getProperty("ESP_SC_17"))) {

								bean.setChampionship("Супер Кубок Испании");
							}
							if (url.equals(property.getProperty("EUR_CL_CURRENT"))
									|| url.equals(property.getProperty("EUR_CL_15_16"))) {

								bean.setChampionship("Лига Чемпионов");
							}
							if (url.equals(property.getProperty("EUR_EL_CURRENT"))) {

								bean.setChampionship("Лига Европы");
							}
							if (url.equals(property.getProperty("RUS_CURRENT"))
									|| url.equals(property.getProperty("RUS_16_17"))) {
								bean.setChampionship("Российская Примьер Лига");
							}
							if (url.equals(property.getProperty("GER_CURRENT"))
									|| url.equals(property.getProperty("GER_16_17"))) {
								bean.setChampionship("Немецкая Бундеслига");
							}
							if (url.equals(property.getProperty("ITA_CURRENT"))
									|| url.equals(property.getProperty("ITA_16_17"))) {
								bean.setChampionship("Итальянская серия А");
							}
							if (url.equals(property.getProperty("RUS_CUP_16_17"))
									|| url.equals(property.getProperty("RUS_CUP_CURRENT"))) {
								bean.setChampionship("Кубок России");
							}
							if (url.equals(property.getProperty("RUS_SC_16"))
									|| url.equals(property.getProperty("RUS_SC_17"))) {
								bean.setChampionship("Супер Кубок России");
							}
							if (url.equals(property.getProperty("GER_SC_16"))
									|| url.equals(property.getProperty("GER_SC_17"))) {
								bean.setChampionship("Супер Кубок Германии");
							}
							if (url.equals(property.getProperty("ITA_SC_17"))
									|| url.equals(property.getProperty("ITA_SC_16"))) {
								bean.setChampionship("Супер Кубок Италии");
							}
							if (url.equals(property.getProperty("WORLD_EUR_QULIFY")) || url.equals(property.getProperty("WORLD_AMS_QULIFY"))
									|| url.equals(property.getProperty("WORLD_AFR_QULIFY")) || url.equals(property.getProperty("WORLD_AMC_QULIFY"))
									|| url.equals(property.getProperty("WORLD_ASI_QULIFY")) || url.equals(property.getProperty("WORLD_OCE_QULIFY"))
									|| url.equals(property.getProperty("WORLD_PO_QULIFY"))){
								bean.setChampionship("Чемпионат Мира (Отборочный тур)");
							}
							if (url.equals(property.getProperty("WORLD_CC"))
									|| url.equals(property.getProperty(""))) {
								bean.setChampionship("Кубок Конфедераций");
							}
							if (url.equals(property.getProperty("EUROPE_CHAMPIONSHIP"))) {
								bean.setChampionship("Чемпионат Европы");
							}
							if (url.equals(property.getProperty("AMERICAN_CHAMPIONSHIP"))) {
								bean.setChampionship("Кубок Америки");
							}
							if (url.equals(property.getProperty("AFRIC_CHAMOIONSHIP"))) {
								bean.setChampionship("Кубок Африки");
							}
							if (url.equals(property.getProperty("WORLD_CHAMPIONSHIP_2014"))
									|| url.equals(property.getProperty("WORLD_CHAMPIONSHIP_CURRENT"))) {
								bean.setChampionship("Чемпионат мира");
							}
						}
					}
				}
			}
			logger.info("save to Data Base championship: " + url);
			if (url.equals(property.getProperty("APL_CURRENT"))) {
				DaoFactory.getMatchDetailsDao().deleteAllMatchesForLastSeason("Английская Примьер Лига",
						property.getProperty("DATE"));
			}
			if (url.equals(property.getProperty("ESP_CURRENT"))) {
				DaoFactory.getMatchDetailsDao().deleteAllMatchesForLastSeason("Испанская Ла Лига",
						property.getProperty("DATE"));
			}
			if (url.equals(property.getProperty("GER_CURRENT"))) {
				DaoFactory.getMatchDetailsDao().deleteAllMatchesForLastSeason("Немецкая Бундеслига",
						property.getProperty("DATE"));
			}
			if (url.equals(property.getProperty("ITA_CURRENT"))) {
				DaoFactory.getMatchDetailsDao().deleteAllMatchesForLastSeason("Итальянская серия А",
						property.getProperty("DATE"));
			}
			if (url.equals(property.getProperty("RUS_CUP_CURRENT"))) {
				DaoFactory.getMatchDetailsDao().deleteAllMatchesForLastSeason("Кубок России",
						property.getProperty("RUS_DATE"));
			}
			if (url.equals(property.getProperty("RUS_CURRENT"))) {
				DaoFactory.getMatchDetailsDao().deleteAllMatchesForLastSeason("Российская Примьер Лига",
						property.getProperty("RUS_DATE"));
			}
			if (url.equals(property.getProperty("CUP_CURRENT"))) {
				DaoFactory.getMatchDetailsDao().deleteAllMatchesForLastSeason("Кубок Англии",
						property.getProperty("DATE"));
			}
			if (url.equals(property.getProperty("FLC_CURRENT"))) {
				DaoFactory.getMatchDetailsDao().deleteAllMatchesForLastSeason("Кубок Английской Лиги",
						property.getProperty("DATE"));
			}
			if (url.equals(property.getProperty("EUR_CL_CURRENT"))) {
				DaoFactory.getMatchDetailsDao().deleteAllMatchesForLastSeason("Лига Чемпионов",
						property.getProperty("DATE"));
			}
			if (url.equals(property.getProperty("EUR_EL_CURRENT"))) {
				DaoFactory.getMatchDetailsDao().deleteAllMatchesForLastSeason("Лига Европы",
						property.getProperty("DATE"));
			}
			if (url.equals(property.getProperty("WORLD_CHAMPIONSHIP_CURRENT"))) {
				DaoFactory.getMatchDetailsDao().deleteAllMatchesForLastSeason("Чемпионат мира",
						property.getProperty("CM_DATE"));
			}
			DaoFactory.getMatchDetailsDao().addMatchesDetails(beans);
			System.out.println("ЕБАШИТ");
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

	public List<Integer> getScore(DomElement tr) {
		Iterator<DomElement> iterator = tr.getChildElements().iterator();
		iterator.next();
		iterator.next();
		iterator.next();
		iterator.next();
		iterator.next();
		iterator.next();
		iterator.next();
		DomElement td = iterator.next();
		List<Integer> resultList = new ArrayList<>();
		if (td.getFirstElementChild().getChildElementCount() < 1) {
			return null;
		} else {
			String result = td.getFirstElementChild().getFirstElementChild().getFirstElementChild().getTextContent()
					.trim();
			int goalsTeam1;
			int goalsTeam2;
			result = result.replaceAll("-", "+");
			if (!result.contains("+")) {
				goalsTeam1 = Integer.parseInt(result.split(":")[0].trim());
				goalsTeam2 = Integer.parseInt(result.split(":")[1].trim());
				resultList.add(goalsTeam1);
				resultList.add(goalsTeam2);
			}
			String penal = td.getFirstElementChild().getTextContent();
			int a = penal.lastIndexOf("пен.");
			if (a != -1) {
				penal = penal.substring(a);
				int penaltyTeam1 = Integer.parseInt(penal.split(":")[0].substring(penal.split(":")[0].length() - 1));
				int penaltyTeam2 = Integer.parseInt(penal.split(":")[1].trim());
				resultList.add(penaltyTeam1);
				resultList.add(penaltyTeam2);
			}
			return resultList;
		}
	}
}