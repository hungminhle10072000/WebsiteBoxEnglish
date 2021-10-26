package com.hdn.entity;

import java.util.List;

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

@Entity
@Table(name = "CATEGORY")
public class CategoryEntity {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	
	@Column(name = "title")
	private String title;
	
	@Column(name = "image")
	private String image;
	
	@Column(name = "description")
	private String description;
	
	@Column(name = "isDelete")
	private int isDelete;

	@OneToOne
	@JoinColumn(name = "user_id")
	private UserEntity userEntity;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "categoryEntity", cascade=CascadeType.ALL) 
	private List<VocabularyEntity> listVocabularyEntities;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public UserEntity getUserEntity() {
		return userEntity;
	}

	public void setUserEntity(UserEntity userEntity) {
		this.userEntity = userEntity;
	}

	public List<VocabularyEntity> getListVocabularyEntities() {
		return listVocabularyEntities;
	}

	public void setListVocabularyEntities(List<VocabularyEntity> listVocabularyEntities) {
		this.listVocabularyEntities = listVocabularyEntities;
	}

	

	public int getIsDelete() {
		return isDelete;
	}

	public void setIsDelete(int isDelete) {
		this.isDelete = isDelete;
	}

	public CategoryEntity() {
		super();
	}
	
	
}
