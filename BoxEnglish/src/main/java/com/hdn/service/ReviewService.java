package com.hdn.service;

import com.hdn.cons.Cons;
import com.hdn.converter.ReviewConverter;
import com.hdn.daoimp.ReviewImpl;
import com.hdn.dto.ReviewDto;
import com.hdn.dto.VocabularyDto;
import com.hdn.entity.ReviewEntity;
import com.hdn.utils.DateConverter;
import com.sun.xml.fastinfoset.vocab.Vocabulary;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.Date;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Service
public class ReviewService {

    @Autowired
    private ReviewImpl reviewImpl;
    @Autowired
    private ReviewConverter reviewConverter;

    public Integer addVocaToReview(ReviewDto reviewDto) {
        List<ReviewEntity> reviewEntities = reviewImpl.getReviewsByUserIdAndVocaID(Cons.USER_ID,reviewDto.getVocabulary_id());

        List<ReviewEntity> reviewEntities2 = reviewImpl.getReviewsByUserIdAndLevelAndStatus(Cons.USER_ID,1,3);
        if (reviewEntities != null && reviewEntities.size() > 0) {
            return -1; // Từ này đã tồn tại trong review
        } else if(reviewEntities2 != null && reviewEntities2.size() > 5) {
            return -2; // Hôm nay đã thêm 5 từ rồi.
        } else {
            reviewDto.setUser_id(Cons.USER_ID);
            ReviewEntity reviewEntity = reviewConverter.toEntity(reviewDto);
            reviewEntity.setDate_practice(new Date());
            reviewEntity.setLevel(1);
            reviewEntity.setStatus(3);
            return reviewImpl.addReview(reviewEntity);
        }
    }

    public List<ReviewDto> getReviewsByUserIdAndVocaIDAndCateId(Long userId, Long cateId) {
        List<ReviewEntity> reviewEntities = reviewImpl.getReviewsByUserIdAndVocaIDAndCateId(userId,cateId);
        return reviewConverter.toListDto(reviewEntities);
    }

    public int addReview(ReviewDto reviewDto) {
        reviewDto.setUser_id(Cons.USER_ID);
        ReviewEntity reviewEntity = reviewConverter.toEntity(reviewDto);
        reviewEntity.setDate_practice(new Date());
        return reviewImpl.addReview(reviewEntity);
    }
    public int addReviewList(List<ReviewEntity> reviewEntities) {
        try {
            if (reviewEntities != null) {
                for(int i=0;i<reviewEntities.size();i++) {
                    ReviewEntity reviewEntity =reviewEntities.get(i);
                    ReviewDto reviewDto = reviewConverter.toDto(reviewEntity);
                    ReviewDto reviewDtoNew = new ReviewDto();
                    reviewDtoNew.setUser_id(reviewDto.getUser_id());
                    reviewDtoNew.setStatus(3);
                    reviewDtoNew.setVocabularyDto(reviewDto.getVocabularyDto());
                    reviewDtoNew.setIsDeletel(0);
                    reviewDtoNew.setLevel(reviewDto.getLevel());
                    reviewDtoNew.setVocabulary_id(reviewDto.getVocabulary_id());
                    reviewDtoNew.setUserDto(reviewDto.getUserDto());
                    addReview(reviewDtoNew);
                }
            }
            return 1;
        } catch (Exception e) {
            return -1;
        }
    }
    public int updateReview(ReviewDto reviewDto) {
        ReviewEntity reviewOld = getReviewById(reviewDto.getId());
        reviewOld.setStatus(reviewDto.getStatus());
        reviewOld.setLevel(reviewOld.getLevel()+1);
        reviewImpl.syncLevelByUserIdAndVocabularyId(reviewDto.getUser_id(),reviewDto.getVocabulary_id(),reviewOld.getLevel());
        return reviewImpl.updateReview(reviewOld);
    }

    public boolean isNewDay(Long userId) {
        int dayLatest=0,monthLatest=0,yearLatest=0;
        int dayNow=0,monthNow=0,yearNow=0;
        ReviewEntity reviewEntity= reviewImpl.getReviewEntityLatest(userId);
        Date date = reviewEntity.getDate_practice();
        LocalDateTime datelatest = DateConverter.convertToLocalDateTimeViaSqlTimestamp(date);
        LocalDateTime datenow = LocalDateTime.now();
        dayLatest=datelatest.getDayOfMonth();
        monthLatest=datelatest.getMonthValue();
        yearLatest=datelatest.getYear();

        dayNow=datenow.getDayOfMonth();
        monthNow=datenow.getMonthValue();
        yearNow = datenow.getYear();

        int valueNow = 366*yearNow+12*monthNow+dayNow;
        int valueLatest = 366*yearLatest+12*monthLatest+dayLatest;
        if (valueNow > valueLatest) {
            return true;
        } else {
            return false;
        }
    }

    public ReviewEntity getReviewById(Long id) {
        return reviewImpl.getReviewById(id);
    }
    public List<ReviewEntity> getReviewForPractice(Long userId, int level) {
        List<ReviewEntity> box1 = reviewImpl.getReviewsByUserIdAndLevel(userId,1);
        List<ReviewEntity> box2 = reviewImpl.getReviewsByUserIdAndLevel(userId,2);
        List<ReviewEntity> box3 = reviewImpl.getReviewsByUserIdAndLevel(userId,3);
        List<ReviewEntity> box4 = reviewImpl.getReviewsByUserIdAndLevel(userId,4);
        List<ReviewEntity> box5 = reviewImpl.getReviewsByUserIdAndLevel(userId,5);
        Collections.shuffle(box1);
        Collections.shuffle(box2);
        Collections.shuffle(box3);
        Collections.shuffle(box4);
        Collections.shuffle(box5);

        List<ReviewEntity> box = new ArrayList<>();
        combineList(box,box1);
        combineList(box,box2);
        combineList(box,box3);
        combineList(box,box4);
        combineList(box,box5);
        /*if (isNewDay(Cons.USER_ID)) {
            addReviewList(box);
        }*/
        return box;
    }
    private void combineList(List<ReviewEntity> lstDes, List<ReviewEntity> lstSrc) {
        if (lstSrc!=null) {
            for(int i=0;i<lstSrc.size();i++) {
                if (i==5)
                    break;
                lstDes.add(lstSrc.get(i));
            }
        }
    }
}
