package com.da.bookmaker.sping.mvc;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.da.bookmaker.bean.BookmakerBean;
import com.da.bookmaker.bean.ExpressBean;
import com.da.bookmaker.dao.DaoException;
import com.da.bookmaker.dao.DaoFactory;

@Controller
public class ExpressController extends BookmakerController{
	
	@RequestMapping("/ExpressesList.spr")
	public ModelAndView getMainList() throws DaoException {
		Map<String, Object> map = getExpressList();
		map.putAll(getBookmakerList());
		map.putAll(getBookmakerWeight());
		return new ModelAndView("allExpresses", map);
	}
	
	private Map<String, Object> getExpressList() throws DaoException {
		List<ExpressBean> expressList = DaoFactory.getExpressDao().getAllExpresses();
		Map<String, Object> map = new HashMap<>();
		map.put("expressList", expressList);
	
		return map;
	}
	
	private Map<String, ArrayList<BookmakerBean>> getBookmakerWeight() throws DaoException {
		Map<String, BookmakerBean> bookmakerList = DaoFactory.getBookmakerDao().getAllBookmakers();
		Map<String, ArrayList<BookmakerBean>> mapWeight = new HashMap<>();
		ArrayList<BookmakerBean> bookmakerWeightList = new ArrayList<>();
		
		for (BookmakerBean bean : bookmakerList.values()){
				for(int i = 0; i <=bean.getWeight() - 1; i++){
					bookmakerWeightList.add(bean);
				}
	   }
		
		mapWeight.put("BookmakerWeightList", bookmakerWeightList);
		
		return mapWeight;
	}
	
}
