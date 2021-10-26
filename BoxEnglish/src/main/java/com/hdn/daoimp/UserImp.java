package com.hdn.daoimp;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.hdn.dao.UserDao;
import com.hdn.daoimp.UserImp;
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
}