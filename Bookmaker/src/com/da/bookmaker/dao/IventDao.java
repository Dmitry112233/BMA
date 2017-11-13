package com.da.bookmaker.dao;

import java.util.List;
import java.util.Map;

import com.da.bookmaker.bean.IventBean;

public interface IventDao {

	void addMyIvent(IventBean myIvent) throws DaoException;
	
	Map<String, Object> getEvents() throws DaoException;

	void linkMyIvent(IventBean myIvent) throws DaoException;
	
	void addIventsList(List<IventBean> ivents) throws DaoException;
	
	void deleteIventsList() throws DaoException;
	
	void deletBetFaqList() throws DaoException;
}
