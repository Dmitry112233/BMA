package com.da.bookmaker.parser;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.da.bookmaker.bean.IventBean;
import com.gargoylesoftware.htmlunit.BrowserVersion;
import com.gargoylesoftware.htmlunit.WebClient;
import com.gargoylesoftware.htmlunit.html.DomElement;
import com.gargoylesoftware.htmlunit.html.HtmlPage;

public class BetFaqParser {

	static final private String URL = "https://betfaq.ru";

	public static void main(String[] args) throws Exception {

		WebClient webClient = new WebClient(BrowserVersion.CHROME);
		try {

			webClient.getOptions().setThrowExceptionOnScriptError(false);
			HtmlPage page = (HtmlPage) webClient.getPage(URL);
			List<IventBean> beans = new ArrayList<>();

			for (DomElement sport : page.getElementById("sticky").getChildElements()) {
				if (sport.getAttribute("class").equals("soccer")) {
					Iterator<DomElement> soccerChildren = sport.getChildElements().iterator();
					soccerChildren.next(); // follow-wrapper
					DomElement foreBets = soccerChildren.next(); // fore-bets
					
                    DomElement tbody = foreBets.getFirstElementChild();
					for (DomElement tr : tbody.getChildElements()) {
						if (!tr.getAttribute("class").equals("statistics") && !tr.getAttribute("class").equals("head") && 
								!tr.getAttribute("class").equals("premium") && !tr.getAttribute("class").equals("locked-vip")
								&& !tr.getAttribute("class").equals("foot")){
							Iterator<DomElement> tdChild = tr.getChildElements().iterator();
							DomElement small = tdChild.next();
							for(DomElement a : small.getChildElements()){
								String country = a.getTextContent();
								System.out.println(country);
							}
							
						}

					}

				}
			}
		} finally {
			webClient.closeAllWindows();
		}
	}

}
