package com.da.bookmaker.sping.mvc;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.da.bookmaker.bean.LeagueTableBean;
import com.da.bookmaker.dao.DaoException;
import com.da.bookmaker.dao.DaoFactory;

@Controller
public class CompetishionsTableController extends BookmakerController{
	
	private InputStream fis;
	static private Properties property;

	@RequestMapping("/{league}_таблица")
	public ModelAndView getTable(@PathVariable("league") String league) throws DaoException, IOException{
		List<LeagueTableBean> table = DaoFactory.getLeaguTableDao().getTableForLeague(league);
		Map<String, Object> map = new HashMap<String, Object>();
		map.putAll(getBookmakerList());
		map.put("table", table);
		try {
			if (property == null) {
				property = new Properties();
				fis = Thread.currentThread().getContextClassLoader().getResourceAsStream("copies.properties");
				property.load(fis);
			}
			switch (league) {
			case "английская примьер лига":
				map.put("Table_T", property.get("ENG_Table_T"));
				map.put("Table_H1", property.get("ENG_Table_H1"));
				map.put("Table_D", property.get("ENG_Table_D"));
				map.put("Table_Txt", property.get("ENG_Table_Txt"));
				break;
			case "испанская ла лига":
				map.put("Table_T", property.get("SPA_Table_T"));
				map.put("Table_H1", property.get("SPA_Table_H1"));
				map.put("Table_D", property.get("SPA_Table_D"));
				map.put("Table_Txt", property.get("SPA_Table_Txt"));
				break;
			case "российская примьер лига":
				map.put("Table_T", property.get("RUS_Table_T"));
				map.put("Table_H1", property.get("RUS_Table_H1"));
				map.put("Table_D", property.get("RUS_Table_D"));
				map.put("Table_Txt", property.get("RUS_Table_Txt"));
				break;
			case "немецкая бундеслига":
				map.put("Table_T", property.get("GER_Table_T"));
				map.put("Table_H1", property.get("GER_Table_H1"));
				map.put("Table_D", property.get("GER_Table_D"));
				map.put("Table_Txt", property.get("GER_Table_Txt"));
				break;
			case "итальянская серия а":
				map.put("Table_T", property.get("ITA_Table_T"));
				map.put("Table_H1", property.get("ITA_Table_H1"));
				map.put("Table_D", property.get("ITA_Table_D"));
				map.put("Table_Txt", property.get("ITA_Table_Txt"));
				break;
			}
		} catch (IOException e) {
			System.err.println("Файл отсутствует");
		} finally {
			if (fis != null) {
				fis.close();
			}
		}
		return new ModelAndView("leagueTablePage", map);
	}
}
