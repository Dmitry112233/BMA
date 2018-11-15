package com.da.bookmaker.sping.mvc;

import java.io.IOException;
import java.io.InputStream;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.da.bookmaker.bean.PremierLeagueBean;
import com.da.bookmaker.dao.DaoException;
import com.da.bookmaker.dao.DaoFactory;

@Controller
public class CompetitionsController extends BookmakerController {

	private InputStream fis;
	static private Properties property;

	@RequestMapping("/competitions")
	public ModelAndView getMainList() throws DaoException, IOException {
		Map<String, Object> map = new HashMap<>();
		map.putAll(getBookmakerList());
		map.put("eng_matches", setWildstatNames(DaoFactory.getPremierLeagueDao().getAllMatchesForLeague("Английская Премьер Лига")));
		map.put("spa_matches", setWildstatNames(DaoFactory.getPremierLeagueDao().getAllMatchesForLeague("Испанская Ла Лига")));
		map.put("ita_matches", setWildstatNames(DaoFactory.getPremierLeagueDao().getAllMatchesForLeague("Итальянская серия А")));
		map.put("rus_matches", setWildstatNames(DaoFactory.getPremierLeagueDao().getAllMatchesForLeague("Российская Премьер Лига")));
		map.put("ger_matches", setWildstatNames(DaoFactory.getPremierLeagueDao().getAllMatchesForLeague("Немецкая Бундеслига")));
		try {
			if (property == null) {
				property = new Properties();
				fis = Thread.currentThread().getContextClassLoader().getResourceAsStream("copies.properties");
				property.load(fis);
			}
			map.put("Competishions_T", property.getProperty("Competishions_T"));
			map.put("Competishions_H1", property.getProperty("Competishions_H1"));
			map.put("Competishions_D", property.getProperty("Competishions_D"));
			map.put("Competishions_Txt", property.getProperty("Competishions_Txt"));
		} catch (IOException e) {
			System.err.println("Файл отсутствует");
		} finally {
			if (fis != null) {
				fis.close();
			}
		}
		return new ModelAndView("allCompetitions", map);
	}

	private List<PremierLeagueBean> setWildstatNames(List<PremierLeagueBean> list) throws DaoException {
			for (PremierLeagueBean bean : list) {
				bean.setTeam1(DaoFactory.getMatchDetailsDao().getWildstatNameFromDictionary(bean.getTeam1()));
				bean.setTeam2(DaoFactory.getMatchDetailsDao().getWildstatNameFromDictionary(bean.getTeam2()));
			}
		return list;
	}
}
