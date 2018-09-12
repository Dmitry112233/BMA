package com.da.bookmaker.dao;

import java.util.List;

import com.da.bookmaker.bean.ExpressBean;

public interface ExpressDao {

	List<ExpressBean> getAllExpresses() throws DaoException;
	
	ExpressBean getMyExpress() throws DaoException;
	
	void addMyExpress(ExpressBean myExpress) throws DaoException;
	
	void addExpressesList(List<ExpressBean> list) throws DaoException;
	
	void deleteExpressesList(String url) throws DaoException;
	
	ExpressBean getExpressById(int id) throws DaoException;
	
	List<ExpressBean> getExpressesForPage(int limit, int offset) throws DaoException;
	
	void updateLikeForExpress(int id, int count) throws DaoException;
	
}
