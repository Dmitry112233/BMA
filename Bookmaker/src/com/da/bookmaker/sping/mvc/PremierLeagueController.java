package com.da.bookmaker.sping.mvc;

import java.text.ParseException;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.da.bookmaker.bean.PremierLeagueBean;
import com.da.bookmaker.dao.DaoException;

@Controller
public class PremierLeagueController extends BookmakerController{
	
	@RequestMapping("/PremierLeagueList.spr")
	public ModelAndView getMainList() throws DaoException, ParseException {
		Map<String, Object> map = getMatchesList();
		map.putAll(getBookmakerList());
		return new ModelAndView("league", map);
	}
	
	private Map<String, Object> getMatchesList() throws DaoException, ParseException{
		PremierLeagueBean match1 = new PremierLeagueBean();
		PremierLeagueBean match2 = new PremierLeagueBean();
		match1.setTeam1("Арсенал");
		match1.setTeam2("Сток Сити");
		match1.setDateStr("17.03.2018 09:30");
		match2.setTeam1("Челси");
		match2.setTeam2("Ливерпуль");
		match2.setDateStr("17.03.2018 09:30");
		List<PremierLeagueBean> matchesList = new LinkedList<>();
		matchesList.add(match1);
		matchesList.add(match2);
		Map<String, Object> map = new HashMap<>();
		map.put("matchesList", matchesList);
		return map;
	}
}
