package com.da.bookmaker.dao;

import java.util.List;

import com.da.bookmaker.bean.BookmakerBean;

public interface BookmakerDao {

	List<BookmakerBean> getAllBookmakers() throws DaoException;
}
