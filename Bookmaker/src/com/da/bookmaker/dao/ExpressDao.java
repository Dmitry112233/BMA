package com.da.bookmaker.dao;

import java.util.List;

import com.da.bookmaker.bean.ExpressBean;

public interface ExpressDao {

	List<ExpressBean> getAllExpresses() throws DaoException;
	ExpressBean getMyExpresses() throws DaoException;
}
