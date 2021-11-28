package com.hdn.daoimp;

import java.io.File;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


import com.hdn.dao.CourseDao;
import com.hdn.entity.Cate_User_Entity;
import com.hdn.entity.Cate_User_Key;
import com.hdn.entity.CategoryEntity;
import com.hdn.entity.UserEntity;
import com.hdn.entity.VocabularyEntity;

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

	@Override
	public boolean AddCourseUser(Long idCourse, UserEntity userEntity) {
		boolean checkResult = false;
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		try {
			Cate_User_Key cate_User_Key = new Cate_User_Key();
			cate_User_Key.setUser_id(userEntity.getId());
			cate_User_Key.setCategory_id(idCourse);
			Cate_User_Entity cate_User_Entity = new Cate_User_Entity();
			cate_User_Entity.setId(cate_User_Key);
			cate_User_Entity.setUserEntity(userEntity);
			CategoryEntity courseEntity = session.get(CategoryEntity.class, idCourse);
			cate_User_Entity.setCategoryEntity(courseEntity);
			session.save(cate_User_Entity);
			t.commit();
			checkResult = true;
		} catch (Exception e) {
			t.rollback();
		} finally {
		    session.close();
		}
		return checkResult;
	}
	
}
