package com.da.bookmaker.sping.mvc;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.da.bookmaker.bean.QuestionBean;
import com.da.bookmaker.dao.DaoException;
import com.da.bookmaker.dao.DaoFactory;

@Controller
public class VideoController extends BookmakerController {
	
//	@RequestMapping("/VideoList")
	public ModelAndView getMainList() throws DaoException {
		Map<String, Object> map = getVideoList();

		map.putAll(getBookmakerList());
		return new ModelAndView("video", map);
	}
	
	private Map<String, Object> getVideoList() throws DaoException{
		List<QuestionBean> videoList = DaoFactory.getQuestionDao().getAllVideos();
		
		Map<String, Object> map = new HashMap<>();
		map.put("videoList", videoList);
		return map;
	} 

}
