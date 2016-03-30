package com.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.support.ByteArrayMultipartFileEditor;
import org.springframework.web.servlet.ModelAndView;










import com.dao.AddItemDao;
import com.dao.AddItemInStockDao;
import com.model.AddItemInStockModel;
import com.model.AddItemModel;

@Controller
public class AddItemInStockController {
	
	@RequestMapping(value="loadStockPage" ,method=RequestMethod.GET)
	public ModelAndView loadStockPage(){
		ModelAndView modelAndView=new ModelAndView("addItemInStock");
		return modelAndView;
	}
	
	@RequestMapping(value="saveItemInStock",method=RequestMethod.POST)
	public ModelAndView saveItemInStock(@ModelAttribute("addItemInStockModel") AddItemInStockModel addItemInStockModel,BindingResult bindingResult) {
		ModelAndView modelAndView = new ModelAndView("addItemInStock");
		AddItemModel addItemModel= new AddItemModel();
		addItemInStockModel.setAddItemModel(addItemModel);
		addItemInStockModel.getAddItemModel().setId(addItemInStockModel.getItemId());
		AddItemInStockDao addItemInStockDao = new AddItemInStockDao();
		String returnValue= addItemInStockDao.save(addItemInStockModel);
		modelAndView.addObject("addItemInStockModel", addItemInStockModel);
		if(returnValue.equalsIgnoreCase("Success"))
			modelAndView.addObject("message", "Entry Successfully Saved");
		else
			modelAndView.addObject("message", "Entry Not Successfully Saved");
		
		return modelAndView;
	}
	
	@InitBinder
	public void initBinder(WebDataBinder dataBinder){
		dataBinder.setDisallowedFields(new String[] {"id"});
		SimpleDateFormat dateFormat=new SimpleDateFormat("dd/MM/yyyy");
		dateFormat.setLenient(false);
		dataBinder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat,true));
		dataBinder.registerCustomEditor(byte[].class, new ByteArrayMultipartFileEditor());
	}
	
	
	@RequestMapping(value="/getItemListOnTheBasisOfItemType/{itemType}")
	public ModelAndView getItemListOnTheBasisOfItemType(
			@PathVariable("itemType") String itemType){
		ModelAndView modelAndView=new ModelAndView("itemNameListBox");
		AddItemInStockDao addItemInStockDao=new AddItemInStockDao();
		List<AddItemModel> addItemModels=addItemInStockDao.getItemListOnTheBasisOfItemType(itemType);
		modelAndView.addObject("addItemModels",addItemModels);
		
		
		return modelAndView;
		
	}
	
	@RequestMapping(value="showItemsInStock")
	public ModelAndView showItemsInStock(){
		ModelAndView modelAndView = null;
		modelAndView = new ModelAndView("showItemInStock");
		AddItemInStockDao addItemInStockDao=new AddItemInStockDao();
		List<AddItemInStockModel> addItemInStockModels=addItemInStockDao.showStockItems();
		
		modelAndView.addObject("addItemInStockModels", addItemInStockModels);
	
		return modelAndView;
	}
	
	@RequestMapping("deleteStockItems/{id}")	
	public ModelAndView deleteItemsInStock(@PathVariable("id") Long id){
			ModelAndView modelAndView= new ModelAndView("showItemInStock");
			AddItemInStockDao addItemInStockDao=new AddItemInStockDao();
			String returnValue=addItemInStockDao.deleteItemsInStock(id);
			if(returnValue.equalsIgnoreCase("success"))
				modelAndView.addObject("deleteMessage","Entry Successfully Deleted");
			else
				modelAndView.addObject("deleteMessage","Entry Not Successfully Deleted");
			List<AddItemInStockModel> addItemInStockModels=addItemInStockDao.showStockItems();
			modelAndView.addObject("addItemInStockModels",addItemInStockModels);
		return modelAndView;
		}
}
