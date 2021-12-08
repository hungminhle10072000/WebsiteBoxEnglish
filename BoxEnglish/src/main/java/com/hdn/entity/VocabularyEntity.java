package com.hdn.entity;

import java.util.ArrayList;
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
import javax.persistence.Transient;

import org.hibernate.annotations.Nationalized;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "VOCABULARY")
public class VocabularyEntity {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	
	@Column(name = "vocabulary", nullable = false)
	private String vocabulary;
	
	@Column(name = "mean_vocabulary", nullable = false)
	@Nationalized
	private String mean_vocabulary;
	
	@Column(name = "partOfSpeech")
	private String partOfSpeech;
	
	@Column(name = "explain_vocabulary", nullable = false)
	@Nationalized 
	private String explain_vocabulary;
	
	@Column(name = "example_vocabulary", nullable = false)
	private String example_vocabulary;
	
	@Column(name="mean_example_vocabulary", nullable = false)
	@Nationalized 
	private String mean_example_vocabulary;
	
	@Column(name = "image_vocabulary", nullable = false)
	private String image_vocabulary;
	
	@Column(name = "audio_vocabulary", nullable = false)
	private String audio_vocabulary;
	
	@Transient
	private MultipartFile fileAudio;
	
	@Transient
	private MultipartFile fileImage;
	
	@Column(name = "isDelete", nullable = false)
	private int isDelete;
	
	@ManyToOne
	@JoinColumn(name = "category_id", nullable = false)
	private CategoryEntity categoryEntity;

	
	public MultipartFile getFileImage() {
		return fileImage;
	}


	public void setFileImage(MultipartFile fileImage) {
		this.fileImage = fileImage;
	}


	public String getMean_example_vocabulary() {
		return mean_example_vocabulary;
	}


	public void setMean_example_vocabulary(String mean_example_vocabulary) {
		this.mean_example_vocabulary = mean_example_vocabulary;
	}
	
	
	public MultipartFile getFileAudio() {
		return fileAudio;
	}


	public void setFileAudio(MultipartFile fileAudio) {
		this.fileAudio = fileAudio;
	}

	@JsonIgnore
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

	public int getIsDelete() {
		return isDelete;
	}

	public void setIsDelete(int isDelete) {
		this.isDelete = isDelete;
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



	public VocabularyEntity() {
		super();
	}

}
