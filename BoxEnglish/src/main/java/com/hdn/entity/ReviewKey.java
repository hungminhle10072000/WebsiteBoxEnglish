package com.hdn.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class ReviewKey implements Serializable{
	
	@Column(name = "user_id")
	private long user_id;
	
	
	@Column(name = "vocabulary_id") 
	private long vocabulary_id;
	 
	public long getUser_id() {
		return user_id;
	}

	public void setUser_id(long user_id) {
		this.user_id = user_id;
	}

	
	 public long getVocabulary_id() { return vocabulary_id; }
	  
	 public void setVocabulary_id(long vocabulary_id) { this.vocabulary_id =
	 vocabulary_id; }
	  
	 public ReviewKey(long user_id, long vocabulary_id) { super(); this.user_id =
	 user_id; this.vocabulary_id = vocabulary_id; }
	 

	public ReviewKey() {
		super();
	}
	
	
}
