package com.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;
import org.hibernate.transform.Transformers;

import com.model.AddItemInStockModel;
import com.model.AddItemModel;
import com.model.CustomerSellModel;

public class CustomerSellDao {
	SessionFactory sessionFactory = null;
	Session session =null;
	public CustomerSellDao(){
		sessionFactory = new AnnotationConfiguration().configure().buildSessionFactory();
	}
	
	public CustomerSellModel save(CustomerSellModel customerSellModel){
		session = sessionFactory.openSession();
		session.beginTransaction();
		try{
			session.save(customerSellModel);
			session.getTransaction().commit();
		}
		catch(Exception e){
			e.printStackTrace();
			if(session!=null){
				session.getTransaction().rollback();
			}
			return null;
		}
		finally{
			if(session!=null)
				session.close();
			if(sessionFactory!=null)
				sessionFactory.close();
		}
		return customerSellModel;
	}
	

	public String deleteCustomerSell(CustomerSellModel customerSellModel){
		session = sessionFactory.openSession();
		session.beginTransaction();
		try{
			session.delete(customerSellModel);
			session.getTransaction().commit();
		}
		catch(Exception e){
			e.printStackTrace();
			if(session!=null)
				session.getTransaction().rollback();
			return "error";
		}
		finally{
			if(session!=null)session.close();
		}
		return "success";
	}
	
	public CustomerSellModel getCustomerItemModel(Long id){
		session = sessionFactory.openSession();
		CustomerSellModel customerSellModel = (CustomerSellModel) session.get(CustomerSellModel.class, id);
		if(session!=null)
			session.close();
		return customerSellModel;
	}
	
	
}
