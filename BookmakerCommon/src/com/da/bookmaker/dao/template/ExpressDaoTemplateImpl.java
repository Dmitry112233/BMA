package com.da.bookmaker.dao.template;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;

import com.da.bookmaker.bean.ExpressBean;
import com.da.bookmaker.bean.IventBean;
import com.da.bookmaker.dao.DaoException;
import com.da.bookmaker.dao.DaoFactory;
import com.da.bookmaker.dao.ExpressDao;

public class ExpressDaoTemplateImpl implements ExpressDao {

	private final static String GET_ALL_EXPRESSES = "SELECT DISTINCT E.DESCRIPTION EXPRESS_DESCRIPTION, E.ID EXPRESS_ID, E.NAME EXPRESS_NAME, "
			+ "I.DESCRIPTION IVENT_DESCRIPTION, I.COEFFICIENT IVENT_COEFFICIENT, BET, E.DATE EXPRESS_DATE, COMPETITION, I.ID IVENT_ID, I.NAME IVENT_NAME, "
			+ "I.DATE IVENT_DATE, SOURCE " + "FROM EXPRESSES E " + "JOIN EXPRESS_IVENT EI "
			+ "ON E.ID = EI.EXPRESSES_ID " + "JOIN IVENTS I " + "ON I.ID = EI.IVENTS_ID " + "WHERE SOURCE IS NOT NULL ORDER BY E.DATE DESC";

	private final static String GET_MY_EXPRESS = "SELECT DISTINCT E.DESCRIPTION EXPRESS_DESCRIPTION, E.ID EXPRESS_ID, E.NAME EXPRESS_NAME, "
			+ "I.DESCRIPTION IVENT_DESCRIPTION, I.COEFFICIENT IVENT_COEFFICIENT, BET, E.DATE EXPRESS_DATE, COMPETITION, I.ID IVENT_ID, I.NAME IVENT_NAME, "
			+ "I.DATE IVENT_DATE, SOURCE " + "FROM EXPRESSES E " + "JOIN EXPRESS_IVENT EI "
			+ "ON E.ID = EI.EXPRESSES_ID " + "JOIN IVENTS I " + "ON I.ID = EI.IVENTS_ID "
			+ "WHERE SOURCE IS NULL AND E.DATE <= CURRENT_DATE()" + "ORDER BY EXPRESS_DATE DESC LIMIT 1";

	private final static String INSERT_MY_EXPRESS = "INSERT INTO EXPRESSES (NAME, DATE, DESCRIPTION) VALUES (?,?,?)";

	private final static String INSERT_EXPRESSES_LIST = "INSERT INTO EXPRESSES (NAME, DATE, DESCRIPTION, SOURCE) VALUES (?,?,?,?)";

	private final static String LINKED_IVENT_LIST = "INSERT INTO EXPRESS_IVENT (IVENTS_ID, EXPRESSES_ID) VALUES (?,?)";

	private final static String DELETE_EXPRESSES_LIST = "DELETE FROM EXPRESSES WHERE SOURCE = ? ";
	
	private final static String DELETE_OLD_EXPRESS = "DELETE FROM EXPRESSES WHERE `DATE` <= (NOW() - INTERVAL 3 DAY) AND SOURCE = ? ";

	private final static String GET_EXPRESSES_BY_ID = "SELECT DISTINCT E.DESCRIPTION EXPRESS_DESCRIPTION, E.ID EXPRESS_ID, E.NAME EXPRESS_NAME, "
			+ "I.DESCRIPTION IVENT_DESCRIPTION, I.COEFFICIENT IVENT_COEFFICIENT, BET, E.DATE EXPRESS_DATE, COMPETITION, I.ID IVENT_ID, I.NAME IVENT_NAME, "
			+ "I.DATE IVENT_DATE, SOURCE " + "FROM EXPRESSES E " + "JOIN EXPRESS_IVENT EI "
			+ "ON E.ID = EI.EXPRESSES_ID " + "JOIN IVENTS I " + "ON I.ID = EI.IVENTS_ID " + "WHERE E.ID = ?";

	private final static String GET_EXPRESSES_FOR_PAGE = "SELECT DISTINCT E.DESCRIPTION EXPRESS_DESCRIPTION, E.ID EXPRESS_ID, E.NAME EXPRESS_NAME, "
			+ "I.DESCRIPTION IVENT_DESCRIPTION, I.COEFFICIENT IVENT_COEFFICIENT, BET, E.DATE EXPRESS_DATE, COMPETITION, I.ID IVENT_ID, I.NAME IVENT_NAME, "
			+ "I.DATE IVENT_DATE, SOURCE " + "FROM EXPRESSES E " + "JOIN EXPRESS_IVENT EI "
			+ "ON E.ID = EI.EXPRESSES_ID " + "JOIN IVENTS I " + "ON I.ID = EI.IVENTS_ID " + "WHERE SOURCE IS NOT NULL ORDER BY E.ID LIMIT ? OFFSET ?";
	
	
	private DataSource dataSource;

	public DataSource getDataSource() {
		return dataSource;
	}

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	public List<ExpressBean> getAllExpresses() {
		JdbcTemplate template = new JdbcTemplate(dataSource);
		List<ExpressBean> list = template.query(GET_ALL_EXPRESSES, new ExpressSetExecuter());
		list.removeAll(Collections.singleton(null));
		return list;
	}

