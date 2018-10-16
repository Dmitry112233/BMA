package com.da.bookmaker.sping.mvc;

import java.util.ArrayList;
import java.util.HashMap;
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
public class ExpressDescriptionController extends BookmakerController {
	@RequestMapping("/express_{id}_description")
	public ModelAndView getMainList(@PathVariable("id") int id) throws DaoException {

		Map<String, Object> map = new HashMap<>();

		ExpressBean express = getExpressById(id);
		if (express == null) {
			throw new ResourceNotFoundException();
		}
		map.put("express", express);
		map.put("offset", getOffset(id));
		map.putAll(getBookmakerList());
		map.putAll(getBookmakerWeight());
		return new ModelAndView("expressDescriptionPage", map);
	}

	public int getOffset(int id) throws DaoException {
		ArrayList<ExpressBean> list = (ArrayList<ExpressBean>) DaoFactory.getExpressDao().getAllExpresses();
		int offset = 0;
		long newId = id;
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getExpressID() == newId) {
				if (i == 0) {
					offset = 0;
				} else {
					offset = i / 20;
				}
				break;
			}
		}
		return offset * 20;
	}

	private ExpressBean getExpressById(int id) throws DaoException {
		ExpressBean express = DaoFactory.getExpressDao().getExpressById(id);
		return express;
	}

	private Map<String, ArrayList<BookmakerBean>> getBookmakerWeight() throws DaoException {
		Map<String, BookmakerBean> bookmakerList = DaoFactory.getBookmakerDao().getAllBookmakers();
		Map<String, ArrayList<BookmakerBean>> mapWeight = new HashMap<>();
		ArrayList<BookmakerBean> bookmakerWeightList = new ArrayList<>();

		for (BookmakerBean bean : bookmakerList.values()) {
			for (int i = 0; i <= bean.getWeight() - 1; i++) {
				bookmakerWeightList.add(bean);
			}
		}

		mapWeight.put("BookmakerWeightList", bookmakerWeightList);

		return mapWeight;
	}

}
