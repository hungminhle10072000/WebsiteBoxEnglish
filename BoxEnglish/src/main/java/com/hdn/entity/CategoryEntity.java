package com.hdn.entity;

import java.util.Date;
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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name = "CATEGORY")
public class CategoryEntity {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	
	@Column(name = "title", nullable = false)
	private String title;
	
	@Column(name = "image", nullable = false)
	private String image;
	
	@Column(name = "description", nullable = false)
	private String description;
	
	@Column(name = "isDelete", nullable = false)
	private int isDelete;
	
	@Column(name = "createDate")
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	private Date createDate;

	@OneToOne
	@JoinColumn(name = "user_id", nullable = false)
	private UserEntity userEntity;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "categoryEntity", cascade=CascadeType.ALL) 
	private List<VocabularyEntity> listVocabularyEntities;
	
	
	@Transient
	private MultipartFile fileImage;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "categoryEntity", cascade=CascadeType.ALL) 
	private List<Cate_User_Entity> cate_User_Entities;


	//Created By Nghia
	@OneToMany(mappedBy="cate", cascade=CascadeType.ALL)
	private List<CommentEntity> commentEntities;

	public List<CommentEntity> getCommentEntities() {
		return commentEntities;
	}

	public void setCommentEntities(List<CommentEntity> commentEntities) {
		this.commentEntities = commentEntities;
	}

	//


	public List<Cate_User_Entity> getCate_User_Entities() {
		return cate_User_Entities;
	}

	public void setCate_User_Entities(List<Cate_User_Entity> cate_User_Entities) {
		this.cate_User_Entities = cate_User_Entities;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public MultipartFile getFileImage() {
		return fileImage;
	}

	public void setFileImage(MultipartFile fileImage) {
		this.fileImage = fileImage;
	}

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
