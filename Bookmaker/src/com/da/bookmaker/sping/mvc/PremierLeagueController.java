package com.da.bookmaker.sping.mvc;

import java.io.IOException;
import java.io.InputStream;
import java.nio.ByteBuffer;
import java.nio.charset.Charset;
import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.da.bookmaker.bean.PremierLeagueBean;
import com.da.bookmaker.dao.DaoException;
import com.da.bookmaker.dao.DaoFactory;

@Controller
public class PremierLeagueController extends BookmakerController {

	private InputStream fis;
	static private Properties property;
	
	@RequestMapping("/match_list")
	public ModelAndView getMatchList(@RequestParam("league") String league) throws DaoException, ParseException, IOException{
		league = new String(league.getBytes("iso-8859-1"), "UTF-8");
		Map<String, Object> map = getMatchesList(league); 
		System.out.println(league);
		map.putAll(getBookmakerList());
		try {
			if (property == null) {
				property = new Properties();
				fis = Thread.currentThread().getContextClassLoader().getResourceAsStream("copies.properties");
				property.load(fis);
			}
			switch(league){
				case "Английская Примьер Лига": 
					map.put("League_T", property.get("ENG_League_T"));
					map.put("League_H1", property.get("ENG_League_H1"));
					map.put("League_D", property.get("ENG_League_D"));
					map.put("League_Txt", property.get("ENG_League_Txt"));
					break;
					
				case "Испанская Ла Лига":
					map.put("League_T", property.get("SPA_League_T"));
					map.put("League_H1", property.get("SPA_League_H1"));
					map.put("League_D", property.get("SPA_League_D"));
					map.put("League_Txt", property.get("SPA_League_Txt"));
					break;
			
				case "Российская Примьер Лига" :
					map.put("League_T", property.get("RUS_League_T"));
					map.put("League_H1", property.get("RUS_League_H1"));
					map.put("League_D", property.get("RUS_League_D"));
					map.put("League_Txt", property.get("RUS_League_Txt"));
					break;
					
				case "Немецкая Бундеслига" :
					map.put("League_T", property.get("GER_League_T"));
					map.put("League_H1", property.get("GER_League_H1"));
					map.put("League_D", property.get("GER_League_D"));
					map.put("League_Txt", property.get("GER_League_Txt"));
					break;

				case "Итальянская серия А" :
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

	@RequestMapping("/PremierLeague_{leagueName}_List")
	public ModelAndView getMainList(@PathVariable("leagueName") String leagueName) throws DaoException, ParseException, IOException {
		Map<String, Object> map = getMatchesList(leagueName);
		map.putAll(getBookmakerList());
		try {
			if (property == null) {
				property = new Properties();
				fis = Thread.currentThread().getContextClassLoader().getResourceAsStream("copies.properties");
				property.load(fis);
			}
			if (leagueName.equals("Английская Примьер Лига")){
				map.put("League_T", property.get("ENG_League_T"));
				map.put("League_H1", property.get("ENG_League_H1"));
				map.put("League_D", property.get("ENG_League_D"));
				map.put("League_Txt", property.get("ENG_League_Txt"));
			}
			if (leagueName.equals("Испанская Ла Лига")){
				map.put("League_T", property.get("SPA_League_T"));
				map.put("League_H1", property.get("SPA_League_H1"));
				map.put("League_D", property.get("SPA_League_D"));
				map.put("League_Txt", property.get("SPA_League_Txt"));
			}
			if (leagueName.equals("Российская Примьер Лига")){
				map.put("League_T", property.get("RUS_League_T"));
				map.put("League_H1", property.get("RUS_League_H1"));
				map.put("League_D", property.get("RUS_League_D"));
				map.put("League_Txt", property.get("RUS_League_Txt"));
			}
			if (leagueName.equals("Немецкая Бундеслига")){
				map.put("League_T", property.get("GER_League_T"));
				map.put("League_H1", property.get("GER_League_H1"));
				map.put("League_D", property.get("GER_League_D"));
				map.put("League_Txt", property.get("GER_League_Txt"));
			}
			if (leagueName.equals("Итальянская серия А")){
				map.put("League_T", property.get("ITA_League_T"));
				map.put("League_H1", property.get("ITA_League_H1"));
				map.put("League_D", property.get("ITA_League_D"));
				map.put("League_Txt", property.get("ITA_League_Txt"));
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
