package com.hdn.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class Cate_User_Key implements Serializable{
	
	@Column(name = "user_id", nullable = false)
	private long user_id;
	
	@Column(name = "category_id", nullable = false) 
	private long category_id;

	public long getUser_id() {
		return user_id;
	}

	public void setUser_id(long user_id) {
		this.user_id = user_id;
	}

	public long getCategory_id() {
		return category_id;
	}

	public void setCategory_id(long category_id) {
		this.category_id = category_id;
	}

	public Cate_User_Key(long user_id, long category_id) {
		super();
		this.user_id = user_id;
		this.category_id = category_id;
	}

	public Cate_User_Key() {
		super();
	}
	
	
}
