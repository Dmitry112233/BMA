package com.da.bookmaker.dao;

import java.util.List;

import com.da.bookmaker.bean.ExpressBean;

public interface ExpressDao {

	List<ExpressBean> getAllExpresses() throws DaoException;
	
	ExpressBean getMyExpress() throws DaoException;
	
	void addMyExpress(ExpressBean myExpress) throws DaoException;
	
	void addExpressesList(List<ExpressBean> list) throws DaoException;
	
	void deleteExpressesList(String url) throws DaoException;
	
}
