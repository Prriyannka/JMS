package com.dao;

import java.io.InputStream;
import java.sql.Blob;
import java.util.List;

import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;
import org.hibernate.transform.Transformers;
import org.springframework.web.multipart.MultipartFile;

import com.model.AddItemModel;
import com.model.UserRegistrationModel;


public class UserRegistrationDao {
	
	SessionFactory sessionFactory = null;
	Session session =null;
	public UserRegistrationDao(){
		sessionFactory = new AnnotationConfiguration().configure().buildSessionFactory();
	}
	
	public String save(UserRegistrationModel userRegistartionModel){
		session = sessionFactory.openSession();
		session.beginTransaction();
		try{
			
			session.save(userRegistartionModel);
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
	
	public List<UserRegistrationModel> verifyUser(String userName,String password){
		Query query=null;
		List<UserRegistrationModel> userRegistrationModels=null;
		String queryString="SELECT urm.name AS name,urm.email AS email,urm.photo AS photo FROM UserRegistrationModel urm"
				+ " WHERE urm.email='"+userName+"'AND urm.password='"+password+"'";
		
		session=sessionFactory.openSession();
		try{
		 query=session.createQuery(queryString).
				setResultTransformer(Transformers.aliasToBean(UserRegistrationModel.class));
		userRegistrationModels=query.list();
		
		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally{
			
			if(session!=null)session.close();
		}
		
		return userRegistrationModels;
		
		
	}
	
	
	
	
	
	
	
}
