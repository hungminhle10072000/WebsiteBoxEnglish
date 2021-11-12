package com.hdn.entity;

import java.sql.Timestamp;
import java.util.Date;

import javax.persistence.*;

@Entity
@Table(name = "REVIEW")
public class ReviewEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;

	ReviewKey key;
	
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
	
	@Column(name = "isDelete")
	private int isDeletel;


	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public ReviewKey getKey() {
		return key;
	}

	public void setKey(ReviewKey key) {
		this.key = key;
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

	
	
	public int getIsDeletel() {
		return isDeletel;
	}

	public void setIsDeletel(int isDeletel) {
		this.isDeletel = isDeletel;
	}

	public ReviewEntity() {
		super();
		this.date_practice= new Timestamp(System.currentTimeMillis());
	}
	
	
}
