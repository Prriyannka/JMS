package com.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;
import org.hibernate.transform.Transformers;

import com.model.AddItemModel;


public class AddItemDao {
	
	SessionFactory sessionFactory = null;
	Session session =null;
	public AddItemDao(){
		sessionFactory = new AnnotationConfiguration().configure().buildSessionFactory();
	}
	
	public String save(AddItemModel addItemModel){
		session = sessionFactory.openSession();
		session.beginTransaction();
		try{
			session.save(addItemModel);
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
	

	public List<AddItemModel> showItems(){
		Query query=null;
		List<AddItemModel> addItemModels=null;
		String queryString="SELECT aim.id AS id,aim.itemName AS itemName,aim.itemCode AS itemCode, "
				+ "aim.itemType AS itemType FROM AddItemModel aim";
				
		
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
		

	public String deleteItems(Long id){
		AddItemModel addItemModel=new AddItemModel();
		addItemModel.setId(id);
		session=sessionFactory.openSession();
		session.beginTransaction();
		try{
		session.delete(addItemModel);
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
	

	public AddItemModel getItems(Long id){
		AddItemModel addItemModel=null;	
		
		session=sessionFactory.openSession();
		try{
		 addItemModel=(AddItemModel) session.get(AddItemModel.class, id);
		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally{
			if(session!=null)session.close();
		}
		return addItemModel;
	}
	
	public String updateItems(AddItemModel addItemModel){
		session = sessionFactory.openSession();
		session.beginTransaction();
		try{
			
			session.update(addItemModel);
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
			/*if(sessionFactory!=null)
				sessionFactory.close();*/
		}
		return "success";
	}
	

	
}
