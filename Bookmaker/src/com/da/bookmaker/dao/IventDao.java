package com.da.bookmaker.dao;

import com.da.bookmaker.bean.IventBean;

public interface IventDao {

	void addMyIvent(IventBean myIvent) throws DaoException;

	void linkMyIvent(IventBean myIvent) throws DaoException;
}
