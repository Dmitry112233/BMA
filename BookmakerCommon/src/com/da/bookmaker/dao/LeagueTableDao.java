package com.da.bookmaker.dao;

import java.util.List;

import com.da.bookmaker.bean.LeagueTableBean;

public interface LeagueTableDao {

	void addMatchesDetails(List<LeagueTableBean> beans) throws DaoException;
	
	List<LeagueTableBean> getTableForLeague(String leagueName) throws DaoException;
	
	void deleteLeagueTables(String leagueName) throws DaoException;
	
}
