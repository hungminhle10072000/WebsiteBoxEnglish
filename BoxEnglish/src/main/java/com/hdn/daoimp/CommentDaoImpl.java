package com.hdn.daoimp;

import com.hdn.dao.CommentDao;
import com.hdn.entity.CommentEntity;
import com.hdn.entity.ReviewEntity;
import com.hdn.entity.UserEntity;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
@Transactional
public class CommentDaoImpl implements CommentDao {
    @Autowired
    SessionFactory sessionFactory;
    @Override
    public Long addComment(CommentEntity commentEntity) {
        Session session  = sessionFactory.getCurrentSession();
        try {
            Long commentId = (Long) session.save(commentEntity);
            return commentId;
        } catch ( Exception e) {
            return null;
        }
    }

    @Override
    public List<CommentEntity> getCommentByCategoryId(Long id) {
        Session session  = sessionFactory.getCurrentSession();
        try {
            Query query = session.createQuery("from CommentEntity C where C.cate.id = :id");
            query.setParameter("id",id);
            List<CommentEntity> commentEntities = query.getResultList();
            return commentEntities;
        } catch ( Exception e) {
            return null;
        }
    }
    @Override
    public CommentEntity getById(Long id) {
        Session session  = sessionFactory.getCurrentSession();
        try {
            Query query = session.createQuery("from CommentEntity C where C.id = :id");
            query.setParameter("id",id);
            CommentEntity commentEntity = (CommentEntity) query.uniqueResult();
            return commentEntity;
        } catch ( Exception e) {
            return null;
        }
    }

	@Override
	public List<CommentEntity> getAllComment() {
		Session session  = sessionFactory.getCurrentSession();
        try {
            Query query = session.createQuery("from CommentEntity");
            List<CommentEntity> commentEntities = query.getResultList();
            return commentEntities;
        } catch ( Exception e) {
            return null;
        }
	}

	@Override
	public boolean deleteComment(Long idComment) {
		boolean checkDelete = false;
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		try {
			CommentEntity commentDelete = session.get(CommentEntity.class, idComment);
			session.delete(commentDelete);
			t.commit();
			checkDelete = true;
		} catch (Exception e) {
			t.rollback();
		} finally {
			session.close();
		}
		return checkDelete;
	}
}
