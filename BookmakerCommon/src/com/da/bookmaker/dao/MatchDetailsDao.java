package com.da.bookmaker.dao;

import java.util.List;

import com.da.bookmaker.bean.MatchDetailsBean;

public interface MatchDetailsDao {

	List<MatchDetailsBean> getDetailsByTeam(String team) throws DaoException;
	
	void addMatchesDetails(List<MatchDetailsBean> details) throws DaoException;
	
	List<MatchDetailsBean> getDetailsByTeams(String team1, String team2) throws DaoException; 
	 
	List<MatchDetailsBean> getAllMAtchDetails() throws DaoException;
	
	String getTeamNameFromDictionary(String name) throws DaoException;
}
