package com.da.bookmaker.sping.mvc;

import java.io.IOException;
import java.io.InputStream;
import java.text.ParseException;
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

	@RequestMapping("/{leagueName}_матчи")
	public ModelAndView getMainList(@PathVariable("leagueName") String leagueName)
			throws DaoException, ParseException, IOException {
		Map<String, Object> map = getMatchesList(leagueName);
		map.putAll(getBookmakerList());
		try {
			if (property == null) {
				property = new Properties();
				fis = Thread.currentThread().getContextClassLoader().getResourceAsStream("copies.properties");
				property.load(fis);
			}
			switch (leagueName) {
			case "английская премьер лига":
				map.put("League_T", property.get("ENG_League_T"));
				map.put("League_H1", property.get("ENG_League_H1"));
				map.put("League_D", property.get("ENG_League_D"));
				map.put("League_Txt", property.get("ENG_League_Txt"));
				break;
			case "испанская ла лига":
				map.put("League_T", property.get("SPA_League_T"));
				map.put("League_H1", property.get("SPA_League_H1"));
				map.put("League_D", property.get("SPA_League_D"));
				map.put("League_Txt", property.get("SPA_League_Txt"));
				break;
			case "российская премьер лига":
				map.put("League_T", property.get("RUS_League_T"));
				map.put("League_H1", property.get("RUS_League_H1"));
				map.put("League_D", property.get("RUS_League_D"));
				map.put("League_Txt", property.get("RUS_League_Txt"));
				break;
			case "немецкая бундеслига":
				map.put("League_T", property.get("GER_League_T"));
				map.put("League_H1", property.get("GER_League_H1"));
				map.put("League_D", property.get("GER_League_D"));
				map.put("League_Txt", property.get("GER_League_Txt"));
				break;
			case "итальянская серия а":
				map.put("League_T", property.get("ITA_League_T"));
				map.put("League_H1", property.get("ITA_League_H1"));
				map.put("League_D", property.get("ITA_League_D"));
				map.put("League_Txt", property.get("ITA_League_Txt"));
				break;
			}
		} catch (IOException e) {
			System.err.println("Файл отсутствует");
		} finally {
			if (fis != null) {
				fis.close();
			}
		}
		return new ModelAndView("league", map);
	}

	private Map<String, Object> getMatchesList(String leagueName) throws DaoException, ParseException {
		List<PremierLeagueBean> matchesList = DaoFactory.getPremierLeagueDao().getAllMatchesForLeague(leagueName);
		Map<String, Object> map = new HashMap<>();
		map.put("matchesList", matchesList);
		return map;
	}
}
