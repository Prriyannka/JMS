package com.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;
import org.hibernate.transform.Transformers;

import com.model.AddItemModel;

public class ShowCaseDao {
	SessionFactory sessionFactory = null;
	Session session =null;
	public ShowCaseDao(){
		sessionFactory = new AnnotationConfiguration().configure().buildSessionFactory();
	}
	public List<AddItemModel> showGolds(){
		Query query=null;
		List<AddItemModel> addItemModels=null;
		String queryString="SELECT aim.id AS id,aim.itemName AS itemName,aim.itemCode AS itemCode, "
				+ "aim.itemType AS itemType FROM AddItemModel aim WHERE aim.itemType='gold'";
				
		
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
	
	public List<AddItemModel> showSilvers(){
		Query query=null;
		List<AddItemModel> addItemModels=null;
		String queryString="SELECT aim.id AS id,aim.itemName AS itemName,aim.itemCode AS itemCode, "
				+ "aim.itemType AS itemType FROM AddItemModel aim WHERE aim.itemType='silver'";
				
		
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
	
	public List<AddItemModel> showArtificials(){
		Query query=null;
		List<AddItemModel> addItemModels=null;
		String queryString="SELECT aim.id AS id,aim.itemName AS itemName,aim.itemCode AS itemCode, "
				+ "aim.itemType AS itemType FROM AddItemModel aim WHERE aim.itemType='artificial'";
				
		
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
}
