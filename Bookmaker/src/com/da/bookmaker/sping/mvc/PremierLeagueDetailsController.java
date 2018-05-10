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
public class PremierLeagueDetailsController extends BookmakerController {
	@RequestMapping("PremierLeague_{team1}_{team2}_{league}_details.spr")
	public ModelAndView getMainList(@PathVariable("team1") String team1, @PathVariable("team2") String team2,
			@PathVariable("league") String league) throws DaoException, ParseException {
		Map<String, Object> map = get1xBetCeffByTeams(team1, team2);
		List<?> lastMatchesTeam1 = getMatchesDetailsTeam(team1);
		List<?> lastMatchesTeam2 = getMatchesDetailsTeam(team2);
		List<?> leagueTable = getLeagueTable(league);
		List<?> leonList = getLeonCeffByTeams(team1, team2);
		List<?> ligaList = getLigaCeffByTeams(team1, team2);
		Map<String, Object> lastMatchesTeam1Team2 = getMatchesDetailsTeam1Team2(team1, team2);
		map.put("lastMatchesTeam1", lastMatchesTeam1);
		map.put("lastMatchesTeam2", lastMatchesTeam2);
		map.put("leagueTable", leagueTable);
		map.put("leonList", leonList);
		map.put("ligaList", ligaList);
		map.putAll(lastMatchesTeam1Team2);
		map.putAll(getBookmakerList());

		return new ModelAndView("details", map);
	}

	private Map<String, Object> get1xBetCeffByTeams(String team1, String team2) throws DaoException, ParseException {
		List<PremierLeagueBean> xBetList = DaoFactory.getPremierLeagueDao().get1xBetCeffByTeams(team1, team2);
		Map<String, Object> map = new HashMap<>();
		map.put("xBetList", xBetList);
		return map;
	}
	
	private List<PremierLeagueBean> getLeonCeffByTeams(String team1, String team2) throws DaoException, ParseException{
		List<PremierLeagueBean> leonList = DaoFactory.getPremierLeagueDao().getLeonCeffByTeams(team1, team2);
		return leonList;
	}
	
	private List<PremierLeagueBean> getLigaCeffByTeams(String team1, String team2) throws DaoException, ParseException{
		List<PremierLeagueBean> ligaList = DaoFactory.getPremierLeagueDao().getLigaCeffByTeams(team1, team2);
		return ligaList;
	}
	
	private List<?> getLeagueTable(String league) throws DaoException, ParseException {
		return DaoFactory.getLeaguTableDao().getTableForLeague(league);
	}

	private List<?> getMatchesDetailsTeam(String team) throws DaoException, ParseException {
		//String teamByWildstat = DaoFactory.getMatchDetailsDao().getTeamNameFromDictionary(team);
		return DaoFactory.getMatchDetailsDao().getDetailsByTeam(team);
	}

	private Map<String, Object> getMatchesDetailsTeam1Team2(String team1, String team2)
			throws DaoException, ParseException {
		//String team1ByWildstat = DaoFactory.getMatchDetailsDao().getTeamNameFromDictionary(team1);
		//String team2ByWildstat = DaoFactory.getMatchDetailsDao().getTeamNameFromDictionary(team2);

		List<MatchDetailsBean> lastMatchesTeam1Team2 = DaoFactory.getMatchDetailsDao()
				.getDetailsByTeams(team1, team2);
		Map<String, Object> map = new HashMap<>();
		map.put("lastMatchesTeam1Team2", lastMatchesTeam1Team2);
		return map;
	}

}