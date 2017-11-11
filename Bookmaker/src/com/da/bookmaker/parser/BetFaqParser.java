package com.da.bookmaker.parser;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.w3c.dom.Node;

import com.da.bookmaker.bean.IventBean;
import com.da.bookmaker.dao.DaoFactory;
import com.gargoylesoftware.htmlunit.BrowserVersion;
import com.gargoylesoftware.htmlunit.WebClient;
import com.gargoylesoftware.htmlunit.html.DomElement;
import com.gargoylesoftware.htmlunit.html.HtmlPage;

public class BetFaqParser {

	static final private String URL = "https://betfaq.ru";

	public static void main(String[] args) throws Exception {
		new BetFaqParser().parse();
	}

	public void parse() throws Exception {
		WebClient webClient = new WebClient(BrowserVersion.CHROME);
		try {
			webClient.getOptions().setThrowExceptionOnScriptError(false);
			HtmlPage page = (HtmlPage) webClient.getPage(URL);
			for (DomElement sport : page.getElementById("sticky").getChildElements()) {
				List<IventBean> beans = new ArrayList<>();
				String sportName = null;
				if (!sport.getAttribute("class").equals("soccer") && 
				!sport.getAttribute("class").equals("hockey") && 
                !sport.getAttribute("class").equals("tennis") && 
                !sport.getAttribute("class").equals("basketball")) 
                {
					continue;
				}
				if (sport.getAttribute("class").equals("soccer")) {
					sportName = "Футбол";
				}
				if (sport.getAttribute("class").equals("hockey")) {
					sportName = "Хоккей";
				}
                if(sport.getAttribute("class").equals("tennis")){
                	sportName = "Теннис";
				}
                if(sport.getAttribute("class").equals("basketball")){
                	sportName = "Баскетбол";
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
						IventBean bean = new IventBean();
						Iterator<DomElement> tdChild = tr.getChildElements().iterator();
						tdChild.next(); // flag
						DomElement title = tdChild.next(); // title
						String competition = getCompetision(title);
						String name = getName(title);
						double coefficient = getCoefficient(tdChild.next());
						System.out.println(name + " " + coefficient + " " + competition);
						String matchUrl = getMatchUrl(title);
						List<String> betAndDescription = parseMatch(matchUrl);
						bean.setSport(sportName);
						bean.setName(name);
						System.out.println(betAndDescription.get(0) + " " + betAndDescription.get(1));
						bean.setCoefficient(coefficient);
						bean.setCompetition(competition);
						bean.setBet(betAndDescription.get(0));
						bean.setDescription(betAndDescription.get(1));
						bean.setSource("betFaq");
						beans.add(bean);
					}
				}
				DaoFactory.getIventDao().addIventsList(beans);
			}
		} finally {
			webClient.closeAllWindows();
		}
	}

	private List<String> parseMatch(String url) throws Exception {
		WebClient webClient1 = new WebClient(BrowserVersion.CHROME);
		try {

			List<String> betAndDescription = new ArrayList<>();
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
			betAndDescription.add(bet);
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
			betAndDescription.add(description);

			return betAndDescription;

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
