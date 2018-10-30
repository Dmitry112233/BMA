package com.da.bookmaker.sping.mvc;

import java.io.IOException;
import java.io.InputStream;
import java.text.ParseException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.da.bookmaker.bean.PremierLeagueBean;
import com.da.bookmaker.dao.DaoException;
import com.da.bookmaker.dao.DaoFactory;

@Controller
public class PremierLeagueController extends BookmakerController {

	private InputStream fis;
	static private Properties property;

	@RequestMapping("/{league}_матчи")
	public ModelAndView getMainList(@PathVariable("league") String league)
			throws DaoException, ParseException, IOException {
		Map<String, Object> map = new HashMap<>();
		Map<LocalDate, ArrayList<PremierLeagueBean>> map1 = DaoFactory.getPremierLeagueDao().getEventsListByDate(league);
		List<LocalDate> dates = new ArrayList<LocalDate>(map1.keySet());
		//getMatchesList(league);
		ModelAndView modelAndView = new ModelAndView("leagueMatches");
		//map.putAll(getBookmakerList());
		//map.put("leagueLower", league);
		//map.put("leagueTable", DaoFactory.getLeaguTableDao().getTableForLeague(league));
		modelAndView.addAllObjects(map);
		modelAndView.addAllObjects(getBookmakerList());
		modelAndView.addObject("mapMatch", map1);
		modelAndView.addObject("dates", dates);
		modelAndView.addObject("leagueLower", league);
		modelAndView.addObject("leagueTable", DaoFactory.getLeaguTableDao().getTableForLeague(league));
		try {
			if (property == null) {
				property = new Properties();
				fis = Thread.currentThread().getContextClassLoader().getResourceAsStream("copies.properties");
				property.load(fis);
			}
			switch (league) {
			case "английская премьер лига":
				modelAndView.addObject("League_T", property.get("ENG_League_T"));
				modelAndView.addObject("League_H1", property.get("ENG_League_H1"));
				modelAndView.addObject("League_D", property.get("ENG_League_D"));
				modelAndView.addObject("League_Txt", property.get("ENG_League_Txt"));
				break;
			case "испанская ла лига":
				modelAndView.addObject("League_T", property.get("SPA_League_T"));
				modelAndView.addObject("League_H1", property.get("SPA_League_H1"));
				modelAndView.addObject("League_D", property.get("SPA_League_D"));
				modelAndView.addObject("League_Txt", property.get("SPA_League_Txt"));
				break;
			case "российская премьер лига":
				modelAndView.addObject("League_T", property.get("RUS_League_T"));
				modelAndView.addObject("League_H1", property.get("RUS_League_H1"));
				modelAndView.addObject("League_D", property.get("RUS_League_D"));
				modelAndView.addObject("League_Txt", property.get("RUS_League_Txt"));
				break;
			case "немецкая бундеслига":
				modelAndView.addObject("League_T", property.get("GER_League_T"));
				modelAndView.addObject("League_H1", property.get("GER_League_H1"));
				modelAndView.addObject("League_D", property.get("GER_League_D"));
				modelAndView.addObject("League_Txt", property.get("GER_League_Txt"));
				break;
			case "итальянская серия а":
				modelAndView.addObject("League_T", property.get("ITA_League_T"));
				modelAndView.addObject("League_H1", property.get("ITA_League_H1"));
				modelAndView.addObject("League_D", property.get("ITA_League_D"));
				modelAndView.addObject("League_Txt", property.get("ITA_League_Txt"));
				break;
			}
		} catch (IOException e) {
			System.err.println("Файл отсутствует");
		} finally {
			if (fis != null) {
				fis.close();
			}
		}
		return modelAndView;
	}

	private Map<LocalDate, ArrayList<PremierLeagueBean>> getMatchesList(String leagueName)
			throws DaoException, ParseException {
		Map<LocalDate, ArrayList<PremierLeagueBean>> map = DaoFactory.getPremierLeagueDao().getEventsListByDate(leagueName);
		List<LocalDate> dates = new ArrayList<LocalDate>(map.keySet());
		System.out.println(dates.size());
		for (LocalDate date : dates) {
			System.out.println(date);
			for (PremierLeagueBean bean : map.get(date)) {
				if (date.compareTo(bean.getDateTimeStamp().toLocalDateTime().toLocalDate()) == 0) {
					System.out.println(bean.getTeam1() + " " + bean.getTeam2());
				}
			}
		}
		return map;
	}
}
