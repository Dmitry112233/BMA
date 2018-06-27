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
import com.da.bookmaker.bean.LeagueTableBean;
import com.da.bookmaker.bean.MatchDetailsBean;
import com.da.bookmaker.bean.PremierLeagueBean;
import com.da.bookmaker.dao.DaoException;
import com.da.bookmaker.dao.DaoFactory;

@Controller
public class PremierLeagueDetailsController extends BookmakerController {
	@RequestMapping("PremierLeague_{team1}_{team2}_{league}_details.spr")
	public ModelAndView getMainList(@PathVariable("team1") String team1, @PathVariable("team2") String team2,
			@PathVariable("league") String league) throws DaoException, ParseException {
		Map<String, Object> map = get1xBetCeffByTeams(team1, team2);
		List<MatchDetailsBean> lastMatchesTeam1 = getMatchesDetailsTeam(team1);
		List<MatchDetailsBean> lastMatchesTeam2 = getMatchesDetailsTeam(team2);
		List<?> leagueTable = getLeagueTable(league);
		List<?> leonList = getLeonCeffByTeams(team1, team2);
		List<?> ligaList = getLigaCeffByTeams(team1, team2);

		Map<String, Object> lastMatchesTeam1Team2 = getMatchesDetailsTeam1Team2(team1, team2);
		
		String wildstatTeam1 = null;
		String wildstatTeam2 = null;
		List<GroupBean> groupListTeam1 = null;
		List<GroupBean> groupListTeam2 = null;
		if (DaoFactory.getMatchDetailsDao().getWildstatNameFromDictionary(team1) != null){
			wildstatTeam1 = DaoFactory.getMatchDetailsDao().getWildstatNameFromDictionary(team1);
		}
		
		if (DaoFactory.getMatchDetailsDao().getWildstatNameFromDictionary(team1) != null){
			wildstatTeam2 = DaoFactory.getMatchDetailsDao().getWildstatNameFromDictionary(team2);
		}
		
		if (league.equals("Лига Чемпионов") || league.equals("Чемпионат Мира")) {
			groupListTeam1 = getGroupForTeam(wildstatTeam1, league);
			groupListTeam2 = getGroupForTeam(wildstatTeam2, league);
			if (groupListTeam1.get(0).getGroup().equals(groupListTeam2.get(0).getGroup())) {
				groupListTeam2 = null;
			}
		}
		map.put("groupTeam1", groupListTeam1);
		map.put("groupTeam2", groupListTeam2);
		map.put("lastMatchesTeam1", lastMatchesTeam1);
		map.put("lastMatchesTeam2", lastMatchesTeam2);
		map.put("leagueTable", leagueTable);
		map.put("leonList", leonList);
		map.put("ligaList", ligaList);
		map.putAll(lastMatchesTeam1Team2);
		map.putAll(getBookmakerList());

		return new ModelAndView("details", map);
	}

	private List<GroupBean> getGroupForTeam(String team, String leagueName) throws DaoException, ParseException {
		List<GroupBean> groupList = DaoFactory.getGroupDao().getGroupsForLeague(leagueName, team);
		for (GroupBean group : groupList) {
			if (DaoFactory.getMatchDetailsDao().getTeamNameFromDictionary(group.getTeam()) != null) {
				group.setTeam(DaoFactory.getMatchDetailsDao().getTeamNameFromDictionary(group.getTeam()));
			}
		}
		return groupList;
	}

	private Map<String, Object> get1xBetCeffByTeams(String team1, String team2) throws DaoException, ParseException {
		List<PremierLeagueBean> xBetList = DaoFactory.getPremierLeagueDao().get1xBetCeffByTeams(team1, team2);
		Map<String, Object> map = new HashMap<>();
		map.put("xBetList", xBetList);
		return map;
	}

	private List<PremierLeagueBean> getLeonCeffByTeams(String team1, String team2) throws DaoException, ParseException {
		List<PremierLeagueBean> leonList = DaoFactory.getPremierLeagueDao().getLeonCeffByTeams(team1, team2);
		return leonList;
	}

	private List<PremierLeagueBean> getLigaCeffByTeams(String team1, String team2) throws DaoException, ParseException {
		List<PremierLeagueBean> ligaList = DaoFactory.getPremierLeagueDao().getLigaCeffByTeams(team1, team2);
		return ligaList;
	}

	private List<LeagueTableBean> getLeagueTable(String league) throws DaoException, ParseException {
		List<LeagueTableBean> list = DaoFactory.getLeaguTableDao().getTableForLeague(league);
		for (LeagueTableBean table : list) {
			if (DaoFactory.getMatchDetailsDao().getTeamNameFromDictionary(table.getTeam()) != null) {
				table.setTeam(DaoFactory.getMatchDetailsDao().getTeamNameFromDictionary(table.getTeam()));
			}
		}
		return list;
	}

	private List<MatchDetailsBean> getMatchesDetailsTeam(String team) throws DaoException, ParseException {
		List<MatchDetailsBean> list = DaoFactory.getMatchDetailsDao().getDetailsByTeam(team);
		for (MatchDetailsBean details : list) {
			if (DaoFactory.getMatchDetailsDao().getTeamNameFromDictionary(details.getTeam1()) != null) {
				details.setTeam1(DaoFactory.getMatchDetailsDao().getTeamNameFromDictionary(details.getTeam1()));
			}
			if (DaoFactory.getMatchDetailsDao().getTeamNameFromDictionary(details.getTeam2()) != null) {
				details.setTeam2(DaoFactory.getMatchDetailsDao().getTeamNameFromDictionary(details.getTeam2()));
			}
		}
		return list;
	}

	private Map<String, Object> getMatchesDetailsTeam1Team2(String team1, String team2)
			throws DaoException, ParseException {
		List<MatchDetailsBean> lastMatchesTeam1Team2 = DaoFactory.getMatchDetailsDao().getDetailsByTeams(team1, team2);
		for (MatchDetailsBean details : lastMatchesTeam1Team2) {
			details.setTeam1(DaoFactory.getMatchDetailsDao().getTeamNameFromDictionary(details.getTeam1()));
			details.setTeam2(DaoFactory.getMatchDetailsDao().getTeamNameFromDictionary(details.getTeam2()));
		}
		Map<String, Object> map = new HashMap<>();
		map.put("lastMatchesTeam1Team2", lastMatchesTeam1Team2);
		return map;
	}

}