package com.hdn.entity;

import java.sql.Timestamp;
import java.util.Date;

import javax.persistence.*;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "REVIEW")
public class ReviewEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;

	@Embedded
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
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "dd/MM/yyyy HH:mm:ss")
	private Date date_practice;
	
	@Column(name = "level", nullable = false)
	private int level;
	
	@Column(name = "status", nullable = false)
	private int status;
	
	@Column(name = "isDelete", nullable = false)
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
