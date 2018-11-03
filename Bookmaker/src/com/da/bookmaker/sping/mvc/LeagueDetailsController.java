package com.da.bookmaker.sping.mvc;

import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.da.bookmaker.bean.GroupBean;
import com.da.bookmaker.bean.PremierLeagueBean;
import com.da.bookmaker.dao.DaoException;
import com.da.bookmaker.dao.DaoFactory;

@Controller
public class LeagueDetailsController extends BookmakerController {
	@RequestMapping("/{league}_{team1}_{team2}_детали")
	public ModelAndView getMainList(@PathVariable("team1") String team1, @PathVariable("team2") String team2,
			@PathVariable("league") String league) throws DaoException, ParseException {
		

		Map<String, Object> map = get1xBetCeffByTeams(team1, team2);
		map.put("leonList", DaoFactory.getPremierLeagueDao().getLeonCeffByTeams(team1, team2));
		map.put("lastMatchesTeam1Team2", DaoFactory.getMatchDetailsDao().getDetailsByTeams(team1, team2));
		map.put("ligaList", DaoFactory.getPremierLeagueDao().getLigaCeffByTeams(team1, team2));
		map.put("lastMatchesTeam1", DaoFactory.getMatchDetailsDao().getDetailsByTeam(team1));
		map.put("lastMatchesTeam2", DaoFactory.getMatchDetailsDao().getDetailsByTeam(team2));
		map.put("leagueTable", DaoFactory.getLeaguTableDao().getTableForLeague(league));
		map.put("team1", team1);
		map.put("team2", team1);
		map.putAll(getBookmakerList());
		map.put("leagueLower", league);		
		if (league.equals("лига чемпионов") || league.equals("чемпионат мира")) {
			getGroupForTeam(team1, team2, league, map);
		}
		return new ModelAndView("matchDetails", map);
	}

	private void getGroupForTeam(String team1, String team2, String leagueName, Map<String, Object> map) throws DaoException, ParseException {
		List<GroupBean> groupListTeam1 = DaoFactory.getGroupDao().getGroupsForLeague(leagueName, team1);
		List<GroupBean> groupListTeam2 = DaoFactory.getGroupDao().getGroupsForLeague(leagueName, team2);
		if (groupListTeam1.get(0).getGroup().equals(groupListTeam2.get(0).getGroup())) {
			groupListTeam2 = null;
		}
		map.put("groupTeam1", groupListTeam1);
		map.put("groupTeam2", groupListTeam2);
	}

	private Map<String, Object> get1xBetCeffByTeams(String team1, String team2) throws DaoException, ParseException {
		List<PremierLeagueBean> xBetList = DaoFactory.getPremierLeagueDao().get1xBetCeffByTeams(team1, team2);
		Map<String, Object> map = new HashMap<>();
		map.put("xBetList", xBetList);
		return map;
	}
}