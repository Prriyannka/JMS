package com.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.dao.AddItemInStockDao;
import com.dao.CustomerSellDao;
import com.model.AddItemInStockModel;
import com.model.AddItemModel;
import com.model.CustomerSellModel;

@Controller
public class CustomerSellController {
	@RequestMapping("/loadCustomerSellPage")
	public ModelAndView loadCustomerSellPage(HttpSession session){
		ModelAndView modelAndView=new ModelAndView("customer");
		if(session!=null)
			session.removeAttribute("customerSellModelList_saved");
		return modelAndView;
		
	}
	@RequestMapping(value="addCustomerSell",method=RequestMethod.POST)
	public ModelAndView addCustomerSell(@ModelAttribute("customerSellModel") CustomerSellModel customerSellModel,
			HttpSession session,BindingResult bindingResult) {
		
		
		ModelAndView modelAndView = new ModelAndView("customer");
		AddItemModel addItemModel= new AddItemModel();
		customerSellModel.setAddItemModel(addItemModel);
		customerSellModel.getAddItemModel().setId(customerSellModel.getItemId());
		
		List<CustomerSellModel> customerSellModelList=null;
		if(session.getAttribute("customerSellModelList_saved")==null)
			customerSellModelList=new ArrayList<CustomerSellModel>();
		else
			customerSellModelList=(List<CustomerSellModel>) session.getAttribute("customerSellModelList_saved");
		CustomerSellDao customerSellDao = new CustomerSellDao();
		CustomerSellModel customerSellModel_saved= customerSellDao.save(customerSellModel);
		
		if(customerSellModel_saved !=null){
			customerSellModelList.add(customerSellModel_saved);
			//modelAndView.addObject("message", "Entry Successfully Saved");
			session.setAttribute("customerSellModelList_saved", customerSellModelList);
			modelAndView.addObject("customerSellModelList_saved",customerSellModelList);
		}
		else{
			//modelAndView.addObject("message", "Entry Not Successfully Saved");
		}
		modelAndView.addObject("customerSellModel",customerSellModel);
		return modelAndView;
	}
	
	@RequestMapping("/deleteCustomerSell/{id}")
	public ModelAndView deleteCustomerSell(
			@ModelAttribute("customerSellModel") CustomerSellModel customerSellModel,
			@PathVariable("id") Long id,
			HttpSession session){
		ModelAndView modelAndView = new ModelAndView("customer");
		customerSellModel.setId(id);
		List<CustomerSellModel> customerSellModelList = null;
		if(session.getAttribute("customerSellModelList_saved")==null)
			customerSellModelList = new ArrayList<CustomerSellModel>();
		else 
			customerSellModelList = (List<CustomerSellModel>) session.getAttribute("customerSellModelList_saved");
		CustomerSellDao customerSellDao = new CustomerSellDao();
		CustomerSellModel customerSellModel_forDelete = customerSellDao.getCustomerItemModel(id) ;
		String returnVal = customerSellDao.deleteCustomerSell(customerSellModel_forDelete);
		if(returnVal.equals("success")){
			CustomerSellModel customerSellModel2 =null;
			for(CustomerSellModel  model :customerSellModelList){
				if(model.getId()==id)
					customerSellModel2=model;
			}
			customerSellModelList.remove(customerSellModel2);
			session.setAttribute("customerSellModelList_saved", customerSellModelList);
			modelAndView.addObject("customerSellModelList_saved", customerSellModelList);
		}
		modelAndView.addObject("customerSellModel", customerSellModel_forDelete);
		return modelAndView;
	}
	
}
