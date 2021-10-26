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
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "VOCABULARY")
public class VocabularyEntity {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	
	@Column(name = "vocabulary")
	private String vocabulary;
	
	@Column(name = "mean_vocabulary")
	private String mean_vocabulary;
	
	@Column(name = "partOfSpeech")
	private String partOfSpeech;
	
	@Column(name = "explain_vocabulary")
	private String explain_vocabulary;
	
	@Column(name = "example_vocabulary")
	private String example_vocabulary;
	
	@Column(name = "image_vocabulary")
	private String image_vocabulary;
	
	@Column(name = "audio_vocabulary")
	private String audio_vocabulary;

	public boolean isDelete() {
		return isDelete;
	}

	public void setDelete(boolean delete) {
		isDelete = delete;
	}
	@Column(name = "isdelete")
	private boolean isDelete;

	@ManyToOne
	@JoinColumn(name = "category_id")
	private CategoryEntity categoryEntity;

	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "vocabularyEntity", cascade =CascadeType.ALL) 
	private List<ReviewEntity> listReviewEntities;


	public long getId() {
		return id;
	}


	public void setId(long id) {
		this.id = id;
	}


	public String getVocabulary() {
		return vocabulary;
	}


	public void setVocabulary(String vocabulary) {
		this.vocabulary = vocabulary;
	}


	public String getMean_vocabulary() {
		return mean_vocabulary;
	}


	public void setMean_vocabulary(String mean_vocabulary) {
		this.mean_vocabulary = mean_vocabulary;
	}


	public String getPartOfSpeech() {
		return partOfSpeech;
	}


	public void setPartOfSpeech(String partOfSpeech) {
		this.partOfSpeech = partOfSpeech;
	}


	public String getExplain_vocabulary() {
		return explain_vocabulary;
	}


	public void setExplain_vocabulary(String explain_vocabulary) {
		this.explain_vocabulary = explain_vocabulary;
	}


	public String getExample_vocabulary() {
		return example_vocabulary;
	}


	public void setExample_vocabulary(String example_vocabulary) {
		this.example_vocabulary = example_vocabulary;
	}


	public String getImage_vocabulary() {
		return image_vocabulary;
	}


	public void setImage_vocabulary(String image_vocabulary) {
		this.image_vocabulary = image_vocabulary;
	}


	public String getAudio_vocabulary() {
		return audio_vocabulary;
	}


	public void setAudio_vocabulary(String audio_vocabulary) {
		this.audio_vocabulary = audio_vocabulary;
	}


	public CategoryEntity getCategoryEntity() {
		return categoryEntity;
	}


	public void setCategoryEntity(CategoryEntity categoryEntity) {
		this.categoryEntity = categoryEntity;
	}


	public List<ReviewEntity> getListReviewEntities() {
		return listReviewEntities;
	}


	public void setListReviewEntities(List<ReviewEntity> listReviewEntities) {
		this.listReviewEntities = listReviewEntities;
	}


	public VocabularyEntity(long id, String vocabulary, String mean_vocabulary, String partOfSpeech,
			String explain_vocabulary, String example_vocabulary, String image_vocabulary, String audio_vocabulary,
			CategoryEntity categoryEntity, List<ReviewEntity> listReviewEntities) {
		super();
		this.id = id;
		this.vocabulary = vocabulary;
		this.mean_vocabulary = mean_vocabulary;
		this.partOfSpeech = partOfSpeech;
		this.explain_vocabulary = explain_vocabulary;
		this.example_vocabulary = example_vocabulary;
		this.image_vocabulary = image_vocabulary;
		this.audio_vocabulary = audio_vocabulary;
		this.categoryEntity = categoryEntity;
		this.listReviewEntities = listReviewEntities;
	}


	public VocabularyEntity() {
		super();
	}

	
}
