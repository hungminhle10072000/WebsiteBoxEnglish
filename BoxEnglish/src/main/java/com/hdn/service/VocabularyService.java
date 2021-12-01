package com.hdn.service;

import com.hdn.converter.VocabularyConverter;
import com.hdn.dao.ReviewDao;
import com.hdn.dao.VocabularyDao;
import com.hdn.daoimp.ReviewImpl;
import com.hdn.daoimp.VocabularyImpl;
import com.hdn.dto.ReviewDto;
import com.hdn.dto.VocabularyDto;
import com.hdn.entity.ReviewEntity;
import com.hdn.entity.VocabularyEntity;
import com.hdn.utils.DateConverter;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.criteria.CriteriaBuilder;

import java.io.File;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class VocabularyService {
    @Autowired
    private VocabularyDao vocabularyDao;

    @Autowired
    private ReviewDao reviewDao;
    @Autowired
    private VocabularyConverter vocabularyConverter;
    
    @Autowired
    private VocabularyImpl vocabularyImpl;

    public List<VocabularyDto> getAllVocabulary() {
        List<VocabularyEntity> vocabularyEntities = vocabularyDao.findAll();
        return vocabularyConverter.toListDto(vocabularyEntities);
    }
    public VocabularyDto getVocabulary(long id) {
        VocabularyEntity voca = vocabularyDao.getVocabulary(id);
        return vocabularyConverter.toDto(voca);
    }
    public List<VocabularyDto> getVocabularyByUserIdAndLevel(long userId, int level) {
        List<ReviewEntity> reviewEntities = reviewDao.getReviewsByUserIdAndLevel(userId,level);
        List<VocabularyDto> lstVoca = new ArrayList<>();
        if (reviewEntities !=null) {
            for (int i=0;i<reviewEntities.size();i++) {
                VocabularyEntity vocabularyEntity = reviewEntities.get(i).getVocabularyEntity();
                VocabularyDto vocabularyDto = vocabularyConverter.toDto(vocabularyEntity);
                lstVoca.add(vocabularyDto);
            }
        }
        return lstVoca;
    }
    public Integer addVocabulary(VocabularyEntity voca) {
        Integer vocaId = vocabularyDao.addVocabulary(voca);
        return vocaId;
    }
    public List<VocabularyDto> getVocabularyForPractice(Long userId, Integer status) {
        LocalDateTime dateNow = DateConverter.convertToLocalDateTimeViaSqlTimestamp(new Timestamp(System.currentTimeMillis()));
        List<ReviewEntity> reviewEntities = reviewDao.getReviewsByUserIdAndStatus(userId,status);
        List<VocabularyDto> vocabularyDtos = new ArrayList<>();
        if (reviewEntities!=null) {
            for (int i=0; i<reviewEntities.size();i++) {
                Date dateTime = reviewEntities.get(i).getDate_practice();
                LocalDateTime datelatest = DateConverter.convertToLocalDateTimeViaSqlTimestamp(dateTime);
                boolean flag = DateConverter.compareDate(datelatest,dateNow);
                if (flag) {
                    VocabularyEntity vocabularyEntity = reviewEntities.get(i).getVocabularyEntity();
                    VocabularyDto vocabularyDto = vocabularyConverter.toDto(vocabularyEntity);
                    vocabularyDto.setReviewId(reviewEntities.get(i).getId());
                    vocabularyDtos.add(vocabularyDto);
                }
            }
        }
        return vocabularyDtos;
    }
    
    public boolean addVocaCourse(VocabularyEntity vocabularyEntity) {
		return vocabularyImpl.addVocaCourse(vocabularyEntity);
	}
    
    public List<VocabularyEntity> findVocaCourse(Long idCourse) {
		return vocabularyImpl.findVocaCourse(idCourse);
	}
    
    public boolean deleteVocaCouse(Long idVoca) {
    	return vocabularyImpl.deleteVocaCouse(idVoca);
    }
    
    public VocabularyEntity getVocaById(Long idVoca) {
    	return vocabularyImpl.getVocabulary(idVoca);
    }
    
    public boolean updateVocaCourse(Long idVoca, VocabularyEntity vocabularyEntity) {
    	return vocabularyImpl.updateVocaCourse(idVoca, vocabularyEntity);
    }
}
