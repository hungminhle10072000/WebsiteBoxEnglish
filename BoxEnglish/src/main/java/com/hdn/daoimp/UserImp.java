package com.hdn.daoimp;

import java.io.File;

import javax.servlet.ServletContext;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.hdn.dao.UserDao;
import com.hdn.daoimp.UserImp;
import com.hdn.entity.CategoryEntity;
import com.hdn.entity.UserEntity;

@Repository
@Transactional
public class UserImp implements UserDao{
	
	@Autowired
	SessionFactory sessionFactory;
	
	@Autowired
	ServletContext context;
	
	@Transactional
	public UserEntity GetUser(Long id) {
		Session session  = sessionFactory.getCurrentSession();
		try {
			UserEntity userEntity = (UserEntity) session.createQuery("from UserEntity where id = " + 1).getSingleResult();
			if(userEntity != null) {
				return userEntity;
			} else {
				return null;
			}
		} catch (Exception e) {
			return null;
		}
	}
	
	@Transactional
	public UserEntity findbyusername_password(String username, String password){
       
		Session session  = sessionFactory.getCurrentSession();
        try {
 
        	UserEntity  userEntity = (UserEntity) session.createQuery("FROM UserEntity U WHERE U.username = :userName").setParameter("userName", username).uniqueResult();

            if (userEntity != null && userEntity.getPassword().equals(password)) {
                return userEntity;
            }else {
				return null;
			}
		} catch (Exception e) {
			return null;
		}
    }

	@Override
	public boolean updatePassWord(UserEntity userUpdate) {
		boolean checkUpdatePassword = false;
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.update(userUpdate);
			checkUpdatePassword = true;
			t.commit();
		} catch (Exception e) {
			t.rollback();
		} finally {
			session.close();
		}
		return checkUpdatePassword;
	}

	@Override
	public UserEntity updateInfoUser(UserEntity user, String fullname, String username, MultipartFile file_image) {
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		try {
			user.setFullname(fullname);
			user.setUsername(username);
			if(file_image != null) {
				String path = context.getRealPath("/") + "resources/img/" + file_image.getOriginalFilename();
				file_image.transferTo(new File(path));
				user.setAvatar(file_image.getOriginalFilename());
			}
			session.update(user);
			t.commit();
		} catch (Exception e) {
			t.rollback();
			return null;
		} finally {
		    session.close();
		}
		return user;
	}

	@Override
	public boolean checkExistUsername(String username) {
		Session session  = sessionFactory.getCurrentSession();
        try {
        	String hql = "FROM UserEntity c WHERE c.username = :username and c.isDelete = 0";
    		Query<UserEntity> query = session.createQuery(hql);
    		query.setParameter("username", username);
    		UserEntity userResult = query.getSingleResult();
            if (userResult != null) {
                return false;
            }else {
				return true;
			}
		} catch (Exception e) {
			return true;
		}
	}
}