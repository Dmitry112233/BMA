package com.da.bookmaker.sping.mvc;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;

import com.da.bookmaker.bean.BookmakerBean;
import com.da.bookmaker.dao.DaoException;
import com.da.bookmaker.dao.DaoFactory;

@Controller
public class BookmakerController {
	
	
	public Map<String, Map<String, BookmakerBean>> getBookmakerList() throws DaoException {
		Map<String, BookmakerBean> bookmakerList = DaoFactory.getBookmakerDao().getAllBookmakers();
		Map<String, Map<String, BookmakerBean>> map = new HashMap<>();
		map.put("bookmakerList", bookmakerList);
		return map;
	}
	
	

}
