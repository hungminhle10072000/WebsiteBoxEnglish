package com.hdn.daoimp;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.hdn.dao.NoteDao;
import com.hdn.entity.CategoryEntity;

@Repository
@Transactional
public class NoteImp implements NoteDao{
	
	@Autowired
	SessionFactory sessionFactory;

	@Override
	public boolean AddNote(CategoryEntity categoryEntity) {
		Date date=java.util.Calendar.getInstance().getTime();  
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		try {
			categoryEntity.setCreateDate(date);
			session.save(categoryEntity);
			t.commit();
		} catch (Exception e) {
			t.rollback();
			return false;
		} finally {
			session.close();
		}
		return true;
	}

	@Override
	public List<CategoryEntity> getAllNote(Long idUser) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM CategoryEntity c WHERE c.userEntity.id = :id and c.isDelete = 0 ORDER BY c.createDate DESC";
		Query<CategoryEntity> query = session.createQuery(hql);
		query.setParameter("id", idUser);
		List results = query.list();
		return results;
	}

	@Override
	public boolean deleteNote(Long id) {
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		CategoryEntity noteDelte = session.get(CategoryEntity.class, id);
		try {
			session.delete(noteDelte);
			t.commit();
			return true;
		} catch (Exception e) {
			t.rollback();
			return false;
		}
	}

	@Override
	public CategoryEntity getNoteById(Long idNote) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM CategoryEntity c WHERE c.id = :id and c.isDelete = 0";
		Query<CategoryEntity> query = session.createQuery(hql);
		query.setParameter("id", idNote);
		CategoryEntity noteResult = query.getSingleResult();
		return noteResult;
	}

}
