package com.da.bookmaker.dao;

import com.da.bookmaker.bean.UserBean;

public interface UserDao {

	public UserBean checkUser(String login, String password) throws DaoException;
}
