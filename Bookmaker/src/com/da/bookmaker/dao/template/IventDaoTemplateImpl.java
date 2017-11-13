package com.da.bookmaker.dao.template;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;

import com.da.bookmaker.bean.IventBean;
import com.da.bookmaker.bean.NewsBean;
import com.da.bookmaker.dao.DaoException;
import com.da.bookmaker.dao.IventDao;

public class IventDaoTemplateImpl implements IventDao {

	private DataSource dataSource;

	private final static String INSERT_MY_IVENT = "INSERT INTO IVENTS (NAME, BET, DATE, COMPETITION, COEFFICIENT) VALUES (?,?,?,?,?)";

	private final static String LINK_MY_IVENT = "INSERT INTO EXPRESS_IVENT (IVENTS_ID, EXPRESSES_ID) "
			+ "(SELECT ?, ID FROM EXPRESSES WHERE SOURCE is NULL ORDER BY DATE DESC LIMIT 1)";

	private final static String INSERT_IVENTS_LIST = "INSERT INTO IVENTS (NAME, BET, COMPETITION, COEFFICIENT, SOURCE_IVENT, SPORT, DESCRIPTION, DATE) VALUES (?,?,?,?,?,?,?,?)";

	private final static String DELETE_IVENTS_LIST = "DELETE FROM IVENTS WHERE ID NOT IN (SELECT IVENTS_ID FROM EXPRESS_IVENT) AND SOURCE_IVENT <> 'https://betfaq.ru'";
	
	private final static String GET_EVENTS_LIST = "SELECT ID, NAME, BET, COMPETITION, COEFFICIENT, SOURCE_IVENT, SPORT, DESCRIPTION, DATE FROM IVENTS WHERE SOURCE_IVENT = 'https://betfaq.ru'";

	private final static String DELETE_BETFAQ_IVENTS = "DELETE FROM IVENTS WHERE SOURCE_IVENT = 'https://betfaq.ru'";
	
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

	@Override
	public void addIventsList(List<IventBean> ivents) throws DaoException {
		JdbcTemplate template = new JdbcTemplate(dataSource);
		GeneratedKeyHolder holder = new GeneratedKeyHolder();
		for (IventBean ivent : ivents) {
			template.update(new PreparedStatementCreator() {
				@Override
				public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
					PreparedStatement statement = con.prepareStatement(INSERT_IVENTS_LIST,
							PreparedStatement.RETURN_GENERATED_KEYS);
					statement.setString(1, ivent.getName());
					statement.setString(2, ivent.getBet());
					statement.setString(3, ivent.getCompetition());
					statement.setDouble(4, ivent.getCoefficient());
					statement.setString(5, ivent.getSource());
					statement.setString(6, ivent.getSport());
					statement.setString(7, ivent.getDescription());
					statement.setDate(8, new Date(ivent.getDate().getTime()));
					return statement;
				}
			}, holder);
			ivent.setIventID(Long.parseLong(holder.getKeys().get("GENERATED_KEY").toString()));
		}
	}

	@Override
	public void deleteIventsList() throws DaoException {
		JdbcTemplate template = new JdbcTemplate(dataSource);
		template.update(DELETE_IVENTS_LIST);
	}
	

	@Override
	public Map<String, Object> getEvents() throws DaoException {
		JdbcTemplate template = new JdbcTemplate(dataSource);
		Map<String, Object> result = new HashMap<>();
		
		template.query(GET_EVENTS_LIST, new RowMapper<IventBean>() {

			@Override
			public IventBean mapRow(ResultSet rs, int rowNum) throws SQLException {
				String sport = rs.getString("SPORT");
				List<IventBean> list = (List<IventBean>) result.get(sport);
				if(list == null){
					list = new ArrayList<>();
					result.put(sport, list);
				}
				IventBean bean = new IventBean();
				bean.setIventID(rs.getLong("ID"));
				bean.setCompetition(rs.getString("COMPETITION"));
				bean.setBet(rs.getString("BET"));
				bean.setName(rs.getString("NAME"));
				bean.setCoefficient(rs.getDouble("COEFFICIENT"));
				bean.setSource(rs.getString("SOURCE_IVENT"));
				bean.setSport(rs.getString("SPORT"));
				bean.setDescription(rs.getString("DESCRIPTION"));
				bean.setDate(rs.getDate("DATE"));
				list.add(bean);
				return bean;
			}
		});
		return result;
	}

	@Override
	public void deletBetFaqList() throws DaoException {
		JdbcTemplate template = new JdbcTemplate(dataSource);
		template.update(DELETE_BETFAQ_IVENTS);
	}
}
