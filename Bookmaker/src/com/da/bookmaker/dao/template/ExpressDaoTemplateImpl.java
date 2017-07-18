package com.da.bookmaker.dao.template;

import javax.sql.DataSource;

import com.da.bookmaker.dao.ExpressDao;

public class ExpressDaoTemplateImpl implements ExpressDao{

	private DataSource dataSource;

	public DataSource getDataSource() {
		return dataSource;
	}

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
}
