package com.da.bookmaker.sping.mvc;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.da.bookmaker.bean.BookmakerBean;
import com.da.bookmaker.bean.ExpressBean;
import com.da.bookmaker.dao.DaoException;
import com.da.bookmaker.dao.DaoFactory;

@Controller
public class ExpressDescriptionController extends BookmakerController{
	@RequestMapping("ExpressDescription_{id}_details.spr")
	public ModelAndView getMainList(@PathVariable("id") int id) throws DaoException {
		
		Map<String, Object> map = getExpressById(id);
		map.putAll(getBookmakerList());
		map.putAll(getBookmakerWeight());
		return new ModelAndView("expressDescriptionPage", map);
	}
	
	private Map<String, Object> getExpressById(int id) throws DaoException {
		ExpressBean express = DaoFactory.getExpressDao().getExpressById(id);
		Map<String, Object> map = new HashMap<>();
		map.put("express", express);	
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
