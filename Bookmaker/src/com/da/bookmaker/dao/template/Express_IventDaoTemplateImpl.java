package com.da.bookmaker.dao.template;

import javax.sql.DataSource;

import com.da.bookmaker.dao.Express_IventDao;

public class Express_IventDaoTemplateImpl implements Express_IventDao {

	private DataSource dataSource;

	public DataSource getDataSource() {
		return dataSource;
	}

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
}
