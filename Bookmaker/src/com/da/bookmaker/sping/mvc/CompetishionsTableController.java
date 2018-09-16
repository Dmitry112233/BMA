package com.da.bookmaker.sping.mvc;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.da.bookmaker.bean.LeagueTableBean;
import com.da.bookmaker.dao.DaoException;
import com.da.bookmaker.dao.DaoFactory;

@Controller
public class CompetishionsTableController extends BookmakerController{

	@RequestMapping("/{league}_Table")
	public ModelAndView getTable(@PathVariable("league") String league) throws DaoException{
		List<LeagueTableBean> table = DaoFactory.getLeaguTableDao().getTableForLeague(league);
		Map<String, Object> map = new HashMap<String, Object>();
		map.putAll(getBookmakerList());
		map.put("table", table);
		return new ModelAndView("leagueTable", map);
	}
}
