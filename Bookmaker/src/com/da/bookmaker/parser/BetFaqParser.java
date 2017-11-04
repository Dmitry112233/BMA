package com.da.bookmaker.parser;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.w3c.dom.Node;

import com.da.bookmaker.bean.IventBean;
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
			List<IventBean> beans = new ArrayList<>();

			
			for (DomElement sport : page.getElementById("sticky").getChildElements()) {
				if (!sport.getAttribute("class").equals("soccer")) {
					continue;
				}
				IventBean bean = new IventBean();
					Iterator<DomElement> soccerChildren = sport.getChildElements().iterator();
					soccerChildren.next(); // follow-wrapper
					DomElement foreBets = soccerChildren.next(); // fore-bets
					
                    DomElement tbody = foreBets.getFirstElementChild();
					for (DomElement tr : tbody.getChildElements()) {
						if (!tr.getAttribute("class").trim().equals("statistics") && 
								!tr.getAttribute("class").trim().equals("head") && 
								!tr.getAttribute("class").trim().equals("premium") && 
								!tr.getAttribute("class").trim().equals("locked-vip") && 
								!tr.getAttribute("class").trim().equals("foot")){
							Iterator<DomElement> tdChild = tr.getChildElements().iterator();
							tdChild.next(); // flag
							DomElement title = tdChild.next(); // title
							String competition = getCompetision(title);
							String name = getName(title);
							double coefficient = getCoefficient(tdChild.next());
							System.out.println(name + " " + coefficient + " " + competition);
							
							String matchUrl = getMatchUrl(title);
							
						}
					}
			}
		} finally {
			webClient.closeAllWindows();
		}
	}
	
	private void parseMatch(String url) throws Exception{
		WebClient webClient = new WebClient(BrowserVersion.CHROME);
		try {

			webClient.getOptions().setThrowExceptionOnScriptError(false);
			HtmlPage page = (HtmlPage) webClient.getPage(url);
			Iterator<DomElement> iterator = page.getElementById("content").getChildElements().iterator();
			iterator.next(); 
			iterator.next();
			iterator.next();
			iterator.next();
			DomElement grid10 = iterator.next(); // grid_10
			
			
		}finally {
			webClient.closeAllWindows();
		}
	}
	
	private String getMatchUrl(DomElement title){
		Iterator<DomElement> iterator = title.getChildElements().iterator();
		iterator.next();
		DomElement aElement = iterator.next();
		String href = aElement.getAttribute("href");
		String url = URL + href;		
		return url;
	}
	
	private double getCoefficient(DomElement coeff){
		Iterator<DomElement> iterator = coeff.getChildElements().iterator();
		DomElement tagA = iterator.next();
		String coefficient = tagA.getTextContent().trim(); // нужен каст в int
		return Double.parseDouble(coefficient);
	}
	
	private String getName(DomElement title){
		Iterator<DomElement> titleChild = title.getChildElements().iterator();
		titleChild.next();
		DomElement team = titleChild.next(); // teams
		Iterator<DomElement> teamChild = team.getChildElements().iterator();
		teamChild.next(); // time
		DomElement fore = teamChild.next(); //fore
		Node element = fore.getLastChild();
		return element.getTextContent();
	}
	
	private String getCompetision(DomElement title){
		Iterator<DomElement> titleChild = title.getChildElements().iterator();
		DomElement small = titleChild.next();
		String competition = "";
		for (DomElement a : small.getChildElements()){
			if (competition.length() != 0){
				competition += "/";
			}
			competition += a.getTextContent();
		}
		return competition;
	}
}
