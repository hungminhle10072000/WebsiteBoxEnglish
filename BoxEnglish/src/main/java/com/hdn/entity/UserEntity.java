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
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "USER")
public class UserEntity {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	
	@Column(name = "fullname")
	private String fullname;
	
	
	@Column(name = "username")
	private String username;
	
	
	@Column(name = "password")
	private String password;
	
	
	@Column(name = "avatar")
	private String avatar;
	
	@Column(name = "score")
	private int score;
	
	@Column(name = "role")
	private String role;
	
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "userEntity", cascade =CascadeType.ALL) 
	private List<ReviewEntity> listReviewEntities;


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


	public List<ReviewEntity> getListReviewEntities() {
		return listReviewEntities;
	}


	public void setListReviewEntities(List<ReviewEntity> listReviewEntities) {
		this.listReviewEntities = listReviewEntities;
	}


	public UserEntity(long id, String fullname, String username, String password, String avatar, int score, String role,
			List<ReviewEntity> listReviewEntities) {
		super();
		this.id = id;
		this.fullname = fullname;
		this.username = username;
		this.password = password;
		this.avatar = avatar;
		this.score = score;
		this.role = role;
		this.listReviewEntities = listReviewEntities;
	}


	public UserEntity() {
		super();
	}
	 
}