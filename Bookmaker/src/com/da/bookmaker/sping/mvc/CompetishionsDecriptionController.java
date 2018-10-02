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
				fis = Thread.currentThread().getContextClassLoader().getResourceAsStream("leagueDescription.properties");
				property.load(fis);
			}
			map.putAll(getBookmakerList());
			switch (league){
			case "Английская Примьер Лига" : map.put("league", property.getProperty("ENG"));
			map.put("league_D", property.getProperty("ENG_D"));
			map.put("league_H1", property.getProperty("ENG_H1"));
			map.put("league_T", property.getProperty("ENG_T"));
			break;
			case "Испанская Ла Лига": map.put("league", property.getProperty("SPA"));
			map.put("league_D", property.getProperty("SPA_D"));
			map.put("league_H1", property.getProperty("SPA_H1"));
			map.put("league_T", property.getProperty("SPA_T"));
			break;
			case "Российская Примьер Лига" : map.put("league", property.getProperty("RUS"));
			map.put("league_D", property.getProperty("RUS_D"));
			map.put("league_H1", property.getProperty("RUS_H1"));
			map.put("league_T", property.getProperty("RUS_T"));
			break;
			case "Немецкая Бундеслига" : map.put("league", property.getProperty("GER"));
			map.put("league_D", property.getProperty("GER_D"));
			map.put("league_H1", property.getProperty("GER_H1"));
			map.put("league_T", property.getProperty("GER_T"));
			break;
			case "Итальянская серия А" : map.put("league", property.getProperty("ITA"));
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
		return new ModelAndView("leagueDescriptionPage", map);
	}
}
