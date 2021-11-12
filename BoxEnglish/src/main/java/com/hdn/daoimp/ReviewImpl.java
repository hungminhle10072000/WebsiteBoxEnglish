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

    @Override
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
    @Override
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
