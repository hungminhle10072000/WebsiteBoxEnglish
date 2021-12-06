package com.hdn.daoimp;

import com.hdn.dao.ReviewDao;
import com.hdn.entity.CategoryEntity;
import com.hdn.entity.ReviewEntity;
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
public class ReviewImpl implements ReviewDao {
    @Autowired
    SessionFactory sessionFactory;

    public Integer addReview(ReviewEntity reviewEntity) {
        Session session  = sessionFactory.getCurrentSession();
        try {
            session.save(reviewEntity);
            return 1;
        } catch ( Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
    }
    public Integer updateReview(ReviewEntity reviewEntity) {
        Session session  = sessionFactory.getCurrentSession();
        try {
            session.update(reviewEntity);
            return 1;
        } catch ( Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
    }
    
    
    public ReviewEntity getReviewById(Long id) {
        Session session  = sessionFactory.getCurrentSession();
        try {
            Query query = session.createQuery("from ReviewEntity where id = :id");
            query.setLong("id",id);
            ReviewEntity reviewEntity = (ReviewEntity) query.uniqueResult();
            return reviewEntity;
        } catch ( Exception e) {
            return null;
        }
    }
    public Integer syncLevelByUserIdAndVocabularyId(Long userId, Long vocabularyId,Integer level) {
        Session session  = sessionFactory.getCurrentSession();
        try {
            Query query = session.createQuery("update ReviewEntity R set R.level=:level where R.userEntity.id = :userId and R.vocabularyEntity.id=:vocabularyId");
            query.setParameter("userId",userId);
            query.setParameter("vocabularyId",vocabularyId);
            query.setParameter("level",level);
            int result = query.executeUpdate();
            return result;
        } catch ( Exception e) {
            return -1;
        }
    }
    public List<ReviewEntity> getReviewsByUserIdAndLevel(Long userId, int level) {
        Session session  = sessionFactory.getCurrentSession();
        try {
            Query query = session.createQuery("FROM  ReviewEntity as R where R.userEntity.id=:userId  and R.level =:level and R.isDeletel !=1 Group by R.vocabularyEntity.id");
            query.setParameter("userId",userId);
            query.setParameter("level",level);
            List<ReviewEntity> reviewEntities = query.getResultList();
            return reviewEntities;
        } catch ( Exception e) {
            return null;
        }
    }
    public List<ReviewEntity> getReviewsByUserIdAndStatus(Long userId,int status) {
        Session session  = sessionFactory.getCurrentSession();
        try {
            Query query = session.createQuery("FROM  ReviewEntity as R where R.userEntity.id=:userId  and R.status =:status");
            query.setParameter("userId",userId);
            query.setParameter("status",status);
            List<ReviewEntity> reviewEntities = query.getResultList();
            return reviewEntities;
        } catch ( Exception e) {
            return null;
        }
    }
    // New
    public List<ReviewEntity> getReviewsByUserIdAndVocaID(Long userId,Long vocaId) {
        Session session  = sessionFactory.getCurrentSession();
        try {
            Query query = session.createQuery("FROM  ReviewEntity as R where R.userEntity.id=:userId  and R.vocabularyEntity.id =:vocaId");
            query.setParameter("userId",userId);
            query.setParameter("vocaId",vocaId);
            List<ReviewEntity> reviewEntities = query.getResultList();
            return reviewEntities;
        } catch ( Exception e) {
            return null;
        }
    }
    public List<ReviewEntity> getReviewsByUserIdAndVocaIDAndCateId(Long userId, Long cateId) {
        Session session  = sessionFactory.getCurrentSession();
        try {
            Query query = session.createQuery("FROM  ReviewEntity as R where R.userEntity.id=:userId  and R.vocabularyEntity.categoryEntity.id =:cateId");
            query.setParameter("userId",userId);
            query.setParameter("cateId",cateId);
            List<ReviewEntity> reviewEntities = query.getResultList();
            return reviewEntities;
        } catch ( Exception e) {
            return null;
        }
    }
    public List<ReviewEntity> getReviewsByUserIdAndLevelAndStatus(Long userId, int level, int status) {
        Session session  = sessionFactory.getCurrentSession();
        try {
            Query query = session.createQuery("FROM  ReviewEntity as R where R.userEntity.id=:userId  and R.level =:level and R.isDeletel !=1  and R.status = 3 Group by R.vocabularyEntity.id");
            query.setParameter("userId",userId);
            query.setParameter("level",level);
            List<ReviewEntity> reviewEntities = query.getResultList();
            return reviewEntities;
        } catch ( Exception e) {
            return null;
        }
    }
    //
    public ReviewEntity getReviewEntityLatest(Long userId) {
        Session session  = sessionFactory.getCurrentSession();
        try {
            Query query = session.createQuery("FROM  ReviewEntity as R where R.userEntity.id=:userId  ORDER BY R.date_practice Desc");
            query.setParameter("userId",userId);
            List<ReviewEntity> reviewEntities = query.getResultList();
            return reviewEntities!=null? reviewEntities.get(0):null;
        } catch ( Exception e) {
            return null;
        }
    }
    /*

    @Transactional
    public List<CategoryEntity> findAll() {
        Session session  = sessionFactory.getCurrentSession();
        try {
            Query query = session.createQuery("from CategoryEntity");
            List<CategoryEntity> categoryEntities = query.getResultList();
            return categoryEntities;
        } catch ( Exception e) {
            return null;
        }
    }
    @Override
    public Integer addCategory(CategoryEntity categoryEntity) {
        Session session  = sessionFactory.getCurrentSession();
        try {
            Integer categoryId = (Integer)session.save(categoryEntity);
            return categoryId;
        } catch ( Exception e) {
            return null;
        } finally {
            session.close();
        }
    }*/
}
