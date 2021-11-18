package com.hdn.daoimp;

import java.io.File;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.hdn.dao.NoteDao;
import com.hdn.entity.CategoryEntity;
import com.hdn.entity.VocabularyEntity;

@Repository
@Transactional
public class NoteImp implements NoteDao{
	
	@Autowired
	SessionFactory sessionFactory;
	
	@Autowired
	ServletContext context;

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
		} finally {
			session.close();
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

	@Override
	public boolean UpdateNote(Long id,CategoryEntity noteEntity) {
		Date date=java.util.Calendar.getInstance().getTime();  
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		try {
			CategoryEntity noteUpdate  = session.get(CategoryEntity.class, id);
			noteUpdate.setCreateDate(date);
			noteUpdate.setTitle(noteEntity.getTitle());
			noteUpdate.setDescription(noteEntity.getDescription());
			if(!noteEntity.getFileImage().isEmpty()) {
				String path = context.getRealPath("/") + "resources/img/" + noteEntity.getFileImage().getOriginalFilename();
				noteEntity.getFileImage().transferTo(new File(path));
				noteUpdate.setImage(noteEntity.getFileImage().getOriginalFilename());
			}
			session.update(noteUpdate);
			t.commit();
			return true;
		} catch (Exception e) {
			t.rollback();
			return false;
		} finally {
			session.close();
		}
	}

	@Override
	public List<VocabularyEntity> getAllNoteDetail(Long idNote) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM VocabularyEntity c WHERE c.categoryEntity.id = :id and c.isDelete = 0";
		Query<CategoryEntity> query = session.createQuery(hql);
		query.setParameter("id", idNote);
		List results = query.list();
		return results;
	}

	@Override
	public VocabularyEntity AddWordNote(VocabularyEntity wordNote) {
		VocabularyEntity result = null;
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		try {
			String path = context.getRealPath("/") + "resources/audio/" + wordNote.getFileAudio().getOriginalFilename();
			wordNote.getFileAudio().transferTo(new File(path));
			wordNote.setAudio_vocabulary(wordNote.getFileAudio().getOriginalFilename());
			wordNote.setExplain_vocabulary(" ");
			wordNote.setExample_vocabulary(" ");
			wordNote.setMean_example_vocabulary(" ");
			wordNote.setIsDelete(0);
			wordNote.setImage_vocabulary(" ");
			Long idWordNote = (Long) session.save(wordNote);
			t.commit();
			result = session.get(VocabularyEntity.class, idWordNote);
			return result;
		} catch (Exception e) {
			t.rollback();
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public boolean deleteWordNote(Long idWord) {
		boolean checkResult = false;
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		VocabularyEntity wordNote = session.get(VocabularyEntity.class, idWord);
		try {
			session.delete(wordNote);
			checkResult = true;
			t.commit();
		} catch (Exception e) {
			t.rollback();
		} finally {
			session.close();
		}
		return checkResult;
	}

}
