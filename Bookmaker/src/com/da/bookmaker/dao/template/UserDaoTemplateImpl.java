package com.da.bookmaker.dao.template;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.da.bookmaker.bean.UserBean;
import com.da.bookmaker.dao.DaoException;
import com.da.bookmaker.dao.UserDao;

public class UserDaoTemplateImpl implements UserDao {

	private final static String GHECK_USER = "SELECT LOGIN, PASSWORD FROM USERS WHERE LOGIN = ? AND PASSWORD = ?";

	private DataSource dataSource;

	public DataSource getDataSource() {
		return dataSource;
	}

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	public UserBean checkUser(String login, String password) throws DaoException {

		JdbcTemplate template = new JdbcTemplate(dataSource);

		List<UserBean> list = template.query(GHECK_USER, new UserRowMapper(), login, password);

		if (list.size() == 0) {
			return null;
		} else {
			return list.get(0);
		}
	}

	private class UserRowMapper implements RowMapper<UserBean> {
		// create inner class for rowMapper
		@Override
		public UserBean mapRow(ResultSet rs, int rowNum) throws SQLException {
			UserBean user = new UserBean();
			user.setPassword(rs.getString("PASSWORD"));
			user.setLogin(rs.getString("LOGIN"));
			return user;
		}

	}
}
