package com.da.bookmaker.parser;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.apache.log4j.Level;
import org.apache.log4j.Logger;
import org.w3c.dom.Node;

import com.da.bookmaker.bean.IventBean;
import com.da.bookmaker.dao.DaoFactory;
import com.gargoylesoftware.htmlunit.BrowserVersion;
import com.gargoylesoftware.htmlunit.WebClient;
import com.gargoylesoftware.htmlunit.html.DomElement;
import com.gargoylesoftware.htmlunit.html.HtmlPage;

public class BetFaqParser {

	static final private String URL = "https://betfaq.ru";
	
	private static final Logger logger = Logger.getLogger(BetFaqParser.class);
	
	static{
		Logger.getLogger("com.gargoylesoftware.htmlunit").setLevel(Level.OFF);
		Logger.getLogger("org.apache.http.client.protocol").setLevel(Level.OFF);
	}

	public void parseBetFaq() throws Exception {
		WebClient webClient = new WebClient(BrowserVersion.CHROME);
		
		logger.info("BetFaq parser starts...");
		try {
			webClient.getOptions().setThrowExceptionOnScriptError(false);
			HtmlPage page = (HtmlPage) webClient.getPage(URL);
			List<IventBean> beans = new ArrayList<>();		
			for (DomElement sport : page.getElementById("sticky").getChildElements()) {
				String sportName = null;
				if (!sport.getAttribute("class").equals("soccer") && !sport.getAttribute("class").equals("hockey")
						&& !sport.getAttribute("class").equals("tennis")
						&& !sport.getAttribute("class").equals("basketball")) {
					continue;
				}
				switch (sport.getAttribute("class")) {
				case "soccer":
					sportName = "футбол";
					break;
				case "hockey":                              
					sportName = "хоккей";
					break;
				case "tennis":
					sportName = "теннис";
					break;
				case "basketball":
					sportName = "баскетбол";
					break;
				}
				Iterator<DomElement> soccerChildren = sport.getChildElements().iterator();
				soccerChildren.next(); // follow-wrapper
				DomElement foreBets = soccerChildren.next(); // fore-bets

				DomElement tbody = foreBets.getFirstElementChild();
				for (DomElement tr : tbody.getChildElements()) {
					if (!tr.getAttribute("class").trim().equals("statistics")
							&& !tr.getAttribute("class").trim().equals("head")
							&& !tr.getAttribute("class").trim().equals("premium")
							&& !tr.getAttribute("class").trim().equals("locked-vip")
							&& !tr.getAttribute("class").trim().equals("foot")) {
						logger.info("Bean has created.");
						IventBean bean = new IventBean();
						Iterator<DomElement> tdChild = tr.getChildElements().iterator();
						tdChild.next(); // flag
						DomElement title = tdChild.next(); // title
						logger.info("Try to get Competision.");
						String competition = getCompetision(title);
						logger.info("Try to get Name.");
						String name = getName(title);
						logger.info("Try to get Coefficient.");
						double coefficient = getCoefficient(tdChild.next());
						String matchUrl = getMatchUrl(title);
						logger.info("Try parse match bet and description:" + matchUrl);
						parseMatch(matchUrl, bean);
						bean.setSport(sportName);
						bean.setName(name);
						bean.setCoefficient(coefficient);
						bean.setCompetition(competition);
						bean.setSource("https://betfaq.ru");
						bean.setDate(new Date());
						beans.add(bean);
						System.out.println(bean.getSport() + " " + bean.getName() + " " + bean.getCompetition() + " "
								+ bean.getCoefficient() + " " + bean.getDescription() + " " + bean.getBet() + " " + bean.getDateStr());
					}
				}
			}
			DaoFactory.getIventDao().deletBetFaqList();
			DaoFactory.getIventDao().addIventsList(beans);
			logger.info("Parser has finished.");
		} finally{
			webClient.closeAllWindows();
		}
	}

	private void parseMatch(String url, IventBean bean) throws Exception {
		WebClient webClient1 = new WebClient(BrowserVersion.CHROME);
		try {

			webClient1.getOptions().setThrowExceptionOnScriptError(false);
			HtmlPage page = (HtmlPage) webClient1.getPage(url);
			Iterator<DomElement> iterator = page.getElementById("content").getChildElements().iterator();
			DomElement item1 = iterator.next();
			item1 = iterator.next();
			item1 = iterator.next();
			item1 = iterator.next();
			item1 = iterator.next();
			DomElement grid10 = iterator.next(); // grid_10
			DomElement grayBg = grid10.getFirstElementChild();
			DomElement prognozSoccer = grayBg.getFirstElementChild();
			DomElement coeffSelector = prognozSoccer.getFirstElementChild();
			Iterator<DomElement> coeffSelectorChild = coeffSelector.getChildElements().iterator();
			coeffSelectorChild.next();
			coeffSelectorChild.next();
			coeffSelectorChild.next();
			coeffSelectorChild.next();
			String bet = coeffSelectorChild.next().getTextContent();
			bet = editBet(bet);
			bean.setBet(bet);
			Iterator<DomElement> iteratorDesc = prognozSoccer.getChildElements().iterator();
			iteratorDesc.next();
			iteratorDesc.next();
			iteratorDesc.next();
			DomElement descriptionElem = iteratorDesc.next();
			DomElement simpleTest = descriptionElem.getFirstElementChild();
			Iterator<DomElement> iteratorSimpleTest = simpleTest.getChildElements().iterator();
			iteratorSimpleTest.next();
			iteratorSimpleTest.next();
			iteratorSimpleTest.next();
			String description = iteratorSimpleTest.next().getTextContent();
			bean.setDescription(description);

		} finally {
			webClient1.closeAllWindows();
		}
	}

	private String editBet(String bet) {
		String editedBet = bet.substring(bet.indexOf(":") + 1, bet.indexOf(","));
		editedBet = editedBet.trim();
		return editedBet;
	}

	private String getMatchUrl(DomElement title) {
		Iterator<DomElement> iterator = title.getChildElements().iterator();
		iterator.next();
		DomElement aElement = iterator.next();
		String href = aElement.getAttribute("href");
		String url = URL + href;
		return url;
	}

	private double getCoefficient(DomElement coeff) {
		Iterator<DomElement> iterator = coeff.getChildElements().iterator();
		DomElement tagA = iterator.next();
		String coefficient = tagA.getTextContent().trim(); // нужен каст в int
		return Double.parseDouble(coefficient);
	}

	private String getName(DomElement title) {
		Iterator<DomElement> titleChild = title.getChildElements().iterator();
		titleChild.next();
		DomElement team = titleChild.next(); // teams
		Iterator<DomElement> teamChild = team.getChildElements().iterator();
		teamChild.next(); // time
		DomElement fore = teamChild.next(); // fore
		Node element = fore.getLastChild();
		return element.getTextContent();
	}

	private String getCompetision(DomElement title) {
		Iterator<DomElement> titleChild = title.getChildElements().iterator();
		DomElement small = titleChild.next();
		String competition = "";
		for (DomElement a : small.getChildElements()) {
			if (competition.length() != 0) {
				competition += "/";
			}
			competition += a.getTextContent();
		}
		return competition;
	}
}
