package com.hdn.daoimp;

import java.io.File;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.hdn.dao.UserDao;
import com.hdn.daoimp.UserImp;
import com.hdn.entity.CategoryEntity;
import com.hdn.entity.UserEntity;

@Repository
public class UserImp implements UserDao{
	
	@Autowired
	SessionFactory sessionFactory;
	
	@Transactional
	public UserEntity GetUser(Long id) {
		Session session  = sessionFactory.getCurrentSession();
		try {
			UserEntity userEntity = (UserEntity) session.createQuery("from UserEntity where id = " + 1).getSingleResult();
			if(userEntity != null) {
				return userEntity;
			} else {
				return null;
			}
		} catch (Exception e) {
			return null;
		}
	}
	
	@Transactional
	public UserEntity findbyusername_password(String username, String password){
       
		Session session  = sessionFactory.getCurrentSession();
        try {
 
        	UserEntity  userEntity = (UserEntity) session.createQuery("FROM UserEntity U WHERE U.username = :userName").setParameter("userName", username).uniqueResult();

            if (userEntity != null && userEntity.getPassword().equals(password)) {
                return userEntity;
            }else {
				return null;
			}
		} catch (Exception e) {
			return null;
		}
    }

	@Override
	public boolean updatePassWord(UserEntity userUpdate) {
		boolean checkUpdatePassword = false;
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.update(userUpdate);
			checkUpdatePassword = true;
			t.commit();
		} catch (Exception e) {
			t.rollback();
		} finally {
			session.close();
		}
		return checkUpdatePassword;
	}
}