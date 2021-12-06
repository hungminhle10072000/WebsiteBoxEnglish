package com.hdn.daoimp;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.hdn.dao.Cate_User_Dao;
import com.hdn.entity.Cate_User_Entity;
import com.hdn.entity.CategoryEntity;
import com.hdn.entity.UserEntity;

import java.util.List;

@Repository
@Transactional
public class Cate_User_DaoImp implements Cate_User_Dao{
	
	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	public boolean checkCateUser(Long idCourse, UserEntity user) {
		Cate_User_Entity cate_User_Entity = null;
		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM Cate_User_Entity c WHERE c.userEntity.id = :idUser and c.categoryEntity.id = :idCourse";
		Query<Cate_User_Entity> query = session.createQuery(hql);
		query.setParameter("idUser", user.getId());
		query.setParameter("idCourse", idCourse);
		if(query.list().size() > 0) {
			cate_User_Entity = query.getSingleResult();
		}
		if(cate_User_Entity != null) {
			return false;
		}
		return true;
	}

	public List<Cate_User_Entity> findCourseByUserId(Long userId) {

		Session session  = sessionFactory.getCurrentSession();
		try {
			org.hibernate.query.Query query = session.createQuery("from Cate_User_Entity c WHERE c.userEntity.id = :userId");
			query.setParameter("userId", userId);
			List<Cate_User_Entity> cate_user_entities = query.getResultList();
			return cate_user_entities;
		} catch ( Exception e) {
			return null;
		}
	}
	
}
