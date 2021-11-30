package com.hdn.daoimp;

import java.io.File;
import java.security.SecureRandom;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.hdn.dao.UserDao;
import com.hdn.daoimp.UserImp;
import com.hdn.dto.PaginationResult;
import com.hdn.entity.CategoryEntity;
import com.hdn.entity.UserEntity;
import com.hdn.entity.VocabularyEntity;

import org.hibernate.query.Query;

@Repository
@Transactional
public class UserImp implements UserDao{
	
	@Autowired
	SessionFactory sessionFactory;
	
	@Autowired
	JavaMailSender mailSender;
	
	@Autowired
	ServletContext context;
	
	@Transactional
	public UserEntity GetUser(Long id) {
		Session session  = sessionFactory.getCurrentSession();
		try {
			UserEntity userEntity = (UserEntity) session.createQuery("from UserEntity where id = " + id).getSingleResult();
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

	@Override
	public List<UserEntity> getAllUser() {
		Session session  = sessionFactory.getCurrentSession();
		try {
			String hql = "FROM UserEntity";
    		Query<UserEntity> query = session.createQuery(hql);
			if(query.getResultList() != null) {
				List<UserEntity> result = query.getResultList();
				return result;
			} else {
				return null;
			}
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public boolean deleteUser(Long idUser) {
		boolean checkDeleteUser = false;
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		try {
			UserEntity userDelete = session.get(UserEntity.class, idUser);
			session.delete(userDelete);
			t.commit();
			checkDeleteUser = true;
		} catch (Exception e) {
			t.rollback();
		} finally {
			session.close();
		}
		return checkDeleteUser;
	}

	@Override
	public boolean checkExistEmail(String email) {
		Session session  = sessionFactory.getCurrentSession();
        try {
        	String hql = "FROM UserEntity c WHERE c.email = :email and c.isDelete = 0";
    		Query<UserEntity> query = session.createQuery(hql);
    		query.setParameter("email", email);
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

	@Override
	public boolean addAccount(UserEntity userEntity) {
		boolean checkResult = false;
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		try {
			if(userEntity.getFileAvatar() != null) {
				String path = context.getRealPath("/") + "resources/img/" + userEntity.getFileAvatar().getOriginalFilename();
				userEntity.getFileAvatar().transferTo(new File(path));
				userEntity.setAvatar(userEntity.getFileAvatar().getOriginalFilename());
			}
			userEntity.setIsDelete(0);
			userEntity.setScore(0);
			session.save(userEntity);
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
	public boolean resetPassWord(UserEntity userUpdate) {
		boolean checkResult = false;
		String newPassWord = generateRandomPassword(6);
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		try {
			userUpdate.setPassword(newPassWord);
			session.update(userUpdate);
			t.commit();
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true);
			helper.setFrom("websiteBoxEnglish@gmail.com");
			helper.setTo(userUpdate.getEmail());
			helper.setSubject("Đặt lại mật khẩu");
			helper.setText("Đây là mật khẩu mới của bạn:  " + newPassWord + "  \n. Hãy đăng nhập và thay đổi mật khẩu !", true);
			helper.setReplyTo(userUpdate.getEmail());
			mailSender.send(message);	
			return checkResult = true;
		} catch(Exception ex) {
			return checkResult;
		}
	}
	
	// Method to generate a random alphanumeric password of a specific length
    public static String generateRandomPassword(int len)
    {
        // ASCII range – alphanumeric (0-9, a-z, A-Z)
        final String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
 
        SecureRandom random = new SecureRandom();
        StringBuilder sb = new StringBuilder();
 
        // each iteration of the loop randomly chooses a character from the given
        // ASCII range and appends it to the `StringBuilder` instance
 
        for (int i = 0; i < len; i++)
        {
            int randomIndex = random.nextInt(chars.length());
            sb.append(chars.charAt(randomIndex));
        }
 
        return sb.toString();
    }

	@Override
	public boolean updateAccount(UserEntity userEntity) {
		boolean checkResult = false;
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		try {
			UserEntity userUpdate = session.get(UserEntity.class, userEntity.getId());
			if(userEntity.getFileAvatar().getSize() > 0) {
				String path = context.getRealPath("/") + "resources/img/" + userEntity.getFileAvatar().getOriginalFilename();
				userEntity.getFileAvatar().transferTo(new File(path));
				userUpdate.setAvatar(userEntity.getFileAvatar().getOriginalFilename());
			}
			userUpdate.setFullname(userEntity.getFullname());
			userUpdate.setUsername(userEntity.getUsername());
			userUpdate.setEmail(userEntity.getEmail());
			userUpdate.setRole(userEntity.getRole());
			session.update(userUpdate);
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
	public UserEntity getUserByEmail(String email) {
		Session session  = sessionFactory.getCurrentSession();
        try {
        	String hql = "FROM UserEntity c WHERE c.email = :email and c.isDelete = 0";
    		Query<UserEntity> query = session.createQuery(hql);
    		query.setParameter("email", email);
            if (query.list().size() > 0) {
            	UserEntity userResult = query.getSingleResult();
                return userResult;
            }else {
				return null;
			}
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public UserEntity getuserByUserName(String username) {
		Session session  = sessionFactory.getCurrentSession();
        try {
        	String hql = "FROM UserEntity c WHERE c.username = :username and c.isDelete = 0";
    		Query<UserEntity> query = session.createQuery(hql);
    		query.setParameter("username", username);
            if (query.list().size() > 0) {
            	UserEntity userResult = query.getSingleResult();
                return userResult;
            }else {
				return null;
			}
		} catch (Exception e) {
			return null;
		}
	}
	
	
}