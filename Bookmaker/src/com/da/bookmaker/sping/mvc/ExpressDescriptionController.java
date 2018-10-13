package com.da.bookmaker.sping.mvc;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.da.bookmaker.bean.BookmakerBean;
import com.da.bookmaker.bean.ExpressBean;
import com.da.bookmaker.dao.DaoException;
import com.da.bookmaker.dao.DaoFactory;

@Controller
public class ExpressDescriptionController extends BookmakerController {
	@RequestMapping("/express_{id}_description")
	public ModelAndView getMainList(@PathVariable("id") int id,
			@RequestParam(value = "currentPage", required = false) String currentPage) throws DaoException {

		int currentPage1 = getCurrentPage(currentPage);
		
		Map<String, Object> map = new HashMap<>();

		ExpressBean express = getExpressById(id);
		if (express == null) {
			throw new ResourceNotFoundException();
		}
		map.put("express", express);
		map.put("offset", getOffset(currentPage1));
		map.putAll(getBookmakerList());
		map.putAll(getBookmakerWeight());
		return new ModelAndView("expressDescriptionPage", map);
	}
	
	// получаем текущу страницу. Два условия при переходе по ссылку и по кнопке с сайта
	private int getCurrentPage(String currentPage){
		if (currentPage == null) {
			return 1;
		}else{
			return Integer.parseInt(currentPage);
		}
	}

	public int getOffset(int currentPage) {
		int offset = (currentPage - 1) * 20;
		return offset;
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
