package com.hdn.daoimp;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


import com.hdn.dao.CourseDao;
import com.hdn.entity.CategoryEntity;

@Repository
@Transactional
public class CourseImp implements CourseDao{
	
	@Autowired
	SessionFactory sessionFactory;

	@Override
	public List<CategoryEntity> findAllCourse() {
		Session session  = sessionFactory.getCurrentSession();
		String hql = "FROM CategoryEntity c WHERE c.isDelete = 0 and c.userEntity.role = 1";
		Query<CategoryEntity> query = session.createQuery(hql);
		List results = query.list();
		return results;
	}
	
}
