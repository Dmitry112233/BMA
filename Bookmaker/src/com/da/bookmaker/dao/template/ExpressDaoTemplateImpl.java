package com.da.bookmaker.dao.template;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.da.bookmaker.bean.ExpressBean;
import com.da.bookmaker.bean.IventBean;
import com.da.bookmaker.dao.ExpressDao;

public class ExpressDaoTemplateImpl implements ExpressDao {

	private final static String GET_ALL_EXPRESSES = "SELECT DISTINCT E.ID EXPRESS_ID, E.NAME EXPRESS_NAME, "
			+ "DESCRIPTION, BET, E.DATE EXPRESS_DATE, COMPETITION, I.ID IVENT_ID, I.NAME IVENT_NAME, "
			+ "I.DATE IVENT_DATE, SOURCE " + "FROM EXPRESSES E " + "JOIN EXPRESS_IVENT EI "
			+ "ON E.ID = EI.EXPRESSES_ID " + "JOIN IVENTS I " + "ON I.ID = EI.IVENTS_ID " + "WHERE SOURCE IS NOT NULL";

	private final static String GET_MY_EXPRESS = "SELECT DISTINCT E.ID EXPRESS_ID, E.NAME EXPRESS_NAME, "
			+ "DESCRIPTION, BET, E.DATE EXPRESS_DATE, COMPETITION, I.ID IVENT_ID, I.NAME IVENT_NAME, "
			+ "I.DATE IVENT_DATE, SOURCE " + "FROM EXPRESSES E " + "JOIN EXPRESS_IVENT EI "
			+ "ON E.ID = EI.EXPRESSES_ID " + "JOIN IVENTS I " + "ON I.ID = EI.IVENTS_ID " + "WHERE SOURCE IS NULL "
			+ "ORDER BY EXPRESS_DATE DESC";

	private DataSource dataSource;

	public DataSource getDataSource() {
		return dataSource;
	}

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	public List<ExpressBean> getAllExpresses() {
		JdbcTemplate template = new JdbcTemplate(dataSource);
		return template.query(GET_ALL_EXPRESSES, new ExpressSetExecuter());
	}

	public ExpressBean getMyExpresses() {
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
				bean.getIventList().add(createIvent(rs));
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
			bean.setDescription(rs.getString("DESCRIPTION"));
			bean.setIventID(rs.getLong("IVENT_ID"));
			bean.setName(rs.getString("IVENT_NAME"));
			return bean;
		}

	}

}
