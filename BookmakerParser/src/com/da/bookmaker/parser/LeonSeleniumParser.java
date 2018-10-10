package com.da.bookmaker.parser;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import java.util.Properties;

import org.apache.log4j.Level;
import org.apache.log4j.Logger;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

import com.da.bookmaker.bean.PremierLeagueBean;
import com.da.bookmaker.dao.DaoException;
import com.da.bookmaker.dao.DaoFactory;

public class LeonSeleniumParser {

	private File file = new File("D://LeonUrl.properties");
	private FileInputStream fis;
	static private Properties property;

	private static final Logger logger = Logger.getLogger(LeonSeleniumParser.class);

	static {
		Logger.getLogger("com.gargoylesoftware.htmlunit").setLevel(Level.OFF);
		Logger.getLogger("org.apache.http.client.protocol").setLevel(Level.OFF);
	}

	public static void main(String[] args) throws Exception {
		new LeonSeleniumParser().parseAllLeonChamp();

	}

	public void parseAllLeonChamp() throws Exception {
		WebDriver driver = null;
		try {
			String exePath = "D://exe/chromedriver_win32/chromedriver.exe";
			System.setProperty("webdriver.chrome.driver", exePath);
			driver = new ChromeDriver();
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
				logger.info("Leon Parser start for: " + url);
				parseLeon(url, property, driver);
			}
		} catch (IOException e) {
			System.err.println("Файл xBetUrl не найден");
		} finally {
			if (fis != null) {
				fis.close();
			}
			if (driver != null) {
				driver.close();
			}
			logger.info("Leon Parser has finished");
		}
	}

	public void parseLeon(String url, Properties property, WebDriver driver) throws DaoException {
		try {
			driver.get(url);
			List<WebElement> elementsName = driver.findElements(By.xpath(".//*[@ng-bind-html='event.htmlName']"));
			List<WebElement> elementsWin1 = driver
					.findElements(By.xpath(".//*[@value='event.market1x2.runnerHome.price']"));
			List<WebElement> elementsDraw = driver
					.findElements(By.xpath(".//*[@value='event.market1x2.runnerDraw.price']"));
			List<WebElement> elementsWin2 = driver
					.findElements(By.xpath(".//*[@value='event.market1x2.runnerAway.price']"));
			List<PremierLeagueBean> beans = new ArrayList<>();
			for (int i = 0; i < elementsName.size(); i++) {
				PremierLeagueBean bean = new PremierLeagueBean();
				String teamNames = elementsName.get(i).getText();
				bean.setTeam1(teamNames.split("-")[0].trim());
				bean.setTeam2(teamNames.split("-")[1].trim());
				bean.setWin1(Double.parseDouble(elementsWin1.get(i).getText().trim()));
				bean.setWin2(Double.parseDouble(elementsWin2.get(i).getText().trim()));
				bean.setX(Double.parseDouble(elementsDraw.get(i).getText().trim()));
				bean.setBookmakerId(2);
				bean.setDate(new Date());
				beans.add(bean);
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
			}
			if (url.equals(property.getProperty("ENG"))) {
				DaoFactory.getPremierLeagueDao().deleteMatchesList("Английская Примьер Лига", 2);
				DaoFactory.getPremierLeagueDao().addMatchesList(beans);
				logger.info("Leon Parser saved for url: " + url);
			}
			if (url.equals(property.getProperty("RUS"))) {
				DaoFactory.getPremierLeagueDao().deleteMatchesList("Российская Примьер Лига", 2);
				DaoFactory.getPremierLeagueDao().addMatchesList(beans);
				logger.info("Leon Parser saved for url: " + url);
			}
			if (url.equals(property.getProperty("GER"))) {
				DaoFactory.getPremierLeagueDao().deleteMatchesList("Немецкая Бундеслига", 2);
				DaoFactory.getPremierLeagueDao().addMatchesList(beans);
				logger.info("Leon Parser saved for url: " + url);
			}
			if (url.equals(property.getProperty("ITA"))) {
				DaoFactory.getPremierLeagueDao().deleteMatchesList("Итальянская серия А", 2);
				DaoFactory.getPremierLeagueDao().addMatchesList(beans);
				logger.info("Leon Parser saved for url: " + url);
			}
			if (url.equals(property.getProperty("ESP"))) {
				DaoFactory.getPremierLeagueDao().deleteMatchesList("Испанская Ла Лига", 2);
				DaoFactory.getPremierLeagueDao().addMatchesList(beans);
				logger.info("Leon Parser saved for url: " + url);
			}
			if (url.equals(property.getProperty("CL"))) {
				DaoFactory.getPremierLeagueDao().deleteMatchesList("Лига Чемпионов", 2);
				DaoFactory.getPremierLeagueDao().addMatchesList(beans);
				logger.info("Leon Parser saved for url: " + url);
			}
			if (url.equals(property.getProperty("LE"))) {
				DaoFactory.getPremierLeagueDao().deleteMatchesList("Лига Европы", 2);
				DaoFactory.getPremierLeagueDao().addMatchesList(beans);
				logger.info("Leon Parser saved for url: " + url);
			}
			if (url.equals(property.getProperty("WC"))) {
				DaoFactory.getPremierLeagueDao().deleteMatchesList("Чемпионат Мира", 2);
				DaoFactory.getPremierLeagueDao().addMatchesList(beans);
				logger.info("Leon Parser saved for url: " + url);
			}
		} catch (Exception e) {
			logger.error("Тут парсер старт фор Рассея типо)");
		}
	}
}
