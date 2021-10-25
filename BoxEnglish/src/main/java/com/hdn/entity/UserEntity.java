package com.hdn.entity;

import javax.annotation.processing.Generated;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
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
}
