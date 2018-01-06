package com.da.bookmaker.sping.mvc;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.da.bookmaker.bean.BookmakerBean;
import com.da.bookmaker.dao.DaoException;
import com.da.bookmaker.dao.DaoFactory;

@Controller
public class EventController extends BookmakerController{

	private static final String sortedSports[] = {"футбол", "хоккей", "теннис", "баскетбол", ""};
	 
	@RequestMapping("/EventsList.spr")
	public ModelAndView getMainList() throws DaoException {
		Map<String, Object> map = getIventList();
		List<String> sports = getSortedSports(map.keySet());
		map.put("sports", sports);
		//map.putAll(getBookmakerWeight());
		ModelAndView modelAndView = new ModelAndView("allEvents");
		modelAndView.addAllObjects(getBookmakerList());
		modelAndView.addAllObjects(getBookmakerWeight());
		modelAndView.addObject("allEvents", map);
		return modelAndView;
	}
	/**
	 * 
	 * @param sports
	 * @return
	 */
	private List<String> getSortedSports(Set<String> sports) {
		List<String> list = new ArrayList<>(sports);
		Collections.sort(list, new Comparator<String>() {

			@Override
			public int compare(String o1, String o2) {
				int poz1 = 0;
				for (; poz1 < sortedSports.length; poz1++){
					if (o1.trim().equalsIgnoreCase(sortedSports[poz1])){
						break;
					}
				}
				int poz2 = 0;
				for (; poz2 < sortedSports.length; poz2++){
					if (o2.trim().equalsIgnoreCase(sortedSports[poz2])){
						break;
					}
				}
				return poz1 - poz2;
			}
		});
		return list;
	}

	private Map<String, Object> getIventList() throws DaoException {
		Map<String, Object> map = DaoFactory.getIventDao().getEvents();
	
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
