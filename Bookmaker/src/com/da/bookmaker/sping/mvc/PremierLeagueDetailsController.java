package com.da.bookmaker.sping.mvc;

import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.da.bookmaker.bean.MatchDetailsBean;
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
	    Map<String, Object> lastMatchesTeam1 = getMatchesDetailsTeam1(team1);
	    Map<String, Object> lastMatchesTeam2 = getMatchesDetailsTeam2(team2);
	    Map<String, Object> lastMatchesTeam1Team2 = getMatchesDetailsTeam1Team2(team1, team2);
	    map.putAll(lastMatchesTeam1);
	    map.putAll(lastMatchesTeam2);
	    map.putAll(lastMatchesTeam1Team2);
	    map.putAll(getBookmakerList());

	    return new ModelAndView("details", map);
	  }
	
	private Map<String, Object> getMatchesList(String team1, String team2) throws DaoException, ParseException{
		List<PremierLeagueBean> ceffList = DaoFactory.getPremierLeagueDao().getMatchByTeams(team1, team2);
		Map<String, Object> map = new HashMap<>();
		map.put("ceffList", ceffList);
		return map;
	}
	
	private Map<String, Object> getMatchesDetailsTeam1(String team1) throws DaoException, ParseException{
		List<MatchDetailsBean> lastMatchesTeam1 = DaoFactory.getMatchDetailsDao().getDetailsByTeam(team1);
		Map<String, Object> map = new HashMap<>();
		map.put("lastMatchesTeam1", lastMatchesTeam1);
		return map;
	}
	
	private Map<String, Object> getMatchesDetailsTeam2(String team2) throws DaoException, ParseException{
		List<MatchDetailsBean> lastMatchesTeam2 = DaoFactory.getMatchDetailsDao().getDetailsByTeam(team2);
		Map<String, Object> map = new HashMap<>();
		map.put("lastMatchesTeam2", lastMatchesTeam2);
		return map;
	}
	
	private Map<String, Object> getMatchesDetailsTeam1Team2(String team1, String team2) throws DaoException, ParseException{
		List<MatchDetailsBean> lastMatchesTeam1Team2 = DaoFactory.getMatchDetailsDao().getDetailsByTeams(team1, team2);
		Map<String, Object> map = new HashMap<>();
		map.put("lastMatchesTeam2", lastMatchesTeam1Team2);
		return map;
	}
	
}