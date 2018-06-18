package com.da.bookmaker.dao.template;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ParameterizedPreparedStatementSetter;
import org.springframework.jdbc.core.RowMapper;

import com.da.bookmaker.bean.GroupBean;
import com.da.bookmaker.dao.DaoException;
import com.da.bookmaker.dao.GroupDao;

public class GroupDaoTemplateImpl implements GroupDao{
	
	private DataSource dataSource;

	public DataSource getDataSource() {
		return dataSource;
	}

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	
	private static final String INSERT_GROUPS = "INSERT INTO GROUPS (PLACE, TEAM, GAMES, WINS, DRAW, LOSE, GOALS, POINTS, GROUP_NAME, LEAGUE) "
			+ " VALUES (?,?,?,?,?,?,?,?,?,?)";
	
	private static final String GET_GROUPS = 
			"SELECT G1.PLACE, G1.TEAM, G1.GAMES, G1.WINS, G1.DRAW, G1.LOSE, G1.GOALS, G1.POINTS, G1.GROUP_NAME, G1.LEAGUE"
			+ " FROM GROUPS G1 "
			+ " JOIN GROUPS G2"
			+ " ON G1.GROUP_NAME = G2.GROUP_NAME"
			+ " WHERE G1.LEAGUE = ? "
			+ " AND G2.TEAM = ? "
			+ " ORDER BY G1.PLACE";
	
	private static final String DELETE_GROUPS = "DELETE FROM GROUPS WHERE LEAGUE = ?";
	
	@Override
	public void addGroups(List<GroupBean> beans) throws DaoException {
		JdbcTemplate template = new JdbcTemplate(dataSource);
		template.batchUpdate(INSERT_GROUPS, beans, beans.size(),
				new ParameterizedPreparedStatementSetter<GroupBean>() {
			@Override
			public void setValues(PreparedStatement statement, GroupBean bean) throws SQLException {
				statement.setInt(1, bean.getPlace());
				statement.setString(2, bean.getTeam());
				statement.setString(3, bean.getGames());
				statement.setString(4, bean.getWins());
				statement.setString(5, bean.getDraw());
				statement.setString(6, bean.getLose());
				statement.setString(7, bean.getGoal());
				statement.setString(8, bean.getPoints());
				statement.setString(9, bean.getGroup());
				statement.setString(10, bean.getLeague());
			}                                              
		});
	}

	@Override
	public List<GroupBean> getGroupsForLeague(String leagueName, String teamName) throws DaoException {
		JdbcTemplate template = new JdbcTemplate(dataSource);
		List<GroupBean> beans = template.query(GET_GROUPS, new Object[] {leagueName, teamName},
				new RowMapper<GroupBean>() {
					@Override
					public GroupBean mapRow(ResultSet rs, int rowNum) throws SQLException {
						GroupBean bean = new GroupBean();
						bean.setPlace(rs.getInt("PLACE"));
						bean.setTeam(rs.getString("TEAM"));
						bean.setGames(rs.getString("GAMES"));
						bean.setWins(rs.getString("WINS"));
						bean.setDraw(rs.getString("DRAW"));
						bean.setLose(rs.getString("LOSE"));
						bean.setGoal(rs.getString("GOALS"));
						bean.setPoints(rs.getString("POINTS"));
						bean.setGroup(rs.getString("GROUP_NAME"));
						bean.setLeague(rs.getString("LEAGUE"));
						return bean;
					}
				});
		return beans;
	}

	@Override
	public void deleteGroups(String leagueName) throws DaoException {
		JdbcTemplate template = new JdbcTemplate(dataSource);
		template.update(DELETE_GROUPS, new Object[] {leagueName});
	}

}
