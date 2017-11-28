package com.da.bookmaker.dao;

import java.util.List;

import com.da.bookmaker.bean.NewsBean;

public interface NewsDao {

	List<NewsBean> getAllNews() throws DaoException;
	
	void addNewsList(List<NewsBean> newsList) throws DaoException;
	
	void deleteAllNews() throws DaoException;
	
}
