package com.da.bookmaker.dao;

import java.util.List;

import com.da.bookmaker.bean.PremierLeagueBean;

public interface PremierLeagueDao {

	void addMatchesList(List<PremierLeagueBean> ivents) throws DaoException;
	
	void deleteMatchesList() throws DaoException;
	
	List<PremierLeagueBean> getAllMatchesForAPL() throws DaoException;
}
