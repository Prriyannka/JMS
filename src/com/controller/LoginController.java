package com.controller;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.support.ByteArrayMultipartFileEditor;
import org.springframework.web.servlet.ModelAndView;






import com.dao.ChangePasswordDao;
import com.dao.UserRegistrationDao;
import com.model.UserRegistrationModel;



@Controller
public class LoginController {

	@RequestMapping("/logIn")
	public ModelAndView logIn(@RequestParam Map<String,String> map,HttpSession session){
		ModelAndView modelAndView = null;
		String userName = map.get("userName");
		String password = map.get("password");
		if(userName.trim().equalsIgnoreCase("")){
			modelAndView = new ModelAndView("login1");
			modelAndView.addObject("message", "Please Enter User Name");
		}
		else if(password.trim().equalsIgnoreCase("")){
			modelAndView = new ModelAndView("login1");
			modelAndView.addObject("message", "Please Enter Password");
		}
		else{
		
		UserRegistrationDao userRegistrationDao=new UserRegistrationDao();
		List<UserRegistrationModel> userRegistrationModels=userRegistrationDao.verifyUser(userName, password);
		if(userRegistrationModels!=null && userRegistrationModels.size()>0)
		{
			
			modelAndView=new ModelAndView("dashboard");
			session.setAttribute("userName",userRegistrationModels.get(0).getName());
			session.setAttribute("email",userRegistrationModels.get(0).getEmail());
			session.setAttribute("password",userRegistrationModels.get(0).getPassword());
			
		}
		else{
			modelAndView = new ModelAndView("login1");
			modelAndView.addObject("message", "Please Enter Correct Username And Password!");
		}}
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
	
	
	@RequestMapping("/userRegistration")
	public ModelAndView userRegistration(){
		ModelAndView modelAndView = new ModelAndView("userRegistration");
		return modelAndView;
	}
	
	
	@RequestMapping(value="/signUp" ,method=RequestMethod.POST)
	public ModelAndView signUp(@ModelAttribute("userRegistration") UserRegistrationModel userRegistrationModel,BindingResult bindingResult
	){
		InputStream inputStream=null;
		byte[] bytes=null;
		
		ModelAndView modelAndView=new ModelAndView("login1");
		UserRegistrationDao userRegistrationDao =new UserRegistrationDao();
		userRegistrationDao.save(userRegistrationModel);
		modelAndView.addObject("registrationSuccess","Your Registration Successfully Done");
		return modelAndView;
	
	}
	
	
	@RequestMapping("/logout")
	public ModelAndView logout(HttpSession session){
		ModelAndView modelAndView=new ModelAndView("login1");
		session.removeAttribute("userName");
		session.removeAttribute("email");
		modelAndView.addObject("message", "You are Successfully Logout");
		return modelAndView;
 	}
	
	/*@RequestMapping("/loadChangePasswordPage")
	public ModelAndView loadChangePasswordPage(@RequestParam("password") String pass,
			@RequestParam("newPassword") String newPassword,@RequestParam("confirmPassword") String confirmPassword,HttpSession session){
		ModelAndView modelAndView=new ModelAndView("changePassword");
		String password=(String) session.getAttribute("password");
		if(pass.equals(password)){
			if(newPassword.equals(confirmPassword)){
				session.setAttribute("password",newPassword);
				ChangePasswordDao changePasswordDao=new ChangePasswordDao();
				String returnValue=changePasswordDao.changePassword(newPassword);
				if(returnValue.equalsIgnoreCase("success"))
					modelAndView.addObject("message","Password Update");
					else
						modelAndView.addObject("message"," Not Updated");
					return modelAndView;
			}
		
			
		}
		else{
			modelAndView = new ModelAndView("changePassword");
			modelAndView.addObject("message", "Please Enter Correct Password!");
		}
		
		
		return modelAndView;
 	}*/
	}
	

