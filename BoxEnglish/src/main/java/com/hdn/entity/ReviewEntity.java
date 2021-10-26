package com.hdn.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.Table;

@Entity
@Table(name = "REVIEW")
public class ReviewEntity {
	
	@EmbeddedId
	ReviewKey id;
	
	@ManyToOne
	@MapsId("user_id")
	@JoinColumn(name = "user_id")
	private UserEntity userEntity;
	
	 @ManyToOne
	 @MapsId("vocabulary_id")
	 @JoinColumn(name = "vocabulary_id") 
	 private VocabularyEntity vocabularyEntity;
	 
	@Column(name = "date_practice", nullable = false)
	private Date date_practice;
	
	@Column(name = "level")
	private int level;
	
	@Column(name = "status")
	private int status;

	@Column(name = "isdelete")
	private boolean isDelete;

	public boolean isDelete() {
		return isDelete;
	}

	public void setDelete(boolean delete) {
		isDelete = delete;
	}


	public ReviewKey getId() {
		return id;
	}

	public void setId(ReviewKey id) {
		this.id = id;
	}

	public UserEntity getUserEntity() {
		return userEntity;
	}

	public void setUserEntity(UserEntity userEntity) {
		this.userEntity = userEntity;
	}

	public VocabularyEntity getVocabularyEntity() {
		return vocabularyEntity;
	}

	public void setVocabularyEntity(VocabularyEntity vocabularyEntity) {
		this.vocabularyEntity = vocabularyEntity;
	}

	public Date getDate_practice() {
		return date_practice;
	}

	public void setDate_practice(Date date_practice) {
		this.date_practice = date_practice;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public ReviewEntity(ReviewKey id, UserEntity userEntity, VocabularyEntity vocabularyEntity, Date date_practice,
			int level, int status) {
		super();
		this.id = id;
		this.userEntity = userEntity;
		this.vocabularyEntity = vocabularyEntity;
		this.date_practice = date_practice;
		this.level = level;
		this.status = status;
	}

	public ReviewEntity() {
		super();
	}

	
}
