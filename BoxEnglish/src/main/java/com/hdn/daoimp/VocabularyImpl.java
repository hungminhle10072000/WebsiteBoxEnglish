package com.hdn.daoimp;

import com.hdn.dao.VocabularyDao;
import com.hdn.entity.VocabularyEntity;
import com.hdn.entity.VocabularyEntity;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
@EnableTransactionManagement
@Transactional
public class VocabularyImpl implements VocabularyDao {
    @Autowired
    SessionFactory sessionFactory;
    @Override
    public VocabularyEntity getVocabulary(Long id) {
        Session session  = sessionFactory.getCurrentSession();
        try {
            Query query = session.createQuery("from VocabularyEntity where id = :id");
            query.setLong("id",id);
            VocabularyEntity vocabularyEntity = (VocabularyEntity) query.uniqueResult();
            return vocabularyEntity;
        } catch ( Exception e) {
            return null;
        } finally {
            session.close();
        }
    }

    @Override
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

    @Override
    public Integer addVocabulary(VocabularyEntity vocabularyEntity) {
        Session session  = sessionFactory.getCurrentSession();
        try {
            Integer vocabularyId = (Integer)session.save(vocabularyEntity);
            return vocabularyId;
        } catch ( Exception e) {
            return null;
        } finally {
            session.close();
        }
    }
}
