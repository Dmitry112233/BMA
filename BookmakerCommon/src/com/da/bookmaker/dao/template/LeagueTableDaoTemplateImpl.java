package com.da.bookmaker.dao.template;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ParameterizedPreparedStatementSetter;
import org.springframework.jdbc.core.RowMapper;

import com.da.bookmaker.bean.LeagueTableBean;
import com.da.bookmaker.dao.DaoException;
import com.da.bookmaker.dao.LeagueTableDao;

public class LeagueTableDaoTemplateImpl implements LeagueTableDao {

	private DataSource dataSource;

	public DataSource getDataSource() {
		return dataSource;
	}

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	
	private static final String INSERT_TABLES = "INSERT INTO LEAGUES_TABLES (PLACE, TEAM, GAMES, WIN, DRAW, LOSE, GOALS, POINTS, LEAGUE) "
			+ "VALUES (?,?,?,?,?,?,?,?,?)";
	
	private static final String GET_TABLE_BY_LEAGUE = "SELECT PLACE, GAMES, WIN, DRAW, LOSE, GOALS, TEAM, POINTS"
			+ " FROM LEAGUES_TABLES WHERE LEAGUE = ? ORDER BY PLACE";
	
	private static final String DELETE_MATCH_DETAILS = "DELETE FROM LEAGUES_TABLES WHERE LEAGUE = ?";
	
	@Override
	public void addMatchesDetails(List<LeagueTableBean> beans) throws DaoException {
		JdbcTemplate template = new JdbcTemplate(dataSource);
		template.batchUpdate(INSERT_TABLES, beans, beans.size(),
				new ParameterizedPreparedStatementSetter<LeagueTableBean>() {
			@Override
			public void setValues(PreparedStatement statement, LeagueTableBean bean) throws SQLException {
				statement.setInt(1, bean.getPlace());
				statement.setString(2, bean.getTeam());
				statement.setString(3, bean.getGames());
				statement.setString(4, bean.getWin());
				statement.setString(5, bean.getDraw());
				statement.setString(6, bean.getLose());
				statement.setString(7, bean.getGoals());
				statement.setString(8, bean.getPoints());
				statement.setString(9, bean.getLeague());
			}
		});
	}

	@Override
	public List<LeagueTableBean> getTableForLeague(String leagueName) throws DaoException {
		JdbcTemplate template = new JdbcTemplate(dataSource);
		List<LeagueTableBean> beans = template.query(GET_TABLE_BY_LEAGUE, new Object[] {leagueName},
				new RowMapper<LeagueTableBean>() {
					@Override
					public LeagueTableBean mapRow(ResultSet rs, int rowNum) throws SQLException {
						LeagueTableBean bean = new LeagueTableBean();
						bean.setPlace(rs.getInt("PLACE"));
						bean.setTeam(rs.getString("TEAM"));
						bean.setGames(rs.getString("GAMES"));
						bean.setWin(rs.getString("WIN"));
						bean.setDraw(rs.getString("DRAW"));
						bean.setLose(rs.getString("LOSE"));
						bean.setGoals(rs.getString("GOALS"));
						bean.setPoints(rs.getString("POINTS"));
						return bean;
					}
				});
		return beans;
	}

	@Override
	public void deleteLeagueTables(String leagueName) throws DaoException {
		JdbcTemplate template = new JdbcTemplate(dataSource);
		template.update(DELETE_MATCH_DETAILS, new Object[] {leagueName});	
	}
}