	public ExpressBean getMyExpress() {
		JdbcTemplate template = new JdbcTemplate(dataSource);
		List<ExpressBean> list = template.query(GET_MY_EXPRESS, new ExpressSetExecuter());
		if (list.size() > 0) {
			return list.get(0);
		} else {
			return null;
		}
	}

	private class ExpressSetExecuter implements RowMapper<ExpressBean> {

		Map<Long, ExpressBean> map = new HashMap<>();

		@Override
		public ExpressBean mapRow(ResultSet rs, int rowNumber) throws SQLException {
			long expresId = rs.getLong("EXPRESS_ID");
			ExpressBean bean = map.get(expresId);
			if (bean == null) {
				bean = new ExpressBean();
				bean.setDate(rs.getDate("EXPRESS_DATE"));
				bean.setIventList(new ArrayList<>());
				bean.setName(rs.getString("EXPRESS_NAME"));
				bean.setSource(rs.getString("SOURCE"));
				bean.setDescription(rs.getString("EXPRESS_DESCRIPTION"));
				bean.getIventList().add(createIvent(rs));
				bean.setExpressID(expresId);
				map.put(expresId, bean);
				return bean;
			} else {
				bean.getIventList().add(createIvent(rs));
				return null; 
			}
		}

		private IventBean createIvent(ResultSet rs) throws SQLException {
			IventBean bean = new IventBean();
			bean.setBet(rs.getString("BET"));
			bean.setCompetition(rs.getString("COMPETITION"));
			bean.setDate(rs.getDate("IVENT_DATE"));
			bean.setDescription(rs.getString("IVENT_DESCRIPTION"));
			bean.setIventID(rs.getLong("IVENT_ID"));
			bean.setName(rs.getString("IVENT_NAME"));
			bean.setCoefficient(rs.getDouble("IVENT_COEFFICIENT"));
			return bean;
		}

	}

	@Override
	public void addMyExpress(ExpressBean myExpress) throws DaoException {
		JdbcTemplate template = new JdbcTemplate(dataSource);
		GeneratedKeyHolder holder = new GeneratedKeyHolder();
		template.update(new PreparedStatementCreator() {
			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				PreparedStatement statement = con.prepareStatement(INSERT_MY_EXPRESS,
						PreparedStatement.RETURN_GENERATED_KEYS);
				statement.setString(1, myExpress.getName());
				statement.setDate(2, new Date(myExpress.getDate().getTime()));
				statement.setString(3, myExpress.getDescription());
				return statement;
			}
		}, holder);
		myExpress.setExpressID(Long.parseLong(holder.getKeys().get("GENERATED_KEY").toString()));
	}

	@Override
	public void addExpressesList(List<ExpressBean> list) throws DaoException {
		for (ExpressBean express : list) {
			addExpress(express);
			DaoFactory.getIventDao().addIventsList(express.getIventList());
			linkExpressesWithIvents(express, express.getIventList());
		}
	}

	@Override
	public void deleteExpressesList(String url) throws DaoException {
		JdbcTemplate template = new JdbcTemplate(dataSource);
		template.update(DELETE_EXPRESSES_LIST, url);
	}

	private void addExpress(ExpressBean express) {
		JdbcTemplate template = new JdbcTemplate(dataSource);
		GeneratedKeyHolder holder = new GeneratedKeyHolder();
		template.update(new PreparedStatementCreator() {
			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				PreparedStatement statement = con.prepareStatement(INSERT_EXPRESSES_LIST,
						PreparedStatement.RETURN_GENERATED_KEYS);
				statement.setString(1, express.getName());
				statement.setDate(2, new Date(express.getDate().getTime()));
				statement.setString(3, express.getDescription());
				statement.setString(4, express.getSource());
				return statement;
			}
		}, holder);
		express.setExpressID(Long.parseLong(holder.getKeys().get("GENERATED_KEY").toString()));
	}

	private void linkExpressesWithIvents(ExpressBean express, List<IventBean> ivents) {
		JdbcTemplate template = new JdbcTemplate(dataSource);
		for (IventBean ivent : ivents) {
			GeneratedKeyHolder holder = new GeneratedKeyHolder();
			template.update(new PreparedStatementCreator() {
				@Override
				public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
					PreparedStatement statement = con.prepareStatement(LINKED_IVENT_LIST,
							PreparedStatement.RETURN_GENERATED_KEYS);
					statement.setDouble(1, ivent.getIventID());
					statement.setDouble(2, express.getExpressID());
					return statement;
				}
			}, holder);
		}
	}

	@Override
	public ExpressBean getExpressById(int id) throws DaoException {
		JdbcTemplate template = new JdbcTemplate(dataSource);
		List<ExpressBean> list = template.query(GET_EXPRESSES_BY_ID, new Object[] { id }, new ExpressSetExecuter());
		if (list.size() > 0) {
			return list.get(0);
		} else {
			return null;
		}
	}

	@Override
	public List<ExpressBean> getExpressesForPage(int limit, int offset) throws DaoException {
		JdbcTemplate template = new JdbcTemplate(dataSource);
		List<ExpressBean> list = template.query(GET_EXPRESSES_FOR_PAGE, new Object[] {limit, offset}, new ExpressSetExecuter());
		list.removeAll(Collections.singleton(null));
		return list;
	}

	@Override
	public void deleteOldExpresses(String url) throws DaoException {
		JdbcTemplate template = new JdbcTemplate(dataSource);
		template.update(DELETE_OLD_EXPRESS, url);	
	}
}
