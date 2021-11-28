package com.hdn.entity;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.Table;

@Entity
@Table(name = "Cate_User")
public class Cate_User_Entity {
	
	@EmbeddedId
	Cate_User_Key id;
	
	@ManyToOne
	@MapsId("user_id")
	@JoinColumn(name = "user_id")
	private UserEntity userEntity;
	
	@ManyToOne
	@MapsId("category_id")
	@JoinColumn(name = "category_id")
	private CategoryEntity categoryEntity;

	public Cate_User_Key getId() {
		return id;
	}

	public void setId(Cate_User_Key id) {
		this.id = id;
	}

	public UserEntity getUserEntity() {
		return userEntity;
	}

	public void setUserEntity(UserEntity userEntity) {
		this.userEntity = userEntity;
	}

	public CategoryEntity getCategoryEntity() {
		return categoryEntity;
	}

	public void setCategoryEntity(CategoryEntity categoryEntity) {
		this.categoryEntity = categoryEntity;
	}

	public Cate_User_Entity() {
		super();
	}

	public Cate_User_Entity(Cate_User_Key id, UserEntity userEntity, CategoryEntity categoryEntity) {
		super();
		this.id = id;
		this.userEntity = userEntity;
		this.categoryEntity = categoryEntity;
	}
	
}
