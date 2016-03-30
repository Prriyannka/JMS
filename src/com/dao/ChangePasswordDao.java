package com.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;

import com.model.AddItemModel;

public class ChangePasswordDao {
	SessionFactory sessionFactory = null;
	Session session =null;
	public ChangePasswordDao(){
		sessionFactory = new AnnotationConfiguration().configure().buildSessionFactory();
	}
	public String changePassword(){
		session = sessionFactory.openSession();
		session.beginTransaction();
		try{
			
			//session.update(arg0, arg1);
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
