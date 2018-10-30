package com.da.bookmaker.dao;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.da.bookmaker.bean.PremierLeagueBean;

public interface PremierLeagueDao {

	void addMatchesList(List<PremierLeagueBean> ivents) throws DaoException;
	
	void deleteMatchesList(String leagueName, long bookmakerId) throws DaoException;
	
	List<PremierLeagueBean> getAllMatchesForLeague(String leagueName) throws DaoException;
	
	List<PremierLeagueBean> get1xBetCeffByTeams(String team1, String team2) throws DaoException;
	
	List<PremierLeagueBean> getLeonCeffByTeams(String team1, String team2) throws DaoException;
	
	List<PremierLeagueBean> getLigaCeffByTeams(String team1, String team2) throws DaoException;
	
	Map<LocalDate, ArrayList<PremierLeagueBean>> getEventsListByDate(String leagueName) throws DaoException;
}
