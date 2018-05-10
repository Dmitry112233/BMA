package com.da.bookmaker.sping.mvc;

import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.da.bookmaker.bean.PremierLeagueBean;
import com.da.bookmaker.dao.DaoException;
import com.da.bookmaker.dao.DaoFactory;

@Controller
public class PremierLeagueController extends BookmakerController{
	
	
	@RequestMapping("/PremierLeague_{leagueName}_List.spr")
	public ModelAndView getMainList(@PathVariable("leagueName") String leagueName) throws DaoException, ParseException {
		Map<String, Object> map = getMatchesList(leagueName);
		map.putAll(getBookmakerList());
		return new ModelAndView("league", map);
	}
	
	private Map<String, Object> getMatchesList(String leagueName) throws DaoException, ParseException{
		List<PremierLeagueBean> matchesList = DaoFactory.getPremierLeagueDao().getAllMatchesForLeague(leagueName);
		Map<String, Object> map = new HashMap<>();
		map.put("matchesList", matchesList);
		return map;
	}
}
