package com.da.bookmaker.dao.template;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ParameterizedPreparedStatementSetter;
import org.springframework.jdbc.core.RowMapper;

import com.da.bookmaker.bean.MatchDetailsBean;
import com.da.bookmaker.dao.DaoException;
import com.da.bookmaker.dao.MatchDetailsDao;

public class MatchDetailsDaoTemplateImpl implements MatchDetailsDao {

	private DataSource dataSource;

	public DataSource getDataSource() {
		return dataSource;
	}

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	private static final String GET_DETAILS_BY_TEAM = "SELECT TEAM1, TEAM2, DATE, SCORE, CHAMPIONSHIP FROM MATCH_DETAILS "
			+ "WHERE TEAM1 = ? OR TEAM2 = ? ORDER BY DATE DESC LIMIT 10";
	
	private static final String GET_DETAILS_BY_TEAM_SQL = "SELECT TEAM1, TEAM2, DATE, SCORE, CHAMPIONSHIP FROM MATCH_DETAILS md "
			+ "JOIN TEAM_DICTIONARY td1 "
			+ "ON td1.WILDSTAT_NAME = md.TEAM1 "
			+ "JOIN TEAM_DICTIONARY td2 "
			+ "ON td2.WILDSTAT_NAME = md.TEAM2 "
			+ "WHERE td1.XBET_NAME = ? OR td2.XBET_NAME = ? ORDER BY DATE DESC LIMIT 10";

	private static final String INSERT_MATCHES_DETAILS = "INSERT INTO MATCH_DETAILS (TEAM1, TEAM2, DATE, SCORE, CHAMPIONSHIP) "
			+ "VALUES (?,?,?,?,?)";

	private static final String GET_DETAILS_BY_TEAMS = "SELECT TEAM1, TEAM2, DATE, SCORE, CHAMPIONSHIP "
			+ "FROM MATCH_DETAILS "
			+ "WHERE TEAM1 = ? AND TEAM2 = ? OR TEAM1 = ? AND TEAM2 = ? ORDER BY DATE DESC LIMIT 10";
	
	private static final String GET_DETAILS_BY_TEAMS_SQL = "Select md.TEAM1, md.TEAM2, md.DATE, md.SCORE, md.CHAMPIONSHIP "
	+ "FROM MATCH_DETAILS md "
	+ "JOIN TEAM_DICTIONARY td1 "
    + "ON td1.WILDSTAT_NAME = md.TEAM1 "
    + "JOIN TEAM_DICTIONARY td2 " 
    + "ON td2.WILDSTAT_NAME = md.TEAM2 "
    + "WHERE (td1.XBET_NAME = ? AND td2.XBET_NAME = ?) "
    + "OR (td1.XBET_NAME = ? AND td2.XBET_NAME = ?)";

	private static final String GET_ALL_MATCHES = "SELECT TEAM1, TEAM2, DATE, SCORE, CHAMPIONSHIP FROM MATCH_DETAILS";

	private static final String GET_DICTIONARY_NAME = "SELECT WILDSTAT_NAME FROM TEAM_DICTIONARY WHERE XBET_NAME = ?";
	
	private static final String DELETE_MATCHES_FOR_LAST_SEASON = "DELETE FROM MATCH_DETAILS WHERE CHAMPIONSHIP = ? "
			+ "AND DATE >= ?";

	
	@Override
	public List<MatchDetailsBean> getDetailsByTeam(String team) throws DaoException {
		JdbcTemplate template = new JdbcTemplate(dataSource);
		List<MatchDetailsBean> beans = template.query(GET_DETAILS_BY_TEAM_SQL, new Object[] {team, team},
				new RowMapper<MatchDetailsBean>() {
					@Override
					public MatchDetailsBean mapRow(ResultSet rs, int rowNum) throws SQLException {
						MatchDetailsBean bean = new MatchDetailsBean();
						bean.setTeam1(rs.getString("TEAM1"));
						bean.setTeam2(rs.getString("TEAM2"));
						bean.setScore(rs.getString("SCORE"));
						bean.setDate(rs.getDate("DATE"));
						bean.setChampionship(rs.getString("CHAMPIONSHIP"));
						return bean;
					}
				});
		return beans;
	}

	@Override
	public void addMatchesDetails(List<MatchDetailsBean> details) throws DaoException {
		JdbcTemplate template = new JdbcTemplate(dataSource);
		template.batchUpdate(INSERT_MATCHES_DETAILS, details, details.size(),
				new ParameterizedPreparedStatementSetter<MatchDetailsBean>() {
					@Override
					public void setValues(PreparedStatement statement, MatchDetailsBean bean) throws SQLException {
						statement.setString(1, bean.getTeam1());
						statement.setString(2, bean.getTeam2());
						statement.setDate(3, new java.sql.Date(bean.getDate().getTime()));
						statement.setString(4, bean.getScore());
						statement.setString(5, bean.getChampionship());
					}
				});
	}
	
	@Override
	public List<MatchDetailsBean> getDetailsByTeams(String team1, String team2) throws DaoException {
		JdbcTemplate template = new JdbcTemplate(dataSource);
		List<MatchDetailsBean> beans = template.query(GET_DETAILS_BY_TEAMS_SQL, new Object[] { team1, team2, team2, team1 },
				new RowMapper<MatchDetailsBean>() {
					@Override
					public MatchDetailsBean mapRow(ResultSet rs, int rowNum) throws SQLException {
						MatchDetailsBean bean = new MatchDetailsBean();
						bean.setTeam1(rs.getString("TEAM1"));
						bean.setTeam2(rs.getString("TEAM2"));
						bean.setScore(rs.getString("SCORE"));
						bean.setDate(rs.getDate("DATE"));
						bean.setChampionship(rs.getString("CHAMPIONSHIP"));
						return bean;
					}
				});
		return beans;
	}

	@Override
	public List<MatchDetailsBean> getAllMAtchDetails() throws DaoException {
		JdbcTemplate template = new JdbcTemplate(dataSource);
		List<MatchDetailsBean> beans = template.query(GET_ALL_MATCHES, new RowMapper<MatchDetailsBean>() {
			@Override
			public MatchDetailsBean mapRow(ResultSet rs, int rowNum) throws SQLException {

				MatchDetailsBean bean = new MatchDetailsBean();
				bean.setTeam1(rs.getString("TEAM1"));
				bean.setTeam2(rs.getString("TEAM2"));
				bean.setScore(rs.getString("SCORE"));
				bean.setDate(rs.getDate("DATE"));
				bean.setChampionship(rs.getString("CHAMPIONSHIP"));
				return bean;
			}
		});
		return beans;
	}

	@Override
	public String getTeamNameFromDictionary(String name) throws DaoException {
		JdbcTemplate template = new JdbcTemplate(dataSource);
		List<String> nameList = template.query(GET_DICTIONARY_NAME, new Object[] {name}, new RowMapper<String>() {
			@Override
			public String mapRow(ResultSet rs, int rowNum) throws SQLException {
				String name = rs.getString("WILDSTAT_NAME");
				return name;
			}
		});
		return nameList.get(0);
	}

	@Override
	public void deleteAllMatchesForLastSeason(String leagueName, String date) throws DaoException {
		JdbcTemplate template = new JdbcTemplate(dataSource);
		template.update(DELETE_MATCHES_FOR_LAST_SEASON, new Object[] {leagueName, date});
	}
}