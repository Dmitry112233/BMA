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
	  @RequestMapping("PremierLeague/{team1}/{team2}/details.spr")
	  public ModelAndView getMainList(@PathVariable("team1") String team1, @PathVariable("team2") String team2) throws DaoException, ParseException {
	    Map<String, Object> map = getMatchesList();
	    map.putAll(getBookmakerList());
	    return new ModelAndView("details", map);
	  }
	
	private Map<String, Object> getMatchesList() throws DaoException, ParseException{
		List<PremierLeagueBean> matchesList = DaoFactory.getPremierLeagueDao().getAllMatchesForAPL();
		Map<String, Object> map = new HashMap<>();
		map.put("matchesList", matchesList);
		return map;
	}
}