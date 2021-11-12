package com.hdn.dto;

import com.hdn.entity.UserEntity;

import java.sql.Timestamp;
import java.util.Date;

public class ReviewDto {
    private long user_id;
    private long vocabulary_id;
    private UserDto userDto;
    private VocabularyDto vocabularyDto;
    private Date date_practice;
    private int level;
    private int status;
    private int isDeletel;

    public ReviewDto() {
        this.date_practice =new Timestamp(System.currentTimeMillis());
    }

    public long getUser_id() {
        return user_id;
    }

    public void setUser_id(long user_id) {
        this.user_id = user_id;
    }

    public long getVocabulary_id() {
        return vocabulary_id;
    }

    public void setVocabulary_id(long vocabulary_id) {
        this.vocabulary_id = vocabulary_id;
    }

    public UserDto getUserDto() {
        return userDto;
    }

    public void setUserDto(UserDto userDto) {
        this.userDto = userDto;
    }

    public VocabularyDto getVocabularyDto() {
        return vocabularyDto;
    }

    public void setVocabularyDto(VocabularyDto vocabularyDto) {
        this.vocabularyDto = vocabularyDto;
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
}
