package com.hdn.daoimp;

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

	public boolean AddNote(CategoryEntity categoryEntity) {
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		try {
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

}
