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
		try {
			if (property == null) {
				property = new Properties();
				fis = Thread.currentThread().getContextClassLoader().getResourceAsStream("leagueDescription.properties");
				property.load(fis);
			}
			Map<String, Object> map = new HashMap<>();
			map.putAll(getBookmakerList());
			switch (league){
			case "Английская Примьер Лига" : map.put("league", property.getProperty("ENG"));
			break;
			case "Испанская Ла Лига": map.put("league", property.getProperty("SPA"));
			break;
			case "Российская Примьер Лига" : map.put("league", property.getProperty("RUS"));
			break;
			case "Немецкая Бундеслига" : map.put("league", property.getProperty("GER"));
			break;
			case "Итальянская серия А" : map.put("league", property.getProperty("ITA"));
			break;
			}
		} catch (IOException e) {
			System.err.println("Файл отсутствует");
		} finally {
			if (fis != null) {
				fis.close();
			}
		}
		return new ModelAndView("leagueDescriptionPage");
	}
}
