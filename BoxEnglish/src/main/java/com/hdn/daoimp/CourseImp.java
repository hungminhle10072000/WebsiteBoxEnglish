package com.hdn.daoimp;

import java.io.File;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;

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
	
	@Autowired
	ServletContext context;

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

	@Override
	public boolean deleteCourse(Long idCourse) {
		boolean checkResult = false;
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		try {
			CategoryEntity courseDelete = session.get(CategoryEntity.class, idCourse);
			session.delete(courseDelete);
			t.commit();
			checkResult = true;
		} catch (Exception e) {
			t.rollback();
		} finally {
			session.close();
		}
		return checkResult;
	}

	@Override
	public boolean addCourse(UserEntity userEntity, CategoryEntity courseEntity) {
		boolean checkResult = false;
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		Date date=java.util.Calendar.getInstance().getTime();  
		try {
			courseEntity.setDescription("");
			courseEntity.setIsDelete(0);
			courseEntity.setUserEntity(userEntity);
			courseEntity.setCreateDate(date);
			if(courseEntity.getFileImage().getSize() > 0) {
				String path = context.getRealPath("/") + "resources/img/" + courseEntity.getFileImage().getOriginalFilename();
				courseEntity.getFileImage().transferTo(new File(path));
				courseEntity.setImage(courseEntity.getFileImage().getOriginalFilename());
			}
			session.save(courseEntity);
			t.commit();
			checkResult = true;
		} catch (Exception e) {
			t.rollback();
		} finally {
			session.close();
		}
		return checkResult;
	}

	@Override
	public CategoryEntity findCourseById(Long idCourse) {
		CategoryEntity results = null;
		Session session  = sessionFactory.getCurrentSession();
		String hql = "FROM CategoryEntity c WHERE c.isDelete = 0 and c.id = :idCourse";
		Query<CategoryEntity> query = session.createQuery(hql);
		query.setParameter("idCourse", idCourse);
		if(query.list().size() > 0) {
			results = query.getSingleResult();
		}
		return results;
	}

	@Override
	public boolean updateCourse(CategoryEntity courseEntity) {
		boolean checkResult = false;
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();  
		try {
			CategoryEntity courseUpdate = session.get(CategoryEntity.class, courseEntity.getId());
			if(courseEntity.getFileImage().getSize() > 0) {
				String path = context.getRealPath("/") + "resources/img/" + courseEntity.getFileImage().getOriginalFilename();
				courseEntity.getFileImage().transferTo(new File(path));
				courseUpdate.setImage(courseEntity.getFileImage().getOriginalFilename());
			}
			courseUpdate.setUserEntity(courseEntity.getUserEntity());
			courseUpdate.setTitle(courseEntity.getTitle());;
			session.update(courseUpdate);
			t.commit();
			checkResult = true;
		} catch (Exception e) {
			System.out.println(e);
			t.rollback();
		} finally {
			session.close();
		}
		return checkResult;
	}
	
}
