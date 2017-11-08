package com.da.bookmaker.dao;

import java.util.List;

import com.da.bookmaker.bean.IventBean;

public interface IventDao {

	void addMyIvent(IventBean myIvent) throws DaoException;
	
	List<IventBean> getFootballEvents() throws DaoException;
	
	List<IventBean> getTennisEvents() throws DaoException;
	
	List<IventBean> getHockeyEvents() throws DaoException;
	
	List<IventBean> getBascketballEvents() throws DaoException;

	void linkMyIvent(IventBean myIvent) throws DaoException;
	
	void addIventsList(List<IventBean> ivents) throws DaoException;
	
	void deleteIventsList() throws DaoException;
}
