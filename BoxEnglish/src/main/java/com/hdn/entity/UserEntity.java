package com.hdn.entity;

import java.util.List;

import javax.annotation.processing.Generated;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.Nationalized;
import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name = "USER")
public class UserEntity {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	
	@Column(name = "fullname", nullable = false)
	@Nationalized 
	private String fullname;

	
	@Column(name = "username", nullable = false) 
	private String username;
	
	
	@Column(name = "password", nullable = false)
	private String password;
	
	
	@Column(name = "avatar")
	@Nationalized
	private String avatar;
	
	@Column(name = "score")
	private int score;
	
	@Column(name = "role", nullable = false)
	@Nationalized 
	private String role;
	
	@Column(name = "isDelete", nullable = false)
	private int isDelete;
	
	@Column(name = "email", nullable = false)
	private String email;
	
	@OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL, mappedBy = "userEntity")
	private List<Cate_User_Entity> cate_User_Entities;

	//Created By Nghia
	@OneToMany(mappedBy="user")
	private List<CommentEntity> commentEntities;

	public List<CommentEntity> getCommentEntities() {
		return commentEntities;
	}

	public void setCommentEntities(List<CommentEntity> commentEntities) {
		this.commentEntities = commentEntities;
	}

	//
	
	@OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL, mappedBy = "userEntity")
	private List<CategoryEntity> categoryEntities;
	
	@Transient
	private MultipartFile fileAvatar;
	
	public MultipartFile getFileAvatar() {
		return fileAvatar;
	}

	public void setFileAvatar(MultipartFile fileAvatar) {
		this.fileAvatar = fileAvatar;
	}

	public List<CategoryEntity> getCategoryEntities() {
		return categoryEntities;
	}

	public void setCategoryEntities(List<CategoryEntity> categoryEntities) {
		this.categoryEntities = categoryEntities;
	}

	public List<Cate_User_Entity> getCate_User_Entities() {
		return cate_User_Entities;
	}

	public void setCate_User_Entities(List<Cate_User_Entity> cate_User_Entities) {
		this.cate_User_Entities = cate_User_Entities;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	
	public int getIsDelete() {
		return isDelete;
	}

	public void setIsDelete(int isDelete) {
		this.isDelete = isDelete;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public UserEntity() {
		super();
	}
	
	
}
