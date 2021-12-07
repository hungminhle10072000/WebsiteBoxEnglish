package com.hdn.daoimp;

import com.hdn.dao.VocabularyDao;
import com.hdn.entity.CategoryEntity;
import com.hdn.entity.VocabularyEntity;
import com.hdn.entity.VocabularyEntity;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import java.io.File;
import java.util.List;

import javax.servlet.ServletContext;

@Repository
@EnableTransactionManagement
@Transactional
public class VocabularyImpl implements VocabularyDao {
	
    @Autowired
    SessionFactory sessionFactory;
    
    @Autowired
	ServletContext context;


    
    
    public VocabularyEntity getVocabulary(Long id) {
        Session session  = sessionFactory.getCurrentSession();
        try {
            Query query = session.createQuery("from VocabularyEntity where id = :id");
            query.setLong("id",id);
            VocabularyEntity vocabularyEntity = (VocabularyEntity) query.uniqueResult();
            return vocabularyEntity;
        } catch ( Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
    }


    
    public List<VocabularyEntity> findAll() {
        Session session  = sessionFactory.getCurrentSession();
        try {
            Query query = session.createQuery("from VocabularyEntity");
            List<VocabularyEntity> vocabularyEntities = query.getResultList();
            return vocabularyEntities;
        } catch ( Exception e) {
            return null;
        }
    }


    public Integer addVocabulary(VocabularyEntity vocabularyEntity) {
        Session session  = sessionFactory.getCurrentSession();
        try {
            Integer vocabularyId = (Integer)session.save(vocabularyEntity);
            return vocabularyId;
        } catch ( Exception e) {
            return null;
        } 
    }



	@Override
	public boolean addVocaCourse(VocabularyEntity vocabularyEntity) {
		boolean checkResult = false;
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		try {
			if(vocabularyEntity.getFileAudio().getSize() > 0) {
				String pathAudio = context.getRealPath("/") + "resources/audio/" + vocabularyEntity.getFileAudio().getOriginalFilename();
				vocabularyEntity.getFileAudio().transferTo(new File(pathAudio));
				vocabularyEntity.setAudio_vocabulary(vocabularyEntity.getFileAudio().getOriginalFilename());
			}
			if(vocabularyEntity.getFileImage().getSize() > 0) {
				String pathImage = context.getRealPath("/") + "resources/img/" + vocabularyEntity.getFileImage().getOriginalFilename();
				vocabularyEntity.getFileImage().transferTo(new File(pathImage));
				vocabularyEntity.setImage_vocabulary(vocabularyEntity.getFileImage().getOriginalFilename());
			}
			vocabularyEntity.setIsDelete(0);
			session.save(vocabularyEntity);
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
	public List<VocabularyEntity> findVocaCourse(Long idCourse) {
		Session session  = sessionFactory.getCurrentSession();
		String hql = "FROM VocabularyEntity c WHERE c.isDelete = 0 and c.categoryEntity.id = :idCourse";
		Query<VocabularyEntity> query = session.createQuery(hql);
		query.setParameter("idCourse", idCourse);
		if(query.list().size() > 0) {
			List results = query.list();
			return results;
		}
		return null;
	}



	@Override
	public boolean deleteVocaCouse(Long idVoca) {
		boolean checkResult = false;
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		try {
			VocabularyEntity vocaDelete = session.get(VocabularyEntity.class, idVoca);
			session.delete(vocaDelete);
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
	public boolean updateVocaCourse(Long idVoca, VocabularyEntity vocabularyEntity) {
		boolean checkResult = false;
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		try {
			VocabularyEntity vocaUpdate = session.get(VocabularyEntity.class, idVoca);
			if(vocabularyEntity.getFileAudio().getSize() > 0) {
				String pathAudio = context.getRealPath("/") + "resources/audio/" + vocabularyEntity.getFileAudio().getOriginalFilename();
				vocabularyEntity.getFileAudio().transferTo(new File(pathAudio));
				vocaUpdate.setAudio_vocabulary(vocabularyEntity.getFileAudio().getOriginalFilename());
			}
			if(vocabularyEntity.getFileImage().getSize() > 0) {
				String pathImage = context.getRealPath("/") + "resources/img/" + vocabularyEntity.getFileImage().getOriginalFilename();
				vocabularyEntity.getFileImage().transferTo(new File(pathImage));
				vocaUpdate.setImage_vocabulary(vocabularyEntity.getFileImage().getOriginalFilename());
			}
			vocaUpdate.setExample_vocabulary(vocabularyEntity.getExample_vocabulary());
			vocaUpdate.setExplain_vocabulary(vocabularyEntity.getExplain_vocabulary());
			vocaUpdate.setMean_example_vocabulary(vocabularyEntity.getMean_example_vocabulary());
			vocaUpdate.setMean_vocabulary(vocabularyEntity.getMean_vocabulary());
			vocaUpdate.setVocabulary(vocabularyEntity.getVocabulary());
			session.update(vocaUpdate);
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
