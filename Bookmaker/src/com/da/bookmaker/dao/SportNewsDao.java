package com.da.bookmaker.dao;

import java.util.List;

import com.da.bookmaker.bean.SportNewsBean;

public interface SportNewsDao {

	List<SportNewsBean> getAllSportNews() throws DaoException;

	void addSportNewsList(List<SportNewsBean> list) throws DaoException;

}
