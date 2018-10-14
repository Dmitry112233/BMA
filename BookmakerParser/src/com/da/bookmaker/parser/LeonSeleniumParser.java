package com.da.bookmaker.parser;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
/*
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;*/

import com.da.bookmaker.bean.PremierLeagueBean;
import com.da.bookmaker.dao.DaoException;
import com.da.bookmaker.dao.DaoFactory;

public class LeonSeleniumParser {

	/*public static void main(String[] args) throws DaoException {
		new LeonSeleniumParser().parseLeon();
	}

	public void parseLeon() throws DaoException {
		String exePath = "D://exe/chromedriver_win32/chromedriver.exe";
		System.setProperty("webdriver.chrome.driver", exePath);
		WebDriver driver = new ChromeDriver();
		driver.get("https://www.leon.ru/events/prematch/1424967069597697/1424967080530205");
		List<WebElement> elementsName = driver.findElements(By.xpath(".//*[@ng-bind-html='event.htmlName']"));
		List<WebElement> elementsWin1 = driver
				.findElements(By.xpath(".//*[@value='event.market1x2.runnerHome.price']"));
		List<WebElement> elementsDraw = driver
				.findElements(By.xpath(".//*[@value='event.market1x2.runnerDraw.price']"));
		List<WebElement> elementsWin2 = driver
				.findElements(By.xpath(".//*[@value='event.market1x2.runnerAway.price']"));
		List<PremierLeagueBean> beans = new ArrayList<>();
		for (int i = 1; i < elementsName.size(); i++) {
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
		}
		DaoFactory.getPremierLeagueDao().deleteMatchesList("Английская Премьер Лига", 2);
		DaoFactory.getPremierLeagueDao().addMatchesList(beans);
	}*/
}
