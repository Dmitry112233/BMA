package com.da.bookmaker.dao.template;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.support.GeneratedKeyHolder;

import com.da.bookmaker.bean.IventBean;
import com.da.bookmaker.dao.DaoException;
import com.da.bookmaker.dao.IventDao;

public class IventDaoTemplateImpl implements IventDao {

	private DataSource dataSource;

	private final static String INSERT_MY_IVENT = "INSERT INTO IVENTS (NAME, BET, DATE, COMPETITION, COEFFICIENT) VALUES (?,?,?,?,?)";

	private final static String LINK_MY_IVENT = "INSERT INTO EXPRESS_IVENT (IVENTS_ID, EXPRESSES_ID) "
			+ "(SELECT ?, ID FROM EXPRESSES WHERE SOURCE is NULL ORDER BY DATE DESC LIMIT 1)";
	

	public DataSource getDataSource() {
		return dataSource;
	}

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	@Override
	public void addMyIvent(IventBean myIvent) throws DaoException {
		JdbcTemplate template = new JdbcTemplate(dataSource);
		GeneratedKeyHolder holder = new GeneratedKeyHolder();
		template.update(new PreparedStatementCreator() {
			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				PreparedStatement statement = con.prepareStatement(INSERT_MY_IVENT,
						PreparedStatement.RETURN_GENERATED_KEYS);
				statement.setString(1, myIvent.getName());
				statement.setString(2, myIvent.getBet());
				statement.setDate(3, new Date(myIvent.getDate().getTime()));
				statement.setString(4, myIvent.getCompetition());
				statement.setDouble(5, myIvent.getCoefficient());
				return statement;
			}
		}, holder);
		myIvent.setIventID(Long.parseLong(holder.getKeys().get("GENERATED_KEY").toString()));
	}
	
	public void linkMyIvent(IventBean myIvent) throws DaoException {
		addMyIvent(myIvent);
		JdbcTemplate template = new JdbcTemplate(dataSource);
		GeneratedKeyHolder holder = new GeneratedKeyHolder();
		int count = template.update(new PreparedStatementCreator() {
			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				PreparedStatement statement = con.prepareStatement(LINK_MY_IVENT,
						PreparedStatement.RETURN_GENERATED_KEYS);
				statement.setLong(1, myIvent.getIventID());
				return statement;
			}
		}, holder);
		if (count == 0) {
			throw new DaoException("Link does not executed");
		}
	}

}
