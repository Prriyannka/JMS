package com.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;
import org.hibernate.transform.Transformers;

import com.model.AddItemInStockModel;
import com.model.AddItemModel;



public class AddItemInStockDao {
	
	SessionFactory sessionFactory = null;
	Session session =null;
	public AddItemInStockDao(){
		sessionFactory = new AnnotationConfiguration().configure().buildSessionFactory();
	}
	
	public String save(AddItemInStockModel addItemInStockModel){
		session = sessionFactory.openSession();
		session.beginTransaction();
		try{
			session.save(addItemInStockModel);
			session.getTransaction().commit();
		}
		catch(Exception e){
			e.printStackTrace();
			if(session!=null){
				session.getTransaction().rollback();
			}
			return "error";
		}
		finally{
			if(session!=null)
				session.close();
			if(sessionFactory!=null)
				sessionFactory.close();
		}
		return "success";
	}
	

	public List<AddItemModel> getItemListOnTheBasisOfItemType(String itemType){
		Query query=null;
		List<AddItemModel> addItemModels=null;
		String queryString="SELECT aim.id AS id,aim.itemName AS itemName "
				+ " FROM AddItemModel aim"+
				" WHERE aim.itemType='"+itemType+"'";
				
		
		session=sessionFactory.openSession();
		try{
		 query=session.createQuery(queryString).
				setResultTransformer(Transformers.aliasToBean(AddItemModel.class));
		addItemModels=query.list();
		
		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally{
			
			if(session!=null)session.close();
		}
		
		return addItemModels;
		
		
	}
	
	public List<AddItemInStockModel> showStockItems(){
		Query query=null;
		List<AddItemInStockModel> addItemInStockModels=null;
		/*String queryString="SELECT sm.id AS id, "
				+ "sm.itemType AS itemType,sm.dateOfPurchase AS dateOfPurchase, sm.vendorName AS vendorName,"
				+ "sm.vendorAddress AS vendorAddress, sm.billNo AS billNo,"
				+ "sm.paidAmount AS paidAmount, sm.remainingAmount AS remainingAmount,"
				+ "sm.itemQuantity AS itemQuantity, sm.itemWeight AS itemWeight,"
				+ "sm.ratePerGram AS ratePerGram, sm.amount AS amount,"
				+ "sm.serviceTax AS serviceTax,sm.vat AS vat,"
				+ "sm.anyOtherAmount As anyOtherAmount, sm.totalAmount AS totalAmount"
				+ " FROM AddItemInStockModel sm";
				*/
		
		session=sessionFactory.openSession();
		try{
		 /*query=session.createQuery(queryString).
				setResultTransformer(Transformers.aliasToBean(AddItemInStockModel.class));
		addItemInStockModels=query.list();*/
			Criteria criteria=session.createCriteria(AddItemInStockModel.class);
			addItemInStockModels=criteria.list();
			
		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally{
			
			if(session!=null)session.close();
		}
		
		return addItemInStockModels;
		
		
	}
		
		

	public String deleteItemsInStock(Long id){
		AddItemInStockModel addItemInStockModel=new AddItemInStockModel();
		addItemInStockModel.setId(id);
		session=sessionFactory.openSession();
		session.beginTransaction();
		try{
		session.delete(addItemInStockModel);
		session.getTransaction().commit();
		
		}
		catch(Exception e){
			e.printStackTrace();
			if(session!=null)
				session.getTransaction().rollback();
			return "Error";
		}
		finally{
			if(session!=null)session.close();
		}
		return "Success";
		
	}
	
	
	
}
