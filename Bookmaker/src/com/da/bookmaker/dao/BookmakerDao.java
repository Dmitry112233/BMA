package com.da.bookmaker.dao;

import java.util.List;
import java.util.Map;

import com.da.bookmaker.bean.BookmakerBean;

public interface BookmakerDao {

	Map<String, BookmakerBean> getAllBookmakers() throws DaoException;

	BookmakerBean getByName(String string) throws DaoException;
}
