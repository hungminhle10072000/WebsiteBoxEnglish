package com.hdn.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.hdn.daoimp.Userimp;
import com.hdn.entity.UserEntity;

@Repository
public class UserDao implements Userimp{
	
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
