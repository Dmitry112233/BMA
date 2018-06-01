package com.da.bookmaker.dao;

import java.util.List;

import com.da.bookmaker.bean.GroupBean;

public interface GroupDao {

    void addGroups(List<GroupBean> beans) throws DaoException;
	
	List<GroupBean> getGroupsForLeague(String leagueName, String teamName) throws DaoException;
	
	void deleteGroups(String leagueName) throws DaoException;
}
