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
public class PremierLeagueDetailsController extends BookmakerController{
	  @RequestMapping("PremierLeague_{team1}_{team2}_details.spr")
	  public ModelAndView getMainList(@PathVariable("team1") String team1, @PathVariable("team2") String team2) throws DaoException, ParseException {
		  System.out.println(team1);
		  System.out.println(team2);
	    Map<String, Object> map = getMatchesList(team1, team2);
	    map.putAll(getBookmakerList());
	    return new ModelAndView("details", map);
	  }
	
	private Map<String, Object> getMatchesList(String team1, String team2) throws DaoException, ParseException{
		List<PremierLeagueBean> ceffList = DaoFactory.getPremierLeagueDao().getMatchByTeams(team1, team2);
		Map<String, Object> map = new HashMap<>();
		map.put("ceffList", ceffList);
		return map;
	}
}