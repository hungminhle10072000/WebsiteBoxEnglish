package com.hdn.converter;

import com.hdn.daoimp.UserImp;
import com.hdn.daoimp.VocabularyImpl;
import com.hdn.dto.ReviewDto;
import com.hdn.entity.ReviewEntity;
import com.hdn.entity.ReviewKey;
import com.hdn.entity.VocabularyEntity;
import com.hdn.service.ReviewService;
import com.hdn.service.UserService;
import com.hdn.service.VocabularyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class ReviewConverter {
    @Autowired
    private UserImp userImp;
    @Autowired
    private VocabularyImpl vocabularyImpl;
    @Autowired
    private UserConverter userConverter;
    @Autowired
    private VocabularyConverter vocabularyConverter;

    public ReviewEntity toEntity(ReviewDto reviewDto) {
        ReviewEntity reviewEntity = new ReviewEntity();
        ReviewKey reviewKey = new ReviewKey();
        reviewKey.setUser_id(reviewDto.getUser_id());
        reviewKey.setVocabulary_id(reviewDto.getVocabulary_id());
        reviewEntity.setId(reviewDto.getId());
        reviewEntity.setKey(reviewKey);
        reviewEntity.setUserEntity(userImp.GetUser(reviewDto.getUser_id()));
        VocabularyEntity voca = vocabularyImpl.getVocabulary(reviewDto.getVocabulary_id());
        reviewEntity.setVocabularyEntity(voca);
        reviewEntity.setDate_practice(reviewDto.getDate_practice());
        reviewEntity.setLevel(reviewDto.getLevel());
        reviewEntity.setStatus(reviewDto.getStatus());
        reviewEntity.setIsDeletel(reviewDto.getIsDeletel());
        return reviewEntity;
    }

    public ReviewDto toDto(ReviewEntity reviewEntity) {
        ReviewDto reviewDto = new ReviewDto();
        reviewDto.setId(reviewEntity.getId());
        reviewDto.setUserDto(userConverter.toDto(reviewEntity.getUserEntity()));
        reviewDto.setVocabularyDto(vocabularyConverter.toDto(reviewEntity.getVocabularyEntity()));
        reviewDto.setVocabulary_id(reviewEntity.getVocabularyEntity().getId());
        reviewDto.setDate_practice(reviewEntity.getDate_practice());
        reviewDto.setLevel(reviewEntity.getLevel());
        reviewDto.setStatus(reviewDto.getStatus());
        reviewDto.setIsDeletel(reviewEntity.getIsDeletel());
        return reviewDto;
    }
    public List<ReviewDto> toListDto(List<ReviewEntity> reviewEntities) {
        List<ReviewDto> lstReviewDto = new ArrayList();
        if (reviewEntities != null) {
            for (ReviewEntity t: reviewEntities) {
                ReviewDto reviewDto = toDto(t);
                lstReviewDto.add(reviewDto);
            }
        }
        return lstReviewDto;
    }
}
