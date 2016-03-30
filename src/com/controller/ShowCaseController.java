package com.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dao.AddItemDao;
import com.dao.ShowCaseDao;
import com.model.AddItemModel;


@Controller
public class ShowCaseController {
	
	
	@RequestMapping(value="showGoldItems")
	public ModelAndView showGold(){
		ModelAndView modelAndView = null;
		modelAndView = new ModelAndView("jewelleryItem");
		ShowCaseDao showCaseDao=new ShowCaseDao();
		List<AddItemModel> addItemModels=showCaseDao.showGolds();
		
		modelAndView.addObject("addItemModels", addItemModels);
	
		return modelAndView;
	}
	
	@RequestMapping(value="showSilverItems")
	public ModelAndView showSilver(){
		ModelAndView modelAndView = null;
		modelAndView = new ModelAndView("jewelleryItem");
		ShowCaseDao showCaseDao=new ShowCaseDao();
		List<AddItemModel> addItemModels=showCaseDao.showSilvers();
		
		modelAndView.addObject("addItemModels", addItemModels);
	
		return modelAndView;
	}
	
	@RequestMapping(value="showArtificialItems")
	public ModelAndView showArtificial(){
		ModelAndView modelAndView = null;
		modelAndView = new ModelAndView("jewelleryItem");
		ShowCaseDao showCaseDao=new ShowCaseDao();
		List<AddItemModel> addItemModels=showCaseDao.showArtificials();
		
		modelAndView.addObject("addItemModels", addItemModels);
	
		return modelAndView;
	}
}
