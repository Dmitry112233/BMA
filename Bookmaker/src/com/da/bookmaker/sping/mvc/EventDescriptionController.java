package com.da.bookmaker.sping.mvc;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.da.bookmaker.bean.BookmakerBean;
import com.da.bookmaker.bean.IventBean;
import com.da.bookmaker.dao.DaoException;
import com.da.bookmaker.dao.DaoFactory;

@Controller
public class EventDescriptionController extends BookmakerController{
	@RequestMapping("/event_description_{id}_details")
	public ModelAndView getMainList(@PathVariable("id") int id) throws DaoException {
		IventBean ivent = getIventById(id);
		ModelAndView modelAndView = new ModelAndView("eventDescriptionPage");
		modelAndView.addAllObjects(getBookmakerList());
		modelAndView.addAllObjects(getBookmakerWeight());
		modelAndView.addObject("ivent", ivent);
		return modelAndView;
	}
	
	private IventBean getIventById(int id) throws DaoException {
		IventBean ivent = DaoFactory.getIventDao().getEventById(id);
	
		return ivent;
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
