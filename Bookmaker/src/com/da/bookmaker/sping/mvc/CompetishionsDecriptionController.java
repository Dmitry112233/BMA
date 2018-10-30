package com.da.bookmaker.sping.mvc;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.da.bookmaker.dao.DaoException;
import com.da.bookmaker.dao.DaoFactory;

@Controller
public class CompetishionsDecriptionController extends BookmakerController {

	private InputStream fis;
	static private Properties property;

	@RequestMapping("/{league}_описание")
	public ModelAndView getLeagueDescription(@PathVariable("league") String league) throws DaoException, IOException {
		Map<String, Object> map = new HashMap<>();
		try {
			if (property == null) {
				property = new Properties();
				fis = Thread.currentThread().getContextClassLoader()
						.getResourceAsStream("leagueDescription.properties");
				property.load(fis);
			}
			map.put("leagueTable", DaoFactory.getLeaguTableDao().getTableForLeague(league));
			map.put("league", getFirstLetteruppercase(league));
			map.put("leagueLower", league);
			map.putAll(getBookmakerList());
			switch (league) {
			case "английская премьер лига":
				map.put("league_Descr", property.getProperty("ENG"));
				map.put("league_D", property.getProperty("ENG_D"));
				map.put("league_H1", property.getProperty("ENG_H1"));
				map.put("league_T", property.getProperty("ENG_T"));
				break;
			case "испанская ла лига":
				map.put("league_Descr", property.getProperty("SPA"));
				map.put("league_D", property.getProperty("SPA_D"));
				map.put("league_H1", property.getProperty("SPA_H1"));
				map.put("league_T", property.getProperty("SPA_T"));
				break;
			case "российская премьер лига":
				map.put("league_Descr", property.getProperty("RUS"));
				map.put("league_D", property.getProperty("RUS_D"));
				map.put("league_H1", property.getProperty("RUS_H1"));
				map.put("league_T", property.getProperty("RUS_T"));
				break;
			case "немецкая бундеслига":
				map.put("league_Descr", property.getProperty("GER"));
				map.put("league_D", property.getProperty("GER_D"));
				map.put("league_H1", property.getProperty("GER_H1"));
				map.put("league_T", property.getProperty("GER_T"));
				break;
			case "итальянская серия а":
				map.put("league_Descr", property.getProperty("ITA"));
				map.put("league_D", property.getProperty("ITA_D"));
				map.put("league_H1", property.getProperty("ITA_H1"));
				map.put("league_T", property.getProperty("ITA_T"));
				break;
			}
		} catch (IOException e) {
			System.err.println("Файл отсутствует");
		} finally {
			if (fis != null) {
				fis.close();
			}
		}
		return new ModelAndView("leagueDescription", map);
	}

	private String getFirstLetteruppercase(String text) {
		String output = "";// все слова с заглавной буквы.
		String[] words = text.split(" ");// разделяем на массив из слов
		int i = 0;
		for (String word : words) {
			String first = word.substring(0, 1).toUpperCase();
			String all = word.substring(1);
			if (i == 0) {
				output += first + all;
			} else {
				output += " " + first + all;
			}
			i++;
		}
		return output;
	}
}
